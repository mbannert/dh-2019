## Notes / Take Aways

- R is NOT R Studio
- make your self familiar with your Operating System and how and where it stores files. Understand the folder structure of a computer and where downloaded data are stored.
- Work with R Studio projects (.Rproj) to avoid hardcoded, absolute references.
- Approach to new, unknown datasets
	- Verify that data have been read in correctly (summary, head, tail, str, etc.) and correct when necessary
	- create discriptive statistics and spot variance in the dataset. 
	- visualize data (remember the dataSaurus !)
	- choose further methods based on your research questions and what you have learned from the initial analysis. 



## Task 1 APIs and Basic Transformation

Hint: Load the dplyr library, to make life a little more convenient
and allow for piping. You won't need it for every task though. 

1. Use the {gutenbergr} package to find Daniel Defoe's Text 
"An Essay Upon Projects"

2. Download the full text of the Essay and store it to a textfile. Hint: Use the cat() function to do so.

3. How many lines does the text document have?


## Task 2 Basic Text Analysis 

4. Create a {quanteda} corpus from Defoe's text and use the corpus to create a basic wordcloud. You may want to use the {readtext} package to read Defoe's essay back in. Another option would be to simply transform the result you received through the {gutenbergr} package into a full text inside your R session

5. Use the {gutenbergr} package to get 2 Jane Austen books, create wordclouds for both books from {quanteda} corpus and compare both clouds. 

6. What other textplot functions are available from the {quanteda} package?
Create at least one other textplot.

7. What other options does the {quanteda} package offer to compare two texts? 

8. Create different n-grams from one of the texts you have loaded into your R session. 


## Task 3 Basic Data Processing and Visualization


6. Use the gutenberg_authors dataset from the {gutenbergr} project.
 When were authors born? Find a proper way to visualize the distribution.

7. How old did authors get? Filter observations that cause problems when necessary. 
Hint: Use mutate from the {dplyr} package to add age of authors to the data. Should the dataset be split, e.g., by centuries / ages? 


## Task 4 Maps 

8. Use the .geoJSON file from the course and the {leaflet} package to create a choropleth for Swiss FSO regions. Search online for data available on FSO regions level. Map this information to the spatial information.

Hint: Look up the code from the session on visualization. 

9. Embed the file you create to an R Markdown document (.Rmd) and render (knit) it to HTML. 














