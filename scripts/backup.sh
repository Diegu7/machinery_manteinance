#este comando genera 
# pg_dump --column-inserts hc_machinery_production > file.dmp

DATE=`date +%Y%m%d`
FILENAME="dmp/$DATE.dmp"; #TODO: change to actual directory

QTY="$(gdrive list --no-header | wc -l)"
echo "\nNumber of files in google drive"
echo $QTY

OLD="$(gdrive list --order "modifiedTime asc" -m 1 --no-header | awk '{print $1;}')"

# Amount of days to keep backup
DAYS=60
# Delete oldest file in drive
if (( QTY > DAYS)) ; then
    echo "\nDeleting oldest backup in google drive"
    echo "========================================"

    if gdrive delete $OLD &>/dev/null; then
        echo "Deleted succesfully"
    else
        echo "Error deleting file"
        exit 1
    fi
fi

echo "\nGenerating backup"
echo "==================="
# Generar el backup
if pg_dump --column-inserts hc_machinery_production > $FILENAME ; then
    echo "Backup generated succesfully"
else
    echo "Error generating backup"
    exit 1;
fi

echo "\nUploading to Google Drive"
echo "==========================="
# Subir a google drive
if gdrive upload --no-progress $FILENAME &>/dev/null; then
    echo "Upload succesful";
else
    echo "Upload failed";
    exit 1;
fi

# Borrar el archivo local
rm -rf $FILENAME

exit 0;

