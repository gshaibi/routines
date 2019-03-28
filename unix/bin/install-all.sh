shopt -s extglob

for i in $(ls !(install-all.sh))
do
cp $i ~/bin/${i%.*}
done

shopt -u extglob
