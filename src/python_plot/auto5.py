# import matplotlib.pyplot as plt
# import re
# from collections import defaultdict

# import os

# def read_data(file_path):
#     data_sets = []
#     with open(file_path, 'r') as file:
#         for line in file:
#             entries = line.strip().split(',')
#             operations = defaultdict(float)
#             for entry in entries:
#                 if entry:
#                     operation, time_str = entry.split(':')
#                     time = float(re.sub(r's$', '', time_str))  # Entferne das 's' und konvertiere zu float
#                     operations[operation] += time
#             data_sets.append(operations)
#     return data_sets

# def plot_data(data_sets1, data_sets2, output_file):
#     plt.figure(figsize=(12, 8))

#     # Plot data from the first file
#     for idx, operations in enumerate(data_sets1):
#         operations_items = sorted(operations.items())
#         labels, values = zip(*operations_items)
#         plt.plot(labels, values, label=f'File 1 Dataset {idx + 1}', marker='o')

#     # Plot data from the second file
#     for idx, operations in enumerate(data_sets2):
#         operations_items = sorted(operations.items())
#         labels, values = zip(*operations_items)
#         plt.plot(labels, values, label=f'File 2 Dataset {idx + 1}', marker='x')

#     plt.title('Operation Times from Two Files', fontsize=20)
#     plt.xlabel('Operations', fontsize=16)
#     plt.ylabel('Time (s)', fontsize=16)
#     plt.xticks(rotation=45, fontsize=14)
#     plt.yticks(fontsize=14)
#     plt.grid(axis='y')
#     plt.legend(fontsize=12)
#     plt.tight_layout()  # Ensure everything fits without overlap

#     plt.savefig(output_file)
#     plt.close()

# if __name__ == '__main__':
#     file_path1 = '/home/ossi/github/bachlorthesis/build/benchmark.txt'
#     file_path2 = '/home/ossi/github/bachlorthesis/bench/oldbenchmark/benchmark2.txt'
#     output_file = 'operation_times_comparison.png'
    
    
#     data_sets1 = read_data(file_path1)
#     data_sets2 = read_data(file_path2)
    
#     output_dir = 'comparison_plots'
#     if not os.path.exists(output_dir):
#         os.makedirs(output_dir)

#     for idx, (data_set1, data_set2) in enumerate(zip(data_sets1, data_sets2)):
#         output_file = os.path.join(output_dir, f'comparison_{idx + 1}.png')
#         plot_comparison(data_set1, data_set2, output_file)