echo "<!DOCTYPE html>" > q14.html
echo "<html>" >> q14.html
echo "<head>" >> q14.html
echo "<style>" >> q14.html
echo "table {" >> q14.html
echo "	border-collapse: collapse;" >> q14.html
echo "}" >> q14.html
echo "td {" >> q14.html
echo "	width: 33%" >> q14.html
echo "}" >> q14.html
echo "</style>" >> q14.html
echo "</head>" >> q14.html
echo "<body>" >> q14.html

echo "<table style=\"border:1px solid black\" border=\"1\">" >> q14.html
home=`echo ~`
for i in `find ~ -type d`
do
	if [ "$i" == "$home" ]; then
		dir="Home Directory"
	else
		dir=`echo ${i#$home/}`
	fi
	echo "<tr>" >> q14.html
	echo "	<td colspan=\"3\" style=\"text-align:center\"><b>$dir</b></td>" >> q14.html
	echo "</tr>" >> q14.html
	if [ "$(ls -A $i)" ]; then
		echo "<tr>" >> q14.html
		echo "	<td><b>Name</b></td>" >> q14.html
		echo "	<td><b>Size</b></td>" >> q14.html
		echo "	<td><b>File/Dir</td>" >> q14.html
		echo "</tr>" >> q14.html
		find $i -maxdepth 1 | while read a
		do
			if [ "$a" != "$i" ]; then
			    chk=`basename "$a"`
			    size=`du -h $a | tail -1 | awk '{print $1;}'`
			    if [ -d $a ]; then
				    typ="Dir"
			    elif [ -f $a ]; then
				    typ="File"
			    fi
			    echo "<tr>" >> q14.html
			    echo "	<td>$chk</td>" >> q14.html
			    echo "	<td>$size</td>" >> q14.html
			    echo "	<td>$typ</td>" >> q14.html
			    echo "</tr>" >> q14.html
			else
				continue
			fi
		done
	else
		echo "<tr>" >> q14.html
		echo "	<td colspan=\"3\" style=\"text-align:center\">(Empty)</td>" >> q14.html
		echo "</tr>" >> q14.html
	fi
done
echo "</table>" >> q14.html

echo "</body>" >> q14.html
echo "</html>" >> q14.html