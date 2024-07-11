import matplotlib.pyplot as plt

# Daten
datasets = [
    {'Allocate': 0.598853, 'Initialize': 0.247368, 'Flush': 0.0881128, 'Total': 0.934341},
    {'Allocate': 0.831031, 'Write': 1.3307, 'Flush': 0.11652, 'Total': 2.27826},
    {'Allocate': 0.801925, 'Write': 18.5504, 'Flush': 0.148278, 'Delete': 0.000293147, 'Total': 19.5009},
    {'Allocate': 0.593028, 'Delete': 0.000110902, 'Total': 0.593143},
    {'Write': 18.2241, 'Flush': 0.11716, 'Total': 18.3413},
    {'Read': 0.124135, 'Delete': 0.000197594, 'Total': 0.124335},
    {'Read': 0.123769, 'Total': 0.123771},
    {'Allocate': 0.908168, 'First write': 18.3757, 'Flush after first write': 0.0926178, 'First read': 0.125355, 'Second write': 18.445, 'Flush after second read': 0.12168, 'Second read': 0.124245, 'Total': 38.1928},
    {'Allocate': 0.905104, 'Write': 18.2338, 'Flush': 0.0888632, 'Read': 0.124615, 'Delete': 0.000206425, 'Total': 19.3526},
    {'Allocate': 0.596814, 'Write': 18.6198, 'Flush': 0.121445, 'Read': 0.122644, 'Total': 19.4607},
]

# Diagramme erstellen und einzeln anzeigen
for i, data in enumerate(datasets):
    labels = list(data.keys())
    values = list(data.values())
    
    plt.figure(figsize=(10, 5))
    plt.bar(labels, values, color='skyblue')
    plt.xlabel('Operation')
    plt.ylabel('Zeit in Sekunden')
    plt.title(f'Benchmark {i+1}')
    
    # Werte über den Balken anzeigen
    for j, value in enumerate(values):
        plt.text(j, value + 0.02, f'{value:.6f}', ha='center')
    
    # Diagramm anzeigen
    plt.show()
