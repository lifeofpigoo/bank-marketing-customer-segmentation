# Bank Marketing Customer Segmentation

Customer segmentation and term deposit marketing analysis using Logistic Regression, PCA, and K-Means clustering in R.

## Business Context

Bank marketing campaigns require significant resources, while only a relatively small proportion of contacted customers convert to term deposit subscribers.

This project analyzes customer and campaign characteristics associated with term deposit subscription and develops customer segments to support more targeted and efficient marketing strategies.

## Business Questions

1. Which customer and campaign characteristics are associated with term deposit subscription?
2. Can customers be grouped into meaningful segments for more targeted marketing strategies?

## Analytical Approach

The analysis follows the workflow below:

**Exploratory Data Analysis → Logistic Regression → One-Hot Encoding → PCA → K-Means Clustering → Customer Profiling → Business Recommendations**

### 1. Exploratory Data Analysis

Customer demographics, financial characteristics, and campaign-related variables were explored to identify initial patterns associated with term deposit subscription.

Key observations include:

- Approximately 88% of contacted customers did not subscribe to the term deposit.
- Call duration shows a noticeable difference between customers who subscribed and those who did not.
- Previous campaign outcomes show a strong difference in subscription proportions.
- Customers without housing loans generally show higher subscription proportions.
- Customer characteristics and campaign-related variables show different patterns across subscription outcomes.

These findings provide initial business insights and motivate further statistical analysis.

### 2. Logistic Regression

Binary logistic regression was used to identify variables associated with the probability of term deposit subscription.

The model includes demographic, financial, and campaign-related variables.

Several variables showed statistically significant relationships with subscription, including:

- Job
- Marital status
- Education
- Balance
- Housing loan
- Personal loan
- Contact type
- Day and month of contact
- Call duration
- Campaign frequency
- Previous campaign outcome

Call duration showed a positive association with subscription, with an odds ratio of approximately 1.0042.

Previous successful campaign outcomes also showed a strong positive association with subscription, while housing loan and personal loan were associated with lower odds of subscription.

> **Business insight:** Customer engagement and previous campaign response appear to provide useful signals for campaign targeting. However, the positive relationship between call duration and subscription should not be interpreted as evidence that simply making calls longer will cause higher conversion.

### 3. PCA

Categorical variables were transformed using one-hot encoding, resulting in 51 numerical variables.

PCA was applied to reduce the dimensionality before clustering.

The first **27 principal components explain more than 80% of the total variance** and were retained as the input for K-Means clustering.

PCA was used primarily for dimensionality reduction and does not directly determine the most influential business variables.

### 4. Customer Segmentation

K-Means clustering was applied using the 27 principal components.

The Elbow Method and Silhouette Method were evaluated to assess the appropriate number of clusters.

The analysis selected **3 customer segments**, balancing segmentation detail with practical business usability.

A smaller number of segments also makes the resulting marketing strategies easier to implement and manage.

## Customer Profiling

The three clusters show different customer characteristics and deposit conversion rates.

| Cluster | Customer Share | Avg. Campaign | Deposit Conversion | Strategic Priority |
|---|---:|---:|---:|---|
| Cluster 1 | 33.35% | 2.74 | 4.68% | Selective Targeting |
| Cluster 2 | 18.25% | 2.06 | 26.59% | Prioritize |
| Cluster 3 | 48.41% | 3.05 | 12.25% | Optimize |

### Cluster 1 — Low Potential

Cluster 1 represents 33.35% of customers and has the lowest deposit conversion rate at 4.68%, despite receiving an average of 2.74 campaign contacts.

This suggests that increasing contact frequency alone may not be an effective strategy for this segment.

### Cluster 2 — High Potential

Cluster 2 is the smallest segment, representing 18.25% of customers, but has the highest deposit conversion rate at 26.59%.

It also has the highest average balance and the lowest average campaign frequency at 2.06 contacts.

This makes Cluster 2 the most promising segment for targeted marketing efforts.

### Cluster 3 — Medium Potential

Cluster 3 is the largest segment, representing 48.41% of customers, with a deposit conversion rate of 12.25%.

It also has the highest average campaign frequency at 3.05 contacts.

Because of its large customer base, even a moderate improvement in conversion could create meaningful business impact.

## Business Recommendations

### 1. Prioritize Cluster 2

Focus targeted marketing efforts on Cluster 2 through more relevant offers and personalized communication.

The objective is to prioritize customers with higher observed conversion potential rather than simply increasing contact frequency.

### 2. Optimize Campaigns for Cluster 3

Cluster 3 represents the largest customer segment but has a lower conversion rate than Cluster 2 despite receiving more campaign contacts.

The bank could test different communication approaches, campaign timing, and offers to improve conversion efficiency.

### 3. Apply Selective Targeting to Cluster 1

Cluster 1 has the lowest conversion rate while already receiving relatively frequent campaign contacts.

Rather than increasing campaign frequency, marketing resources could be allocated more selectively toward customers within this segment who show stronger engagement signals.

## Key Business Insight

> **Higher campaign frequency does not necessarily translate into higher deposit conversion.**

The segmentation results suggest that **targeting the right customers may be more effective than simply increasing the number of campaign contacts**.

By differentiating customers based on their characteristics and observed campaign response, marketing resources can be allocated more efficiently.
