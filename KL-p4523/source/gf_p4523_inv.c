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
#include "gf_p4523_type.h"
#include "gf_p4523_arith.h"

void gfp4523invx(gfe_p4523_8L *einv, const gfe_p4523_8L *e) {	

	gfe_p4523_8L t,t3,t12,t13,t2_4_0,t2_9_0,t2_10_0,t2_20_0,t2_40_0,t2_50_0,t2_100_0,t2_200_0;

	/* 2  */ gfp4523sqrx(&t,e);
	/* 3  */ gfp4523mulx(&t3,&t,e); 
	/* 12 */ gfp4523nsqrx(&t12,&t3,2);
	/* 13 */ gfp4523mulx(&t13,&t12,e);  

	/* 2^4  -  1     */ gfp4523mulx(&t2_4_0,&t12,&t3);

	/* 2^5  -  2     */ gfp4523sqrx(&t,&t2_4_0);	
	/* 2^5  -  1     */ gfp4523mulx(&t,&t,e);

	/* 2^9  -  2^4   */ gfp4523nsqrx(&t,&t,4);	
	/* 2^9  -  1     */ gfp4523mulx(&t2_9_0,&t,&t2_4_0);

	/* 2^10 -  2^1   */ gfp4523sqrx(&t,&t2_9_0);
	/* 2^10 -  1     */ gfp4523mulx(&t2_10_0,&t,e);

	/* 2^20 -  2^10  */ gfp4523nsqrx(&t,&t2_10_0,10);
	/* 2^20 -  1     */ gfp4523mulx(&t2_20_0,&t,&t2_10_0);

	/* 2^40 - 2^20   */ gfp4523nsqrx(&t,&t2_20_0,20);
	/* 2^40 - 1      */ gfp4523mulx(&t2_40_0,&t,&t2_20_0);

	/* 2^50 -  2^10  */ gfp4523nsqrx(&t,&t2_40_0,10); 
	/* 2^50 -  1     */ gfp4523mulx(&t2_50_0,&t,&t2_10_0);

	/* 2^100 - 2^50  */ gfp4523nsqrx(&t,&t2_50_0,50);
	/* 2^100 - 1     */ gfp4523mulx(&t2_100_0,&t,&t2_50_0);

	/* 2^200 - 2^100 */ gfp4523nsqrx(&t,&t2_100_0,100);
	/* 2^200 - 1     */ gfp4523mulx(&t2_200_0,&t,&t2_100_0);

	/* 2^400 - 2^200 */ gfp4523nsqrx(&t,&t2_200_0,200);
	/* 2^400 - 1     */ gfp4523mulx(&t,&t,&t2_200_0);

	/* 2^440 - 2^40   */ gfp4523nsqrx(&t,&t,40); 
	/* 2^440 - 1     */ gfp4523mulx(&t,&t,&t2_40_0);

	/* 2^449 - 2^9   */ gfp4523nsqrx(&t,&t,9);
	/* 2^449 - 1     */ gfp4523mulx(&t,&t,&t2_9_0);

	/* 2^452 - 2^3   */ gfp4523nsqrx(&t,&t,3);
	/* 2^452 - 5     */ gfp4523mulx(einv,&t,&t3);
}

void gfp4523inv(gfe_p4523_8L *einv, const gfe_p4523_8L *e) {	

	gfe_p4523_8L t,t3,t12,t13,t2_4_0,t2_9_0,t2_10_0,t2_20_0,t2_40_0,t2_50_0,t2_100_0,t2_200_0;

	/* 2  */ gfp4523sqr(&t,e);
	/* 3  */ gfp4523mul(&t3,&t,e); 
	/* 12 */ gfp4523nsqr(&t12,&t3,2);
	/* 13 */ gfp4523mul(&t13,&t12,e);  

	/* 2^4  -  1     */ gfp4523mul(&t2_4_0,&t12,&t3);

	/* 2^5  -  2     */ gfp4523sqr(&t,&t2_4_0);	
	/* 2^5  -  1     */ gfp4523mul(&t,&t,e);

	/* 2^9  -  2^4   */ gfp4523nsqr(&t,&t,4);	
	/* 2^9  -  1     */ gfp4523mul(&t2_9_0,&t,&t2_4_0);

	/* 2^10 -  2^1   */ gfp4523sqr(&t,&t2_9_0);
	/* 2^10 -  1     */ gfp4523mul(&t2_10_0,&t,e);

	/* 2^20 -  2^10  */ gfp4523nsqr(&t,&t2_10_0,10);
	/* 2^20 -  1     */ gfp4523mul(&t2_20_0,&t,&t2_10_0);

	/* 2^40 - 2^20   */ gfp4523nsqr(&t,&t2_20_0,20);
	/* 2^40 - 1      */ gfp4523mul(&t2_40_0,&t,&t2_20_0);

	/* 2^50 -  2^10  */ gfp4523nsqr(&t,&t2_40_0,10); 
	/* 2^50 -  1     */ gfp4523mul(&t2_50_0,&t,&t2_10_0);

	/* 2^100 - 2^50  */ gfp4523nsqr(&t,&t2_50_0,50);
	/* 2^100 - 1     */ gfp4523mul(&t2_100_0,&t,&t2_50_0);

	/* 2^200 - 2^100 */ gfp4523nsqr(&t,&t2_100_0,100);
	/* 2^200 - 1     */ gfp4523mul(&t2_200_0,&t,&t2_100_0);

	/* 2^400 - 2^200 */ gfp4523nsqr(&t,&t2_200_0,200);
	/* 2^400 - 1     */ gfp4523mul(&t,&t,&t2_200_0);

	/* 2^440 - 2^40   */ gfp4523nsqr(&t,&t,40); 
	/* 2^440 - 1     */ gfp4523mul(&t,&t,&t2_40_0);

	/* 2^449 - 2^9   */ gfp4523nsqr(&t,&t,9);
	/* 2^449 - 1     */ gfp4523mul(&t,&t,&t2_9_0);

	/* 2^452 - 2^3   */ gfp4523nsqr(&t,&t,3);
	/* 2^452 - 5     */ gfp4523mul(einv,&t,&t3);
}
