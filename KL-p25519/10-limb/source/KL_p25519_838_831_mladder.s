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
.globl KL_p25519_838_831_mladder
KL_p25519_838_831_mladder:

movq 	  %rsp,%r11
andq 	  $-32,%rsp
subq 	  $704,%rsp

movq 	  %r11,0(%rsp)
movq 	  %r12,8(%rsp)
movq 	  %r13,16(%rsp)
movq 	  %r14,24(%rsp)
movq 	  %r15,32(%rsp)
movq 	  %rbx,40(%rsp)
movq 	  %rbp,48(%rsp)

// Pack-N2D
vmovdqa   320(%rsi),%ymm0
vmovdqa   352(%rsi),%ymm1
vmovdqa   384(%rsi),%ymm2
vmovdqa   416(%rsi),%ymm3
vmovdqa   448(%rsi),%ymm4
vmovdqa   480(%rsi),%ymm5
vmovdqa   512(%rsi),%ymm6
vmovdqa   544(%rsi),%ymm7
vmovdqa   576(%rsi),%ymm8
vmovdqa   608(%rsi),%ymm9

vpsllq    $32,%ymm1,%ymm1
vpor      %ymm1,%ymm0,%ymm0
vpsllq    $32,%ymm3,%ymm3
vpor      %ymm3,%ymm2,%ymm2
vpsllq    $32,%ymm5,%ymm5
vpor      %ymm5,%ymm4,%ymm4
vpsllq    $32,%ymm7,%ymm7
vpor      %ymm7,%ymm6,%ymm6
vpsllq    $32,%ymm9,%ymm9
vpor      %ymm9,%ymm8,%ymm8

vmovdqa   %ymm0,320(%rsi)
vmovdqa   %ymm2,352(%rsi)
vmovdqa   %ymm4,384(%rsi)
vmovdqa   %ymm6,416(%rsi)
vmovdqa   %ymm8,448(%rsi)

// Pack-N2D
vmovdqa   0(%rsi),%ymm0
vmovdqa   32(%rsi),%ymm3
vmovdqa   64(%rsi),%ymm12
vmovdqa   96(%rsi),%ymm13
vmovdqa   128(%rsi),%ymm7
vmovdqa   160(%rsi),%ymm9
vmovdqa   192(%rsi),%ymm5
vmovdqa   224(%rsi),%ymm14
vmovdqa   256(%rsi),%ymm6
vmovdqa   288(%rsi),%ymm8

vpsllq    $32,%ymm3,%ymm3
vpor      %ymm3,%ymm0,%ymm0
vpsllq    $32,%ymm13,%ymm13
vpor      %ymm13,%ymm12,%ymm12
vpsllq    $32,%ymm9,%ymm9
vpor      %ymm9,%ymm7,%ymm7
vpsllq    $32,%ymm14,%ymm14
vpor      %ymm14,%ymm5,%ymm5
vpsllq    $32,%ymm8,%ymm8
vpor      %ymm8,%ymm6,%ymm6

// Dense-HH
vpshufd	  $68,%ymm0,%ymm1
vpshufd	  $238,%ymm0,%ymm4
vpaddd    hh_p1d,%ymm1,%ymm1
vpxor     hh_xor,%ymm4,%ymm4
vpaddd    %ymm1,%ymm4,%ymm0

vpshufd	  $68,%ymm12,%ymm1
vpshufd	  $238,%ymm12,%ymm4
vpaddd    hh_p3d,%ymm1,%ymm1
vpxor     hh_xor,%ymm4,%ymm4
vpaddd    %ymm1,%ymm4,%ymm12

vpshufd	  $68,%ymm7,%ymm1
vpshufd	  $238,%ymm7,%ymm4
vpaddd    hh_p3d,%ymm1,%ymm1
vpxor     hh_xor,%ymm4,%ymm4
vpaddd    %ymm1,%ymm4,%ymm7

vpshufd	  $68,%ymm5,%ymm1
vpshufd	  $238,%ymm5,%ymm4
vpaddd    hh_p3d,%ymm1,%ymm1
vpxor     hh_xor,%ymm4,%ymm4
vpaddd    %ymm1,%ymm4,%ymm5

vpshufd	  $68,%ymm6,%ymm1
vpshufd	  $238,%ymm6,%ymm4
vpaddd    hh_p3d,%ymm1,%ymm1
vpxor     hh_xor,%ymm4,%ymm4
vpaddd    %ymm1,%ymm4,%ymm6

vpsrlq    $32,%ymm0,%ymm3
vpsrlq    $32,%ymm12,%ymm13
vpsrlq    $32,%ymm7,%ymm9
vpsrlq    $32,%ymm5,%ymm14
vpsrlq    $32,%ymm6,%ymm8

// Sqr
vmovdqa   %ymm12,384(%rsp)
vmovdqa   %ymm13,416(%rsp)
vmovdqa   %ymm7, 448(%rsp)
vmovdqa   %ymm9, 480(%rsp)
vmovdqa   %ymm5, 512(%rsp)
vmovdqa   %ymm14,544(%rsp)
vmovdqa   %ymm6, 576(%rsp)
vmovdqa   %ymm8, 608(%rsp)

vpmuludq  vec19,%ymm5,%ymm2
vpmuludq  vec19,%ymm6,%ymm6
vpmuludq  vec38,%ymm9,%ymm1
vpmuludq  vec38,%ymm14,%ymm4
vpmuludq  vec38,%ymm8,%ymm8

vpaddq    %ymm0,%ymm0,%ymm10
vpaddq    %ymm3,%ymm3,%ymm11
vpaddq    %ymm12,%ymm12,%ymm12
vpaddq    %ymm13,%ymm13,%ymm13
vpaddq    %ymm7,%ymm7,%ymm7
vpaddq    %ymm9,%ymm9,%ymm9
vpaddq    %ymm5,%ymm5,%ymm5
vpaddq    %ymm14,%ymm14,%ymm14

vpmuludq  %ymm0,%ymm0,%ymm0
vpmuludq  %ymm11,%ymm8,%ymm15
vpaddq    %ymm15,%ymm0,%ymm0
vpmuludq  %ymm12,%ymm6,%ymm15
vpaddq    %ymm15,%ymm0,%ymm0
vpmuludq  %ymm13,%ymm4,%ymm15
vpaddq    %ymm15,%ymm0,%ymm0
vpmuludq  %ymm7,%ymm2,%ymm15
vpaddq    %ymm15,%ymm0,%ymm0
vpmuludq  480(%rsp),%ymm1,%ymm15
vpaddq    %ymm15,%ymm0,%ymm0

vpmuludq  512(%rsp),%ymm1,%ymm1
vpmuludq  %ymm3,%ymm10,%ymm15
vpaddq    %ymm15,%ymm1,%ymm1
vpmuludq  384(%rsp),%ymm8,%ymm15
vpaddq    %ymm15,%ymm1,%ymm1
vpmuludq  %ymm13,%ymm6,%ymm15
vpaddq    %ymm15,%ymm1,%ymm1
vpmuludq  448(%rsp),%ymm4,%ymm15
vpaddq    %ymm15,%ymm1,%ymm1

vpmuludq  512(%rsp),%ymm2,%ymm2
vpmuludq  384(%rsp),%ymm10,%ymm15
vpaddq    %ymm15,%ymm2,%ymm2
vpmuludq  %ymm3,%ymm11,%ymm15
vpaddq    %ymm15,%ymm2,%ymm2
vpmuludq  %ymm13,%ymm8,%ymm15
vpaddq    %ymm15,%ymm2,%ymm2
vpmuludq  %ymm7,%ymm6,%ymm15
vpaddq    %ymm15,%ymm2,%ymm2
vpmuludq  %ymm9,%ymm4,%ymm15
vpaddq    %ymm15,%ymm2,%ymm2

vpmuludq  416(%rsp),%ymm10,%ymm3
vpmuludq  384(%rsp),%ymm11,%ymm15
vpaddq    %ymm15,%ymm3,%ymm3
vpmuludq  448(%rsp),%ymm8,%ymm15
vpaddq    %ymm15,%ymm3,%ymm3
vpmuludq  %ymm9,%ymm6,%ymm15
vpaddq    %ymm15,%ymm3,%ymm3
vpmuludq  512(%rsp),%ymm4,%ymm15
vpaddq    %ymm15,%ymm3,%ymm3

vpmuludq  544(%rsp),%ymm4,%ymm4
vpmuludq  448(%rsp),%ymm10,%ymm15
vpaddq    %ymm15,%ymm4,%ymm4
vpmuludq  %ymm11,%ymm13,%ymm15
vpaddq    %ymm15,%ymm4,%ymm4
vmovdqa   384(%rsp),%ymm15
vpmuludq  %ymm15,%ymm15,%ymm15
vpaddq    %ymm15,%ymm4,%ymm4
vpmuludq  %ymm9,%ymm8,%ymm15
vpaddq    %ymm15,%ymm4,%ymm4
vpmuludq  %ymm5,%ymm6,%ymm15
vpaddq    %ymm15,%ymm4,%ymm4

vpmuludq  480(%rsp),%ymm10,%ymm5
vpmuludq  448(%rsp),%ymm11,%ymm15
vpaddq    %ymm15,%ymm5,%ymm5
vpmuludq  416(%rsp),%ymm12,%ymm15
vpaddq    %ymm15,%ymm5,%ymm5
vpmuludq  512(%rsp),%ymm8,%ymm15
vpaddq    %ymm15,%ymm5,%ymm5
vpmuludq  %ymm6,%ymm14,%ymm15
vpaddq    %ymm15,%ymm5,%ymm5

vpmuludq  576(%rsp),%ymm6,%ymm6
vpmuludq  512(%rsp),%ymm10,%ymm15
vpaddq    %ymm15,%ymm6,%ymm6
vpmuludq  %ymm11,%ymm9,%ymm15
vpaddq    %ymm15,%ymm6,%ymm6
vpmuludq  448(%rsp),%ymm12,%ymm15
vpaddq    %ymm15,%ymm6,%ymm6
vpmuludq  416(%rsp),%ymm13,%ymm15
vpaddq    %ymm15,%ymm6,%ymm6
vpmuludq  %ymm14,%ymm8,%ymm15
vpaddq    %ymm15,%ymm6,%ymm6

vpmuludq  544(%rsp),%ymm10,%ymm7
vpmuludq  512(%rsp),%ymm11,%ymm15
vpaddq    %ymm15,%ymm7,%ymm7
vpmuludq  480(%rsp),%ymm12,%ymm15
vpaddq    %ymm15,%ymm7,%ymm7
vpmuludq  448(%rsp),%ymm13,%ymm15
vpaddq    %ymm15,%ymm7,%ymm7
vpmuludq  576(%rsp),%ymm8,%ymm15
vpaddq    %ymm15,%ymm7,%ymm7

vpmuludq  608(%rsp),%ymm8,%ymm8
vpmuludq  576(%rsp),%ymm10,%ymm15
vpaddq    %ymm15,%ymm8,%ymm8
vpmuludq  %ymm11,%ymm14,%ymm15
vpaddq    %ymm15,%ymm8,%ymm8
vpmuludq  512(%rsp),%ymm12,%ymm15
vpaddq    %ymm15,%ymm8,%ymm8
vpmuludq  %ymm13,%ymm9,%ymm15
vpaddq    %ymm15,%ymm8,%ymm8
vmovdqa   448(%rsp),%ymm15
vpmuludq  %ymm15,%ymm15,%ymm15
vpaddq    %ymm15,%ymm8,%ymm8

vpmuludq  448(%rsp),%ymm9,%ymm9
vpmuludq  608(%rsp),%ymm10,%ymm15
vpaddq    %ymm15,%ymm9,%ymm9
vpmuludq  576(%rsp),%ymm11,%ymm15
vpaddq    %ymm15,%ymm9,%ymm9
vpmuludq  544(%rsp),%ymm12,%ymm15
vpaddq    %ymm15,%ymm9,%ymm9
vpmuludq  512(%rsp),%ymm13,%ymm15
vpaddq    %ymm15,%ymm9,%ymm9

vpsrlq    $25,%ymm5,%ymm10
vpaddq    %ymm10,%ymm6,%ymm6
vpand     vecmask25,%ymm5,%ymm5

vpsrlq    $26,%ymm0,%ymm10
vpaddq    %ymm10,%ymm1,%ymm1
vpand     vecmask26,%ymm0,%ymm0

vpsrlq    $26,%ymm6,%ymm10
vpaddq    %ymm10,%ymm7,%ymm7
vpand     vecmask26,%ymm6,%ymm6

vpsrlq    $25,%ymm1,%ymm10
vpaddq    %ymm10,%ymm2,%ymm2
vpand     vecmask25,%ymm1,%ymm1

vpsrlq    $25,%ymm7,%ymm10
vpaddq    %ymm10,%ymm8,%ymm8
vpand     vecmask25,%ymm7,%ymm7

vpsrlq    $26,%ymm2,%ymm10
vpaddq    %ymm10,%ymm3,%ymm3
vpand     vecmask26,%ymm2,%ymm2

vpsrlq    $26,%ymm8,%ymm10
vpaddq    %ymm10,%ymm9,%ymm9
vpand     vecmask26,%ymm8,%ymm8

vpsrlq    $25,%ymm3,%ymm10
vpaddq    %ymm10,%ymm4,%ymm4
vpand     vecmask25,%ymm3,%ymm3

vpsrlq    $25,%ymm9,%ymm10
vpaddq    %ymm10,%ymm0,%ymm0
vpsllq    $1,%ymm10,%ymm10
vpaddq    %ymm10,%ymm0,%ymm0
vpsllq    $3,%ymm10,%ymm10
vpaddq    %ymm10,%ymm0,%ymm0
vpand     vecmask25,%ymm9,%ymm11

vpsrlq    $26,%ymm4,%ymm10
vpaddq    %ymm10,%ymm5,%ymm5
vpand     vecmask26,%ymm4,%ymm4

vpsrlq    $26,%ymm0,%ymm10
vpaddq    %ymm10,%ymm1,%ymm1
vpand     vecmask26,%ymm0,%ymm0

vpsrlq    $25,%ymm5,%ymm10
vpaddq    %ymm10,%ymm6,%ymm6
vpand     vecmask25,%ymm5,%ymm5

// MulC
vpmuludq  vec_c1,%ymm5,%ymm9
vpmuludq  vec_c1,%ymm6,%ymm5
vpmuludq  vec_c1,%ymm8,%ymm6
vpmuludq  vec_c1,%ymm11,%ymm8
vpmuludq  vec_c1,%ymm7,%ymm14
vpmuludq  vec_c1,%ymm4,%ymm7
vpmuludq  vec_c1,%ymm3,%ymm13
vpmuludq  vec_c1,%ymm2,%ymm12
vpmuludq  vec_c1,%ymm1,%ymm3
vpmuludq  vec_c1,%ymm0,%ymm0

vpsrlq    $25,%ymm9,%ymm10
vpaddq    %ymm10,%ymm5,%ymm5
vpand     vecmask25,%ymm9,%ymm9

vpsrlq    $26,%ymm0,%ymm10
vpaddq    %ymm10,%ymm3,%ymm3
vpand     vecmask26,%ymm0,%ymm0

vpsrlq    $26,%ymm5,%ymm10
vpaddq    %ymm10,%ymm14,%ymm14
vpand     vecmask26,%ymm5,%ymm5

vpsrlq    $25,%ymm3,%ymm10
vpaddq    %ymm10,%ymm12,%ymm12
vpand     vecmask25,%ymm3,%ymm3

vpsrlq    $25,%ymm14,%ymm10
vpaddq    %ymm10,%ymm6,%ymm6
vpand     vecmask25,%ymm14,%ymm14

vpsrlq    $26,%ymm12,%ymm10
vpaddq    %ymm10,%ymm13,%ymm13
vpand     vecmask26,%ymm12,%ymm12

vpsrlq    $26,%ymm6,%ymm10
vpaddq    %ymm10,%ymm8,%ymm8
vpand     vecmask26,%ymm6,%ymm6

vpsrlq    $25,%ymm13,%ymm10
vpaddq    %ymm10,%ymm7,%ymm7
vpand     vecmask25,%ymm13,%ymm13

vpsrlq    $25,%ymm8,%ymm10
vpmuludq  vec19,%ymm10,%ymm10
vpaddq    %ymm10,%ymm0,%ymm0
vpand     vecmask25,%ymm8,%ymm8

vpsrlq    $26,%ymm7,%ymm10
vpaddq    %ymm10,%ymm9,%ymm9
vpand     vecmask26,%ymm7,%ymm7

// Pack-N2D
vpsllq    $32,%ymm3,%ymm3
vpor      %ymm3,%ymm0,%ymm0
vpsllq    $32,%ymm13,%ymm13
vpor      %ymm13,%ymm12,%ymm12
vpsllq    $32,%ymm9,%ymm9
vpor      %ymm9,%ymm7,%ymm7
vpsllq    $32,%ymm14,%ymm14
vpor      %ymm14,%ymm5,%ymm5
vpsllq    $32,%ymm8,%ymm8
vpor      %ymm8,%ymm6,%ymm6

// Dense-HH
vpshufd	  $68,%ymm0,%ymm1
vpshufd	  $238,%ymm0,%ymm4
vpaddd    hh_p1d,%ymm1,%ymm1
vpxor     hh_xor,%ymm4,%ymm4
vpaddd    %ymm1,%ymm4,%ymm0

vpshufd	  $68,%ymm12,%ymm1
vpshufd	  $238,%ymm12,%ymm4
vpaddd    hh_p3d,%ymm1,%ymm1
vpxor     hh_xor,%ymm4,%ymm4
vpaddd    %ymm1,%ymm4,%ymm12

vpshufd	  $68,%ymm7,%ymm1
vpshufd	  $238,%ymm7,%ymm4
vpaddd    hh_p3d,%ymm1,%ymm1
vpxor     hh_xor,%ymm4,%ymm4
vpaddd    %ymm1,%ymm4,%ymm7

vpshufd	  $68,%ymm5,%ymm1
vpshufd	  $238,%ymm5,%ymm4
vpaddd    hh_p3d,%ymm1,%ymm1
vpxor     hh_xor,%ymm4,%ymm4
vpaddd    %ymm1,%ymm4,%ymm5

vpshufd	  $68,%ymm6,%ymm1
vpshufd	  $238,%ymm6,%ymm4
vpaddd    hh_p3d,%ymm1,%ymm1
vpxor     hh_xor,%ymm4,%ymm4
vpaddd    %ymm1,%ymm4,%ymm6

// Pack-D2N
vpsrlq    $32,%ymm0,%ymm3
vpsrlq    $32,%ymm12,%ymm13
vpsrlq    $32,%ymm7,%ymm9
vpsrlq    $32,%ymm5,%ymm14
vpsrlq    $32,%ymm6,%ymm8

// Sqr
vmovdqa   %ymm12,384(%rsp)
vmovdqa   %ymm13,416(%rsp)
vmovdqa   %ymm7, 448(%rsp)
vmovdqa   %ymm9, 480(%rsp)
vmovdqa   %ymm5, 512(%rsp)
vmovdqa   %ymm14,544(%rsp)
vmovdqa   %ymm6, 576(%rsp)
vmovdqa   %ymm8, 608(%rsp)

vpmuludq  vec19,%ymm5,%ymm2
vpmuludq  vec19,%ymm6,%ymm6
vpmuludq  vec38,%ymm9,%ymm1
vpmuludq  vec38,%ymm14,%ymm4
vpmuludq  vec38,%ymm8,%ymm8

vpaddq    %ymm0,%ymm0,%ymm10
vpaddq    %ymm3,%ymm3,%ymm11
vpaddq    %ymm12,%ymm12,%ymm12
vpaddq    %ymm13,%ymm13,%ymm13
vpaddq    %ymm7,%ymm7,%ymm7
vpaddq    %ymm9,%ymm9,%ymm9
vpaddq    %ymm5,%ymm5,%ymm5
vpaddq    %ymm14,%ymm14,%ymm14

vpmuludq  %ymm0,%ymm0,%ymm0
vpmuludq  %ymm11,%ymm8,%ymm15
vpaddq    %ymm15,%ymm0,%ymm0
vpmuludq  %ymm12,%ymm6,%ymm15
vpaddq    %ymm15,%ymm0,%ymm0
vpmuludq  %ymm13,%ymm4,%ymm15
vpaddq    %ymm15,%ymm0,%ymm0
vpmuludq  %ymm7,%ymm2,%ymm15
vpaddq    %ymm15,%ymm0,%ymm0
vpmuludq  480(%rsp),%ymm1,%ymm15
vpaddq    %ymm15,%ymm0,%ymm0

vpmuludq  512(%rsp),%ymm1,%ymm1
vpmuludq  %ymm3,%ymm10,%ymm15
vpaddq    %ymm15,%ymm1,%ymm1
vpmuludq  384(%rsp),%ymm8,%ymm15
vpaddq    %ymm15,%ymm1,%ymm1
vpmuludq  %ymm13,%ymm6,%ymm15
vpaddq    %ymm15,%ymm1,%ymm1
vpmuludq  448(%rsp),%ymm4,%ymm15
vpaddq    %ymm15,%ymm1,%ymm1

vpmuludq  512(%rsp),%ymm2,%ymm2
vpmuludq  384(%rsp),%ymm10,%ymm15
vpaddq    %ymm15,%ymm2,%ymm2
vpmuludq  %ymm3,%ymm11,%ymm15
vpaddq    %ymm15,%ymm2,%ymm2
vpmuludq  %ymm13,%ymm8,%ymm15
vpaddq    %ymm15,%ymm2,%ymm2
vpmuludq  %ymm7,%ymm6,%ymm15
vpaddq    %ymm15,%ymm2,%ymm2
vpmuludq  %ymm9,%ymm4,%ymm15
vpaddq    %ymm15,%ymm2,%ymm2

vpmuludq  416(%rsp),%ymm10,%ymm3
vpmuludq  384(%rsp),%ymm11,%ymm15
vpaddq    %ymm15,%ymm3,%ymm3
vpmuludq  448(%rsp),%ymm8,%ymm15
vpaddq    %ymm15,%ymm3,%ymm3
vpmuludq  %ymm9,%ymm6,%ymm15
vpaddq    %ymm15,%ymm3,%ymm3
vpmuludq  512(%rsp),%ymm4,%ymm15
vpaddq    %ymm15,%ymm3,%ymm3

vpmuludq  544(%rsp),%ymm4,%ymm4
vpmuludq  448(%rsp),%ymm10,%ymm15
vpaddq    %ymm15,%ymm4,%ymm4
vpmuludq  %ymm11,%ymm13,%ymm15
vpaddq    %ymm15,%ymm4,%ymm4
vmovdqa   384(%rsp),%ymm15
vpmuludq  %ymm15,%ymm15,%ymm15
vpaddq    %ymm15,%ymm4,%ymm4
vpmuludq  %ymm9,%ymm8,%ymm15
vpaddq    %ymm15,%ymm4,%ymm4
vpmuludq  %ymm5,%ymm6,%ymm15
vpaddq    %ymm15,%ymm4,%ymm4

vpmuludq  480(%rsp),%ymm10,%ymm5
vpmuludq  448(%rsp),%ymm11,%ymm15
vpaddq    %ymm15,%ymm5,%ymm5
vpmuludq  416(%rsp),%ymm12,%ymm15
vpaddq    %ymm15,%ymm5,%ymm5
vpmuludq  512(%rsp),%ymm8,%ymm15
vpaddq    %ymm15,%ymm5,%ymm5
vpmuludq  %ymm6,%ymm14,%ymm15
vpaddq    %ymm15,%ymm5,%ymm5

vpmuludq  576(%rsp),%ymm6,%ymm6
vpmuludq  512(%rsp),%ymm10,%ymm15
vpaddq    %ymm15,%ymm6,%ymm6
vpmuludq  %ymm11,%ymm9,%ymm15
vpaddq    %ymm15,%ymm6,%ymm6
vpmuludq  448(%rsp),%ymm12,%ymm15
vpaddq    %ymm15,%ymm6,%ymm6
vpmuludq  416(%rsp),%ymm13,%ymm15
vpaddq    %ymm15,%ymm6,%ymm6
vpmuludq  %ymm14,%ymm8,%ymm15
vpaddq    %ymm15,%ymm6,%ymm6

vpmuludq  544(%rsp),%ymm10,%ymm7
vpmuludq  512(%rsp),%ymm11,%ymm15
vpaddq    %ymm15,%ymm7,%ymm7
vpmuludq  480(%rsp),%ymm12,%ymm15
vpaddq    %ymm15,%ymm7,%ymm7
vpmuludq  448(%rsp),%ymm13,%ymm15
vpaddq    %ymm15,%ymm7,%ymm7
vpmuludq  576(%rsp),%ymm8,%ymm15
vpaddq    %ymm15,%ymm7,%ymm7

vpmuludq  608(%rsp),%ymm8,%ymm8
vpmuludq  576(%rsp),%ymm10,%ymm15
vpaddq    %ymm15,%ymm8,%ymm8
vpmuludq  %ymm11,%ymm14,%ymm15
vpaddq    %ymm15,%ymm8,%ymm8
vpmuludq  512(%rsp),%ymm12,%ymm15
vpaddq    %ymm15,%ymm8,%ymm8
vpmuludq  %ymm13,%ymm9,%ymm15
vpaddq    %ymm15,%ymm8,%ymm8
vmovdqa   448(%rsp),%ymm15
vpmuludq  %ymm15,%ymm15,%ymm15
vpaddq    %ymm15,%ymm8,%ymm8

vpmuludq  448(%rsp),%ymm9,%ymm9
vpmuludq  608(%rsp),%ymm10,%ymm15
vpaddq    %ymm15,%ymm9,%ymm9
vpmuludq  576(%rsp),%ymm11,%ymm15
vpaddq    %ymm15,%ymm9,%ymm9
vpmuludq  544(%rsp),%ymm12,%ymm15
vpaddq    %ymm15,%ymm9,%ymm9
vpmuludq  512(%rsp),%ymm13,%ymm15
vpaddq    %ymm15,%ymm9,%ymm9

vpsrlq    $25,%ymm5,%ymm10
vpaddq    %ymm10,%ymm6,%ymm6
vpand     vecmask25,%ymm5,%ymm5

vpsrlq    $26,%ymm0,%ymm10
vpaddq    %ymm10,%ymm1,%ymm1
vpand     vecmask26,%ymm0,%ymm0

vpsrlq    $26,%ymm6,%ymm10
vpaddq    %ymm10,%ymm7,%ymm7
vpand     vecmask26,%ymm6,%ymm6

vpsrlq    $25,%ymm1,%ymm10
vpaddq    %ymm10,%ymm2,%ymm2
vpand     vecmask25,%ymm1,%ymm1

vpsrlq    $25,%ymm7,%ymm10
vpaddq    %ymm10,%ymm8,%ymm8
vpand     vecmask25,%ymm7,%ymm7

vpsrlq    $26,%ymm2,%ymm10
vpaddq    %ymm10,%ymm3,%ymm3
vpand     vecmask26,%ymm2,%ymm2

vpsrlq    $26,%ymm8,%ymm10
vpaddq    %ymm10,%ymm9,%ymm9
vpand     vecmask26,%ymm8,%ymm8

vpsrlq    $25,%ymm3,%ymm10
vpaddq    %ymm10,%ymm4,%ymm4
vpand     vecmask25,%ymm3,%ymm3

vpsrlq    $25,%ymm9,%ymm10
vpaddq    %ymm10,%ymm0,%ymm0
vpsllq    $1,%ymm10,%ymm10
vpaddq    %ymm10,%ymm0,%ymm0
vpsllq    $3,%ymm10,%ymm10
vpaddq    %ymm10,%ymm0,%ymm0
vpand     vecmask25,%ymm9,%ymm9

vpsrlq    $26,%ymm4,%ymm10
vpaddq    %ymm10,%ymm5,%ymm5
vpand     vecmask26,%ymm4,%ymm4

vpsrlq    $26,%ymm0,%ymm10
vpaddq    %ymm10,%ymm1,%ymm1
vpand     vecmask26,%ymm0,%ymm0

vpsrlq    $25,%ymm5,%ymm10
vpaddq    %ymm10,%ymm6,%ymm6
vpand     vecmask25,%ymm5,%ymm5

// MulC
vpmuludq  vec_c2,%ymm0,%ymm0
vpmuludq  vec_c2,%ymm1,%ymm11
vpmuludq  vec_c2,%ymm2,%ymm2
vpmuludq  vec_c2,%ymm3,%ymm12
vpmuludq  vec_c2,%ymm4,%ymm4
vpmuludq  vec_c2,%ymm5,%ymm13
vpmuludq  vec_c2,%ymm6,%ymm6
vpmuludq  vec_c2,%ymm7,%ymm14
vpmuludq  vec_c2,%ymm8,%ymm8
vpmuludq  vec_c2,%ymm9,%ymm15

vpsrlq    $25,%ymm13,%ymm10
vpaddq    %ymm10,%ymm6,%ymm6
vpand     vecmask25,%ymm13,%ymm13

vpsrlq    $26,%ymm0,%ymm10
vpaddq    %ymm10,%ymm11,%ymm11
vpand     vecmask26,%ymm0,%ymm0

vpsrlq    $26,%ymm6,%ymm10
vpaddq    %ymm10,%ymm14,%ymm14
vpand     vecmask26,%ymm6,%ymm6

vpsrlq    $25,%ymm11,%ymm10
vpaddq    %ymm10,%ymm2,%ymm2
vpand     vecmask25,%ymm11,%ymm11

vpsrlq    $25,%ymm14,%ymm10
vpaddq    %ymm10,%ymm8,%ymm8
vpand     vecmask25,%ymm14,%ymm14

vpsrlq    $26,%ymm2,%ymm10
vpaddq    %ymm10,%ymm12,%ymm12
vpand     vecmask26,%ymm2,%ymm2

vpsrlq    $26,%ymm8,%ymm10
vpaddq    %ymm10,%ymm15,%ymm15
vpand     vecmask26,%ymm8,%ymm8

vpsrlq    $25,%ymm12,%ymm10
vpaddq    %ymm10,%ymm4,%ymm4
vpand     vecmask25,%ymm12,%ymm12

vpsrlq    $25,%ymm15,%ymm10
vpmuludq  vec19,%ymm10,%ymm10
vpaddq    %ymm10,%ymm0,%ymm0
vpand     vecmask25,%ymm15,%ymm15

vpsrlq    $26,%ymm4,%ymm10
vpaddq    %ymm10,%ymm13,%ymm13
vpand     vecmask26,%ymm4,%ymm4

// Initialize-P
movdqa    16(%rsi),%xmm0
movdqa    48(%rsi),%xmm11
movdqa    80(%rsi),%xmm2
movdqa    112(%rsi),%xmm12
movdqa    144(%rsi),%xmm4
movdqa    176(%rsi),%xmm13
movdqa    208(%rsi),%xmm6
movdqa    240(%rsi),%xmm14
movdqa    272(%rsi),%xmm8
movdqa    304(%rsi),%xmm15

movq      $31,%r15
movq	  $5,%rcx

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
vpsllq    $32,%ymm11,%ymm11
vpor      %ymm11,%ymm0,%ymm0
vpsllq    $32,%ymm12,%ymm12
vpor      %ymm12,%ymm2,%ymm2
vpsllq    $32,%ymm13,%ymm13
vpor      %ymm13,%ymm4,%ymm4
vpsllq    $32,%ymm14,%ymm14
vpor      %ymm14,%ymm6,%ymm6
vpsllq    $32,%ymm15,%ymm15
vpor      %ymm15,%ymm8,%ymm8

// Dense-HH
vpshufd	  $68,%ymm0,%ymm1
vpshufd	  $238,%ymm0,%ymm3
vpaddd    hh_p1d,%ymm1,%ymm1
vpxor     hh_xor,%ymm3,%ymm3
vpaddd    %ymm1,%ymm3,%ymm0

vpshufd	  $68,%ymm2,%ymm1
vpshufd	  $238,%ymm2,%ymm3
vpaddd    hh_p3d,%ymm1,%ymm1
vpxor     hh_xor,%ymm3,%ymm3
vpaddd    %ymm1,%ymm3,%ymm2

vpshufd	  $68,%ymm4,%ymm1
vpshufd	  $238,%ymm4,%ymm3
vpaddd    hh_p3d,%ymm1,%ymm1
vpxor     hh_xor,%ymm3,%ymm3
vpaddd    %ymm1,%ymm3,%ymm4

vpshufd	  $68,%ymm6,%ymm1
vpshufd	  $238,%ymm6,%ymm3
vpaddd    hh_p3d,%ymm1,%ymm1
vpxor     hh_xor,%ymm3,%ymm3
vpaddd    %ymm1,%ymm3,%ymm6

vpshufd	  $68,%ymm8,%ymm1
vpshufd	  $238,%ymm8,%ymm3
vpaddd    hh_p3d,%ymm1,%ymm1
vpxor     hh_xor,%ymm3,%ymm3
vpaddd    %ymm1,%ymm3,%ymm8

// Pack-D2N
vpsrlq    $32,%ymm0,%ymm11
vpsrlq    $32,%ymm2,%ymm12
vpsrlq    $32,%ymm4,%ymm13
vpsrlq    $32,%ymm6,%ymm14
vpsrlq    $32,%ymm8,%ymm15

vmovdqa   %ymm0, 64(%rsp)
vmovdqa   %ymm11,96(%rsp)
vmovdqa   %ymm2, 128(%rsp)
vmovdqa   %ymm12,160(%rsp)
vmovdqa   %ymm4, 192(%rsp)
vmovdqa   %ymm13,224(%rsp)
vmovdqa   %ymm6, 256(%rsp)
vmovdqa   %ymm14,288(%rsp)
vmovdqa   %ymm8, 320(%rsp)
vmovdqa   %ymm15,352(%rsp)

// Dense-CDup
vpbroadcastd 56(%rsp),%ymm10
vpaddd	  dup_c,%ymm10,%ymm10

vpermd	  %ymm0,%ymm10,%ymm0
vpermd	  %ymm2,%ymm10,%ymm2
vpermd	  %ymm4,%ymm10,%ymm4
vpermd	  %ymm6,%ymm10,%ymm6
vpermd	  %ymm8,%ymm10,%ymm8

// Pack-D2N
vpsrlq    $32,%ymm0,%ymm1
vpsrlq    $32,%ymm2,%ymm3
vpsrlq    $32,%ymm4,%ymm5
vpsrlq    $32,%ymm6,%ymm7
vpsrlq    $32,%ymm8,%ymm9

// Mul
vmovdqa   %ymm0,384(%rsp)
vmovdqa   %ymm1,416(%rsp)
vmovdqa   %ymm2,448(%rsp)
vmovdqa   %ymm3,480(%rsp)
vmovdqa   %ymm4,512(%rsp)
vmovdqa   %ymm5,544(%rsp)
vmovdqa   %ymm6,576(%rsp)
vmovdqa   %ymm7,608(%rsp)
vmovdqa   %ymm8,640(%rsp)
vmovdqa   %ymm9,672(%rsp)

vpaddq    %ymm11,%ymm11,%ymm11
vpaddq    %ymm12,%ymm12,%ymm12
vpaddq    %ymm13,%ymm13,%ymm13
vpaddq    %ymm14,%ymm14,%ymm14
vpaddq    %ymm15,%ymm15,%ymm15

vpmuludq  vec19,%ymm1,%ymm1
vpmuludq  vec19,%ymm2,%ymm2
vpmuludq  vec19,%ymm3,%ymm3
vpmuludq  vec19,%ymm4,%ymm4
vpmuludq  vec19,%ymm5,%ymm5
vpmuludq  vec19,%ymm6,%ymm6
vpmuludq  vec19,%ymm7,%ymm7
vpmuludq  vec19,%ymm8,%ymm8
vpmuludq  vec19,%ymm9,%ymm9

vpmuludq  %ymm15,%ymm1,%ymm0
vpmuludq  %ymm14,%ymm3,%ymm10
vpaddq    %ymm10,%ymm0,%ymm0
vpmuludq  %ymm13,%ymm5,%ymm10
vpaddq    %ymm10,%ymm0,%ymm0
vpmuludq  %ymm12,%ymm7,%ymm10
vpaddq    %ymm10,%ymm0,%ymm0
vpmuludq  %ymm11,%ymm9,%ymm10
vpaddq    %ymm10,%ymm0,%ymm0
vpmuludq  320(%rsp),%ymm2,%ymm10
vpaddq    %ymm10,%ymm0,%ymm0
vpmuludq  256(%rsp),%ymm4,%ymm10
vpaddq    %ymm10,%ymm0,%ymm0
vpmuludq  192(%rsp),%ymm6,%ymm10
vpaddq    %ymm10,%ymm0,%ymm0
vpmuludq  128(%rsp),%ymm8,%ymm10
vpaddq    %ymm10,%ymm0,%ymm0

vpmuludq  352(%rsp),%ymm2,%ymm1
vpmuludq  320(%rsp),%ymm3,%ymm10
vpaddq    %ymm10,%ymm1,%ymm1
vpmuludq  288(%rsp),%ymm4,%ymm10
vpaddq    %ymm10,%ymm1,%ymm1
vpmuludq  256(%rsp),%ymm5,%ymm10
vpaddq    %ymm10,%ymm1,%ymm1
vpmuludq  224(%rsp),%ymm6,%ymm10
vpaddq    %ymm10,%ymm1,%ymm1
vpmuludq  192(%rsp),%ymm7,%ymm10
vpaddq    %ymm10,%ymm1,%ymm1
vpmuludq  160(%rsp),%ymm8,%ymm10
vpaddq    %ymm10,%ymm1,%ymm1
vpmuludq  128(%rsp),%ymm9,%ymm10
vpaddq    %ymm10,%ymm1,%ymm1

vpmuludq  %ymm15,%ymm3,%ymm2
vpmuludq  %ymm14,%ymm5,%ymm10
vpaddq    %ymm10,%ymm2,%ymm2
vpmuludq  %ymm13,%ymm7,%ymm10
vpaddq    %ymm10,%ymm2,%ymm2
vpmuludq  %ymm12,%ymm9,%ymm10
vpaddq    %ymm10,%ymm2,%ymm2
vpmuludq  320(%rsp),%ymm4,%ymm10
vpaddq    %ymm10,%ymm2,%ymm2
vpmuludq  256(%rsp),%ymm6,%ymm10
vpaddq    %ymm10,%ymm2,%ymm2
vpmuludq  192(%rsp),%ymm8,%ymm10
vpaddq    %ymm10,%ymm2,%ymm2
vpmuludq  416(%rsp),%ymm11,%ymm10
vpaddq    %ymm10,%ymm2,%ymm2

vpmuludq  352(%rsp),%ymm4,%ymm3
vpmuludq  320(%rsp),%ymm5,%ymm10
vpaddq    %ymm10,%ymm3,%ymm3
vpmuludq  288(%rsp),%ymm6,%ymm10
vpaddq    %ymm10,%ymm3,%ymm3
vpmuludq  256(%rsp),%ymm7,%ymm10
vpaddq    %ymm10,%ymm3,%ymm3
vpmuludq  224(%rsp),%ymm8,%ymm10
vpaddq    %ymm10,%ymm3,%ymm3
vpmuludq  192(%rsp),%ymm9,%ymm10
vpaddq    %ymm10,%ymm3,%ymm3

vpmuludq  %ymm15,%ymm5,%ymm4
vpmuludq  %ymm14,%ymm7,%ymm10
vpaddq    %ymm10,%ymm4,%ymm4
vpmuludq  %ymm13,%ymm9,%ymm10
vpaddq    %ymm10,%ymm4,%ymm4
vpmuludq  320(%rsp),%ymm6,%ymm10
vpaddq    %ymm10,%ymm4,%ymm4
vpmuludq  256(%rsp),%ymm8,%ymm10
vpaddq    %ymm10,%ymm4,%ymm4
vpmuludq  416(%rsp),%ymm12,%ymm10
vpaddq    %ymm10,%ymm4,%ymm4
vpmuludq  480(%rsp),%ymm11,%ymm10
vpaddq    %ymm10,%ymm4,%ymm4

vpmuludq  352(%rsp),%ymm6,%ymm5
vpmuludq  320(%rsp),%ymm7,%ymm10
vpaddq    %ymm10,%ymm5,%ymm5
vpmuludq  288(%rsp),%ymm8,%ymm10
vpaddq    %ymm10,%ymm5,%ymm5
vpmuludq  256(%rsp),%ymm9,%ymm10
vpaddq    %ymm10,%ymm5,%ymm5

vpmuludq  %ymm15,%ymm7,%ymm6
vpmuludq  %ymm14,%ymm9,%ymm10
vpaddq    %ymm10,%ymm6,%ymm6
vpmuludq  320(%rsp),%ymm8,%ymm10
vpaddq    %ymm10,%ymm6,%ymm6
vpmuludq  416(%rsp),%ymm13,%ymm10
vpaddq    %ymm10,%ymm6,%ymm6
vpmuludq  480(%rsp),%ymm12,%ymm10
vpaddq    %ymm10,%ymm6,%ymm6
vpmuludq  544(%rsp),%ymm11,%ymm10
vpaddq    %ymm10,%ymm6,%ymm6

vpmuludq  352(%rsp),%ymm8,%ymm7
vpmuludq  320(%rsp),%ymm9,%ymm10
vpaddq    %ymm10,%ymm7,%ymm7

vpmuludq  %ymm15,%ymm9,%ymm8
vpmuludq  416(%rsp),%ymm14,%ymm10
vpaddq    %ymm10,%ymm8,%ymm8
vpmuludq  480(%rsp),%ymm13,%ymm10
vpaddq    %ymm10,%ymm8,%ymm8
vpmuludq  544(%rsp),%ymm12,%ymm10
vpaddq    %ymm10,%ymm8,%ymm8
vpmuludq  608(%rsp),%ymm11,%ymm10
vpaddq    %ymm10,%ymm8,%ymm8

vmovdqa   64(%rsp),%ymm11
vmovdqa   96(%rsp),%ymm12
vmovdqa   128(%rsp),%ymm13
vmovdqa   160(%rsp),%ymm14
vmovdqa   192(%rsp),%ymm15
vmovdqa   224(%rsp),%ymm9

vpmuludq  384(%rsp),%ymm11,%ymm10
vpaddq    %ymm10,%ymm0,%ymm0

vpmuludq  448(%rsp),%ymm11,%ymm10
vpaddq    %ymm10,%ymm2,%ymm2
vpmuludq  384(%rsp),%ymm13,%ymm10
vpaddq    %ymm10,%ymm2,%ymm2

vpmuludq  480(%rsp),%ymm11,%ymm10
vpaddq    %ymm10,%ymm3,%ymm3
vpmuludq  448(%rsp),%ymm12,%ymm10
vpaddq    %ymm10,%ymm3,%ymm3
vpmuludq  416(%rsp),%ymm13,%ymm10
vpaddq    %ymm10,%ymm3,%ymm3
vpmuludq  384(%rsp),%ymm14,%ymm10
vpaddq    %ymm10,%ymm3,%ymm3

vpmuludq  416(%rsp),%ymm11,%ymm10
vpaddq    %ymm10,%ymm1,%ymm1
vpmuludq  384(%rsp),%ymm12,%ymm10
vpaddq    %ymm10,%ymm1,%ymm1

vpmuludq  512(%rsp),%ymm11,%ymm10
vpaddq    %ymm10,%ymm4,%ymm4
vpmuludq  448(%rsp),%ymm13,%ymm10
vpaddq    %ymm10,%ymm4,%ymm4
vpmuludq  384(%rsp),%ymm15,%ymm10
vpaddq    %ymm10,%ymm4,%ymm4

vpmuludq  544(%rsp),%ymm11,%ymm10
vpaddq    %ymm10,%ymm5,%ymm5
vpmuludq  512(%rsp),%ymm12,%ymm10
vpaddq    %ymm10,%ymm5,%ymm5
vpmuludq  480(%rsp),%ymm13,%ymm10
vpaddq    %ymm10,%ymm5,%ymm5
vpmuludq  448(%rsp),%ymm14,%ymm10
vpaddq    %ymm10,%ymm5,%ymm5
vpmuludq  416(%rsp),%ymm15,%ymm10
vpaddq    %ymm10,%ymm5,%ymm5
vpmuludq  384(%rsp),%ymm9,%ymm10
vpaddq    %ymm10,%ymm5,%ymm5

vpmuludq  576(%rsp),%ymm11,%ymm10
vpaddq    %ymm10,%ymm6,%ymm6
vpmuludq  512(%rsp),%ymm13,%ymm10
vpaddq    %ymm10,%ymm6,%ymm6
vpmuludq  448(%rsp),%ymm15,%ymm10
vpaddq    %ymm10,%ymm6,%ymm6

vpmuludq  608(%rsp),%ymm11,%ymm10
vpaddq    %ymm10,%ymm7,%ymm7
vpmuludq  576(%rsp),%ymm12,%ymm10
vpaddq    %ymm10,%ymm7,%ymm7
vpmuludq  544(%rsp),%ymm13,%ymm10
vpaddq    %ymm10,%ymm7,%ymm7
vpmuludq  512(%rsp),%ymm14,%ymm10
vpaddq    %ymm10,%ymm7,%ymm7
vpmuludq  480(%rsp),%ymm15,%ymm10
vpaddq    %ymm10,%ymm7,%ymm7
vpmuludq  448(%rsp),%ymm9,%ymm10
vpaddq    %ymm10,%ymm7,%ymm7

vpmuludq  640(%rsp),%ymm11,%ymm10
vpaddq    %ymm10,%ymm8,%ymm8
vpmuludq  576(%rsp),%ymm13,%ymm10
vpaddq    %ymm10,%ymm8,%ymm8
vpmuludq  512(%rsp),%ymm15,%ymm10
vpaddq    %ymm10,%ymm8,%ymm8

vpmuludq  512(%rsp),%ymm9,%ymm9
vpmuludq  672(%rsp),%ymm11,%ymm10
vpaddq    %ymm10,%ymm9,%ymm9
vpmuludq  640(%rsp),%ymm12,%ymm10
vpaddq    %ymm10,%ymm9,%ymm9
vpmuludq  608(%rsp),%ymm13,%ymm10
vpaddq    %ymm10,%ymm9,%ymm9
vpmuludq  576(%rsp),%ymm14,%ymm10
vpaddq    %ymm10,%ymm9,%ymm9
vpmuludq  544(%rsp),%ymm15,%ymm10
vpaddq    %ymm10,%ymm9,%ymm9

vmovdqa   256(%rsp),%ymm11
vmovdqa   288(%rsp),%ymm12
vmovdqa   320(%rsp),%ymm13
vmovdqa   352(%rsp),%ymm14

vpmuludq  384(%rsp),%ymm11,%ymm10
vpaddq    %ymm10,%ymm6,%ymm6

vpmuludq  416(%rsp),%ymm11,%ymm10
vpaddq    %ymm10,%ymm7,%ymm7
vpmuludq  384(%rsp),%ymm12,%ymm10
vpaddq    %ymm10,%ymm7,%ymm7

vpmuludq  448(%rsp),%ymm11,%ymm10
vpaddq    %ymm10,%ymm8,%ymm8
vpmuludq  384(%rsp),%ymm13,%ymm10
vpaddq    %ymm10,%ymm8,%ymm8

vpmuludq  480(%rsp),%ymm11,%ymm10
vpaddq    %ymm10,%ymm9,%ymm9
vpmuludq  448(%rsp),%ymm12,%ymm10
vpaddq    %ymm10,%ymm9,%ymm9
vpmuludq  416(%rsp),%ymm13,%ymm10
vpaddq    %ymm10,%ymm9,%ymm9
vpmuludq  384(%rsp),%ymm14,%ymm10
vpaddq    %ymm10,%ymm9,%ymm9

vpsrlq    $25,%ymm5,%ymm10
vpaddq    %ymm10,%ymm6,%ymm6
vpand     vecmask25,%ymm5,%ymm5

vpsrlq    $26,%ymm0,%ymm10
vpaddq    %ymm10,%ymm1,%ymm1
vpand     vecmask26,%ymm0,%ymm0

vpsrlq    $26,%ymm6,%ymm10
vpaddq    %ymm10,%ymm7,%ymm7
vpand     vecmask26,%ymm6,%ymm6

vpsrlq    $25,%ymm1,%ymm10
vpaddq    %ymm10,%ymm2,%ymm2
vpand     vecmask25,%ymm1,%ymm1

vpsrlq    $25,%ymm7,%ymm10
vpaddq    %ymm10,%ymm8,%ymm8
vpand     vecmask25,%ymm7,%ymm7

vpsrlq    $26,%ymm2,%ymm10
vpaddq    %ymm10,%ymm3,%ymm3
vpand     vecmask26,%ymm2,%ymm2

vpsrlq    $26,%ymm8,%ymm10
vpaddq    %ymm10,%ymm9,%ymm9
vpand     vecmask26,%ymm8,%ymm8

vpsrlq    $25,%ymm3,%ymm10
vpaddq    %ymm10,%ymm4,%ymm4
vpand     vecmask25,%ymm3,%ymm3

vpsrlq    $25,%ymm9,%ymm10
vpaddq    %ymm10,%ymm0,%ymm0
vpsllq    $1,%ymm10,%ymm10
vpaddq    %ymm10,%ymm0,%ymm0
vpsllq    $3,%ymm10,%ymm10
vpaddq    %ymm10,%ymm0,%ymm0
vpand     vecmask25,%ymm9,%ymm11

vpsrlq    $26,%ymm4,%ymm10
vpaddq    %ymm10,%ymm5,%ymm5
vpand     vecmask26,%ymm4,%ymm4

vpsrlq    $26,%ymm0,%ymm10
vpaddq    %ymm10,%ymm1,%ymm1
vpand     vecmask26,%ymm0,%ymm0

vpsrlq    $25,%ymm5,%ymm10
vpaddq    %ymm10,%ymm6,%ymm6
vpand     vecmask25,%ymm5,%ymm5

// MulC
vpmuludq  vec_c1,%ymm5,%ymm9
vpmuludq  vec_c1,%ymm6,%ymm5
vpmuludq  vec_c1,%ymm8,%ymm6
vpmuludq  vec_c1,%ymm11,%ymm8
vpmuludq  vec_c1,%ymm7,%ymm14
vpmuludq  vec_c1,%ymm4,%ymm7
vpmuludq  vec_c1,%ymm3,%ymm13
vpmuludq  vec_c1,%ymm2,%ymm12
vpmuludq  vec_c1,%ymm1,%ymm3
vpmuludq  vec_c1,%ymm0,%ymm0

vpsrlq    $25,%ymm9,%ymm10
vpaddq    %ymm10,%ymm5,%ymm5
vpand     vecmask25,%ymm9,%ymm9

vpsrlq    $26,%ymm0,%ymm10
vpaddq    %ymm10,%ymm3,%ymm3
vpand     vecmask26,%ymm0,%ymm0

vpsrlq    $26,%ymm5,%ymm10
vpaddq    %ymm10,%ymm14,%ymm14
vpand     vecmask26,%ymm5,%ymm5

vpsrlq    $25,%ymm3,%ymm10
vpaddq    %ymm10,%ymm12,%ymm12
vpand     vecmask25,%ymm3,%ymm3

vpsrlq    $25,%ymm14,%ymm10
vpaddq    %ymm10,%ymm6,%ymm6
vpand     vecmask25,%ymm14,%ymm14

vpsrlq    $26,%ymm12,%ymm10
vpaddq    %ymm10,%ymm13,%ymm13
vpand     vecmask26,%ymm12,%ymm12

vpsrlq    $26,%ymm6,%ymm10
vpaddq    %ymm10,%ymm8,%ymm8
vpand     vecmask26,%ymm6,%ymm6

vpsrlq    $25,%ymm13,%ymm10
vpaddq    %ymm10,%ymm7,%ymm7
vpand     vecmask25,%ymm13,%ymm13

vpsrlq    $25,%ymm8,%ymm10
vpmuludq  vec19,%ymm10,%ymm10
vpaddq    %ymm10,%ymm0,%ymm0
vpand     vecmask25,%ymm8,%ymm8

vpsrlq    $26,%ymm7,%ymm10
vpaddq    %ymm10,%ymm9,%ymm9
vpand     vecmask26,%ymm7,%ymm7

// Pack-N2D
vpsllq    $32,%ymm3,%ymm3
vpor      %ymm3,%ymm0,%ymm0
vpsllq    $32,%ymm13,%ymm13
vpor      %ymm13,%ymm12,%ymm12
vpsllq    $32,%ymm9,%ymm9
vpor      %ymm9,%ymm7,%ymm7
vpsllq    $32,%ymm14,%ymm14
vpor      %ymm14,%ymm5,%ymm5
vpsllq    $32,%ymm8,%ymm8
vpor      %ymm8,%ymm6,%ymm6

// Dense-HH
vpshufd	  $68,%ymm0,%ymm1
vpshufd	  $238,%ymm0,%ymm4
vpaddd    hh_p1d,%ymm1,%ymm1
vpxor     hh_xor,%ymm4,%ymm4
vpaddd    %ymm1,%ymm4,%ymm0

vpshufd	  $68,%ymm12,%ymm1
vpshufd	  $238,%ymm12,%ymm4
vpaddd    hh_p3d,%ymm1,%ymm1
vpxor     hh_xor,%ymm4,%ymm4
vpaddd    %ymm1,%ymm4,%ymm12

vpshufd	  $68,%ymm7,%ymm1
vpshufd	  $238,%ymm7,%ymm4
vpaddd    hh_p3d,%ymm1,%ymm1
vpxor     hh_xor,%ymm4,%ymm4
vpaddd    %ymm1,%ymm4,%ymm7

vpshufd	  $68,%ymm5,%ymm1
vpshufd	  $238,%ymm5,%ymm4
vpaddd    hh_p3d,%ymm1,%ymm1
vpxor     hh_xor,%ymm4,%ymm4
vpaddd    %ymm1,%ymm4,%ymm5

vpshufd	  $68,%ymm6,%ymm1
vpshufd	  $238,%ymm6,%ymm4
vpaddd    hh_p3d,%ymm1,%ymm1
vpxor     hh_xor,%ymm4,%ymm4
vpaddd    %ymm1,%ymm4,%ymm6

// Pack-D2N
vpsrlq    $32,%ymm0,%ymm3
vpsrlq    $32,%ymm12,%ymm13
vpsrlq    $32,%ymm7,%ymm9
vpsrlq    $32,%ymm5,%ymm14
vpsrlq    $32,%ymm6,%ymm8

// Sqr
vmovdqa   %ymm12,128(%rsp)
vmovdqa   %ymm13,160(%rsp)
vmovdqa   %ymm7, 192(%rsp)
vmovdqa   %ymm9, 224(%rsp)
vmovdqa   %ymm5, 256(%rsp)
vmovdqa   %ymm14,288(%rsp)
vmovdqa   %ymm6, 320(%rsp)
vmovdqa   %ymm8, 352(%rsp)

vpmuludq  vec19,%ymm5,%ymm2
vpmuludq  vec19,%ymm6,%ymm6
vpmuludq  vec38,%ymm9,%ymm1
vpmuludq  vec38,%ymm14,%ymm4
vpmuludq  vec38,%ymm8,%ymm8

vpaddq    %ymm0,%ymm0,%ymm10
vpaddq    %ymm3,%ymm3,%ymm11
vpaddq    %ymm12,%ymm12,%ymm12
vpaddq    %ymm13,%ymm13,%ymm13
vpaddq    %ymm7,%ymm7,%ymm7
vpaddq    %ymm9,%ymm9,%ymm9
vpaddq    %ymm5,%ymm5,%ymm5
vpaddq    %ymm14,%ymm14,%ymm14

vpmuludq  %ymm0,%ymm0,%ymm0
vpmuludq  %ymm11,%ymm8,%ymm15
vpaddq    %ymm15,%ymm0,%ymm0
vpmuludq  %ymm12,%ymm6,%ymm15
vpaddq    %ymm15,%ymm0,%ymm0
vpmuludq  %ymm13,%ymm4,%ymm15
vpaddq    %ymm15,%ymm0,%ymm0
vpmuludq  %ymm7,%ymm2,%ymm15
vpaddq    %ymm15,%ymm0,%ymm0
vpmuludq  224(%rsp),%ymm1,%ymm15
vpaddq    %ymm15,%ymm0,%ymm0

vpmuludq  256(%rsp),%ymm1,%ymm1
vpmuludq  %ymm3,%ymm10,%ymm15
vpaddq    %ymm15,%ymm1,%ymm1
vpmuludq  128(%rsp),%ymm8,%ymm15
vpaddq    %ymm15,%ymm1,%ymm1
vpmuludq  %ymm13,%ymm6,%ymm15
vpaddq    %ymm15,%ymm1,%ymm1
vpmuludq  192(%rsp),%ymm4,%ymm15
vpaddq    %ymm15,%ymm1,%ymm1

vpmuludq  256(%rsp),%ymm2,%ymm2
vpmuludq  128(%rsp),%ymm10,%ymm15
vpaddq    %ymm15,%ymm2,%ymm2
vpmuludq  %ymm3,%ymm11,%ymm15
vpaddq    %ymm15,%ymm2,%ymm2
vpmuludq  %ymm13,%ymm8,%ymm15
vpaddq    %ymm15,%ymm2,%ymm2
vpmuludq  %ymm7,%ymm6,%ymm15
vpaddq    %ymm15,%ymm2,%ymm2
vpmuludq  %ymm9,%ymm4,%ymm15
vpaddq    %ymm15,%ymm2,%ymm2

vpmuludq  160(%rsp),%ymm10,%ymm3
vpmuludq  128(%rsp),%ymm11,%ymm15
vpaddq    %ymm15,%ymm3,%ymm3
vpmuludq  192(%rsp),%ymm8,%ymm15
vpaddq    %ymm15,%ymm3,%ymm3
vpmuludq  %ymm9,%ymm6,%ymm15
vpaddq    %ymm15,%ymm3,%ymm3
vpmuludq  256(%rsp),%ymm4,%ymm15
vpaddq    %ymm15,%ymm3,%ymm3

vpmuludq  288(%rsp),%ymm4,%ymm4
vpmuludq  192(%rsp),%ymm10,%ymm15
vpaddq    %ymm15,%ymm4,%ymm4
vpmuludq  %ymm11,%ymm13,%ymm15
vpaddq    %ymm15,%ymm4,%ymm4
vmovdqa   128(%rsp),%ymm15
vpmuludq  %ymm15,%ymm15,%ymm15
vpaddq    %ymm15,%ymm4,%ymm4
vpmuludq  %ymm9,%ymm8,%ymm15
vpaddq    %ymm15,%ymm4,%ymm4
vpmuludq  %ymm5,%ymm6,%ymm15
vpaddq    %ymm15,%ymm4,%ymm4

vpmuludq  224(%rsp),%ymm10,%ymm5
vpmuludq  192(%rsp),%ymm11,%ymm15
vpaddq    %ymm15,%ymm5,%ymm5
vpmuludq  160(%rsp),%ymm12,%ymm15
vpaddq    %ymm15,%ymm5,%ymm5
vpmuludq  256(%rsp),%ymm8,%ymm15
vpaddq    %ymm15,%ymm5,%ymm5
vpmuludq  %ymm6,%ymm14,%ymm15
vpaddq    %ymm15,%ymm5,%ymm5

vpmuludq  320(%rsp),%ymm6,%ymm6
vpmuludq  256(%rsp),%ymm10,%ymm15
vpaddq    %ymm15,%ymm6,%ymm6
vpmuludq  %ymm11,%ymm9,%ymm15
vpaddq    %ymm15,%ymm6,%ymm6
vpmuludq  192(%rsp),%ymm12,%ymm15
vpaddq    %ymm15,%ymm6,%ymm6
vpmuludq  160(%rsp),%ymm13,%ymm15
vpaddq    %ymm15,%ymm6,%ymm6
vpmuludq  %ymm14,%ymm8,%ymm15
vpaddq    %ymm15,%ymm6,%ymm6

vpmuludq  288(%rsp),%ymm10,%ymm7
vpmuludq  256(%rsp),%ymm11,%ymm15
vpaddq    %ymm15,%ymm7,%ymm7
vpmuludq  224(%rsp),%ymm12,%ymm15
vpaddq    %ymm15,%ymm7,%ymm7
vpmuludq  192(%rsp),%ymm13,%ymm15
vpaddq    %ymm15,%ymm7,%ymm7
vpmuludq  320(%rsp),%ymm8,%ymm15
vpaddq    %ymm15,%ymm7,%ymm7

vpmuludq  352(%rsp),%ymm8,%ymm8
vpmuludq  320(%rsp),%ymm10,%ymm15
vpaddq    %ymm15,%ymm8,%ymm8
vpmuludq  %ymm11,%ymm14,%ymm15
vpaddq    %ymm15,%ymm8,%ymm8
vpmuludq  256(%rsp),%ymm12,%ymm15
vpaddq    %ymm15,%ymm8,%ymm8
vpmuludq  %ymm13,%ymm9,%ymm15
vpaddq    %ymm15,%ymm8,%ymm8
vmovdqa   192(%rsp),%ymm15
vpmuludq  %ymm15,%ymm15,%ymm15
vpaddq    %ymm15,%ymm8,%ymm8

vpmuludq  192(%rsp),%ymm9,%ymm9
vpmuludq  352(%rsp),%ymm10,%ymm15
vpaddq    %ymm15,%ymm9,%ymm9
vpmuludq  320(%rsp),%ymm11,%ymm15
vpaddq    %ymm15,%ymm9,%ymm9
vpmuludq  288(%rsp),%ymm12,%ymm15
vpaddq    %ymm15,%ymm9,%ymm9
vpmuludq  256(%rsp),%ymm13,%ymm15
vpaddq    %ymm15,%ymm9,%ymm9

vpsrlq    $25,%ymm5,%ymm10
vpaddq    %ymm10,%ymm6,%ymm6
vpand     vecmask25,%ymm5,%ymm13

vpsrlq    $26,%ymm0,%ymm10
vpaddq    %ymm10,%ymm1,%ymm1
vpand     vecmask26,%ymm0,%ymm0

vpsrlq    $26,%ymm6,%ymm10
vpaddq    %ymm10,%ymm7,%ymm7
vpand     vecmask26,%ymm6,%ymm6

vpsrlq    $25,%ymm1,%ymm10
vpaddq    %ymm10,%ymm2,%ymm2
vpand     vecmask25,%ymm1,%ymm11

vpsrlq    $25,%ymm7,%ymm10
vpaddq    %ymm10,%ymm8,%ymm8
vpand     vecmask25,%ymm7,%ymm14

vpsrlq    $26,%ymm2,%ymm10
vpaddq    %ymm10,%ymm3,%ymm3
vpand     vecmask26,%ymm2,%ymm2

vpsrlq    $26,%ymm8,%ymm10
vpaddq    %ymm10,%ymm9,%ymm9
vpand     vecmask26,%ymm8,%ymm8

vpsrlq    $25,%ymm3,%ymm10
vpaddq    %ymm10,%ymm4,%ymm4
vpand     vecmask25,%ymm3,%ymm12

vpsrlq    $25,%ymm9,%ymm10
vpaddq    %ymm10,%ymm0,%ymm0
vpsllq    $1,%ymm10,%ymm10
vpaddq    %ymm10,%ymm0,%ymm0
vpsllq    $3,%ymm10,%ymm10
vpaddq    %ymm10,%ymm0,%ymm0
vpand     vecmask25,%ymm9,%ymm15

vpsrlq    $26,%ymm4,%ymm10
vpaddq    %ymm10,%ymm13,%ymm13
vpand     vecmask26,%ymm4,%ymm4

vpsrlq    $26,%ymm0,%ymm10
vpaddq    %ymm10,%ymm11,%ymm11
vpand     vecmask26,%ymm0,%ymm0

vpsrlq    $25,%ymm13,%ymm10
vpaddq    %ymm10,%ymm6,%ymm6
vpand     vecmask25,%ymm13,%ymm13

vmovdqa   %ymm0, 64(%rsp)
vmovdqa   %ymm11,96(%rsp)
vmovdqa   %ymm2, 128(%rsp)
vmovdqa   %ymm12,160(%rsp)
vmovdqa   %ymm4, 192(%rsp)
vmovdqa   %ymm13,224(%rsp)
vmovdqa   %ymm6, 256(%rsp)
vmovdqa   %ymm14,288(%rsp)
vmovdqa   %ymm8, 320(%rsp)
vmovdqa   %ymm15,352(%rsp)

// Dense-CSwap
vpbroadcastd 56(%rsp),%ymm10
vpaddd	  swap_c,%ymm10,%ymm10
vpand     swap_mask,%ymm10,%ymm10

vpermd	  320(%rsi),%ymm10,%ymm0
vpermd	  352(%rsi),%ymm10,%ymm2
vpermd	  384(%rsi),%ymm10,%ymm4
vpermd	  416(%rsi),%ymm10,%ymm6
vpermd	  448(%rsi),%ymm10,%ymm8

// Pack-D2N
vpsrlq    $32,%ymm0,%ymm1
vpsrlq    $32,%ymm2,%ymm3
vpsrlq    $32,%ymm4,%ymm5
vpsrlq    $32,%ymm6,%ymm7
vpsrlq    $32,%ymm8,%ymm9

// Mul
vmovdqa   %ymm0,384(%rsp)
vmovdqa   %ymm1,416(%rsp)
vmovdqa   %ymm2,448(%rsp)
vmovdqa   %ymm3,480(%rsp)
vmovdqa   %ymm4,512(%rsp)
vmovdqa   %ymm5,544(%rsp)
vmovdqa   %ymm6,576(%rsp)
vmovdqa   %ymm7,608(%rsp)
vmovdqa   %ymm8,640(%rsp)
vmovdqa   %ymm9,672(%rsp)

vpaddq    %ymm11,%ymm11,%ymm11
vpaddq    %ymm12,%ymm12,%ymm12
vpaddq    %ymm13,%ymm13,%ymm13
vpaddq    %ymm14,%ymm14,%ymm14
vpaddq    %ymm15,%ymm15,%ymm15

vpmuludq  vec19,%ymm1,%ymm1
vpmuludq  vec19,%ymm2,%ymm2
vpmuludq  vec19,%ymm3,%ymm3
vpmuludq  vec19,%ymm4,%ymm4
vpmuludq  vec19,%ymm5,%ymm5
vpmuludq  vec19,%ymm6,%ymm6
vpmuludq  vec19,%ymm7,%ymm7
vpmuludq  vec19,%ymm8,%ymm8
vpmuludq  vec19,%ymm9,%ymm9

vpmuludq  %ymm15,%ymm1,%ymm0
vpmuludq  %ymm14,%ymm3,%ymm10
vpaddq    %ymm10,%ymm0,%ymm0
vpmuludq  %ymm13,%ymm5,%ymm10
vpaddq    %ymm10,%ymm0,%ymm0
vpmuludq  %ymm12,%ymm7,%ymm10
vpaddq    %ymm10,%ymm0,%ymm0
vpmuludq  %ymm11,%ymm9,%ymm10
vpaddq    %ymm10,%ymm0,%ymm0
vpmuludq  320(%rsp),%ymm2,%ymm10
vpaddq    %ymm10,%ymm0,%ymm0
vpmuludq  256(%rsp),%ymm4,%ymm10
vpaddq    %ymm10,%ymm0,%ymm0
vpmuludq  192(%rsp),%ymm6,%ymm10
vpaddq    %ymm10,%ymm0,%ymm0
vpmuludq  128(%rsp),%ymm8,%ymm10
vpaddq    %ymm10,%ymm0,%ymm0

vpmuludq  352(%rsp),%ymm2,%ymm1
vpmuludq  320(%rsp),%ymm3,%ymm10
vpaddq    %ymm10,%ymm1,%ymm1
vpmuludq  288(%rsp),%ymm4,%ymm10
vpaddq    %ymm10,%ymm1,%ymm1
vpmuludq  256(%rsp),%ymm5,%ymm10
vpaddq    %ymm10,%ymm1,%ymm1
vpmuludq  224(%rsp),%ymm6,%ymm10
vpaddq    %ymm10,%ymm1,%ymm1
vpmuludq  192(%rsp),%ymm7,%ymm10
vpaddq    %ymm10,%ymm1,%ymm1
vpmuludq  160(%rsp),%ymm8,%ymm10
vpaddq    %ymm10,%ymm1,%ymm1
vpmuludq  128(%rsp),%ymm9,%ymm10
vpaddq    %ymm10,%ymm1,%ymm1

vpmuludq  %ymm15,%ymm3,%ymm2
vpmuludq  %ymm14,%ymm5,%ymm10
vpaddq    %ymm10,%ymm2,%ymm2
vpmuludq  %ymm13,%ymm7,%ymm10
vpaddq    %ymm10,%ymm2,%ymm2
vpmuludq  %ymm12,%ymm9,%ymm10
vpaddq    %ymm10,%ymm2,%ymm2
vpmuludq  320(%rsp),%ymm4,%ymm10
vpaddq    %ymm10,%ymm2,%ymm2
vpmuludq  256(%rsp),%ymm6,%ymm10
vpaddq    %ymm10,%ymm2,%ymm2
vpmuludq  192(%rsp),%ymm8,%ymm10
vpaddq    %ymm10,%ymm2,%ymm2
vpmuludq  416(%rsp),%ymm11,%ymm10
vpaddq    %ymm10,%ymm2,%ymm2

vpmuludq  352(%rsp),%ymm4,%ymm3
vpmuludq  320(%rsp),%ymm5,%ymm10
vpaddq    %ymm10,%ymm3,%ymm3
vpmuludq  288(%rsp),%ymm6,%ymm10
vpaddq    %ymm10,%ymm3,%ymm3
vpmuludq  256(%rsp),%ymm7,%ymm10
vpaddq    %ymm10,%ymm3,%ymm3
vpmuludq  224(%rsp),%ymm8,%ymm10
vpaddq    %ymm10,%ymm3,%ymm3
vpmuludq  192(%rsp),%ymm9,%ymm10
vpaddq    %ymm10,%ymm3,%ymm3

vpmuludq  %ymm15,%ymm5,%ymm4
vpmuludq  %ymm14,%ymm7,%ymm10
vpaddq    %ymm10,%ymm4,%ymm4
vpmuludq  %ymm13,%ymm9,%ymm10
vpaddq    %ymm10,%ymm4,%ymm4
vpmuludq  320(%rsp),%ymm6,%ymm10
vpaddq    %ymm10,%ymm4,%ymm4
vpmuludq  256(%rsp),%ymm8,%ymm10
vpaddq    %ymm10,%ymm4,%ymm4
vpmuludq  416(%rsp),%ymm12,%ymm10
vpaddq    %ymm10,%ymm4,%ymm4
vpmuludq  480(%rsp),%ymm11,%ymm10
vpaddq    %ymm10,%ymm4,%ymm4

vpmuludq  352(%rsp),%ymm6,%ymm5
vpmuludq  320(%rsp),%ymm7,%ymm10
vpaddq    %ymm10,%ymm5,%ymm5
vpmuludq  288(%rsp),%ymm8,%ymm10
vpaddq    %ymm10,%ymm5,%ymm5
vpmuludq  256(%rsp),%ymm9,%ymm10
vpaddq    %ymm10,%ymm5,%ymm5

vpmuludq  %ymm15,%ymm7,%ymm6
vpmuludq  %ymm14,%ymm9,%ymm10
vpaddq    %ymm10,%ymm6,%ymm6
vpmuludq  320(%rsp),%ymm8,%ymm10
vpaddq    %ymm10,%ymm6,%ymm6
vpmuludq  416(%rsp),%ymm13,%ymm10
vpaddq    %ymm10,%ymm6,%ymm6
vpmuludq  480(%rsp),%ymm12,%ymm10
vpaddq    %ymm10,%ymm6,%ymm6
vpmuludq  544(%rsp),%ymm11,%ymm10
vpaddq    %ymm10,%ymm6,%ymm6

vpmuludq  352(%rsp),%ymm8,%ymm7
vpmuludq  320(%rsp),%ymm9,%ymm10
vpaddq    %ymm10,%ymm7,%ymm7

vpmuludq  %ymm15,%ymm9,%ymm8
vpmuludq  416(%rsp),%ymm14,%ymm10
vpaddq    %ymm10,%ymm8,%ymm8
vpmuludq  480(%rsp),%ymm13,%ymm10
vpaddq    %ymm10,%ymm8,%ymm8
vpmuludq  544(%rsp),%ymm12,%ymm10
vpaddq    %ymm10,%ymm8,%ymm8
vpmuludq  608(%rsp),%ymm11,%ymm10
vpaddq    %ymm10,%ymm8,%ymm8

vmovdqa   64(%rsp),%ymm11
vmovdqa   96(%rsp),%ymm12
vmovdqa   128(%rsp),%ymm13
vmovdqa   160(%rsp),%ymm14
vmovdqa   192(%rsp),%ymm15
vmovdqa   224(%rsp),%ymm9

vpmuludq  384(%rsp),%ymm11,%ymm10
vpaddq    %ymm10,%ymm0,%ymm0

vpmuludq  448(%rsp),%ymm11,%ymm10
vpaddq    %ymm10,%ymm2,%ymm2
vpmuludq  384(%rsp),%ymm13,%ymm10
vpaddq    %ymm10,%ymm2,%ymm2

vpmuludq  480(%rsp),%ymm11,%ymm10
vpaddq    %ymm10,%ymm3,%ymm3
vpmuludq  448(%rsp),%ymm12,%ymm10
vpaddq    %ymm10,%ymm3,%ymm3
vpmuludq  416(%rsp),%ymm13,%ymm10
vpaddq    %ymm10,%ymm3,%ymm3
vpmuludq  384(%rsp),%ymm14,%ymm10
vpaddq    %ymm10,%ymm3,%ymm3

vpmuludq  416(%rsp),%ymm11,%ymm10
vpaddq    %ymm10,%ymm1,%ymm1
vpmuludq  384(%rsp),%ymm12,%ymm10
vpaddq    %ymm10,%ymm1,%ymm1

vpmuludq  512(%rsp),%ymm11,%ymm10
vpaddq    %ymm10,%ymm4,%ymm4
vpmuludq  448(%rsp),%ymm13,%ymm10
vpaddq    %ymm10,%ymm4,%ymm4
vpmuludq  384(%rsp),%ymm15,%ymm10
vpaddq    %ymm10,%ymm4,%ymm4

vpmuludq  544(%rsp),%ymm11,%ymm10
vpaddq    %ymm10,%ymm5,%ymm5
vpmuludq  512(%rsp),%ymm12,%ymm10
vpaddq    %ymm10,%ymm5,%ymm5
vpmuludq  480(%rsp),%ymm13,%ymm10
vpaddq    %ymm10,%ymm5,%ymm5
vpmuludq  448(%rsp),%ymm14,%ymm10
vpaddq    %ymm10,%ymm5,%ymm5
vpmuludq  416(%rsp),%ymm15,%ymm10
vpaddq    %ymm10,%ymm5,%ymm5
vpmuludq  384(%rsp),%ymm9,%ymm10
vpaddq    %ymm10,%ymm5,%ymm5

vpmuludq  576(%rsp),%ymm11,%ymm10
vpaddq    %ymm10,%ymm6,%ymm6
vpmuludq  512(%rsp),%ymm13,%ymm10
vpaddq    %ymm10,%ymm6,%ymm6
vpmuludq  448(%rsp),%ymm15,%ymm10
vpaddq    %ymm10,%ymm6,%ymm6

vpmuludq  608(%rsp),%ymm11,%ymm10
vpaddq    %ymm10,%ymm7,%ymm7
vpmuludq  576(%rsp),%ymm12,%ymm10
vpaddq    %ymm10,%ymm7,%ymm7
vpmuludq  544(%rsp),%ymm13,%ymm10
vpaddq    %ymm10,%ymm7,%ymm7
vpmuludq  512(%rsp),%ymm14,%ymm10
vpaddq    %ymm10,%ymm7,%ymm7
vpmuludq  480(%rsp),%ymm15,%ymm10
vpaddq    %ymm10,%ymm7,%ymm7
vpmuludq  448(%rsp),%ymm9,%ymm10
vpaddq    %ymm10,%ymm7,%ymm7

vpmuludq  640(%rsp),%ymm11,%ymm10
vpaddq    %ymm10,%ymm8,%ymm8
vpmuludq  576(%rsp),%ymm13,%ymm10
vpaddq    %ymm10,%ymm8,%ymm8
vpmuludq  512(%rsp),%ymm15,%ymm10
vpaddq    %ymm10,%ymm8,%ymm8

vpmuludq  512(%rsp),%ymm9,%ymm9
vpmuludq  672(%rsp),%ymm11,%ymm10
vpaddq    %ymm10,%ymm9,%ymm9
vpmuludq  640(%rsp),%ymm12,%ymm10
vpaddq    %ymm10,%ymm9,%ymm9
vpmuludq  608(%rsp),%ymm13,%ymm10
vpaddq    %ymm10,%ymm9,%ymm9
vpmuludq  576(%rsp),%ymm14,%ymm10
vpaddq    %ymm10,%ymm9,%ymm9
vpmuludq  544(%rsp),%ymm15,%ymm10
vpaddq    %ymm10,%ymm9,%ymm9

vmovdqa   256(%rsp),%ymm11
vmovdqa   288(%rsp),%ymm12
vmovdqa   320(%rsp),%ymm13
vmovdqa   352(%rsp),%ymm14

vpmuludq  384(%rsp),%ymm11,%ymm10
vpaddq    %ymm10,%ymm6,%ymm6

vpmuludq  416(%rsp),%ymm11,%ymm10
vpaddq    %ymm10,%ymm7,%ymm7
vpmuludq  384(%rsp),%ymm12,%ymm10
vpaddq    %ymm10,%ymm7,%ymm7

vpmuludq  448(%rsp),%ymm11,%ymm10
vpaddq    %ymm10,%ymm8,%ymm8
vpmuludq  384(%rsp),%ymm13,%ymm10
vpaddq    %ymm10,%ymm8,%ymm8

vpmuludq  480(%rsp),%ymm11,%ymm10
vpaddq    %ymm10,%ymm9,%ymm9
vpmuludq  448(%rsp),%ymm12,%ymm10
vpaddq    %ymm10,%ymm9,%ymm9
vpmuludq  416(%rsp),%ymm13,%ymm10
vpaddq    %ymm10,%ymm9,%ymm9
vpmuludq  384(%rsp),%ymm14,%ymm10
vpaddq    %ymm10,%ymm9,%ymm9

vpsrlq    $25,%ymm5,%ymm10
vpaddq    %ymm10,%ymm6,%ymm6
vpand     vecmask25,%ymm5,%ymm13

vpsrlq    $26,%ymm0,%ymm10
vpaddq    %ymm10,%ymm1,%ymm1
vpand     vecmask26,%ymm0,%ymm0

vpsrlq    $26,%ymm6,%ymm10
vpaddq    %ymm10,%ymm7,%ymm7
vpand     vecmask26,%ymm6,%ymm6

vpsrlq    $25,%ymm1,%ymm10
vpaddq    %ymm10,%ymm2,%ymm2
vpand     vecmask25,%ymm1,%ymm11

vpsrlq    $25,%ymm7,%ymm10
vpaddq    %ymm10,%ymm8,%ymm8
vpand     vecmask25,%ymm7,%ymm14

vpsrlq    $26,%ymm2,%ymm10
vpaddq    %ymm10,%ymm3,%ymm3
vpand     vecmask26,%ymm2,%ymm2

vpsrlq    $26,%ymm8,%ymm10
vpaddq    %ymm10,%ymm9,%ymm9
vpand     vecmask26,%ymm8,%ymm8

vpsrlq    $25,%ymm3,%ymm10
vpaddq    %ymm10,%ymm4,%ymm4
vpand     vecmask25,%ymm3,%ymm12

vpsrlq    $25,%ymm9,%ymm10
vpaddq    %ymm10,%ymm0,%ymm0
vpsllq    $1,%ymm10,%ymm10
vpaddq    %ymm10,%ymm0,%ymm0
vpsllq    $3,%ymm10,%ymm10
vpaddq    %ymm10,%ymm0,%ymm0
vpand     vecmask25,%ymm9,%ymm15

vpsrlq    $26,%ymm4,%ymm10
vpaddq    %ymm10,%ymm13,%ymm13
vpand     vecmask26,%ymm4,%ymm4

vpsrlq    $26,%ymm0,%ymm10
vpaddq    %ymm10,%ymm11,%ymm11
vpand     vecmask26,%ymm0,%ymm0

vpsrlq    $25,%ymm13,%ymm10
vpaddq    %ymm10,%ymm6,%ymm6
vpand     vecmask25,%ymm13,%ymm13

subb      $1,%cl
cmpb	  $0,%cl
jge       .L2

movb	  $7,%cl
subq      $1,%r15
cmpq	  $0,%r15
jge       .L1

// Reduce
vpsrlq    $25,%ymm13,%ymm10
vpaddq    %ymm10,%ymm6,%ymm6
vpand     vecmask25,%ymm13,%ymm13

vpsrlq    $26,%ymm0,%ymm10
vpaddq    %ymm10,%ymm11,%ymm11
vpand     vecmask26,%ymm0,%ymm0

vpsrlq    $26,%ymm6,%ymm10
vpaddq    %ymm10,%ymm14,%ymm14
vpand     vecmask26,%ymm6,%ymm6

vpsrlq    $25,%ymm11,%ymm10
vpaddq    %ymm10,%ymm2,%ymm2
vpand     vecmask25,%ymm11,%ymm11

vpsrlq    $25,%ymm14,%ymm10
vpaddq    %ymm10,%ymm8,%ymm8
vpand     vecmask25,%ymm14,%ymm14

vpsrlq    $26,%ymm2,%ymm10
vpaddq    %ymm10,%ymm12,%ymm12
vpand     vecmask26,%ymm2,%ymm2

vpsrlq    $26,%ymm8,%ymm10
vpaddq    %ymm10,%ymm15,%ymm15
vpand     vecmask26,%ymm8,%ymm8

vpsrlq    $25,%ymm12,%ymm10
vpaddq    %ymm10,%ymm4,%ymm4
vpand     vecmask25,%ymm12,%ymm12

vpsrlq    $25,%ymm15,%ymm10
vpmuludq  vec19,%ymm10,%ymm10
vpaddq    %ymm10,%ymm0,%ymm0
vpand     vecmask25,%ymm15,%ymm15

vpsrlq    $26,%ymm4,%ymm10
vpaddq    %ymm10,%ymm13,%ymm13
vpand     vecmask26,%ymm4,%ymm4

vpsrlq    $26,%ymm0,%ymm10
vpaddq    %ymm10,%ymm11,%ymm11
vpand     vecmask26,%ymm0,%ymm0

vpsrlq    $25,%ymm13,%ymm10
vpaddq    %ymm10,%ymm6,%ymm6
vpand     vecmask25,%ymm13,%ymm13

// Store output
vmovdqa   %ymm0, 0(%rdi)
vmovdqa   %ymm11,32(%rdi)
vmovdqa   %ymm2, 64(%rdi)
vmovdqa   %ymm12,96(%rdi)
vmovdqa   %ymm4, 128(%rdi)
vmovdqa   %ymm13,160(%rdi)
vmovdqa   %ymm6, 192(%rdi)
vmovdqa   %ymm14,224(%rdi)
vmovdqa   %ymm8, 256(%rdi)
vmovdqa   %ymm15,288(%rdi)

movq 	  0(%rsp), %r11
movq 	  8(%rsp), %r12
movq 	  16(%rsp),%r13
movq 	  24(%rsp),%r14
movq 	  32(%rsp),%r15
movq 	  40(%rsp),%rbx
movq 	  48(%rsp),%rbp

movq 	  %r11,%rsp

ret
