#!/usr/bin/perl

$n = 0;
while ($n <= 99)
	{
	srand;
	$int = int(rand(1000)) + 1;
	$r_n[$n] = $int;
	$n += 1;
	}
print"The 100 random numbers is:\n @r_n.\n\n\n";

$l = 99;
while ($l >= 0)
	{
	srand;
	$m = int(rand($l + 1));
	$a = $r_n[$m];
	for ($i = 0; $i <= $l; $i += 1)
		{
		if ($r_n[$i] >= $a)
			{
			$a = $r_n[$i];
			$x = $i;
			}
		else
			{
			next;
			}
		}
	($r_n[$l],$r_n[$x]) = ($r_n[$x],$r_n[$l]);
	$l -- ;
	}
print"The order of the 100 random numbers is:\n@r_n.\n";

