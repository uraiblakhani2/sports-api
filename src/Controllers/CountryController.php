<?php

namespace Vanier\Api\Controllers;

use Psr\Http\Message\ResponseInterface as Response;
use Psr\Http\Message\ServerRequestInterface as Request;
use Vanier\Api\Controllers\BaseController;
use Vanier\Api\helpers\ValidationHelper;
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
        $this->validator = new ValidationHelper();
    }



    public function getAllCountries(Request $request, Response $response)
    {

        $filters = $request->getQueryParams();
        $validation = $this->validator->validateCountries($filters);
        if ($validation == "valid") {
            $data = $this->country_model->getAll($filters);
            return $this->prepareOkResponse($response, $data);
        } else {
            return $this->notFoundResponse($response, $validation, 400);
        }
    }


    //create 1 or more country
    public function countrycreator(Request $request, Response $response)
    {
        $data = $request->getParsedBody();

        if (is_array($data)) {
            foreach ($data as $key => $country) {

                $data = $this->country_model->createCountry($country);


                $res_message = ['country created'];

                $json_data = json_encode($country);

                $response->getBody()->write($json_data);
            }
        }
        return $response->withStatus(201)->withHeader("Content-Type", "application/json");
    }



    //update sport
    public function countryUpdate(Request $request, Response $response)
    {
        $data = $request->getParsedBody();

        if (is_array($data)) {
            foreach ($data as $key => $country) {

                $data = $this->country_model->updateCountry($country);
                $res_message = ['Sports updated'];

                $json_data = json_encode($country);

                $response->getBody()->write($json_data);
            }
        }
        return $response->withStatus(201)->withHeader("Content-Type", "application/json");
    }
}