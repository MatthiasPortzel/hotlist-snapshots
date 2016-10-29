# Hotlist Snapshots
A repository for (bi-hourly?) snapshots of the KA hot list.

Inspired by MrMagma's similar [project](https://github.com/MrMagma/KA-Hotlist-Data), which was updated for a bit, then shut down.

This should record snapshots every two hours, instead of every day.

In order to use, load allSnapshots.js as a script tag. This will pass a list of snapshots to an `allSnapshots` function, which is up to you to define.
You can then use this list of snapshot files to load in the files, also as script tags. They each pass their data to a `snaphshot` function, again, which you define.

Ideally, in order to get a good sample size, I would run this for around four months before trying to analyse the data. We'll see how that goes.
