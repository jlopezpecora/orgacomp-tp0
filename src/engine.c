#include <stdio.h>
#include <stdlib.h>
#include <ctype.h>
#include <errno.h>
#include "debug.h"
#include "engine.h"
#include "matrix.h"

static int fgetline(FILE *f, char** line, int len);
static int parseline(char *filepath, matrix_t **m1, matrix_t **m2);
static int loadMatrix(char **line, matrix_t *m);
static int getInteger(int *d, char **linepos);
static int getDouble(double *d, char **linepos);

void run() {
    matrix_t *m1 = NULL;
    matrix_t *m2 = NULL;
    matrix_t *m3 = NULL;  

    char* line;
    while (!feof(stdin)) {
        line = malloc(sizeof(char) * BUFFER_SIZE);
        if (fgetline(stdin, &line, BUFFER_SIZE) > 0) {
            debug_print("line: %s\n", line);
            if (parseline(line, &m1, &m2) != 0) {
                free(line);
                fprintf(stderr, "parse error\n");
                exit(EXIT_FAILURE);
            }
            
            m3 = matrix_multiply(m1, m2);
            #ifdef DEBUG
            print_matrix_2d(m3);
            #endif
            print_matrix(stdout, m3);

            destroy_matrix(m1);
            destroy_matrix(m2);
            destroy_matrix(m3);

        }
        free(line);
    }
}

static int fgetline(FILE *f, char** buff, int len) {
    int i;
    char c;
    for (i = 0; i < len - 1 && (c = fgetc(f)) != '\n' && c != EOF ; ++i) {
        if (i == (len - 2)) {
            *buff = realloc(*buff, (len += len/2) * sizeof(char));
        }
        *(*buff + i) = c;
    }
    *(*buff + i) = '\0';
    return i;
}

static int parseline(char *line, matrix_t **m1, matrix_t **m2) {
    char *linepos = line;
    int dim;
    int err;

    // get dimension
    if ((err = getInteger(&dim, &linepos)) != 0) {
        return err;
    }
    debug_print("dim: %d\n", dim);

    *m1 = create_matrix(dim, dim);
    if ((err = loadMatrix(&linepos, *m1)) != 0) {
        destroy_matrix(*m1);
        return err;
    }
    #ifdef DEBUG
    print_matrix_2d(*m1);
    #endif

    *m2 = create_matrix(dim, dim);
    if ((err = loadMatrix(&linepos, *m2)) != 0) {
        destroy_matrix(*m1);
        destroy_matrix(*m2);
        return err;
    }
    #ifdef DEBUG
    print_matrix_2d(*m2);
    #endif

    return 0;
}

static void advanceBlanks(char **pos) {
    while (**pos == ' ') {
        ++(*pos);
    }
}

static int invalidChar(char** pos) {
    return pos != NULL  && *pos != NULL && **pos != ' ' && **pos != '\0';
}

static int getInteger(int *d, char **linepos) {
    advanceBlanks(linepos);
    errno = 0;
    long n = strtol(*linepos, linepos, 10);
    if (errno != 0 || invalidChar(linepos)) {
        return ERR_INVALID_INPUT;
    }
    *d = (int) n;
    return 0;
}

static int getDouble(double *d, char** linepos) {
    advanceBlanks(linepos);
    errno = 0;
    *d = strtod(*linepos, linepos);
    return (errno != 0 || invalidChar(linepos)) ? ERR_INVALID_INPUT : 0;
}

static int loadMatrix(char **linepos, matrix_t *m) {
    int i;
    for (i = 0; i < m->rows * m->cols; ++i) {
        if (getDouble(m->array + i, linepos) != 0) {
            return ERR_INVALID_INPUT;
        }
    }
    return 0;
}

