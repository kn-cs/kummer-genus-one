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
.globl vec12
.globl vecmask2723d
.globl vecmask27d
.globl vecmask23
.globl vecmask27
.globl vecmask32
.globl zero
.globl threex2e54
.globl mask10
.globl mask50
.globl mask54
.globl p0
.globl p123
.globl p4

.p2align 5

vec_c1 	 	: .quad 665,701,665,701
vec_c2 	 	: .quad 1,1,18,683
vec_c3 	 	: .quad 18,683,1,2
hh_p1d		: .long 0x0,0x0,0xFFFFFFB,0xFFFFFFF,0x0,0x0,0xFFFFFFB,0xFFFFFFF
hh_p2d		: .long 0x0,0x0,0xFFFFFFF,0xFFFFFFF,0x0,0x0,0xFFFFFFF,0xFFFFFFF
hh_p3d		: .long 0x0,0x0,0xFFFFFFF,0x0FFFFFF,0x0,0x0,0xFFFFFFF,0x0FFFFFF
hh_p1q  	: .quad 0x0,0x1FFFFFF401,0x0,0x1FFFFFF401
hh_p2q		: .quad 0x0,0x1FFFFFFC01,0x0,0x1FFFFFFC01
hh_p3q		: .quad 0x0,0x01FFFFFC01,0x0,0x01FFFFFC01
hh_xor	 	: .long 0,0,-1,-1,0,0,-1,-1
dup_c		: .long 0,1,2,3,0,1,2,3
swap_c	 	: .long 0,1,2,3,4,5,6,7
swap_mask 	: .long 7,7,7,7,7,7,7,7
vec12 	 	: .quad 12,12,12,12
vecmask2723d	: .long 0x7FFFFFF,0x7FFFFF,0x7FFFFFF,0x7FFFFF,0x7FFFFFF,0x7FFFFF,0x7FFFFFF,0x7FFFFF
vecmask27d	: .long 0x7FFFFFF,0x7FFFFFF,0x7FFFFFF,0x7FFFFFF,0x7FFFFFF,0x7FFFFFF,0x7FFFFFF,0x7FFFFFF
vecmask23	: .quad 0x7FFFFF,0x7FFFFF,0x7FFFFF,0x7FFFFF
vecmask27	: .quad 0x7FFFFFF,0x7FFFFFF,0x7FFFFFF,0x7FFFFFF
vecmask32	: .quad 0xFFFFFFFF,0xFFFFFFFF,0xFFFFFFFF,0xFFFFFFFF
zero	 	: .quad 0
threex2e54	: .quad 0xC0000000000000
mask10    	: .quad 0x3FF
mask50   	: .quad 0x3FFFFFFFFFFFF
mask54   	: .quad 0x3FFFFFFFFFFFFF
p0    	  	: .quad 0xFFFFFFFFFFFFFFFD
p123  	  	: .quad 0xFFFFFFFFFFFFFFFF
p4    	  	: .quad 0x3FF
