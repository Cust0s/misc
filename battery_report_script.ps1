<# 
 # Battery Report Script
 # Generates a battery report with the date in the file name
 # and stores it in the specified folder. Will not overwrite
 # other files but number new file if name already exists.
 # 
 # Rene Solzbacher
 #>

#generate filename in format "battery_report_yyyyMMdd.xml"
$date = Get-Date -Format "yyyyMMdd"
$filepath = "C:\Users\Rene\Documents\battery_reports\"

#create initial file name
$filename = "battery_report_" + $date

#create full path and test for file already existing
$fullPath = $filepath + $filename + ".xml"
$fileExists = Test-Path $fullPath

#check if filename already exists and modify it until it is unique
$i = 2
while($fileExists){
	#change filename
	$filename = "battery_report_" + $date + "_" + $i
	#increment i in case there is a next iteration
	$i++
	#generate the updated full path with the new filename
	$fullPath = $filepath + $filename + ".xml"
	#test the new full path
	$fileExists = Test-Path $fullPath
}

#generate the battery report
powercfg /batteryreport /output $fullpath /xml