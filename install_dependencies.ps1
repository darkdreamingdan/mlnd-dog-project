Add-Type -AssemblyName System.IO.Compression.FileSystem

# Allows downloading of large files with progress reports
# https://stackoverflow.com/a/46830839
function downloadFile($url, $targetFile)
{
    "Downloading $url"
    $uri = New-Object "System.Uri" "$url"
    $request = [System.Net.HttpWebRequest]::Create($uri)
    $request.set_Timeout(15000) #15 second timeout
    $response = $request.GetResponse()
    $totalLength = [System.Math]::Floor($response.get_ContentLength()/1024)
    $responseStream = $response.GetResponseStream()
    $targetStream = New-Object -TypeName System.IO.FileStream -ArgumentList $targetFile, Create
    $buffer = new-object byte[] 10KB
    $count = $responseStream.Read($buffer,0,$buffer.length)
    $downloadedBytes = $count
    while ($count -gt 0)
    {
        [System.Console]::CursorLeft = 0
        [System.Console]::Write("Downloaded {0}K of {1}K", [System.Math]::Floor($downloadedBytes/1024), $totalLength)
        $targetStream.Write($buffer, 0, $count)
        $count = $responseStream.Read($buffer,0,$buffer.length)
        $downloadedBytes = $downloadedBytes + $count
    }
    "Finished Download"
    $targetStream.Flush()
    $targetStream.Close()
    $targetStream.Dispose()
    $responseStream.Dispose()
}


echo 'Downloading dog dataset...'
downloadFile 'https://s3-us-west-1.amazonaws.com/udacity-aind/dog-project/dogImages.zip' "$pwd\dogImages.zip"
[System.IO.Compression.ZipFile]::ExtractToDirectory("$pwd\dogImages.zip", $pwd)
Remove-Item dogImages.zip

echo 'Downloading human dataset...'
downloadFile 'https://s3-us-west-1.amazonaws.com/udacity-aind/dog-project/lfw.zip' "$pwd\lfw.zip"
[System.IO.Compression.ZipFile]::ExtractToDirectory("$pwd\lfw.zip", $pwd)
Remove-Item lfw.zip

echo 'Downloading VGG-16 bottleneck features'
downloadFile 'https://s3-us-west-1.amazonaws.com/udacity-aind/dog-project/DogVGG16Data.npz' "$pwd\bottleneck_features\DogVGG16Data.npz"

echo 'Downloading ResNet-50 bottleneck features'
downloadFile 'https://s3-us-west-1.amazonaws.com/udacity-aind/dog-project/DogResnet50Data.npz' "$pwd\bottleneck_features\DogResnet50Data.npz"

echo 'Done'
