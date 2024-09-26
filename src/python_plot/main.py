import matplotlib.pyplot as plt

# Daten
data = {
    'AllocatePage:Allocate': 0.601735,
    'Initialize': 0.337535,
    'Flush': 0.0896802,
    'Total': 1.02896
}

# Labels und Werte extrahieren
labels = list(data.keys())
values = list(data.values())

# Diagramm erstellen
plt.figure(figsize=(10, 5))
plt.bar(labels, values, color='skyblue')

# Diagramm beschriften
plt.xlabel('Operation')
plt.ylabel('Zeit in Sekunden')
plt.title('Zeiten für verschiedene Operationen')

# Werte über den Balken anzeigen
for i, value in enumerate(values):
    plt.text(i, value + 0.02, f'{value:.6f}', ha='center')

# Diagramm anzeigen
plt.show()