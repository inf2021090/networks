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

for i, row in enumerate(csv_data):
    if i < len(nq_lines):
        row[column_nq] = nq_lines[i].strip()

# Read Tq.txt and update column 9
with open(tq_file, 'r') as file:
    tq_lines = file.readlines()

for i, row in enumerate(csv_data):
    if i < len(tq_lines):
        row[column_tq] = tq_lines[i].strip()

# Read Ns.txt and update column 6
with open(ns_file, 'r') as file:
    ns_lines = file.readlines()

for i, row in enumerate(csv_data):
    if i < len(ns_lines):
        row[column_ns] = ns_lines[i].strip()

# Write modified data back to CSV file
with open(csv_file, 'w', newline='') as file:
    csv_writer = csv.writer(file)
    csv_writer.writerows(csv_data)
