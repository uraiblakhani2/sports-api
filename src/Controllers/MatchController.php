<?php

namespace Vanier\Api\Controllers;

use Psr\Http\Message\ResponseInterface as Response;
use Psr\Http\Message\ServerRequestInterface as Request;
use Vanier\Api\Controllers\BaseController;
use Vanier\Api\helpers\ValidationHelper;
use Vanier\Api\Models\MatchModel;

class MatchController extends BaseController
{


    private $match_model = null;
    private $validator = null;

    /**
     * Summary of __construct
     */
    public function __construct()
    {
        $this->match_model = new MatchModel();
        $this->validator = new ValidationHelper();
    }


    public function getAllMatchs(Request $request, Response $response)
    {

        $filters = $request->getQueryParams();
        $validation = $this->validator->validateMatchesFilters($filters);
        if ($validation == "valid") {
            $data = $this->match_model->getAll($filters);
            return $this->prepareOkResponse($response, $data);
        } else {
            return $this->notFoundResponse($response, $validation, 400);
        }
    }


    //create 1 or more match
    public function matchcreator(Request $request, Response $response)
    {
        $data = $request->getParsedBody();

        if (is_array($data)) {
            foreach ($data as $key => $match) {

                $data = $this->match_model->createMatch($match);


                $res_message = ['Player matchd'];

                $json_data = json_encode($match);

                $response->getBody()->write($json_data);
            }
        }
        return $response->withStatus(201)->withHeader("Content-Type", "application/json");
    }

}