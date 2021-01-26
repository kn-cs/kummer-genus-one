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

#ifndef __P5211_ARITH_H__
#define __P5211_ARITH_H__

#include "basic_types.h"
#include "gf_p5211_type.h"

#define gfp5211sqr(x,y)  gfp5211nsqr(x,y,1)
#define gfp5211sqrx(x,y) gfp5211nsqrx(x,y,1)

extern void gfp5211mulx(gfe_p5211_9L *, const gfe_p5211_9L *, const gfe_p5211_9L *);
extern void gfp5211nsqrx(gfe_p5211_9L *, const gfe_p5211_9L *, const ushort16);
extern void gfp5211mul(gfe_p5211_9L *, const gfe_p5211_9L *, const gfe_p5211_9L *);
extern void gfp5211nsqr(gfe_p5211_9L *, const gfe_p5211_9L *, const ushort16);
extern void gfp5211reducex(gfe_p5211_9L *);
extern void gfp5211reduce(gfe_p5211_9L *);
extern void gfp5211makeunique(gfe_p5211_9L *);

void gfp5211invx(gfe_p5211_9L *, const gfe_p5211_9L *);
void gfp5211inv(gfe_p5211_9L *, const gfe_p5211_9L *);

#endif
