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
.globl vec45
.globl vec2e16x45
.globl vecmask3
.globl vecmask19
.globl vecmask13
.globl vecmask29
.globl vecmask29d
.globl vecmask2913d
.globl vecmask32
.globl mask58
.globl p0
.globl p1_6
.globl p7

.p2align 5

vec_c1 	 	: .quad 675,1037,675,1037
vec_c2 	 	: .quad 1,1,181,856
vec_c3 	 	: .quad 181,856,1,17
hh_p1d		: .long 0x0,0x0,0x3FFFFFA7,0x3FFFFFFF,0x0,0x0,0x3FFFFFA7,0x3FFFFFFF
hh_p2d		: .long 0x0,0x0,0x3FFFFFFF,0x3FFFFFFF,0x0,0x0,0x3FFFFFFF,0x3FFFFFFF
hh_p3d		: .long 0x0,0x0,0x3FFFFFFF,0x00003FFF,0x0,0x0,0x3FFFFFFF,0x00003FFF
hh_p1q  	: .quad 0x0,0x1FFFFFD3001,0x0,0x1FFFFFD3001
hh_p2q		: .quad 0x0,0x1FFFFFFF001,0x0,0x1FFFFFFF001
hh_p3q		: .quad 0x0,0x00001FFF001,0x0,0x00001FFF001
hh_xor	 	: .long 0,0,-1,-1,0,0,-1,-1
dup_c		: .long 0,1,2,3,0,1,2,3
swap_c	 	: .long 0,1,2,3,4,5,6,7
swap_mask 	: .long 7,7,7,7,7,7,7,7
vec45 		: .quad 45,45,45,45
vec2e16x45	: .quad 2949120,2949120,2949120,2949120
vecmask3	: .quad 0x00000000E0000000,0x00000000E0000000,0x00000000E0000000,0x00000000E0000000
vecmask19	: .quad 0xFFFFE00000000000,0xFFFFE00000000000,0xFFFFE00000000000,0xFFFFE00000000000
vecmask13	: .quad 0x1FFF,0x1FFF,0x1FFF,0x1FFF
vecmask29	: .quad 0x1FFFFFFF,0x1FFFFFFF,0x1FFFFFFF,0x1FFFFFFF
vecmask29d	: .long 0x1FFFFFFF,0x1FFFFFFF,0x1FFFFFFF,0x1FFFFFFF,0x1FFFFFFF,0x1FFFFFFF,0x1FFFFFFF,0x1FFFFFFF
vecmask2913d	: .long 0x1FFFFFFF,0x1FFF,0x1FFFFFFF,0x1FFF,0x1FFFFFFF,0x1FFF,0x1FFFFFFF,0x1FFF
vecmask32	: .quad 0xFFFFFFFF,0xFFFFFFFF,0xFFFFFFFF,0xFFFFFFFF
mask58		: .quad 0x03FFFFFFFFFFFFFF
p0		: .quad 0xFFFFFFFFFFFFFFD3
p1_6		: .quad 0xFFFFFFFFFFFFFFFF
p7		: .quad 0x03FFFFFFFFFFFFFF
