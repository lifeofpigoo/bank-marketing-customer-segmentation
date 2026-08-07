# ============================================================
# TERM DEPOSIT MARKETING ANALYSIS
# ============================================================

# ============================================================
# 1. EXPLORATORY DATA ANALYSIS
# ============================================================

library(ggplot2)
library(dplyr)

# Objective:
# Explore customer demographics, financial characteristics,
# and campaign-related variables to identify initial patterns
# associated with term deposit subscription.

# ------------------------------------------------------------
# 1.1 Target Distribution
# ------------------------------------------------------------

ggplot(data_target_marketing,
       aes(x = y,
           fill = y)) +
  geom_bar() +
  geom_text(
    stat = "count",
    aes(label = after_stat(count)),
    vjust = -0.3
  ) +
  labs(
    title = "Distribusi Keputusan Deposito",
    x = "Status Deposito",
    y = "Jumlah Nasabah"
  ) +
  theme_minimal()

# Key Insight:
# Approximately 88% of contacted customers did not subscribe
# to the term deposit. This indicates a relatively low campaign
# conversion rate and highlights the importance of identifying
# customers with higher conversion potential.

# ------------------------------------------------------------
# 1.2 Demographic Analysis
# ------------------------------------------------------------

ggplot(data_target_marketing,
       aes(x = y,
           y = age,
           fill = y)) +
  geom_boxplot() +
  labs(
    title = "Distribusi Umur Berdasarkan Status Deposito",
    x = "Status Deposito",
    y = "Umur"
  ) +
  theme_minimal()

ggplot(data_target_marketing,
       aes(x = job,
           fill = y)) +
  geom_bar(position = "fill") +
  coord_flip() +
  labs(
    title = "Proporsi Deposito Berdasarkan Pekerjaan",
    x = "Pekerjaan",
    y = "Proporsi"
  ) +
  theme_minimal()

ggplot(data_target_marketing,
       aes(x = marital,
           fill = y)) +
  geom_bar(position = "fill") +
  labs(
    title = "Proporsi Deposito Berdasarkan Status Pernikahan",
    x = "Status Pernikahan",
    y = "Proporsi"
  ) +
  theme_minimal()

ggplot(data_target_marketing,
       aes(x = education,
           fill = y)) +
  geom_bar(position = "fill") +
  labs(
    title = "Proporsi Deposito Berdasarkan Pendidikan",
    x = "Pendidikan",
    y = "Proporsi"
  ) +
  theme_minimal()

# Key Insight:
# Subscription rates vary across demographic groups.
# These patterns provide initial signals for customer targeting,
# but further analysis is required to evaluate the variables
# simultaneously.

# ------------------------------------------------------------
# 1.3 Financial Characteristics
# ------------------------------------------------------------

ggplot(data_target_marketing,
       aes(x = y,
           y = balance,
           fill = y)) +
  geom_boxplot() +
  labs(
    title = "Saldo Berdasarkan Status Deposito",
    x = "Status Deposito",
    y = "Balance"
  ) +
  theme_minimal()

ggplot(data_target_marketing,
       aes(x = housing,
           fill = y)) +
  geom_bar(position = "fill") +
  labs(
    title = "Proporsi Deposito Berdasarkan Housing Loan",
    x = "Housing Loan",
    y = "Proporsi"
  ) +
  theme_minimal()

ggplot(data_target_marketing,
       aes(x = loan,
           fill = y)) +
  geom_bar(position = "fill") +
  labs(
    title = "Proporsi Deposito Berdasarkan Personal Loan",
    x = "Personal Loan",
    y = "Proporsi"
  ) +
  theme_minimal()

ggplot(data_target_marketing,
       aes(x = default,
           fill = y)) +
  geom_bar(position = "fill") +
  labs(
    title = "Proporsi Deposito Berdasarkan Credit Default",
    x = "Default",
    y = "Proporsi"
  ) +
  theme_minimal()

# Key Insight:
# Customers without housing loans generally show higher
# subscription proportions. Differences in other financial
# characteristics also suggest that customers' financial
# conditions may be relevant to deposit subscription.

# ------------------------------------------------------------
# 1.4 Campaign Analysis
# ------------------------------------------------------------

ggplot(data_target_marketing,
       aes(x = contact,
           fill = y)) +
  geom_bar(position = "fill") +
  labs(
    title = "Proporsi Deposito Berdasarkan Media Kontak",
    x = "Media Kontak",
    y = "Proporsi"
  ) +
  theme_minimal()

ggplot(data_target_marketing,
       aes(x = y,
           y = duration,
           fill = y)) +
  geom_boxplot() +
  labs(
    title = "Durasi Kontak Berdasarkan Deposito",
    x = "Status Deposito",
    y = "Durasi (detik)"
  ) +
  theme_minimal()

ggplot(data_target_marketing,
       aes(x = y,
           y = campaign,
           fill = y)) +
  geom_boxplot() +
  labs(
    title = "Jumlah Campaign Berdasarkan Deposito",
    x = "Status Deposito",
    y = "Jumlah Campaign"
  ) +
  theme_minimal()

ggplot(data_target_marketing,
       aes(x = month,
           fill = y)) +
  geom_bar(position = "fill") +
  labs(
    title = "Proporsi Deposito Berdasarkan Bulan Kontak",
    x = "Bulan",
    y = "Proporsi"
  ) +
  theme_minimal()

# Key Insight:
# Call duration shows a noticeable difference between customers
# who subscribed and those who did not. However, higher campaign
# frequency does not necessarily correspond to higher conversion.

# ------------------------------------------------------------
# 1.5 Previous Campaign Analysis
# ------------------------------------------------------------

ggplot(data_target_marketing,
       aes(x = y,
           y = previous,
           fill = y)) +
  geom_boxplot() +
  labs(
    title = "Jumlah Kontak Sebelumnya Berdasarkan Deposito",
    x = "Status Deposito",
    y = "Previous"
  ) +
  theme_minimal()

ggplot(data_target_marketing,
       aes(x = y,
           y = pdays,
           fill = y)) +
  geom_boxplot() +
  labs(
    title = "Pdays Berdasarkan Deposito",
    x = "Status Deposito",
    y = "Pdays"
  ) +
  theme_minimal()

ggplot(data_target_marketing,
       aes(x = poutcome,
           fill = y)) +
  geom_bar(position = "fill") +
  labs(
    title = "Proporsi Deposito Berdasarkan Previous Outcome",
    x = "Previous Campaign Outcome",
    y = "Proporsi"
  ) +
  theme_minimal()

# Key Insight:
# Previous campaign outcomes show a clear relationship with
# current subscription decisions. Customers with a successful
# previous campaign outcome appear more likely to subscribe.
#
# This suggests that historical campaign response can be a useful
# signal when prioritizing customers for future campaigns.


# ============================================================
# 2. DATA QUALITY & PREPARATION
# ============================================================

# Objective:
# Prepare the dataset for statistical modeling and customer
# segmentation.

# ------------------------------------------------------------
# 2.1 Missing Values
# ------------------------------------------------------------

colSums(is.na(data_target_marketing))
sum(is.na(data_target_marketing))

# Missing-value check is performed to ensure data completeness
# before modeling.

# ------------------------------------------------------------
# 2.2 Duplicate Records
# ------------------------------------------------------------

sum(duplicated(data_target_marketing))

# Duplicate records are checked to reduce the risk of duplicated
# observations affecting the analysis.

# ------------------------------------------------------------
# 2.3 Convert Categorical Variables to Factor
# ------------------------------------------------------------

data_target_marketing <- data_target_marketing %>%
  mutate(
    across(
      where(is.character),
      as.factor
    )
  )
str(data_target_marketing)
summary(data_target_marketing)

# ============================================================
# 3. LOGISTIC REGRESSION
# ============================================================

# Objective:
# Identify customer and campaign characteristics associated with
# the probability of term deposit subscription.
#
# The Wald test is used to evaluate the statistical significance
# of individual predictors, while odds ratios are used to
# interpret the direction and magnitude of the relationships.

model_logistic <- glm(
  y ~ age +
    job +
    marital +
    education +
    default +
    balance +
    housing +
    loan +
    contact +
    day +
    month +
    duration +
    campaign +
    pdays +
    previous +
    poutcome,
  family = binomial(link = "logit"),
  data = data_target_marketing
)
summary(model_logistic)

# Odds Ratio and 95% Confidence Interval

exp(cbind(
  Odds_Ratio = coef(model_logistic),
  confint(model_logistic)
))

# Key Insight:
# Several demographic, financial, and campaign-related variables
# show significant associations with deposit subscription.
#
# Call duration has a positive association with subscription
# (OR approximately 1.0042), while previous campaign success
# shows a substantially stronger positive association.
#
# Housing loan and personal loan are associated with lower odds
# of subscription.
#
# These results indicate that previous customer response and
# campaign engagement can provide useful signals for targeting.
# However, the associations should not be interpreted as causal
# effects.

# ============================================================
# 4. ONE-HOT ENCODING
# ============================================================

# Objective:
# Convert categorical variables into numerical representations
# required for PCA and K-Means clustering.

library(caret)

dummy <- dummyVars(
  ~.,
  data = data_target_marketing
)

target_marketing <- data.frame(
  predict(
    dummy,
    newdata = data_target_marketing
  )
)
dim(target_marketing)
head(target_marketing)

# ------------------------------------------------------------
# Remove Target Variable from Clustering Dataset
# ----------------------------------------------------------

colnames(target_marketing)
target_marketing_cluster <- target_marketing %>%
  select(
    -y.no,
    -y.yes
  )
View(target_marketing)

# The target variable is excluded from clustering so that
# customer segments are created based on customer characteristics
# rather than the known deposit outcome.

# ============================================================
# 5. STANDARDIZATION & PCA
# ============================================================

# Standardization
target_marketing_scaled <- scale(
  target_marketing_cluster
)
dim(target_marketing_scaled)
View(target_marketing_scaled)

# ------------------------------------------------------------
# PCA
# ------------------------------------------------------------

# Objective:
# Reduce the dimensionality created by one-hot encoding while
# retaining most of the variation in the customer data.

pca_target_marketing <- prcomp(
  target_marketing_scaled,
  center = TRUE,
  scale. = TRUE
)

#Eigenvalue

eigenvalue <- pca_target_marketing$sdev^2

# Proportion of Variance

proporsi_varians <- eigenvalue / sum(eigenvalue)

# Cumulative Proportion of Variance

proporsi_kumulatif <- cumsum(proporsi_varians)

# PCA Summary Table

hasil_pca <- data.frame(
  PC = paste0("PC", 1:length(eigenvalue)),
  Eigenvalue = round(eigenvalue, 4),
  Proporsi_Varians = round(proporsi_varians, 4),
  Proporsi_Kumulatif = round(proporsi_kumulatif, 4)
)

View(hasil_pca)

# Key Insight:
# One-hot encoding expanded the dataset into 51 numerical
# variables. The first 27 principal components explain more than
# 80% of the total variance.
#
# Therefore, the first 27 components are retained as the input
# for customer segmentation.
#
# PCA is used here primarily for dimensionality reduction and
# computational efficiency rather than direct business
# interpretation.

# ------------------------------------------------------------
# Select Principal Components
# ------------------------------------------------------------

pc_target_marketing <- pca_target_marketing$x[,1:27]

dim(pc_target_marketing)

# ============================================================
# 6. CUSTOMER SEGMENTATION — K-MEANS
# ============================================================

# Objective:
# Group customers with similar characteristics into actionable
# customer segments.

# ------------------------------------------------------------
# Sampling for Cluster Evaluation
# ------------------------------------------------------------

# A sample of 5,000 observations is used for evaluating the
# optimal number of clusters to reduce computational burden.

set.seed(123)

sample_index <- sample(
  1:nrow(pc_target_marketing),
  5000
)

pc_sample <- pc_target_marketing[sample_index, ]

dim(pc_sample)

# ------------------------------------------------------------
# Elbow Method
# ------------------------------------------------------------

library(factoextra)

fviz_nbclust(
  pc_sample,
  kmeans,
  method = "wss",
  k.max = 10
) +
  labs(
    title = "Elbow Method"
  ) +
  theme_minimal()

# ------------------------------------------------------------
# Silhouette Method
# ------------------------------------------------------------


fviz_nbclust(
  pc_sample,
  kmeans,
  method = "silhouette",
  k.max = 10
) +
  labs(
    title = "Silhouette Method"
  ) +
  theme_minimal()

# Based on the cluster evaluation and business usability,
# 3 clusters are selected.
#
# Three segments provide sufficient differentiation while
# remaining practical for developing targeted marketing
# strategies.

# ------------------------------------------------------------
# Final K-Means Model
# ------------------------------------------------------------

set.seed(123)

kmeans_target_marketing <- kmeans(
  pc_target_marketing,
  centers = 3,
  nstart = 25
)

# Cluster Size

table(
  kmeans_target_marketing$cluster
)

# Add cluster labels to original dataset

data_target_marketing$cluster <- factor(
  kmeans_target_marketing$cluster
)

View(data_target_marketing)

# ============================================================
# 7. CLUSTER PROFILING
# ============================================================

# Objective:
# Understand the demographic, financial, and campaign
# characteristics of each customer segment.

profil_cluster <- data_target_marketing %>%
  group_by(cluster) %>%
  summarise(
    Jumlah_Nasabah = n(),
    Persentase = n() / nrow(data_target_marketing) * 100,
    Rata_Umur = mean(age),
    Rata_Balance = mean(balance),
    Rata_Duration = mean(duration),
    Rata_Campaign = mean(campaign),
    Rata_Previous = mean(previous),
    Rata_Pdays = mean(pdays)
  )

profil_cluster

View(profil_cluster)

# ------------------------------------------------------------
# Numerical Profile
# ------------------------------------------------------------

ggplot(
  profil_cluster,
  aes(cluster, Rata_Umur)
)+
  geom_col()+
  labs(
    title="Rata-rata Umur per Cluster",
    x="Cluster",
    y="Umur"
  )

ggplot(
  profil_cluster,
  aes(cluster, Rata_Balance)
)+
  geom_col()+
  labs(
    title="Rata-rata Saldo per Cluster",
    x="Cluster",
    y="Balance"
  )

ggplot(
  profil_cluster,
  aes(cluster, Rata_Duration)
)+
  geom_col()+
  labs(
    title="Rata-rata Durasi per Cluster",
    x="Cluster",
    y="Duration"
  )

ggplot(
  profil_cluster,
  aes(cluster, Rata_Campaign)
)+
  geom_col()+
  labs(
    title="Rata-rata Campaign per Cluster",
    x="Cluster",
    y="Campaign"
  )

# ------------------------------------------------------------
# Job Profile
# ------------------------------------------------------------

job_cluster <-
  data_target_marketing %>%
  count(cluster,job)%>%
  group_by(cluster)%>%
  mutate(
    Persentase=n/sum(n)
  )
View(job_cluster)

ggplot(
  job_cluster,
  aes(job,
      Persentase,
      fill=cluster)
)+
  geom_col(position="dodge")+
  coord_flip()

# ------------------------------------------------------------
# Education Profile
# ------------------------------------------------------------

education_cluster <-
  data_target_marketing %>%
  count(cluster,education)%>%
  group_by(cluster)%>%
  mutate(
    Persentase=n/sum(n)
  )
View(education_cluster)

ggplot(
  education_cluster,
  aes(education,
      Persentase,
      fill=cluster)
)+
  geom_col(position="dodge")+
  coord_flip()

# ------------------------------------------------------------
# Housing Loan Profile
# ------------------------------------------------------------

housing_loan_cluster <-
  data_target_marketing %>%
  count(cluster,housing)%>%
  group_by(cluster)%>%
  mutate(
    Persentase=n/sum(n)
  )
View(housing_loan_cluster)

ggplot(
  housing_loan_cluster,
  aes(housing,
      Persentase,
      fill=cluster)
)+
  geom_col(position="dodge")+
  coord_flip()

# ------------------------------------------------------------
# Personal Loan Profile
# ------------------------------------------------------------

loan_cluster <-
  data_target_marketing %>%
  count(cluster,loan)%>%
  group_by(cluster)%>%
  mutate(
    Persentase=n/sum(n)
  )
View(loan_cluster)


ggplot(
  loan_cluster,
  aes(loan,
      Persentase,
      fill=cluster)
)+
  geom_col(position="dodge")+
  coord_flip()

# ------------------------------------------------------------
# Previous Campaign Outcome
# ------------------------------------------------------------

poutcome_cluster <- data_target_marketing %>%
  count(cluster, poutcome) %>%
  group_by(cluster) %>%
  mutate(
    Persentase = n / sum(n) * 100
  )

View(poutcome_cluster)

# ------------------------------------------------------------
# Contact Type
# ------------------------------------------------------------

contact_cluster <- data_target_marketing %>%
  count(cluster, contact) %>%
  group_by(cluster) %>%
  mutate(
    Persentase = n / sum(n) * 100
  )

View(contact_cluster)

# ============================================================
# 8. DEPOSIT CONVERSION BY CLUSTER
# ============================================================

# Deposit distribution within each cluster
deposit_cluster <- data_target_marketing %>%
  group_by(cluster, y) %>%
  summarise(
    Jumlah = n(),
    .groups = "drop"
  ) %>%
  group_by(cluster) %>%
  mutate(
    Persentase = Jumlah/sum(Jumlah)
  )

View(deposit_cluster)

ggplot(
  deposit_cluster,
  aes(
    cluster,
    Persentase,
    fill = y
  )
) +
  geom_col(position = "fill") +
  labs(
    title = "Deposit Conversion by Customer Cluster",
    x = "Cluster",
    y = "Proportion",
    fill = "Deposit"
  )

# Conversion rate
conversion_cluster <- data_target_marketing %>%
  group_by(cluster) %>%
  summarise(
    Jumlah_Nasabah = n(),
    Jumlah_Deposit = sum(y == "yes"),
    Conversion_Rate = mean(y == "yes") * 100
  )

conversion_cluster
View(conversion_cluster)

# Key Insight:
# Cluster profiling reveals meaningful differences in customer
# size, financial characteristics, campaign activity, and deposit
# conversion.
#
# Cluster 2 represents the smallest segment but has the highest
# deposit conversion and highest average balance, making it the
# highest-potential segment.
#
# Cluster 3 is the largest segment and has moderate conversion.
# Its large customer base creates meaningful business potential
# if conversion can be improved.
#
# Cluster 1 has the lowest conversion despite receiving multiple
# campaigns, suggesting that increasing campaign frequency alone
# may not be an effective strategy.


# ============================================================
# 9. CLUSTER VISUALIZATION
# ============================================================

fviz_cluster(
  kmeans_target_marketing,
  data = pc_target_marketing[,1:2],
  ellipse.type = "convex",
  geom = "point"
)

# ============================================================
# 10. BUSINESS RECOMMENDATIONS
# ============================================================

# Cluster 2 — PRIORITIZE
#
# Prioritize Cluster 2 through targeted marketing and personalized
# offers. This segment has the highest conversion potential and
# highest average balance despite receiving the lowest average
# campaign frequency.
#
# Business impact:
# Improve marketing efficiency by prioritizing customers with
# higher observed conversion potential.


# Cluster 3 — OPTIMIZE
#
# Optimize campaign strategy for Cluster 3 rather than simply
# increasing campaign frequency. Evaluate communication,
# timing, and offer strategy to improve conversion.
#
# Business impact:
# Because Cluster 3 represents the largest customer segment,
# even a moderate improvement in conversion could create
# meaningful incremental business impact.

# Cluster 1 — SELECTIVE TARGETING
#
# Apply selective targeting to Cluster 1. The segment has the
# lowest conversion despite receiving multiple campaigns.
# Further contacts should therefore be prioritized based on
# customer characteristics and engagement signals.
#
# Business impact:
# Reduce marketing resources spent on customers with relatively
# low conversion potential.

# ============================================================
# 11. KEY BUSINESS INSIGHT
# ============================================================

# Higher campaign frequency does not necessarily translate
# into higher deposit conversion.
#
# The highest-converting segment (Cluster 2) receives the lowest
# average campaign frequency, while Cluster 1 receives more
# campaigns but has the lowest conversion.
#
# This suggests that effective customer targeting may be more
# valuable than simply increasing campaign frequency.


# ============================================================
# 12. CLUSTERING QUALITY CHECK
# ============================================================

table(kmeans_target_marketing$cluster)
round(
  kmeans_target_marketing$betweenss/
    kmeans_target_marketing$totss,
  3
)

# ============================================================
# FINAL TAKEAWAY
# ============================================================

# The analysis combines exploratory analysis, logistic regression,
# PCA, and K-Means clustering to identify customer characteristics
# associated with term deposit subscription and develop actionable
# customer segments.
#
# Logistic regression highlights customer and campaign variables
# associated with subscription, while PCA reduces the dimensionality
# of the encoded customer data before clustering.
#
# K-Means identifies three customer segments with different
# conversion profiles. The results support differentiated marketing
# strategies rather than a one-size-fits-all campaign approach.
#
# Overall business takeaway:
# Focus marketing resources on the right customers rather than
# simply increasing campaign frequency.

