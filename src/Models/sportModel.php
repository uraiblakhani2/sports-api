<?php

namespace Vanier\Api\Models;

class sportsModel extends BaseModel
{


    private $table_name = "sport";


    public function __construct()
    {
        parent::__construct();
    }

    //Route: POST /sports

    public function getAll(array $filters = [])
    {
        //return "not found";
        $filters_value = [];

        $sql = "SELECT * FROM sport";

        return $this->run($sql)->fetchAll();
    }

}
