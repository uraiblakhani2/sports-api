<?php

namespace Vanier\Api\Models;

class SportsModel extends BaseModel
{


    private $table_name = "team";


    public function __construct()
    {
        parent::__construct();
    }

    //Route: POST /actors
    
    public function getAll(array $filters = [])
    {
        //return "not found";
        $filters_value = [];

        $sql = "SELECT * FROM team";

        return $this->run($sql)->fetchAll();
    }

}
