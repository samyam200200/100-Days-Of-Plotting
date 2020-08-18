#strip plots - between categorical and continuos variable
ggplot(Salaries, aes(y=factor(rank, labels = c("Assistant\nprofessor", "Associate\nprofessor", "Professor")), x=salary, color=rank))+geom_jitter()+labs(title="Salary distribution by rank", x="", y="")+theme_minimal()+theme(legend.position = "none")
#combining jitter with boxplot
ggplot(Salaries, aes(y=factor(rank, labels = c("Assistant\nprofessor", "Associate\nprofessor", "Professor")), x=salary, color=rank))+geom_boxplot(size=1, outlier.shape = 1, outlier.colour = "black", outlier.size = 3)+geom_jitter(alpha=0.5, width = .2)+labs(title="Salary distribution by rank", x="", y="")+theme_minimal()+theme(legend.position = "none")+scale_x_continuous(labels = scales::dollar)
