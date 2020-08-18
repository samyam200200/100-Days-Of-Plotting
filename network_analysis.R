library(sna)
library(igraph)
#Undirected graph - nodes and vertices with links but no directionality
# Does not have any repeats 0-14 and 14-0

#Directed graph - sense of directionality 0-9 and 9-0 
#series of links - 0 going to 9 and 9 going to 0 - edge, arrow, bidrectional
#data in sna starts numbering at 0, but the plot starts numbering from 1

setwd("C:/Users/gocoo/OneDrive/Documents/study")
getwd()
g1<-read.table('undirected.txt')
head(g1)

graph1<-graph_from_data_frame(g1, directed = FALSE, vertices=NULL)
plot(graph1)

#SNA using online data
#Generating data

#Full graph - all nodes are connected
#Nodes, directional-nondirection
g_full<-make_full_graph(8, directed=FALSE)
plot(g_full)

#Ring - circle with connection with neighbours
#mutual for directed graph
g_ring<-make_ring(12, directed=FALSE, mutual=FALSE, circular = TRUE)
plot(g_ring)

#Star - central vertex with all other vertices connected by single edge
g_star<-make_star(10, center = 1) #directed graph with everything coming to the center
plot(g_star)

#Random graphs - gnp and gnm
#number of nodes, probability of connections, directed, loops - connection in loops
g_gnp<-sample_gnp(n = 20, p = 0.3, directed = FALSE, loops = FALSE)
plot(g_gnp)

#gnm analysis
#looks at number of edges - with is randomly assigned - vertices can be unconnected
g_gnm<-sample_gnm(n = 20, m = 50, directed = FALSE, loops = FALSE)
plot(g_gnm)
g_gnm<-sample_gnm(n = 20, m = 25, directed = FALSE, loops = FALSE)
plot(g_gnm)

#preferntial attachments - create a network - 2 linked nodes - use wighted probability to determine to which node to attach the next node to
#power - how much weight to give to each edges - all edges weight one
g_gpa<-sample_pa(n=20, power=1)

plot(g_gpa)



