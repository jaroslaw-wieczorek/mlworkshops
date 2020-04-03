#wc -l wikiniews_results.tsv > wyniki.txt
awk 'BEGIN{FS=OFS="\t"}{print $0,"(sp1_"NR")"}' wikiniews_results.tsv 
