wc -l wikiniews_results.tsv > liczba_wierszy.txt
echo '\n'
# Split lines between hypothesis and reference 
cut -f2 wikiniews_results.tsv > hypothesis.txt
cut -f3 wikiniews_results.tsv > reference.txt

# Crate TRN files
awk 'BEGIN{FS=OFS="\t"}{print $0,"(sp1_"NR")"}' < hypothesis.txt > hypothesis.trn
awk 'BEGIN{FS=OFS="\t"}{print $0,"(sp1_"NR")"}' < reference.txt > reference.trn

# RUN SCLITE and return Scores
sclite -f 0 -r reference.trn trn -h hypothesis.trn trn -e utf-8 -i rm -o all stdout | grep 'Scores' > results

# Show last 10 lines 
echo 'Results:'
cat results | tail -n10
# Scores: (#C #S #D #I) 19 0 0 0 ...
echo '\n'

# Show last 10 lines
cat results | awk 'BEGIN{OFS="\t"}{print $6, $7, $8, $9}' | awk '{ print ($2 + $3 + $4)/($2 + $3 + $1) }' | tail -n 10

# Save to wer.tsv
cat results | awk 'BEGIN{OFS="\t"}{print $6, $7, $8, $9}' | awk '{ print ($2 + $3 + $4)/($2 + $3 + $1) }' > wer_all.txt


# Show files
echo '\n'
echo 'Files:'
ls
echo '\n'

awk '{ sum += $1; n++ } END { print sum / n; }' < wer_all.txt >> wer.txt

# Join results
paste wikiniews_results.tsv wer.txt > wikinews_results.tsv
rm wikiniews_results.tsv

calc(){ awk "BEGIN { print "$*" }"; }
all_lines=$( wc -l < wer_all.txt )
lines_with_0=$( grep -c '^0$' wer_all.txt )
calc $lines_with_0/$all_lines >> srr.txt

# Cache last 50 lines and use to replace content in the file:
tail -n50 wer.txt | sponge wer.txt
tail -n50 srr.txt | sponge srr.txt



