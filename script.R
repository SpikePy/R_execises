mail <- "max.mustermann@s2019.tu-chemnitz.de"
Anmerkungen <- FALSE


###[ Task 1 ]###################################################################

# import "readr" library (necessary to import data)
library(readr)

# import data from CSV file
animal <- read_delim(
    "animal_exp0.csv",
    delim = ";",
    escape_double = FALSE,
    locale = locale(decimal_mark = ","),
    trim_ws = TRUE
)


###[ Task 2 ]###################################################################

# create data frame (fundamental data structure of R to operate on)
# from imported data
data <- data.frame(animal)

# generate a data subset containing only the animals
data_animals <- subset(
    data,
    select = c(
        "Tier1",
        "Tier2",
        "Tier3",
        "Tier4",
        "Tier5",
        "Tier6",
        "Tier7",
        "Tier8",
        "Tier9"
    )
)

# count elements in subset of data_animals that are not empty per row 
# and store the result vector to new variable
animal_count_per_row <- rowSums(!is.na(data_animals))

# combine relevant data to solution
# by creating a copy of data_animals
solution_task_2 <- data_animals
# and adding animal_count_per_row to the solution matrix
solution_task_2["Anzahl_Tiere"] <- animal_count_per_row


###[ Task 3 ]###################################################################

### Hund_val_0 ~ Hund_fam_0

# create a linear model for the connection between valance and familiarity for dogs
liner_model_dog_val_fam <- lm(Hund_val_0 ~ Hund_fam_0,data = data)

# create a array/vector which imaginative values of familiarity
fam_test_data <- data.frame(Hund_fam_0=c(0,10,50,100))

# predict how much valence a person with the given familiarity would have
# via the linear model
predict(liner_model_dog_val_fam,newdata = fam_test_data)

### Hund_fam_0 ~ Hund_val

# create a linear model for the connection between valance and familiarity for dogs
liner_model_dog_fam_val <- lm(Hund_fam_0 ~ Hund_val_0,data = data)

# create a array/vector which imaginative values of valence
val_test_data <- data.frame(Hund_val_0=c(0,10,50,100))

# predict how much familiarity a person with the given valence would have
# via the linear model
predict(liner_model_dog_fam_val,newdata = val_test_data)
