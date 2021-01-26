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
#include "gf_p4482241_type.h"
#include "gf_p4482241_pack.h"
#include "gf_p4482241_arith.h"
#include "KL_p4482241_410_103.h"

int KL_p4482241_410_103_scalarmult(uchar8 *q, const uchar8 *n, const uchar8 *p) {

	vec t[NLIMBS_VEC]   = {0};
	vec r[2*NLIMBS_VEC] = {0};

	gfe_p4482241_16L u[2];
	gfe_p4482241_7L  v[2];

	uchar8 i,s[CRYPTO_BYTES];

	for (i=0;i<CRYPTO_BYTES;++i) s[i] = n[i];
        s[CRYPTO_BYTES-1] = s[CRYPTO_BYTES-1] | 0x80;
	s[0] = s[0] & 0xFC;

	gfp4482241pack(u,p); 

	r[0][2] = r[NLIMBS_VEC][3] = u[0].l[0]; 
	r[0][3] = r[NLIMBS_VEC][2] = 1;
	r[NLIMBS_VEC][0] = b_sq; r[NLIMBS_VEC][1] = a_sq; 

	for (i=1;i<NLIMBS_VEC;++i) {r[i][2] = u[0].l[i]; r[NLIMBS_VEC+i][3] = u[0].l[i];}

	KL_p4482241_410_103_mladder(t,r,s);

	for (i=0;i<NLIMBS_VEC;++i) {u[0].l[i] = t[i][0]; u[1].l[i] = t[i][1];}

	gfp4482241pack167(v,u);
	gfp4482241pack167(v+1,u+1);

	#if defined(__ADX__)

		gfp4482241invx(v+1,v+1);
		gfp4482241mulx(v,v,v+1);
	#else
		gfe_p4482241_8L  w[2];

		gfp4482241pack78(w,v);
		gfp4482241pack78(w+1,v+1);

		gfp4482241inv(w+1,w+1);
		gfp4482241mul(w,w,w+1);
		gfp4482241pack87(v,w);
	#endif

	gfp4482241makeunique(v);
	gfp4482241unpack(q,v);

	return 0;
}

int KL_p4482241_410_103_scalarmult_base(uchar8 *q, const uchar8 *n, const uchar8 *p) {

	vec t[NLIMBS_VEC] = {0};
	vec r[NLIMBS_VEC] = {0};

	gfe_p4482241_16L u[2];
	gfe_p4482241_7L  v[2];

	uchar8 i,s[CRYPTO_BYTES];

	for (i=0;i<CRYPTO_BYTES;++i) s[i] = n[i];
        s[CRYPTO_BYTES-1] = s[CRYPTO_BYTES-1] | 0x80;
	s[0] = s[0] & 0xFC;

	gfp4482241pack(u,p); 

	r[0][3] = 1;
	for (i=0;i<NLIMBS_VEC;++i) r[i][2] = u[0].l[i];

	KL_p4482241_410_103_mladder_base(t,r,s);

	for (i=0;i<NLIMBS_VEC;++i) {u[0].l[i] = t[i][0]; u[1].l[i] = t[i][1];}

	gfp4482241pack167(v,u);
	gfp4482241pack167(v+1,u+1);

	#if defined(__ADX__)

		gfp4482241invx(v+1,v+1);
		gfp4482241mulx(v,v,v+1);
	#else
		gfe_p4482241_8L  w[2];

		gfp4482241pack78(w,v);
		gfp4482241pack78(w+1,v+1);
		gfp4482241inv(w+1,w+1);
		gfp4482241mul(w,w,w+1);
		gfp4482241pack87(v,w);
	#endif

	gfp4482241makeunique(v);
	gfp4482241unpack(q,v);

	return 0;
}