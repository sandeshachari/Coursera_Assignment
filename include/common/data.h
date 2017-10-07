

#ifndef __DATA_H__
#define __DATA_H__


// typedef unsigned char bool;
// #define false	(0)
// #define true	(1)


uint8_t my_itoa(int32_t data, uint8_t * ptr, uint32_t base);

int32_t my_atoi(uint8_t * ptr, uint8_t digits, uint32_t base);

void reverse(uint8_t *s, uint8_t num);

#endif /* __DATA_H__ */