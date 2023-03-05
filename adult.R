
#Wykonaj polecenia w R.
#Wczytaj plik adult.csv.
#Sprawdź wartości przyjmowane przez zmienne i popraw ewentualne błędy: usuń niepotrzebne spacje z odpowiednich kolumn, zastąp ? przez NA.
#Wyszukaj zmienne i obserwacje z brakami danych. Usuń wybrakowane obserwacje ze zbioru.
#Wyszukaj zduplikowane obserwacje i usuń je ze zbioru.

#przed rozpoczeciem, nalezy wybrac lokalizacje pliku adult.csv
#session -> Set Working Directory -> Choose Directory

#doinstalowanie wymaganej biblioteki (jezeli pojawi sie komunikat, nalezy kliknac "no")
install.packages("stringr")

#zapisanie pliku jako zmienna
dane <- read.csv("adult.csv", header=TRUE, sep=",")

#informacja jakiego typu jest zmienna
typeof(dane)

#informacje jakiego typu sa kolumny
sapply(dane, typeof)

#usuniecie zbednych pustych znakow
dane2 <- as.data.frame(apply(dane,2,function(x) gsub("\\s+", "", x)))

#usuniecie poprzednich danych
rm(dane)

#kopiowanie danych
dane3<-dane2

#zamiana "?" na "NA"
dane3[dane3 == "?"] <- NA

#usuniecie poprzednich danych
rm(dane2)

#usuniecie linie z NA
dane4 <- na.omit(dane3) 

#usuniecie duplikatow
dane4 <- dane4[!duplicated(dane4),]

#usuniecie poprzednich danych
rm(dane3)

#zapisanie danych do ladnie nazwanej zmiennej
dane_wynikowe <- dane4

#usuniecie poprzednich danych
rm(dane4)