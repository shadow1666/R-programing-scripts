

?matplot
 
#matplot plots <coloumns> of functions

matplot(FieldGoals,Games, type = 'l')

#so we can transpose the matrix to get rowwise results


t(FieldGoals)
#colnames(FieldGoals)<-Seasons

matplot(t(FieldGoals/FieldGoalAttempts), type = 'b', pch = 15:18, col = c(1:4,6))
legend("bottomleft", legend = Players, pch = 15:18, col = c(1:4,6), horiz = 0)

#pch is used for the type of symbols for points

#?legend
