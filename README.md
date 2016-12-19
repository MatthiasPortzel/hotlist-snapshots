# Hotlist Snapshots
A repository for snapshots of the KA hot list every two hours.

Inspired by MrMagma's similar [project](https://github.com/MrMagma/KA-Hotlist-Data), which was updated for a bit, then broke.

This should record snapshots every two hours (MrMagma's updated once a day).

Ideally, in order to get a good sample size, I would run this for around four months before trying to analyse the data. We'll see how that goes.

###Accessing all the data
The easiest way to access the data is by using [Rawgit](https://www.rawgit.com) to load `allSnapshotData.js` as a script tag on your webpage. It will call a `allSnapshotData` function, which you define, and pass it an object, set up like this: `{/*Time snapshot was captured*/ : /*Contensts of the hotlist at that time*/}`. For example, the following object might be passed into `allSnapshotData`:
```javascript
{
   "Dec_19_11:10:54_UTC_2016" : ({
      "cursor" : "[Some KA String]",
      "snapshots" : [
        {/*Program data like author, title here*/}, {/*Program data like author, title here*/}
      ],
   }),
   "Dec_19_15:10:54_UTC_2016" : ({
      "cursor" : "[Some KA String]",
      "snapshots" : [
        {/*Program data like author, title here*/}, {/*Program data like author, title here*/}
      ],
   }),
   /*etc, but a whole lot more data.*/
}
```

This is set up the way it is because of how KhanAcademy lets you load external resources.

###Accessing a part of the data
The other way to use access the data, if you want to load a smaller sample size, is to load allSnapshots.js as a script tag. This will pass a list of snapshot files to an `allSnapshots` function, which is up to you to define.
You can then use this list of snapshot files to load in the files, also as script tags. They each pass their data to a `snaphshot` function, again, which you define.

###Examples
I made a basic program to give you an idea of how to access the data [here](https://www.khanacademy.org/cs/i/4961828311465984) on Khan Academy.
Edward made a program with this data that does word frequency analysis on the titles of programs. You can find it [here](https://www.khanacademy.org/cs/i/6464716691013632).
