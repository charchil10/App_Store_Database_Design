--1) Show the users that have downloaded the current version of an application
SELECT Users.User_Fname, Download_Date, Application.Updated_Date
FROM Downloads 
JOIN Users ON Downloads.User_Email= Users.User_Email
JOIN Application ON Downloads.Application_ID = Application.Application_ID
WHERE Downloads.Download_Date> Application.Updated_Date; 


--2)
SELECT Users.User_Fname, Download_Date, Application.Updated_Date
FROM Downloads 
JOIN Users ON Downloads.User_Email= Users.User_Email
JOIN Application ON Downloads.Application_ID = Application.Application_ID
WHERE Downloads.Download_Date> Application.Updated_Date; 


-- 3) Should the total count of all downloads for an application by version

SELECT Application.Application_Version, Count(Download_id) AS Number_of_downloads
FROM Downloads JOIN Application ON Application.Application_ID = Downloads.Application_ID
WHERE Application.Application_Name = 'xyz'
GROUP BY Application_Version

--4) Show the users that have downloaded an application to more then one device

SELECT Users.User_Email, Downloads.Application_ID
FROM Downloads 
JOIN Users ON Users.User_Email=Downloads.User_Email
JOIN Application ON Application.Application_ID= Downloads.Application_ID 
GROUP BY Users.User_Email, Downloads.Application_ID
HAVING Count( DISTINCT Downloads.Application_ID) =1 AND COUNT ( DISTINCT Downloads.Device_ID)>1

--5) Show the developers whith multiple applications
SELECT Developer.Developer_Name, Application.Application_Name
FROM Developer INNER JOIN 
Application ON Developer.Developer_ID= Application.Developer_ID
GROUP BY Application_Name , Developer_Name
HAVING COUNT(Application.developer_id)>1