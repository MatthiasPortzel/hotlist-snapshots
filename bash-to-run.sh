#!/bin/bash

cd /hotlist-snapshots

# Create a date variable. Remove a bunch to make it look nice.
dayVar=$(date -u)
dayVar=${dayVar:4} #Cut off the weekday
dayVar=${dayVar// /_} #Replace spaces with underscores, since it's going to be a filename
fileName="${dayVar}.js"

#Create a variable for the hotlist's API path
HLpath="https://www.khanacademy.org/api/internal/scratchpads/top?sort=3&limit=50&topic_id=xffde7c31&callback=snapshot"

#Copy the hotlist data and put it into a .js file named for the timestamp
curl -so $fileName $HLpath
#echo $dayVar > $fileName

#move the file to the snapshots folder
mv $fileName snapshots

#Create a list of all the snapshots
cd snapshots
allSnapshots=$(ls)
allSnapshots=${allSnapshots//$'\n'/$'\",\n\"'} #Replace line breaks with ",\n"
allSnapshots="/**/allSnapshots(\"${allSnapshots}\")" #Pass all the snapshots to a function called allSnapshots
echo "$allSnapshots" > allSnapshots.js #Put it into a .js file for easy access

mv allSnapshots.js ..

contents=$(<$fileName)
cd ..
allSnapshotData=$(<"allSnapshotData.js")
contents=${contents:12}

l=${#allSnapshotData}
allSnapshotData=${allSnapshotData::l-3}
allSnapshotData="$allSnapshotData   \"$dayVar\" : $contents,"

echo "$allSnapshotData
});" > allSnapshotData.js

#Git stuff
/usr/local/git/bin/git add "snapshots/${fileName}"
/usr/local/git/bin/git add "allSnapshots.js"
/usr/local/git/bin/git commit -m "Hotlist data for $dayVar"
/usr/local/git/bin/git push -q

