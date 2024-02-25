#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <fuzzer/FuzzedDataProvider.h>

#include "elk.h"

extern "C" int LLVMFuzzerTestOneInput(const uint8_t *Data, size_t Size) {
    char mem[1024];
    FuzzedDataProvider fdp(Data, Size);
    std::string random_string = fdp.ConsumeRandomLengthString();
    const char *str = random_string.c_str();
    struct js *js = js_create(mem, sizeof(mem));
    js_eval(js, str, strlen(str));
    return 0; 
}
