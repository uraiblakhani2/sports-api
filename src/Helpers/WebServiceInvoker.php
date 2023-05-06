<?php

namespace Vanier\Api\helpers;

use Exception;
use GuzzleHttp\Client;

class WebServiceInvoker
{
    private $_request_options=[];

    public function __construct(array $options=[])
    {
        $this->_request_options=$options;
    }

    public function InvokeUrl(string $resource_uri)
    {
        $client = new Client();
        $response = $client->request('GET', $resource_uri, $this->_request_options);

        if($response->getStatusCode() !==200){
            throw new Exception('Noppe, some wrong'.$response->getStatusCode().$response->getReasonPhrase());
        }

        if(str_contains($response->getHeader('Content-type')[0], 'application/json')){
            throw new Exception('the data was not recived'.$response->getReasonPhrase());
        }

        $data=$response->getBody()->getContents();

        return $data;
    }
}