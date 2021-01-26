/*
+-----------------------------------------------------------------------------+
| This code corresponds to the the paper "Kummer versus Montgomery Face-off   |
| over Prime Order Fields" by 						      |
| Kaushik Nath,  Indian Statistical Institute, Kolkata, India, and            |
| Palash Sarkar, Indian Statistical Institute, Kolkata, India.	              |
+-----------------------------------------------------------------------------+
| Copyright (c) 2021, Kaushik Nath and Palash Sarkar.                         |
|                                                                             |
| Permission to use this code is granted.                          	      |
|                                                                             |
| Redistribution and use in source and binary forms, with or without          |
| modification, are permitted provided that the following conditions are      |
| met:                                                                        |
|                                                                             |
| * Redistributions of source code must retain the above copyright notice,    |
|   this list of conditions and the following disclaimer.                     |
|                                                                             |
| * Redistributions in binary form must reproduce the above copyright         |
|   notice, this list of conditions and the following disclaimer in the       |
|   documentation and/or other materials provided with the distribution.      |
|                                                                             |
| * The names of the contributors may not be used to endorse or promote       |
|   products derived from this software without specific prior written        |
|   permission.                                                               |
+-----------------------------------------------------------------------------+
| THIS SOFTWARE IS PROVIDED BY THE AUTHORS ""AS IS"" AND ANY EXPRESS OR       |
| IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES   |
| OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED.     |
| IN NO EVENT SHALL THE CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT,      |
| INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT    |
| NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,   |
| DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY       |
| THEORY LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING |
| NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE,| 
| EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.                          |
+-----------------------------------------------------------------------------+
*/

#include "basic_types.h"
#include "gf_p5211_type.h"
#include "gf_p5211_pack.h"

void gfp5211pack(gfe_p5211_18L *v, const uchar8 *u) {

	uchar8 i,j,k,l;
	gfe_p5211_9L t;

	for (i=0;i<NLIMBS-1;++i) {
	
		j = i*8;
		t.l[i] = (uint64)u[j]; l = 1;
		for (k=1;k<9;++k)
			t.l[i] |= ((uint64)u[j+l++] << k*8);
	}
	j = i*8;
	t.l[NLIMBS-1] = (uint64)u[j] | ((uint64)u[j+1] << 8);

	v->l[ 0] = ((t.l[0] & 0x000000001FFFFFFF));
	v->l[ 1] = ((t.l[0] & 0x03FFFFFFE0000000) >> 29);
	v->l[ 2] = ((t.l[0] & 0xFC00000000000000) >> 58) | ((t.l[1] & 0x00000000007FFFFF) <<  6);
	v->l[ 3] = ((t.l[1] & 0x000FFFFFFF800000) >> 23);
	v->l[ 4] = ((t.l[1] & 0xFFF0000000000000) >> 52) | ((t.l[2] & 0x000000000001FFFF) << 12);
	v->l[ 5] = ((t.l[2] & 0x00003FFFFFFE0000) >> 17);
	v->l[ 6] = ((t.l[2] & 0xFFFFC00000000000) >> 46) | ((t.l[3] & 0x00000000000007FF) << 18);
	v->l[ 7] = ((t.l[3] & 0x000000FFFFFFF800) >> 11);
	v->l[ 8] = ((t.l[3] & 0xFFFFFF0000000000) >> 40) | ((t.l[4] & 0x000000000000001F) << 24);
	v->l[ 9] = ((t.l[4] & 0x00000003FFFFFFE0) >>  5);
	v->l[10] = ((t.l[4] & 0x7FFFFFFC00000000) >> 34);
	v->l[11] = ((t.l[4] & 0x8000000000000000) >> 63) | ((t.l[5] & 0x000000000FFFFFFF) <<  1);
	v->l[12] = ((t.l[5] & 0x01FFFFFFF0000000) >> 28);
	v->l[13] = ((t.l[5] & 0xFE00000000000000) >> 57) | ((t.l[6] & 0x00000000003FFFFF) <<  7);
	v->l[14] = ((t.l[6] & 0x0007FFFFFFC00000) >> 22);
	v->l[15] = ((t.l[6] & 0xFFF8000000000000) >> 51) | ((t.l[7] & 0x000000000000FFFF) << 13);
	v->l[16] = ((t.l[7] & 0x00001FFFFFFF0000) >> 16);
	v->l[17] = ((t.l[7] & 0xFFFFE00000000000) >> 45) | ((t.l[8] & 0x00000000000001FF) << 19);

}

void gfp5211pack189(gfe_p5211_9L *v,const gfe_p5211_18L *u) {

        v->l[0] = ((u->l[ 0] & 0x000000001FFFFFFF))       | ((u->l[ 1] & 0x000000001FFFFFFF) << 29) | ((u->l[ 2] & 0x000000000000003F) << 58);
        v->l[1] = ((u->l[ 2] & 0x000000001FFFFFC0) >>  6) | ((u->l[ 3] & 0x000000001FFFFFFF) << 23) | ((u->l[ 4] & 0x0000000000000FFF) << 52);
     	v->l[2] = ((u->l[ 4] & 0x000000001FFFF000) >> 12) | ((u->l[ 5] & 0x000000001FFFFFFF) << 17) | ((u->l[ 6] & 0x000000000003FFFF) << 46);
        v->l[3] = ((u->l[ 6] & 0x000000001FFC0000) >> 18) | ((u->l[ 7] & 0x000000001FFFFFFF) << 11) | ((u->l[ 8] & 0x0000000000FFFFFF) << 40);
     	v->l[4] = ((u->l[ 8] & 0x000000001F000000) >> 24) | ((u->l[ 9] & 0x000000001FFFFFFF) <<  5) | ((u->l[10] & 0x000000001FFFFFFF) << 34) | ((u->l[11] & 0x0000000000000001) << 63);
     	v->l[5] = ((u->l[11] & 0x000000001FFFFFFE) >>  1) | ((u->l[12] & 0x000000001FFFFFFF) << 28) | ((u->l[13] & 0x000000000000007F) << 57);
     	v->l[6] = ((u->l[13] & 0x000000001FFFFF80) >>  7) | ((u->l[14] & 0x000000001FFFFFFF) << 22) | ((u->l[15] & 0x0000000000001FFF) << 51);
     	v->l[7] = ((u->l[15] & 0x000000001FFFE000) >> 13) | ((u->l[16] & 0x000000001FFFFFFF) << 16) | ((u->l[17] & 0x000000000007FFFF) << 45);
     	v->l[8] = ((u->l[17] & 0x000000000FF80000) >> 19);
}

void  gfp5211pack99(gfe_p5211_9L *v, const gfe_p5211_9L *u) {

	v->l[0] = ((u->l[0] & 0x03FFFFFFFFFFFFFF));
	v->l[1] = ((u->l[0] & 0xFC00000000000000) >> 58) | ((u->l[1] & 0x000FFFFFFFFFFFFF) << 6);
	v->l[2] = ((u->l[1] & 0xFFF0000000000000) >> 52) | ((u->l[2] & 0x00003FFFFFFFFFFF) << 12);
	v->l[3] = ((u->l[2] & 0xFFFFC00000000000) >> 46) | ((u->l[3] & 0x000000FFFFFFFFFF) << 18);
	v->l[4] = ((u->l[3] & 0xFFFFFF0000000000) >> 40) | ((u->l[4] & 0x00000003FFFFFFFF) << 24);
	v->l[5] = ((u->l[4] & 0xFFFFFFFC00000000) >> 34) | ((u->l[5] & 0x000000000FFFFFFF) << 30);
	v->l[6] = ((u->l[5] & 0xFFFFFFFFF0000000) >> 28) | ((u->l[6] & 0x00000000003FFFFF) << 36);
	v->l[7] = ((u->l[6] & 0xFFFFFFFFFFC00000) >> 22) | ((u->l[7] & 0x000000000000FFFF) << 42);
	v->l[8] = ((u->l[7] & 0xFFFFFFFFFFFF0000) >> 16) | ((u->l[8] & 0x00000000000001FF) << 48);
}

void  gfp5211unpack99(gfe_p5211_9L *v, const gfe_p5211_9L *u) {									

	v->l[0] = ((u->l[0] & 0x03FFFFFFFFFFFFFF))       | ((u->l[1] & 0x000000000000003F) << 58);
	v->l[1] = ((u->l[1] & 0x03FFFFFFFFFFFFC0) >>  6) | ((u->l[2] & 0x0000000000000FFF) << 52);
	v->l[2] = ((u->l[2] & 0x03FFFFFFFFFFF000) >> 12) | ((u->l[3] & 0x000000000003FFFF) << 46);
	v->l[3] = ((u->l[3] & 0x03FFFFFFFFFC0000) >> 18) | ((u->l[4] & 0x0000000000FFFFFF) << 40);
	v->l[4] = ((u->l[4] & 0x03FFFFFFFF000000) >> 24) | ((u->l[5] & 0x000000003FFFFFFF) << 34);
	v->l[5] = ((u->l[5] & 0x03FFFFFFC0000000) >> 30) | ((u->l[6] & 0x0000000FFFFFFFFF) << 28);
	v->l[6] = ((u->l[6] & 0x03FFFFF000000000) >> 36) | ((u->l[7] & 0x000003FFFFFFFFFF) << 22);
	v->l[7] = ((u->l[7] & 0x03FFFC0000000000) >> 42) | ((u->l[8] & 0x0000FFFFFFFFFFFF) << 16);
	v->l[8] = ((u->l[8] & 0x01FF000000000000) >> 48);
}

void gfp5211unpack(uchar8 *v, const gfe_p5211_9L *u) {

	uchar8 i,j;
	for (i=0;i<NLIMBS-1;++i) {

		j = i*8;
		v[j+0] = (uchar8)((u->l[i] & 0x00000000000000FF));
		v[j+1] = (uchar8)((u->l[i] & 0x000000000000FF00) >>  8);
		v[j+2] = (uchar8)((u->l[i] & 0x0000000000FF0000) >> 16);
		v[j+3] = (uchar8)((u->l[i] & 0x00000000FF000000) >> 24);
		v[j+4] = (uchar8)((u->l[i] & 0x000000FF00000000) >> 32);
		v[j+5] = (uchar8)((u->l[i] & 0x0000FF0000000000) >> 40);
		v[j+6] = (uchar8)((u->l[i] & 0x00FF000000000000) >> 48);
		v[j+7] = (uchar8)((u->l[i] & 0xFF00000000000000) >> 56);
	}
	j = i*8;
	v[j+0] = (uchar8)((u->l[NLIMBS-1] & 0x00000000000000FF));
	v[j+1] = (uchar8)((u->l[NLIMBS-1] & 0x000000000000FF00) >> 8);
}
