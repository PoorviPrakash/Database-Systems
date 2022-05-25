After running the Linear Regression model on our Boston Housing Dataset, we get the following Equation - 

CLASS = -0.1084 * CRIM + 0.0458 * ZN + 2.7187 * CHAS=1 + (-17.376 * NOX) + 3.8016 * RM + (-1.4927 * DIS) + 0.2996 * RAD + (-0.0118 * TAX) + (-0.9465 * PTRATIO) + 0.0093 * B + (-0.5226 * LSTAT) + 36.3411

Our equation in total has 12 terms, out of which 11 terms are dependent on the attributes and the final term is weight W0 of value 36.3411. Weight w0 is also called as the intercept.

As seen from our equation, the multiple linear regression equation takes the form - 

Y = w0 + w1X1 + w2X2 + w3X3 + ...... + wpXp

Y is the predicted value of the dependent variable, X1 through Xp are p distinct independent or predictor variables. w0 is the value of Y when all the other independent variables are zero. w1 to wp are the regression coefficients. Each regression coefficient represents the change in Y relative to a one unit change in the respective independent variable.   

We have to find the best fitting line that minimizes the error. 

Weka's regression model uses M5 as the attribute selection method and the Akaike criterion for model selection (based on the official Weka LinearRegression documentation). Initially the model is built using all the attributes. Through several iterations, the attributes with the smallest regression coefficients are removed one-by-one until no further improvements can be seen in the average prediction error. Thus we end up with the above equation with attributes INDUS, CHAS=0 and AGE not being part of the equation.

By looking at our equation we can see that RM has a high regression coefficient indicating that each 1 unit of increase in RM results in almost 3 unit increase in the median house value. We know that if all the other factors are constant then if the number of rooms of one house is more than the other, the first house will have higher median value. Thus high positive coefficient. 

Similarly, NOX has a high negative coefficient indicating that the house is in an hazardeous area and which every 1 unit increase of the NOX value, the value of the house drops by 17 units.  


We can also note that other attributes like - 
(i) CRIM (Crime Rate) - If an area has higher crime rate, it's unsafe so the value of the house goes down.
(ii) DIS (Distance from business centre) - If a house is in an area away from business centres, the value of the land goes down, thus the house value is down as well.
(iii) PTRATIO (Pupil teacher Ration) - If the house has a high pupil teacher ratio, it suggests that the area has underfunded schools and is not in the elite school destrict, thus the price does down.
(iii) TAX (TAXATION) - If an area has high property tax value, then it is not desirable thus the house price goes down
(v) LSTAT (Lower Status of population) - An area has high LSTAT value(that is half the adults in the area don't have high school education and proportion of male worked are classifies as laborers - according to the dataset documentation Table IV by Harrison and Rubin (1978)). These populations would not be in high priced areas and luxuries homes, thus pulling the house prices down.

All of these attributes infact have negative coefficients in our equation, thus re-establishing our above claims. 