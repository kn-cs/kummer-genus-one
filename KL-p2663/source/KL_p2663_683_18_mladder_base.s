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

.p2align 5
.globl KL_p2663_683_18_mladder_base
KL_p2663_683_18_mladder_base:

movq 	  %rsp,%r11
andq 	  $-32,%rsp
subq 	  $800,%rsp

movq 	  %r11,0(%rsp)
movq 	  %r12,8(%rsp)
movq 	  %r13,16(%rsp)
movq 	  %r14,24(%rsp)
movq 	  %r15,32(%rsp)
movq 	  %rbx,40(%rsp)
movq 	  %rbp,48(%rsp)

// Pack-N2D
vmovdqa   0(%rsi),%ymm0
vmovdqa   32(%rsi),%ymm2
vmovdqa   64(%rsi),%ymm4
vmovdqa   96(%rsi),%ymm6
vmovdqa   128(%rsi),%ymm8
vmovdqa   160(%rsi),%ymm9
vmovdqa   192(%rsi),%ymm15
vmovdqa   224(%rsi),%ymm5
vmovdqa   256(%rsi),%ymm7
vmovdqa   288(%rsi),%ymm11

vpsllq    $32,%ymm9,%ymm9
vpor      %ymm9,%ymm0,%ymm0
vpsllq    $32,%ymm15,%ymm15
vpor      %ymm15,%ymm2,%ymm2
vpsllq    $32,%ymm5,%ymm5
vpor      %ymm5,%ymm4,%ymm4
vpsllq    $32,%ymm7,%ymm7
vpor      %ymm7,%ymm6,%ymm6
vpsllq    $32,%ymm11,%ymm11
vpor      %ymm11,%ymm8,%ymm8

// Dense-HH
vpshufd	  $68,%ymm0,%ymm1
vpshufd	  $238,%ymm0,%ymm3
vpaddd    hh_p1d,%ymm1,%ymm1
vpxor     hh_xor,%ymm3,%ymm3
vpaddd    %ymm1,%ymm3,%ymm0

vpshufd	  $68,%ymm2,%ymm1
vpshufd	  $238,%ymm2,%ymm3
vpaddd    hh_p2d,%ymm1,%ymm1
vpxor     hh_xor,%ymm3,%ymm3
vpaddd    %ymm1,%ymm3,%ymm2

vpshufd	  $68,%ymm4,%ymm1
vpshufd	  $238,%ymm4,%ymm3
vpaddd    hh_p2d,%ymm1,%ymm1
vpxor     hh_xor,%ymm3,%ymm3
vpaddd    %ymm1,%ymm3,%ymm4

vpshufd	  $68,%ymm6,%ymm1
vpshufd	  $238,%ymm6,%ymm3
vpaddd    hh_p2d,%ymm1,%ymm1
vpxor     hh_xor,%ymm3,%ymm3
vpaddd    %ymm1,%ymm3,%ymm6

vpshufd	  $68,%ymm8,%ymm1
vpshufd	  $238,%ymm8,%ymm3
vpaddd    hh_p3d,%ymm1,%ymm1
vpxor     hh_xor,%ymm3,%ymm3
vpaddd    %ymm1,%ymm3,%ymm8

vpsrld    $27,%ymm0,%ymm1
vpaddd    %ymm1,%ymm2,%ymm2
vpand     vecmask27d,%ymm0,%ymm0

vpsrld    $27,%ymm2,%ymm1
vpaddd    %ymm1,%ymm4,%ymm4
vpand     vecmask27d,%ymm2,%ymm2

vpsrld    $27,%ymm4,%ymm1
vpaddd    %ymm1,%ymm6,%ymm6
vpand     vecmask27d,%ymm4,%ymm4

vpsrld    $27,%ymm6,%ymm1
vpaddd    %ymm1,%ymm8,%ymm8
vpand     vecmask27d,%ymm6,%ymm6

vpsrld    $27,%ymm8,%ymm1
vpsllq    $32,%ymm1,%ymm1
vpaddd    %ymm1,%ymm0,%ymm0
vpsrlq    $55,%ymm8,%ymm1
vpaddd    %ymm1,%ymm0,%ymm0
vpaddd    %ymm1,%ymm1,%ymm1
vpaddd    %ymm1,%ymm0,%ymm0
vpand     vecmask2723d,%ymm8,%ymm8

// Pack-D2N
vpsrlq    $32,%ymm0,%ymm9
vpsrlq    $32,%ymm2,%ymm15
vpsrlq    $32,%ymm4,%ymm5
vpsrlq    $32,%ymm6,%ymm7
vpsrlq    $32,%ymm8,%ymm11

// Sqr
vmovdqa   %ymm5,64(%rsp)
vmovdqa   %ymm7,96(%rsp)
vmovdqa   %ymm11,128(%rsp)

vpaddq    %ymm0,%ymm0,%ymm10
vpaddq    %ymm2,%ymm2,%ymm11
vpaddq    %ymm4,%ymm4,%ymm12
vpaddq    %ymm6,%ymm6,%ymm13
vpaddq    %ymm8,%ymm8,%ymm14
vpaddq    %ymm9,%ymm9,%ymm5

vpmuludq  128(%rsp),%ymm11,%ymm3
vpmuludq  96(%rsp),%ymm12,%ymm7
vpaddq    %ymm7,%ymm3,%ymm3
vpmuludq  64(%rsp),%ymm13,%ymm7
vpaddq    %ymm7,%ymm3,%ymm3
vpmuludq  %ymm15,%ymm14,%ymm7
vpaddq    %ymm7,%ymm3,%ymm3
vpmuludq  %ymm9,%ymm9,%ymm7
vpaddq    %ymm7,%ymm3,%ymm3
vpsllq    $4,%ymm3,%ymm7
vpsllq    $5,%ymm3,%ymm3
vpaddq    %ymm7,%ymm3,%ymm3
vpmuludq  %ymm0,%ymm0,%ymm7
vpaddq    %ymm7,%ymm3,%ymm0

vmovdqa   %ymm0,160(%rsp)
vmovdqa   64(%rsp),%ymm0

vpmuludq  128(%rsp),%ymm4,%ymm3
vpmuludq  96(%rsp),%ymm6,%ymm7
vpaddq    %ymm7,%ymm3,%ymm3
vpmuludq  %ymm0,%ymm8,%ymm7
vpaddq    %ymm7,%ymm3,%ymm3
vpmuludq  %ymm15,%ymm9,%ymm7
vpaddq    %ymm7,%ymm3,%ymm3
vpsllq    $5,%ymm3,%ymm7
vpsllq    $6,%ymm3,%ymm3
vpaddq    %ymm7,%ymm3,%ymm3
vpmuludq  %ymm10,%ymm2,%ymm7
vpaddq    %ymm7,%ymm3,%ymm1

vmovdqa   %ymm1,192(%rsp)
vmovdqa   96(%rsp),%ymm1

vpmuludq  128(%rsp),%ymm13,%ymm3
vpmuludq  %ymm1,%ymm14,%ymm7
vpaddq    %ymm7,%ymm3,%ymm3
vpmuludq  %ymm0,%ymm5,%ymm7
vpaddq    %ymm7,%ymm3,%ymm3
vpmuludq  %ymm15,%ymm15,%ymm7
vpaddq    %ymm7,%ymm3,%ymm3
vpsllq    $4,%ymm3,%ymm7
vpsllq    $5,%ymm3,%ymm3
vpaddq    %ymm7,%ymm3,%ymm3
vpmuludq  %ymm2,%ymm2,%ymm7
vpaddq    %ymm7,%ymm3,%ymm3
vpmuludq  %ymm10,%ymm4,%ymm7
vpaddq    %ymm7,%ymm3,%ymm2

vmovdqa   %ymm2,224(%rsp)
vmovdqa   128(%rsp),%ymm2

vpmuludq  %ymm2,%ymm8,%ymm3
vpmuludq  %ymm1,%ymm9,%ymm7
vpaddq    %ymm7,%ymm3,%ymm3
vpmuludq  %ymm0,%ymm15,%ymm7
vpaddq    %ymm7,%ymm3,%ymm3
vpsllq    $5,%ymm3,%ymm7
vpsllq    $6,%ymm3,%ymm3
vpaddq    %ymm7,%ymm3,%ymm3
vpmuludq  %ymm10,%ymm6,%ymm7
vpaddq    %ymm7,%ymm3,%ymm3
vpmuludq  %ymm11,%ymm4,%ymm7
vpaddq    %ymm7,%ymm3,%ymm3

vpmuludq  %ymm0,%ymm0,%ymm7
vpmuludq  %ymm2,%ymm5,%ymm5
vpaddq    %ymm7,%ymm5,%ymm5
vpaddq    %ymm15,%ymm15,%ymm7
vpmuludq  %ymm1,%ymm7,%ymm7
vpaddq    %ymm7,%ymm5,%ymm5
vpsllq    $4,%ymm5,%ymm7
vpsllq    $5,%ymm5,%ymm5
vpaddq    %ymm7,%ymm5,%ymm5
vpmuludq  %ymm10,%ymm8,%ymm7
vpaddq    %ymm7,%ymm5,%ymm5
vpmuludq  %ymm11,%ymm6,%ymm7
vpaddq    %ymm7,%ymm5,%ymm5
vpmuludq  %ymm4,%ymm4,%ymm7
vpaddq    %ymm7,%ymm5,%ymm4

vpmuludq  %ymm2,%ymm15,%ymm5
vpmuludq  %ymm0,%ymm1,%ymm7
vpaddq    %ymm7,%ymm5,%ymm5
vpsllq    $5,%ymm5,%ymm7
vpsllq    $6,%ymm5,%ymm5
vpaddq    %ymm7,%ymm5,%ymm5
vpmuludq  %ymm10,%ymm9,%ymm7
vpaddq    %ymm7,%ymm5,%ymm5
vpmuludq  %ymm11,%ymm8,%ymm7
vpaddq    %ymm7,%ymm5,%ymm5
vpmuludq  %ymm12,%ymm6,%ymm7
vpaddq    %ymm7,%ymm5,%ymm5

vpaddq    %ymm0,%ymm0,%ymm0
vpmuludq  %ymm0,%ymm2,%ymm0
vpmuludq  %ymm1,%ymm1,%ymm7
vpaddq    %ymm7,%ymm0,%ymm0
vpsllq    $4,%ymm0,%ymm7
vpsllq    $5,%ymm0,%ymm0
vpaddq    %ymm7,%ymm0,%ymm0
vpmuludq  %ymm10,%ymm15,%ymm7
vpaddq    %ymm7,%ymm0,%ymm0
vpmuludq  %ymm11,%ymm9,%ymm7
vpaddq    %ymm7,%ymm0,%ymm0
vpmuludq  %ymm12,%ymm8,%ymm7
vpaddq    %ymm7,%ymm0,%ymm0
vpmuludq  %ymm6,%ymm6,%ymm6
vpaddq    %ymm0,%ymm6,%ymm6

vpmuludq  %ymm1,%ymm2,%ymm0
vpsllq    $5,%ymm0,%ymm7
vpsllq    $6,%ymm0,%ymm0
vpaddq    %ymm0,%ymm7,%ymm7
vpmuludq  64(%rsp),%ymm10,%ymm0
vpaddq    %ymm0,%ymm7,%ymm7
vpmuludq  %ymm11,%ymm15,%ymm0
vpaddq    %ymm0,%ymm7,%ymm7
vpmuludq  %ymm12,%ymm9,%ymm0
vpaddq    %ymm0,%ymm7,%ymm7
vpmuludq  %ymm13,%ymm8,%ymm0
vpaddq    %ymm0,%ymm7,%ymm7

vpmuludq  %ymm2,%ymm2,%ymm0
vpsllq    $4,%ymm0,%ymm0
vpmuludq  %ymm8,%ymm8,%ymm8
vpaddq    %ymm0,%ymm8,%ymm8
vpsllq    $1,%ymm0,%ymm0
vpaddq    %ymm0,%ymm8,%ymm8
vpmuludq  %ymm10,%ymm1,%ymm0
vpaddq    %ymm0,%ymm8,%ymm8
vpmuludq  64(%rsp),%ymm11,%ymm0
vpaddq    %ymm0,%ymm8,%ymm8
vpmuludq  %ymm12,%ymm15,%ymm0
vpaddq    %ymm0,%ymm8,%ymm8
vpmuludq  %ymm13,%ymm9,%ymm0
vpaddq    %ymm0,%ymm8,%ymm8

vpmuludq  %ymm14,%ymm9,%ymm9
vpmuludq  %ymm13,%ymm15,%ymm0
vpaddq    %ymm0,%ymm9,%ymm9
vpmuludq  64(%rsp),%ymm12,%ymm0
vpaddq    %ymm0,%ymm9,%ymm9
vpmuludq  %ymm11,%ymm1,%ymm0
vpaddq    %ymm0,%ymm9,%ymm9
vpmuludq  %ymm10,%ymm2,%ymm0
vpaddq    %ymm0,%ymm9,%ymm9

vmovdqa   160(%rsp),%ymm0
vmovdqa   192(%rsp),%ymm1
vmovdqa   224(%rsp),%ymm2

vpsrlq    $27,%ymm5,%ymm10
vpaddq    %ymm10,%ymm6,%ymm6
vpand     vecmask27,%ymm5,%ymm5

vpsrlq    $27,%ymm0,%ymm10
vpaddq    %ymm10,%ymm1,%ymm1
vpand     vecmask27,%ymm0,%ymm0

vpsrlq    $27,%ymm6,%ymm10
vpaddq    %ymm10,%ymm7,%ymm7
vpand     vecmask27,%ymm6,%ymm6

vpsrlq    $27,%ymm1,%ymm10
vpaddq    %ymm10,%ymm2,%ymm2
vpand     vecmask27,%ymm1,%ymm1

vpsrlq    $27,%ymm7,%ymm10
vpaddq    %ymm10,%ymm8,%ymm8
vpand     vecmask27,%ymm7,%ymm7

vpsrlq    $27,%ymm2,%ymm10
vpaddq    %ymm10,%ymm3,%ymm3
vpand     vecmask27,%ymm2,%ymm2

vpsrlq    $27,%ymm8,%ymm10
vpaddq    %ymm10,%ymm9,%ymm9
vpand     vecmask27,%ymm8,%ymm8

vpsrlq    $27,%ymm3,%ymm10
vpaddq    %ymm10,%ymm4,%ymm4
vpand     vecmask27,%ymm3,%ymm3

vpsrlq    $23,%ymm9,%ymm10
vpaddq    %ymm10,%ymm0,%ymm0
vpaddq    %ymm10,%ymm10,%ymm10
vpaddq    %ymm10,%ymm0,%ymm0
vpand     vecmask23,%ymm9,%ymm9

vpsrlq    $27,%ymm4,%ymm10
vpaddq    %ymm10,%ymm5,%ymm5
vpand     vecmask27,%ymm4,%ymm4

vpsrlq    $27,%ymm0,%ymm10
vpaddq    %ymm10,%ymm1,%ymm1
vpand     vecmask27,%ymm0,%ymm0

vpsrlq    $27,%ymm5,%ymm10
vpaddq    %ymm10,%ymm6,%ymm6
vpand     vecmask27,%ymm5,%ymm5

// Unreduced-MulC
vpmuludq  vec_c1,%ymm0,%ymm0
vpmuludq  vec_c1,%ymm9,%ymm11
vpmuludq  vec_c1,%ymm6,%ymm15
vpmuludq  vec_c1,%ymm3,%ymm6
vpmuludq  vec_c1,%ymm5,%ymm9
vpmuludq  vec_c1,%ymm7,%ymm5
vpmuludq  vec_c1,%ymm8,%ymm7
vpmuludq  vec_c1,%ymm4,%ymm8
vpmuludq  vec_c1,%ymm2,%ymm4
vpmuludq  vec_c1,%ymm1,%ymm2

// HH
vpshufd	  $68,%ymm0,%ymm1
vpshufd	  $238,%ymm0,%ymm3
vpaddq    hh_p1q,%ymm1,%ymm1
vpxor     hh_xor,%ymm3,%ymm3
vpaddq    %ymm1,%ymm3,%ymm0

vpshufd	  $68,%ymm2,%ymm1
vpshufd	  $238,%ymm2,%ymm3
vpaddq    hh_p2q,%ymm1,%ymm1
vpxor     hh_xor,%ymm3,%ymm3
vpaddq    %ymm1,%ymm3,%ymm2

vpshufd	  $68,%ymm4,%ymm1
vpshufd	  $238,%ymm4,%ymm3
vpaddq    hh_p2q,%ymm1,%ymm1
vpxor     hh_xor,%ymm3,%ymm3
vpaddq    %ymm1,%ymm3,%ymm4

vpshufd	  $68,%ymm6,%ymm1
vpshufd	  $238,%ymm6,%ymm3
vpaddq    hh_p2q,%ymm1,%ymm1
vpxor     hh_xor,%ymm3,%ymm3
vpaddq    %ymm1,%ymm3,%ymm6

vpshufd	  $68,%ymm8,%ymm1
vpshufd	  $238,%ymm8,%ymm3
vpaddq    hh_p2q,%ymm1,%ymm1
vpxor     hh_xor,%ymm3,%ymm3
vpaddq    %ymm1,%ymm3,%ymm8

vpshufd	  $68,%ymm9,%ymm1
vpshufd	  $238,%ymm9,%ymm3
vpaddq    hh_p2q,%ymm1,%ymm1
vpxor     hh_xor,%ymm3,%ymm3
vpaddq    %ymm1,%ymm3,%ymm9

vpshufd	  $68,%ymm15,%ymm1
vpshufd	  $238,%ymm15,%ymm3
vpaddq    hh_p2q,%ymm1,%ymm1
vpxor     hh_xor,%ymm3,%ymm3
vpaddq    %ymm1,%ymm3,%ymm15

vpshufd	  $68,%ymm5,%ymm1
vpshufd	  $238,%ymm5,%ymm3
vpaddq    hh_p2q,%ymm1,%ymm1
vpxor     hh_xor,%ymm3,%ymm3
vpaddq    %ymm1,%ymm3,%ymm5

vpshufd	  $68,%ymm7,%ymm1
vpshufd	  $238,%ymm7,%ymm3
vpaddq    hh_p2q,%ymm1,%ymm1
vpxor     hh_xor,%ymm3,%ymm3
vpaddq    %ymm1,%ymm3,%ymm7

vpshufd	  $68,%ymm11,%ymm1
vpshufd	  $238,%ymm11,%ymm3
vpaddq    hh_p3q,%ymm1,%ymm1
vpxor     hh_xor,%ymm3,%ymm3
vpaddq    %ymm1,%ymm3,%ymm11

vpsrlq    $27,%ymm9,%ymm10
vpaddq    %ymm10,%ymm15,%ymm15
vpand     vecmask27,%ymm9,%ymm9

vpsrlq    $27,%ymm0,%ymm10
vpaddq    %ymm10,%ymm2,%ymm2
vpand     vecmask27,%ymm0,%ymm0

vpsrlq    $27,%ymm15,%ymm10
vpaddq    %ymm10,%ymm5,%ymm5
vpand     vecmask27,%ymm15,%ymm15

vpsrlq    $27,%ymm2,%ymm10
vpaddq    %ymm10,%ymm4,%ymm4
vpand     vecmask27,%ymm2,%ymm2

vpsrlq    $27,%ymm5,%ymm10
vpaddq    %ymm10,%ymm7,%ymm7
vpand     vecmask27,%ymm5,%ymm5

vpsrlq    $27,%ymm4,%ymm10
vpaddq    %ymm10,%ymm6,%ymm6
vpand     vecmask27,%ymm4,%ymm4

vpsrlq    $27,%ymm7,%ymm10
vpaddq    %ymm10,%ymm11,%ymm11
vpand     vecmask27,%ymm7,%ymm7

vpsrlq    $27,%ymm6,%ymm10
vpaddq    %ymm10,%ymm8,%ymm8
vpand     vecmask27,%ymm6,%ymm6

vpsrlq    $23,%ymm11,%ymm10
vpaddq    %ymm10,%ymm0,%ymm0
vpaddq    %ymm10,%ymm10,%ymm10
vpaddq    %ymm10,%ymm0,%ymm0
vpand     vecmask23,%ymm11,%ymm11

vpsrlq    $27,%ymm8,%ymm10
vpaddq    %ymm10,%ymm9,%ymm9
vpand     vecmask27,%ymm8,%ymm8

// Sqr
vmovdqa   %ymm5,64(%rsp)
vmovdqa   %ymm7,96(%rsp)
vmovdqa   %ymm11,128(%rsp)

vpaddq    %ymm0,%ymm0,%ymm10
vpaddq    %ymm2,%ymm2,%ymm11
vpaddq    %ymm4,%ymm4,%ymm12
vpaddq    %ymm6,%ymm6,%ymm13
vpaddq    %ymm8,%ymm8,%ymm14
vpaddq    %ymm9,%ymm9,%ymm5

vpmuludq  128(%rsp),%ymm11,%ymm3
vpmuludq  96(%rsp),%ymm12,%ymm7
vpaddq    %ymm7,%ymm3,%ymm3
vpmuludq  64(%rsp),%ymm13,%ymm7
vpaddq    %ymm7,%ymm3,%ymm3
vpmuludq  %ymm15,%ymm14,%ymm7
vpaddq    %ymm7,%ymm3,%ymm3
vpmuludq  %ymm9,%ymm9,%ymm7
vpaddq    %ymm7,%ymm3,%ymm3
vpsllq    $4,%ymm3,%ymm7
vpsllq    $5,%ymm3,%ymm3
vpaddq    %ymm7,%ymm3,%ymm3
vpmuludq  %ymm0,%ymm0,%ymm7
vpaddq    %ymm7,%ymm3,%ymm0

vmovdqa   %ymm0,160(%rsp)
vmovdqa   64(%rsp),%ymm0

vpmuludq  128(%rsp),%ymm4,%ymm3
vpmuludq  96(%rsp),%ymm6,%ymm7
vpaddq    %ymm7,%ymm3,%ymm3
vpmuludq  %ymm0,%ymm8,%ymm7
vpaddq    %ymm7,%ymm3,%ymm3
vpmuludq  %ymm15,%ymm9,%ymm7
vpaddq    %ymm7,%ymm3,%ymm3
vpsllq    $5,%ymm3,%ymm7
vpsllq    $6,%ymm3,%ymm3
vpaddq    %ymm7,%ymm3,%ymm3
vpmuludq  %ymm10,%ymm2,%ymm7
vpaddq    %ymm7,%ymm3,%ymm1

vmovdqa   %ymm1,192(%rsp)
vmovdqa   96(%rsp),%ymm1

vpmuludq  128(%rsp),%ymm13,%ymm3
vpmuludq  %ymm1,%ymm14,%ymm7
vpaddq    %ymm7,%ymm3,%ymm3
vpmuludq  %ymm0,%ymm5,%ymm7
vpaddq    %ymm7,%ymm3,%ymm3
vpmuludq  %ymm15,%ymm15,%ymm7
vpaddq    %ymm7,%ymm3,%ymm3
vpsllq    $4,%ymm3,%ymm7
vpsllq    $5,%ymm3,%ymm3
vpaddq    %ymm7,%ymm3,%ymm3
vpmuludq  %ymm2,%ymm2,%ymm7
vpaddq    %ymm7,%ymm3,%ymm3
vpmuludq  %ymm10,%ymm4,%ymm7
vpaddq    %ymm7,%ymm3,%ymm2

vmovdqa   %ymm2,224(%rsp)
vmovdqa   128(%rsp),%ymm2

vpmuludq  %ymm2,%ymm8,%ymm3
vpmuludq  %ymm1,%ymm9,%ymm7
vpaddq    %ymm7,%ymm3,%ymm3
vpmuludq  %ymm0,%ymm15,%ymm7
vpaddq    %ymm7,%ymm3,%ymm3
vpsllq    $5,%ymm3,%ymm7
vpsllq    $6,%ymm3,%ymm3
vpaddq    %ymm7,%ymm3,%ymm3
vpmuludq  %ymm10,%ymm6,%ymm7
vpaddq    %ymm7,%ymm3,%ymm3
vpmuludq  %ymm11,%ymm4,%ymm7
vpaddq    %ymm7,%ymm3,%ymm3

vpmuludq  %ymm0,%ymm0,%ymm7
vpmuludq  %ymm2,%ymm5,%ymm5
vpaddq    %ymm7,%ymm5,%ymm5
vpaddq    %ymm15,%ymm15,%ymm7
vpmuludq  %ymm1,%ymm7,%ymm7
vpaddq    %ymm7,%ymm5,%ymm5
vpsllq    $4,%ymm5,%ymm7
vpsllq    $5,%ymm5,%ymm5
vpaddq    %ymm7,%ymm5,%ymm5
vpmuludq  %ymm10,%ymm8,%ymm7
vpaddq    %ymm7,%ymm5,%ymm5
vpmuludq  %ymm11,%ymm6,%ymm7
vpaddq    %ymm7,%ymm5,%ymm5
vpmuludq  %ymm4,%ymm4,%ymm7
vpaddq    %ymm7,%ymm5,%ymm4

vpmuludq  %ymm2,%ymm15,%ymm5
vpmuludq  %ymm0,%ymm1,%ymm7
vpaddq    %ymm7,%ymm5,%ymm5
vpsllq    $5,%ymm5,%ymm7
vpsllq    $6,%ymm5,%ymm5
vpaddq    %ymm7,%ymm5,%ymm5
vpmuludq  %ymm10,%ymm9,%ymm7
vpaddq    %ymm7,%ymm5,%ymm5
vpmuludq  %ymm11,%ymm8,%ymm7
vpaddq    %ymm7,%ymm5,%ymm5
vpmuludq  %ymm12,%ymm6,%ymm7
vpaddq    %ymm7,%ymm5,%ymm5

vpaddq    %ymm0,%ymm0,%ymm0
vpmuludq  %ymm0,%ymm2,%ymm0
vpmuludq  %ymm1,%ymm1,%ymm7
vpaddq    %ymm7,%ymm0,%ymm0
vpsllq    $4,%ymm0,%ymm7
vpsllq    $5,%ymm0,%ymm0
vpaddq    %ymm7,%ymm0,%ymm0
vpmuludq  %ymm10,%ymm15,%ymm7
vpaddq    %ymm7,%ymm0,%ymm0
vpmuludq  %ymm11,%ymm9,%ymm7
vpaddq    %ymm7,%ymm0,%ymm0
vpmuludq  %ymm12,%ymm8,%ymm7
vpaddq    %ymm7,%ymm0,%ymm0
vpmuludq  %ymm6,%ymm6,%ymm6
vpaddq    %ymm0,%ymm6,%ymm6

vpmuludq  %ymm1,%ymm2,%ymm0
vpsllq    $5,%ymm0,%ymm7
vpsllq    $6,%ymm0,%ymm0
vpaddq    %ymm0,%ymm7,%ymm7
vpmuludq  64(%rsp),%ymm10,%ymm0
vpaddq    %ymm0,%ymm7,%ymm7
vpmuludq  %ymm11,%ymm15,%ymm0
vpaddq    %ymm0,%ymm7,%ymm7
vpmuludq  %ymm12,%ymm9,%ymm0
vpaddq    %ymm0,%ymm7,%ymm7
vpmuludq  %ymm13,%ymm8,%ymm0
vpaddq    %ymm0,%ymm7,%ymm7

vpmuludq  %ymm2,%ymm2,%ymm0
vpsllq    $4,%ymm0,%ymm0
vpmuludq  %ymm8,%ymm8,%ymm8
vpaddq    %ymm0,%ymm8,%ymm8
vpsllq    $1,%ymm0,%ymm0
vpaddq    %ymm0,%ymm8,%ymm8
vpmuludq  %ymm10,%ymm1,%ymm0
vpaddq    %ymm0,%ymm8,%ymm8
vpmuludq  64(%rsp),%ymm11,%ymm0
vpaddq    %ymm0,%ymm8,%ymm8
vpmuludq  %ymm12,%ymm15,%ymm0
vpaddq    %ymm0,%ymm8,%ymm8
vpmuludq  %ymm13,%ymm9,%ymm0
vpaddq    %ymm0,%ymm8,%ymm8

vpmuludq  %ymm14,%ymm9,%ymm9
vpmuludq  %ymm13,%ymm15,%ymm0
vpaddq    %ymm0,%ymm9,%ymm9
vpmuludq  64(%rsp),%ymm12,%ymm0
vpaddq    %ymm0,%ymm9,%ymm9
vpmuludq  %ymm11,%ymm1,%ymm0
vpaddq    %ymm0,%ymm9,%ymm9
vpmuludq  %ymm10,%ymm2,%ymm0
vpaddq    %ymm0,%ymm9,%ymm9

vmovdqa   160(%rsp),%ymm0
vmovdqa   192(%rsp),%ymm1
vmovdqa   224(%rsp),%ymm2

vpsrlq    $27,%ymm5,%ymm10
vpaddq    %ymm10,%ymm6,%ymm6
vpand     vecmask27,%ymm5,%ymm5

vpsrlq    $27,%ymm0,%ymm10
vpaddq    %ymm10,%ymm1,%ymm1
vpand     vecmask27,%ymm0,%ymm0

vpsrlq    $27,%ymm6,%ymm10
vpaddq    %ymm10,%ymm7,%ymm7
vpand     vecmask27,%ymm6,%ymm6

vpsrlq    $27,%ymm1,%ymm10
vpaddq    %ymm10,%ymm2,%ymm2
vpand     vecmask27,%ymm1,%ymm1

vpsrlq    $27,%ymm7,%ymm10
vpaddq    %ymm10,%ymm8,%ymm8
vpand     vecmask27,%ymm7,%ymm7

vpsrlq    $27,%ymm2,%ymm10
vpaddq    %ymm10,%ymm3,%ymm3
vpand     vecmask27,%ymm2,%ymm2

vpsrlq    $27,%ymm8,%ymm10
vpaddq    %ymm10,%ymm9,%ymm9
vpand     vecmask27,%ymm8,%ymm8

vpsrlq    $27,%ymm3,%ymm10
vpaddq    %ymm10,%ymm4,%ymm4
vpand     vecmask27,%ymm3,%ymm3

vpsrlq    $23,%ymm9,%ymm10
vpaddq    %ymm10,%ymm0,%ymm0
vpaddq    %ymm10,%ymm10,%ymm10
vpaddq    %ymm10,%ymm0,%ymm0
vpand     vecmask23,%ymm9,%ymm9

vpsrlq    $27,%ymm4,%ymm10
vpaddq    %ymm10,%ymm5,%ymm5
vpand     vecmask27,%ymm4,%ymm4

vpsrlq    $27,%ymm0,%ymm10
vpaddq    %ymm10,%ymm1,%ymm1
vpand     vecmask27,%ymm0,%ymm0

vpsrlq    $27,%ymm5,%ymm10
vpaddq    %ymm10,%ymm6,%ymm6
vpand     vecmask27,%ymm5,%ymm5

// MulC
vpmuludq  vec_c2,%ymm0,%ymm10
vpmuludq  vec_c2,%ymm1,%ymm0
vpmuludq  vec_c2,%ymm2,%ymm1
vpmuludq  vec_c2,%ymm3,%ymm2
vpmuludq  vec_c2,%ymm4,%ymm3
vpmuludq  vec_c2,%ymm5,%ymm4
vpmuludq  vec_c2,%ymm6,%ymm5
vpmuludq  vec_c2,%ymm7,%ymm6
vpmuludq  vec_c2,%ymm8,%ymm7
vpmuludq  vec_c2,%ymm9,%ymm8

vpsrlq    $27,%ymm4,%ymm11
vpaddq    %ymm11,%ymm5,%ymm5
vpand     vecmask27,%ymm4,%ymm4

vpsrlq    $27,%ymm10,%ymm11
vpaddq    %ymm11,%ymm0,%ymm0
vpand     vecmask27,%ymm10,%ymm9

vpsrlq    $27,%ymm5,%ymm11
vpaddq    %ymm11,%ymm6,%ymm6
vpand     vecmask27,%ymm5,%ymm5

vpsrlq    $27,%ymm0,%ymm11
vpaddq    %ymm11,%ymm1,%ymm1
vpand     vecmask27,%ymm0,%ymm0

vpsrlq    $27,%ymm6,%ymm11
vpaddq    %ymm11,%ymm7,%ymm7
vpand     vecmask27,%ymm6,%ymm6

vpsrlq    $27,%ymm1,%ymm11
vpaddq    %ymm11,%ymm2,%ymm2
vpand     vecmask27,%ymm1,%ymm1

vpsrlq    $27,%ymm7,%ymm11
vpaddq    %ymm11,%ymm8,%ymm8
vpand     vecmask27,%ymm7,%ymm7

vpsrlq    $27,%ymm2,%ymm11
vpaddq    %ymm11,%ymm3,%ymm3
vpand     vecmask27,%ymm2,%ymm2

vpsrlq    $23,%ymm8,%ymm11
vpaddq    %ymm11,%ymm9,%ymm9
vpaddq    %ymm11,%ymm11,%ymm11
vpaddq    %ymm11,%ymm9,%ymm9
vpand     vecmask23,%ymm8,%ymm8

vpsrlq    $27,%ymm3,%ymm11
vpaddq    %ymm11,%ymm4,%ymm4
vpand     vecmask27,%ymm3,%ymm3

// Initialize-P
movdqa    16(%rsi),%xmm9
movdqa    48(%rsi),%xmm0
movdqa    80(%rsi),%xmm1
movdqa    112(%rsi),%xmm2
movdqa    144(%rsi),%xmm3
movdqa    176(%rsi),%xmm4
movdqa    208(%rsi),%xmm5
movdqa    240(%rsi),%xmm6
movdqa    272(%rsi),%xmm7
movdqa    304(%rsi),%xmm8

movq      $33,%r15
movq	  $0,%rcx

movq      %rdx,%rax

// Kummer Ladder
.L1:
addq      %r15,%rax
movb      0(%rax),%r14b
movq      %rdx,%rax

.L2:
movb	  %r14b,%bl
shrb      %cl,%bl
andb      $1,%bl

movzbl    %bl,%ebx
imul	  $4,%ebx,%ebx
movl      %ebx,56(%rsp)

// Pack-N2D
vpsllq    $32,%ymm4,%ymm4
vpor      %ymm4,%ymm9,%ymm9
vpsllq    $32,%ymm5,%ymm5
vpor      %ymm5,%ymm0,%ymm0
vpsllq    $32,%ymm6,%ymm6
vpor      %ymm6,%ymm1,%ymm1
vpsllq    $32,%ymm7,%ymm7
vpor      %ymm7,%ymm2,%ymm2
vpsllq    $32,%ymm8,%ymm8
vpor      %ymm8,%ymm3,%ymm3

// Dense-HH
vpshufd	  $68,%ymm9,%ymm4
vpshufd	  $238,%ymm9,%ymm5
vpaddd    hh_p1d,%ymm4,%ymm4
vpxor     hh_xor,%ymm5,%ymm5
vpaddd    %ymm4,%ymm5,%ymm9

vpshufd	  $68,%ymm0,%ymm4
vpshufd	  $238,%ymm0,%ymm5
vpaddd    hh_p2d,%ymm4,%ymm4
vpxor     hh_xor,%ymm5,%ymm5
vpaddd    %ymm4,%ymm5,%ymm0

vpshufd	  $68,%ymm1,%ymm4
vpshufd	  $238,%ymm1,%ymm5
vpaddd    hh_p2d,%ymm4,%ymm4
vpxor     hh_xor,%ymm5,%ymm5
vpaddd    %ymm4,%ymm5,%ymm1

vpshufd	  $68,%ymm2,%ymm4
vpshufd	  $238,%ymm2,%ymm5
vpaddd    hh_p2d,%ymm4,%ymm4
vpxor     hh_xor,%ymm5,%ymm5
vpaddd    %ymm4,%ymm5,%ymm2

vpshufd	  $68,%ymm3,%ymm4
vpshufd	  $238,%ymm3,%ymm5
vpaddd    hh_p3d,%ymm4,%ymm4
vpxor     hh_xor,%ymm5,%ymm5
vpaddd    %ymm4,%ymm5,%ymm3

vpsrld    $27,%ymm9,%ymm4
vpaddd    %ymm4,%ymm0,%ymm0
vpand     vecmask27d,%ymm9,%ymm9

vpsrld    $27,%ymm0,%ymm4
vpaddd    %ymm4,%ymm1,%ymm1
vpand     vecmask27d,%ymm0,%ymm0

vpsrld    $27,%ymm1,%ymm4
vpaddd    %ymm4,%ymm2,%ymm2
vpand     vecmask27d,%ymm1,%ymm1

vpsrld    $27,%ymm2,%ymm4
vpaddd    %ymm4,%ymm3,%ymm3
vpand     vecmask27d,%ymm2,%ymm2

vpsrld    $27,%ymm3,%ymm4
vpsllq    $32,%ymm4,%ymm4
vpaddd    %ymm4,%ymm9,%ymm9
vpsrlq    $55,%ymm3,%ymm4
vpaddd    %ymm4,%ymm9,%ymm9
vpaddd    %ymm4,%ymm4,%ymm4
vpaddd    %ymm4,%ymm9,%ymm9
vpand     vecmask2723d,%ymm3,%ymm3

// Pack-D2N
vpsrlq    $32,%ymm9,%ymm4
vpsrlq    $32,%ymm0,%ymm5
vpsrlq    $32,%ymm1,%ymm6
vpsrlq    $32,%ymm2,%ymm7
vpsrlq    $32,%ymm3,%ymm8

vmovdqa   %ymm9,64(%rsp)
vmovdqa   %ymm0,96(%rsp)
vmovdqa   %ymm1,128(%rsp)
vmovdqa   %ymm2,160(%rsp)
vmovdqa   %ymm3,192(%rsp)
vmovdqa   %ymm4,224(%rsp)
vmovdqa   %ymm5,256(%rsp)
vmovdqa   %ymm6,288(%rsp)
vmovdqa   %ymm7,320(%rsp)
vmovdqa   %ymm8,352(%rsp)

// Dense-CDup
vpbroadcastd 56(%rsp),%ymm15
vpaddd	  dup_c,%ymm15,%ymm15

vpermd	  %ymm9,%ymm15,%ymm8
vmovdqa   %ymm8,384(%rsp)
vpsrlq    $32,%ymm8,%ymm11
vpermd	  %ymm0,%ymm15,%ymm8
vpermd	  %ymm1,%ymm15,%ymm7
vpermd	  %ymm2,%ymm15,%ymm9
vpermd	  %ymm3,%ymm15,%ymm10

// Pack-D2N
vpsrlq    $32,%ymm8,%ymm12
vpsrlq    $32,%ymm7,%ymm13
vpsrlq    $32,%ymm9,%ymm14
vpsrlq    $32,%ymm10,%ymm15

// Mul
vmovdqa   %ymm8,416(%rsp)
vmovdqa   %ymm7,448(%rsp)
vmovdqa   %ymm9,480(%rsp)
vmovdqa   %ymm10,512(%rsp)
vmovdqa   %ymm11,544(%rsp)
vmovdqa   %ymm12,576(%rsp)
vmovdqa   %ymm13,608(%rsp)
vmovdqa   %ymm14,640(%rsp)
vmovdqa   %ymm15,672(%rsp)

vpsllq    $2,%ymm0,%ymm0
vpsllq    $2,%ymm1,%ymm1
vpsllq    $2,%ymm2,%ymm2
vpsllq    $2,%ymm3,%ymm3
vpsllq    $2,%ymm4,%ymm4
vpsllq    $2,%ymm5,%ymm5
vpsllq    $2,%ymm6,%ymm6

vpmuludq  vec12,%ymm9,%ymm9
vpmuludq  vec12,%ymm10,%ymm10
vpmuludq  vec12,%ymm11,%ymm11
vpmuludq  vec12,%ymm12,%ymm12
vpmuludq  vec12,%ymm13,%ymm13
vpmuludq  vec12,%ymm14,%ymm14
vpmuludq  vec12,%ymm15,%ymm15

vpmuludq  %ymm0,%ymm15,%ymm0
vpmuludq  %ymm1,%ymm14,%ymm7
vpaddq    %ymm7,%ymm0,%ymm0
vpmuludq  %ymm2,%ymm13,%ymm7
vpaddq    %ymm7,%ymm0,%ymm0
vpmuludq  %ymm3,%ymm12,%ymm7
vpaddq    %ymm7,%ymm0,%ymm0
vpmuludq  %ymm4,%ymm11,%ymm7
vpaddq    %ymm7,%ymm0,%ymm0
vpmuludq  %ymm5,%ymm10,%ymm7
vpaddq    %ymm7,%ymm0,%ymm0
vpmuludq  %ymm6,%ymm9,%ymm7
vpaddq    %ymm7,%ymm0,%ymm0

vpmuludq  %ymm1,%ymm15,%ymm1
vpmuludq  %ymm2,%ymm14,%ymm7
vpaddq    %ymm7,%ymm1,%ymm1
vpmuludq  %ymm3,%ymm13,%ymm7
vpaddq    %ymm7,%ymm1,%ymm1
vpmuludq  %ymm4,%ymm12,%ymm7
vpaddq    %ymm7,%ymm1,%ymm1
vpmuludq  %ymm5,%ymm11,%ymm7
vpaddq    %ymm7,%ymm1,%ymm1
vpmuludq  %ymm6,%ymm10,%ymm7
vpaddq    %ymm7,%ymm1,%ymm1

vpmuludq  %ymm2,%ymm15,%ymm2
vpmuludq  %ymm3,%ymm14,%ymm7
vpaddq    %ymm7,%ymm2,%ymm2
vpmuludq  %ymm4,%ymm13,%ymm7
vpaddq    %ymm7,%ymm2,%ymm2
vpmuludq  %ymm5,%ymm12,%ymm7
vpaddq    %ymm7,%ymm2,%ymm2
vpmuludq  %ymm6,%ymm11,%ymm7
vpaddq    %ymm7,%ymm2,%ymm2

vpmuludq  %ymm3,%ymm15,%ymm3
vpmuludq  %ymm4,%ymm14,%ymm7
vpaddq    %ymm7,%ymm3,%ymm3
vpmuludq  %ymm5,%ymm13,%ymm7
vpaddq    %ymm7,%ymm3,%ymm3
vpmuludq  %ymm6,%ymm12,%ymm7
vpaddq    %ymm7,%ymm3,%ymm3

vpmuludq  %ymm4,%ymm15,%ymm4
vpmuludq  %ymm5,%ymm14,%ymm7
vpaddq    %ymm7,%ymm4,%ymm4
vpmuludq  %ymm6,%ymm13,%ymm7
vpaddq    %ymm7,%ymm4,%ymm4

vpmuludq  %ymm5,%ymm15,%ymm5
vpmuludq  %ymm6,%ymm14,%ymm7
vpaddq    %ymm7,%ymm5,%ymm5

vpmuludq  %ymm6,%ymm15,%ymm6

vmovdqa   %ymm13,704(%rsp)
vmovdqa   %ymm14,736(%rsp)
vmovdqa   %ymm15,768(%rsp)

vmovdqa   320(%rsp),%ymm7
vmovdqa   352(%rsp),%ymm8

vpsllq    $2,%ymm7,%ymm7
vpsllq    $2,%ymm8,%ymm8

vmovdqa   416(%rsp),%ymm14
vmovdqa   448(%rsp),%ymm15

vpmuludq  vec12,%ymm14,%ymm14
vpmuludq  vec12,%ymm15,%ymm15

vpmuludq  %ymm7,%ymm15,%ymm13
vpaddq    %ymm13,%ymm0,%ymm0
vpmuludq  %ymm8,%ymm14,%ymm13
vpaddq    %ymm13,%ymm0,%ymm0

vpmuludq  %ymm7,%ymm9,%ymm13
vpaddq    %ymm13,%ymm1,%ymm1
vpmuludq  %ymm8,%ymm15,%ymm13
vpaddq    %ymm13,%ymm1,%ymm1

vpmuludq  %ymm7,%ymm10,%ymm13
vpaddq    %ymm13,%ymm2,%ymm2
vpmuludq  %ymm8,%ymm9,%ymm13
vpaddq    %ymm13,%ymm2,%ymm2

vpmuludq  %ymm7,%ymm11,%ymm13
vpaddq    %ymm13,%ymm3,%ymm3
vpmuludq  %ymm8,%ymm10,%ymm13
vpaddq    %ymm13,%ymm3,%ymm3

vpmuludq  %ymm7,%ymm12,%ymm13
vpaddq    %ymm13,%ymm4,%ymm4
vpmuludq  %ymm8,%ymm11,%ymm13
vpaddq    %ymm13,%ymm4,%ymm4

vpmuludq  704(%rsp),%ymm7,%ymm13
vpaddq    %ymm13,%ymm5,%ymm5
vpmuludq  %ymm12,%ymm8,%ymm13
vpaddq    %ymm13,%ymm5,%ymm5

vpmuludq  736(%rsp),%ymm7,%ymm13
vpaddq    %ymm13,%ymm6,%ymm6
vpmuludq  704(%rsp),%ymm8,%ymm13
vpaddq    %ymm13,%ymm6,%ymm6

vpmuludq  768(%rsp),%ymm7,%ymm7
vpmuludq  736(%rsp),%ymm8,%ymm13
vpaddq    %ymm13,%ymm7,%ymm7

vpmuludq  768(%rsp),%ymm8,%ymm8

vmovdqa   64(%rsp),%ymm10
vmovdqa   96(%rsp),%ymm11
vmovdqa   128(%rsp),%ymm12
vmovdqa   160(%rsp),%ymm13
vmovdqa   192(%rsp),%ymm14
vmovdqa   224(%rsp),%ymm15

vpmuludq  384(%rsp),%ymm10,%ymm9
vpaddq    %ymm9,%ymm0,%ymm0

vpmuludq  416(%rsp),%ymm10,%ymm9
vpaddq    %ymm9,%ymm1,%ymm1
vpmuludq  384(%rsp),%ymm11,%ymm9
vpaddq    %ymm9,%ymm1,%ymm1

vpmuludq  448(%rsp),%ymm10,%ymm9
vpaddq    %ymm9,%ymm2,%ymm2
vpmuludq  416(%rsp),%ymm11,%ymm9
vpaddq    %ymm9,%ymm2,%ymm2
vpmuludq  384(%rsp),%ymm12,%ymm9
vpaddq    %ymm9,%ymm2,%ymm2

vpmuludq  480(%rsp),%ymm10,%ymm9
vpaddq    %ymm9,%ymm3,%ymm3
vpmuludq  448(%rsp),%ymm11,%ymm9
vpaddq    %ymm9,%ymm3,%ymm3
vpmuludq  416(%rsp),%ymm12,%ymm9
vpaddq    %ymm9,%ymm3,%ymm3
vpmuludq  384(%rsp),%ymm13,%ymm9
vpaddq    %ymm9,%ymm3,%ymm3

vpmuludq  512(%rsp),%ymm10,%ymm9
vpaddq    %ymm9,%ymm4,%ymm4
vpmuludq  480(%rsp),%ymm11,%ymm9
vpaddq    %ymm9,%ymm4,%ymm4
vpmuludq  448(%rsp),%ymm12,%ymm9
vpaddq    %ymm9,%ymm4,%ymm4
vpmuludq  416(%rsp),%ymm13,%ymm9
vpaddq    %ymm9,%ymm4,%ymm4
vpmuludq  384(%rsp),%ymm14,%ymm9
vpaddq    %ymm9,%ymm4,%ymm4

vpmuludq  544(%rsp),%ymm10,%ymm9
vpaddq    %ymm9,%ymm5,%ymm5
vpmuludq  512(%rsp),%ymm11,%ymm9
vpaddq    %ymm9,%ymm5,%ymm5
vpmuludq  480(%rsp),%ymm12,%ymm9
vpaddq    %ymm9,%ymm5,%ymm5
vpmuludq  448(%rsp),%ymm13,%ymm9
vpaddq    %ymm9,%ymm5,%ymm5
vpmuludq  416(%rsp),%ymm14,%ymm9
vpaddq    %ymm9,%ymm5,%ymm5
vpmuludq  384(%rsp),%ymm15,%ymm9
vpaddq    %ymm9,%ymm5,%ymm5

vpmuludq  576(%rsp),%ymm10,%ymm9
vpaddq    %ymm9,%ymm6,%ymm6
vpmuludq  544(%rsp),%ymm11,%ymm9
vpaddq    %ymm9,%ymm6,%ymm6
vpmuludq  512(%rsp),%ymm12,%ymm9
vpaddq    %ymm9,%ymm6,%ymm6
vpmuludq  480(%rsp),%ymm13,%ymm9
vpaddq    %ymm9,%ymm6,%ymm6
vpmuludq  448(%rsp),%ymm14,%ymm9
vpaddq    %ymm9,%ymm6,%ymm6
vpmuludq  416(%rsp),%ymm15,%ymm9
vpaddq    %ymm9,%ymm6,%ymm6

vpmuludq  608(%rsp),%ymm10,%ymm9
vpaddq    %ymm9,%ymm7,%ymm7
vpmuludq  576(%rsp),%ymm11,%ymm9
vpaddq    %ymm9,%ymm7,%ymm7
vpmuludq  544(%rsp),%ymm12,%ymm9
vpaddq    %ymm9,%ymm7,%ymm7
vpmuludq  512(%rsp),%ymm13,%ymm9
vpaddq    %ymm9,%ymm7,%ymm7
vpmuludq  480(%rsp),%ymm14,%ymm9
vpaddq    %ymm9,%ymm7,%ymm7
vpmuludq  448(%rsp),%ymm15,%ymm9
vpaddq    %ymm9,%ymm7,%ymm7

vpmuludq  640(%rsp),%ymm10,%ymm9
vpaddq    %ymm9,%ymm8,%ymm8
vpmuludq  608(%rsp),%ymm11,%ymm9
vpaddq    %ymm9,%ymm8,%ymm8
vpmuludq  576(%rsp),%ymm12,%ymm9
vpaddq    %ymm9,%ymm8,%ymm8
vpmuludq  544(%rsp),%ymm13,%ymm9
vpaddq    %ymm9,%ymm8,%ymm8
vpmuludq  512(%rsp),%ymm14,%ymm9
vpaddq    %ymm9,%ymm8,%ymm8
vpmuludq  480(%rsp),%ymm15,%ymm9
vpaddq    %ymm9,%ymm8,%ymm8

vpmuludq  672(%rsp),%ymm10,%ymm9
vpmuludq  640(%rsp),%ymm11,%ymm15
vpaddq    %ymm15,%ymm9,%ymm9
vpmuludq  608(%rsp),%ymm12,%ymm15
vpaddq    %ymm15,%ymm9,%ymm9
vpmuludq  576(%rsp),%ymm13,%ymm15
vpaddq    %ymm15,%ymm9,%ymm9
vpmuludq  544(%rsp),%ymm14,%ymm15
vpaddq    %ymm15,%ymm9,%ymm9

vmovdqa   224(%rsp),%ymm11
vmovdqa   256(%rsp),%ymm12
vmovdqa   288(%rsp),%ymm13
vmovdqa   320(%rsp),%ymm14
vmovdqa   352(%rsp),%ymm15

vpmuludq  384(%rsp),%ymm12,%ymm10
vpaddq    %ymm10,%ymm6,%ymm6

vpmuludq  416(%rsp),%ymm12,%ymm10
vpaddq    %ymm10,%ymm7,%ymm7
vpmuludq  384(%rsp),%ymm13,%ymm10
vpaddq    %ymm10,%ymm7,%ymm7

vpmuludq  448(%rsp),%ymm12,%ymm10
vpaddq    %ymm10,%ymm8,%ymm8
vpmuludq  416(%rsp),%ymm13,%ymm10
vpaddq    %ymm10,%ymm8,%ymm8
vpmuludq  384(%rsp),%ymm14,%ymm10
vpaddq    %ymm10,%ymm8,%ymm8

vpmuludq  512(%rsp),%ymm11,%ymm10
vpaddq    %ymm10,%ymm9,%ymm9
vpmuludq  480(%rsp),%ymm12,%ymm10
vpaddq    %ymm10,%ymm9,%ymm9
vpmuludq  448(%rsp),%ymm13,%ymm10
vpaddq    %ymm10,%ymm9,%ymm9
vpmuludq  416(%rsp),%ymm14,%ymm10
vpaddq    %ymm10,%ymm9,%ymm9
vpmuludq  384(%rsp),%ymm15,%ymm10
vpaddq    %ymm10,%ymm9,%ymm9

vpsrlq 	  $27,%ymm0,%ymm10
vpaddq 	  %ymm10,%ymm1,%ymm1
vpand     vecmask27,%ymm0,%ymm0

vpsrlq 	  $27,%ymm1,%ymm10
vpaddq 	  %ymm10,%ymm2,%ymm2
vpand     vecmask27,%ymm1,%ymm1

vpsrlq 	  $27,%ymm2,%ymm10
vpaddq 	  %ymm10,%ymm3,%ymm3
vpand     vecmask27,%ymm2,%ymm2

vpsrlq 	  $27,%ymm3,%ymm10
vpaddq 	  %ymm10,%ymm4,%ymm4
vpand     vecmask27,%ymm3,%ymm3

vpsrlq 	  $27,%ymm4,%ymm10
vpaddq 	  %ymm10,%ymm5,%ymm5
vpand     vecmask27,%ymm4,%ymm4

vpsrlq 	  $27,%ymm5,%ymm10
vpaddq 	  %ymm10,%ymm6,%ymm6
vpand     vecmask27,%ymm5,%ymm5

vpsrlq 	  $27,%ymm6,%ymm10
vpaddq 	  %ymm10,%ymm7,%ymm7
vpand     vecmask27,%ymm6,%ymm6

vpsrlq 	  $27,%ymm7,%ymm10
vpaddq 	  %ymm10,%ymm8,%ymm8
vpand     vecmask27,%ymm7,%ymm7

vpsrlq 	  $27,%ymm8,%ymm10
vpaddq 	  %ymm10,%ymm9,%ymm9
vpand     vecmask27,%ymm8,%ymm8

vpsrlq    $23,%ymm9,%ymm10
vpaddq 	  %ymm10,%ymm0,%ymm0
vpaddq 	  %ymm10,%ymm10,%ymm10
vpaddq 	  %ymm10,%ymm0,%ymm0
vpand     vecmask23,%ymm9,%ymm9

vpsrlq 	  $27,%ymm0,%ymm10
vpaddq 	  %ymm10,%ymm1,%ymm1
vpand     vecmask27,%ymm0,%ymm0

// Unreduced-MulC
vpmuludq  vec_c1,%ymm0,%ymm0
vpmuludq  vec_c1,%ymm9,%ymm11
vpmuludq  vec_c1,%ymm6,%ymm15
vpmuludq  vec_c1,%ymm3,%ymm6
vpmuludq  vec_c1,%ymm5,%ymm9
vpmuludq  vec_c1,%ymm7,%ymm5
vpmuludq  vec_c1,%ymm8,%ymm7
vpmuludq  vec_c1,%ymm4,%ymm8
vpmuludq  vec_c1,%ymm2,%ymm4
vpmuludq  vec_c1,%ymm1,%ymm2

// HH
vpshufd	  $68,%ymm0,%ymm1
vpshufd	  $238,%ymm0,%ymm3
vpaddq    hh_p1q,%ymm1,%ymm1
vpxor     hh_xor,%ymm3,%ymm3
vpaddq    %ymm1,%ymm3,%ymm0

vpshufd	  $68,%ymm2,%ymm1
vpshufd	  $238,%ymm2,%ymm3
vpaddq    hh_p2q,%ymm1,%ymm1
vpxor     hh_xor,%ymm3,%ymm3
vpaddq    %ymm1,%ymm3,%ymm2

vpshufd	  $68,%ymm4,%ymm1
vpshufd	  $238,%ymm4,%ymm3
vpaddq    hh_p2q,%ymm1,%ymm1
vpxor     hh_xor,%ymm3,%ymm3
vpaddq    %ymm1,%ymm3,%ymm4

vpshufd	  $68,%ymm6,%ymm1
vpshufd	  $238,%ymm6,%ymm3
vpaddq    hh_p2q,%ymm1,%ymm1
vpxor     hh_xor,%ymm3,%ymm3
vpaddq    %ymm1,%ymm3,%ymm6

vpshufd	  $68,%ymm8,%ymm1
vpshufd	  $238,%ymm8,%ymm3
vpaddq    hh_p2q,%ymm1,%ymm1
vpxor     hh_xor,%ymm3,%ymm3
vpaddq    %ymm1,%ymm3,%ymm8

vpshufd	  $68,%ymm9,%ymm1
vpshufd	  $238,%ymm9,%ymm3
vpaddq    hh_p2q,%ymm1,%ymm1
vpxor     hh_xor,%ymm3,%ymm3
vpaddq    %ymm1,%ymm3,%ymm9

vpshufd	  $68,%ymm15,%ymm1
vpshufd	  $238,%ymm15,%ymm3
vpaddq    hh_p2q,%ymm1,%ymm1
vpxor     hh_xor,%ymm3,%ymm3
vpaddq    %ymm1,%ymm3,%ymm15

vpshufd	  $68,%ymm5,%ymm1
vpshufd	  $238,%ymm5,%ymm3
vpaddq    hh_p2q,%ymm1,%ymm1
vpxor     hh_xor,%ymm3,%ymm3
vpaddq    %ymm1,%ymm3,%ymm5

vpshufd	  $68,%ymm7,%ymm1
vpshufd	  $238,%ymm7,%ymm3
vpaddq    hh_p2q,%ymm1,%ymm1
vpxor     hh_xor,%ymm3,%ymm3
vpaddq    %ymm1,%ymm3,%ymm7

vpshufd	  $68,%ymm11,%ymm1
vpshufd	  $238,%ymm11,%ymm3
vpaddq    hh_p3q,%ymm1,%ymm1
vpxor     hh_xor,%ymm3,%ymm3
vpaddq    %ymm1,%ymm3,%ymm11

vpsrlq    $27,%ymm9,%ymm10
vpaddq    %ymm10,%ymm15,%ymm15
vpand     vecmask27,%ymm9,%ymm9

vpsrlq    $27,%ymm0,%ymm10
vpaddq    %ymm10,%ymm2,%ymm2
vpand     vecmask27,%ymm0,%ymm0

vpsrlq    $27,%ymm15,%ymm10
vpaddq    %ymm10,%ymm5,%ymm5
vpand     vecmask27,%ymm15,%ymm15

vpsrlq    $27,%ymm2,%ymm10
vpaddq    %ymm10,%ymm4,%ymm4
vpand     vecmask27,%ymm2,%ymm2

vpsrlq    $27,%ymm5,%ymm10
vpaddq    %ymm10,%ymm7,%ymm7
vpand     vecmask27,%ymm5,%ymm5

vpsrlq    $27,%ymm4,%ymm10
vpaddq    %ymm10,%ymm6,%ymm6
vpand     vecmask27,%ymm4,%ymm4

vpsrlq    $27,%ymm7,%ymm10
vpaddq    %ymm10,%ymm11,%ymm11
vpand     vecmask27,%ymm7,%ymm7

vpsrlq    $27,%ymm6,%ymm10
vpaddq    %ymm10,%ymm8,%ymm8
vpand     vecmask27,%ymm6,%ymm6

vpsrlq    $23,%ymm11,%ymm10
vpaddq    %ymm10,%ymm0,%ymm0
vpaddq    %ymm10,%ymm10,%ymm10
vpaddq    %ymm10,%ymm0,%ymm0
vpand     vecmask23,%ymm11,%ymm11

vpsrlq    $27,%ymm8,%ymm10
vpaddq    %ymm10,%ymm9,%ymm9
vpand     vecmask27,%ymm8,%ymm8

// Sqr
vmovdqa   %ymm5,64(%rsp)
vmovdqa   %ymm7,96(%rsp)
vmovdqa   %ymm11,128(%rsp)

vpaddq    %ymm0,%ymm0,%ymm10
vpaddq    %ymm2,%ymm2,%ymm11
vpaddq    %ymm4,%ymm4,%ymm12
vpaddq    %ymm6,%ymm6,%ymm13
vpaddq    %ymm8,%ymm8,%ymm14
vpaddq    %ymm9,%ymm9,%ymm5

vpmuludq  128(%rsp),%ymm11,%ymm3
vpmuludq  96(%rsp),%ymm12,%ymm7
vpaddq    %ymm7,%ymm3,%ymm3
vpmuludq  64(%rsp),%ymm13,%ymm7
vpaddq    %ymm7,%ymm3,%ymm3
vpmuludq  %ymm15,%ymm14,%ymm7
vpaddq    %ymm7,%ymm3,%ymm3
vpmuludq  %ymm9,%ymm9,%ymm7
vpaddq    %ymm7,%ymm3,%ymm3
vpsllq    $4,%ymm3,%ymm7
vpsllq    $5,%ymm3,%ymm3
vpaddq    %ymm7,%ymm3,%ymm3
vpmuludq  %ymm0,%ymm0,%ymm7
vpaddq    %ymm7,%ymm3,%ymm0

vmovdqa   %ymm0,160(%rsp)
vmovdqa   64(%rsp),%ymm0

vpmuludq  128(%rsp),%ymm4,%ymm3
vpmuludq  96(%rsp),%ymm6,%ymm7
vpaddq    %ymm7,%ymm3,%ymm3
vpmuludq  %ymm0,%ymm8,%ymm7
vpaddq    %ymm7,%ymm3,%ymm3
vpmuludq  %ymm15,%ymm9,%ymm7
vpaddq    %ymm7,%ymm3,%ymm3
vpsllq    $5,%ymm3,%ymm7
vpsllq    $6,%ymm3,%ymm3
vpaddq    %ymm7,%ymm3,%ymm3
vpmuludq  %ymm10,%ymm2,%ymm7
vpaddq    %ymm7,%ymm3,%ymm1

vmovdqa   %ymm1,192(%rsp)
vmovdqa   96(%rsp),%ymm1

vpmuludq  128(%rsp),%ymm13,%ymm3
vpmuludq  %ymm1,%ymm14,%ymm7
vpaddq    %ymm7,%ymm3,%ymm3
vpmuludq  %ymm0,%ymm5,%ymm7
vpaddq    %ymm7,%ymm3,%ymm3
vpmuludq  %ymm15,%ymm15,%ymm7
vpaddq    %ymm7,%ymm3,%ymm3
vpsllq    $4,%ymm3,%ymm7
vpsllq    $5,%ymm3,%ymm3
vpaddq    %ymm7,%ymm3,%ymm3
vpmuludq  %ymm2,%ymm2,%ymm7
vpaddq    %ymm7,%ymm3,%ymm3
vpmuludq  %ymm10,%ymm4,%ymm7
vpaddq    %ymm7,%ymm3,%ymm2

vmovdqa   %ymm2,224(%rsp)
vmovdqa   128(%rsp),%ymm2

vpmuludq  %ymm2,%ymm8,%ymm3
vpmuludq  %ymm1,%ymm9,%ymm7
vpaddq    %ymm7,%ymm3,%ymm3
vpmuludq  %ymm0,%ymm15,%ymm7
vpaddq    %ymm7,%ymm3,%ymm3
vpsllq    $5,%ymm3,%ymm7
vpsllq    $6,%ymm3,%ymm3
vpaddq    %ymm7,%ymm3,%ymm3
vpmuludq  %ymm10,%ymm6,%ymm7
vpaddq    %ymm7,%ymm3,%ymm3
vpmuludq  %ymm11,%ymm4,%ymm7
vpaddq    %ymm7,%ymm3,%ymm3

vpmuludq  %ymm0,%ymm0,%ymm7
vpmuludq  %ymm2,%ymm5,%ymm5
vpaddq    %ymm7,%ymm5,%ymm5
vpaddq    %ymm15,%ymm15,%ymm7
vpmuludq  %ymm1,%ymm7,%ymm7
vpaddq    %ymm7,%ymm5,%ymm5
vpsllq    $4,%ymm5,%ymm7
vpsllq    $5,%ymm5,%ymm5
vpaddq    %ymm7,%ymm5,%ymm5
vpmuludq  %ymm10,%ymm8,%ymm7
vpaddq    %ymm7,%ymm5,%ymm5
vpmuludq  %ymm11,%ymm6,%ymm7
vpaddq    %ymm7,%ymm5,%ymm5
vpmuludq  %ymm4,%ymm4,%ymm7
vpaddq    %ymm7,%ymm5,%ymm4

vpmuludq  %ymm2,%ymm15,%ymm5
vpmuludq  %ymm0,%ymm1,%ymm7
vpaddq    %ymm7,%ymm5,%ymm5
vpsllq    $5,%ymm5,%ymm7
vpsllq    $6,%ymm5,%ymm5
vpaddq    %ymm7,%ymm5,%ymm5
vpmuludq  %ymm10,%ymm9,%ymm7
vpaddq    %ymm7,%ymm5,%ymm5
vpmuludq  %ymm11,%ymm8,%ymm7
vpaddq    %ymm7,%ymm5,%ymm5
vpmuludq  %ymm12,%ymm6,%ymm7
vpaddq    %ymm7,%ymm5,%ymm5

vpaddq    %ymm0,%ymm0,%ymm0
vpmuludq  %ymm0,%ymm2,%ymm0
vpmuludq  %ymm1,%ymm1,%ymm7
vpaddq    %ymm7,%ymm0,%ymm0
vpsllq    $4,%ymm0,%ymm7
vpsllq    $5,%ymm0,%ymm0
vpaddq    %ymm7,%ymm0,%ymm0
vpmuludq  %ymm10,%ymm15,%ymm7
vpaddq    %ymm7,%ymm0,%ymm0
vpmuludq  %ymm11,%ymm9,%ymm7
vpaddq    %ymm7,%ymm0,%ymm0
vpmuludq  %ymm12,%ymm8,%ymm7
vpaddq    %ymm7,%ymm0,%ymm0
vpmuludq  %ymm6,%ymm6,%ymm6
vpaddq    %ymm0,%ymm6,%ymm6

vpmuludq  %ymm1,%ymm2,%ymm0
vpsllq    $5,%ymm0,%ymm7
vpsllq    $6,%ymm0,%ymm0
vpaddq    %ymm0,%ymm7,%ymm7
vpmuludq  64(%rsp),%ymm10,%ymm0
vpaddq    %ymm0,%ymm7,%ymm7
vpmuludq  %ymm11,%ymm15,%ymm0
vpaddq    %ymm0,%ymm7,%ymm7
vpmuludq  %ymm12,%ymm9,%ymm0
vpaddq    %ymm0,%ymm7,%ymm7
vpmuludq  %ymm13,%ymm8,%ymm0
vpaddq    %ymm0,%ymm7,%ymm7

vpmuludq  %ymm2,%ymm2,%ymm0
vpsllq    $4,%ymm0,%ymm0
vpmuludq  %ymm8,%ymm8,%ymm8
vpaddq    %ymm0,%ymm8,%ymm8
vpsllq    $1,%ymm0,%ymm0
vpaddq    %ymm0,%ymm8,%ymm8
vpmuludq  %ymm10,%ymm1,%ymm0
vpaddq    %ymm0,%ymm8,%ymm8
vpmuludq  64(%rsp),%ymm11,%ymm0
vpaddq    %ymm0,%ymm8,%ymm8
vpmuludq  %ymm12,%ymm15,%ymm0
vpaddq    %ymm0,%ymm8,%ymm8
vpmuludq  %ymm13,%ymm9,%ymm0
vpaddq    %ymm0,%ymm8,%ymm8

vpmuludq  %ymm14,%ymm9,%ymm9
vpmuludq  %ymm13,%ymm15,%ymm0
vpaddq    %ymm0,%ymm9,%ymm9
vpmuludq  64(%rsp),%ymm12,%ymm0
vpaddq    %ymm0,%ymm9,%ymm9
vpmuludq  %ymm11,%ymm1,%ymm0
vpaddq    %ymm0,%ymm9,%ymm9
vpmuludq  %ymm10,%ymm2,%ymm0
vpaddq    %ymm0,%ymm9,%ymm9

vmovdqa   160(%rsp),%ymm0
vmovdqa   192(%rsp),%ymm1
vmovdqa   224(%rsp),%ymm2

vpsrlq    $27,%ymm5,%ymm10
vpaddq    %ymm10,%ymm6,%ymm6
vpand     vecmask27,%ymm5,%ymm14

vpsrlq    $27,%ymm0,%ymm10
vpaddq    %ymm10,%ymm1,%ymm1
vpand     vecmask27,%ymm0,%ymm15

vpsrlq    $27,%ymm6,%ymm10
vpaddq    %ymm10,%ymm7,%ymm7
vpand     vecmask27,%ymm6,%ymm5

vpsrlq    $27,%ymm1,%ymm10
vpaddq    %ymm10,%ymm2,%ymm2
vpand     vecmask27,%ymm1,%ymm0

vpsrlq    $27,%ymm7,%ymm10
vpaddq    %ymm10,%ymm8,%ymm8
vpand     vecmask27,%ymm7,%ymm6

vpsrlq    $27,%ymm2,%ymm10
vpaddq    %ymm10,%ymm3,%ymm3
vpand     vecmask27,%ymm2,%ymm1

vpsrlq    $27,%ymm8,%ymm10
vpaddq    %ymm10,%ymm9,%ymm9
vpand     vecmask27,%ymm8,%ymm7

vpsrlq    $27,%ymm3,%ymm10
vpaddq    %ymm10,%ymm4,%ymm4
vpand     vecmask27,%ymm3,%ymm2

vpsrlq    $23,%ymm9,%ymm10
vpaddq    %ymm10,%ymm15,%ymm15
vpaddq    %ymm10,%ymm10,%ymm10
vpaddq    %ymm10,%ymm15,%ymm15
vpand     vecmask23,%ymm9,%ymm8

vpsrlq    $27,%ymm4,%ymm10
vpaddq    %ymm10,%ymm14,%ymm14
vpand     vecmask27,%ymm4,%ymm3

vpsrlq    $27,%ymm15,%ymm10
vpaddq    %ymm10,%ymm0,%ymm0
vpand     vecmask27,%ymm15,%ymm9

vpsrlq    $27,%ymm14,%ymm10
vpaddq    %ymm10,%ymm5,%ymm5
vpand     vecmask27,%ymm14,%ymm4

// CSwap
vpbroadcastd 56(%rsp),%ymm15
vpaddd	  swap_c,%ymm15,%ymm15
vpand     swap_mask,%ymm15,%ymm15
vpermd	  vec_c3,%ymm15,%ymm15

// MulC
vpmuludq  %ymm9,%ymm15,%ymm9
vpmuludq  %ymm0,%ymm15,%ymm0
vpmuludq  %ymm1,%ymm15,%ymm1
vpmuludq  %ymm2,%ymm15,%ymm2
vpmuludq  %ymm3,%ymm15,%ymm3
vpmuludq  %ymm4,%ymm15,%ymm4
vpmuludq  %ymm5,%ymm15,%ymm5
vpmuludq  %ymm6,%ymm15,%ymm6
vpmuludq  %ymm7,%ymm15,%ymm7
vpmuludq  %ymm8,%ymm15,%ymm8

vpsrlq    $27,%ymm4,%ymm10
vpaddq    %ymm10,%ymm5,%ymm5
vpand     vecmask27,%ymm4,%ymm4

vpsrlq    $27,%ymm9,%ymm10
vpaddq    %ymm10,%ymm0,%ymm0
vpand     vecmask27,%ymm9,%ymm9

vpsrlq    $27,%ymm5,%ymm10
vpaddq    %ymm10,%ymm6,%ymm6
vpand     vecmask27,%ymm5,%ymm5

vpsrlq    $27,%ymm0,%ymm10
vpaddq    %ymm10,%ymm1,%ymm1
vpand     vecmask27,%ymm0,%ymm0

vpsrlq    $27,%ymm6,%ymm10
vpaddq    %ymm10,%ymm7,%ymm7
vpand     vecmask27,%ymm6,%ymm6

vpsrlq    $27,%ymm1,%ymm10
vpaddq    %ymm10,%ymm2,%ymm2
vpand     vecmask27,%ymm1,%ymm1

vpsrlq    $27,%ymm7,%ymm10
vpaddq    %ymm10,%ymm8,%ymm8
vpand     vecmask27,%ymm7,%ymm7

vpsrlq    $27,%ymm2,%ymm10
vpaddq    %ymm10,%ymm3,%ymm3
vpand     vecmask27,%ymm2,%ymm2

vpsrlq    $23,%ymm8,%ymm10
vpaddq    %ymm10,%ymm9,%ymm9
vpaddq    %ymm10,%ymm10,%ymm10
vpaddq    %ymm10,%ymm9,%ymm9
vpand     vecmask23,%ymm8,%ymm8

vpsrlq    $27,%ymm3,%ymm10
vpaddq    %ymm10,%ymm4,%ymm4
vpand     vecmask27,%ymm3,%ymm3

subb      $1,%cl
cmpb	  $0,%cl
jge       .L2

movb	  $7,%cl
subq      $1,%r15
cmpq	  $0,%r15
jge       .L1

// Reduce
vpsrlq    $27,%ymm9,%ymm10
vpaddq    %ymm10,%ymm0,%ymm0
vpand     vecmask27,%ymm9,%ymm9

vpsrlq    $27,%ymm0,%ymm10
vpaddq    %ymm10,%ymm1,%ymm1
vpand     vecmask27,%ymm0,%ymm0

vpsrlq    $27,%ymm1,%ymm10
vpaddq    %ymm10,%ymm2,%ymm2
vpand     vecmask27,%ymm1,%ymm1

vpsrlq    $27,%ymm2,%ymm10
vpaddq    %ymm10,%ymm3,%ymm3
vpand     vecmask27,%ymm2,%ymm2

vpsrlq    $27,%ymm3,%ymm10
vpaddq    %ymm10,%ymm4,%ymm4
vpand     vecmask27,%ymm3,%ymm3

vpsrlq    $27,%ymm4,%ymm10
vpaddq    %ymm10,%ymm5,%ymm5
vpand     vecmask27,%ymm4,%ymm4

vpsrlq    $27,%ymm5,%ymm10
vpaddq    %ymm10,%ymm6,%ymm6
vpand     vecmask27,%ymm5,%ymm5

vpsrlq    $27,%ymm6,%ymm10
vpaddq    %ymm10,%ymm7,%ymm7
vpand     vecmask27,%ymm6,%ymm6

vpsrlq    $27,%ymm7,%ymm10
vpaddq    %ymm10,%ymm8,%ymm8
vpand     vecmask27,%ymm7,%ymm7

vpsrlq    $23,%ymm8,%ymm10
vpaddq    %ymm10,%ymm9,%ymm9
vpaddq    %ymm10,%ymm10,%ymm10
vpaddq    %ymm10,%ymm9,%ymm9
vpand     vecmask23,%ymm8,%ymm8

vpsrlq    $27,%ymm9,%ymm10
vpaddq    %ymm10,%ymm0,%ymm0
vpand     vecmask27,%ymm9,%ymm9

// Store output
vmovdqa   %ymm9,0(%rdi)
vmovdqa   %ymm0,32(%rdi)
vmovdqa   %ymm1,64(%rdi)
vmovdqa   %ymm2,96(%rdi)
vmovdqa   %ymm3,128(%rdi)
vmovdqa   %ymm4,160(%rdi)
vmovdqa   %ymm5,192(%rdi)
vmovdqa   %ymm6,224(%rdi)
vmovdqa   %ymm7,256(%rdi)
vmovdqa   %ymm8,288(%rdi)

movq 	  0(%rsp), %r11
movq 	  8(%rsp), %r12
movq 	  16(%rsp),%r13
movq 	  24(%rsp),%r14
movq 	  32(%rsp),%r15
movq 	  40(%rsp),%rbx
movq 	  48(%rsp),%rbp

movq 	  %r11,%rsp

ret
