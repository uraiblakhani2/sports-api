<?php


namespace Vanier\Api\helpers;

use Exception;
use GuzzleHttp\Client as Guzzle;
use GuzzleHttp\Client;

class WebServiceInvoker
{
    private array $request_options = [];

    public function __construct(array $options = [])
    {
        $this->request_options = $options;
    }


    public function invokeUri(string $resource_uri)
    {

        $client = new Client();
        $response = $client->request(
            'GET',
            $resource_uri, $this->request_options
        );


        if ($response->getStatusCode() !== 200) {
            throw new Exception("Something went wrong!" . $response->getStatusCode() . '' . $response->getReasonPhrase());
        }

        if (!str_contains($response->getHeaderLine('Content-Type'), "application/json")) {

            throw new Exception('Unprocessable document: JSON data required' . $response->getReasonPhrase());

        }

        $data = $response->getBody()->getContents();
        return $data;
    }
}