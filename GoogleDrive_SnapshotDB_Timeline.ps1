Import-Module SQLite
mount-sqlite -name GoogleDrive -dataSource E:\Programming\snapshot.db
$c_entry = "GoogleDrive:/cloud_entry"
$doc_types = @{
"0" = "Folder"
"1" = "Null"
"2" = "Google Presentation"
"3" = "Unassigned"
"4" = "Google Form"
"5" = "Google Drawing"
"6" = "Google Document"
"7" = "Google Table"
}

["$($_.doc_type)"]}})
$cloud_entry = Get-ChildItem GoogleDrive:\cloud_entry

foreach ($entry in $cloud_entry)
{
$dtype = $entry.doc_type
[datetime]$origin = '1970-01-01 00:00:00'
$created = $entry.created
$modified = $entry.modified
$ctime = $origin.AddSeconds($created)
$mtime = $origin.AddSeconds($modified)

write-host ""
$entry.filename,
$ctime,
$mtime,
$doc_types.Get_Item("$dtype")

}