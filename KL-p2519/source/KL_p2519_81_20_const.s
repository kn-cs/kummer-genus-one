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
.globl hh_xor1
.globl hh_xor2
.globl dup_c
.globl swap_c
.globl swap_mask
.globl vecmask27d
.globl vecmask28d
.globl vecmask27
.globl vecmask28
.globl vecmask32
.globl vec9
.globl zero
.globl mask59
.globl p0
.globl p12
.globl p3

.p2align 5

vec_c1 	 	: .quad 61,101,61,101
vec_c2 	 	: .quad 1,1,20,81
vec_c3 	 	: .quad 20,81,1,64
hh_p1d 		: .long 0x0,0x0,0x1FFFFFEF,0x1FFFFFFF,0x0,0x0,0x1FFFFFEF,0x1FFFFFFF
hh_p2d 		: .long 0x0,0x0,0x1FFFFFFF,0x1FFFFFFF,0x0,0x0,0x1FFFFFFF,0x1FFFFFFF
hh_p3d 		: .long 0x0,0x0,0xFFFFFFF,0x0,0x0,0x0,0xFFFFFFF,0x0
hh_p1q 		: .quad 0x0,0x7FFFFFB81,0x0,0x7FFFFFB81
hh_p2q 		: .quad 0x0,0x7FFFFFF81,0x0,0x7FFFFFF81
hh_p3q 		: .quad 0x0,0x3FFFFFF81,0x0,0x3FFFFFF81
hh_xor1	 	: .long 0,0,-1,-1,0,0,-1,-1
hh_xor2	 	: .long 0,0,-1,0,0,0,-1,0
dup_c		: .long 0,1,2,3,0,1,2,3
swap_c	 	: .long 0,1,2,3,4,5,6,7
swap_mask 	: .long 7,7,7,7,7,7,7,7
vecmask27d	: .long 0x7FFFFFF,0x7FFFFFF,0x7FFFFFF,0x7FFFFFF,0x7FFFFFF,0x7FFFFFF,0x7FFFFFF,0x7FFFFFF
vecmask28d	: .long 0xFFFFFFF,0xFFFFFFF,0xFFFFFFF,0xFFFFFFF,0xFFFFFFF,0xFFFFFFF,0xFFFFFFF,0xFFFFFFF
vecmask27	: .quad 0x7FFFFFF,0x7FFFFFF,0x7FFFFFF,0x7FFFFFF
vecmask28	: .quad 0xFFFFFFF,0xFFFFFFF,0xFFFFFFF,0xFFFFFFF
vecmask32	: .quad 0xFFFFFFFF,0xFFFFFFFF,0xFFFFFFFF,0xFFFFFFFF
vec9 	 	: .quad 9,9,9,9
zero	 	: .quad 0
mask59	 	: .quad 0x07FFFFFFFFFFFFFF
p0		: .quad 0xFFFFFFFFFFFFFFF7
p12		: .quad 0xFFFFFFFFFFFFFFFF
p3		: .quad 0x07FFFFFFFFFFFFFF
