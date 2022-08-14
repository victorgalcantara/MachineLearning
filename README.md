# MachineLearning
 
Welcome! This is some materials to study techniques of machine learning applied in social sciences.

Before all, I will register some important materials and initiatives in computational social sciences as [Banyuwangi](https://github.com/bwi45/Machine-Learning-and-Data-Science-in-Politics) did about Political Science.

#### Lectures
**2019** - [Mastering Metrics](https://youtu.be/WwW8y5dZs80), a nice course about econometrics with Angrist

#### Lab, Research Group, and People
+ **D-Lab** - The social science data lab at UC Berkeley: [Web](https://dlab.berkeley.edu/) | [GitHub](https://github.com/dlab-berkeley) | [Rochelle Terman, PhD](https://github.com/rochelleterman)
+ **IDSS: LobbyView & TradeLab** - Institute for Data, Systems, and Society (IDSS) at Massachusetts Institute of Technology: [Web](https://idss.mit.edu/) | [In Song Kim, PhD](http://web.mit.edu/insong/www/)

#### Books
+ **2018**. [Kosuke Imai - Quantitative Social Science: An Introduction - Princeton University Press](https://www.amazon.com/Quantitative-Social-Science-Kosuke-Imai/dp/0691175462)
+ **2015**. [Angrist;Pischke - Mastering Metrics - Princeton University Press](https://www.academia.edu/36488919/Mastering_Metrics_Angrist)

#### Packages

# Introduction
* What is learning?
* How machines learn?
- Big data and soft processing

Machine learning refers to a system capable of the autonomous acquisition of information to transform it in knowledge by processing with models and make decisions (inspired by Arthur Samuel definition in 1959 while at IBM).

We have three majors areas of machine learning: 
- Supervised learning (when data set includes labels/output) 
- Unsupervised learning (when data set does not include labels/output, and then create cluster that recognize groups)
- Semi-supervised learning (when data set have some labels/output).

We will start with unsupervised learning

## Recognizing Pattern: discover unknown structure in data
The objective of unsupervised learning is recognize pattern and discover unknown structure in data. We do this in three ways:
* Dimensionality reduction
* Clustering
* Association rules

## Principal Components Analysis (RPCA)
The objective is to recognize principal components from a data with many dimensions. Then, with principal components, we can reduct the dimensionality of data preserving the maximum of original variance.
