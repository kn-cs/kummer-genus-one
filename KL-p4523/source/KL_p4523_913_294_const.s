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
.globl vecmask17
.globl vecmask29d
.globl vecmask29
.globl vecmask32
.globl vec3
.globl vec2e12x3
.globl twoe60x3
.globl mask4
.globl p0
.globl p1_6
.globl p7

.globl vecmask4
.globl vecmask4a

.p2align 5

vec_c1 	 	: .quad 619,1207,619,1207
vec_c2 	 	: .quad 1,1,294,913
vec_c3 	 	: .quad 294,913,1,2
hh_p1d		: .long 0x0,0x0,0x3FFFFFFB,0x3FFFFFFF,0x0,0x0,0x3FFFFFFB,0x3FFFFFFF
hh_p2d		: .long 0x0,0x0,0x3FFFFFFF,0x3FFFFFFF,0x0,0x0,0x3FFFFFFF,0x3FFFFFFF
hh_p3d		: .long 0x0,0x0,0x3FFFFFFF,0x0003FFFF,0x0,0x0,0x3FFFFFFF,0x0003FFFF
hh_p1q  	: .quad 0x0,0xFFFFFFE801,0x0,0xFFFFFFE801
hh_p2q		: .quad 0x0,0xFFFFFFF801,0x0,0xFFFFFFF801
hh_p3q		: .quad 0x0,0x000FFFF801,0x0,0x000FFFF801
hh_xor	 	: .long 0,0,-1,-1,0,0,-1,-1
dup_c		: .long 0,1,2,3,0,1,2,3
swap_c	 	: .long 0,1,2,3,4,5,6,7
swap_mask 	: .long 7,7,7,7,7,7,7,7
vecmask17	: .quad 0x1FFFF,0x1FFFF,0x1FFFF,0x1FFFF
vecmask29d	: .long 0x1FFFFFFF,0x1FFFFFFF,0x1FFFFFFF,0x1FFFFFFF,0x1FFFFFFF,0x1FFFFFFF,0x1FFFFFFF,0x1FFFFFFF
vecmask29	: .quad 0x1FFFFFFF,0x1FFFFFFF,0x1FFFFFFF,0x1FFFFFFF
vecmask32	: .quad 0xFFFFFFFF,0xFFFFFFFF,0xFFFFFFFF,0xFFFFFFFF
vec3	 	: .quad 3,3,3,3
vec2e12x3	: .quad 12288,12288,12288,12288
twoe60x3	: .quad 0x3000000000000000
mask4		: .quad 0xF
p0		: .quad 0xFFFFFFFFFFFFFFFD
p1_6		: .quad 0xFFFFFFFFFFFFFFFF
p7		: .quad 0xF
