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

# initialize/create empty array/vector to write results into later
animals_count <- c()

# loop through rows of table/matrix
for (row_person in seq_len(nrow(data_animals))) {

    # set initial value of row/person to 0
    # because the default value would be NULL
    # and incrementing NULL would be impossible
    animals_count[row_person] <- 0

    # loop through columns of current row
    for (column_animal in seq_len(ncol(data_animals))) {

        # if field/element is not empty
        if (!is.na(data_animals[row_person, column_animal])) {
            # print each animal to console
            # print(data_animals[row_person, column_animal])

            # increment animals_count of current row/person
            animals_count[row_person] <- animals_count[row_person] + 1
        }
    }
}

# add column "Anzahl_Tiere" to data_animals variable
# with the solution array/vector animals_count
data_animals["Anzahl_Tiere"] <- animals_count

# print result
print(data_animals)
View(data_animals)
