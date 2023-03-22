<?php

namespace Vanier\Api\Middleware;

use Fig\Http\Message\StatusCodeInterface as HttpCode;
use Psr\Http\Message\ResponseInterface;
use Psr\Http\Server\MiddlewareInterface;

use Psr\Http\Message\ServerRequestInterface as Request;
use Psr\Http\Server\RequestHandlerInterface as RequestHandler;
use Slim\Exception\HttpMethodNotAllowedException;
use Slim\Exception\HttpNotFoundException;
use Vanier\Api\Exceptions\HttpNotAcceptableException;

class ContentNegotationMiddleware implements MiddlewareInterface
{




    public function process(Request $request,  RequestHandler $handler): ResponseInterface
    {

        //Step 1) Inspect the request header.
        //Get the accept header
        $accept = $request->getHeaderLine("Accept");

        // var_dump($accept);exit;
        //Step 2) compare the requested resource representation format with what the service can provide
        if (!str_contains($accept, APP_MEDIA_TYPE_JSON)) {
            //if it does not match refuse the processing request AND notify the client application; Raise an exception
            // echo "Invalid accept header";
           // throw new HttpNotAcceptableException($request);

            $error_data = array(
                //Could have written the code directly
                'code' => HttpCode::STATUS_NOT_ACCEPTABLE,
                'error' => 'Not Acceptable',
                'description' => 'the server cannot produce a response matching the list of acceptable values defined in the requests proactive content negotiation headers.'
            );

            //response fully qualified object
            $response = new \Slim\Psr7\Response();

            //Converting the error array to json and writing it to the body of the response
            $response->getBody()->write(json_encode($error_data));


            return $response->withStatus(406)->withHeader("Content-Type", "application/json");
        }


        //echo "Hello Hello"; exit;

        $response = $handler->handle($request);
        return $response;
    }
}
