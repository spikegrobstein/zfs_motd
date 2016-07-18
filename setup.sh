scriptdir=$( dirname "$0" )
scriptdir=$( readlink -f "$scriptdir" )
scriptpath="${scriptdir}/zfs_motd"

motd_d_dir=/etc/motd.d
motd_headerfile="$motd_d_dir/0_header"
motd_footerfile="$motd_d_dir/z_footer"

hostname=$( hostname -s )

mkdir -p "$motd_d_dir"

if which figlet &> /dev/null; then
  figlet -f smslant "$hostname" > "$motd_headerfile"
else
  echo "$hostname" > "$motd_headerfile"
fi

echo "" >> "$motd_headerfile"

printf "\n\n" > "$motd_footerfile"

"$scriptpath" "$motd_d_dir"

echo "Edit $motd_headerfile to customize the header."
echo "Edit $motd_footerfile to customize the footer."
echo ""

echo "You should add the following line to your crontab:"
echo ""

echo "    */10 * * * * '$scriptpath' '$motd_d_dir'"
echo ""

