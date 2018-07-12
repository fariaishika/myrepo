
## Dataframes:

## Dataframes aren't that much different from vectors - in fact they actually look like
## 2D vectors. Each of the rows looks like a vector, and each of the columns also looks
## like a vector. And you can pull out rows, columns, and even indivudal values much like
## you could with vectors:

## The difference is that dataframes use a comma in the middle of the brackets to 
## separate rows and columns. Stuff to the left of the comma deals with rows, and stuff
## to the right deals with columns:

## Here lets start looking at the gene expression dataset. This next line pulls out 
## only the first row (which is the values for all of the samples for just the 1 gene)
expression_data[1,]

## This line on the other hand, because it is right of the comma, pulls out all the row
## values for the first through fifth column: 
expression_data[,1:5]

## Of course you can then combine stuff to the left and right of the comma to pull out 
## individual values. If you wanted to pull out the value from the 4th row and the seventh
## column, you could type:
expression_data[4,7]

## Of course you can also pull out individual row and column data by the names of the
## rows and columns:
expression_data[,'TCGA-44-3398-01A-01R-1107-07']
expression_data['ENSG00000000003',]

## Of course with a dataframe like this, it can get kind of boring to type out the entire 
## row or column names. Fortunately you can just make the computer do that for you
## with what you just learned earlier.

## Remember you can use the colnames function to save all of the column names as a vector
column_names <- colnames(expression_data)

## You can also do the same using the rownames() function for the rownames:
row_names <- rownames(expression_data)

## Now rather than typing out the whole name for a given row/sample, you can just
## Use it's corresponding number in the column/row vectors:
expression_data[,column_names[1]]
expression_data[row_names[1],]

## Of course this is kind of dumb right now, because this is really just the same as 
## doing this for this problem:
expression_data[,1]
expression_Data[1,]

## As you can see there are often multiple solutions to solving a problem with coding.
## some of them require more work than others however.

## Now to the good part. Since you've seen we can pull out parts of the data frame 
## by rows and columns, let's seperate expression_data into two new data frames.
## tumor_data and normal_data will have all the same rows as expression_data, but will
## only contain the columns for tumor and normal samples, respectively:

## Remember you could identify if a sample was a tumor or normal sample with the
## following few lines of code

column_name_portion <- substr(column_names,14,15)
numeric_column_name_portion <- as.numeric(column_name_portion)
tumor_normal <- ifelse(column_name_portion<10, 'tumor', 'normal')
## So lets use that to identify the number of the the samples are tumor and normal
which_tumor <- which(tumor_normal=='tumor')
which_normal <- which(tumor_normal=='normal')

## Now as you can see here all of the resulting values are either tumor or normal samples
column_names[which_tumor]
column_names[which_normal]

## Thus you can then extract just the columns that are tumor or normal, and assign
## them to new data frames:

## This works
normal_samples <- expression_data[,column_names[which_normal]]
tumor_samples<- expression_data[,column_names[which_tumor]]

## But this also works (since you can subset based on name or number!). See
## THat these look the same as the ones above!

normal_samples_by_number <- expression_data[,which_normal]


tumor_samples_by_number <- expression_data[,which_tumor]


## Now this is just to show something. You remember I said that stuff to the left
## of the comma in data frame brackets deals with rows and stuff to the right deals with
## columns? Well technically if you are dealing with columns you can just ignore the
## comma. Without a comma R just assumes you are working with columns and not rows:

## These are the same!
test_A <- expression_data[,1:5]
test_B <- expression_data[1:5]

## In general though, I would encourage you to use the comma because it will help
## when you are learning to work with both rows and columns. 

## The one small exception is that when you are dealing with just a single column, things
## can get a little weird. Note the following:
test_C <- expression_data[1]
test_D <- expression_data[,1]

is.data.frame(test_C)
is.data.frame(test_D)
is.vector(test_D)

## Uh oh! These don't work the same, here including the comma turned test_D into a vector
## while test_C is a dataframe with just 1 column. This is important because now they 
## work differently:
test_C[1]
test_D[1]

 # Finding the mean of normal and tumor samples and then assigning them to a variable :
apply( normal_samples, rows, mean)

normal_mean <- apply( normal_samples, rows, mean)

normal_mean

# Now find the mean of tumor and assign it to tumor_mean :

apply( tumor_samples, rows, mean)

tumor_mean <- apply( normal_samples, rows, mean)

tumor_mean


  