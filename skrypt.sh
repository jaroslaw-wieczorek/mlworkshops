wc -l wikiniews_results.tsv > liczba_wierszy.txt

# Split lines between hypothesis and reference 
cut -f3 wikiniews_results.tsv > reference.txt
cut -f2 wikiniews_results.tsv > hypothesis.txt


# Crate TRN files
awk 'BEGIN{FS=OFS="\t"}{print $0,"(sp1_"NR")"}' < reference.txt > reference.trn 
awk 'BEGIN{FS=OFS="\t"}{print $0,"(sp1_"NR")"}' < hypothesis.txt > hypothesis.trn

# Show files
ls -l

# RUN SCLITE 
sclite -f 0 -r reference.trn trn -h hypothesis.trn trn -e utf-8 -i rm -o all stdout

# wikiniews_results tail -n 10
tail -n 10 wikiniews_results.trn

# reference tail -10
tail -n 10 reference.trn

# hypothesis tail 
tail -n 10 hypothesis.trn
