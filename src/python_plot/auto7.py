import os
import matplotlib.pyplot as plt
from collections import defaultdict

# Funktion zum Einlesen der .txt-Dateien
def read_txt_file(filepath):
    with open(filepath, 'r') as file:
        lines = file.readlines()
    
    data = []
    for line in lines:
        operations = line.strip().split(',')
        op_dict = defaultdict(float)
        for op in operations:
            if ':' in op:  # Überprüfen, ob das Trennzeichen ':' vorhanden ist
                op_name, op_time = op.split(':')
                op_dict[op_name] += float(op_time.rstrip('s'))
        data.append(op_dict)
    return data

# Funktion zur Erstellung der Balkendiagramme
def plot_and_save_barplots(data1, data2, output_dir):
    os.makedirs(output_dir, exist_ok=True)
    
    # Benutzerdefinierte Reihenfolge der Labels
    order = ["reads", "writes", "total"]  # Füge hier die Labels in der gewünschten Reihenfolge hinzu
    
    for i, (d1, d2) in enumerate(zip(data1, data2)):
        # Labels sortieren nach benutzerdefinierter Reihenfolge
        #labels = sorted(set(d1.keys()).union(d2.keys()), key=lambda x: (order.index(x) if x in order else len(order) + ord(x[0])))
        print(d1.keys())
        labels=d1.keys()
        values1 = [d1[label] for label in labels]
        values2 = [d2[label] for label in labels]
        
        x = range(len(labels))
        width = 0.4

        plt.figure(figsize=(10, 6))
        plt.bar(x, values1, width, label='Benchmark mit IO_uring')
        plt.bar([p + width for p in x], values2, width, label='Benchmark vor IO_uring')

        plt.xlabel('Operations')
        plt.ylabel('Time in (s)')
        plt.title(f'Comparison of Operations in Entry {i+1}')
        plt.xticks([p + width/2 for p in x], labels, rotation=45)
        plt.legend()

        # Speichern des Plots im angegebenen Ordner
        plt.tight_layout()
        plt.savefig(os.path.join(output_dir, f'comparison_plot_{i+1}.png'))
        plt.show()

# Hauptprogramm
file1 = '/home/ossi/github/bachlorthesis/build/benchmark.txt'
file2 = '/home/ossi/github/bachlorthesis/bench/oldbenchmark/benchmark2.txt'
output_dir = 'output_plots4'  # Ordner zum Speichern der Bilder

# Daten einlesen
data1 = read_txt_file(file1)
data2 = read_txt_file(file2)

# Diagramme erstellen und speichern
plot_and_save_barplots(data1, data2, output_dir)
