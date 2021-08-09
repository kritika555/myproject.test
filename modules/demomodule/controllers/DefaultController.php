<?php
/**
 * Demo module for Craft CMS 3.x
 *
 * this is demo 
 *
 * @link      kritika.me
 * @copyright Copyright (c) 2021 kritika
 */
namespace modules\demomodule\controllers;

use modules\demomodule\DemoModule;
use yii\web\Response;
use craft\web\View;
use craft\web\UrlManager;
use Craft;
use craft\web\Controller;

/**
 * Default Controller
 *
 *
 * 
 *
 * @author    kritika
 * @package   DemoModule
 * @since     1.0.0
 */
class DefaultController extends Controller
{
    // Protected Properties
    // =========================================================================

    /**
     * @var    bool|array Allows anonymous access to this controller's actions.
     *         The actions must be in 'kebab-case'
     * @access protected
     */
    protected $allowAnonymous = ['index', 'task'];

    // Public Methods
    // =========================================================================

    /**
     * Handle a request going to our module's index action URL,
     * e.g.: actions/demo-module/default
     *
     * @return mixed
     */
    public function actionIndex()
    {
        $result = 'Welcome to the DefaultController actionIndex() method';
        return $result;
    }

    /**
     * Handle a request going to our module's actionDoSomething URL,
     * e.g.: actions/demo-module/default/do-something
     *
     * @return mixed
     */
    public function actionTask() 
    {         
        $GLOBALS['API_KEY'] = "Yl6erkvrwHtcMLdWjDt1mc5G1NqtxP1iihESD4xAPqOkddc-KicBXCs5qBk2p8WSRQ2Ef-IIcZIqgcH8bp0Ob2h6SXQOo4bOkPk-qO0HW1TRLoSOGdZMtrh4ls4MYXYx";        
        
        $GLOBALS['API_HOST'] = "https://api.yelp.com";
        $GLOBALS['SEARCH_PATH'] = "/v3/businesses/search";
        $BUSINESS_PATH = "/v3/businesses/";  
        
        $DEFAULT_TERM = "dinner";
        $DEFAULT_LOCATION = "Melbourne,CBD";
        $GLOBALS['SEARCH_LIMIT'] = 20;
        
        $result = $this->search($DEFAULT_TERM,$DEFAULT_LOCATION);
        $data = json_decode($result,true);
        
        if(isset($data['businesses'])) {
            $business_list = $data['businesses'];
            return Craft::$app->getView()->renderTemplate(
            'default',
            array('data'=>$business_list)        
        );
        }else {
            $error = array('error'=>'Something went wrong in the YELP API.');
            return Craft::$app->getView()->renderTemplate(
            'error',
            array('data'=>$error)        
        );
        }      
        
    }

    function request($host, $path, $url_params = array()) {
    // Send Yelp API Call
    try {
        $curl = curl_init();
        if (FALSE === $curl)
            echo 'Failed to initialize';

        $url = $host . $path . "?" . http_build_query($url_params);
        curl_setopt_array($curl, array(
            CURLOPT_URL => $url,
            CURLOPT_RETURNTRANSFER => true,  // Capture response.
            CURLOPT_ENCODING => "",  
            CURLOPT_MAXREDIRS => 10,
            CURLOPT_TIMEOUT => 30,
            CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
            CURLOPT_CUSTOMREQUEST => "GET",
            CURLOPT_HTTPHEADER => array(
                "authorization: Bearer " . $GLOBALS['API_KEY'],
                "cache-control: no-cache",
            ),
        ));

        $response = curl_exec($curl);
        $http_status = 0;
        if (FALSE === $response){
            //throw new Exception(curl_error($curl), curl_errno($curl)); 
                   
            $http_status = curl_getinfo($curl, CURLINFO_HTTP_CODE);
        }
        if (200 != $http_status)
           //throw new Exception($response, $http_status);

        curl_close($curl);
    } catch(Exception $e) {
        trigger_error(sprintf(
            'Curl failed with error #%d: %s',
            $e->getCode(), $e->getMessage()),
            E_USER_ERROR);
    }

    return $response;
}

/**
 * Query the Search API by a search term and location 
 * 
 * @param    $term        The search term passed to the API 
 * @param    $location    The search location passed to the API 
 * @return   The JSON response from the request 
 */
function search($term, $location) {
    $url_params = array();    
    $url_params['term'] = $term;
    $url_params['location'] = $location;
    $url_params['limit'] = $GLOBALS['SEARCH_LIMIT'];
    
    return $this->request($GLOBALS['API_HOST'], $GLOBALS['SEARCH_PATH'], $url_params);
}
}
