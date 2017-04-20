# Quora---Duplicity-of-Pairs-of-Questions

How to run the code

1) Copy the folder Code in your system
2) Download the quora dataset from http://qim.ec.quoracdn.net/quora_duplicate_questions.tsv . Rename this as quora_dataset_csv.csv and save the file in the same folder.
3) Install below packages for proper execution of the code:
	a) Install scikit-learn
	b) Install stopwords
	c) Install pandas
	d) Install numpy
	e) Install matplotlib
4) The provided code file are ipython notebook files so you wont face much problem executing the code, apart from necessary installation of the python pacakages.
5) Go ahead and run the first file : text_processing_corpus.ipynb cell by cell. This will text process the corpus
6) Run the second file: cosine similarity vector space model_v4.ipynb. It will create a quora_dataset_modified_v2.csv file. It has an aditional column of Correlation.
7) Go ahead and run cosine similarity vector space model_final.ipynb cell by cell. This will give you accuracy of TF-IDF model.
8) Go ahead and run similarity.ipynb file. This will hit Microsoft's Text Analytics API and used to determine how similiar two questions are. I have used this to measure my algorithm performance alogside it. Ironically mine performed better :)
9) Go ahead and run sentiment_analysis.ipynb file. This will hit Microsoft's sentiment analyis api and will provide score for selected questions of quora_dataset_modified_v2
10) Above process would result in file quora_top_3000.csv. The main file that is now ready for experiments
11) Go ahead and run data_analysis_v3.R for getting the accuracy. Please note this requires installation of Rstudio software.
12) Happy Programming.
