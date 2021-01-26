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

#include "gf_p2663_pack.h"

void gfp2663pack(gfe_p2663_10L *v,const uchar8 *u) {

	uchar8 i,j,k,l;
	gfe_p2663_5L t;

	for (i=0;i<NLIMBS-1;++i) {
	
		j = i*8;
		t.l[i] = (uint64)u[j]; l = 1;
		for (k=1;k<9;++k)
			t.l[i] |= ((uint64)u[j+l++]  << k*8);
	}
	j = i*8;
	t.l[NLIMBS-1] = (uint64)u[j] | (uint64)u[j+1] << 8;

	v->l[0] = ((t.l[0] & 0x0000000007FFFFFF));
	v->l[1] = ((t.l[0] & 0x003FFFFFF8000000) >> 27);
	v->l[2] = ((t.l[0] & 0xFFC0000000000000) >> 54) | ((t.l[1] & 0x000000000001FFFF) << 10);
	v->l[3] = ((t.l[1] & 0x00000FFFFFFE0000) >> 17);
	v->l[4] = ((t.l[1] & 0xFFFFF00000000000) >> 44) | ((t.l[2] & 0x000000000000007F) << 20);
	v->l[5] = ((t.l[2] & 0x00000003FFFFFF80) >> 7);
	v->l[6] = ((t.l[2] & 0x1FFFFFFC00000000) >> 34);
	v->l[7] = ((t.l[2] & 0xE000000000000000) >> 61) | ((t.l[3] & 0x0000000000FFFFFF) << 3);
	v->l[8] = ((t.l[3] & 0x0007FFFFFF000000) >> 24);
	v->l[9] = ((t.l[3] & 0xFFF8000000000000) >> 51) | ((t.l[4] & 0x00000000000003FF) << 13);
}

void gfp2663pack55(gfe_p2663_5L *v,const gfe_p2663_5L *u) {

	v->l[0] = ((u->l[0] & 0x003FFFFFFFFFFFFF));
	v->l[1] = ((u->l[0] & 0xFFC0000000000000) >> 54) | ((u->l[1] & 0x00000FFFFFFFFFFF) << 10);
	v->l[2] = ((u->l[1] & 0xFFFFF00000000000) >> 44) | ((u->l[2] & 0x00000003FFFFFFFF) << 20);
	v->l[3] = ((u->l[2] & 0xFFFFFFFC00000000) >> 34) | ((u->l[3] & 0x0000000000FFFFFF) << 30);
	v->l[4] = ((u->l[3] & 0xFFFFFFFFFF000000) >> 24) | ((u->l[4] & 0x00000000000003FF) << 40);  
}

void gfp2663unpack55(gfe_p2663_5L *v,const gfe_p2663_5L *u) {

	v->l[0] = ((u->l[0] & 0x003FFFFFFFFFFFFF))       | ((u->l[1] & 0x00000000000003FF) << 54);
	v->l[1] = ((u->l[1] & 0x003FFFFFFFFFFC00) >> 10) | ((u->l[2] & 0x00000000000FFFFF) << 44);
	v->l[2] = ((u->l[2] & 0x003FFFFFFFF00000) >> 20) | ((u->l[3] & 0x000000003FFFFFFF) << 34);
	v->l[3] = ((u->l[3] & 0x003FFFFFC0000000) >> 30) | ((u->l[4] & 0x000000FFFFFFFFFF) << 24);
	v->l[4] = ((u->l[4] & 0x0003FF0000000000) >> 40);  
}

void gfp2663pack105(gfe_p2663_5L *v,const gfe_p2663_10L *u) {

        v->l[0] = ((u->l[0] & 0x0000000007FFFFFF))       | ((u->l[1] & 0x0000000007FFFFFF) << 27) | ((u->l[2] & 0x00000000000003FF) << 54);
        v->l[1] = ((u->l[2] & 0x0000000007FFFC00) >> 10) | ((u->l[3] & 0x0000000007FFFFFF) << 17) | ((u->l[4] & 0x00000000000FFFFF) << 44);
        v->l[2] = ((u->l[4] & 0x0000000007F00000) >> 20) | ((u->l[5] & 0x0000000007FFFFFF) <<  7) | ((u->l[6] & 0x0000000007FFFFFF) << 34) | ((u->l[7] & 0x0000000000000007) << 61);
        v->l[3] = ((u->l[7] & 0x0000000007FFFFF8) >>  3) | ((u->l[8] & 0x0000000007FFFFFF) << 24) | ((u->l[9] & 0x0000000000001FFF) << 51);
	v->l[4] = ((u->l[9] & 0x00000000007FE000) >> 13);  
}

void gfp2663unpack(uchar8 *v,const gfe_p2663_5L *u) {

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
	v[j+1] = (uchar8)((u->l[NLIMBS-1] & 0x0000000000000300) >> 8);
}
