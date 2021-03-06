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
.globl hh_xor
.globl dup_c
.globl swap_c
.globl swap_mask
.globl vecmask25
.globl vecmask26
.globl vecmask32
.globl vec19
.globl vec38
.globl zero
.globl mask51
.globl mask63
.globl p0
.globl p12
.globl p3

.p2align 5

vec_c1 	 	: .quad 7,1669,7,1669
vec_c2 	 	: .quad 1,1,831,838
vec_c3 	 	: .quad 831,838,1,10
hh_p1d 		: .long 0x0,0x0,0x7FFFFDB,0x3FFFFFF,0x0,0x0,0x7FFFFDB,0x3FFFFFF
hh_p2d 		: .long 0x0,0x0,0x3FFFFFF,0x7FFFFFF,0x0,0x0,0x3FFFFFF,0x7FFFFFF
hh_p3d 		: .long 0x0,0x0,0x7FFFFFF,0x3FFFFFF,0x0,0x0,0x7FFFFFF,0x3FFFFFF
hh_xor	 	: .long 0,0,-1,-1,0,0,-1,-1
dup_c		: .long 0,1,2,3,0,1,2,3
swap_c	 	: .long 0,1,2,3,4,5,6,7
swap_mask 	: .long 7,7,7,7,7,7,7,7
vecmask25	: .quad 0x1FFFFFF,0x1FFFFFF,0x1FFFFFF,0x1FFFFFF
vecmask26	: .quad 0x3FFFFFF,0x3FFFFFF,0x3FFFFFF,0x3FFFFFF
vecmask32	: .quad 0xFFFFFFFF,0xFFFFFFFF,0xFFFFFFFF,0xFFFFFFFF
vec19 	 	: .quad 19,19,19,19
vec38 	 	: .quad 38,38,38,38
zero	 	: .quad 0
mask51		: .quad 0x7FFFFFFFFFFFF
mask63	 	: .quad 0x7FFFFFFFFFFFFFFF
p0      	: .quad 0xFFFFFFFFFFFFFFED
p12     	: .quad 0xFFFFFFFFFFFFFFFF
p3      	: .quad 0x7FFFFFFFFFFFFFFF
