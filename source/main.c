extern int print(int fd, const void *buf, int len);
extern int strcmp(const void *str1, const void *str2);
extern int strlen(const void *str);
extern int inttostr(int num, char *buf);

__attribute__((visibility("default")))
int start_server(int port) {
    print(1, "Serving on Port: ", 17);
    char buf[32];
    int len = inttostr(port, buf);
    print(1, buf, len);
    print(1, "\n", 1);
    
    return 0;
}
