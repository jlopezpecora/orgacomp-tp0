#include <stdio.h>
#include <stdlib.h>

typedef struct matrix {
    size_t rows;
    size_t cols;
    double* array;
} matrix_t;

matrix_t* create_matrix(size_t rows, size_t cols);

void destroy_matrix(matrix_t *m);

int print_matrix(FILE* fp, matrix_t *m);

matrix_t* matrix_multiply(matrix_t *m1, matrix_t* m2);

void print_matrix_2d(matrix_t *m);
