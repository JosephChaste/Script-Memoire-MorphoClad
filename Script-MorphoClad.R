#Importation des packages

library(readxl)
library(ggplot2)
library(ggrepel)

#Importation du jeu de donnée

k <- read.table("kquantitatifs.csv", sep = ";", dec = ",", header = T)
summary(k)


#Visualisation des caractères

#Manteau

ggplot(k, aes(x = "", y = ratioLOMLAM)) +
  geom_violin() +
  geom_point() +
  geom_text_repel(
    aes(label = taxon),
    direction = "y",
    nudge_x = 0.15,
    segment.curvature = 0,
    size = 3) +
  geom_hline(yintercept = c(2.5, 3.7), linetype = "dashed") +
  annotate("text", x = 0.5, y = 2.4, label = "0: < 2.5", hjust = 0) +
  annotate("text", x = 0.5, y = 3.1, label = "1: 2.5 < x < 3.7 ", hjust = 0) +
  annotate("text", x = 0.5, y = 3.8, label = "2: > 3.7 ", hjust = 0) +
  scale_y_continuous(
    breaks = seq(
      floor(min(k$ratioLOMLAM, na.rm = TRUE)),
      ceiling(max(k$ratioLOMLAM, na.rm = TRUE)),
      by = 0.2)) +
  theme_bw() +
  labs(x = NULL, y = "ratioLOMLAM", title = "Ratio longueur / largeur du manteau")

#Cou
ggplot(k, aes(x = "", y = ratioLOCLAC)) +
  geom_violin() +
  geom_point() +
  geom_text_repel(
    aes(label = taxon),
    direction = "y",
    nudge_x = 0.15,
    segment.curvature = 0,
    size = 3) +
  geom_hline(yintercept = c(1.1, 2.1), linetype = "dashed") +
  annotate("text", x = 0.6, y = 1, label = "0: < 1.1", hjust = 0) +
  annotate("text", x = 0.6, y = 1.6, label = "1: 1.1 < x < 2.1", hjust = 0) +
  annotate("text", x = 0.6, y = 2.2, label = "2: > 2.1 ", hjust = 0) +
  scale_y_continuous(
    breaks = seq(
      floor(min(k$ratioLOMLAM, na.rm = TRUE)),
      ceiling(max(k$ratioLOMLAM, na.rm = TRUE)),
      by = 0.2)) +
  theme_bw() +
  labs(x = NULL, y = "ratioLOCLAC", title = "Ratio longueur / largeur du cou")

       