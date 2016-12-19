#!/bin/bash
cd /hotlist-snapshots/snapshots

allSnapshotData="/**/allSnapshotData({"

for i in $(ls); do
   contents=$(<$i)
   contents=${contents:12} #Remove "/**/snapshot"

   thisSnapshot="\"${i//.js/}\" : ${contents},"
   allSnapshotData="${allSnapshotData}
   ${thisSnapshot}"

done

echo "$allSnapshotData
});" > ../allSnapshotData.js

