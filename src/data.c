#include <stdio.h>
#include "typedef.h"
#include "data.h"
#include <math.h>

typedef unsigned char bool;
#define false	(0)
#define true	(1)


void reverse(uint8_t *s, uint8_t num){

	uint8_t temp;
	uint8_t start = 0;
	uint8_t end = num - 1;

	while(start < end){
		temp = s[start];
		s[start] = s[end];
		s[end] = temp;
		start++;
		end--;

	}
}



uint8_t my_itoa(int32_t data, uint8_t * ptr, uint32_t base){
    int i = 0;
    bool isNegative = false;

 
    /* Handle 0 explicitely, otherwise empty string is printed for 0 */
    if (data == 0)
    {
        ptr[i++] = '0';
        ptr[i] = '\0';
        return 0;
    }
 
    // In standard itoa(), negative numbers are handled only with 
    // base 10. Otherwise numbers are considered unsigned.
    if (data < 0 && base == 10)
    {
        isNegative = true;
        data = -data;
    }
 
    // Process individual digits
    while (data != 0)
    {
        int rem = data % base;
        ptr[i] = (rem > 9)? (rem-10) + 'a' : rem + '0';
        // ptr[i++] = (rem > 9)? (rem-10) + 'a' : rem + '0';
        // printf("%c\n", ptr[i]);
        data = data/base;
        i++;
    }
 
    // If number is negative, append '-'
    if (isNegative)
        ptr[i++] = '-';
 
    ptr[i] = '\0'; // Append string terminator
 
    // Reverse the string
    reverse(ptr, i);

 	// printf("\n\n");
    return i;
}



int32_t my_atoi(uint8_t * ptr, uint8_t digits, uint32_t base){

    int i = 0;
    int32_t num=0;
    int32_t tempNum=0, num1=0;
	bool isNegative = false;

	while(i < digits){
		// printf("ptr = %c\n",ptr[i] );
		if((base == 10) && (ptr[i] == 45)){
			isNegative = true;
		}else if (ptr[i] >= '0' && ptr[i] <= '9'){
			// printf("%d\n", ptr[i] - '0' );
			tempNum = (int)(ptr[i] - '0');
			// printf("%d\n", ptr[i]);
		}else{
			// printf("%d\n", ptr[i] - 'a' );
			tempNum = (int)(ptr[i] - 'a') + 10;
		}

		// printf("digits-i-1 = %d\n", digits-i-1);
		// printf("tempNum = %d\n", tempNum);
		num1 = tempNum*(int)(pow(base, (digits-i-1)));

		num = num + tempNum*(int)(pow((int)base, (int)(digits-i-1)));
		// num = (int)(pow(base, 3));
		// printf("num1 = %d\n", num1);
		
		i++;
	}

	if(isNegative){
		num = -num;
	}

	// printf("The number in int = %d\n", num);

	// printf("The number in string = %s\n", ptr);

	// printf("2 power 3 = %d\n", (int)(pow(base,3)));
	/* Handle 0 explicitely, otherwise empty string is printed for 0 */
	// if (data == 0)
	// {
	//     ptr[i++] = '0';
	//     ptr[i] = '\0';
	//     return 0;
	// }

	// In standard itoa(), negative numbers are handled only with 
	// base 10. Otherwise numbers are considered unsigned.
	// if (data < 0 && base == 10)
	// {
	//     isNegative = true;
	//     data = -data;
	// }

	// // Process individual digits
	// while (data != 0)
	// {
	//     int rem = data % base;
	//     ptr[i] = (rem > 9)? (rem-10) + 'a' : rem + '0';
	//     // ptr[i++] = (rem > 9)? (rem-10) + 'a' : rem + '0';
	//     printf("%d\n", ptr[i]);
	//     data = data/base;
	//     i++;
	// }

	// // If number is negative, append '-'
	// if (isNegative)
	//     ptr[i++] = '-';

	// ptr[i] = '\0'; // Append string terminator

	// // Reverse the string
	// // reverse(ptr, i);

	return num;

}