#include "matrix.h"

matrix_t* create_matrix(size_t rows, size_t cols) {
    matrix_t *m = (matrix_t*) malloc(sizeof(size_t) * 2 + sizeof(double*));
    m->rows = rows;
    m->cols = cols;
    m->array = (double*) malloc(sizeof(double) * rows * cols);
    return m;
}

void destroy_matrix(matrix_t *m) {
    free(m->array);
    free(m);
}

int print_matrix(FILE* fp, matrix_t *m) {
    int i;
    fprintf(fp, "%d", (int) m->rows);
    for (i = 0; i < m->rows * m->cols; ++i) {
        fprintf(fp, " %g", m->array[i]);
    }
    fprintf(fp, "\n");
    return 0;
}

matrix_t* matrix_multiply(matrix_t *m1, matrix_t* m2) {
    matrix_t *m3 = create_matrix(m1->rows, m2->cols);
    int dim = m1->rows; // hypothesis: square matrixes
    int i, j;
    for (i = 0; i < dim * dim; ++i) {
        m3->array[i] = 0;
        for (j = 0; j < dim; ++j) {
            m3->array[i] += m1->array[(i / dim)*dim + j] * m2->array[i%dim + j * dim];
        }
    }
    return m3;
}

void print_matrix_2d(matrix_t *m) {
    int i;
    for (i = 0; i < m->rows * m->cols; ++i) {
        if (i % m->cols == 0) {
            printf("\n");
        }
        printf("%f ", m->array[i]);        
    }
    printf("\n");
}

