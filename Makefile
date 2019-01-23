
all : msa-lev.automorf.bin \
      msa-lev.autogen.bin \
      msa-lev.autobil.bin \
      msa-lev.t1x.bin \
      lev-msa.automorf.bin \
      lev-msa.autogen.bin \
      lev-msa.autobil.bin

msa-lev.automorf.bin : apertium-msa.msa.dix
	lt-comp lr apertium-msa.msa.dix msa-lev.automorf.bin

msa-lev.autogen.bin : apertium-lev.lev.dix
	lt-comp rl apertium-lev.lev.dix msa-lev.autogen.bin

lev-msa.automorf.bin : apertium-lev.lev.dix
	lt-comp lr apertium-lev.lev.dix lev-msa.automorf.bin

lev-msa.autogen.bin : apertium-msa.msa.dix
	lt-comp rl apertium-msa.msa.dix lev-msa.autogen.bin

msa-lev.autobil.bin : apertium-msa-lev.msa-lev.dix
	lt-comp lr apertium-msa-lev.msa-lev.dix msa-lev.autobil.bin

lev-msa.autobil.bin : apertium-msa-lev.msa-lev.dix
	lt-comp rl apertium-msa-lev.msa-lev.dix lev-msa.autobil.bin

msa-lev.t1x.bin : apertium-msa-lev.msa-lev.t1x
	apertium-preprocess-transfer apertium-msa-lev.msa-lev.t1x msa-lev.t1x.bin

.PHONY : clean
clean :
	-rm *.bin

.PHONY : check
check :
	bash tests.sh
