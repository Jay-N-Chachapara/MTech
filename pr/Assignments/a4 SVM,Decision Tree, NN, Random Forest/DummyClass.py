#!/usr/bin/env python
# coding: utf-8

# In[1]:


import pandas as pd
import numpy as np
from scipy import stats
from sklearn.model_selection import train_test_split
from sklearn import svm
from sklearn.metrics import classification_report
from sklearn.metrics import confusion_matrix
import matplotlib.pyplot as plt
from mlxtend.plotting import plot_confusion_matrix
from sklearn import tree
import graphviz 
from sklearn.ensemble import RandomForestClassifier
from sklearn.preprocessing import OrdinalEncoder
import warnings
from sklearn.decomposition import PCA
from sklearn.preprocessing import StandardScaler
from sklearn.neighbors import KNeighborsClassifier

warnings.filterwarnings('ignore')


# In[6]:

r, c = 8,8

def confusionMatrix(y_test,y_predict) :
    conf_matrix = confusion_matrix(y_true=y_test, y_pred=y_predict)
    fig, ax = plot_confusion_matrix(conf_mat=conf_matrix, figsize=(r,c), cmap=plt.cm.Greens)
    plt.xlabel('Predictions', fontsize=18)
    plt.ylabel('Actuals', fontsize=18)
    plt.title('Confusion Matrix', fontsize=18)
    plt.show()
def SVM(X_train,X_test,y_train,y_test) :
    classifier = svm.SVC(kernel='linear')
    classifier.fit(X_train,y_train)
    y_predict = classifier.predict(X_test)
    confusionMatrix(y_test,y_predict)
def DecisionTree(X_train,X_test,y_train,y_test) :
    clf = tree.DecisionTreeClassifier()
    clf.fit(X_train,y_train)
    y_predict = clf.predict(X_test)
    confusionMatrix(y_test,y_predict)
def NN(X_train,X_test,y_train,y_test) :
    neigh = KNeighborsClassifier(n_neighbors=3)
    neigh.fit(X_train, y_train)
    y_predict = neigh.predict(X_test)
    confusionMatrix(y_test,y_predict)
def RandomForest(X_train,X_test,y_train,y_test) :
    clf = RandomForestClassifier(max_depth=64,random_state=0)
    clf.fit(X_train,y_train)
    y_predict = clf.predict(X_test)
    confusionMatrix(y_test,y_predict)

def printConfusionMatrix(X,Y,row,col) :
    r, c = row, col
    encoder = OrdinalEncoder()
    X = encoder.fit_transform(X)
    Y = encoder.fit_transform(Y)
    X_train,X_test,y_train,y_test=train_test_split(X,Y,test_size=0.3,random_state=4)
    print('\033[1m' + '\n\nSVM' + '\033[0m')
    SVM(X_train,X_test,y_train,y_test)
    print('\033[1m' + '\n\nDecision Tree' + '\033[0m')
    DecisionTree(X_train,X_test,y_train,y_test)
    print('\033[1m' + '\n\nNearest Neighbour' + '\033[0m')
    NN(X_train,X_test,y_train,y_test)
    print('\033[1m' + '\n\nRandom Forest' + '\033[0m')
    RandomForest(X_train,X_test,y_train,y_test)


# In[ ]:




