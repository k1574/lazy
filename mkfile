<mkconfig
MKSHELL = rc
BUILDFILE =

HTMFILE = `{eval 'for( i in `{goblin ls -r 100 '$PUBDIR'}){~ $i *.htm.pp && echo $i}'}
BUILDFILE = $BUILDFILE $HTMFILE
HTMFILE = ${HTMFILE:%.htm.pp=%.htm}

MDFILE = `{eval 'for( i in `{goblin ls -r 100 '$PUBDIR'}){~ $i *.md.pp && echo $i}'}
BUILDFILE = $BUILDFILE $MDFILE
MDFILE = ${MDFILE:%.md.pp=%.md}

WEBFILE = $HTMFILE

INC = `{goblin ls -r 100 inc}
TGT = $MDFILE $HTMFILE

all:VQ: build
build:V: $PUBDIR $TGT
minify:V: build
	for(i in $WEBFILE)
		$MIN $i -o $i
$PUBDIR:
	mkdir -p $target

%.htm : $INC $MDFILE %.htm.pp
	$PP $stem.htm.pp > $stem.htm

%.md : $INC %.md.pp
	$PP $stem.md.pp > $stem.md

%.pp %.jpg %.png %.svg %.txt %.mp4 %.m3 %.mkv :N:
tree:V:
	goblin ls -r 100 net inc

run:V: clean
	ls $BUILDFILE | entr mk	

clean:V:
	rm -f $TGT
