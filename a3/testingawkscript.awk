BEGIN{
	FS="\t"
}

{
for (i=1; i<=NF; i++)
{
	authorids[$i]++	
}
}

{
	for (ids in authorids)
	{
		print(authorids[ids], ids)
	}
}
