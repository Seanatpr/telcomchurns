library(yaml)
library(tidyverse)



# Directories --------------------------------------------------------------
.FILE_NAME_PRJ_CFG <- 'project.cfg'
prjCfg <- tryCatch(read_yaml(.FILE_NAME_PRJ_CFG),
                   error=function(e) NULL)
stopifnot(!is.null(prjCfg))

DIR_PRJBASE <- prjCfg$project$root_dir
DIR_SCRIPT <- file.path(DIR_PRJBASE, prjCfg$project$script_dir)

DIR_INPUT <- file.path(DIR_PRJBASE, prjCfg$project$input_dir)
DIR_MIDPUT <- file.path(DIR_PRJBASE, prjCfg$project$midput_dir)
DIR_OUTPUT <- file.path(DIR_PRJBASE, prjCfg$project$output_dir)
DIR_DOCPUT <- file.path(DIR_PRJBASE, prjCfg$project$docputput_dir)

rm(prjCfg)


setwd(DIR_PRJBASE)


# Files --------------------------------------------------------------
FILE_DATA_RAW <- file.path(DIR_INPUT, 'churn.csv')

FILE_DATA_CHECKPOINT_0 <- file.path(DIR_MIDPUT, 'churn_0.Rda')