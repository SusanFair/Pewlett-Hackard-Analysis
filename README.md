# Pewlett-Hackard-Analysis
# Silver Tsunami Mitigation Analysis
As wIth any large company blessed with longevity in the industry, Pewlett-Hackard will soon be expiencing a once in a lifetime event.  Baby Boomers are quickly approaching retirement age.  As the name in the title suggests this represents a large portion of the population retiring within a short period of time - a Silver Tsunami.

As a good corporate citizen PH is offering  a retirement package. That's good however PH must also think about maintaining continuity when these packages are accepted and various roles within the company as left vacant in their wake.

## Overview of the analysis: 
This analysis is a proactive review of the impacts of this silver tsunami / wave of retirements.  We looked at the retiring population from two perspectives:
  * Who, what roles will be impacted?
  * How many positions will need to be filled?

Arming Human Resources with this information will allow them to start job searches, recruiting, internal training and mentoring in advance.

### Stepping in with big data
To facilitate this analysis, current records will be uploaded into a newly designed SQL database providing more effecient data mining, retrieval and presentation.

## Results:

 The results give a clear picture of who will be retiring and what opportunities does HR have to mitigate the impact from within. 

*  **Number of retiring staff by Title - Cause for Concern**
This analysis provided results on employees born between 1952 and 1955 returning their names and most recent/current job titles.   The highest volume of those close to retirement are our Senior Engineers.  This is followed closely by Senior staff in general.  

![By Title](https://github.com/SusanFair/Pewlett-Hackard-Analysis/blob/main/Resources/retiring_titles_chart.PNG)

* **Number of retire staff by Title - Silver Lining**
Conversly Assistant Engineers and Managers represent the fewest number of employees which means that stability at the working level will remain consistent through the retirement tsunami transition.

* **Secure the Future Through Mentorship - Another Silver Lining**
 The analysis shows that those who have a good amount of experience and yet are at least 10 years away from retirement are the represent over 500 staff members.  

* **Secure the Technical Future**
Assistent Engineers numbers are high in the 10+ years from retirement age.  



## Summary: 
As noted in the results our analysis provides a clear picture of who will be retiring soon and some great opportunities to mitigate the result.

### How many roles will need to be filled as the "silver tsunami" begins to make an impact?

The results here show something alarming.  With highest volume of those close to retirement being out Senior Engineers and Senior staff this will be a big hit to the direction of the company if plans are not put in place. Finding the right people for these roles will be pivotol to the companies continued success.

The silver lining is that conversly where the rubber hits the road there are siginificantly fewer staff in these roles approaching retirement age.  Assistant Engineers and Managers represent the fewest number of employees which means that stability at the working level will remain consistent through the retirement tsunami transition.


### Are there enough qualified, retirement-ready employees in the departments to mentor the next generation of Pewlett Hackard employees?

With so many Senior Staff members retiring the future direction of the company is at stake.  HR has good resources to work with though.  The analysis shows that those who have a good amount of experience and yet are at least 10 years away from retirement are the represent over 1200 staff members in Senior staff and Engineering roles.  This is certainly something to work with.  

Engineers numbers are high in that group.  A mentorship campaign in the engineering community to share information between the Senior Engineers and the Engineers will allow those in other Engineering roles to be ready to step up and fill the vacant roles when the time comes.  All of this without loosing technical continuity.  Also a key for success in a company like Pewlett-Hackard.

### Additional Queries
In providing the mentorship assessment above an additional query was performed. Using a similar query as was used to gather the unique titles for those ready to retire. We ran a unique titles query on the complete list of those elibible for mentorship.  To drill down we also ran a query to gain a count of the people per each title.  This provided a clear table.  The table was used to provide a color chart that would easily convey the findings.

![Mentorship](https://github.com/SusanFair/Pewlett-Hackard-Analysis/blob/main/Resources/mentorship_eligibility.PNG)

Another aspect of the equation is salaries.  A query to join the retirement_titles with salaries.csv on the emp_no returns some interesting information.  Since those retiring represent alot of senior staff, it also represents a significant $ value in salaries.  

![Retirement Salaries](https://github.com/SusanFair/Pewlett-Hackard-Analysis/blob/main/Resources/mentorship_eligibility_table.PNG)

![Role count and salary sum](https://github.com/SusanFair/Pewlett-Hackard-Analysis/blob/main/Resources/retirement_salaries.PNG)

A further query would then be to compare the roles retiring by salary vs those ready for mentorship by salary.  From a business perspective this main be a gain on expenditures after all.