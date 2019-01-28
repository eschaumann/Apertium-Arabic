declare -a sentences=("عائلة"
			"أنا"
			"نحن")


for sent in "${sentences[@]}"
do
	echo -e ${sent}$"\t\t"$(echo ${sent} | lt-proc msa-lev.automorf.bin |   gawk 'BEGIN{RS="$"; FS="/";}{nf=split($1,COMPONENTS,"^"); for(i = 1; i<nf; i++) printf COMPONENTS[i]; if($2 != "") printf("^%s$",$2);}' |   apertium-transfer apertium-msa-lev.msa-lev.t1x msa-lev.t1x.bin msa-lev.autobil.bin  |   lt-proc -g msa-lev.autogen.bin)
done
