for i in $( cat top200ids.txt) #~/cs131/ws5/idscutfile.txt # maybe this needs to be i in $( cat idscutfile.txt)?
	do grep $i awsreviews.tsv > ~/cs131/ws5/customers/$i.txt
	printf "$i %n" >> iddumpcounter.txt	
	#find a way to add a counter for each new file created to a new file 
	#output to a new file? 
done
