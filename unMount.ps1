#Mercia Solutions unmount iso images version 0.1

Foreach($file in Get-ChildItem "C:\ISO_IMAGES" -Filter *.iso)
{
    $imagename = $file.ToString() 
     
    $fullimagepath = Join-Path -Path 'C:\ISO_IMAGES' -ChildPath $imagename
    Write-Host $fullimagepath

    #unmount the image
    DisMount-DiskImage -ImagePath $fullimagepath
      
    $folder = Join-Path -Path 'c:\Jukebox' -ChildPath $imagename.Substring(0,$imagename.Length-4)
    Write-Host $folder
        
    #remove the folder
    Remove-Item $folder -Force
}