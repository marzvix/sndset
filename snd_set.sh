#list available sound devices
q=`cat /dev/sndstat | grep -v "Installed" | grep -e ":" | sed "s/default$/*** & ***/"`
n=`cat /dev/sndstat | grep -v "Installed" | grep -e ":" | wc -l | sed "s/ //g"`

if [ "$n" -le "0" ]; then
    echo "no snd devices available!" >&2
    exit 1
fi

printf "These are snd devices available:\n\n"

echo "$q"

# query to new default
echo ""
read -p "Want to change? (y/N) " r
if [ "$r" == "y" ] || [ "$r" == "Y" ]; then
    read -p "Which? (0..$((n - 1))) " r

    [ -n $r ] &&  [ "$r" -eq "$r" ] 2>/dev/null
    if [ $? -ne 0 ]; then
        echo "error: '$r' not a number" >&2
        exit 1
    fi

    if [ "$r" -lt "0" ] || [ "$r" -gt "$((n - 1))" ]; then
        echo "error: out of range."  >&2
        exit 1
    fi
    echo "Changing default snd device to $r"
    sysctl hw.snd.default_unit=$r
fi

