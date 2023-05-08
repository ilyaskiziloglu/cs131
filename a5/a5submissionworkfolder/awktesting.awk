#Goal of this script is to count and display layoffs by county

BEGIN{
	FS=","
	OFS=","
}


{

#counties["Alameda County"] = "Alameda County"
#counties["Santa Clara County"]
#counties["Placer County"]
#if (counties[$1] == $1)
counties[$1] += $2

	


}

END {

for (i in counties)
print counties[i], i

#print "Alameda County", counties["Alameda County"]
#print "Santa Clara County", counties["Santa Clara County"]
#print "Placer County", counties["Placer County"]
}



#The next two lines, as is, will print the county only. 
#Kind of a useful/funny coincidence but not helpful for the end purpose

#if (NR > 6 && $1 !~/CA/ && $1 !~ /Layoff/ && $1 !~/Closure/) {print $1}
#else if (NR > 6 && $2 !~/CA/ && $2 !~ /Layoff/ && $2 !~/Closure/) {print $2} 

