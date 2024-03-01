library(ggplot2)
library(ggthemes)
library(extrafont)

df <- data.frame(study=c('As treated, 1:1 (main setting)', 'As treated, 1:2', 'As treated, 1:4', 'As treated, stratification'),
                 index=4:1,
                 effect=c(0.17, 0.16, 0.22, 0.46),
                 lower=c(0.03, 0.03, 0.05, 0.19),
                 upper=c(0.61, 0.56, 0.64, 0.99))

ggplot(data=df, aes(y=index, x=effect, xmin=lower, xmax=upper)) +
  geom_point() + 
  geom_errorbarh(height=.2) +
  scale_y_continuous(breaks=1:nrow(df), labels=rev(df$study)) +
  geom_pointrange(shape = 22, fill = "black") +
  geom_vline(xintercept=1, color='black', linetype='dashed', alpha=.5) +
  labs(x='', y = '') +
  theme_tufte() +
  scale_x_continuous(trans="log10", limits=c(0.02, 2), breaks = c(0.02, 0.05, 0.1,0.2, 0.5, 1, 2)) +
  theme(text=element_text(size=20, family="Serif"))

######### Incompletely controlled asthma ###########

df <- data.frame(study=c('As treated, 1:1 (main setting)', 'As treated, 1:2', 'As treated, 1:4', 'As treated, stratification'),
                 index=4:1,
                 effect=c(0.56, 0.74, 0.97, 0.82),
                 lower=c(0.32, 0.46, 0.64, 0.59),
                 upper=c(0.95, 1.18, 1.45, 1.14))

ggplot(data=df, aes(y=index, x=effect, xmin=lower, xmax=upper)) +
  geom_point() + 
  geom_errorbarh(height=.2) +
  scale_y_continuous(breaks=1:nrow(df), labels=rev(df$study)) +
  geom_pointrange(shape = 22, fill = "black") +
  geom_vline(xintercept=1, color='black', linetype='dashed', alpha=.5) +
  labs(x='', y = '') +
  theme_tufte() +
  scale_x_continuous(trans="log10", limits=c(0.02, 2), breaks = c(0.02, 0.05, 0.1, 0.2, 0.5, 1, 2)) +
  theme(text=element_text(size=20, family="Serif"))

######### IV corticosteroid treatment ###########

df <- data.frame(study=c('As treated, 1:1 (main setting)', 'As treated, 1:2', 'As treated, 1:4', 'As treated, stratification'),
                 index=4:1,
                 effect=c(0.38, 0.39, 0.41, 0.57),
                 lower=c(0.16, 0.16, 0.19, 0.32),
                 upper=c(0.83, 0.82, 0.83, 0.97))

ggplot(data=df, aes(y=index, x=effect, xmin=lower, xmax=upper)) +
  geom_point() + 
  geom_errorbarh(height=.2) +
  scale_y_continuous(breaks=1:nrow(df), labels=rev(df$study)) +
  geom_pointrange(shape = 22, fill = "black") +
  geom_vline(xintercept=1, color='black', linetype='dashed', alpha=.5) +
  labs(x='', y = '') +
  theme_tufte() +
  scale_x_continuous(trans="log10", limits=c(0.02, 2), breaks = c(0.02, 0.05, 0.1, 0.2, 0.5, 1, 2)) +
  theme(text=element_text(size=20, family="Serif"))

######### Asthma-related hospitalization ###########

df <- data.frame(study=c('As treated, 1:1 (main setting)', 'As treated, 1:2', 'As treated, 1:4', 'As treated, stratification'),
                 index=4:1,
                 effect=c(0.27, 0.32, 0.42, 0.57),
                 lower=c(0.06, 0.09, 0.15, 0.27),
                 upper=c(0.87, 0.88, 0.98, 1.14))

ggplot(data=df, aes(y=index, x=effect, xmin=lower, xmax=upper)) +
  geom_point() + 
  geom_errorbarh(height=.2) +
  scale_y_continuous(breaks=1:nrow(df), labels=rev(df$study)) +
  geom_pointrange(shape = 22, fill = "black") +
  geom_vline(xintercept=1, color='black', linetype='dashed', alpha=.5) +
  labs(x='', y = '') +
  theme_tufte() +
  scale_x_continuous(trans="log10", limits=c(0.02, 2), breaks = c(0.02, 0.05, 0.1, 0.2, 0.5, 1, 2)) +
  theme(text=element_text(size=20, family="Serif"))

