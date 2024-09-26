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

def plot_comparison(data_set1, data_set2, output_file):
    plt.figure(figsize=(12, 8))

    # Plot data from the first dataset
    labels1, values1 = zip(*data_set1)
    plt.plot(labels1, values1, label='Benchmark mit IO_uring', marker='o')

    # Plot data from the second dataset
    labels2, values2 = zip(*data_set2)
    plt.plot(labels2, values2, label='Benchmark alter Implementierung', marker='x')

    plt.title('Operation Times Comparison', fontsize=24)
    plt.xlabel('Operations', fontsize=20)
    plt.ylabel('Time (s)', fontsize=20)
    plt.xticks(rotation=45, fontsize=20)
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
    
    output_dir = 'comparison_plots'
    if not os.path.exists(output_dir):
        os.makedirs(output_dir)

    for idx, (data_set1, data_set2) in enumerate(zip(data_sets1, data_sets2)):
        output_file = os.path.join(output_dir, f'comparison_{idx + 1}.png')
        plot_comparison(data_set1, data_set2, output_file)
