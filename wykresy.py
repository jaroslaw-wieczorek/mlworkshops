#!/usr/bin/env python
import matplotlib.pyplot as plt
import sys


def read_file(filename):
    values = []
    with open(filename) as f:
        for line in f:
            values.append(float(line.rstrip('\n')))
    return values


def main():
    input_file = sys.argv[1]
    output_file = sys.argv[2]

    # Get values
    values = read_file(input_file)

    # Setup values
    plt.plot(values)

    # Set x-label to 'executes'
    plt.xlabel('executes')

    # Set y-label to 'executes'
    ylabel_name = input_file.split('.')[0]
    plt.ylabel(ylabel_name)

    # Save fig with 800 dpi
    plt.savefig(output_file, dpi=800)
    plt.close()


if __name__ == "__main__":
    main()
