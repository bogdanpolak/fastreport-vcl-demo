# Repozytorium szkoleniowe

Repozytorium szkoleniowe: **FastReport - nowoczesne raportowanie**. 

Termin: **2019-06-25 - 2019-06-26**

## Konfiguracja

Program demo wymaga instalacji serwera Firebird. Kod źródłowy można zaktualizować 
do innych platform RDBMS. Po drobnych korektach kodu źródłowego aplikacja będzie 
działać na serwerze Interase, MS SQL Server, SQLite oraz innych.

* Instalacja serwera SQL
  - Pobranie serwera Firebird w wersji 2.5 lub nowszej
* Biblioteka `fbcient.dll`
  - Przeniesie biblioteki klienckiej do folderu aplikacji (wynikowy plik EXE) lub ustawienie jej widoczności na ścieżce poszukiwania
* Stworzenie demonstracyjnej bazy danych FireDAC
  - Krok wymaga dostępu do środowiska RAD Studio z komponentami FireDAC
  - zbudowanie bazy zgodnie z instrukcją: 
    http://docwiki.embarcadero.com/RADStudio/Rio/en/Demo_Databases_(FireDAC)
* Plik konfiguracyjny `FastReportDemo.ini` 
  - Przeniesienie pliku konfiguracyjnego do folderu aplikacji (wynikowy plik EXE)
  - Dopasowanie konfiguracji - edycja pliku
    - Położenie pliku z demonstracyjną bazą danych
    - Hasło administratora SYSDBA
* Przeniesienie plików dbExpress (opcjonalnie)
  - Krok wymagany do celów definiowania połączeń z bazą danych oraz tworzeniem zapytań SQL w projektancie raportów FastReport
  - Wymagane pliki to:
    - `dbxdrivers.ini`
    - `dbxconnections.ini` - ze zdefiniowanie połączeniem do bazy demo
    - `dbxfb.dll` dla Firebird-a lub analogiczny dla innych serwerów SQL
