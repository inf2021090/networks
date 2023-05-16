import csv

csv_file = 'data.csv'
nq_file = 'Nq.txt'
tq_file = 'Tq.txt'
ns_file = 'Ns.txt'
column_nq = 9  # Index of column 10 (0-based)
column_tq = 8  # Index of column 9 (0-based)
column_ns = 5  # Index of column 6 (0-based)

# Read CSV file
csv_data = []
with open(csv_file, 'r') as file:
    csv_reader = csv.reader(file)
    for row in csv_reader:
        csv_data.append(row)

# Read Nq.txt and update column 10
with open(nq_file, 'r') as file:
    nq_lines = file.readlines()

for i, line in enumerate(nq_lines):
    if i < len(csv_data):
        csv_data[i][column_nq] = line.strip()

# Read Tq.txt and update column 9
with open(tq_file, 'r') as file:
    tq_lines = file.readlines()

for i, line in enumerate(tq_lines):
    if i < len(csv_data):
        csv_data[i][column_tq] = line.strip()

# Read Ns.txt and update column 6
with open(ns_file, 'r') as file:
    ns_lines = file.readlines()

for i, line in enumerate(ns_lines):
    if i < len(csv_data):
        csv_data[i][column_ns] = line.strip()

# Write modified data back to CSV file
with open(csv_file, 'w', newline='') as file:
    csv_writer = csv.writer(file)
    csv_writer.writerows(csv_data)

