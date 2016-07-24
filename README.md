# SeatUp - Outsideland Hacks - 23 July 2016

####Hackathon prompt: 
Build something that enhances the experience for artists and/or fans at Outside Lands 2016 (iOS, Android, Web, or anything else).

####Promotional description: 
Tired of staring at a person’s back throughout an entire concert, breathing in the sweaty fumes? Embarrassed to tap them on the shoulder and asking them to step aside? Well, now you can cut your vertically challenged problems down to size with SeatUp!

####App description: 
SeatUp is an app that helps organize concertgoers by their height and group status so that there would be minimal blocking of persons that are shorter. 

####App screenshots:
![Main page / Home page](https://github.com/ChenCodes/SeatUp/blob/master/githubScreenshot.png)

####How does the app work? - (technical implementations discussed)
1. After entering their name, height, and group status, the user then will be shown a page where there is a spinning icon. They are prompted to start spinning until the icon goes away and is replaced with a thumbs up button. This means that they are facing the right direction.
2. Right below the icon there is a label that shows how far the user is from the source destination. This source destination is calculated in the backend. The entire concert-field is divided up into a 10 x 10 grid. The columns are indexed from 0 to 9, and the rows are indexed from row 9 through 9 as well. In the implementation of the app, we were aware of the fact that groups of concertgoers would rather not be split apart by height / the majority of people who went to such concerts were part of a group. Thus, we set aside 80% of the concertgrounds to be space reserved for groups. The remaining 20% were put in columns indexed 0 and index 9. 
3. First, we stored concertgoers in a queue depending on whether they arrived as part of a group or by themselves. Those who arrived alone would be put in two queues, one that would go in column 0 and one that would go in column 9. The queues would be priority queues, sorted from shortest person to tallest person. 
4. As for the concertgoers that were present in groups, we would have a queue of lists of person objects rather than individual person objects (which were how they were implemented in the single-person queues. Each list would be have the average height calculated, and so if overall a list had a higher average height, then it would go after a list that had a lower average height. This was to ensure that the heights of individuals would be sorted as much as possible across both rows and columns.
5. After the user starts walking toward their designated spot on the concertfield, the distance will start to decrease. Once the distance becomes less than 5m, this means that the user has arrived at their designated location. 

####Appstore status: 
Not available on Appstore. As we didn't have enough time to finish the project, we may possibly release it on the Appstore in the future. For now, it will stay here as open source code. 

####Collaborators:
I worked with a fellow senior David Sohng - dsohng(Github) on this project. 

####How to run this repo:

1. Download the code or clone the repository.
1. Open the project in Xcode.
1. Click the run button.


####Additional resources:
Here is the google doc that we worked on prior to the event:
https://docs.google.com/document/d/12SmWBMkKA2lYA6zPV_eDk0Fcs91yUJlfCHXOCzx_yw0/edit?ts=5792a9e6

####Contact:
Feel free to add me on Facebook if you have any questions about this project! - https://www.facebook.com/jack.chen.940



