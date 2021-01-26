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

.data

.globl vec_c1
.globl vec_c2
.globl vec_c3
.globl hh_p1d
.globl hh_p2d
.globl hh_p3d
.globl hh_p1q
.globl hh_p2q
.globl hh_p3q
.globl hh_xor
.globl dup_c
.globl swap_c
.globl swap_mask
.globl vecmask24
.globl vecmask28d
.globl vecmask28
.globl vecmask32
.globl vec17
.globl vec2e4x17
.globl mask60
.globl p0
.globl p1_5
.globl p6

.p2align 5

vec_c1 	 	: .quad 289,1029,289,1029
vec_c2 	 	: .quad 1,1,370,659
vec_c3 	 	: .quad 370,659,1,47
hh_p1d		: .long 0x0,0x0,0x1FFFFFDF,0x1FFFFFFF,0x0,0x0,0x1FFFFFDF,0x1FFFFFFF
hh_p2d		: .long 0x0,0x0,0x1FFFFFFF,0x1FFFFFFF,0x0,0x0,0x1FFFFFFF,0x1FFFFFFF
hh_p3d		: .long 0x0,0x0,0x1FFFFFFF,0x01FFFFFF,0x0,0x0,0x1FFFFFFF,0x01FFFFFF
hh_p1q  	: .quad 0x0,0x7FFFFF7801,0x0,0x7FFFFF7801
hh_p2q		: .quad 0x0,0x7FFFFFF801,0x0,0x7FFFFFF801
hh_p3q		: .quad 0x0,0x07FFFFF801,0x0,0x07FFFFF801
hh_xor	 	: .long 0,0,-1,-1,0,0,-1,-1
dup_c		: .long 0,1,2,3,0,1,2,3
swap_c	 	: .long 0,1,2,3,4,5,6,7
swap_mask 	: .long 7,7,7,7,7,7,7,7
vecmask24	: .quad 0xFFFFFF,0xFFFFFF,0xFFFFFF,0xFFFFFF
vecmask28d	: .long 0xFFFFFFF,0xFFFFFFF,0xFFFFFFF,0xFFFFFFF,0xFFFFFFF,0xFFFFFFF,0xFFFFFFF,0xFFFFFFF
vecmask28	: .quad 0xFFFFFFF,0xFFFFFFF,0xFFFFFFF,0xFFFFFFF
vecmask32	: .quad 0xFFFFFFFF,0xFFFFFFFF,0xFFFFFFFF,0xFFFFFFFF
vec17	 	: .quad 17,17,17,17
vec2e4x17	: .quad 272,272,272,272
mask60		: .quad 0xFFFFFFFFFFFFFFF
p0		: .quad 0xFFFFFFFFFFFFFFEF
p1_5		: .quad 0xFFFFFFFFFFFFFFFF
p6		: .quad 0x0FFFFFFFFFFFFFFF
