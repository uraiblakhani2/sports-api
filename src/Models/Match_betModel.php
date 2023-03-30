<?php

namespace Vanier\Api\Models;

class Match_betModel extends BaseModel
{


    private $table_name = "match";


    public function __construct()
    {
        parent::__construct();
    }

    //Route: POST /matches_bet

    public function getAll(array $filters = [])
    {
        //return "not found";
        $filters_value = [];

        $sql = "SELECT * FROM match";

        return $this->run($sql)->fetchAll();
    }

    /*
    filters to return: 
        bet_mamount
        return_amount
    */
}
