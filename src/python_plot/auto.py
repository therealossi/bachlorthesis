import matplotlib.pyplot as plt
import re
from collections import defaultdict

def read_data(file_path):
    operations = defaultdict(list)
    with open(file_path, 'r') as file:
        for line in file:
            entries = line.strip().split(',')
            for entry in entries:
                if entry:
                    operation, time_str = entry.split(':')
                    time = float(re.sub(r's$', '', time_str))  # Entferne das 's' und konvertiere zu float
                    operations[operation].append(time)
    return operations

def plot_data(operations):
    plt.figure(figsize=(10, 6))
    for operation, times in operations.items():
        plt.plot(range(1, len(times) + 1), times, marker='o', label=operation)

    plt.title('Operation Times from TXT File')
    plt.xlabel('Measurement Number')
    plt.ylabel('Time (s)')
    plt.legend()
    plt.grid(True)
    plt.show()

if __name__ == '__main__':
    file_path = '/home/ossi/Github/bachlorthesis/build/benchmark.txt'
    operations = read_data(file_path)
    plot_data(operations)
