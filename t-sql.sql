DECLARE @Scores AS TABLE
(
	[Id]		SMALLINT,

	[Time]		SMALLDATETIME,
	[Exam]		VARCHAR(10),
	[Score]		SMALLINT,

	PRIMARY KEY ([Id])
)

INSERT INTO @Scores ([Id],[Time],[Exam],[Score])
VALUES 
	(1 ,'2020-07-01 10:15','70-483',783),
	(2 ,'2020-06-20 14:00','70-761',890),
	(3 ,'2020-07-01 10:15','70-534',550),
	(4 ,'2020-04-20 20:00','70-761',650),
	(5 ,'2020-01-27 10:15','AZ-900',710),
	(6 ,'2020-01-27 10:15','AZ-900',560),
	(7 ,'2020-04-01 08:30','70-483',430),
	(8 ,'2020-02-28 15:30','AZ-900',220),
	(9 ,'2020-03-25 12:00','70-483',980),
	(10,'2020-03-25 14:00','70-483',1000),
	(11,'2020-06-10 16:00','70-762',950),
	(12,'2020-06-05 16:00','70-761',760)

SELECT [Id]
	,[Time]
	,[Exam]
	,[Score]
FROM @Scores
SELECT SUM([Score]) [Total Score]
	,COUNT([Id]) [Exam Count]
	,AVG([Score]) [Score Avg] 
FROM @Scores

SELECT [Exam]
	,SUM([Score]) [Total Score]
	,COUNT([Id]) [Exam Count]
	,AVG([Score]) [Score Avg] 
FROM @Scores
GROUP BY [Exam]

SELECT [Time]
	,[Exam]
	,SUM([Score]) [Total Score]
	,COUNT([Id]) [Exam Count]
	,AVG([Score]) [Score Avg] 
FROM @Scores
GROUP BY [Time],[Exam]

SELECT [Time]	
	,[Exam]
	,SUM([Score]) [Total Score]
	,COUNT([Id]) [Exam Count]
	,AVG([Score]) [Score Avg] 
FROM @Scores
GROUP BY 
GROUPING SETS (
	([Time],[Exam]),
	([Exam]),
	()
)
