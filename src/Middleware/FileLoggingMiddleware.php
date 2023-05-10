<?php

namespace Vanier\Api\Middleware;

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

use Vanier\Api\Helpers\JWTManager;
use Vanier\Api\Models\WSLoggingModel;

class FileLoggingMiddleware implements MiddlewareInterface
{

    public function __construct(array $options = [])
    {
    }
    public function process(Request $request, RequestHandler $handler): ResponseInterface
    {
        $logger = new Logger("test-log");
        $logger_handler = new StreamHandler(APP_LOG_DIR, Logger::DEBUG);
        $logger->pushHandler($logger_handler);
        $db_logger = new Logger("database_logs");
        $db_logger->pushHandler($logger_handler);
        $params = $request->getQueryParams();
        $logger->info("Access ".$request->getMethod(). ' '.$request->getUri()->getPath(), $params);
        return $handler->handle($request);
    }


}
