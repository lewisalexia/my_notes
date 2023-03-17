# My DS Notes

## **WED 3/1: Intro to Data Science**
———————————————————————————————————————
Plan the data

Acquire + Prep == Wrangle

Exploratory analysis - visualizations and statistical testing

	1. What is the data trying to tell us?
    2. Distribution plots, trends, units being sold
    3. How to determine where “home” is by using timestamps on purchases and frequency of purchase from Lat/Long
    4. POS versus online order

(1 is a true and 0 is a false typically)
To deliver - or to model?
Delivery can be reports, Jupiter notebooks, presentations, or a model that can be used to predict things.

	1. Continuous and discrete variables
	    1. Discrete is one thing “a person is a person”
	    2. Height, temperature, and age are continuous
	    3. Use a target variable (Y) to verify a True/False response from a test Machine learning models can pick out these patterns and, within a certain degree of confidence - a yes or no.

“Data scientist makes decisions based on predictions”
“Data analyst makes decisions on descriptive statistics - what has happened already?”
“Data engineer generates the data”

Supervised learning (includes target variable = Y) is linear regression (we know what groups or continuous variables we are looking for)

Unsupervised learning (does not know target variable = Y) - figuring out who the high-paying customers are and who the low-paying customers are - the machine goes in and creates clusters where we can go in and label them … the machine is doing the job for me to figure out the Y variable.

*Feed the data in and let the machine cluster the data to analyze
*	
———————————————————————————————————————

**DATA TOOLS** // python, SQL, stats, storytelling with data, git, interview skills, collaborating, presentation skills 

**Classification**: two+ buckets, how we find out if independent features lead to outcome a, b, c, etc. our target variables are distinct labels (DISCRETE). Classification is used with categorical variables. Classification uses buckets and categorical variables.

**Regression**: How we create a model to predict a continuous target. Used for continuous or numerical values.

**Time-Series Analysis**: How we analyze and attempt to predict the future; stocks, demand, forecasting 

**Clustering**: The most common unsupervised modeling type; no target variable exists. You can use it to create features OR a target variable; we then can use clustering to feed features into modeling to make up for things humans missed or can’t think of.

**Anomaly Detection**: The craft of applying acute analysis of outliers, novelties, and anomalous events (fraud, network security)

**Natural Language Processing**: The method of interpreting or generating text and the mathematic transformations and stipulations of interpreting human language computationally (chatbots, predictive text).

**Big Data Spark**: The mediums and methods we use for data that is big** (*too big for your computer’s memory) — Spark, The Duke, AWS, data services

**Neural Networks/Deep Learning:** Using artificial neural networks as a training and modeling structure - machine learning is we are teaching it how to learn AND deep learning teaches the machine how to think. Tetraflow or Pie Torch (image recognition, deep fakes, chatGPT).

———————————————————————————————————————

Reinforcement between supervised and unsupervised - used in deep learning : produces some action, verify that action, reward or punish the action to create learning ** anomaly detection, NLP
———————————————————————————————————————
**Technical skills:** *Math and Stats*

Machine learning
Using the machine to learn the data - unsupervised or supervised
Statistical modeling
Using stats to build the model of the data — LEVERAGE
Experimental Design
Creating hypothesis - state null, alt, and C.I.’s “alpha”
Bayesian Inference
Statistics that get updated as the data changes, along with assumptions
Supervised learning
Unsupervised learning
Model Optimization
Hyperparameters

**Technical Skills:** *Programming*

Computational literacy
Scripting language fluency
Query language fluency
Statistical computing packages
Database Knowledge
Dashboarding Software Familiarity
Data Visualization Tools
Distributed and Cloud Platform Literacy

** Get really really good at cleaning data**

**Soft skills:** *Domain Knowledge // what would you see in the data without it being there*

Passion for the industry of your stakeholders
Curiosity about the data
Influence without authority
Problem-solving
Strategy
Creativity
Innovation
Collaboration
Proactive

**Soft skills:** *Communication *

Ability to engage with Sr. Mgmt
Storytelling skills
Translation of data-driven insights into decisions and actions
Visual design and optimization
Visualization tool stack literacy

**DATA SCIENCE TOOLS:**

SQL — Structured Query Language
** the actual language to talk to a database
RDBMS (relational database mgmt system)
Structured data ONLY ((NoSQL is for unstructured; audio, video, images, text))
The primary data source for business INTEL
Graph-Based — social media and network, bubble chart is like a graph and security threat detection && Graph Theory… SUPPLY CHAIN MGMT

**PYTHON:**

Loading in libraries — Numpy, SciPy, Matplotlib, Pandas, Statsmodels
Readable in almost plain English — CON is speed because it is based off of C
1. Compile languages compile straight to machine code
2. Interpreter languages take a second to transition to machine code

Pandas - Data / 
Creates Tabular datasets

Numpy - Math /  Suited for vectorized functions and computing transformations in multidimensional arrays — the engine under the hood of Pandas

Sci-Kit Learn / Machine learning library

Primary pythonic visualization tools

	Matplotlib
	Seaborn
	* Built on Matplotlib - provides a convenient API to make specific types

Scipy: 
Stats library

Object-oriented programming using classes … functions contained in classes — data science doesn’t really need it ** this is what I might need to enact my dreams

Tableau == Power BI for Microsoft

———————————————————————————————————————

**VERSION CONTROL:**

Important when working in a team that handles the same scripts and project files in general. Good for tracking changes in a program and reverting to previous versions.
GIT:
An open-source - version control system, cross-platform and command line interface
GITHUB:
Uses git and allows you to post everything on the web

If you know how to use Spark, you know how to use HADOOP.

Deep Learning **
Tensorflow: open-source software library for dataflow programming across a range of tasks. It is a symbolic math library used for machine learning applications such as neural networks.
Keras - written in python
PyTorch - used for computer vision and NLP

Sub-disciplines of Data Science | We will likely specialize in something…
* Machine Learning Engineer
* Data Visualization Developer
* Data Journalist
* Big Data Engineer
* *** ETHICS IN MACHINE LEARNING REALLY PIQUED MY INTEREST***

“Demand has been driven by the impact of an organization using data effectively.” 

———————————————————————————————————————
The Hadoop Distributed File System (HDFS) is the primary data storage system used by Hadoop applications. HDFS employs a NameNode and DataNode architecture to implement a distributed file system that provides high-performance access to data across highly scalable Hadoop clusters.
———————————————————————————————————————
## **THUR 3/2: Data Science Pipeline: “Data Science is Excel on Steroids”**
———————————————————————————————————————
Data, Information, Knowledge, Intelligence, and Action

Planning, Acquisition, Preparation, Exploration, Modeling, and Delivery

Planning - clear and defined goals

* Clearly define the scope, the final deliverables, how success will be measured, and the plan from start to finish. How do we want this to look? Where do we want the file to live? What is the timeline?
* Trello is a good tool for team project mgmt
* Put it down on paper

Acquisition - Databases, spreadsheets, web scraping

* Create a path from original data sources to the environment where you will work with the data.
* SQL, Web Scraping, JSON packages (API’s), spreadsheet (excel, CSV), —> “.py”
* Dataframe == tabular data, data ready to be manipulated

Preparation - Cleaning, removing nulls, addressing outliers, check duplicates, formatting

* Have your data split into random samples in a format easily explored, analyzed, and visualized.
    * Testing data means having a control group to test against
        * Split into 3 sets: train, validate, and test

*Exploration - Relationships, visuals, stats tests, address things in the planning phase, correlations*

* Discover features with the largest impact on the target variable, i.e., provide the most information gain and drive the outcome.
    * Features are independent variables - categorical variables.
* Perform stats test — checking to see if we have enough data points to assign significance.
* Visualization
* Feature engineering: Making a new feature off of closely related variables for your model

Modeling - Using the validate and test sets along with the training set - this is what we are delivering (we use this to build rules for the model, and the model is what we are delivering)

* Create a robust and generalizable model that is a mapping between features and a target outcome.
* Training set (parameters) —> build model —> check against validation set (hyperparameters) —> test set (supervised machine learning)

Delivery - Dashboard/endpoint, presentation/report, notebooks or scripts

* Enable others to use what you have learned or developed through all the previous stages.

———————————————————————————————————————

###"For anything to be put into a machine learning model - it must be a number and cannot be a null value… don’t recommend doing that during the preparation phase because having the words makes that section easier." 

———————————————————————————————————————
Parameters / Features / X-Values are interchangable and hyperparameters are what is affecting the actual model
———————————————————————————————————————
## Fundamentals Quiz Review 3/3
———————————————————————————————————————

Data science is a formal, applied, and interdisciplinary science. Formal with the scientific method. Applied is making the models and engineering. Interdisciplinary is connecting with other disciplines (stats, engineering, programming)

In the future, the technical learning curve for data science tools is predicted to DECREASE. We are getting smarter, and libraries are getting larger.

Deep learning is a SUBset of machine learning.

The exploratory phase is when you will use statistics. 

Modeling is where you will use machine learning. 

Planning is where you form the hypothesis and initial questions.

Splitting data occurs in preparation.

Exploration is where feature engineering is most likely to occur. 

Machine learning is “computer systems that perform specific tasks based on patterns discovered through mathematical or statistical-based models.” 

Train, validate, and test: the primary purpose of the test data set is to use it ONE time on the best algorithm. A test data set is a sample from the original data set. The bulk of the data lies in the training data set. The purpose of splitting data is to avoid overfitting your model to one set of data. Optimizing hyperparameters should be accomplished using the validated data set. 

Supervised machine learning is where we build a model that will predict the value of a target variable. In unsupervised machine learning, we don’t need labels. Supervised learning uses the algorithm and labeled values to find the patterns that lead to each outcome. 

“Attributes” are features and predictors, an independent variable, and an x-variable! 

Clustering is a machine learning method for identifying groups of similar observations and unsupervised learning. 

We use the classification method for predictions based on features like money spent or services utilized.

Predictions based on the previous 52 Mondays would be Time-Series Analysis. Regression is similar but uses other variables and features to predict a future outcome. Time-Series uses one variable to map the value through time. 

Anomaly detection is good for detecting fraud and identifying product defects on assembly lines.

Git is a version control system.

Analyzing social networks uses graph database tools.

———————————————————————————————————————

## 3/2: InterReview Small Group Exercise - Divante, Oliver, and Myself

What is data science, in your own words?

* Planning, acquiring, preparing, exploring, modeling, and delivering business insights and actionable intel based on evidential data.

What are some differences between supervised and unsupervised machine learning?

* Supervised is more hands-on, and used when you have an idea of your target variable. Unsupervised learning is more hands-off and exploratory because you may not know your features or target variable.
* Supervised learning (includes target variable = Y) is linear regression (we know what groups or continuous variables we are looking for)
* Unsupervised learning (does not know target variable = Y) - figuring out who the high-paying customers are and who the low-paying customers are - the machine goes in and creates clusters where we can go in and label them … the machine is doing the job for me to figure out the Y variable. Feed the data in and let the machine cluster the data to analyze

If you want to predict whether or not a customer will churn, what type of machine learning algorithm would you use (supervised or unsupervised)? And what type of problem is predicting churn (regression or classification)? 

* I would use supervised learning because we know what our target variable is - it’s churn. Additionally, it would be classification because they only want to know IF they will churn, not WHY. However, a good data scientist would also explore the “why.”

What are some of the python libraries you will use to analyze and visualize data in Codeup and beyond?

* Pandas, Matplotlib, and Seaborn for visualization and Numpy and Scipy for analysis.

How do you rest your brain and eyes from looking at a computer screen? What works for you that you can share with the rest of us?

* I use the 20/20/20 rule, eye drops, and take breaks.

How do you start a project? What’s your process? What are some of your best practices?

* I use outlining a lot and visual representations of involved activities. If I am building something, I like to take all the pieces out and look at it big-picture.

What do you foresee as your biggest challenge in this program? 

* Programming and python usage. The learning curve for me is large in those areas.

Where do you feel you might be the most comfortable, or what are you most excited about learning in the program?

* I am most comfortable working in groups/teams/leading. I am most excited to learn how to portray the technical side of what I am learning in layman’s terms.

What is something you found interesting in the capstone videos?

* Mixing the technical terms with the ability to present and explain what was found to an average person/stakeholder who may not have the technical interest or background.

What is a takeaway you got from this InterReview experience?

* I learned more about my peers and discovered lapses in knowledge where I had to review my notes to understand and answer the question.

———————————————————————————————————————
## MON 3/6: Job Hunt Presentations
———————————————————————————————————————

## Things I liked:

* the codeup logo and name in the corner .. add to industry-specific for future presentations (nathaniel)
* Structure ; used plain language (corey)
* “the good/the bad” and graphical table layout and codeup graphic (tyler)
* *SynergisticIT: good reviews, scam/fake postings/bootcamp ; Intellectt INC: complaints about leadership and culture ; USNEWS: health data (read code you didn’t write) (divante - great viewpoint)
* Veteran preference for jobs / didn’t read every single line - let us read at our pace while she continued / mentioned the sites she used as tools (chellyan)
* Great attitude, functioned well through the nerves (keila)
* Security clearance jobs are available in Defense ; love the anecdotes ; used and explained abbreviations (DMV) ; “max(appeal) and min(appeal)” Jupyter notebooks ; disproportionate requirements ; “if you can’t communicate your findings then what is the point” (wilson)
* Clever graphics Home Depot! graph/table layout is a good pick ; relevant language used ; candid personality ; liked the soft skills being different even at same company ; mentioned *legacy (nate d.)
* Good introduction ; little jokes ; shake the mouse to indicate emphasis ; loved the venn diagram! (jarred) 
* Great visual template (lots of ooh and aah) ; General Dynamcs Information Technology; company logo included ; good pros/cons ; had the salaries on the conclusion slide (applying value to a “throw away” slide) ; shout out to what I had said in my presentation (shaine)
* CIA jobs ; good visuals ; nice and clear voice and eye contact when presenting including asking questions to the audience (joey)
* Internships ; project management ; stated what site they pulled the data from explicitly (rosendo)
* Different route divergent to the assignment ; I like the encouragement of you will have the skills ; Number-based presentation with stats and percentages ; identified regional opportunities ; liked the sampling slide ; relayed plan on building up the lacking skills ; ended on “i’m not taking any questions” ; navigated tech issues well (oliver)
* Costco logo included ; good research skills ; presented interesting tidbit of leveled salary ; sticking to a similar presentation style for all the information ; good conclusions ; LinkedIn hints (scott)
* Liked the executive summary recommendations page ; search in areas that excite and interest you ; engaing animations ; even if you don’t have all the adv. skills there may be a good fit for you in a job opportunity (andrew c)
* The numbers template is awesome ; I like the comic “why should we hire you?” “you have a job opening.” ; I would rather xx instead of xx ; navigated tech failure well (shane s.)
* Used presenter view! Simplistic slide visuals ; orange and blue not a good mix ; navigated tech failure well ; reading the job description can give hints to interview questions you can ask (brian)

##Things I didn’t like:

* Too many words - full sentences 
* Too many animations
* Too fast through the slides 
* Not enough visual differentiation between information on slides
* Saying thank you and then any questions - stopped the flow completely 
* Not enough voice modulation
* Reading from a paper
* Reading from the screen
* Unclear sentences / annunciation
* Pointing
* Purple Blob Template
* And “yeah” ; ums

##Things I did well:

* being aware of audible pauses, hand movements, and eye contact
* presentation visuals and display of information

## Things I can work on:

* better explanation of information on slides
* using the notes function to present from to make sure I don’t miss anything or any jokes

———————————————————————————————————————
## TUES 3/7: Command Line Terminal + GIT
“The file structure in a Mac is based off of a unit’s operating system - Linux, Unix, etc” That's why we use it. Linux runs the internet. 
———————————————————————————————————————

The program behind the terminal is called a shell. The shell is the actual program that takes the execution of it. 

The % sign says that I am a “user” not a “superuser” and it is also an “escape” character to write different forms of text. A superuser uses a / as a depiction. 

?? Does the $ sign also work as an escape in BASH as the % sign does in ZSH ??

ZSH is case-sensitive, but it is not .. the TAB key only works if the case is wrong.

FLAGS:

* A modifier on the command
* -a == all
    * In finder: shift + command + . == brings up all hidden documents
* -l == long format

The absolute is the entire file path as if you were coming from the root directory. The relative path is the file path from your location. The “pwd” prints the absolute path to get to the directory you are located in - can use to copy/paste to capture the absolute path. Using ~ takes you back to the home directory. Can use “~/Directory_name” to get to any directory in the home directory. 

HINTS: 
Don’t capitalize ANYTHING and don’t use underscore — use dashes!

Code function??? Can create new files and open documents … 

“ . “ == current directory

“ .. “ == parent directory, one above where we currently are

You can use the “ cd ../../ “ to go up TWO directories or more by adding duplicates.

When working with “ open “ the “ -a ” is a different flag == application

“ ls -Ra “ recursively lists all files and directories, including hidden ones

We can move a file to a new directory and rename it at the same time: 
* argument list :: mv file_name.txt ../new_file_name.txt
    * moves up one directory and renames

** removed files not recoverable **

———————————————————————————————————————
###codeup_data_science — File Paths
———————————————————————————————————————
File paths are lines of text that specifies unique locations of files in a file system.

We separate directories with a forward slash “ / “

When used by itself, / means “root directory” and will take you to the base of the entire file system.

An absolute path will take you directly to the one thing you are looking for
A relative path will take you to a place relative to the absolute location
* The absolute path will NOT change based on where you are in the system
* The relative path WILL change based on your location in the system

———————————————————————————————————————
###GIT
———————————————————————————————————————
Git is a version control system || Git != Github
Repository == a place where you put stuff

Use “local” when dealing with sensitive data; secures data but gives you access to version control
* To push to another server ; use GitHub to link
    * Best to create a GitHub then pull it down to your computer
    * Nothing happens until you tell it too
* The local repository is the only one we should be touching || If we delete something online it won’t reflect on the local computer — it will create a merge conflict.
    * LEAVE ONLINE GIT ALONE
* ** Apply changes locally then push to GitHub

Git == 

* a permanent record for source code
* able to revert to older version of the source code
* able to create branches to allow collaboration between coders/developers

SSH == Secure Shell == Getting an actual PATHWAY to move data back and forth instead of a URL

git -> git status (red) -> git add file_name -> git status (green) -> git commit -m "add specific remark"-> git push

* git help if git lost
* git commit == local change
* git push == online change
* Does not push empty folders

Independent feature work is capable of branching .. dependent features get tricky and can have trouble when merging: “keep this one? Or the other one?”

—> git clone “link to repo” -> PASTE LINK in terminal

A Repo gives you more commands. To identify a Repo type in ls -a and you should see a .git to signify it is a repo

To edit the README.md open with MAC DOWN editor (synonymous to mark down)

Any changes made on the local computer to files already added will cause them to be unadded (red) and will need to be added again to become (green)

“ git add . “ == ADDS EVERYTHING IN THE DIRECTORY
* work-around == create a new file called .gitignore to “hide” this directory from populating during pushes and move the files here
* To make a “global git ignore “ = .gitignore-global located in the home directory because anything past the home directory will not be pushed 
rm -fr to remove repository without asking for permission

Local check for commit logs == “ git log “

###BEFORE YOU COMMIT — PULL!

EXERCISE: 

1. git status: makes sense - I haven’t committed anything
1. ls -l: total: 0 makes sense - ^^
1. ls -la: total: 0 and makes sense - defines it as a git repo
1. cd ..: I am in codeup-data-science
1. ls -la: I see my directory Hello_World
1. git status: fatal: not a git repository (or any of the parent directories): .git - makes sense because it is a directory not a repo
1. git status: I see my new file hello.txt in red
1. ls -la: I see my new file hello.txt
1. git status: my hello.txt file is now red
1. git diff: I noticed the line I previously added is now in red indicating deletion

Andrew’s Walk-Through

	* When cloning into git - you stay in your working directory
	* .md == markdown == a text file with added functionality 
	* LOCAL == Your machine
	* REMOTE == GITHUB
	* GLOBAL = GIT**
	* gitignore is only looking at things that have NOT been added to the staging area
	    * use git restore —staged <file_name> to remove from staging area
	* when things are committed — changes are tracked and logged
	    * git reset - resets all commits AND WILL delete your work!!
	    * copy into a different folder and then reset and then move back

To Revert Commits:

    * after deleting the mistake, grab log from the initial commit (bottom of screen) 
        * IT IS HARD DELETED — copy to another folder if want to keep
    * git reset —hard <paste log>
    * git push —force (whatever is local, force to match on repo)
        * CAN RESTORE - by using cp to copy from another folder BACK into repository .gitignore

Renaming a File:
	
	* actually deletes the original file and renames it whatever the new name is
	* add . to get the entire log to update on the remote
	    * this is necessary to track that a change has occurred in the name of a text
	* commit and then push, and it should be g2g

My global git ignore has “.gitignore” in it! That’s why it is ignored by all pushes!! Clever. A local gitignore is used when you have specific things you want to ignore in a local project

###rm -fr to remove repository without asking for permission
———————————————————————————————————————
## WED 3/8: SQL Basic Statements [select from where]
———————————————————————————————————————
Back-end database querying… Great start to computer science

	"Bad programmers worry about the code. 
	Good programmers worry about data structures and their relationships."
	- Linus Torvalds

In general we won’t be building the structures we will be focused on filtering

### Vocabulary:

DBMS: Database Mgmt System // software used to identify, manage, and create a database that provides administered access to the data || Data is stored as files

*RDBMS: Relations Database Mgmt System“* 

	Data is stored as tables (MySql, Postgres, Microsoft SQL Server) 
	* Redshift is a data warehouse
	* Oracle is proprietary 
	    * Writing the queries is similar but the writing syntax will be slightly different. 

SQL” Structures Query Language //programming language to maintain and manage a RBDMS
* NoSQL deals with DBMS // non-relational databases

?? What kind of database is used to store our tabular data: RDBMS
?? What RDBMS are we going to use? MYSQL
?? What programming language does MYSQL use? SQL

Datbase Client // program that connects to a database || command line, or guis (gooeys)
* Guis allows for screen expansion to see more than CLI
* We are using MySql Workbench

Database Server // computer that stores the data and runs the DBMS || typically in the cloud or in a server room onsite

Database // the actual data

Queries // how WE interact with SQL || write queries in plain english and then transferring to the syntax

———————————————————————————————————————
Connecting to a MySQL Server
Lots of issues and had to install an old version of MySQL Workbench..
———————————————————————————————————————

* Schemas lets you see all the databases
* The lightning bolt runs all of your queries — the bolt with a 1 runs 1
* We would use CLI for a SQL query to confirm filepath and database structure // pretty much only for that

Working in SQL

* —  == represents a single-line comment (must have the space) *double line*
    * you do not have to close one-line comments
* /* to show table in upper area */
* */ actually closes the code
* ; ends the query
    * without it, your code will break
* checking to make sure you get the green check mark
* be specific with double quote and single quote
* databases are CASE-SENSITIVE, commands are not

To get into a database:
    * use <database name>;
    * select database();
        * run one after the other to verify what database you are in (safeguard)
        * doesn’t run from top to bottom! 

To see how a database was created:
* show create <database_name>;
    * code gets specific when creating new tables
        * we are going to be pulling data from db’s not necessarily creating them

To see tables in a database:
* show tables;

To see the source code for tables:
* show create table source;

———————————————————————————————————————
Data Types in SQL
———————————————————————————————————————
Numerical Values
Integer: Whole numbers
* unsigned == all pos numbers
* signed == specify whether pos or neg numbers

Float and Double: Decimals
* double == doubles the amount of bytes that it takes (greater accuracy)
* Decimal == set length of decimal values

Boolean: (tinyint [bytes -128 - 128]) defaults to 0 or 1
* True or False == tinyint
    * true = 1
    * false = 0

Date, Time, and DateTime: specific date fields (temporal)
* yyyy-mm-dd is the best way to sort data in chronological order
* HH:MM:SS

String Types
Char: 
* fixed length
* letters, only 2, like a state abbrev

Varchar:
* variable length

Text: don’t use them if you don’t need them (takes up a lot of memory)
* advisable for large blocks of text over 255 char instead of VARCHAR

Null: behaves like a 0
* the absence of value
* can lead to inconsistent data
    * consider specifying in CREATE TABLE that DEFAULT NOT NULL
        * prevents null from being stored in a column leading to more predictable results

Primary Keys  ** every table needs a primary key **
— have to be unique for every single row
* must be unique
* no repeats
* no null
* can auto-assign
    * will start at 1
    * auto_increment
* the most common name is ID or index

———————————————————————————————————————
CREATE TABLE Syntax
———————————————————————————————————————
CREATE TABLE <table_name> (column_name1 datatype DEFAULT null, column_name 2 datatype DEFAULT null, column_name3 datatype DEFAULT not null PRIMARY KEY <column_name>);

EX: CREATE TABLE ‘authors’ (
	‘id’ int unsigned NOT NULL AUTO_INCREMENT,  <—PRIMARY KEY
	‘name’ char(255) DEFAULT NULL,
	‘birth_year’ int DEFAULT NULL,
	PRIMARY KEY (‘id’)
	);

CREATE TABLE quotes (
    author_first_name VARCHAR(50),
    author_last_name  VARCHAR(100) NOT NULL,
    content TEXT NOT NULL
	PRIMARY??
);

Exercise:
* employees db has more tables than albums_db
* the different data types present are string 
11. Which table(s) do you think contain a numeric type column? (Write this question and your answer in a comment): salaries
12. Which table(s) do you think contain a string type column?: departments, dept_emp, dept_manager, employees, and titles
13. Which table(s) do you think contain a date type column?: None
14. What is the relationship between the employees and the department’s tables?: employees table is a running list of all employees and the department table is a running list of all departments. the dept_emp table likely show what employees work in each department.
15. CREATE TABLE `dept_manager` (  `emp_no` int NOT NULL,  `dept_no` char(4) NOT NULL,  `from_date` date NOT NULL,  `to_date` date NOT NULL,  PRIMARY KEY (`emp_no`,`dept_no`),  KEY `dept_no` (`dept_no`),  CONSTRAINT `dept_manager_ibfk_1` FOREIGN KEY (`emp_no`) REFERENCES `employees` (`emp_no`) ON DELETE CASCADE ON UPDATE RESTRICT, CONSTRAINT `dept_manager_ibfk_2` FOREIGN KEY (`dept_no`) REFERENCES `departments` (`dept_no`) ON DELETE CASCADE ON UPDATE RESTRICT) ENGINE=InnoDB DEFAULT CHARSET=latin1

describe <tabe_name>; to preview the table you just created; an easy way to find the primary keys
* doesn’t give as much description as show create table

alter table <table_name>; to add items to the table

———————————————————————————————————————
Basic Statements of writing a SQL Query
———————————————————————————————————————
SELECT [the columns we want]
FROM [where we are getting the data from (the table)]
WHERE [how to filter that data]

Select:
* can use as a standalone
    * SELECT what;
        * select ‘hello world’
            * prints hello world
        * select 2+2; 
            * prints 4

From:
Show tables; [to get table name]

To pull back data from a table:
* select *
* from fruits
* ;
    * prints everything in fruits table

— SQL does not care about whitespace and order in the select statement doesn’t matter either — 

We can specify what columns we want…
    * have to know the names of the columns
* select id, name from fruits;

Where:
* used to filter rows
    * SELECT * FROM [table] WHERE [condition]
* select *
* from fruits
* where name = ‘apple’
    * apple is a string so it has to be in quotes

OPERATORS:
= equals
!=, <> does not equal
<, > less than, greater than
<=, >= “ “ or equal too
BETWEEN and including || values between two values; literal english

Renaming columns: 
* select id, name, quantity as inventory, order…

SELECT DISTINCT [column_name]















