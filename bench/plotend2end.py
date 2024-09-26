import matplotlib.pyplot as plt
import os

# Funktion zum Einlesen der Daten aus einer .txt-Datei und Umwandeln in Millisekunden
def read_data_from_txt(file_path):
    with open(file_path, 'r') as file:
        data = file.readlines()
    # Wandelt die Zeilen in float-Werte um (und entfernt das 's' am Ende), und multipliziert mit 1000, um Sekunden in Millisekunden umzurechnen
    values = [float(line.strip().replace('s', '')) * 1000 for line in data]
    return values

# Dateipfade zu den txt-Dateien
file1_path = '/home/ossi/github/bachlorthesis/bench/data_old.txt'
file2_path = '/home/ossi/github/bachlorthesis/bench/data_new.txt'

# Daten aus den beiden Dateien einlesen
values1 = read_data_from_txt(file1_path)
values2 = read_data_from_txt(file2_path)

# Überprüfen, ob die Anzahl der Werte in beiden Dateien übereinstimmt
if len(values1) != len(values2):
    raise ValueError("Die Anzahl der Werte in den beiden Dateien stimmt nicht überein!")

# Ordner erstellen, falls er noch nicht existiert
output_dir = 'output'
if not os.path.exists(output_dir):
    os.makedirs(output_dir)

# Balkendiagramm erstellen
x = range(len(values1))  # Positionen für die Balken (Index der Werte)

plt.bar(x, values1, width=0.4, label='Benchmark vor IO_uring', align='center')
plt.bar([i + 0.4 for i in x], values2, width=0.4, label='Benchmark nach IO_uring', align='center')

# Diagramm beschriften
plt.xlabel('Eintragsnummer')  # Die x-Achse zeigt die Indexnummer der Werte
plt.ylabel('Zeit (Millisekunden)')  # Die y-Achse zeigt die Zeitwerte in Millisekunden
# plt.title('Gegenüberstellung der Zeiten (in Millisekunden) aus Datei 1 und Datei 2')
plt.legend()

# X-Achse auf ganze Zahlen setzen
plt.xticks(ticks=range(len(values1)), labels=[str(i) for i in range(len(values1))])

# Bild im Ordner speichern
output_file_path = os.path.join(output_dir, 'balkendiagramm.png')
plt.savefig(output_file_path)

# Diagramm anzeigen (optional)
plt.show()

print(f'Diagramm wurde in {output_file_path} gespeichert.')


