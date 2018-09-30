all:VQ: 
	bin/targets | xargs mk

results/found_data.tsv:E: data/gwasdb_20150819_snp_trait
	echo "Iniciando búsqueda de palabras clave en $prereq"
	mkdir -p `dirname $target`
	head -n+1 $prereq > $target.build
	while read terms
	do
		echo "Buscando $terms in GWASdb"
		grep -i $terms $prereq >> $target.build
	done < data/keywords_OCD.txt \
	&& mv $target.build $target
