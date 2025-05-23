weasels="many|various|very|fairly|several|extremely\
|exceedingly|quite|remarkably|few|surprisingly\
|mostly|largely|huge|tiny|((are|is) a number)\
|excellent|interestingly|significantly\
|substantially|clearly|vast|relatively|completely"

if [ "$1" = "" ]; then
  echo "usage: $(basename "$0") <file> ..."
  exit
fi

grep -E -i -n --color "\\b($weasels)\\b" "$@"

exit $?
