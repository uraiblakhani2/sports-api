<?php

namespace Vanier\Api\Controllers;

use Psr\Http\Message\ResponseInterface as Response;
use Vanier\Api\Models\WSLoggingModel;
use LogicException;
use Monolog\Handler\StreamHandler;
use Monolog\Logger;
use Psr\Http\Server\MiddlewareInterface;
use Psr\Http\Message\ServerRequestInterface as Request;
use Psr\Http\Server\RequestHandlerInterface as RequestHandler;
use Psr\Http\Message\ResponseInterface;
use Slim\Exception\HttpForbiddenException;
use Slim\Exception\HttpUnauthorizedException;
use UnexpectedValueException;

class BaseController
{
    // //App logger
    // protected function logMessage(Request $request){
    //     $app_logger = new AppLoggerHelper();
    //     $app_logger->getAppLogger()->info("Hello, from the base controller");


    // }
    public function logErrors(Response $response)
    {
        $logger = new Logger("test-log");
        $logger_handler = new StreamHandler(APP_LOG_DIR, Logger::DEBUG);
        $logger->pushHandler($logger_handler);
        $db_logger = new Logger("database_logs");
        $db_logger->pushHandler($logger_handler);
        $error_message = $response->getBody();
        $logger->info($error_message);
    }


    protected function prepareOkResponse(Response $response, array $data, int $status_code = 200)
    {
        // var_dump($data);
        $json_data = json_encode($data);
        //-- Write data into the response's body.
        $response->getBody()->write($json_data);
        return $response->withStatus($status_code)->withAddedHeader(HEADERS_CONTENT_TYPE, APP_MEDIA_TYPE_JSON);
    }

    protected function notFoundResponse(Response $response, $data, $status = 400)
    {
        $response->getBody()->write($data);
        $this->logErrors($response);
        return $response->withStatus($status)->withHeader("Content-Type", "application/json");
    }

}