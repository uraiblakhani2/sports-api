<?php

namespace Vanier\Api\Controllers;

use Psr\Http\Message\ResponseInterface as Response;
use Psr\Http\Message\ServerRequestInterface as Request;
use Slim\Exception\HttpBadRequestException;
use Vanier\Api\Controllers\BaseController;
use Vanier\Api\Exceptions\HttpNotFoundException;
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

        if ((is_array($data)) && (!empty($data) )) {
            foreach ($data as $key => $country) {
                $validate = $this->validator->validateCountriesInsert($country);
                if ($validate == "valid") {
                    $this->country_model->createCountry($country);
                    $res_message = ['country has been created sucessfully'];
                    return $this->prepareOkResponse($response, $res_message);
                } else {

                    return $this->notFoundResponse($response, $validate, 422);

                }
            }
        }
        else{

            throw new HttpBadRequestException($request, "Body data cannot be empty");

        }
    }




    public function countryUpdate(Request $request, Response $response)
    {
        $data = $request->getParsedBody();

        if ((is_array($data)) && (!empty($data) )) {
            foreach ($data as $country) {
                $existing_country = $this->country_model->getCountryById($country['country_id']);
                if ($existing_country) {
                    unset($country["country_id"]);
                    $validate = $this->validator->validateCountries($country);
                    if ($validate == "valid") {
                        $this->country_model->updateCountry($country, $existing_country["country_id"]);

                    } else {

                        return $this->notFoundResponse($response, $validate, 422);
                    }


                } else {

                    throw new HttpNotFoundException($request);

                }
            }
        }
        else{
            throw new HttpBadRequestException($request, "Body data cannot be empty");
        }

        $res_message = ['Data has been updated sucessfully!'];
        return $this->prepareOkResponse($response, $res_message);
    }
}