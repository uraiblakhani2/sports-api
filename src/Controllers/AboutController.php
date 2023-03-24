<?php

namespace Vanier\Api\Controllers;

use Psr\Http\Message\ResponseInterface as Response;
use Psr\Http\Message\ServerRequestInterface as Request;
use Vanier\Api\Helpers\Validator;

class AboutController extends BaseController
{
    public function handleAboutApi(Request $request, Response $response, array $uri_args)
    {
        $data = array(
            'about' => 'Welcome to sports-api, this is a sports Web service that provides data regarding sports',
            'resources' => ''

        );

        return $this->prepareOkResponse($response, $data);
    }
}
