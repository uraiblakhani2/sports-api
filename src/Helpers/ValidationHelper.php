<?php

namespace Vanier\Api\helpers;

use Vanier\Api\Helpers\Validator;
use Vanier\Api\Helpers\Input;

class ValidationHelper
{





    public function validateCountries($data)
    {

        $rules = array(
            'country_name' => array(
                array('lengthMin', 3),
                array('lengthMax', 100)
            ),
            'capital_name' => array(
                array('lengthMin', 3),
                array('lengthMax', 100)
            ),

            'continent_name' => array(
                array('lengthMin', 3),
            ),

            'language' => array(
                array('lengthMin', 3),
                array('lengthMax', 100)
            ),

            'currency_name' => array(
                array('lengthMin', 3),
                array('lengthMax', 100)
            ),


        );

        $validator = new Validator($data);
        // Important: map the validation rules before calling validate()
        $validator->mapFieldsRules($rules);
        if ($validator->validate()) {
            return "valid";
        } else {
            return $validator->errorsToJson();
        }
    }






    public function validateSports($data)
    {

        $rules = array(
            'sport_name' => array(
                array('lengthMin', 3),
                array('lengthMax', 100)
            ),
            'sport_type' => array(
                array('lengthMin', 3),
                array('lengthMax', 100)
            ),


        );

        $validator = new Validator($data);
        // Important: map the validation rules before calling validate()
        $validator->mapFieldsRules($rules);
        if ($validator->validate()) {
            return "valid";
        } else {
            return $validator->errorsToJson();
        }
    }



    public function validateSportsInsert($data)
    {

        $rules = array(

            'sport_name' => array(
                "required",
                array('lengthMin', 3),
                array('lengthMax', 100)
            ),

            'sport_type' => array(
                "required",
                array('lengthMin', 3),
                array('lengthMax', 100)
            ),


        );

        $validator = new Validator($data);
        // Important: map the validation rules before calling validate()
        $validator->mapFieldsRules($rules);
        if ($validator->validate()) {
            return "valid";
        } else {
            return $validator->errorsToJson();
        }
    }

    public function validatePlayers($data)
    {

        $rules = array(
            'age' => array(
                'integer',

                ['min', 5],
                ['max', 60],



            ),
            'height' => array(
                'integer',
                ['min', 30],
                ['max', 110],
            ),

            'player_number' => array(
                'integer'
            ),


            'weight' => array(
                'integer',
                ['min', 50],
                ['max', 400],
            ),

            'player_name' => array(
                array('lengthMin', 3),
                array('lengthMax', 100)
            ),


            'status' => array(
                array('lengthMin', 3),
                array('lengthMax', 20)
            ),


            'nbMatchPlayed' => array(
                'integer',
                ['min', 0],
            ),


        );

        $validator = new Validator($data);
        // Important: map the validation rules before calling validate()
        $validator->mapFieldsRules($rules);
        if ($validator->validate()) {
            return "valid";
        } else {
            return $validator->errorsToJson();
        }
    }



    public function validatePlayersInsert($data)
    {

        $rules = array(
            'player_id' => array(
                'integer'
            ),

            'age' => array(
                'integer',

                ['min', 5],
                ['max', 60],

            ),
            'country_id' => array(
                'required',
                'integer'
            ),
            'team_id' => array(
                'required',
                'integer'
            ),
            'height' => array(
                'integer',
                ['min', 30],
                ['max', 110],
            ),

            'player_number' => array(
                'integer'
            ),


            'weight' => array(
                'integer',
                ['min', 50],
                ['max', 400],
            ),

            'player_name' => array(
                array('lengthMin', 3),
                array('lengthMax', 100)
            ),


            'status' => array(
                array('lengthMin', 3),
                array('lengthMax', 20)
            ),


            'nbMatchPlayed' => array(
                'integer',
                ['min', 0],
            ),


        );

        $validator = new Validator($data);
        // Important: map the validation rules before calling validate()
        $validator->mapFieldsRules($rules);
        if ($validator->validate()) {
            return "valid";
        } else {
            return $validator->errorsToJson();
        }
    }




    public function validateTeams($data)
    {

        $rules = array(
            'team_name' => array(
                array('lengthMin', 3),
                array('lengthMax', 100)



            ),
            'manager_name' => array(
                array('lengthMin', 3),
                array('lengthMax', 100)

            ),

            'ceo_name' => array(
                array('lengthMin', 3),
                array('lengthMax', 100)
            ),


            'team_sponsor' => array(
                array('lengthMin', 3),
                array('lengthMax', 100)
            ),

            'team_court_name' => array(
                array('lengthMin', 3),
                array('lengthMax', 100)
            ),


            'team_color' => array(
                array('lengthMin', 3),
                array('lengthMax', 100)
            ),


            'team_sponsor' => array(
                array('lengthMin', 3),
                array('lengthMax', 100)
            ),

            'team_coach' => array(
                array('lengthMin', 3),
                array('lengthMax', 100)
            ),


        );

        $validator = new Validator($data);
        // Important: map the validation rules before calling validate()
        $validator->mapFieldsRules($rules);
        if ($validator->validate()) {
            return "valid";
        } else {
            return $validator->errorsToJson();
        }
    }


    public function validateTeamsInsert($data)
    {

        $rules = array(

            'country_id' => array(
                'required',
                'integer'
            ),

            'team_id' => array(
                'integer'
            ),

            'team_name' => array(
                "required",
                array('lengthMin', 3),
                array('lengthMax', 100)



            ),
            'manager_name' => array(
                array('lengthMin', 3),
                array('lengthMax', 100)

            ),

            'ceo_name' => array(
                array('lengthMin', 3),
                array('lengthMax', 100)
            ),


            'team_sponsor' => array(
                array('lengthMin', 3),
                array('lengthMax', 100)
            ),

            'team_court_name' => array(
                array('lengthMin', 3),
                array('lengthMax', 100)
            ),


            'team_color' => array(
                array('lengthMin', 3),
                array('lengthMax', 100)
            ),



            'team_coach' => array(
                array('lengthMin', 3),
                array('lengthMax', 100)
            ),


        );

        $validator = new Validator($data);
        // Important: map the validation rules before calling validate()
        $validator->mapFieldsRules($rules);
        if ($validator->validate()) {
            return "valid";
        } else {
            return $validator->errorsToJson();
        }
    }



    public function validateMatches($data)
    {

        $rules = array(
            'home_score' => array(
                'integer',

                ['min', 0],
            ),

            'away_score' => array(
                'integer',

                ['min', 0],
            ),

            'match_date' => array(
                ['dateFormat', 'Y-m-d'],
            ),

            'stadium_name' => array(
                array('lengthMin', 3),
                array('lengthMax', 100)
            ),


        );

        $validator = new Validator($data);
        // Important: map the validation rules before calling validate()
        $validator->mapFieldsRules($rules);
        if ($validator->validate()) {
            return "valid";
        } else {
            return $validator->errorsToJson();
        }
    }

    public function validateLeagues($data)
    {

        $rules = array(
            'start_date' => array(
                ['dateFormat', 'Y-m-d']
            ),

            'end_date' => array(
                ['dateFormat', 'Y-m-d']
            ),

            'nbOfTeams' => array(
                'integer',

                ['min', 3],
            ),

            'organization' => array(
                array('lengthMin', 3),
                array('lengthMax', 100)
            ),


            'league_name' => array(
                array('lengthMin', 3),
                array('lengthMax', 100)
            ),




        );

        $validator = new Validator($data);
        // Important: map the validation rules before calling validate()
        $validator->mapFieldsRules($rules);
        if ($validator->validate()) {
            return "valid";
        } else {
            return $validator->errorsToJson();
        }
    }





    public function validateRanking($data)
    {
        $rules = array(
            'games_won' => array(
                'integer',

                ['min', 1],
            ),

            'games_lost' => array(
                'integer',

                ['min', 1],
            ),
        );

        $validator = new Validator($data);
        // Important: map the validation rules before calling validate()
        $validator->mapFieldsRules($rules);
        if ($validator->validate()) {
            return "valid";
        } else {
            return $validator->errorsToJson();
        }
    }


    public function validateCurrency($data)
    {
        $rules = array(
            'from' => array(
                'required',
                array('lengthMin', 3),
                array('lengthMax', 4)
            ),

            'to' => array(
                'required',
                array('lengthMin', 3),
                array('lengthMax', 4)
            ),

            'amount' => array(
                'required',
                'integer',
            ),
        );

        $validator = new Validator($data);
        // Important: map the validation rules before calling validate()
        $validator->mapFieldsRules($rules);
        if ($validator->validate()) {
            //return "valid";
            return true;
        } else {
            return $validator->errorsToJson();
        }
    }

}