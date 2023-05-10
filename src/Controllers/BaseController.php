<?php

namespace Vanier\Api\Controllers;

use Psr\Http\Message\ResponseInterface as Response;
use Psr\Http\Message\ServerRequestInterface as Request;
use Vanier\Api\helpers\AppLoggerHelper;
use Vanier\Api\Models\WSLoggingModel;

class BaseController
{
    //App logger
    protected function logMessage(string $message){
        $app_logger = new AppLoggerHelper();
        $app_logger->getAppLogger()->info("Hello, from the base controller");


    }

    protected function prepareOkResponse(Response $response, array $data, int $status_code = 200)
    {
        // var_dump($data);
        $json_data = json_encode($data);
        //-- Write data into the response's body.
        $response->getBody()->write($json_data);
        return $response->withStatus($status_code)->withAddedHeader(HEADERS_CONTENT_TYPE, APP_MEDIA_TYPE_JSON);
    }

    protected function notFoundResponse(Response $response, $data, $status=400)
    {
        $response->getBody()->write($data);
        return $response->withStatus($status)->withHeader("Content-Type", "application/json");
    }

}
