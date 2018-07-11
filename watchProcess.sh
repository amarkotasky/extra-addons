command="$1"
log="watchProcess.log"
match="$2"

$command > "$log" 2>&1 &
pid=$!

while sleep 5
do
    if fgrep --quiet "$match" "$log"
    then
        kill $pid
        exit 0
    fi
done
