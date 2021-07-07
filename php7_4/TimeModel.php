<?php
class TimeModel
{
    public function __construct($format)
    {
      echo($format);
      echo("\n");
        $this->format = addslashes($format);
        echo($this->format);

        [ $d, $h, $m, $s ] = [ rand(1, 6), rand(1, 23), rand(1, 59), rand(1, 69) ];
        $this->prediction = "+${d} day +${h} hour +${m} minute +${s} second";
    }

    function greeting () {
        echo("Greeting variable");
    }

    public function getTime()
    {
        echo($this->format);
        echo("\n");
        eval('$time = date("' . $this->format . '", strtotime("' . $this->prediction . '")); echo($time);');
        return isset($time) ? $time : 'Something went terribly wrong';
    }
}

