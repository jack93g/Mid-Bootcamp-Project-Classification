
# **Midterm Project - Classification**


![CC Image](./Images/images.jpg
)


---

<!-- TABLE OF CONTENTS -->
<details open="open">
  <summary><h2 style="display: inline-block">Table of Contents</h2></summary>
  <ol>
    <li><a href="#repository-structure">Repository Structure</a></li>  
    <li>
      <a href="#about-the-project">About The Project</a>
      </ul>
    </li>
    <li><a href="#workflow">Workflow</a></li>
    <li><a href="#results">Results</a></li>
    <li><a href="#libraries">Libraries</a></li>
  </ol>
</details> 

---

<!-- Repository Structure -->
## **Repository Structure**  


`Deliverables` : contains all the data files that have been generated throughout the project.  
`Images`: contains all the images used in the project and some visualisations from Tableau.    
`Files`: contains the original CSV and Excel customer marketing data files.    


---
<!-- ABOUT THE PROJECT -->
## **About The Project**

This project was my first end to end project for the Ironhack data analytics bootcamp and involved using all the skills I have learned so far. We were provided with a dataset containing information about bank customers who were offered a credit card as part of a marketing campaign. The main objective of this project was to build a classification algorithm in python which would identify which customers accepted the credit card offer and which ones didn't. The dataset is highly imbalanced with around 94% of customers rejecting the offer and only 6% accepting it.  We also had to create a database of the credit card marketing data in MYSQL workbench, answer various questions about the dataset using SQL queries and then finally deepdive into the data further, creating visualisations and dashboards of our findings in Tableau.

---

<!-- Workflow -->
## **Workflow**

- Planned & implemented the project using agile project managment with a Kanban board on Github Projects.
- Created a database of the credit card marketing data in MYSQL workbench and analysed the data using SQL queries.
- Pulled the data into a pandas dataframe, carried out data cleaning and exploratory data analysis using seaborn, ploty and pandas libraries to create visualisations.
- Applied different classification machine learning algorithms including logistic regression, KNN & random forest to identify customers who accepted and rejected the credt card offer.
- Iterated on the models and used different sampling techniques such as oversampling to deal with the data imbalance.
- Analysed the results with metrics including precision & recall.
- Finally did a deepdive into the data in Tableau and created dashboards and visualisations to analyse the demographics of the customer base.




---

<!-- Results -->
## **Results**

Overall logistic regression with undersampling of the majority class or oversampling of the minority class provided the best results. Due to the large data imbalance a simple logistic regression model would return an accuracy score of around 0.94 but would not predict any of the minorty class correctly. With oversampling the minority class I managed to improve performance on the minority class and got a recall score of 0.75 as the model learned to better identify rows from the minority class.

### Some further findings

- Customers with low income were proportionally more likely to accept the credit card offer.

![Income](Images/Income_Level.png
)

- Customers with a low credit rating were more likely to accept the offer.

![Credit Score](Images/Credit_Rating.png
)

- Customers with 1 home were more likely to accept the offer.

![Own Home](Images/Homes_Owned.png
)


 - The level of average bank balancer per quarter does not correlate to either accepting or rejecting the credit card offer.

![Own Home](Images/Average_Balance.png
)








The Tableau file containing all the sheets and dashboards I created is available to view in the files folder.

---

<!-- Libraries -->
## **Libraries**

- [Pandas](https://pandas.pydata.org/docs/)
- [Numpy](https://numpy.org/)
- [Matplotlib](https://matplotlib.org/)
- [Seaborn](https://seaborn.pydata.org)
- [Scipy](https://www.scipy.org)
- [Sklearn](https://scikit-learn.org/stable/)
- [Plotly](https://plotly.com)
- [Imblearn](https://imbalanced-learn.org/stable/)
- [Statsmodels](https://www.statsmodels.org/stable/index.html)
- [SQLAlchemy](https://www.sqlalchemy.org)



