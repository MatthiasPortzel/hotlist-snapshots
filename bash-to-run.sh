#!/bin/bash

# Create a date variable. Remove a bunch to make it look nice.
dayVar=$(date -u)
dayVar=${dayVar:4} #Cut off the weekday
dayVar=${dayVar// /_} #Replace spaces with underscores, since it's going to be a filename

#Create a variable for the hotlist's API path
HLpath="https://www.khanacademy.org/api/internal/scratchpads/top?sort=3&limit=50&topic_id=xffde7c31&callback=snapshot"

fileName="${dayVar}.js"

curl -o $fileName $HLpath #dowload the data into a .js file named for the timestamp

mv $fileName snapshots

#date >> /hotlist-snapshots/snapshots/test.txt
