#Projects
#after projects


#test4<-ifelse(test3<10,'tumor','normal')

load("/Volumes/Untitled/Faria/TCGA_LUAD_truncated_expression_dataset.rda")


#Finding th expression_data:
column_names <- colnames(expression_data)
column_names



#nchar:
#It basically counts the character in a variablr, for exp:
nchar(column_names)
#28 for all of the data



#substr(column_names)
#^^This is to extract a specific variable from the column
substr(column_names, 14, 15)
a<-substr(column_names, 14, 15)
#Then I stored all the variables in the letter 'a'
#to turn all the characters into number i ran
as.numeric(a)



#Then figuered out if those numbers(columns) were tumor or normal cell by running 
test13<-ifelse(a<10,'tumor','normal')
#stored the result in test13
test13



#Counting vector
#To figure out the exact number of tumor and normal cells I ran
as.data.frame(table(test13))
# normal = 59
# tumor = 535



#Stored the result in a variable called 'celldata'
celldata <- as.data.frame(table(test13))




