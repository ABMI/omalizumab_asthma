library(omz12061)

# Optional: specify where the temporary files (used by the Andromeda package) will be created:
options(fftempdir = "C:/Users/hihip/OneDrive - Ajou University/important/study/이카루스OMZ/omz12061_remission/temp")

# Maximum number of cores to be used:
maxCores <- parallel::detectCores()

# The folder where the study intermediate and result files will be written:
outputFolder <- "C:/Users/hihip/OneDrive - Ajou University/important/study/이카루스OMZ/omz12061_remission/output"


# Details for connecting to the server:

connectionDetails <- DatabaseConnector::createConnectionDetails(dbms = "sql server",
                                                                server = '10.5.99.50',
                                                                user = 'hihipch',
                                                                password = 'pch12031203!',
                                                                pathToDriver = '/home/hihipch/jdbc')
conn <- DatabaseConnector::connect(connectionDetails)

# The name of the database schema where the CDM data can be found:
cdmDatabaseSchema <- "CDMPv535_ABMI.dbo"

# The name of the database schema and table where the study-specific cohorts will be instantiated:
cohortDatabaseSchema <- "cohortDb.dbo"
cohortTable <- 'omz12061'

# Some meta-information that will be used by the export function:
databaseId <- "CDMPv535_ABMI"
databaseName <- "CDMPv535_ABMI"
databaseDescription <- "CDMPv535_ABMI"

# For Oracle: define a schema that can be used to emulate temp tables:
oracleTempSchema <- NULL

execute(connectionDetails = connectionDetails,
        cdmDatabaseSchema = cdmDatabaseSchema,
        cohortDatabaseSchema = cohortDatabaseSchema,
        cohortTable = cohortTable,
        oracleTempSchema = oracleTempSchema,
        outputFolder = outputFolder,
        databaseId = databaseId,
        databaseName = databaseName,
        databaseDescription = databaseDescription,
        createCohorts = TRUE,
        synthesizePositiveControls = TRUE,
        runAnalyses = TRUE,
        packageResults = TRUE,
        maxCores = maxCores)

resultsZipFile <- file.path(outputFolder, "export", paste0("Results_", databaseId, ".zip"))
dataFolder <- file.path(outputFolder, "shinyData")

# You can inspect the results if you want:
prepareForEvidenceExplorer(resultsZipFile = resultsZipFile, dataFolder = dataFolder)
launchEvidenceExplorer(dataFolder = dataFolder, blind = FALSE, launch.browser = FALSE)

# Upload the results to the OHDSI SFTP server:
privateKeyFileName <- ""
userName <- ""
uploadResults(outputFolder, privateKeyFileName, userName)
