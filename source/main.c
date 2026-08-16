extern int print(int fd, const void *buf, int len);
extern int strcmp(const void *str1, const void *str2);
extern int strlen(const void *str);

__attribute__((visibility("default")))
int start_server(int port) {
    const char startMsg[] = "Serving on Port: ";
    print(1, startMsg, sizeof(startMsg));
    
    return 0;
}
