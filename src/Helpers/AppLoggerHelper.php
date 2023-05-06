<?php

namespace Vanier\Api\helpers;

use Monolog\Logger;
use Monolog\Handler\StreamHandler;

class AppLoggerHelper
{
    private static $logger = null;
    private static $db_logger = null;


    public function __construct()
    {
       $this->initLoggers();
    }

    public function initLoggers()
    {
        $this->logger = new Logger("access-log");
        $this->logger->setTimezone(new \DateTimeZone('America/Toronto'));
        $log_handler = new StreamHandler(APP_LOG_DIR, Logger::DEBUG);
        $this->logger->pushHandler($log_handler);
        $db_logger = new Logger("database_logs");
        $db_logger->setTimezone(new \DateTimeZone('America/Toronto'));
        $db_logger->pushHandler($log_handler);

    }

    public function getAppLogger()
    {
        return $this->logger;
    }
}
