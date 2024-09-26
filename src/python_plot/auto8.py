import matplotlib.pyplot as plt
import re
import os

def read_data(file_path):
    data_sets = []
    with open(file_path, 'r') as file:
        for line in file:
            entries = line.strip().split(',')
            operations = []
            for entry in entries:
                if entry:
                    operation, time_str = entry.split(':')
                    time = float(re.sub(r's$', '', time_str))  # Entferne das 's' und konvertiere zu float
                    operations.append((operation, time))
            data_sets.append(operations)
    return data_sets

def align_datasets(data_set1, data_set2):
    # Erstellen von Dictionaries für schnellen Zugriff
    dict1 = {op: time for op, time in data_set1}
    dict2 = {op: time for op, time in data_set2}

    # Erstellen einer Liste aller Operationen in beiden Datensätzen
    all_operations = sorted(set(dict1.keys()).union(set(dict2.keys())))

    # Wenn eine Operation nicht in einem der Datensätze vorhanden ist, setzen wir den Wert auf 0
    aligned_data_set1 = [(op, dict1.get(op, 0)) for op in all_operations]
    aligned_data_set2 = [(op, dict2.get(op, 0)) for op in all_operations]

    return aligned_data_set1, aligned_data_set2

def plot_comparison(data_set1, data_set2, output_file):
    plt.figure(figsize=(12, 8))

    # Daten aus den Datensätzen extrahieren
    labels1, values1 = zip(*data_set1)
    labels2, values2 = zip(*data_set2)

    # Define the bar width and positions
    bar_width = 0.35
    x = range(len(labels1))

    # Plot bars for the first dataset
    plt.bar(x, values1, width=bar_width, label='Benchmark mit IO_uring', align='center')

    # Plot bars for the second dataset, offset to the right
    plt.bar([p + bar_width for p in x], values2, width=bar_width, label='Benchmark alter Implementierung', align='center')

    plt.title('Operation Times Comparison', fontsize=24)
    plt.xlabel('Operations', fontsize=20)
    plt.ylabel('Time (s)', fontsize=20)
    plt.xticks([p + bar_width / 2 for p in x], labels1, rotation=45, fontsize=20)
    plt.yticks(fontsize=20)
    plt.grid(axis='y')
    plt.legend(fontsize=12)
    plt.tight_layout()  # Ensure everything fits without overlap

    plt.savefig(output_file)
    plt.close()

if __name__ == '__main__':
    file_path1 = '/home/ossi/github/bachlorthesis/build/benchmark.txt'
    file_path2 = '/home/ossi/github/bachlorthesis/bench/oldbenchmark/benchmark2.txt'
    
    data_sets1 = read_data(file_path1)
    data_sets2 = read_data(file_path2)
    
    output_dir = 'comparison_plots2'
    if not os.path.exists(output_dir):
        os.makedirs(output_dir)

    for idx, (data_set1, data_set2) in enumerate(zip(data_sets1, data_sets2)):
        aligned_data_set1, aligned_data_set2 = align_datasets(data_set1, data_set2)
        output_file = os.path.join(output_dir, f'comparison_{idx + 1}.png')
        plot_comparison(aligned_data_set1, aligned_data_set2, output_file)