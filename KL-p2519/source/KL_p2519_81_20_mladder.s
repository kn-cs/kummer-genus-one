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
.globl KL_p2519_81_20_mladder
KL_p2519_81_20_mladder:

movq 	  %rsp,%r11
andq 	  $-32,%rsp
subq 	  $640,%rsp

movq 	  %r11,0(%rsp)
movq 	  %r12,8(%rsp)
movq 	  %r13,16(%rsp)
movq 	  %r14,24(%rsp)
movq 	  %r15,32(%rsp)
movq 	  %rbx,40(%rsp)
movq 	  %rbp,48(%rsp)

// Pack-N2D
vmovdqa	  288(%rsi),%ymm0
vmovdqa	  320(%rsi),%ymm1
vmovdqa	  352(%rsi),%ymm2
vmovdqa	  384(%rsi),%ymm3
vmovdqa	  416(%rsi),%ymm4
vmovdqa	  448(%rsi),%ymm5
vmovdqa	  480(%rsi),%ymm6
vmovdqa	  512(%rsi),%ymm7
vmovdqa	  544(%rsi),%ymm8

vpsllq    $32,%ymm4,%ymm4
vpor      %ymm4,%ymm0,%ymm0
vpsllq    $32,%ymm5,%ymm5
vpor      %ymm5,%ymm1,%ymm1
vpsllq    $32,%ymm6,%ymm6
vpor      %ymm6,%ymm2,%ymm2
vpsllq    $32,%ymm7,%ymm7
vpor      %ymm7,%ymm3,%ymm3

vmovdqa	  %ymm0,288(%rsi)
vmovdqa	  %ymm1,320(%rsi)
vmovdqa	  %ymm2,352(%rsi)
vmovdqa	  %ymm3,384(%rsi)
vmovdqa	  %ymm8,416(%rsi)

// Pack-N2D
vmovdqa   0(%rsi),%ymm0
vmovdqa   32(%rsi),%ymm2
vmovdqa   64(%rsi),%ymm4
vmovdqa   96(%rsi),%ymm6
vmovdqa   128(%rsi),%ymm1
vmovdqa   160(%rsi),%ymm3
vmovdqa   192(%rsi),%ymm5
vmovdqa   224(%rsi),%ymm7
vmovdqa   256(%rsi),%ymm12

vpsllq    $32,%ymm1,%ymm1
vpor      %ymm1,%ymm0,%ymm0
vpsllq    $32,%ymm3,%ymm3
vpor      %ymm3,%ymm2,%ymm2
vpsllq    $32,%ymm5,%ymm5
vpor      %ymm5,%ymm4,%ymm4
vpsllq    $32,%ymm7,%ymm7
vpor      %ymm7,%ymm6,%ymm6

// Dense-HH
vpshufd	  $68,%ymm0,%ymm1
vpshufd	  $238,%ymm0,%ymm3
vpaddd    hh_p1d,%ymm1,%ymm1
vpxor     hh_xor1,%ymm3,%ymm3
vpaddd    %ymm1,%ymm3,%ymm0

vpshufd	  $68,%ymm2,%ymm1
vpshufd	  $238,%ymm2,%ymm3
vpaddd    hh_p2d,%ymm1,%ymm1
vpxor     hh_xor1,%ymm3,%ymm3
vpaddd    %ymm1,%ymm3,%ymm2

vpshufd	  $68,%ymm4,%ymm1
vpshufd	  $238,%ymm4,%ymm3
vpaddd    hh_p2d,%ymm1,%ymm1
vpxor     hh_xor1,%ymm3,%ymm3
vpaddd    %ymm1,%ymm3,%ymm4

vpshufd	  $68,%ymm6,%ymm1
vpshufd	  $238,%ymm6,%ymm3
vpaddd    hh_p2d,%ymm1,%ymm1
vpxor     hh_xor1,%ymm3,%ymm3
vpaddd    %ymm1,%ymm3,%ymm6

vpshufd	  $68,%ymm12,%ymm1
vpshufd	  $238,%ymm12,%ymm3
vpaddd    hh_p3d,%ymm1,%ymm1
vpxor     hh_xor2,%ymm3,%ymm3
vpaddd    %ymm1,%ymm3,%ymm12

vpsrld    $28,%ymm0,%ymm1
vpaddd    %ymm1,%ymm2,%ymm2
vpand     vecmask28d,%ymm0,%ymm0

vpsrld    $28,%ymm2,%ymm1
vpaddd    %ymm1,%ymm4,%ymm4
vpand     vecmask28d,%ymm2,%ymm2

vpsrld    $28,%ymm4,%ymm1
vpaddd    %ymm1,%ymm6,%ymm6
vpand     vecmask28d,%ymm4,%ymm4

vpsrld    $28,%ymm6,%ymm1
vpsllq    $32,%ymm1,%ymm1
vpaddd    %ymm1,%ymm0,%ymm0
vpsrlq    $60,%ymm6,%ymm1
vpaddd    %ymm1,%ymm12,%ymm12
vpand     vecmask28d,%ymm6,%ymm6

// Pack-D2N
vpsrlq    $32,%ymm0,%ymm8
vpsrlq    $32,%ymm2,%ymm9
vpsrlq    $32,%ymm4,%ymm10
vpsrlq    $32,%ymm6,%ymm11

// Sqr
vpaddq    %ymm0,%ymm0,%ymm13

vpaddq    %ymm2,%ymm2,%ymm7
vmovdqa   %ymm7,64(%rsp)

vpaddq    %ymm4,%ymm4,%ymm14
vmovdqa   %ymm14,96(%rsp)

vpaddq    %ymm6,%ymm6,%ymm14
vmovdqa   %ymm14,128(%rsp)

vpmuludq  %ymm2,%ymm12,%ymm14
vpmuludq  %ymm4,%ymm11,%ymm15
vpaddq    %ymm15,%ymm14,%ymm14
vpmuludq  %ymm6,%ymm10,%ymm15
vpaddq    %ymm15,%ymm14,%ymm14
vpmuludq  %ymm8,%ymm9,%ymm15
vpaddq    %ymm15,%ymm14,%ymm14
vpsllq    $2,%ymm14,%ymm15
vpsllq    $5,%ymm14,%ymm14
vpaddq    %ymm15,%ymm14,%ymm14
vpmuludq  %ymm0,%ymm0,%ymm0
vpaddq    %ymm14,%ymm0,%ymm0

vpmuludq  %ymm4,%ymm12,%ymm14
vpmuludq  %ymm6,%ymm11,%ymm15
vpaddq    %ymm15,%ymm14,%ymm14
vpmuludq  %ymm8,%ymm10,%ymm15
vpaddq    %ymm15,%ymm14,%ymm14
vpsllq    $2,%ymm14,%ymm15
vpsllq    $5,%ymm14,%ymm14
vpaddq    %ymm15,%ymm14,%ymm14
vpmuludq  %ymm13,%ymm2,%ymm15
vpaddq    %ymm15,%ymm14,%ymm1
vpmuludq  %ymm9,%ymm9,%ymm15
vpsllq    $4,%ymm15,%ymm14
vpaddq    %ymm15,%ymm15,%ymm15
vpaddq    %ymm14,%ymm15,%ymm15
vpaddq    %ymm15,%ymm1,%ymm1

vpmuludq  %ymm6,%ymm12,%ymm14
vpmuludq  %ymm8,%ymm11,%ymm15
vpaddq    %ymm15,%ymm14,%ymm14
vpmuludq  %ymm9,%ymm10,%ymm15
vpaddq    %ymm15,%ymm14,%ymm14
vpsllq    $2,%ymm14,%ymm15
vpsllq    $5,%ymm14,%ymm14
vpaddq    %ymm15,%ymm14,%ymm14
vpmuludq  %ymm2,%ymm2,%ymm2
vpaddq    %ymm14,%ymm2,%ymm2
vpmuludq  %ymm13,%ymm4,%ymm15
vpaddq    %ymm15,%ymm2,%ymm2

vpmuludq  %ymm8,%ymm12,%ymm14
vpmuludq  %ymm9,%ymm11,%ymm15
vpaddq    %ymm15,%ymm14,%ymm14
vpsllq    $2,%ymm14,%ymm15
vpsllq    $5,%ymm14,%ymm14
vpaddq    %ymm15,%ymm14,%ymm14
vpmuludq  %ymm13,%ymm6,%ymm15
vpaddq    %ymm15,%ymm14,%ymm3
vpmuludq  %ymm7,%ymm4,%ymm15
vpaddq    %ymm15,%ymm3,%ymm3
vpmuludq  %ymm10,%ymm10,%ymm15
vpsllq    $4,%ymm15,%ymm14
vpaddq    %ymm15,%ymm15,%ymm15
vpaddq    %ymm14,%ymm15,%ymm15
vpaddq    %ymm15,%ymm3,%ymm3

vpmuludq  %ymm9,%ymm12,%ymm14
vpmuludq  %ymm10,%ymm11,%ymm15
vpaddq    %ymm15,%ymm14,%ymm14
vpsllq    $2,%ymm14,%ymm15
vpsllq    $5,%ymm14,%ymm14
vpaddq    %ymm15,%ymm14,%ymm14
vpmuludq  %ymm4,%ymm4,%ymm4
vpaddq    %ymm14,%ymm4,%ymm4
vpmuludq  %ymm13,%ymm8,%ymm15
vpaddq    %ymm15,%ymm4,%ymm4
vpmuludq  %ymm7,%ymm6,%ymm15
vpaddq    %ymm15,%ymm4,%ymm4

vpmuludq  %ymm10,%ymm12,%ymm14
vpsllq    $2,%ymm14,%ymm15
vpsllq    $5,%ymm14,%ymm14
vpaddq    %ymm15,%ymm14,%ymm14
vpmuludq  %ymm13,%ymm9,%ymm15
vpaddq    %ymm15,%ymm14,%ymm5
vpmuludq  %ymm7,%ymm8,%ymm15
vpaddq    %ymm15,%ymm5,%ymm5
vpmuludq  96(%rsp),%ymm6,%ymm15
vpaddq    %ymm15,%ymm5,%ymm5
vpmuludq  %ymm11,%ymm11,%ymm15
vpsllq    $4,%ymm15,%ymm14
vpaddq    %ymm15,%ymm15,%ymm15
vpaddq    %ymm14,%ymm15,%ymm15
vpaddq    %ymm15,%ymm5,%ymm5

vpmuludq  %ymm11,%ymm12,%ymm14
vpsllq    $2,%ymm14,%ymm15
vpsllq    $5,%ymm14,%ymm14
vpaddq    %ymm15,%ymm14,%ymm14
vpmuludq  %ymm6,%ymm6,%ymm6
vpaddq    %ymm14,%ymm6,%ymm6
vpmuludq  %ymm13,%ymm10,%ymm15
vpaddq    %ymm15,%ymm6,%ymm6
vpmuludq  %ymm7,%ymm9,%ymm15
vpaddq    %ymm15,%ymm6,%ymm6
vpmuludq  96(%rsp),%ymm8,%ymm15
vpaddq    %ymm15,%ymm6,%ymm6

vpmuludq  %ymm13,%ymm11,%ymm14
vpmuludq  %ymm7,%ymm10,%ymm15
vpaddq    %ymm15,%ymm14,%ymm7
vpmuludq  96(%rsp),%ymm9,%ymm15
vpaddq    %ymm15,%ymm7,%ymm7
vpmuludq  128(%rsp),%ymm8,%ymm15
vpaddq    %ymm15,%ymm7,%ymm7
vpmuludq  %ymm12,%ymm12,%ymm15
vpsllq    $4,%ymm15,%ymm14
vpaddq    %ymm15,%ymm15,%ymm15
vpaddq    %ymm14,%ymm15,%ymm15
vpaddq    %ymm15,%ymm7,%ymm7

vpmuludq  %ymm13,%ymm12,%ymm14
vpmuludq  64(%rsp),%ymm11,%ymm15
vpaddq    %ymm15,%ymm14,%ymm14	
vpmuludq  96(%rsp),%ymm10,%ymm15
vpaddq    %ymm15,%ymm14,%ymm14
vpmuludq  128(%rsp),%ymm9,%ymm15
vpaddq    %ymm15,%ymm14,%ymm14
vpmuludq  %ymm8,%ymm8,%ymm8
vpaddq    %ymm14,%ymm8,%ymm8

vpsrlq    $28,%ymm4,%ymm10
vpaddq    %ymm10,%ymm5,%ymm5
vpand     vecmask28,%ymm4,%ymm4

vpsrlq    $28,%ymm0,%ymm10
vpaddq    %ymm10,%ymm1,%ymm1
vpand  	  vecmask28,%ymm0,%ymm0

vpsrlq    $28,%ymm5,%ymm10
vpaddq    %ymm10,%ymm6,%ymm6
vpand     vecmask28,%ymm5,%ymm5

vpsrlq    $28,%ymm1,%ymm10
vpaddq    %ymm10,%ymm2,%ymm2
vpand     vecmask28,%ymm1,%ymm1

vpsrlq    $28,%ymm6,%ymm10
vpaddq    %ymm10,%ymm7,%ymm7
vpand     vecmask28,%ymm6,%ymm6

vpsrlq    $28,%ymm2,%ymm10
vpaddq    %ymm10,%ymm3,%ymm3
vpand     vecmask28,%ymm2,%ymm2

vpsrlq    $28,%ymm7,%ymm10
vpaddq    %ymm10,%ymm8,%ymm8
vpand     vecmask28,%ymm7,%ymm7

vpsrlq    $28,%ymm3,%ymm10
vpaddq    %ymm10,%ymm4,%ymm4
vpand     vecmask28,%ymm3,%ymm3

vpsrlq    $27,%ymm8,%ymm10
vpsllq    $3,%ymm10,%ymm11
vpaddq    %ymm11,%ymm10,%ymm10
vpaddq    %ymm10,%ymm0,%ymm0
vpand     vecmask27,%ymm8,%ymm8

vpsrlq    $28,%ymm4,%ymm10
vpaddq    %ymm10,%ymm5,%ymm5
vpand     vecmask28,%ymm4,%ymm4

vpsrlq    $28,%ymm0,%ymm10
vpaddq    %ymm10,%ymm1,%ymm1
vpand     vecmask28,%ymm0,%ymm0

// Unreduced-MulC
vpmuludq  vec_c1,%ymm8,%ymm12
vpmuludq  vec_c1,%ymm7,%ymm11
vpmuludq  vec_c1,%ymm6,%ymm10
vpmuludq  vec_c1,%ymm5,%ymm9
vpmuludq  vec_c1,%ymm4,%ymm8
vpmuludq  vec_c1,%ymm3,%ymm6
vpmuludq  vec_c1,%ymm2,%ymm4
vpmuludq  vec_c1,%ymm1,%ymm2
vpmuludq  vec_c1,%ymm0,%ymm0

// HH
vpshufd	  $68,%ymm0,%ymm1
vpshufd	  $238,%ymm0,%ymm3
vpaddq    hh_p1q,%ymm1,%ymm1
vpxor     hh_xor1,%ymm3,%ymm3
vpaddq    %ymm1,%ymm3,%ymm0

vpshufd	  $68,%ymm2,%ymm1
vpshufd	  $238,%ymm2,%ymm3
vpaddq    hh_p2q,%ymm1,%ymm1
vpxor     hh_xor1,%ymm3,%ymm3
vpaddq    %ymm1,%ymm3,%ymm2

vpshufd	  $68,%ymm4,%ymm1
vpshufd	  $238,%ymm4,%ymm3
vpaddq    hh_p2q,%ymm1,%ymm1
vpxor     hh_xor1,%ymm3,%ymm3
vpaddq    %ymm1,%ymm3,%ymm4

vpshufd	  $68,%ymm6,%ymm1
vpshufd	  $238,%ymm6,%ymm3
vpaddq    hh_p2q,%ymm1,%ymm1
vpxor     hh_xor1,%ymm3,%ymm3
vpaddq    %ymm1,%ymm3,%ymm6

vpshufd	  $68,%ymm8,%ymm1
vpshufd	  $238,%ymm8,%ymm3
vpaddq    hh_p2q,%ymm1,%ymm1
vpxor     hh_xor1,%ymm3,%ymm3
vpaddq    %ymm1,%ymm3,%ymm8

vpshufd	  $68,%ymm9,%ymm1
vpshufd	  $238,%ymm9,%ymm3
vpaddq    hh_p2q,%ymm1,%ymm1
vpxor     hh_xor1,%ymm3,%ymm3
vpaddq    %ymm1,%ymm3,%ymm9

vpshufd	  $68,%ymm10,%ymm1
vpshufd	  $238,%ymm10,%ymm3
vpaddq    hh_p2q,%ymm1,%ymm1
vpxor     hh_xor1,%ymm3,%ymm3
vpaddq    %ymm1,%ymm3,%ymm10

vpshufd	  $68,%ymm11,%ymm1
vpshufd	  $238,%ymm11,%ymm3
vpaddq    hh_p2q,%ymm1,%ymm1
vpxor     hh_xor1,%ymm3,%ymm3
vpaddq    %ymm1,%ymm3,%ymm11

vpshufd	  $68,%ymm12,%ymm1
vpshufd	  $238,%ymm12,%ymm3
vpaddq    hh_p3q,%ymm1,%ymm1
vpxor     hh_xor1,%ymm3,%ymm3
vpaddq    %ymm1,%ymm3,%ymm12

vpsrlq    $28,%ymm8,%ymm15
vpaddq    %ymm15,%ymm9,%ymm9
vpand     vecmask28,%ymm8,%ymm8

vpsrlq    $28,%ymm0,%ymm15
vpaddq    %ymm15,%ymm2,%ymm2
vpand     vecmask28,%ymm0,%ymm0

vpsrlq    $28,%ymm9,%ymm15
vpaddq    %ymm15,%ymm10,%ymm10
vpand     vecmask28,%ymm9,%ymm9

vpsrlq    $28,%ymm2,%ymm15
vpaddq    %ymm15,%ymm4,%ymm4
vpand     vecmask28,%ymm2,%ymm2

vpsrlq    $28,%ymm10,%ymm15
vpaddq    %ymm15,%ymm11,%ymm11
vpand     vecmask28,%ymm10,%ymm10

vpsrlq    $28,%ymm4,%ymm15
vpaddq    %ymm15,%ymm6,%ymm6
vpand     vecmask28,%ymm4,%ymm4

vpsrlq    $28,%ymm11,%ymm15
vpaddq    %ymm15,%ymm12,%ymm12
vpand     vecmask28,%ymm11,%ymm11

vpsrlq    $28,%ymm6,%ymm15
vpaddq    %ymm15,%ymm8,%ymm8
vpand     vecmask28,%ymm6,%ymm6

vpsrlq    $27,%ymm12,%ymm15
vpmuludq  vec9,%ymm15,%ymm15
vpaddq    %ymm15,%ymm0,%ymm0
vpand     vecmask27,%ymm12,%ymm12

// Sqr
vpaddq    %ymm0,%ymm0,%ymm13

vpaddq    %ymm2,%ymm2,%ymm7
vmovdqa   %ymm7,64(%rsp)

vpaddq    %ymm4,%ymm4,%ymm14
vmovdqa   %ymm14,96(%rsp)

vpaddq    %ymm6,%ymm6,%ymm14
vmovdqa   %ymm14,128(%rsp)

vpmuludq  %ymm2,%ymm12,%ymm14
vpmuludq  %ymm4,%ymm11,%ymm15
vpaddq    %ymm15,%ymm14,%ymm14
vpmuludq  %ymm6,%ymm10,%ymm15
vpaddq    %ymm15,%ymm14,%ymm14
vpmuludq  %ymm8,%ymm9,%ymm15
vpaddq    %ymm15,%ymm14,%ymm14
vpsllq    $2,%ymm14,%ymm15
vpsllq    $5,%ymm14,%ymm14
vpaddq    %ymm15,%ymm14,%ymm14
vpmuludq  %ymm0,%ymm0,%ymm0
vpaddq    %ymm14,%ymm0,%ymm0

vpmuludq  %ymm4,%ymm12,%ymm14
vpmuludq  %ymm6,%ymm11,%ymm15
vpaddq    %ymm15,%ymm14,%ymm14
vpmuludq  %ymm8,%ymm10,%ymm15
vpaddq    %ymm15,%ymm14,%ymm14
vpsllq    $2,%ymm14,%ymm15
vpsllq    $5,%ymm14,%ymm14
vpaddq    %ymm15,%ymm14,%ymm14
vpmuludq  %ymm13,%ymm2,%ymm15
vpaddq    %ymm15,%ymm14,%ymm1
vpmuludq  %ymm9,%ymm9,%ymm15
vpsllq    $4,%ymm15,%ymm14
vpaddq    %ymm15,%ymm15,%ymm15
vpaddq    %ymm14,%ymm15,%ymm15
vpaddq    %ymm15,%ymm1,%ymm1

vpmuludq  %ymm6,%ymm12,%ymm14
vpmuludq  %ymm8,%ymm11,%ymm15
vpaddq    %ymm15,%ymm14,%ymm14
vpmuludq  %ymm9,%ymm10,%ymm15
vpaddq    %ymm15,%ymm14,%ymm14
vpsllq    $2,%ymm14,%ymm15
vpsllq    $5,%ymm14,%ymm14
vpaddq    %ymm15,%ymm14,%ymm14
vpmuludq  %ymm2,%ymm2,%ymm2
vpaddq    %ymm14,%ymm2,%ymm2
vpmuludq  %ymm13,%ymm4,%ymm15
vpaddq    %ymm15,%ymm2,%ymm2

vpmuludq  %ymm8,%ymm12,%ymm14
vpmuludq  %ymm9,%ymm11,%ymm15
vpaddq    %ymm15,%ymm14,%ymm14
vpsllq    $2,%ymm14,%ymm15
vpsllq    $5,%ymm14,%ymm14
vpaddq    %ymm15,%ymm14,%ymm14
vpmuludq  %ymm13,%ymm6,%ymm15
vpaddq    %ymm15,%ymm14,%ymm3
vpmuludq  %ymm7,%ymm4,%ymm15
vpaddq    %ymm15,%ymm3,%ymm3
vpmuludq  %ymm10,%ymm10,%ymm15
vpsllq    $4,%ymm15,%ymm14
vpaddq    %ymm15,%ymm15,%ymm15
vpaddq    %ymm14,%ymm15,%ymm15
vpaddq    %ymm15,%ymm3,%ymm3

vpmuludq  %ymm9,%ymm12,%ymm14
vpmuludq  %ymm10,%ymm11,%ymm15
vpaddq    %ymm15,%ymm14,%ymm14
vpsllq    $2,%ymm14,%ymm15
vpsllq    $5,%ymm14,%ymm14
vpaddq    %ymm15,%ymm14,%ymm14
vpmuludq  %ymm4,%ymm4,%ymm4
vpaddq    %ymm14,%ymm4,%ymm4
vpmuludq  %ymm13,%ymm8,%ymm15
vpaddq    %ymm15,%ymm4,%ymm4
vpmuludq  %ymm7,%ymm6,%ymm15
vpaddq    %ymm15,%ymm4,%ymm4

vpmuludq  %ymm10,%ymm12,%ymm14
vpsllq    $2,%ymm14,%ymm15
vpsllq    $5,%ymm14,%ymm14
vpaddq    %ymm15,%ymm14,%ymm14
vpmuludq  %ymm13,%ymm9,%ymm15
vpaddq    %ymm15,%ymm14,%ymm5
vpmuludq  %ymm7,%ymm8,%ymm15
vpaddq    %ymm15,%ymm5,%ymm5
vpmuludq  96(%rsp),%ymm6,%ymm15
vpaddq    %ymm15,%ymm5,%ymm5
vpmuludq  %ymm11,%ymm11,%ymm15
vpsllq    $4,%ymm15,%ymm14
vpaddq    %ymm15,%ymm15,%ymm15
vpaddq    %ymm14,%ymm15,%ymm15
vpaddq    %ymm15,%ymm5,%ymm5

vpmuludq  %ymm11,%ymm12,%ymm14
vpsllq    $2,%ymm14,%ymm15
vpsllq    $5,%ymm14,%ymm14
vpaddq    %ymm15,%ymm14,%ymm14
vpmuludq  %ymm6,%ymm6,%ymm6
vpaddq    %ymm14,%ymm6,%ymm6
vpmuludq  %ymm13,%ymm10,%ymm15
vpaddq    %ymm15,%ymm6,%ymm6
vpmuludq  %ymm7,%ymm9,%ymm15
vpaddq    %ymm15,%ymm6,%ymm6
vpmuludq  96(%rsp),%ymm8,%ymm15
vpaddq    %ymm15,%ymm6,%ymm6

vpmuludq  %ymm13,%ymm11,%ymm14
vpmuludq  %ymm7,%ymm10,%ymm15
vpaddq    %ymm15,%ymm14,%ymm7
vpmuludq  96(%rsp),%ymm9,%ymm15
vpaddq    %ymm15,%ymm7,%ymm7
vpmuludq  128(%rsp),%ymm8,%ymm15
vpaddq    %ymm15,%ymm7,%ymm7
vpmuludq  %ymm12,%ymm12,%ymm15
vpsllq    $4,%ymm15,%ymm14
vpaddq    %ymm15,%ymm15,%ymm15
vpaddq    %ymm14,%ymm15,%ymm15
vpaddq    %ymm15,%ymm7,%ymm7

vpmuludq  %ymm13,%ymm12,%ymm14
vpmuludq  64(%rsp),%ymm11,%ymm15
vpaddq    %ymm15,%ymm14,%ymm14	
vpmuludq  96(%rsp),%ymm10,%ymm15
vpaddq    %ymm15,%ymm14,%ymm14
vpmuludq  128(%rsp),%ymm9,%ymm15
vpaddq    %ymm15,%ymm14,%ymm14
vpmuludq  %ymm8,%ymm8,%ymm8
vpaddq    %ymm14,%ymm8,%ymm8

vpsrlq    $28,%ymm4,%ymm10
vpaddq    %ymm10,%ymm5,%ymm5
vpand     vecmask28,%ymm4,%ymm12

vpsrlq    $28,%ymm0,%ymm10
vpaddq    %ymm10,%ymm1,%ymm1
vpand  	  vecmask28,%ymm0,%ymm13

vpsrlq    $28,%ymm5,%ymm10
vpaddq    %ymm10,%ymm6,%ymm6
vpand     vecmask28,%ymm5,%ymm4

vpsrlq    $28,%ymm1,%ymm10
vpaddq    %ymm10,%ymm2,%ymm2
vpand     vecmask28,%ymm1,%ymm0

vpsrlq    $28,%ymm6,%ymm10
vpaddq    %ymm10,%ymm7,%ymm7
vpand     vecmask28,%ymm6,%ymm5

vpsrlq    $28,%ymm2,%ymm10
vpaddq    %ymm10,%ymm3,%ymm3
vpand     vecmask28,%ymm2,%ymm1

vpsrlq    $28,%ymm7,%ymm10
vpaddq    %ymm10,%ymm8,%ymm8
vpand     vecmask28,%ymm7,%ymm6

vpsrlq    $28,%ymm3,%ymm10
vpaddq    %ymm10,%ymm12,%ymm12
vpand     vecmask28,%ymm3,%ymm2

vpsrlq    $27,%ymm8,%ymm10
vpsllq    $3,%ymm10,%ymm11
vpaddq    %ymm11,%ymm10,%ymm10
vpaddq    %ymm10,%ymm13,%ymm13
vpand     vecmask27,%ymm8,%ymm7

vpsrlq    $28,%ymm12,%ymm10
vpaddq    %ymm10,%ymm4,%ymm4
vpand     vecmask28,%ymm12,%ymm3

vpsrlq    $28,%ymm13,%ymm10
vpaddq    %ymm10,%ymm0,%ymm0
vpand     vecmask28,%ymm13,%ymm8

// MulC
vpmuludq  vec_c2,%ymm8,%ymm8
vpmuludq  vec_c2,%ymm0,%ymm0
vpmuludq  vec_c2,%ymm1,%ymm1
vpmuludq  vec_c2,%ymm2,%ymm2
vpmuludq  vec_c2,%ymm3,%ymm3
vpmuludq  vec_c2,%ymm4,%ymm4
vpmuludq  vec_c2,%ymm5,%ymm5
vpmuludq  vec_c2,%ymm6,%ymm6
vpmuludq  vec_c2,%ymm7,%ymm7

vpsrlq    $28,%ymm8,%ymm15
vpaddq    %ymm15,%ymm0,%ymm0
vpand     vecmask28,%ymm8,%ymm8

vpsrlq    $28,%ymm3,%ymm15
vpaddq    %ymm15,%ymm4,%ymm4
vpand     vecmask28,%ymm3,%ymm3

vpsrlq    $28,%ymm0,%ymm15
vpaddq    %ymm15,%ymm1,%ymm1
vpand     vecmask28,%ymm0,%ymm0

vpsrlq    $28,%ymm4,%ymm15
vpaddq    %ymm15,%ymm5,%ymm5
vpand     vecmask28,%ymm4,%ymm4

vpsrlq    $28,%ymm1,%ymm15
vpaddq    %ymm15,%ymm2,%ymm2
vpand     vecmask28,%ymm1,%ymm1

vpsrlq    $28,%ymm5,%ymm15
vpaddq    %ymm15,%ymm6,%ymm6
vpand     vecmask28,%ymm5,%ymm5

vpsrlq    $28,%ymm2,%ymm15
vpaddq    %ymm15,%ymm3,%ymm3
vpand     vecmask28,%ymm2,%ymm2

vpsrlq    $28,%ymm6,%ymm15
vpaddq    %ymm15,%ymm7,%ymm7
vpand     vecmask28,%ymm6,%ymm6

vpsrlq    $27,%ymm7,%ymm15
vpmuludq  vec9,%ymm15,%ymm15
vpaddq    %ymm15,%ymm8,%ymm8
vpand     vecmask27,%ymm7,%ymm7

// Initialize-P
movdqa    16(%rsi),%xmm8
movdqa    48(%rsi),%xmm0
movdqa    80(%rsi),%xmm1
movdqa    112(%rsi),%xmm2
movdqa    144(%rsi),%xmm3
movdqa    176(%rsi),%xmm4
movdqa    208(%rsi),%xmm5
movdqa    240(%rsi),%xmm6
movdqa    272(%rsi),%xmm7

movq      $31,%r15
movq	  $1,%rcx

movq      %rdx,%rax

// Kummer-Ladder
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
vpsllq    $32,%ymm3,%ymm3
vpor      %ymm3,%ymm8,%ymm8
vpsllq    $32,%ymm4,%ymm4
vpor      %ymm4,%ymm0,%ymm0
vpsllq    $32,%ymm5,%ymm5
vpor      %ymm5,%ymm1,%ymm1
vpsllq    $32,%ymm6,%ymm6
vpor      %ymm6,%ymm2,%ymm2

// Dense-HH
vpshufd	  $68,%ymm8,%ymm4
vpshufd	  $238,%ymm8,%ymm3
vpaddd    hh_p1d,%ymm4,%ymm4
vpxor     hh_xor1,%ymm3,%ymm3
vpaddd    %ymm4,%ymm3,%ymm8

vpshufd	  $68,%ymm0,%ymm4
vpshufd	  $238,%ymm0,%ymm3
vpaddd    hh_p2d,%ymm4,%ymm4
vpxor     hh_xor1,%ymm3,%ymm3
vpaddd    %ymm4,%ymm3,%ymm0

vpshufd	  $68,%ymm1,%ymm4
vpshufd	  $238,%ymm1,%ymm3
vpaddd    hh_p2d,%ymm4,%ymm4
vpxor     hh_xor1,%ymm3,%ymm3
vpaddd    %ymm4,%ymm3,%ymm1

vpshufd	  $68,%ymm2,%ymm4
vpshufd	  $238,%ymm2,%ymm3
vpaddd    hh_p2d,%ymm4,%ymm4
vpxor     hh_xor1,%ymm3,%ymm3
vpaddd    %ymm4,%ymm3,%ymm2

vpshufd	  $68,%ymm7,%ymm4
vpshufd	  $238,%ymm7,%ymm3
vpaddd    hh_p3d,%ymm4,%ymm4
vpxor     hh_xor2,%ymm3,%ymm3
vpaddd    %ymm4,%ymm3,%ymm7

vpsrld    $28,%ymm8,%ymm15
vpaddd    %ymm15,%ymm0,%ymm0
vpand     vecmask28d,%ymm8,%ymm8

vpsrld    $28,%ymm0,%ymm15
vpaddd    %ymm15,%ymm1,%ymm1
vpand     vecmask28d,%ymm0,%ymm0

vpsrld    $28,%ymm1,%ymm15
vpaddd    %ymm15,%ymm2,%ymm2
vpand     vecmask28d,%ymm1,%ymm1

vpsrld    $28,%ymm2,%ymm15
vpsllq    $32,%ymm15,%ymm15
vpaddd    %ymm15,%ymm8,%ymm8
vpsrlq    $60,%ymm2,%ymm15
vpaddd    %ymm15,%ymm7,%ymm7
vpand     vecmask28d,%ymm2,%ymm2

// Pack-D2N
vpsrlq    $32,%ymm8,%ymm3
vpsrlq    $32,%ymm0,%ymm4
vpsrlq    $32,%ymm1,%ymm5
vpsrlq    $32,%ymm2,%ymm6

vmovdqa   %ymm8,64(%rsp)
vmovdqa   %ymm0,96(%rsp)
vmovdqa   %ymm1,128(%rsp)
vmovdqa   %ymm2,160(%rsp)
vmovdqa   %ymm3,192(%rsp)
vmovdqa   %ymm4,224(%rsp)
vmovdqa   %ymm5,256(%rsp)
vmovdqa   %ymm6,288(%rsp)
vmovdqa   %ymm7,320(%rsp)

// Dense-CDup
vpbroadcastd 56(%rsp),%ymm10
vpaddd	  dup_c,%ymm10,%ymm10

vpermd	  %ymm7,%ymm10,%ymm15
vpermd	  %ymm8,%ymm10,%ymm7
vpermd	  %ymm0,%ymm10,%ymm8
vpermd	  %ymm1,%ymm10,%ymm9
vpermd	  %ymm2,%ymm10,%ymm10

// Pack-D2N
vpsrlq    $32,%ymm7,%ymm11
vpsrlq    $32,%ymm8,%ymm12
vpsrlq    $32,%ymm9,%ymm13
vpsrlq    $32,%ymm10,%ymm14

vmovdqa   %ymm7,352(%rsp)
vmovdqa   %ymm8,384(%rsp)
vmovdqa   %ymm9,416(%rsp)
vmovdqa   %ymm10,448(%rsp)
vmovdqa   %ymm11,480(%rsp)
vmovdqa   %ymm12,512(%rsp)
vmovdqa   %ymm13,544(%rsp)
vmovdqa   %ymm14,576(%rsp)
vmovdqa   %ymm15,608(%rsp)

// Mul
vpaddq    %ymm0,%ymm0,%ymm0
vpaddq    %ymm1,%ymm1,%ymm1
vpaddq    %ymm2,%ymm2,%ymm2
vpaddq    %ymm3,%ymm3,%ymm3
vpaddq    %ymm4,%ymm4,%ymm4
vpaddq    %ymm5,%ymm5,%ymm5
vpaddq    %ymm6,%ymm6,%ymm6

vpmuludq  vec9,%ymm8,%ymm8
vpmuludq  vec9,%ymm9,%ymm9
vpmuludq  vec9,%ymm10,%ymm10
vpmuludq  vec9,%ymm11,%ymm11
vpmuludq  vec9,%ymm12,%ymm12
vpmuludq  vec9,%ymm13,%ymm13
vpmuludq  vec9,%ymm14,%ymm14
vpmuludq  vec9,%ymm15,%ymm15

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

vmovdqa   320(%rsp),%ymm7
vpaddq    %ymm7,%ymm7,%ymm7

vpmuludq  %ymm7,%ymm8,%ymm8
vpaddq    %ymm8,%ymm0,%ymm0

vpmuludq  %ymm7,%ymm9,%ymm8
vpaddq    %ymm8,%ymm1,%ymm1

vpmuludq  %ymm7,%ymm10,%ymm8
vpaddq    %ymm8,%ymm2,%ymm2

vpmuludq  %ymm7,%ymm11,%ymm8
vpaddq    %ymm8,%ymm3,%ymm3

vpmuludq  %ymm7,%ymm12,%ymm8
vpaddq    %ymm8,%ymm4,%ymm4

vpmuludq  %ymm7,%ymm13,%ymm8
vpaddq    %ymm8,%ymm5,%ymm5

vpmuludq  %ymm7,%ymm14,%ymm8
vpaddq    %ymm8,%ymm6,%ymm6

vpmuludq  %ymm7,%ymm15,%ymm7

vmovdqa   64(%rsp),%ymm9
vmovdqa   96(%rsp),%ymm10
vmovdqa   128(%rsp),%ymm11
vmovdqa   160(%rsp),%ymm12
vmovdqa   192(%rsp),%ymm13
vmovdqa   224(%rsp),%ymm14
vmovdqa   256(%rsp),%ymm15

vpmuludq  352(%rsp),%ymm9,%ymm8
vpaddq    %ymm8,%ymm0,%ymm0

vpmuludq  384(%rsp),%ymm9,%ymm8
vpaddq    %ymm8,%ymm1,%ymm1
vpmuludq  352(%rsp),%ymm10,%ymm8
vpaddq    %ymm8,%ymm1,%ymm1

vpmuludq  416(%rsp),%ymm9,%ymm8
vpaddq    %ymm8,%ymm2,%ymm2
vpmuludq  384(%rsp),%ymm10,%ymm8
vpaddq    %ymm8,%ymm2,%ymm2
vpmuludq  352(%rsp),%ymm11,%ymm8
vpaddq    %ymm8,%ymm2,%ymm2

vpmuludq  448(%rsp),%ymm9,%ymm8
vpaddq    %ymm8,%ymm3,%ymm3
vpmuludq  416(%rsp),%ymm10,%ymm8
vpaddq    %ymm8,%ymm3,%ymm3
vpmuludq  384(%rsp),%ymm11,%ymm8
vpaddq    %ymm8,%ymm3,%ymm3
vpmuludq  352(%rsp),%ymm12,%ymm8
vpaddq    %ymm8,%ymm3,%ymm3

vpmuludq  480(%rsp),%ymm9,%ymm8
vpaddq    %ymm8,%ymm4,%ymm4
vpmuludq  448(%rsp),%ymm10,%ymm8
vpaddq    %ymm8,%ymm4,%ymm4
vpmuludq  416(%rsp),%ymm11,%ymm8
vpaddq    %ymm8,%ymm4,%ymm4
vpmuludq  384(%rsp),%ymm12,%ymm8
vpaddq    %ymm8,%ymm4,%ymm4
vpmuludq  352(%rsp),%ymm13,%ymm8
vpaddq    %ymm8,%ymm4,%ymm4

vpmuludq  512(%rsp),%ymm9,%ymm8
vpaddq    %ymm8,%ymm5,%ymm5
vpmuludq  480(%rsp),%ymm10,%ymm8
vpaddq    %ymm8,%ymm5,%ymm5
vpmuludq  448(%rsp),%ymm11,%ymm8
vpaddq    %ymm8,%ymm5,%ymm5
vpmuludq  416(%rsp),%ymm12,%ymm8
vpaddq    %ymm8,%ymm5,%ymm5
vpmuludq  384(%rsp),%ymm13,%ymm8
vpaddq    %ymm8,%ymm5,%ymm5
vpmuludq  352(%rsp),%ymm14,%ymm8
vpaddq    %ymm8,%ymm5,%ymm5

vpmuludq  544(%rsp),%ymm9,%ymm8
vpaddq    %ymm8,%ymm6,%ymm6
vpmuludq  512(%rsp),%ymm10,%ymm8
vpaddq    %ymm8,%ymm6,%ymm6
vpmuludq  480(%rsp),%ymm11,%ymm8
vpaddq    %ymm8,%ymm6,%ymm6
vpmuludq  448(%rsp),%ymm12,%ymm8
vpaddq    %ymm8,%ymm6,%ymm6
vpmuludq  416(%rsp),%ymm13,%ymm8
vpaddq    %ymm8,%ymm6,%ymm6
vpmuludq  384(%rsp),%ymm14,%ymm8
vpaddq    %ymm8,%ymm6,%ymm6
vpmuludq  352(%rsp),%ymm15,%ymm8
vpaddq    %ymm8,%ymm6,%ymm6

vpmuludq  576(%rsp),%ymm9,%ymm8
vpaddq    %ymm8,%ymm7,%ymm7
vpmuludq  544(%rsp),%ymm10,%ymm8
vpaddq    %ymm8,%ymm7,%ymm7
vpmuludq  512(%rsp),%ymm11,%ymm8
vpaddq    %ymm8,%ymm7,%ymm7
vpmuludq  480(%rsp),%ymm12,%ymm8
vpaddq    %ymm8,%ymm7,%ymm7
vpmuludq  448(%rsp),%ymm13,%ymm8
vpaddq    %ymm8,%ymm7,%ymm7
vpmuludq  416(%rsp),%ymm14,%ymm8
vpaddq    %ymm8,%ymm7,%ymm7
vpmuludq  384(%rsp),%ymm15,%ymm8
vpaddq    %ymm8,%ymm7,%ymm7

vpmuludq  608(%rsp),%ymm9,%ymm8
vpmuludq  576(%rsp),%ymm10,%ymm15
vpaddq    %ymm15,%ymm8,%ymm8
vpmuludq  544(%rsp),%ymm11,%ymm15
vpaddq    %ymm15,%ymm8,%ymm8
vpmuludq  512(%rsp),%ymm12,%ymm15
vpaddq    %ymm15,%ymm8,%ymm8
vpmuludq  480(%rsp),%ymm13,%ymm15
vpaddq    %ymm15,%ymm8,%ymm8
vpmuludq  448(%rsp),%ymm14,%ymm15
vpaddq    %ymm15,%ymm8,%ymm8

vmovdqa   256(%rsp),%ymm9
vmovdqa   288(%rsp),%ymm10
vmovdqa   320(%rsp),%ymm11

vpmuludq  352(%rsp),%ymm10,%ymm15
vpaddq    %ymm15,%ymm7,%ymm7

vpmuludq  416(%rsp),%ymm9,%ymm15
vpaddq    %ymm15,%ymm8,%ymm8
vpmuludq  384(%rsp),%ymm10,%ymm15
vpaddq    %ymm15,%ymm8,%ymm8
vpmuludq  352(%rsp),%ymm11,%ymm15
vpaddq    %ymm15,%ymm8,%ymm8

vpsrlq    $28,%ymm4,%ymm10
vpaddq    %ymm10,%ymm5,%ymm5
vpand     vecmask28,%ymm4,%ymm4

vpsrlq    $28,%ymm0,%ymm10
vpaddq    %ymm10,%ymm1,%ymm1
vpand  	  vecmask28,%ymm0,%ymm0

vpsrlq    $28,%ymm5,%ymm10
vpaddq    %ymm10,%ymm6,%ymm6
vpand     vecmask28,%ymm5,%ymm5

vpsrlq    $28,%ymm1,%ymm10
vpaddq    %ymm10,%ymm2,%ymm2
vpand     vecmask28,%ymm1,%ymm1

vpsrlq    $28,%ymm6,%ymm10
vpaddq    %ymm10,%ymm7,%ymm7
vpand     vecmask28,%ymm6,%ymm6

vpsrlq    $28,%ymm2,%ymm10
vpaddq    %ymm10,%ymm3,%ymm3
vpand     vecmask28,%ymm2,%ymm2

vpsrlq    $28,%ymm7,%ymm10
vpaddq    %ymm10,%ymm8,%ymm8
vpand     vecmask28,%ymm7,%ymm7

vpsrlq    $28,%ymm3,%ymm10
vpaddq    %ymm10,%ymm4,%ymm4
vpand     vecmask28,%ymm3,%ymm3

vpsrlq    $27,%ymm8,%ymm10
vpsllq    $3,%ymm10,%ymm11
vpaddq    %ymm11,%ymm10,%ymm10
vpaddq    %ymm10,%ymm0,%ymm0
vpand     vecmask27,%ymm8,%ymm8

vpsrlq    $28,%ymm4,%ymm10
vpaddq    %ymm10,%ymm5,%ymm5
vpand     vecmask28,%ymm4,%ymm4

vpsrlq    $28,%ymm0,%ymm10
vpaddq    %ymm10,%ymm1,%ymm1
vpand     vecmask28,%ymm0,%ymm0

// Unreduce-MulC
vpmuludq  vec_c1,%ymm8,%ymm12
vpmuludq  vec_c1,%ymm7,%ymm11
vpmuludq  vec_c1,%ymm6,%ymm10
vpmuludq  vec_c1,%ymm5,%ymm9
vpmuludq  vec_c1,%ymm4,%ymm8
vpmuludq  vec_c1,%ymm3,%ymm6
vpmuludq  vec_c1,%ymm2,%ymm4
vpmuludq  vec_c1,%ymm1,%ymm2
vpmuludq  vec_c1,%ymm0,%ymm0

// HH
vpshufd	  $68,%ymm0,%ymm1
vpshufd	  $238,%ymm0,%ymm3
vpaddq    hh_p1q,%ymm1,%ymm1
vpxor     hh_xor1,%ymm3,%ymm3
vpaddq    %ymm1,%ymm3,%ymm0

vpshufd	  $68,%ymm2,%ymm1
vpshufd	  $238,%ymm2,%ymm3
vpaddq    hh_p2q,%ymm1,%ymm1
vpxor     hh_xor1,%ymm3,%ymm3
vpaddq    %ymm1,%ymm3,%ymm2

vpshufd	  $68,%ymm4,%ymm1
vpshufd	  $238,%ymm4,%ymm3
vpaddq    hh_p2q,%ymm1,%ymm1
vpxor     hh_xor1,%ymm3,%ymm3
vpaddq    %ymm1,%ymm3,%ymm4

vpshufd	  $68,%ymm6,%ymm1
vpshufd	  $238,%ymm6,%ymm3
vpaddq    hh_p2q,%ymm1,%ymm1
vpxor     hh_xor1,%ymm3,%ymm3
vpaddq    %ymm1,%ymm3,%ymm6

vpshufd	  $68,%ymm8,%ymm1
vpshufd	  $238,%ymm8,%ymm3
vpaddq    hh_p2q,%ymm1,%ymm1
vpxor     hh_xor1,%ymm3,%ymm3
vpaddq    %ymm1,%ymm3,%ymm8

vpshufd	  $68,%ymm9,%ymm1
vpshufd	  $238,%ymm9,%ymm3
vpaddq    hh_p2q,%ymm1,%ymm1
vpxor     hh_xor1,%ymm3,%ymm3
vpaddq    %ymm1,%ymm3,%ymm9

vpshufd	  $68,%ymm10,%ymm1
vpshufd	  $238,%ymm10,%ymm3
vpaddq    hh_p2q,%ymm1,%ymm1
vpxor     hh_xor1,%ymm3,%ymm3
vpaddq    %ymm1,%ymm3,%ymm10

vpshufd	  $68,%ymm11,%ymm1
vpshufd	  $238,%ymm11,%ymm3
vpaddq    hh_p2q,%ymm1,%ymm1
vpxor     hh_xor1,%ymm3,%ymm3
vpaddq    %ymm1,%ymm3,%ymm11

vpshufd	  $68,%ymm12,%ymm1
vpshufd	  $238,%ymm12,%ymm3
vpaddq    hh_p3q,%ymm1,%ymm1
vpxor     hh_xor1,%ymm3,%ymm3
vpaddq    %ymm1,%ymm3,%ymm12

vpsrlq    $28,%ymm8,%ymm15
vpaddq    %ymm15,%ymm9,%ymm9
vpand     vecmask28,%ymm8,%ymm8

vpsrlq    $28,%ymm0,%ymm15
vpaddq    %ymm15,%ymm2,%ymm2
vpand     vecmask28,%ymm0,%ymm0

vpsrlq    $28,%ymm9,%ymm15
vpaddq    %ymm15,%ymm10,%ymm10
vpand     vecmask28,%ymm9,%ymm9

vpsrlq    $28,%ymm2,%ymm15
vpaddq    %ymm15,%ymm4,%ymm4
vpand     vecmask28,%ymm2,%ymm2

vpsrlq    $28,%ymm10,%ymm15
vpaddq    %ymm15,%ymm11,%ymm11
vpand     vecmask28,%ymm10,%ymm10

vpsrlq    $28,%ymm4,%ymm15
vpaddq    %ymm15,%ymm6,%ymm6
vpand     vecmask28,%ymm4,%ymm4

vpsrlq    $28,%ymm11,%ymm15
vpaddq    %ymm15,%ymm12,%ymm12
vpand     vecmask28,%ymm11,%ymm11

vpsrlq    $28,%ymm6,%ymm15
vpaddq    %ymm15,%ymm8,%ymm8
vpand     vecmask28,%ymm6,%ymm6

vpsrlq    $27,%ymm12,%ymm15
vpmuludq  vec9,%ymm15,%ymm15
vpaddq    %ymm15,%ymm0,%ymm0
vpand     vecmask27,%ymm12,%ymm12

// Sqr
vpaddq    %ymm0,%ymm0,%ymm13

vpaddq    %ymm2,%ymm2,%ymm7
vmovdqa   %ymm7,64(%rsp)

vpaddq    %ymm4,%ymm4,%ymm14
vmovdqa   %ymm14,96(%rsp)

vpaddq    %ymm6,%ymm6,%ymm14
vmovdqa   %ymm14,128(%rsp)

vpmuludq  %ymm2,%ymm12,%ymm14
vpmuludq  %ymm4,%ymm11,%ymm15
vpaddq    %ymm15,%ymm14,%ymm14
vpmuludq  %ymm6,%ymm10,%ymm15
vpaddq    %ymm15,%ymm14,%ymm14
vpmuludq  %ymm8,%ymm9,%ymm15
vpaddq    %ymm15,%ymm14,%ymm14
vpsllq    $2,%ymm14,%ymm15
vpsllq    $5,%ymm14,%ymm14
vpaddq    %ymm15,%ymm14,%ymm14
vpmuludq  %ymm0,%ymm0,%ymm0
vpaddq    %ymm14,%ymm0,%ymm0

vpmuludq  %ymm4,%ymm12,%ymm14
vpmuludq  %ymm6,%ymm11,%ymm15
vpaddq    %ymm15,%ymm14,%ymm14
vpmuludq  %ymm8,%ymm10,%ymm15
vpaddq    %ymm15,%ymm14,%ymm14
vpsllq    $2,%ymm14,%ymm15
vpsllq    $5,%ymm14,%ymm14
vpaddq    %ymm15,%ymm14,%ymm14
vpmuludq  %ymm13,%ymm2,%ymm15
vpaddq    %ymm15,%ymm14,%ymm1
vpmuludq  %ymm9,%ymm9,%ymm15
vpsllq    $4,%ymm15,%ymm14
vpaddq    %ymm15,%ymm15,%ymm15
vpaddq    %ymm14,%ymm15,%ymm15
vpaddq    %ymm15,%ymm1,%ymm1

vpmuludq  %ymm6,%ymm12,%ymm14
vpmuludq  %ymm8,%ymm11,%ymm15
vpaddq    %ymm15,%ymm14,%ymm14
vpmuludq  %ymm9,%ymm10,%ymm15
vpaddq    %ymm15,%ymm14,%ymm14
vpsllq    $2,%ymm14,%ymm15
vpsllq    $5,%ymm14,%ymm14
vpaddq    %ymm15,%ymm14,%ymm14
vpmuludq  %ymm2,%ymm2,%ymm2
vpaddq    %ymm14,%ymm2,%ymm2
vpmuludq  %ymm13,%ymm4,%ymm15
vpaddq    %ymm15,%ymm2,%ymm2

vpmuludq  %ymm8,%ymm12,%ymm14
vpmuludq  %ymm9,%ymm11,%ymm15
vpaddq    %ymm15,%ymm14,%ymm14
vpsllq    $2,%ymm14,%ymm15
vpsllq    $5,%ymm14,%ymm14
vpaddq    %ymm15,%ymm14,%ymm14
vpmuludq  %ymm13,%ymm6,%ymm15
vpaddq    %ymm15,%ymm14,%ymm3
vpmuludq  %ymm7,%ymm4,%ymm15
vpaddq    %ymm15,%ymm3,%ymm3
vpmuludq  %ymm10,%ymm10,%ymm15
vpsllq    $4,%ymm15,%ymm14
vpaddq    %ymm15,%ymm15,%ymm15
vpaddq    %ymm14,%ymm15,%ymm15
vpaddq    %ymm15,%ymm3,%ymm3

vpmuludq  %ymm9,%ymm12,%ymm14
vpmuludq  %ymm10,%ymm11,%ymm15
vpaddq    %ymm15,%ymm14,%ymm14
vpsllq    $2,%ymm14,%ymm15
vpsllq    $5,%ymm14,%ymm14
vpaddq    %ymm15,%ymm14,%ymm14
vpmuludq  %ymm4,%ymm4,%ymm4
vpaddq    %ymm14,%ymm4,%ymm4
vpmuludq  %ymm13,%ymm8,%ymm15
vpaddq    %ymm15,%ymm4,%ymm4
vpmuludq  %ymm7,%ymm6,%ymm15
vpaddq    %ymm15,%ymm4,%ymm4

vpmuludq  %ymm10,%ymm12,%ymm14
vpsllq    $2,%ymm14,%ymm15
vpsllq    $5,%ymm14,%ymm14
vpaddq    %ymm15,%ymm14,%ymm14
vpmuludq  %ymm13,%ymm9,%ymm15
vpaddq    %ymm15,%ymm14,%ymm5
vpmuludq  %ymm7,%ymm8,%ymm15
vpaddq    %ymm15,%ymm5,%ymm5
vpmuludq  96(%rsp),%ymm6,%ymm15
vpaddq    %ymm15,%ymm5,%ymm5
vpmuludq  %ymm11,%ymm11,%ymm15
vpsllq    $4,%ymm15,%ymm14
vpaddq    %ymm15,%ymm15,%ymm15
vpaddq    %ymm14,%ymm15,%ymm15
vpaddq    %ymm15,%ymm5,%ymm5

vpmuludq  %ymm11,%ymm12,%ymm14
vpsllq    $2,%ymm14,%ymm15
vpsllq    $5,%ymm14,%ymm14
vpaddq    %ymm15,%ymm14,%ymm14
vpmuludq  %ymm6,%ymm6,%ymm6
vpaddq    %ymm14,%ymm6,%ymm6
vpmuludq  %ymm13,%ymm10,%ymm15
vpaddq    %ymm15,%ymm6,%ymm6
vpmuludq  %ymm7,%ymm9,%ymm15
vpaddq    %ymm15,%ymm6,%ymm6
vpmuludq  96(%rsp),%ymm8,%ymm15
vpaddq    %ymm15,%ymm6,%ymm6

vpmuludq  %ymm13,%ymm11,%ymm14
vpmuludq  %ymm7,%ymm10,%ymm15
vpaddq    %ymm15,%ymm14,%ymm7
vpmuludq  96(%rsp),%ymm9,%ymm15
vpaddq    %ymm15,%ymm7,%ymm7
vpmuludq  128(%rsp),%ymm8,%ymm15
vpaddq    %ymm15,%ymm7,%ymm7
vpmuludq  %ymm12,%ymm12,%ymm15
vpsllq    $4,%ymm15,%ymm14
vpaddq    %ymm15,%ymm15,%ymm15
vpaddq    %ymm14,%ymm15,%ymm15
vpaddq    %ymm15,%ymm7,%ymm7

vpmuludq  %ymm13,%ymm12,%ymm14
vpmuludq  64(%rsp),%ymm11,%ymm15
vpaddq    %ymm15,%ymm14,%ymm14	
vpmuludq  96(%rsp),%ymm10,%ymm15
vpaddq    %ymm15,%ymm14,%ymm14
vpmuludq  128(%rsp),%ymm9,%ymm15
vpaddq    %ymm15,%ymm14,%ymm14
vpmuludq  %ymm8,%ymm8,%ymm8
vpaddq    %ymm14,%ymm8,%ymm8

vpsrlq    $28,%ymm4,%ymm10
vpaddq    %ymm10,%ymm5,%ymm5
vpand     vecmask28,%ymm4,%ymm12

vpsrlq    $28,%ymm0,%ymm10
vpaddq    %ymm10,%ymm1,%ymm1
vpand  	  vecmask28,%ymm0,%ymm13

vpsrlq    $28,%ymm5,%ymm10
vpaddq    %ymm10,%ymm6,%ymm6
vpand     vecmask28,%ymm5,%ymm4

vpsrlq    $28,%ymm1,%ymm10
vpaddq    %ymm10,%ymm2,%ymm2
vpand     vecmask28,%ymm1,%ymm0

vpsrlq    $28,%ymm6,%ymm10
vpaddq    %ymm10,%ymm7,%ymm7
vpand     vecmask28,%ymm6,%ymm5

vpsrlq    $28,%ymm2,%ymm10
vpaddq    %ymm10,%ymm3,%ymm3
vpand     vecmask28,%ymm2,%ymm1

vpsrlq    $28,%ymm7,%ymm10
vpaddq    %ymm10,%ymm8,%ymm8
vpand     vecmask28,%ymm7,%ymm6

vpsrlq    $28,%ymm3,%ymm10
vpaddq    %ymm10,%ymm12,%ymm12
vpand     vecmask28,%ymm3,%ymm2

vpsrlq    $27,%ymm8,%ymm10
vpsllq    $3,%ymm10,%ymm11
vpaddq    %ymm11,%ymm10,%ymm10
vpaddq    %ymm10,%ymm13,%ymm13
vpand     vecmask27,%ymm8,%ymm7

vpsrlq    $28,%ymm12,%ymm10
vpaddq    %ymm10,%ymm4,%ymm4
vpand     vecmask28,%ymm12,%ymm3

vpsrlq    $28,%ymm13,%ymm10
vpaddq    %ymm10,%ymm0,%ymm0
vpand     vecmask28,%ymm13,%ymm8

vmovdqa   %ymm8,64(%rsp)
vmovdqa   %ymm0,96(%rsp)
vmovdqa   %ymm1,128(%rsp)
vmovdqa   %ymm2,160(%rsp)
vmovdqa   %ymm3,192(%rsp)
vmovdqa   %ymm4,224(%rsp)
vmovdqa   %ymm5,256(%rsp)
vmovdqa   %ymm6,288(%rsp)
vmovdqa   %ymm7,320(%rsp)

// Dense-CSwap
vpbroadcastd 56(%rsp),%ymm15
vpaddd	  swap_c,%ymm15,%ymm15
vpand     swap_mask,%ymm15,%ymm15

vpermd	  288(%rsi),%ymm15,%ymm7
vpermd	  320(%rsi),%ymm15,%ymm8
vpermd	  352(%rsi),%ymm15,%ymm9
vpermd	  384(%rsi),%ymm15,%ymm10
vpermd	  416(%rsi),%ymm15,%ymm15

// Pack-D2N
vpsrlq    $32,%ymm7,%ymm11
vpsrlq    $32,%ymm8,%ymm12
vpsrlq    $32,%ymm9,%ymm13
vpsrlq    $32,%ymm10,%ymm14

vmovdqa   %ymm7,352(%rsp)
vmovdqa   %ymm8,384(%rsp)
vmovdqa   %ymm9,416(%rsp)
vmovdqa   %ymm10,448(%rsp)
vmovdqa   %ymm11,480(%rsp)
vmovdqa   %ymm12,512(%rsp)
vmovdqa   %ymm13,544(%rsp)
vmovdqa   %ymm14,576(%rsp)
vmovdqa   %ymm15,608(%rsp)

// Mul
vpaddq    %ymm0,%ymm0,%ymm0
vpaddq    %ymm1,%ymm1,%ymm1
vpaddq    %ymm2,%ymm2,%ymm2
vpaddq    %ymm3,%ymm3,%ymm3
vpaddq    %ymm4,%ymm4,%ymm4
vpaddq    %ymm5,%ymm5,%ymm5
vpaddq    %ymm6,%ymm6,%ymm6

vpmuludq  vec9,%ymm8,%ymm8
vpmuludq  vec9,%ymm9,%ymm9
vpmuludq  vec9,%ymm10,%ymm10
vpmuludq  vec9,%ymm11,%ymm11
vpmuludq  vec9,%ymm12,%ymm12
vpmuludq  vec9,%ymm13,%ymm13
vpmuludq  vec9,%ymm14,%ymm14
vpmuludq  vec9,%ymm15,%ymm15

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

vmovdqa   320(%rsp),%ymm7
vpaddq    %ymm7,%ymm7,%ymm7

vpmuludq  %ymm7,%ymm8,%ymm8
vpaddq    %ymm8,%ymm0,%ymm0

vpmuludq  %ymm7,%ymm9,%ymm8
vpaddq    %ymm8,%ymm1,%ymm1

vpmuludq  %ymm7,%ymm10,%ymm8
vpaddq    %ymm8,%ymm2,%ymm2

vpmuludq  %ymm7,%ymm11,%ymm8
vpaddq    %ymm8,%ymm3,%ymm3

vpmuludq  %ymm7,%ymm12,%ymm8
vpaddq    %ymm8,%ymm4,%ymm4

vpmuludq  %ymm7,%ymm13,%ymm8
vpaddq    %ymm8,%ymm5,%ymm5

vpmuludq  %ymm7,%ymm14,%ymm8
vpaddq    %ymm8,%ymm6,%ymm6

vpmuludq  %ymm7,%ymm15,%ymm7

vmovdqa   64(%rsp),%ymm9
vmovdqa   96(%rsp),%ymm10
vmovdqa   128(%rsp),%ymm11
vmovdqa   160(%rsp),%ymm12
vmovdqa   192(%rsp),%ymm13
vmovdqa   224(%rsp),%ymm14
vmovdqa   256(%rsp),%ymm15

vpmuludq  352(%rsp),%ymm9,%ymm8
vpaddq    %ymm8,%ymm0,%ymm0

vpmuludq  384(%rsp),%ymm9,%ymm8
vpaddq    %ymm8,%ymm1,%ymm1
vpmuludq  352(%rsp),%ymm10,%ymm8
vpaddq    %ymm8,%ymm1,%ymm1

vpmuludq  416(%rsp),%ymm9,%ymm8
vpaddq    %ymm8,%ymm2,%ymm2
vpmuludq  384(%rsp),%ymm10,%ymm8
vpaddq    %ymm8,%ymm2,%ymm2
vpmuludq  352(%rsp),%ymm11,%ymm8
vpaddq    %ymm8,%ymm2,%ymm2

vpmuludq  448(%rsp),%ymm9,%ymm8
vpaddq    %ymm8,%ymm3,%ymm3
vpmuludq  416(%rsp),%ymm10,%ymm8
vpaddq    %ymm8,%ymm3,%ymm3
vpmuludq  384(%rsp),%ymm11,%ymm8
vpaddq    %ymm8,%ymm3,%ymm3
vpmuludq  352(%rsp),%ymm12,%ymm8
vpaddq    %ymm8,%ymm3,%ymm3

vpmuludq  480(%rsp),%ymm9,%ymm8
vpaddq    %ymm8,%ymm4,%ymm4
vpmuludq  448(%rsp),%ymm10,%ymm8
vpaddq    %ymm8,%ymm4,%ymm4
vpmuludq  416(%rsp),%ymm11,%ymm8
vpaddq    %ymm8,%ymm4,%ymm4
vpmuludq  384(%rsp),%ymm12,%ymm8
vpaddq    %ymm8,%ymm4,%ymm4
vpmuludq  352(%rsp),%ymm13,%ymm8
vpaddq    %ymm8,%ymm4,%ymm4

vpmuludq  512(%rsp),%ymm9,%ymm8
vpaddq    %ymm8,%ymm5,%ymm5
vpmuludq  480(%rsp),%ymm10,%ymm8
vpaddq    %ymm8,%ymm5,%ymm5
vpmuludq  448(%rsp),%ymm11,%ymm8
vpaddq    %ymm8,%ymm5,%ymm5
vpmuludq  416(%rsp),%ymm12,%ymm8
vpaddq    %ymm8,%ymm5,%ymm5
vpmuludq  384(%rsp),%ymm13,%ymm8
vpaddq    %ymm8,%ymm5,%ymm5
vpmuludq  352(%rsp),%ymm14,%ymm8
vpaddq    %ymm8,%ymm5,%ymm5

vpmuludq  544(%rsp),%ymm9,%ymm8
vpaddq    %ymm8,%ymm6,%ymm6
vpmuludq  512(%rsp),%ymm10,%ymm8
vpaddq    %ymm8,%ymm6,%ymm6
vpmuludq  480(%rsp),%ymm11,%ymm8
vpaddq    %ymm8,%ymm6,%ymm6
vpmuludq  448(%rsp),%ymm12,%ymm8
vpaddq    %ymm8,%ymm6,%ymm6
vpmuludq  416(%rsp),%ymm13,%ymm8
vpaddq    %ymm8,%ymm6,%ymm6
vpmuludq  384(%rsp),%ymm14,%ymm8
vpaddq    %ymm8,%ymm6,%ymm6
vpmuludq  352(%rsp),%ymm15,%ymm8
vpaddq    %ymm8,%ymm6,%ymm6

vpmuludq  576(%rsp),%ymm9,%ymm8
vpaddq    %ymm8,%ymm7,%ymm7
vpmuludq  544(%rsp),%ymm10,%ymm8
vpaddq    %ymm8,%ymm7,%ymm7
vpmuludq  512(%rsp),%ymm11,%ymm8
vpaddq    %ymm8,%ymm7,%ymm7
vpmuludq  480(%rsp),%ymm12,%ymm8
vpaddq    %ymm8,%ymm7,%ymm7
vpmuludq  448(%rsp),%ymm13,%ymm8
vpaddq    %ymm8,%ymm7,%ymm7
vpmuludq  416(%rsp),%ymm14,%ymm8
vpaddq    %ymm8,%ymm7,%ymm7
vpmuludq  384(%rsp),%ymm15,%ymm8
vpaddq    %ymm8,%ymm7,%ymm7

vpmuludq  608(%rsp),%ymm9,%ymm8
vpmuludq  576(%rsp),%ymm10,%ymm15
vpaddq    %ymm15,%ymm8,%ymm8
vpmuludq  544(%rsp),%ymm11,%ymm15
vpaddq    %ymm15,%ymm8,%ymm8
vpmuludq  512(%rsp),%ymm12,%ymm15
vpaddq    %ymm15,%ymm8,%ymm8
vpmuludq  480(%rsp),%ymm13,%ymm15
vpaddq    %ymm15,%ymm8,%ymm8
vpmuludq  448(%rsp),%ymm14,%ymm15
vpaddq    %ymm15,%ymm8,%ymm8

vmovdqa   256(%rsp),%ymm9
vmovdqa   288(%rsp),%ymm10
vmovdqa   320(%rsp),%ymm11

vpmuludq  352(%rsp),%ymm10,%ymm15
vpaddq    %ymm15,%ymm7,%ymm7

vpmuludq  416(%rsp),%ymm9,%ymm15
vpaddq    %ymm15,%ymm8,%ymm8
vpmuludq  384(%rsp),%ymm10,%ymm15
vpaddq    %ymm15,%ymm8,%ymm8
vpmuludq  352(%rsp),%ymm11,%ymm15
vpaddq    %ymm15,%ymm8,%ymm8

vpsrlq    $28,%ymm4,%ymm10
vpaddq    %ymm10,%ymm5,%ymm5
vpand     vecmask28,%ymm4,%ymm12

vpsrlq    $28,%ymm0,%ymm10
vpaddq    %ymm10,%ymm1,%ymm1
vpand  	  vecmask28,%ymm0,%ymm13

vpsrlq    $28,%ymm5,%ymm10
vpaddq    %ymm10,%ymm6,%ymm6
vpand     vecmask28,%ymm5,%ymm4

vpsrlq    $28,%ymm1,%ymm10
vpaddq    %ymm10,%ymm2,%ymm2
vpand     vecmask28,%ymm1,%ymm0

vpsrlq    $28,%ymm6,%ymm10
vpaddq    %ymm10,%ymm7,%ymm7
vpand     vecmask28,%ymm6,%ymm5

vpsrlq    $28,%ymm2,%ymm10
vpaddq    %ymm10,%ymm3,%ymm3
vpand     vecmask28,%ymm2,%ymm1

vpsrlq    $28,%ymm7,%ymm10
vpaddq    %ymm10,%ymm8,%ymm8
vpand     vecmask28,%ymm7,%ymm6

vpsrlq    $28,%ymm3,%ymm10
vpaddq    %ymm10,%ymm12,%ymm12
vpand     vecmask28,%ymm3,%ymm2

vpsrlq    $27,%ymm8,%ymm10
vpsllq    $3,%ymm10,%ymm11
vpaddq    %ymm11,%ymm10,%ymm10
vpaddq    %ymm10,%ymm13,%ymm13
vpand     vecmask27,%ymm8,%ymm7

vpsrlq    $28,%ymm12,%ymm10
vpaddq    %ymm10,%ymm4,%ymm4
vpand     vecmask28,%ymm12,%ymm3

vpsrlq    $28,%ymm13,%ymm10
vpaddq    %ymm10,%ymm0,%ymm0
vpand     vecmask28,%ymm13,%ymm8

subb      $1,%cl
cmpb	  $0,%cl
jge       .L2

movb	  $7,%cl
subq      $1,%r15
cmpq	  $0,%r15
jge       .L1

// Reduce
vpsrlq    $28,%ymm8,%ymm10
vpaddq    %ymm10,%ymm0,%ymm0
vpand     vecmask28,%ymm8,%ymm8

vpsrlq    $28,%ymm0,%ymm10
vpaddq    %ymm10,%ymm1,%ymm1
vpand     vecmask28,%ymm0,%ymm0

vpsrlq    $28,%ymm1,%ymm10
vpaddq 	  %ymm10,%ymm2,%ymm2
vpand     vecmask28,%ymm1,%ymm1

vpsrlq    $28,%ymm2,%ymm10
vpaddq    %ymm10,%ymm3,%ymm3
vpand     vecmask28,%ymm2,%ymm2

vpsrlq    $28,%ymm3,%ymm10
vpaddq    %ymm10,%ymm4,%ymm4
vpand     vecmask28,%ymm3,%ymm3

vpsrlq    $28,%ymm4,%ymm10
vpaddq    %ymm10,%ymm5,%ymm5
vpand     vecmask28,%ymm4,%ymm4

vpsrlq    $28,%ymm5,%ymm10
vpaddq    %ymm10,%ymm6,%ymm6
vpand     vecmask28,%ymm5,%ymm5

vpsrlq    $28,%ymm6,%ymm10
vpaddq    %ymm10,%ymm7,%ymm7
vpand     vecmask28,%ymm6,%ymm6

vpsrlq    $27,%ymm7,%ymm10
vpmuludq  vec9,%ymm10,%ymm10
vpaddq    %ymm10,%ymm8,%ymm8
vpand     vecmask27,%ymm7,%ymm7

vpsrlq    $28,%ymm8,%ymm10
vpaddq    %ymm10,%ymm0,%ymm0
vpand     vecmask28,%ymm8,%ymm8

// Store output
vmovdqa   %ymm8,0(%rdi)
vmovdqa   %ymm0,32(%rdi)
vmovdqa   %ymm1,64(%rdi)
vmovdqa   %ymm2,96(%rdi)
vmovdqa   %ymm3,128(%rdi)
vmovdqa   %ymm4,160(%rdi)
vmovdqa   %ymm5,192(%rdi)
vmovdqa   %ymm6,224(%rdi)
vmovdqa   %ymm7,256(%rdi)

movq 	  0(%rsp), %r11
movq 	  8(%rsp), %r12
movq 	  16(%rsp),%r13
movq 	  24(%rsp),%r14
movq 	  32(%rsp),%r15
movq 	  40(%rsp),%rbx
movq 	  48(%rsp),%rbp

movq 	  %r11,%rsp

ret
