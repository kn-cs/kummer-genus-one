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
#include "gf_p51075_type.h"
#include "gf_p51075_arith.h"

void gfp51075invx(gfe_p51075_8L *einv, const gfe_p51075_8L *e) {

	gfe_p51075_8L t,t3,t6,t7,t14,t17,t2_5_0,t2_10_0,t2_20_0,t2_40_0,t2_125_0,t2_250_0;

 	/* 2   */  gfp51075sqrx(&t,e); 
  	/* 3   */  gfp51075mulx(&t3,&t,e); 
  	/* 6   */  gfp51075sqrx(&t6,&t3);
  	/* 7   */  gfp51075mulx(&t7,&t6,e);
  	/* 14  */  gfp51075sqrx(&t14,&t7);
  	/* 17  */  gfp51075mulx(&t17,&t14,&t3);

  	/* 2^5   -  1    */  gfp51075mulx(&t2_5_0,&t17,&t14); 

  	/* 2^10  -  2^5  */  gfp51075nsqrx(&t,&t2_5_0,5); 
  	/* 2^10  -  1    */  gfp51075mulx(&t2_10_0,&t,&t2_5_0); 

  	/* 2^20  -  2^10 */  gfp51075nsqrx(&t,&t2_10_0,10); 
  	/* 2^20  -  1    */  gfp51075mulx(&t2_20_0,&t,&t2_10_0); 

  	/* 2^40  -  2^20 */  gfp51075nsqrx(&t,&t2_20_0,20);   
  	/* 2^40  -  1    */  gfp51075mulx(&t2_40_0,&t,&t2_20_0);     

  	/* 2^80  -  2^40 */  gfp51075nsqrx(&t,&t2_40_0,40);     
  	/* 2^80  -  1    */  gfp51075mulx(&t,&t,&t2_40_0);     

  	/* 2^120 -  2^40 */  gfp51075nsqrx(&t,&t,40);    
  	/* 2^120 -  1    */  gfp51075mulx(&t,&t,&t2_40_0);   

  	/* 2^125 -  2^5  */  gfp51075nsqrx(&t,&t,5);     
 	/* 2^125 -  1    */  gfp51075mulx(&t2_125_0,&t,&t2_5_0);

	/* 2^250 -  2^125*/  gfp51075nsqrx(&t,&t2_125_0,125);
 	/* 2^250 -  1    */  gfp51075mulx(&t2_250_0,&t,&t2_125_0);

	/* 2^500 -  2^250*/  gfp51075nsqrx(&t,&t2_250_0,250);
 	/* 2^500 -  1    */  gfp51075mulx(&t,&t,&t2_250_0);

	/* 2^503 -  2^3  */  gfp51075nsqrx(&t,&t,3);
 	/* 2^503 -  1    */  gfp51075mulx(&t,&t,&t7);

	/* 2^510 -  2^7  */  gfp51075nsqrx(&t,&t,7);
 	/* 2^510 -   97  */  gfp51075mulx(&t,&t,&t2_5_0);
 	/* 2^510 -   80  */  gfp51075mulx(&t,&t,&t17);
 	/* 2^510 -   77  */  gfp51075mulx(einv,&t,&t3);
}

void gfp51075inv(gfe_p51075_8L *einv, const gfe_p51075_8L *e) {

	gfe_p51075_8L t,t3,t6,t7,t14,t17,t2_5_0,t2_10_0,t2_20_0,t2_40_0,t2_125_0,t2_250_0;

 	/* 2   */  gfp51075sqr(&t,e); 
  	/* 3   */  gfp51075mul(&t3,&t,e); 
  	/* 6   */  gfp51075sqr(&t6,&t3);
  	/* 7   */  gfp51075mul(&t7,&t6,e);
  	/* 14  */  gfp51075sqr(&t14,&t7);
  	/* 17  */  gfp51075mul(&t17,&t14,&t3);

  	/* 2^5   -  1    */  gfp51075mul(&t2_5_0,&t17,&t14); 

  	/* 2^10  -  2^5  */  gfp51075nsqr(&t,&t2_5_0,5); 
  	/* 2^10  -  1    */  gfp51075mul(&t2_10_0,&t,&t2_5_0); 

  	/* 2^20  -  2^10 */  gfp51075nsqr(&t,&t2_10_0,10); 
  	/* 2^20  -  1    */  gfp51075mul(&t2_20_0,&t,&t2_10_0); 

  	/* 2^40  -  2^20 */  gfp51075nsqr(&t,&t2_20_0,20);   
  	/* 2^40  -  1    */  gfp51075mul(&t2_40_0,&t,&t2_20_0);     

  	/* 2^80  -  2^40 */  gfp51075nsqr(&t,&t2_40_0,40);     
  	/* 2^80  -  1    */  gfp51075mul(&t,&t,&t2_40_0);     

  	/* 2^120 -  2^40 */  gfp51075nsqr(&t,&t,40);    
  	/* 2^120 -  1    */  gfp51075mul(&t,&t,&t2_40_0);   

  	/* 2^125 -  2^5  */  gfp51075nsqr(&t,&t,5);     
 	/* 2^125 -  1    */  gfp51075mul(&t2_125_0,&t,&t2_5_0);

	/* 2^250 -  2^125*/  gfp51075nsqr(&t,&t2_125_0,125);
 	/* 2^250 -  1    */  gfp51075mul(&t2_250_0,&t,&t2_125_0);

	/* 2^500 -  2^250*/  gfp51075nsqr(&t,&t2_250_0,250);
 	/* 2^500 -  1    */  gfp51075mul(&t,&t,&t2_250_0);

	/* 2^503 -  2^3  */  gfp51075nsqr(&t,&t,3);
 	/* 2^503 -  1    */  gfp51075mul(&t,&t,&t7);

	/* 2^510 -  2^7  */  gfp51075nsqr(&t,&t,7);
 	/* 2^510 -   97  */  gfp51075mul(&t,&t,&t2_5_0);
 	/* 2^510 -   80  */  gfp51075mul(&t,&t,&t17);
 	/* 2^510 -   77  */  gfp51075mul(einv,&t,&t3);
}
