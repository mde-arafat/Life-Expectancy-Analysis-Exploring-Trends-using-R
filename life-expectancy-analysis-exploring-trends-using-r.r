{
 "cells": [
  {
   "cell_type": "code",
   "execution_count": 1,
   "id": "3166278c",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-04-22T14:09:38.136516Z",
     "iopub.status.busy": "2024-04-22T14:09:38.134240Z",
     "iopub.status.idle": "2024-04-22T14:09:39.318682Z",
     "shell.execute_reply": "2024-04-22T14:09:39.316724Z"
    },
    "papermill": {
     "duration": 1.191869,
     "end_time": "2024-04-22T14:09:39.321318",
     "exception": false,
     "start_time": "2024-04-22T14:09:38.129449",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "── \u001b[1mAttaching core tidyverse packages\u001b[22m ──────────────────────── tidyverse 2.0.0 ──\n",
      "\u001b[32m✔\u001b[39m \u001b[34mdplyr    \u001b[39m 1.1.4     \u001b[32m✔\u001b[39m \u001b[34mreadr    \u001b[39m 2.1.4\n",
      "\u001b[32m✔\u001b[39m \u001b[34mforcats  \u001b[39m 1.0.0     \u001b[32m✔\u001b[39m \u001b[34mstringr  \u001b[39m 1.5.1\n",
      "\u001b[32m✔\u001b[39m \u001b[34mggplot2  \u001b[39m 3.4.4     \u001b[32m✔\u001b[39m \u001b[34mtibble   \u001b[39m 3.2.1\n",
      "\u001b[32m✔\u001b[39m \u001b[34mlubridate\u001b[39m 1.9.3     \u001b[32m✔\u001b[39m \u001b[34mtidyr    \u001b[39m 1.3.0\n",
      "\u001b[32m✔\u001b[39m \u001b[34mpurrr    \u001b[39m 1.0.2     \n",
      "── \u001b[1mConflicts\u001b[22m ────────────────────────────────────────── tidyverse_conflicts() ──\n",
      "\u001b[31m✖\u001b[39m \u001b[34mdplyr\u001b[39m::\u001b[32mfilter()\u001b[39m masks \u001b[34mstats\u001b[39m::filter()\n",
      "\u001b[31m✖\u001b[39m \u001b[34mdplyr\u001b[39m::\u001b[32mlag()\u001b[39m    masks \u001b[34mstats\u001b[39m::lag()\n",
      "\u001b[36mℹ\u001b[39m Use the conflicted package (\u001b[3m\u001b[34m<http://conflicted.r-lib.org/>\u001b[39m\u001b[23m) to force all conflicts to become errors\n"
     ]
    }
   ],
   "source": [
    "# Setting Up the Notebook\n",
    "\n",
    "library(tidyverse)      # load core r packages"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 2,
   "id": "f60276fd",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-04-22T14:09:39.361021Z",
     "iopub.status.busy": "2024-04-22T14:09:39.327872Z",
     "iopub.status.idle": "2024-04-22T14:09:39.394190Z",
     "shell.execute_reply": "2024-04-22T14:09:39.392216Z"
    },
    "papermill": {
     "duration": 0.073174,
     "end_time": "2024-04-22T14:09:39.396865",
     "exception": false,
     "start_time": "2024-04-22T14:09:39.323691",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": [
    "# Importing the Data\n",
    "life_expectancy_data <- read.csv(\"/kaggle/input/life-expectancy-at-birth-across-the-globe/Life Expectancy at Birth.csv\")"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 3,
   "id": "36eb82e2",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-04-22T14:09:39.404861Z",
     "iopub.status.busy": "2024-04-22T14:09:39.403229Z",
     "iopub.status.idle": "2024-04-22T14:09:39.469007Z",
     "shell.execute_reply": "2024-04-22T14:09:39.467152Z"
    },
    "papermill": {
     "duration": 0.072513,
     "end_time": "2024-04-22T14:09:39.471607",
     "exception": false,
     "start_time": "2024-04-22T14:09:39.399094",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A data.frame: 4 × 39</caption>\n",
       "<thead>\n",
       "\t<tr><th></th><th scope=col>ISO3</th><th scope=col>Country</th><th scope=col>Continent</th><th scope=col>Hemisphere</th><th scope=col>Human.Development.Groups</th><th scope=col>UNDP.Developing.Regions</th><th scope=col>HDI.Rank..2021.</th><th scope=col>Life.Expectancy.at.Birth..1990.</th><th scope=col>Life.Expectancy.at.Birth..1991.</th><th scope=col>Life.Expectancy.at.Birth..1992.</th><th scope=col>⋯</th><th scope=col>Life.Expectancy.at.Birth..2012.</th><th scope=col>Life.Expectancy.at.Birth..2013.</th><th scope=col>Life.Expectancy.at.Birth..2014.</th><th scope=col>Life.Expectancy.at.Birth..2015.</th><th scope=col>Life.Expectancy.at.Birth..2016.</th><th scope=col>Life.Expectancy.at.Birth..2017.</th><th scope=col>Life.Expectancy.at.Birth..2018.</th><th scope=col>Life.Expectancy.at.Birth..2019.</th><th scope=col>Life.Expectancy.at.Birth..2020.</th><th scope=col>Life.Expectancy.at.Birth..2021.</th></tr>\n",
       "\t<tr><th></th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>⋯</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><th scope=row>1</th><td>AFG</td><td>Afghanistan</td><td>Asia  </td><td>Northern Hemisphere</td><td>Low      </td><td>SA </td><td>180</td><td>45.9672</td><td>46.6631</td><td>47.5955</td><td>⋯</td><td>61.9230</td><td>62.4167</td><td>62.5451</td><td>62.6587</td><td>63.1361</td><td>63.0160</td><td>63.0810</td><td>63.5645</td><td>62.5751</td><td>61.9824</td></tr>\n",
       "\t<tr><th scope=row>2</th><td>AGO</td><td>Angola     </td><td>Africa</td><td>Southern Hemisphere</td><td>Medium   </td><td>SSA</td><td>148</td><td>41.8933</td><td>43.8127</td><td>42.2088</td><td>⋯</td><td>58.6231</td><td>59.3074</td><td>60.0397</td><td>60.6546</td><td>61.0923</td><td>61.6798</td><td>62.1438</td><td>62.4484</td><td>62.2612</td><td>61.6434</td></tr>\n",
       "\t<tr><th scope=row>3</th><td>ALB</td><td>Albania    </td><td>Europe</td><td>Northern Hemisphere</td><td>High     </td><td>ECA</td><td> 67</td><td>73.1439</td><td>73.3776</td><td>73.7148</td><td>⋯</td><td>78.0640</td><td>78.1226</td><td>78.4075</td><td>78.6441</td><td>78.8602</td><td>79.0473</td><td>79.1838</td><td>79.2825</td><td>76.9893</td><td>76.4626</td></tr>\n",
       "\t<tr><th scope=row>4</th><td>AND</td><td>Andorra    </td><td>Europe</td><td>Northern Hemisphere</td><td>Very High</td><td>   </td><td> 40</td><td>78.4063</td><td>77.9805</td><td>80.3241</td><td>⋯</td><td>82.9166</td><td>82.9343</td><td>82.9483</td><td>82.9534</td><td>82.9671</td><td>82.9803</td><td>82.9923</td><td>83.0039</td><td>79.0234</td><td>80.3684</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A data.frame: 4 × 39\n",
       "\\begin{tabular}{r|lllllllllllllllllllll}\n",
       "  & ISO3 & Country & Continent & Hemisphere & Human.Development.Groups & UNDP.Developing.Regions & HDI.Rank..2021. & Life.Expectancy.at.Birth..1990. & Life.Expectancy.at.Birth..1991. & Life.Expectancy.at.Birth..1992. & ⋯ & Life.Expectancy.at.Birth..2012. & Life.Expectancy.at.Birth..2013. & Life.Expectancy.at.Birth..2014. & Life.Expectancy.at.Birth..2015. & Life.Expectancy.at.Birth..2016. & Life.Expectancy.at.Birth..2017. & Life.Expectancy.at.Birth..2018. & Life.Expectancy.at.Birth..2019. & Life.Expectancy.at.Birth..2020. & Life.Expectancy.at.Birth..2021.\\\\\n",
       "  & <chr> & <chr> & <chr> & <chr> & <chr> & <chr> & <int> & <dbl> & <dbl> & <dbl> & ⋯ & <dbl> & <dbl> & <dbl> & <dbl> & <dbl> & <dbl> & <dbl> & <dbl> & <dbl> & <dbl>\\\\\n",
       "\\hline\n",
       "\t1 & AFG & Afghanistan & Asia   & Northern Hemisphere & Low       & SA  & 180 & 45.9672 & 46.6631 & 47.5955 & ⋯ & 61.9230 & 62.4167 & 62.5451 & 62.6587 & 63.1361 & 63.0160 & 63.0810 & 63.5645 & 62.5751 & 61.9824\\\\\n",
       "\t2 & AGO & Angola      & Africa & Southern Hemisphere & Medium    & SSA & 148 & 41.8933 & 43.8127 & 42.2088 & ⋯ & 58.6231 & 59.3074 & 60.0397 & 60.6546 & 61.0923 & 61.6798 & 62.1438 & 62.4484 & 62.2612 & 61.6434\\\\\n",
       "\t3 & ALB & Albania     & Europe & Northern Hemisphere & High      & ECA &  67 & 73.1439 & 73.3776 & 73.7148 & ⋯ & 78.0640 & 78.1226 & 78.4075 & 78.6441 & 78.8602 & 79.0473 & 79.1838 & 79.2825 & 76.9893 & 76.4626\\\\\n",
       "\t4 & AND & Andorra     & Europe & Northern Hemisphere & Very High &     &  40 & 78.4063 & 77.9805 & 80.3241 & ⋯ & 82.9166 & 82.9343 & 82.9483 & 82.9534 & 82.9671 & 82.9803 & 82.9923 & 83.0039 & 79.0234 & 80.3684\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A data.frame: 4 × 39\n",
       "\n",
       "| <!--/--> | ISO3 &lt;chr&gt; | Country &lt;chr&gt; | Continent &lt;chr&gt; | Hemisphere &lt;chr&gt; | Human.Development.Groups &lt;chr&gt; | UNDP.Developing.Regions &lt;chr&gt; | HDI.Rank..2021. &lt;int&gt; | Life.Expectancy.at.Birth..1990. &lt;dbl&gt; | Life.Expectancy.at.Birth..1991. &lt;dbl&gt; | Life.Expectancy.at.Birth..1992. &lt;dbl&gt; | ⋯ ⋯ | Life.Expectancy.at.Birth..2012. &lt;dbl&gt; | Life.Expectancy.at.Birth..2013. &lt;dbl&gt; | Life.Expectancy.at.Birth..2014. &lt;dbl&gt; | Life.Expectancy.at.Birth..2015. &lt;dbl&gt; | Life.Expectancy.at.Birth..2016. &lt;dbl&gt; | Life.Expectancy.at.Birth..2017. &lt;dbl&gt; | Life.Expectancy.at.Birth..2018. &lt;dbl&gt; | Life.Expectancy.at.Birth..2019. &lt;dbl&gt; | Life.Expectancy.at.Birth..2020. &lt;dbl&gt; | Life.Expectancy.at.Birth..2021. &lt;dbl&gt; |\n",
       "|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|\n",
       "| 1 | AFG | Afghanistan | Asia   | Northern Hemisphere | Low       | SA  | 180 | 45.9672 | 46.6631 | 47.5955 | ⋯ | 61.9230 | 62.4167 | 62.5451 | 62.6587 | 63.1361 | 63.0160 | 63.0810 | 63.5645 | 62.5751 | 61.9824 |\n",
       "| 2 | AGO | Angola      | Africa | Southern Hemisphere | Medium    | SSA | 148 | 41.8933 | 43.8127 | 42.2088 | ⋯ | 58.6231 | 59.3074 | 60.0397 | 60.6546 | 61.0923 | 61.6798 | 62.1438 | 62.4484 | 62.2612 | 61.6434 |\n",
       "| 3 | ALB | Albania     | Europe | Northern Hemisphere | High      | ECA |  67 | 73.1439 | 73.3776 | 73.7148 | ⋯ | 78.0640 | 78.1226 | 78.4075 | 78.6441 | 78.8602 | 79.0473 | 79.1838 | 79.2825 | 76.9893 | 76.4626 |\n",
       "| 4 | AND | Andorra     | Europe | Northern Hemisphere | Very High | <!----> |  40 | 78.4063 | 77.9805 | 80.3241 | ⋯ | 82.9166 | 82.9343 | 82.9483 | 82.9534 | 82.9671 | 82.9803 | 82.9923 | 83.0039 | 79.0234 | 80.3684 |\n",
       "\n"
      ],
      "text/plain": [
       "  ISO3 Country     Continent Hemisphere          Human.Development.Groups\n",
       "1 AFG  Afghanistan Asia      Northern Hemisphere Low                     \n",
       "2 AGO  Angola      Africa    Southern Hemisphere Medium                  \n",
       "3 ALB  Albania     Europe    Northern Hemisphere High                    \n",
       "4 AND  Andorra     Europe    Northern Hemisphere Very High               \n",
       "  UNDP.Developing.Regions HDI.Rank..2021. Life.Expectancy.at.Birth..1990.\n",
       "1 SA                      180             45.9672                        \n",
       "2 SSA                     148             41.8933                        \n",
       "3 ECA                      67             73.1439                        \n",
       "4                          40             78.4063                        \n",
       "  Life.Expectancy.at.Birth..1991. Life.Expectancy.at.Birth..1992. ⋯\n",
       "1 46.6631                         47.5955                         ⋯\n",
       "2 43.8127                         42.2088                         ⋯\n",
       "3 73.3776                         73.7148                         ⋯\n",
       "4 77.9805                         80.3241                         ⋯\n",
       "  Life.Expectancy.at.Birth..2012. Life.Expectancy.at.Birth..2013.\n",
       "1 61.9230                         62.4167                        \n",
       "2 58.6231                         59.3074                        \n",
       "3 78.0640                         78.1226                        \n",
       "4 82.9166                         82.9343                        \n",
       "  Life.Expectancy.at.Birth..2014. Life.Expectancy.at.Birth..2015.\n",
       "1 62.5451                         62.6587                        \n",
       "2 60.0397                         60.6546                        \n",
       "3 78.4075                         78.6441                        \n",
       "4 82.9483                         82.9534                        \n",
       "  Life.Expectancy.at.Birth..2016. Life.Expectancy.at.Birth..2017.\n",
       "1 63.1361                         63.0160                        \n",
       "2 61.0923                         61.6798                        \n",
       "3 78.8602                         79.0473                        \n",
       "4 82.9671                         82.9803                        \n",
       "  Life.Expectancy.at.Birth..2018. Life.Expectancy.at.Birth..2019.\n",
       "1 63.0810                         63.5645                        \n",
       "2 62.1438                         62.4484                        \n",
       "3 79.1838                         79.2825                        \n",
       "4 82.9923                         83.0039                        \n",
       "  Life.Expectancy.at.Birth..2020. Life.Expectancy.at.Birth..2021.\n",
       "1 62.5751                         61.9824                        \n",
       "2 62.2612                         61.6434                        \n",
       "3 76.9893                         76.4626                        \n",
       "4 79.0234                         80.3684                        "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "# Data Exploration\n",
    "head(life_expectancy_data, 4)"
   ]
  }
 ],
 "metadata": {
  "kaggle": {
   "accelerator": "none",
   "dataSources": [
    {
     "datasetId": 3652643,
     "sourceId": 6343893,
     "sourceType": "datasetVersion"
    }
   ],
   "dockerImageVersionId": 30618,
   "isGpuEnabled": false,
   "isInternetEnabled": true,
   "language": "r",
   "sourceType": "notebook"
  },
  "kernelspec": {
   "display_name": "R",
   "language": "R",
   "name": "ir"
  },
  "language_info": {
   "codemirror_mode": "r",
   "file_extension": ".r",
   "mimetype": "text/x-r-source",
   "name": "R",
   "pygments_lexer": "r",
   "version": "4.0.5"
  },
  "papermill": {
   "default_parameters": {},
   "duration": 4.987024,
   "end_time": "2024-04-22T14:09:39.595188",
   "environment_variables": {},
   "exception": null,
   "input_path": "__notebook__.ipynb",
   "output_path": "__notebook__.ipynb",
   "parameters": {},
   "start_time": "2024-04-22T14:09:34.608164",
   "version": "2.5.0"
  }
 },
 "nbformat": 4,
 "nbformat_minor": 5
}
