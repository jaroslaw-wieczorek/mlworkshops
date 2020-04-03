wc -l wikiniews_results.tsv > liczba_wierszy.txt

# Split lines between hypothesis and reference 
cut -f2 wikiniews_results.tsv > hypothesis.txt
cut -f3 wikiniews_results.tsv > reference.txt

echo "[*] Debug tails 1:"
tail -n 3 hypothesis.txt
tail -n 3 reference.txt


# Crate TRN files
awk 'BEGIN{FS=OFS="\t"}{print $0,"(sp1_"NR")"}' < hypothesis.txt > hypothesis.trn
awk 'BEGIN{FS=OFS="\t"}{print $0,"(sp1_"NR")"}' < reference.txt > reference.trn 

# Show files
ls -l

# RUN SCLITE 
sclite -f 0 -r reference.trn trn -h hypothesis.trn trn -e utf-8 -i rm -o all stdout

echo "[*] Debug tails 2:"
# wikiniews_results tail -n 10
tail -n 3 wikiniews_results.trn

# reference tail -10
tail -n 3 reference.trn

# hypothesis tail 
tail -n 3 hypothesis.trn
