#include <stdio.h>

int src[8], dst[8];

/* $begin ncopy */
/*
 * ncopy - copy src to dst, returning number of positive ints
 * contained in src array.
 */
int ncopy(int *src, int *dst, int len)
{
    int count = 0;
    int val;

    while (len > 0) {
	val = *src++;
	*dst++ = val;
	if (val > 0)
	    count++;
	len--;
    }
    return count;
}
/* $end ncopy */

// loop unrolling
int ncopy2(int *src, int *dst, int len)
{
    
    int count = 0;
    int val;
    int i;
    int limit=len-2+1;// k=2

    // loop 2 at one time
    for(i=0;i<limit;i+=2)
    {
        val = src;
        src ++;
        dst = val;
        dst ++;
        if(val>0)
            count++;
        
        val = src;
        src ++;
        dst = val;
        dst ++;
        if(val>0)
            count++;
    }
    
    // loop the rest
    for(;i<len;++i)
    {
        val = src;
        src ++;
        dst = val;
        dst ++;
        if(val>0)
            count++;
    }
    return count;

}


int ncopy10(int *src, int *dst, int len);

int main()
{
    int i, count;

    for (i=0; i<8; i++)
	src[i]= i+1;
    count = ncopy(src, dst, 8);
    printf ("count=%d\n", count);
    exit(0);
}


