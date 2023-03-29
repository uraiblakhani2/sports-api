<?php

namespace Vanier\Api\Models;

class CountryModel extends BaseModel
{

    private $table_name = "country";


    public function __construct()
    {
        parent::__construct();
    }

    //Route: POST /matches_bet

    public function getAll(array $filters = [])
    {
        //return "not found";
        $filters_value = [];

        $sql = "SELECT * FROM country";

        return $this->run($sql)->fetchAll();
    }

}
