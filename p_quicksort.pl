#!/usr/bin/perl

$n = 0;
while ($n <= 99)
{
srand;
$int = int(rand(1000)) + 1;
$r_n[$n] = $int;
$n += 1;
}
print"\nThe 100 random numbers is:\n@r_n.\n\n";
sub q_s{
    my ($ls,$r,$l) = @_;
    my ($tmp,$i,$j);
    $i = $r;
    $j = $l;
    $tmp = $$ls[int(($i + $j) / 2)];
    while (1){
              while ($$ls[$i] < $tmp){$i ++ ;}
              while ($$ls[$j] > $tmp){$j -- ;}
              if ($i < $j){
                          @$ls[$i,$j] = @$ls[$j,$i];
                          $i ++ ;
                          $j -- ;
                          }  
              else {last;}
             }
    if($r < $i - 1){  
    &q_s(\@$ls,$r,$i - 1)
    }
    if($j + 1 < $l){
    &q_s(\@$ls,$j + 1,$l)
    }
    return @$ls;
}
$num = $#r_n;
my @sorted = &q_s(\@r_n,0,$num);
print"The order of the 100 random number is:\n@sorted.\n\n";
