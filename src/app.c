#include <stdio.h>
#include <stdlib.h>
#include <getopt.h>
#include "engine.h"

#define VERSION 1.0
#define NO_ARGS 0

static void print_help();
static void print_version();

const char* short_options = "hV";

static struct option options[] = {
    { "help", NO_ARGS, NULL, 'h' },
    { "version", NO_ARGS, NULL, 'V' },
    { 0, 0 }
};

int main(int argc, char** argv) {
	int param = 0;
	int index = 0;
	if((param = getopt_long(argc, argv, short_options, options, &index)) != -1) {
		switch (param) {
			case 'h':
				print_help();
				break;
			case 'V':
				print_version();
				break;
			default:
				print_help();
				break;
		}
	} else {
        run();
    }
    return EXIT_SUCCESS;
}

static void print_version() {
    printf("Version: %-1.1f\n", VERSION);
}

static void print_help() {
	printf("Usage:\n"
           "  tp0 -h\n"
           "  tp0 -V\n"
           "  tp0 < in_file > out_file\n"
           "Options:\n"
           "  -V, --version    Print version and quit.\n"
           "  -h, --help       Print this information and quit.\n"
           "Examples:\n"
           "  tp0 < in.txt > out.txt\n"
           "  cat in.txt | tp0 > out.txt\n");
}

