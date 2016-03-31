#ifdef DEBUG
#define debug_print(fmt, ...) fprintf(stderr, "[DEBUG] "fmt, __VA_ARGS__)
#else
#define debug_print(fmt, ...)
#endif


