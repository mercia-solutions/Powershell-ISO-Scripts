#Mercia Solutions mount iso images version 0.1

#setting to unrestrict ---  Set-ExecutionPolicy -ExecutionPolicy Unrestricted
#Default setting  --- Set-ExecutionPolicy -ExecutionPolicy restricted

Foreach($file in Get-ChildItem "C:\ISO_IMAGES" -Filter *.iso)
 {    
   $imagename = $file.ToString()

   #create output folder variable
   $folder = Join-Path -Path 'c:\Jukebox' -ChildPath $imagename.Substring(0,$imagename.Length-4)
   Write-Host $folder
  
   #create full path to iso image
   $fullimagepath = Join-Path -Path 'C:\ISO_IMAGES' -ChildPath $imagename
   Write-Host $fullimagepath

   #create the directory to mount
   New-Item -Path "c:\jukebox" -Name $imagename.Substring(0,$imagename.Length-4) -ItemType "directory"
   
   # Mount the image without a drive letter
   $ImageID = Mount-DiskImage -ImagePath $fullimagepath  -NoDriveLetter

   # Get mounted ISO volume
   $volInfo = $ImageID | Get-Volume

   # Mount volume with specified drive letter (requires Administrator access)
   mountvol $folder $volInfo.UniqueId
}