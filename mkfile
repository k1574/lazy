<mkconfig
MKSHELL = rc
PPFILE = `{eval 'for( i in `{goblin ls -r 100 '$PUBDIR'}){~ $i *.pp && echo $i}'}
TGT = ${PPFILE:%.htm.pp=%.htm}
all:VQ: $PUBDIR $TGT
$PUBDIR:
	mkdir -p $target
%.htm: %.htm.pp
	$PP $prereq > $target
%.pp:N:
%.jpg:N:
%.png:N:
%.svg:N:
%.txt:N:
clean:
	rm -f $TGT
