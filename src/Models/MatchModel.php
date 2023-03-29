<?php

namespace Vanier\Api\Models;

class MatchModel extends BaseModel
{


    private $table_name = "match";


    public function __construct()
    {
        parent::__construct();
    }

    //Route: POST /matches

    public function getAll(array $filters = [])
    {
        //return "not found";
        $filters_value = [];

        $sql = "SELECT * FROM match";

        return $this->run($sql)->fetchAll();
    }

}
