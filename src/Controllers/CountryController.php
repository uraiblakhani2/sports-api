<?php

namespace Vanier\Api\Controllers;

use Psr\Http\Message\ResponseInterface as Response;
use Psr\Http\Message\ServerRequestInterface as Request;
use Vanier\Api\Controllers\BaseController;
use Vanier\Api\Models\CountryModel;

class CountryController extends BaseController
{

    private $country_model = null;
    private $validator = null;

    /**
     * Summary of __construct
     */
    public function __construct()
    {
        $this->country_model = new CountryModel();
    }


    public function getAllCountries(Request $request, Response $response)
    {

        $filters = $request->getQueryParams();
        $data = $this->country_model->getAll($filters);

        $json_data = json_encode($data);

        $response->getBody()->write($json_data);

        return $response->withStatus(201)->withHeader("Content-Type", "application/json");
    }

}