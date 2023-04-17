<?php

namespace Vanier\Api\Models;
use Vanier\Api\Models\BaseModel;


class TeamModel extends BaseModel
{


    private $table_name = "team";


    public function __construct()
    {
        parent::__construct();
    }

    public function getAll(array $filters = [])
    {
        $filters_value = [];

        $sql = "SELECT * FROM team WHERE 1";

        if(isset($filters["team_name"])){
            $sql .= " AND team_name like :team_name";
            $filters_value[":team_name"] = $filters["team_name"] . "%";
        }

        if(isset($filters["manager_name"])){
            $sql .= " AND manager_name like :manager_name";
            $filters_value[":manager_name"] = $filters["manager_name"] . "%";
        }

        if(isset($filters["ceo_name"])){
            $sql .= " AND ceo_name like :ceo_name";
            $filters_value[":ceo_name"] = $filters["ceo_name"] . "%";
        }

        if(isset($filters["team_sponsor"])){
            $sql .= " AND team_sponsor like :team_sponsor";
            $filters_value[":team_sponsor"] = $filters["team_sponsor"] . "%";
        }

        if(isset($filters["team_court_name"])){
            $sql .= " AND team_court_name like :team_court_name";
            $filters_value[":team_court_name"] = $filters["team_court_name"] . "%";
        }

        if(isset($filters["team_color"])){
            $sql .= " AND team_color like :team_color";
            $filters_value[":team_color"] = $filters["team_color"] . "%";
        }
        if(isset($filters["team_sponser"])){
            $sql .= " AND team_sponser like :team_sponser";
            $filters_value[":team_sponser"] = $filters["team_sponser"] . "%";
        }

        if(isset($filters["team_coach"])){
            $sql .= " AND team_coach like :team_coach";
            $filters_value[":team_coach"] = $filters["team_coach"] . "%";
        }


        if ((isset($filters['page']) &&  isset($filters['page_size']))) {
            $this->setPaginationOptions($filters["page"], $filters["page_size"]);
            return $this->Paginate($sql, $filters_value);
        }

        return $this->run($sql, $filters_value)->fetchAll();

    }

    //CREATING A NEW Team
    public function createTeam(array $Team)
    {
        //pick some of the contained elements and use them in the insert statement
        $this->insert($this->table_name, $Team);
    }

    /*
    filters to return:
        coach
    */
}
