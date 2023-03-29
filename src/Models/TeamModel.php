<?php

namespace Vanier\Api\Models;

class TeamModel extends BaseModel
{


    private $table_name = "team";


    public function __construct()
    {
        parent::__construct();
    }

    //Route: POST /team
    
    public function getAll(array $filters = [])
    {
        //return "not found";
        $filters_value = [];

        $sql = "SELECT * FROM team";

        return $this->run($sql)->fetchAll();
    }

}
