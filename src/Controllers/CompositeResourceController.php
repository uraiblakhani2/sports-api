<?php

namespace Vanier\Api\Controllers;

use GuzzleHttp\Client;
use Vanier\Api\helpers\WebServiceInvoker;

class CompositeResourceController extends WebServiceInvoker
{

    public function getScoreFromCricApi(): array
    {
        $uri = "https://api.cricapi.com/v1/currentMatches?apikey=6daa1d22-dbd8-46d2-aa56-5a073ed55015&offset=0";
        $data = $this->invokeUri($uri);
        $scores = json_decode($data);

        $refined_score = [];
        $index = 0;

        foreach ($scores->data as $key => $score) {
            $refined_score[$index]['name'] = $score->name;
            $refined_score[$index]['status'] = $score->status;
            $refined_score[$index]['venue'] = $score->venue;
            $refined_score[$index]['date'] = $score->date;

            if (isset($score->score) && is_array($score->score)) {
                $refined_score[$index]['score'] = [];
                foreach ($score->score as $s) {
                    $refined_score[$index]['score'][] = [
                        'r' => $s->r,
                        'w' => $s->w,
                        'o' => $s->o,
                        'inning' => $s->inning
                    ];
                }
            }


            $index++;
        }
        return $refined_score;
    }


    public function fetchLeaguesByCountry(string $sport, string $country): array
    {
        $uri = "https://www.thesportsdb.com/api/v1/json/3/search_all_teams.php?s=" . $sport . $country;
        $data = $this->invokeUri($uri);
        $leagues = json_decode($data);

        $refind_leagues = [];
        $index = 0;

        foreach ($leagues->data as $key => $league) {
            var_dump($league); exit;
            $refined_teams[$index]['strTeam'] = $league->strTeam;
            $refined_teams[$index]['intFormedYear'] = $league->intFormedYear;
            $refined_teams[$index]['strSport'] = $league->strSport;
            $refined_teams[$index]['strLeague'] = $league->strLeague;
            $refined_teams[$index]['strDescriptionEN'] = $league->strDescriptionEN;
            $refined_teams[$index]['strCountry'] = $league->strCountry;

            $index++;
        }


        return $refind_leagues;
    }



}