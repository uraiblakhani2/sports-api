<?php
namespace Vanier\Api\Exceptions;
use Slim\Exception\HttpSpecializedException;


class HttpNotFoundException extends HttpSpecializedException
{
        /**
     * @var int
     */
    protected $code = 404;

    /**
     * @var string
     */
    protected $message = 'Not found.';

    protected $title = '404 Not Found';
    protected $description = 'the server cannot find the requested resource';

}