<mkconfig
MKSHELL = rc
PPFILE = `{eval 'for( i in `{goblin ls -r 100 '$PUBDIR'}){~ $i *.pp && echo $i}'}
MDFILE = `{eval 'for( i in `{goblin ls -r 100 '$PUBDIR'}){~ $i *.md && echo $i}'}
INC = `{goblin ls -r 100 inc}
TGT = ${PPFILE:%.htm.pp=%.htm}
all:VQ: $PUBDIR $TGT
$PUBDIR:
	mkdir -p $target
%.htm : $INC $MDFILE %.htm.pp
	$PP $stem.htm.pp > $target
$INC:N:
%.pp %.jpg %.png %.svg %.txt %.mp4 %.m3 %.mkv :N:
run:V:
	goblin ls -r 100 | entr mk	
clean:V:
	rm -f $TGT
