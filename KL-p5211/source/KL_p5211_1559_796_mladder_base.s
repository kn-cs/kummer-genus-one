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
.globl KL_p5211_1559_796_mladder_base
KL_p5211_1559_796_mladder_base:

movq 	  %rsp,%r11
andq 	  $-32,%rsp
subq 	  $2400,%rsp

movq 	  %r11,0(%rsp)
movq 	  %r12,8(%rsp)
movq 	  %r13,16(%rsp)
movq 	  %r14,24(%rsp)
movq 	  %r15,32(%rsp)
movq 	  %rbx,40(%rsp)
movq 	  %rbp,48(%rsp) 

// Pack-N2D
vmovdqa   0(%rsi),%ymm8
vmovdqa   %ymm8,64(%rsp)
vmovdqa   32(%rsi),%ymm9
vmovdqa   64(%rsi),%ymm10
vmovdqa   96(%rsi),%ymm11
vmovdqa   128(%rsi),%ymm12
vmovdqa   160(%rsi),%ymm13
vmovdqa   192(%rsi),%ymm14
vmovdqa   224(%rsi),%ymm15
vmovdqa   256(%rsi),%ymm8
vmovdqa   %ymm8,96(%rsp)

vmovdqa   288(%rsi),%ymm0
vmovdqa   320(%rsi),%ymm1
vmovdqa   352(%rsi),%ymm2
vmovdqa   384(%rsi),%ymm3
vmovdqa   416(%rsi),%ymm4
vmovdqa   448(%rsi),%ymm5
vmovdqa   480(%rsi),%ymm6
vmovdqa   512(%rsi),%ymm7
vmovdqa   544(%rsi),%ymm8

vpsllq    $32,%ymm0,%ymm0
vpor      64(%rsp),%ymm0,%ymm0
vpsllq    $32,%ymm1,%ymm1
vpor      %ymm1,%ymm9,%ymm9
vpsllq    $32,%ymm2,%ymm2
vpor      %ymm2,%ymm10,%ymm10
vpsllq    $32,%ymm3,%ymm3
vpor      %ymm3,%ymm11,%ymm11
vpsllq    $32,%ymm4,%ymm4
vpor      %ymm4,%ymm12,%ymm12
vpsllq    $32,%ymm5,%ymm5
vpor      %ymm5,%ymm13,%ymm13
vpsllq    $32,%ymm6,%ymm6
vpor      %ymm6,%ymm14,%ymm14
vpsllq    $32,%ymm7,%ymm7
vpor      %ymm7,%ymm15,%ymm15
vpsllq    $32,%ymm8,%ymm8
vpor      96(%rsp),%ymm8,%ymm8

// Dense-HH
vpshufd	  $68,%ymm0,%ymm1
vpshufd	  $238,%ymm0,%ymm3
vpaddd    hh_p1d,%ymm1,%ymm1
vpxor     hh_xor,%ymm3,%ymm3
vpaddd    %ymm1,%ymm3,%ymm0

vpshufd	  $68,%ymm9,%ymm1
vpshufd	  $238,%ymm9,%ymm3
vpaddd    hh_p1d,%ymm1,%ymm1
vpxor     hh_xor,%ymm3,%ymm3
vpaddd    %ymm1,%ymm3,%ymm9

vpshufd	  $68,%ymm10,%ymm1
vpshufd	  $238,%ymm10,%ymm3
vpaddd    hh_p1d,%ymm1,%ymm1
vpxor     hh_xor,%ymm3,%ymm3
vpaddd    %ymm1,%ymm3,%ymm10

vpshufd	  $68,%ymm11,%ymm1
vpshufd	  $238,%ymm11,%ymm3
vpaddd    hh_p1d,%ymm1,%ymm1
vpxor     hh_xor,%ymm3,%ymm3
vpaddd    %ymm1,%ymm3,%ymm11

vpshufd	  $68,%ymm12,%ymm1
vpshufd	  $238,%ymm12,%ymm3
vpaddd    hh_p1d,%ymm1,%ymm1
vpxor     hh_xor,%ymm3,%ymm3
vpaddd    %ymm1,%ymm3,%ymm12

vpshufd	  $68,%ymm13,%ymm1
vpshufd	  $238,%ymm13,%ymm3
vpaddd    hh_p1d,%ymm1,%ymm1
vpxor     hh_xor,%ymm3,%ymm3
vpaddd    %ymm1,%ymm3,%ymm13

vpshufd	  $68,%ymm14,%ymm1
vpshufd	  $238,%ymm14,%ymm3
vpaddd    hh_p1d,%ymm1,%ymm1
vpxor     hh_xor,%ymm3,%ymm3
vpaddd    %ymm1,%ymm3,%ymm14

vpshufd	  $68,%ymm15,%ymm1
vpshufd	  $238,%ymm15,%ymm3
vpaddd    hh_p1d,%ymm1,%ymm1
vpxor     hh_xor,%ymm3,%ymm3
vpaddd    %ymm1,%ymm3,%ymm15

vpshufd	  $68,%ymm8,%ymm1
vpshufd	  $238,%ymm8,%ymm3
vpaddd    hh_p2d,%ymm1,%ymm1
vpxor     hh_xor,%ymm3,%ymm3
vpaddd    %ymm1,%ymm3,%ymm8

vpsrld    $29,%ymm0,%ymm1
vpaddd    %ymm1,%ymm9,%ymm9
vpand     vecmask29d,%ymm0,%ymm0

vpsrld    $29,%ymm9,%ymm1
vpaddd    %ymm1,%ymm10,%ymm10
vpand     vecmask29d,%ymm9,%ymm9

vpsrld    $29,%ymm10,%ymm1
vpaddd    %ymm1,%ymm11,%ymm11
vpand     vecmask29d,%ymm10,%ymm10

vpsrld    $29,%ymm11,%ymm1
vpaddd    %ymm1,%ymm12,%ymm12
vpand     vecmask29d,%ymm11,%ymm11

vpsrld    $29,%ymm12,%ymm1
vpaddd    %ymm1,%ymm13,%ymm13
vpand     vecmask29d,%ymm12,%ymm12

vpsrld    $29,%ymm13,%ymm1
vpaddd    %ymm1,%ymm14,%ymm14
vpand     vecmask29d,%ymm13,%ymm13

vpsrld    $29,%ymm14,%ymm1
vpaddd    %ymm1,%ymm15,%ymm15
vpand     vecmask29d,%ymm14,%ymm14

vpsrld    $29,%ymm15,%ymm1
vpaddd    %ymm1,%ymm8,%ymm8
vpand     vecmask29d,%ymm15,%ymm15

vpand     vecmask3,%ymm8,%ymm1
vpsllq    $3,%ymm1,%ymm1
vpaddd    %ymm1,%ymm0,%ymm0

vpand     vecmask4,%ymm8,%ymm1
vpsrlq    $60,%ymm1,%ymm1
vpaddd    %ymm1,%ymm0,%ymm0
vpand     vecmask2928d,%ymm8,%ymm8

// Sqr
vmovdqa   %ymm0,64(%rsp)
vmovdqa   %ymm14,96(%rsp)
vmovdqa   %ymm15,128(%rsp)
vmovdqa   %ymm8,160(%rsp)

vpsrlq    $32,%ymm0,%ymm0
vpsrlq    $32,%ymm9,%ymm1
vpsrlq    $32,%ymm10,%ymm2
vpsrlq    $32,%ymm11,%ymm3
vpsrlq    $32,%ymm12,%ymm4
vpsrlq    $32,%ymm13,%ymm5
vpsrlq    $32,%ymm14,%ymm6
vpsrlq    $32,%ymm15,%ymm7
vpsrlq    $32,%ymm8,%ymm8

vmovdqa   %ymm0,192(%rsp)
vmovdqa   %ymm1,224(%rsp)
vmovdqa   %ymm2,256(%rsp)
vmovdqa   %ymm8,288(%rsp)

vpermq	  $238,%ymm1,%ymm0
vpblendd  $15,%ymm0,%ymm9,%ymm9
vpermq	  $238,%ymm2,%ymm0
vpblendd  $15,%ymm0,%ymm10,%ymm10
vpermq	  $238,%ymm3,%ymm0
vpblendd  $15,%ymm0,%ymm11,%ymm11
vpermq	  $238,%ymm4,%ymm0
vpblendd  $15,%ymm0,%ymm12,%ymm12
vpermq	  $238,%ymm5,%ymm0
vpblendd  $15,%ymm0,%ymm13,%ymm13
vpermq	  $238,%ymm6,%ymm0
vpblendd  $15,%ymm0,%ymm14,%ymm14
vpermq	  $238,%ymm7,%ymm0
vpblendd  $15,%ymm0,%ymm15,%ymm15
vpermq	  $238,%ymm8,%ymm8
vpblendd  $240,160(%rsp),%ymm8,%ymm2
vmovdqa   192(%rsp),%ymm0
vpermq	  $238,%ymm0,%ymm0
vpblendd  $240,64(%rsp),%ymm0,%ymm8

vpmuludq  %ymm8,%ymm8,%ymm1
vpermq	  $68,%ymm1,%ymm0
vpaddq    %ymm0,%ymm1,%ymm1
vmovdqa   %ymm1,320(%rsp)
vpaddq    %ymm0,%ymm1,%ymm1
vmovdqa   %ymm1,864(%rsp)

vpmuludq  %ymm9,%ymm8,%ymm1
vpaddq    %ymm1,%ymm1,%ymm1
vpermq	  $68,%ymm1,%ymm0
vpaddq    %ymm0,%ymm1,%ymm1
vmovdqa   %ymm1,352(%rsp)
vpaddq    %ymm0,%ymm1,%ymm1
vmovdqa   %ymm1,896(%rsp)

vpmuludq  %ymm10,%ymm8,%ymm1
vpaddq    %ymm1,%ymm1,%ymm1
vpmuludq  %ymm9,%ymm9,%ymm0
vpaddq    %ymm0,%ymm1,%ymm1
vpermq	  $68,%ymm1,%ymm0
vpaddq    %ymm0,%ymm1,%ymm1
vmovdqa   %ymm1,384(%rsp)
vpaddq    %ymm0,%ymm1,%ymm1
vmovdqa   %ymm1,928(%rsp)

vpmuludq  %ymm11,%ymm8,%ymm1
vpmuludq  %ymm10,%ymm9,%ymm0
vpaddq    %ymm0,%ymm1,%ymm1
vpaddq    %ymm1,%ymm1,%ymm1
vpermq	  $68,%ymm1,%ymm0
vpaddq    %ymm0,%ymm1,%ymm1
vmovdqa   %ymm1,416(%rsp)
vpaddq    %ymm0,%ymm1,%ymm1
vmovdqa   %ymm1,960(%rsp)

vpmuludq  %ymm12,%ymm8,%ymm1
vpmuludq  %ymm11,%ymm9,%ymm0
vpaddq    %ymm0,%ymm1,%ymm1
vpaddq    %ymm1,%ymm1,%ymm1
vpmuludq  %ymm10,%ymm10,%ymm0
vpaddq    %ymm0,%ymm1,%ymm1
vpermq	  $68,%ymm1,%ymm0
vpaddq    %ymm0,%ymm1,%ymm1
vmovdqa   %ymm1,448(%rsp)
vpaddq    %ymm0,%ymm1,%ymm1
vmovdqa   %ymm1,992(%rsp)

vpmuludq  %ymm13,%ymm8,%ymm1
vpmuludq  %ymm12,%ymm9,%ymm0
vpaddq    %ymm0,%ymm1,%ymm1
vpmuludq  %ymm11,%ymm10,%ymm0
vpaddq    %ymm0,%ymm1,%ymm1
vpaddq    %ymm1,%ymm1,%ymm1
vpermq	  $68,%ymm1,%ymm0
vpaddq    %ymm0,%ymm1,%ymm1
vmovdqa   %ymm1,480(%rsp)
vpaddq    %ymm0,%ymm1,%ymm1
vmovdqa   %ymm1,1024(%rsp)

vpmuludq  %ymm14,%ymm8,%ymm1
vpmuludq  %ymm13,%ymm9,%ymm0
vpaddq    %ymm0,%ymm1,%ymm1
vpmuludq  %ymm12,%ymm10,%ymm0
vpaddq    %ymm0,%ymm1,%ymm1
vpaddq    %ymm1,%ymm1,%ymm1
vpmuludq  %ymm11,%ymm11,%ymm0
vpaddq    %ymm0,%ymm1,%ymm1
vpermq	  $68,%ymm1,%ymm0
vpaddq    %ymm0,%ymm1,%ymm1
vmovdqa   %ymm1,512(%rsp)
vpaddq    %ymm0,%ymm1,%ymm1
vmovdqa   %ymm1,1056(%rsp)

vpmuludq  %ymm15,%ymm8,%ymm1
vpmuludq  %ymm14,%ymm9,%ymm0
vpaddq    %ymm0,%ymm1,%ymm1
vpmuludq  %ymm13,%ymm10,%ymm0
vpaddq    %ymm0,%ymm1,%ymm1
vpmuludq  %ymm12,%ymm11,%ymm0
vpaddq    %ymm0,%ymm1,%ymm1
vpaddq    %ymm1,%ymm1,%ymm1
vpermq	  $68,%ymm1,%ymm0
vpaddq    %ymm0,%ymm1,%ymm1
vmovdqa   %ymm1,544(%rsp)
vpaddq    %ymm0,%ymm1,%ymm1
vmovdqa   %ymm1,1088(%rsp)

vpmuludq  %ymm15,%ymm9,%ymm1
vpmuludq  %ymm14,%ymm10,%ymm0
vpaddq    %ymm0,%ymm1,%ymm1
vpmuludq  %ymm13,%ymm11,%ymm0
vpaddq    %ymm0,%ymm1,%ymm1
vpmuludq  %ymm2,%ymm8,%ymm0
vpaddq    %ymm0,%ymm1,%ymm1
vpaddq    %ymm1,%ymm1,%ymm1
vpmuludq  %ymm12,%ymm12,%ymm0
vpaddq    %ymm0,%ymm1,%ymm1
vpermq	  $68,%ymm1,%ymm0
vpaddq    %ymm0,%ymm1,%ymm1
vmovdqa   %ymm1,576(%rsp)
vpaddq    %ymm0,%ymm1,%ymm1
vmovdqa   %ymm1,1120(%rsp)

vpmuludq  %ymm15,%ymm10,%ymm1
vpmuludq  %ymm14,%ymm11,%ymm0
vpaddq    %ymm0,%ymm1,%ymm1
vpmuludq  %ymm13,%ymm12,%ymm0
vpaddq    %ymm0,%ymm1,%ymm1
vpmuludq  %ymm2,%ymm9,%ymm0
vpaddq    %ymm0,%ymm1,%ymm1
vpaddq    %ymm1,%ymm1,%ymm1
vpermq	  $68,%ymm1,%ymm0
vpaddq    %ymm0,%ymm1,%ymm1
vmovdqa   %ymm1,608(%rsp)
vpaddq    %ymm0,%ymm1,%ymm1
vmovdqa   %ymm1,1152(%rsp)

vpmuludq  %ymm15,%ymm11,%ymm1
vpmuludq  %ymm14,%ymm12,%ymm0
vpaddq    %ymm0,%ymm1,%ymm1
vpmuludq  %ymm2,%ymm10,%ymm0
vpaddq    %ymm0,%ymm1,%ymm1
vpaddq    %ymm1,%ymm1,%ymm1
vpmuludq  %ymm13,%ymm13,%ymm0
vpaddq    %ymm0,%ymm1,%ymm1
vpermq	  $68,%ymm1,%ymm0
vpaddq    %ymm0,%ymm1,%ymm1
vmovdqa   %ymm1,640(%rsp)
vpaddq    %ymm0,%ymm1,%ymm1
vmovdqa   %ymm1,1184(%rsp)

vpmuludq  %ymm15,%ymm12,%ymm1
vpmuludq  %ymm14,%ymm13,%ymm0
vpaddq    %ymm0,%ymm1,%ymm1
vpmuludq  %ymm2,%ymm11,%ymm0
vpaddq    %ymm0,%ymm1,%ymm1
vpaddq    %ymm1,%ymm1,%ymm1
vpermq	  $68,%ymm1,%ymm0
vpaddq    %ymm0,%ymm1,%ymm1
vmovdqa   %ymm1,672(%rsp)
vpaddq    %ymm0,%ymm1,%ymm1
vmovdqa   %ymm1,1216(%rsp)

vpmuludq  %ymm15,%ymm13,%ymm1
vpmuludq  %ymm2,%ymm12,%ymm0
vpaddq    %ymm0,%ymm1,%ymm1
vpaddq    %ymm1,%ymm1,%ymm1
vpmuludq  %ymm14,%ymm14,%ymm0
vpaddq    %ymm0,%ymm1,%ymm1
vpermq	  $68,%ymm1,%ymm0
vpaddq    %ymm0,%ymm1,%ymm1
vmovdqa   %ymm1,704(%rsp)
vpaddq    %ymm0,%ymm1,%ymm1
vmovdqa   %ymm1,1248(%rsp)

vpmuludq  %ymm15,%ymm14,%ymm1
vpmuludq  %ymm2,%ymm13,%ymm0
vpaddq    %ymm0,%ymm1,%ymm1
vpaddq    %ymm1,%ymm1,%ymm1
vpermq	  $68,%ymm1,%ymm0
vpaddq    %ymm0,%ymm1,%ymm1
vmovdqa   %ymm1,736(%rsp)
vpaddq    %ymm0,%ymm1,%ymm1
vmovdqa   %ymm1,1280(%rsp)

vpmuludq  %ymm2,%ymm14,%ymm1
vpaddq    %ymm1,%ymm1,%ymm1
vpmuludq  %ymm15,%ymm15,%ymm0
vpaddq    %ymm0,%ymm1,%ymm1
vpermq	  $68,%ymm1,%ymm0
vpaddq    %ymm0,%ymm1,%ymm1
vmovdqa   %ymm1,768(%rsp)
vpaddq    %ymm0,%ymm1,%ymm1
vmovdqa   %ymm1,1312(%rsp)

vpmuludq  %ymm2,%ymm15,%ymm1
vpaddq    %ymm1,%ymm1,%ymm1
vpermq	  $68,%ymm1,%ymm0
vpaddq    %ymm0,%ymm1,%ymm1
vmovdqa   %ymm1,800(%rsp)
vpaddq    %ymm0,%ymm1,%ymm1
vmovdqa   %ymm1,1344(%rsp)

vpmuludq  %ymm2,%ymm2,%ymm1
vpermq	  $68,%ymm1,%ymm0
vpaddq    %ymm0,%ymm1,%ymm1
vmovdqa   %ymm1,832(%rsp)
vpaddq    %ymm0,%ymm1,%ymm1
vmovdqa   %ymm1,1376(%rsp)

vpaddq    192(%rsp),%ymm8,%ymm8
vpaddq    224(%rsp),%ymm9,%ymm9
vpaddq    256(%rsp),%ymm10,%ymm10
vpaddq    %ymm3,%ymm11,%ymm11
vpaddq    %ymm4,%ymm12,%ymm12
vpaddq    %ymm5,%ymm13,%ymm13
vpaddq    %ymm6,%ymm14,%ymm14
vpaddq    %ymm7,%ymm15,%ymm15
vpaddq    288(%rsp),%ymm2,%ymm2

vpermq	  $238,%ymm8,%ymm7
vpblendd  $15,%ymm7,%ymm2,%ymm2
vpermq	  $238,%ymm9,%ymm7
vpblendd  $15,%ymm7,%ymm15,%ymm15
vpermq	  $238,%ymm10,%ymm7
vpblendd  $15,%ymm7,%ymm14,%ymm14
vpermq	  $238,%ymm11,%ymm7
vpblendd  $15,%ymm7,%ymm13,%ymm13
vpermq	  $238,%ymm12,%ymm7
vpblendd  $15,%ymm7,%ymm12,%ymm12

vpermq	  $78,%ymm13,%ymm11
vpermq	  $78,%ymm14,%ymm10
vpermq	  $78,%ymm15,%ymm9
vpermq	  $78,%ymm2,%ymm8

vpmuludq  %ymm2,%ymm8,%ymm1
vpmuludq  %ymm15,%ymm9,%ymm0
vpaddq    %ymm0,%ymm1,%ymm1
vpmuludq  %ymm14,%ymm10,%ymm0
vpaddq    %ymm0,%ymm1,%ymm1
vpmuludq  %ymm13,%ymm11,%ymm0
vpaddq    %ymm0,%ymm1,%ymm1
vpaddq    %ymm1,%ymm1,%ymm1
vpmuludq  %ymm12,%ymm12,%ymm0
vpaddq    %ymm0,%ymm1,%ymm1
vmovdqa   %ymm1,1536(%rsp)

vpmuludq  %ymm2,%ymm9,%ymm1
vpmuludq  %ymm15,%ymm10,%ymm0
vpaddq    %ymm0,%ymm1,%ymm1
vpmuludq  %ymm14,%ymm11,%ymm0
vpaddq    %ymm0,%ymm1,%ymm1
vpmuludq  %ymm13,%ymm12,%ymm0
vpaddq    %ymm0,%ymm1,%ymm1
vpaddq    %ymm1,%ymm1,%ymm8
vpermq	  $68,%ymm8,%ymm1
vmovdqa   %ymm1,1504(%rsp)

vpmuludq  %ymm2,%ymm10,%ymm1
vpmuludq  %ymm15,%ymm11,%ymm0
vpaddq    %ymm0,%ymm1,%ymm1
vpmuludq  %ymm14,%ymm12,%ymm0
vpaddq    %ymm0,%ymm1,%ymm1
vpaddq    %ymm1,%ymm1,%ymm1
vpmuludq  %ymm13,%ymm13,%ymm0
vpaddq    %ymm0,%ymm1,%ymm9
vpermq	  $68,%ymm9,%ymm6

vpmuludq  %ymm2,%ymm11,%ymm1
vpmuludq  %ymm15,%ymm12,%ymm0
vpaddq    %ymm0,%ymm1,%ymm1
vpmuludq  %ymm14,%ymm13,%ymm0
vpaddq    %ymm0,%ymm1,%ymm1
vpaddq    %ymm1,%ymm1,%ymm10
vpermq	  $68,%ymm10,%ymm5

vpmuludq  %ymm2,%ymm12,%ymm1
vpmuludq  %ymm15,%ymm13,%ymm0
vpaddq    %ymm0,%ymm1,%ymm1
vpaddq    %ymm1,%ymm1,%ymm1
vpmuludq  %ymm14,%ymm14,%ymm0
vpaddq    %ymm0,%ymm1,%ymm11
vpermq	  $68,%ymm11,%ymm4

vpmuludq  %ymm2,%ymm13,%ymm1
vpmuludq  %ymm15,%ymm14,%ymm0
vpaddq    %ymm0,%ymm1,%ymm1
vpaddq    %ymm1,%ymm1,%ymm12
vpermq	  $68,%ymm12,%ymm3

vpmuludq  %ymm2,%ymm14,%ymm1
vpaddq    %ymm1,%ymm1,%ymm1
vpmuludq  %ymm15,%ymm15,%ymm0
vpaddq    %ymm0,%ymm1,%ymm13
vpermq	  $68,%ymm13,%ymm1
vmovdqa   %ymm1,1472(%rsp)

vpmuludq  %ymm2,%ymm15,%ymm1
vpaddq    %ymm1,%ymm1,%ymm14
vpermq	  $68,%ymm14,%ymm1
vmovdqa   %ymm1,1440(%rsp)

vpmuludq  %ymm2,%ymm2,%ymm15
vpermq	  $68,%ymm15,%ymm1
vmovdqa   %ymm1,1408(%rsp)

vmovdqa   1408(%rsp),%ymm0
vmovdqa   1440(%rsp),%ymm1
vmovdqa   1472(%rsp),%ymm2

vpsubq    320(%rsp),%ymm0,%ymm0
vpsubq    352(%rsp),%ymm1,%ymm1
vpsubq    384(%rsp),%ymm2,%ymm2
vpsubq    416(%rsp),%ymm3,%ymm3
vpsubq    448(%rsp),%ymm4,%ymm4
vpsubq    480(%rsp),%ymm5,%ymm5
vpsubq    512(%rsp),%ymm6,%ymm6

vmovdqa   1504(%rsp),%ymm7
vpsubq    544(%rsp),%ymm7,%ymm7
vmovdqa   %ymm7,1408(%rsp)

vmovdqa   1536(%rsp),%ymm7
vpsubq    576(%rsp),%ymm7,%ymm7
vmovdqa   %ymm7,1440(%rsp)

vpsubq    608(%rsp),%ymm8,%ymm8
vpsubq    640(%rsp),%ymm9,%ymm9
vpsubq    672(%rsp),%ymm10,%ymm10
vpsubq    704(%rsp),%ymm11,%ymm11
vpsubq    736(%rsp),%ymm12,%ymm12
vpsubq    768(%rsp),%ymm13,%ymm13
vpsubq    800(%rsp),%ymm14,%ymm14
vpsubq    832(%rsp),%ymm15,%ymm15

vpaddq    1152(%rsp),%ymm0,%ymm0
vpaddq    1184(%rsp),%ymm1,%ymm1
vpaddq    1216(%rsp),%ymm2,%ymm2
vpaddq    1248(%rsp),%ymm3,%ymm3
vpaddq    1280(%rsp),%ymm4,%ymm4
vpaddq    1312(%rsp),%ymm5,%ymm5
vpaddq    1344(%rsp),%ymm6,%ymm6
vmovdqa   1408(%rsp),%ymm7
vpaddq    1376(%rsp),%ymm7,%ymm7
vmovdqa   %ymm7,1408(%rsp)

vpaddq    %ymm8,%ymm8,%ymm8
vpaddq    864(%rsp),%ymm8,%ymm8
vpaddq    %ymm9,%ymm9,%ymm9
vpaddq    896(%rsp),%ymm9,%ymm9
vpaddq    %ymm10,%ymm10,%ymm10
vpaddq    928(%rsp),%ymm10,%ymm10
vpaddq    %ymm11,%ymm11,%ymm11
vpaddq    960(%rsp),%ymm11,%ymm11
vpaddq    %ymm12,%ymm12,%ymm12
vpaddq    992(%rsp),%ymm12,%ymm12
vpaddq    %ymm13,%ymm13,%ymm13
vpaddq    1024(%rsp),%ymm13,%ymm13
vpaddq    %ymm14,%ymm14,%ymm14
vpaddq    1056(%rsp),%ymm14,%ymm14
vpaddq    %ymm15,%ymm15,%ymm15
vpaddq    1088(%rsp),%ymm15,%ymm15

vpsrlq    $29,%ymm8,%ymm7
vpaddq    %ymm7,%ymm9,%ymm9
vpand     vecmask29,%ymm8,%ymm8

vpsrlq    $29,%ymm9,%ymm7
vpaddq    %ymm7,%ymm10,%ymm10
vpand     vecmask29,%ymm9,%ymm9

vpsrlq    $29,%ymm10,%ymm7
vpaddq    %ymm7,%ymm11,%ymm11
vpand     vecmask29,%ymm10,%ymm10

vpsrlq    $29,%ymm11,%ymm7
vpaddq    %ymm7,%ymm12,%ymm12
vpand     vecmask29,%ymm11,%ymm11

vpsrlq    $29,%ymm12,%ymm7
vpaddq    %ymm7,%ymm13,%ymm13
vpand     vecmask29,%ymm12,%ymm12

vpsrlq    $29,%ymm13,%ymm7
vpaddq    %ymm7,%ymm14,%ymm14
vpand     vecmask29,%ymm13,%ymm13

vpsrlq    $29,%ymm14,%ymm7
vpaddq    %ymm7,%ymm15,%ymm15
vpand     vecmask29,%ymm14,%ymm14

vmovdqa   %ymm10,128(%rsp)
vpsrlq    $29,%ymm15,%ymm7
vpaddq    1120(%rsp),%ymm7,%ymm10 
vpand     vecmask29,%ymm15,%ymm15

vpsrlq    $29,%ymm10,%ymm7
vpaddq    %ymm7,%ymm0,%ymm0
vpand     vecmask29,%ymm10,%ymm10

vpsrlq    $29,%ymm0,%ymm7
vpaddq    %ymm7,%ymm1,%ymm1
vpand     vecmask29,%ymm0,%ymm0

vpsrlq    $29,%ymm1,%ymm7
vpaddq    %ymm7,%ymm2,%ymm2
vpand     vecmask29,%ymm1,%ymm1

vpsrlq    $29,%ymm2,%ymm7
vpaddq    %ymm7,%ymm3,%ymm3
vpand     vecmask29,%ymm2,%ymm2

vpsrlq    $29,%ymm3,%ymm7
vpaddq    %ymm7,%ymm4,%ymm4
vpand     vecmask29,%ymm3,%ymm3

vpsrlq    $29,%ymm4,%ymm7
vpaddq    %ymm7,%ymm5,%ymm5
vpand     vecmask29,%ymm4,%ymm4

vpsrlq    $29,%ymm5,%ymm7
vpaddq    %ymm7,%ymm6,%ymm6
vpand     vecmask29,%ymm5,%ymm5

vpsrlq    $29,%ymm6,%ymm7
vpaddq    1408(%rsp),%ymm7,%ymm7
vpand     vecmask29,%ymm6,%ymm6

vmovdqa   %ymm10,160(%rsp)
vmovdqa   %ymm11,192(%rsp)

vpsrlq    $29,%ymm7,%ymm10
vpaddq    1440(%rsp),%ymm10,%ymm10
vpand     vecmask29,%ymm7,%ymm7

vpsrlq    $28,%ymm10,%ymm11
vpaddq    %ymm11,%ymm8,%ymm8
vpand     vecmask28,%ymm10,%ymm10

vpsrlq    $29,%ymm8,%ymm11
vpaddq    %ymm11,%ymm9,%ymm9
vpand     vecmask29,%ymm8,%ymm8

// Unreduced-MulC
vpmuludq  vec_c1,%ymm8,%ymm8
vpmuludq  vec_c1,%ymm9,%ymm9
vmovdqa   128(%rsp),%ymm11
vpmuludq  vec_c1,%ymm11,%ymm11
vmovdqa   %ymm11,128(%rsp)
vmovdqa   192(%rsp),%ymm11
vpmuludq  vec_c1,%ymm11,%ymm11
vmovdqa   %ymm11,192(%rsp)
vpmuludq  vec_c1,%ymm12,%ymm12
vpmuludq  vec_c1,%ymm13,%ymm13
vpmuludq  vec_c1,%ymm14,%ymm14
vpmuludq  vec_c1,%ymm15,%ymm15
vmovdqa   160(%rsp),%ymm11
vpmuludq  vec_c1,%ymm11,%ymm11
vmovdqa   %ymm11,160(%rsp)
vpmuludq  vec_c1,%ymm0,%ymm0
vpmuludq  vec_c1,%ymm1,%ymm1
vpmuludq  vec_c1,%ymm2,%ymm2
vpmuludq  vec_c1,%ymm3,%ymm3
vpmuludq  vec_c1,%ymm4,%ymm4
vpmuludq  vec_c1,%ymm5,%ymm5
vpmuludq  vec_c1,%ymm6,%ymm6
vpmuludq  vec_c1,%ymm7,%ymm7
vpmuludq  vec_c1,%ymm10,%ymm10
vmovdqa   %ymm10,64(%rsp)

vpshufd	  $68,%ymm8,%ymm10
vpshufd	  $238,%ymm8,%ymm11
vpaddq    hh_p1q,%ymm10,%ymm10
vpxor     hh_xor,%ymm11,%ymm11
vpaddq    %ymm10,%ymm11,%ymm8

vpshufd	  $68,%ymm9,%ymm10
vpshufd	  $238,%ymm9,%ymm11
vpaddq    hh_p1q,%ymm10,%ymm10
vpxor     hh_xor,%ymm11,%ymm11
vpaddq    %ymm10,%ymm11,%ymm9

vpshufd	  $68,%ymm12,%ymm10
vpshufd	  $238,%ymm12,%ymm11
vpaddq    hh_p1q,%ymm10,%ymm10
vpxor     hh_xor,%ymm11,%ymm11
vpaddq    %ymm10,%ymm11,%ymm12

vpshufd	  $68,%ymm13,%ymm10
vpshufd	  $238,%ymm13,%ymm11
vpaddq    hh_p1q,%ymm10,%ymm10
vpxor     hh_xor,%ymm11,%ymm11
vpaddq    %ymm10,%ymm11,%ymm13

vpshufd	  $68,%ymm14,%ymm10
vpshufd	  $238,%ymm14,%ymm11
vpaddq    hh_p1q,%ymm10,%ymm10
vpxor     hh_xor,%ymm11,%ymm11
vpaddq    %ymm10,%ymm11,%ymm14

vpshufd	  $68,%ymm15,%ymm10
vpshufd	  $238,%ymm15,%ymm11
vpaddq    hh_p1q,%ymm10,%ymm10
vpxor     hh_xor,%ymm11,%ymm11
vpaddq    %ymm10,%ymm11,%ymm15

vpshufd	  $68,%ymm0,%ymm10
vpshufd	  $238,%ymm0,%ymm11
vpaddq    hh_p1q,%ymm10,%ymm10
vpxor     hh_xor,%ymm11,%ymm11
vpaddq    %ymm10,%ymm11,%ymm0

vpshufd	  $68,%ymm1,%ymm10
vpshufd	  $238,%ymm1,%ymm11
vpaddq    hh_p1q,%ymm10,%ymm10
vpxor     hh_xor,%ymm11,%ymm11
vpaddq    %ymm10,%ymm11,%ymm1

vpshufd	  $68,%ymm2,%ymm10
vpshufd	  $238,%ymm2,%ymm11
vpaddq    hh_p1q,%ymm10,%ymm10
vpxor     hh_xor,%ymm11,%ymm11
vpaddq    %ymm10,%ymm11,%ymm2

vpshufd	  $68,%ymm3,%ymm10
vpshufd	  $238,%ymm3,%ymm11
vpaddq    hh_p1q,%ymm10,%ymm10
vpxor     hh_xor,%ymm11,%ymm11
vpaddq    %ymm10,%ymm11,%ymm3

vpshufd	  $68,%ymm4,%ymm10
vpshufd	  $238,%ymm4,%ymm11
vpaddq    hh_p1q,%ymm10,%ymm10
vpxor     hh_xor,%ymm11,%ymm11
vpaddq    %ymm10,%ymm11,%ymm4

vpshufd	  $68,%ymm5,%ymm10
vpshufd	  $238,%ymm5,%ymm11
vpaddq    hh_p1q,%ymm10,%ymm10
vpxor     hh_xor,%ymm11,%ymm11
vpaddq    %ymm10,%ymm11,%ymm5

vpshufd	  $68,%ymm6,%ymm10
vpshufd	  $238,%ymm6,%ymm11
vpaddq    hh_p1q,%ymm10,%ymm10
vpxor     hh_xor,%ymm11,%ymm11
vpaddq    %ymm10,%ymm11,%ymm6

vpshufd	  $68,%ymm7,%ymm10
vpshufd	  $238,%ymm7,%ymm11
vpaddq    hh_p1q,%ymm10,%ymm10
vpxor     hh_xor,%ymm11,%ymm11
vpaddq    %ymm10,%ymm11,%ymm7

vpshufd	  $68,192(%rsp),%ymm10
vpshufd	  $238,192(%rsp),%ymm11
vpaddq    hh_p1q,%ymm10,%ymm10
vpxor     hh_xor,%ymm11,%ymm11
vpaddq    %ymm10,%ymm11,%ymm10
vmovdqa   %ymm10,192(%rsp)

vpshufd	  $68,160(%rsp),%ymm10
vpshufd	  $238,160(%rsp),%ymm11
vpaddq    hh_p1q,%ymm10,%ymm10
vpxor     hh_xor,%ymm11,%ymm11
vpaddq    %ymm10,%ymm11,%ymm10
vmovdqa   %ymm10,160(%rsp)

vpshufd	  $68,64(%rsp),%ymm10
vpshufd	  $238,64(%rsp),%ymm11
vpaddq    hh_p2q,%ymm10,%ymm10
vpxor     hh_xor,%ymm11,%ymm11
vpaddq    %ymm10,%ymm11,%ymm10
vmovdqa   %ymm10,64(%rsp)

vpshufd	  $68,128(%rsp),%ymm10
vpshufd	  $238,128(%rsp),%ymm11
vpaddq    hh_p1q,%ymm10,%ymm10
vpxor     hh_xor,%ymm11,%ymm11
vpaddq    %ymm10,%ymm11,%ymm10

vpsrlq    $29,%ymm8,%ymm11
vpaddq    %ymm11,%ymm9,%ymm9
vpand     vecmask29,%ymm8,%ymm8
vmovdqa   %ymm8,96(%rsp)

vpsrlq    $29,%ymm9,%ymm11
vpaddq    %ymm11,%ymm10,%ymm10
vpand     vecmask29,%ymm9,%ymm9

vpsrlq    $29,%ymm10,%ymm11
vpaddq    192(%rsp),%ymm11,%ymm8
vpand     vecmask29,%ymm10,%ymm10

vpsrlq    $29,%ymm8,%ymm11
vpaddq    %ymm11,%ymm12,%ymm12
vpand     vecmask29,%ymm8,%ymm8
vmovdqa   %ymm8,192(%rsp)

vpsrlq    $29,%ymm12,%ymm11
vpaddq    %ymm11,%ymm13,%ymm13
vpand     vecmask29,%ymm12,%ymm12

vpsrlq    $29,%ymm13,%ymm11
vpaddq    %ymm11,%ymm14,%ymm14
vpand     vecmask29,%ymm13,%ymm13

vpsrlq    $29,%ymm14,%ymm11
vpaddq    %ymm11,%ymm15,%ymm15
vpand     vecmask29,%ymm14,%ymm14

vpsrlq    $29,%ymm15,%ymm11
vpaddq    160(%rsp),%ymm11,%ymm8
vpand     vecmask29,%ymm15,%ymm15

vpsrlq    $29,%ymm8,%ymm11
vpaddq    %ymm11,%ymm0,%ymm0
vpand     vecmask29,%ymm8,%ymm8
vmovdqa   %ymm8,160(%rsp)

vpsrlq    $29,%ymm0,%ymm11
vpaddq    %ymm11,%ymm1,%ymm1
vpand     vecmask29,%ymm0,%ymm0

vpsrlq    $29,%ymm1,%ymm11
vpaddq    %ymm11,%ymm2,%ymm2
vpand     vecmask29,%ymm1,%ymm1

vpsrlq    $29,%ymm2,%ymm11
vpaddq    %ymm11,%ymm3,%ymm3
vpand     vecmask29,%ymm2,%ymm2

vpsrlq    $29,%ymm3,%ymm11
vpaddq    %ymm11,%ymm4,%ymm4
vpand     vecmask29,%ymm3,%ymm3

vpsrlq    $29,%ymm4,%ymm11
vpaddq    %ymm11,%ymm5,%ymm5
vpand     vecmask29,%ymm4,%ymm4

vpsrlq    $29,%ymm5,%ymm11
vpaddq    %ymm11,%ymm6,%ymm6
vpand     vecmask29,%ymm5,%ymm5

vpsrlq    $29,%ymm6,%ymm11
vpaddq    %ymm11,%ymm7,%ymm7
vpand     vecmask29,%ymm6,%ymm6

vpsrlq    $29,%ymm7,%ymm11
vpaddq    64(%rsp),%ymm11,%ymm8
vpand     vecmask29,%ymm7,%ymm7

vpsrlq    $28,%ymm8,%ymm11
vpaddq    96(%rsp),%ymm11,%ymm11
vpand     vecmask28,%ymm8,%ymm8
vmovdqa   %ymm11,64(%rsp)
vmovdqa   192(%rsp),%ymm11

// Sqr
vmovdqa   %ymm14,96(%rsp)
vmovdqa   %ymm15,128(%rsp)

vmovdqa   %ymm0,192(%rsp)
vmovdqa   %ymm1,224(%rsp)
vmovdqa   %ymm2,256(%rsp)
vmovdqa   %ymm8,288(%rsp)

vpermq	  $238,%ymm1,%ymm0
vpblendd  $15,%ymm0,%ymm9,%ymm9
vpermq	  $238,%ymm2,%ymm0
vpblendd  $15,%ymm0,%ymm10,%ymm10
vpermq	  $238,%ymm3,%ymm0
vpblendd  $15,%ymm0,%ymm11,%ymm11
vpermq	  $238,%ymm4,%ymm0
vpblendd  $15,%ymm0,%ymm12,%ymm12
vpermq	  $238,%ymm5,%ymm0
vpblendd  $15,%ymm0,%ymm13,%ymm13
vpermq	  $238,%ymm6,%ymm0
vpblendd  $15,%ymm0,%ymm14,%ymm14
vpermq	  $238,%ymm7,%ymm0
vpblendd  $15,%ymm0,%ymm15,%ymm15
vpermq	  $238,%ymm8,%ymm8
vpblendd  $240,160(%rsp),%ymm8,%ymm2
vmovdqa   192(%rsp),%ymm0
vpermq	  $238,%ymm0,%ymm0
vpblendd  $240,64(%rsp),%ymm0,%ymm8

vpmuludq  %ymm8,%ymm8,%ymm1
vpermq	  $68,%ymm1,%ymm0
vpaddq    %ymm0,%ymm1,%ymm1
vmovdqa   %ymm1,320(%rsp)
vpaddq    %ymm0,%ymm1,%ymm1
vmovdqa   %ymm1,864(%rsp)

vpmuludq  %ymm9,%ymm8,%ymm1
vpaddq    %ymm1,%ymm1,%ymm1
vpermq	  $68,%ymm1,%ymm0
vpaddq    %ymm0,%ymm1,%ymm1
vmovdqa   %ymm1,352(%rsp)
vpaddq    %ymm0,%ymm1,%ymm1
vmovdqa   %ymm1,896(%rsp)

vpmuludq  %ymm10,%ymm8,%ymm1
vpaddq    %ymm1,%ymm1,%ymm1
vpmuludq  %ymm9,%ymm9,%ymm0
vpaddq    %ymm0,%ymm1,%ymm1
vpermq	  $68,%ymm1,%ymm0
vpaddq    %ymm0,%ymm1,%ymm1
vmovdqa   %ymm1,384(%rsp)
vpaddq    %ymm0,%ymm1,%ymm1
vmovdqa   %ymm1,928(%rsp)

vpmuludq  %ymm11,%ymm8,%ymm1
vpmuludq  %ymm10,%ymm9,%ymm0
vpaddq    %ymm0,%ymm1,%ymm1
vpaddq    %ymm1,%ymm1,%ymm1
vpermq	  $68,%ymm1,%ymm0
vpaddq    %ymm0,%ymm1,%ymm1
vmovdqa   %ymm1,416(%rsp)
vpaddq    %ymm0,%ymm1,%ymm1
vmovdqa   %ymm1,960(%rsp)

vpmuludq  %ymm12,%ymm8,%ymm1
vpmuludq  %ymm11,%ymm9,%ymm0
vpaddq    %ymm0,%ymm1,%ymm1
vpaddq    %ymm1,%ymm1,%ymm1
vpmuludq  %ymm10,%ymm10,%ymm0
vpaddq    %ymm0,%ymm1,%ymm1
vpermq	  $68,%ymm1,%ymm0
vpaddq    %ymm0,%ymm1,%ymm1
vmovdqa   %ymm1,448(%rsp)
vpaddq    %ymm0,%ymm1,%ymm1
vmovdqa   %ymm1,992(%rsp)

vpmuludq  %ymm13,%ymm8,%ymm1
vpmuludq  %ymm12,%ymm9,%ymm0
vpaddq    %ymm0,%ymm1,%ymm1
vpmuludq  %ymm11,%ymm10,%ymm0
vpaddq    %ymm0,%ymm1,%ymm1
vpaddq    %ymm1,%ymm1,%ymm1
vpermq	  $68,%ymm1,%ymm0
vpaddq    %ymm0,%ymm1,%ymm1
vmovdqa   %ymm1,480(%rsp)
vpaddq    %ymm0,%ymm1,%ymm1
vmovdqa   %ymm1,1024(%rsp)

vpmuludq  %ymm14,%ymm8,%ymm1
vpmuludq  %ymm13,%ymm9,%ymm0
vpaddq    %ymm0,%ymm1,%ymm1
vpmuludq  %ymm12,%ymm10,%ymm0
vpaddq    %ymm0,%ymm1,%ymm1
vpaddq    %ymm1,%ymm1,%ymm1
vpmuludq  %ymm11,%ymm11,%ymm0
vpaddq    %ymm0,%ymm1,%ymm1
vpermq	  $68,%ymm1,%ymm0
vpaddq    %ymm0,%ymm1,%ymm1
vmovdqa   %ymm1,512(%rsp)
vpaddq    %ymm0,%ymm1,%ymm1
vmovdqa   %ymm1,1056(%rsp)

vpmuludq  %ymm15,%ymm8,%ymm1
vpmuludq  %ymm14,%ymm9,%ymm0
vpaddq    %ymm0,%ymm1,%ymm1
vpmuludq  %ymm13,%ymm10,%ymm0
vpaddq    %ymm0,%ymm1,%ymm1
vpmuludq  %ymm12,%ymm11,%ymm0
vpaddq    %ymm0,%ymm1,%ymm1
vpaddq    %ymm1,%ymm1,%ymm1
vpermq	  $68,%ymm1,%ymm0
vpaddq    %ymm0,%ymm1,%ymm1
vmovdqa   %ymm1,544(%rsp)
vpaddq    %ymm0,%ymm1,%ymm1
vmovdqa   %ymm1,1088(%rsp)

vpmuludq  %ymm15,%ymm9,%ymm1
vpmuludq  %ymm14,%ymm10,%ymm0
vpaddq    %ymm0,%ymm1,%ymm1
vpmuludq  %ymm13,%ymm11,%ymm0
vpaddq    %ymm0,%ymm1,%ymm1
vpmuludq  %ymm2,%ymm8,%ymm0
vpaddq    %ymm0,%ymm1,%ymm1
vpaddq    %ymm1,%ymm1,%ymm1
vpmuludq  %ymm12,%ymm12,%ymm0
vpaddq    %ymm0,%ymm1,%ymm1
vpermq	  $68,%ymm1,%ymm0
vpaddq    %ymm0,%ymm1,%ymm1
vmovdqa   %ymm1,576(%rsp)
vpaddq    %ymm0,%ymm1,%ymm1
vmovdqa   %ymm1,1120(%rsp)

vpmuludq  %ymm15,%ymm10,%ymm1
vpmuludq  %ymm14,%ymm11,%ymm0
vpaddq    %ymm0,%ymm1,%ymm1
vpmuludq  %ymm13,%ymm12,%ymm0
vpaddq    %ymm0,%ymm1,%ymm1
vpmuludq  %ymm2,%ymm9,%ymm0
vpaddq    %ymm0,%ymm1,%ymm1
vpaddq    %ymm1,%ymm1,%ymm1
vpermq	  $68,%ymm1,%ymm0
vpaddq    %ymm0,%ymm1,%ymm1
vmovdqa   %ymm1,608(%rsp)
vpaddq    %ymm0,%ymm1,%ymm1
vmovdqa   %ymm1,1152(%rsp)

vpmuludq  %ymm15,%ymm11,%ymm1
vpmuludq  %ymm14,%ymm12,%ymm0
vpaddq    %ymm0,%ymm1,%ymm1
vpmuludq  %ymm2,%ymm10,%ymm0
vpaddq    %ymm0,%ymm1,%ymm1
vpaddq    %ymm1,%ymm1,%ymm1
vpmuludq  %ymm13,%ymm13,%ymm0
vpaddq    %ymm0,%ymm1,%ymm1
vpermq	  $68,%ymm1,%ymm0
vpaddq    %ymm0,%ymm1,%ymm1
vmovdqa   %ymm1,640(%rsp)
vpaddq    %ymm0,%ymm1,%ymm1
vmovdqa   %ymm1,1184(%rsp)

vpmuludq  %ymm15,%ymm12,%ymm1
vpmuludq  %ymm14,%ymm13,%ymm0
vpaddq    %ymm0,%ymm1,%ymm1
vpmuludq  %ymm2,%ymm11,%ymm0
vpaddq    %ymm0,%ymm1,%ymm1
vpaddq    %ymm1,%ymm1,%ymm1
vpermq	  $68,%ymm1,%ymm0
vpaddq    %ymm0,%ymm1,%ymm1
vmovdqa   %ymm1,672(%rsp)
vpaddq    %ymm0,%ymm1,%ymm1
vmovdqa   %ymm1,1216(%rsp)

vpmuludq  %ymm15,%ymm13,%ymm1
vpmuludq  %ymm2,%ymm12,%ymm0
vpaddq    %ymm0,%ymm1,%ymm1
vpaddq    %ymm1,%ymm1,%ymm1
vpmuludq  %ymm14,%ymm14,%ymm0
vpaddq    %ymm0,%ymm1,%ymm1
vpermq	  $68,%ymm1,%ymm0
vpaddq    %ymm0,%ymm1,%ymm1
vmovdqa   %ymm1,704(%rsp)
vpaddq    %ymm0,%ymm1,%ymm1
vmovdqa   %ymm1,1248(%rsp)

vpmuludq  %ymm15,%ymm14,%ymm1
vpmuludq  %ymm2,%ymm13,%ymm0
vpaddq    %ymm0,%ymm1,%ymm1
vpaddq    %ymm1,%ymm1,%ymm1
vpermq	  $68,%ymm1,%ymm0
vpaddq    %ymm0,%ymm1,%ymm1
vmovdqa   %ymm1,736(%rsp)
vpaddq    %ymm0,%ymm1,%ymm1
vmovdqa   %ymm1,1280(%rsp)

vpmuludq  %ymm2,%ymm14,%ymm1
vpaddq    %ymm1,%ymm1,%ymm1
vpmuludq  %ymm15,%ymm15,%ymm0
vpaddq    %ymm0,%ymm1,%ymm1
vpermq	  $68,%ymm1,%ymm0
vpaddq    %ymm0,%ymm1,%ymm1
vmovdqa   %ymm1,768(%rsp)
vpaddq    %ymm0,%ymm1,%ymm1
vmovdqa   %ymm1,1312(%rsp)

vpmuludq  %ymm2,%ymm15,%ymm1
vpaddq    %ymm1,%ymm1,%ymm1
vpermq	  $68,%ymm1,%ymm0
vpaddq    %ymm0,%ymm1,%ymm1
vmovdqa   %ymm1,800(%rsp)
vpaddq    %ymm0,%ymm1,%ymm1
vmovdqa   %ymm1,1344(%rsp)

vpmuludq  %ymm2,%ymm2,%ymm1
vpermq	  $68,%ymm1,%ymm0
vpaddq    %ymm0,%ymm1,%ymm1
vmovdqa   %ymm1,832(%rsp)
vpaddq    %ymm0,%ymm1,%ymm1
vmovdqa   %ymm1,1376(%rsp)

vpaddq    192(%rsp),%ymm8,%ymm8
vpaddq    224(%rsp),%ymm9,%ymm9
vpaddq    256(%rsp),%ymm10,%ymm10
vpaddq    %ymm3,%ymm11,%ymm11
vpaddq    %ymm4,%ymm12,%ymm12
vpaddq    %ymm5,%ymm13,%ymm13
vpaddq    %ymm6,%ymm14,%ymm14
vpaddq    %ymm7,%ymm15,%ymm15
vpaddq    288(%rsp),%ymm2,%ymm2

vpermq	  $238,%ymm8,%ymm7
vpblendd  $15,%ymm7,%ymm2,%ymm2
vpermq	  $238,%ymm9,%ymm7
vpblendd  $15,%ymm7,%ymm15,%ymm15
vpermq	  $238,%ymm10,%ymm7
vpblendd  $15,%ymm7,%ymm14,%ymm14
vpermq	  $238,%ymm11,%ymm7
vpblendd  $15,%ymm7,%ymm13,%ymm13
vpermq	  $238,%ymm12,%ymm7
vpblendd  $15,%ymm7,%ymm12,%ymm12

vpermq	  $78,%ymm13,%ymm11
vpermq	  $78,%ymm14,%ymm10
vpermq	  $78,%ymm15,%ymm9
vpermq	  $78,%ymm2,%ymm8

vpmuludq  %ymm2,%ymm8,%ymm1
vpmuludq  %ymm15,%ymm9,%ymm0
vpaddq    %ymm0,%ymm1,%ymm1
vpmuludq  %ymm14,%ymm10,%ymm0
vpaddq    %ymm0,%ymm1,%ymm1
vpmuludq  %ymm13,%ymm11,%ymm0
vpaddq    %ymm0,%ymm1,%ymm1
vpaddq    %ymm1,%ymm1,%ymm1
vpmuludq  %ymm12,%ymm12,%ymm0
vpaddq    %ymm0,%ymm1,%ymm1
vmovdqa   %ymm1,1536(%rsp)

vpmuludq  %ymm2,%ymm9,%ymm1
vpmuludq  %ymm15,%ymm10,%ymm0
vpaddq    %ymm0,%ymm1,%ymm1
vpmuludq  %ymm14,%ymm11,%ymm0
vpaddq    %ymm0,%ymm1,%ymm1
vpmuludq  %ymm13,%ymm12,%ymm0
vpaddq    %ymm0,%ymm1,%ymm1
vpaddq    %ymm1,%ymm1,%ymm8
vpermq	  $68,%ymm8,%ymm1
vmovdqa   %ymm1,1504(%rsp)

vpmuludq  %ymm2,%ymm10,%ymm1
vpmuludq  %ymm15,%ymm11,%ymm0
vpaddq    %ymm0,%ymm1,%ymm1
vpmuludq  %ymm14,%ymm12,%ymm0
vpaddq    %ymm0,%ymm1,%ymm1
vpaddq    %ymm1,%ymm1,%ymm1
vpmuludq  %ymm13,%ymm13,%ymm0
vpaddq    %ymm0,%ymm1,%ymm9
vpermq	  $68,%ymm9,%ymm6

vpmuludq  %ymm2,%ymm11,%ymm1
vpmuludq  %ymm15,%ymm12,%ymm0
vpaddq    %ymm0,%ymm1,%ymm1
vpmuludq  %ymm14,%ymm13,%ymm0
vpaddq    %ymm0,%ymm1,%ymm1
vpaddq    %ymm1,%ymm1,%ymm10
vpermq	  $68,%ymm10,%ymm5

vpmuludq  %ymm2,%ymm12,%ymm1
vpmuludq  %ymm15,%ymm13,%ymm0
vpaddq    %ymm0,%ymm1,%ymm1
vpaddq    %ymm1,%ymm1,%ymm1
vpmuludq  %ymm14,%ymm14,%ymm0
vpaddq    %ymm0,%ymm1,%ymm11
vpermq	  $68,%ymm11,%ymm4

vpmuludq  %ymm2,%ymm13,%ymm1
vpmuludq  %ymm15,%ymm14,%ymm0
vpaddq    %ymm0,%ymm1,%ymm1
vpaddq    %ymm1,%ymm1,%ymm12
vpermq	  $68,%ymm12,%ymm3

vpmuludq  %ymm2,%ymm14,%ymm1
vpaddq    %ymm1,%ymm1,%ymm1
vpmuludq  %ymm15,%ymm15,%ymm0
vpaddq    %ymm0,%ymm1,%ymm13
vpermq	  $68,%ymm13,%ymm1
vmovdqa   %ymm1,1472(%rsp)

vpmuludq  %ymm2,%ymm15,%ymm1
vpaddq    %ymm1,%ymm1,%ymm14
vpermq	  $68,%ymm14,%ymm1
vmovdqa   %ymm1,1440(%rsp)

vpmuludq  %ymm2,%ymm2,%ymm15
vpermq	  $68,%ymm15,%ymm1
vmovdqa   %ymm1,1408(%rsp)

vmovdqa   1408(%rsp),%ymm0
vmovdqa   1440(%rsp),%ymm1
vmovdqa   1472(%rsp),%ymm2

vpsubq    320(%rsp),%ymm0,%ymm0
vpsubq    352(%rsp),%ymm1,%ymm1
vpsubq    384(%rsp),%ymm2,%ymm2
vpsubq    416(%rsp),%ymm3,%ymm3
vpsubq    448(%rsp),%ymm4,%ymm4
vpsubq    480(%rsp),%ymm5,%ymm5
vpsubq    512(%rsp),%ymm6,%ymm6

vmovdqa   1504(%rsp),%ymm7
vpsubq    544(%rsp),%ymm7,%ymm7
vmovdqa   %ymm7,1408(%rsp)

vmovdqa   1536(%rsp),%ymm7
vpsubq    576(%rsp),%ymm7,%ymm7
vmovdqa   %ymm7,1440(%rsp)

vpsubq    608(%rsp),%ymm8,%ymm8
vpsubq    640(%rsp),%ymm9,%ymm9
vpsubq    672(%rsp),%ymm10,%ymm10
vpsubq    704(%rsp),%ymm11,%ymm11
vpsubq    736(%rsp),%ymm12,%ymm12
vpsubq    768(%rsp),%ymm13,%ymm13
vpsubq    800(%rsp),%ymm14,%ymm14
vpsubq    832(%rsp),%ymm15,%ymm15

vpaddq    1152(%rsp),%ymm0,%ymm0
vpaddq    1184(%rsp),%ymm1,%ymm1
vpaddq    1216(%rsp),%ymm2,%ymm2
vpaddq    1248(%rsp),%ymm3,%ymm3
vpaddq    1280(%rsp),%ymm4,%ymm4
vpaddq    1312(%rsp),%ymm5,%ymm5
vpaddq    1344(%rsp),%ymm6,%ymm6
vmovdqa   1408(%rsp),%ymm7
vpaddq    1376(%rsp),%ymm7,%ymm7
vmovdqa   %ymm7,1408(%rsp)

vpaddq    %ymm8,%ymm8,%ymm8
vpaddq    864(%rsp),%ymm8,%ymm8
vpaddq    %ymm9,%ymm9,%ymm9
vpaddq    896(%rsp),%ymm9,%ymm9
vpaddq    %ymm10,%ymm10,%ymm10
vpaddq    928(%rsp),%ymm10,%ymm10
vpaddq    %ymm11,%ymm11,%ymm11
vpaddq    960(%rsp),%ymm11,%ymm11
vpaddq    %ymm12,%ymm12,%ymm12
vpaddq    992(%rsp),%ymm12,%ymm12
vpaddq    %ymm13,%ymm13,%ymm13
vpaddq    1024(%rsp),%ymm13,%ymm13
vpaddq    %ymm14,%ymm14,%ymm14
vpaddq    1056(%rsp),%ymm14,%ymm14
vpaddq    %ymm15,%ymm15,%ymm15
vpaddq    1088(%rsp),%ymm15,%ymm15

vpsrlq    $29,%ymm8,%ymm7
vpaddq    %ymm7,%ymm9,%ymm9
vpand     vecmask29,%ymm8,%ymm8

vpsrlq    $29,%ymm9,%ymm7
vpaddq    %ymm7,%ymm10,%ymm10
vpand     vecmask29,%ymm9,%ymm9

vpsrlq    $29,%ymm10,%ymm7
vpaddq    %ymm7,%ymm11,%ymm11
vpand     vecmask29,%ymm10,%ymm10

vpsrlq    $29,%ymm11,%ymm7
vpaddq    %ymm7,%ymm12,%ymm12
vpand     vecmask29,%ymm11,%ymm11

vpsrlq    $29,%ymm12,%ymm7
vpaddq    %ymm7,%ymm13,%ymm13
vpand     vecmask29,%ymm12,%ymm12

vpsrlq    $29,%ymm13,%ymm7
vpaddq    %ymm7,%ymm14,%ymm14
vpand     vecmask29,%ymm13,%ymm13

vpsrlq    $29,%ymm14,%ymm7
vpaddq    %ymm7,%ymm15,%ymm15
vpand     vecmask29,%ymm14,%ymm14

vmovdqa   %ymm10,128(%rsp)
vpsrlq    $29,%ymm15,%ymm7
vpaddq    1120(%rsp),%ymm7,%ymm10 
vpand     vecmask29,%ymm15,%ymm15

vpsrlq    $29,%ymm10,%ymm7
vpaddq    %ymm7,%ymm0,%ymm0
vpand     vecmask29,%ymm10,%ymm10

vpsrlq    $29,%ymm0,%ymm7
vpaddq    %ymm7,%ymm1,%ymm1
vpand     vecmask29,%ymm0,%ymm0

vpsrlq    $29,%ymm1,%ymm7
vpaddq    %ymm7,%ymm2,%ymm2
vpand     vecmask29,%ymm1,%ymm1

vpsrlq    $29,%ymm2,%ymm7
vpaddq    %ymm7,%ymm3,%ymm3
vpand     vecmask29,%ymm2,%ymm2

vpsrlq    $29,%ymm3,%ymm7
vpaddq    %ymm7,%ymm4,%ymm4
vpand     vecmask29,%ymm3,%ymm3

vpsrlq    $29,%ymm4,%ymm7
vpaddq    %ymm7,%ymm5,%ymm5
vpand     vecmask29,%ymm4,%ymm4

vpsrlq    $29,%ymm5,%ymm7
vpaddq    %ymm7,%ymm6,%ymm6
vpand     vecmask29,%ymm5,%ymm5

vpsrlq    $29,%ymm6,%ymm7
vpaddq    1408(%rsp),%ymm7,%ymm7
vpand     vecmask29,%ymm6,%ymm6

vmovdqa   %ymm10,160(%rsp)
vmovdqa   %ymm11,192(%rsp)

vpsrlq    $29,%ymm7,%ymm10
vpaddq    1440(%rsp),%ymm10,%ymm10
vpand     vecmask29,%ymm7,%ymm7

vpsrlq    $28,%ymm10,%ymm11
vpaddq    %ymm11,%ymm8,%ymm8
vpand     vecmask28,%ymm10,%ymm10

vpsrlq    $29,%ymm8,%ymm11
vpaddq    %ymm11,%ymm9,%ymm9
vpand     vecmask29,%ymm8,%ymm8

// MulC
vpmuludq  vec_c2,%ymm8,%ymm8
vpmuludq  vec_c2,%ymm9,%ymm9
vmovdqa   192(%rsp),%ymm11
vpmuludq  vec_c2,%ymm11,%ymm11
vmovdqa   %ymm11,192(%rsp)
vpmuludq  vec_c2,%ymm12,%ymm12
vpmuludq  vec_c2,%ymm13,%ymm13
vpmuludq  vec_c2,%ymm14,%ymm14
vpmuludq  vec_c2,%ymm15,%ymm15
vmovdqa   160(%rsp),%ymm11
vpmuludq  vec_c2,%ymm11,%ymm11
vmovdqa   %ymm11,160(%rsp)
vpmuludq  vec_c2,%ymm0,%ymm0
vpmuludq  vec_c2,%ymm1,%ymm1
vpmuludq  vec_c2,%ymm2,%ymm2
vpmuludq  vec_c2,%ymm3,%ymm3
vpmuludq  vec_c2,%ymm4,%ymm4
vpmuludq  vec_c2,%ymm5,%ymm5
vpmuludq  vec_c2,%ymm6,%ymm6
vpmuludq  vec_c2,%ymm7,%ymm7
vpmuludq  vec_c2,%ymm10,%ymm10
vmovdqa   %ymm10,64(%rsp)
vmovdqa   128(%rsp),%ymm10
vpmuludq  vec_c2,%ymm10,%ymm10

vpsrlq    $29,%ymm8,%ymm11
vpaddq    %ymm11,%ymm9,%ymm9
vpand     vecmask29,%ymm8,%ymm8
vmovdqa   %ymm8,128(%rsp)

vpsrlq    $29,%ymm9,%ymm11
vpaddq    %ymm11,%ymm10,%ymm10
vpand     vecmask29,%ymm9,%ymm9

vpsrlq    $29,%ymm10,%ymm11
vpaddq    192(%rsp),%ymm11,%ymm8
vpand     vecmask29,%ymm10,%ymm10

vpsrlq    $29,%ymm8,%ymm11
vpaddq    %ymm11,%ymm12,%ymm12
vpand     vecmask29,%ymm8,%ymm8
vmovdqa   %ymm8,192(%rsp)

vpsrlq    $29,%ymm12,%ymm11
vpaddq    %ymm11,%ymm13,%ymm13
vpand     vecmask29,%ymm12,%ymm12

vpsrlq    $29,%ymm13,%ymm11
vpaddq    %ymm11,%ymm14,%ymm14
vpand     vecmask29,%ymm13,%ymm13

vpsrlq    $29,%ymm14,%ymm11
vpaddq    %ymm11,%ymm15,%ymm15
vpand     vecmask29,%ymm14,%ymm14

vpsrlq    $29,%ymm15,%ymm11
vpaddq    160(%rsp),%ymm11,%ymm8
vpand     vecmask29,%ymm15,%ymm15

vpsrlq    $29,%ymm8,%ymm11
vpaddq    %ymm11,%ymm0,%ymm0
vpand     vecmask29,%ymm8,%ymm8
vmovdqa   %ymm8,96(%rsp)

vpsrlq    $29,%ymm0,%ymm11
vpaddq    %ymm11,%ymm1,%ymm1
vpand     vecmask29,%ymm0,%ymm0

vpsrlq    $29,%ymm1,%ymm11
vpaddq    %ymm11,%ymm2,%ymm2
vpand     vecmask29,%ymm1,%ymm1

vpsrlq    $29,%ymm2,%ymm11
vpaddq    %ymm11,%ymm3,%ymm3
vpand     vecmask29,%ymm2,%ymm2

vpsrlq    $29,%ymm3,%ymm11
vpaddq    %ymm11,%ymm4,%ymm4
vpand     vecmask29,%ymm3,%ymm3

vpsrlq    $29,%ymm4,%ymm11
vpaddq    %ymm11,%ymm5,%ymm5
vpand     vecmask29,%ymm4,%ymm4

vpsrlq    $29,%ymm5,%ymm11
vpaddq    %ymm11,%ymm6,%ymm6
vpand     vecmask29,%ymm5,%ymm5

vpsrlq    $29,%ymm6,%ymm11
vpaddq    %ymm11,%ymm7,%ymm7
vpand     vecmask29,%ymm6,%ymm6

vpsrlq    $29,%ymm7,%ymm11
vpaddq    64(%rsp),%ymm11,%ymm8
vpand     vecmask29,%ymm7,%ymm7

vpsrlq    $28,%ymm8,%ymm11
vpaddq    128(%rsp),%ymm11,%ymm11
vpand     vecmask28,%ymm8,%ymm8
vmovdqa   %ymm11,64(%rsp)

// Initialize-P
movdqa    16(%rsi),%xmm11
movdqa    %xmm11,64(%rsp)
movdqa    48(%rsi),%xmm9
movdqa    80(%rsi),%xmm10
movdqa    112(%rsi),%xmm11
movdqa    %xmm11,192(%rsp)
movdqa    144(%rsi),%xmm12
movdqa    176(%rsi),%xmm13
movdqa    208(%rsi),%xmm14
movdqa    240(%rsi),%xmm15
movdqa    272(%rsi),%xmm11
movdqa    %xmm11,96(%rsp)
movdqa    304(%rsi),%xmm0
movdqa    336(%rsi),%xmm1
movdqa    368(%rsi),%xmm2
movdqa    400(%rsi),%xmm3
movdqa    432(%rsi),%xmm4
movdqa    464(%rsi),%xmm5
movdqa    496(%rsi),%xmm6
movdqa    528(%rsi),%xmm7
movdqa    560(%rsi),%xmm8

vmovdqa   192(%rsp),%ymm11

movq      $64,%r15
movq	  $7,%rcx
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
vpsllq    $32,%ymm0,%ymm0
vpor      64(%rsp),%ymm0,%ymm0
vpsllq    $32,%ymm1,%ymm1
vpor      %ymm1,%ymm9,%ymm9
vpsllq    $32,%ymm2,%ymm2
vpor      %ymm2,%ymm10,%ymm10
vpsllq    $32,%ymm3,%ymm3
vpor      %ymm3,%ymm11,%ymm11
vpsllq    $32,%ymm4,%ymm4
vpor      %ymm4,%ymm12,%ymm12
vpsllq    $32,%ymm5,%ymm5
vpor      %ymm5,%ymm13,%ymm13
vpsllq    $32,%ymm6,%ymm6
vpor      %ymm6,%ymm14,%ymm14
vpsllq    $32,%ymm7,%ymm7
vpor      %ymm7,%ymm15,%ymm15
vpsllq    $32,%ymm8,%ymm8
vpor      96(%rsp),%ymm8,%ymm8

// Dense-HH
vpshufd	  $68,%ymm0,%ymm1
vpshufd	  $238,%ymm0,%ymm3
vpaddd    hh_p1d,%ymm1,%ymm1
vpxor     hh_xor,%ymm3,%ymm3
vpaddd    %ymm1,%ymm3,%ymm0

vpshufd	  $68,%ymm9,%ymm1
vpshufd	  $238,%ymm9,%ymm3
vpaddd    hh_p1d,%ymm1,%ymm1
vpxor     hh_xor,%ymm3,%ymm3
vpaddd    %ymm1,%ymm3,%ymm9

vpshufd	  $68,%ymm10,%ymm1
vpshufd	  $238,%ymm10,%ymm3
vpaddd    hh_p1d,%ymm1,%ymm1
vpxor     hh_xor,%ymm3,%ymm3
vpaddd    %ymm1,%ymm3,%ymm10

vpshufd	  $68,%ymm11,%ymm1
vpshufd	  $238,%ymm11,%ymm3
vpaddd    hh_p1d,%ymm1,%ymm1
vpxor     hh_xor,%ymm3,%ymm3
vpaddd    %ymm1,%ymm3,%ymm11

vpshufd	  $68,%ymm12,%ymm1
vpshufd	  $238,%ymm12,%ymm3
vpaddd    hh_p1d,%ymm1,%ymm1
vpxor     hh_xor,%ymm3,%ymm3
vpaddd    %ymm1,%ymm3,%ymm12

vpshufd	  $68,%ymm13,%ymm1
vpshufd	  $238,%ymm13,%ymm3
vpaddd    hh_p1d,%ymm1,%ymm1
vpxor     hh_xor,%ymm3,%ymm3
vpaddd    %ymm1,%ymm3,%ymm13

vpshufd	  $68,%ymm14,%ymm1
vpshufd	  $238,%ymm14,%ymm3
vpaddd    hh_p1d,%ymm1,%ymm1
vpxor     hh_xor,%ymm3,%ymm3
vpaddd    %ymm1,%ymm3,%ymm14

vpshufd	  $68,%ymm15,%ymm1
vpshufd	  $238,%ymm15,%ymm3
vpaddd    hh_p1d,%ymm1,%ymm1
vpxor     hh_xor,%ymm3,%ymm3
vpaddd    %ymm1,%ymm3,%ymm15

vpshufd	  $68,%ymm8,%ymm1
vpshufd	  $238,%ymm8,%ymm3
vpaddd    hh_p2d,%ymm1,%ymm1
vpxor     hh_xor,%ymm3,%ymm3
vpaddd    %ymm1,%ymm3,%ymm8

vpsrld    $29,%ymm0,%ymm1
vpaddd    %ymm1,%ymm9,%ymm9
vpand     vecmask29d,%ymm0,%ymm0

vpsrld    $29,%ymm9,%ymm1
vpaddd    %ymm1,%ymm10,%ymm10
vpand     vecmask29d,%ymm9,%ymm9

vpsrld    $29,%ymm10,%ymm1
vpaddd    %ymm1,%ymm11,%ymm11
vpand     vecmask29d,%ymm10,%ymm10

vpsrld    $29,%ymm11,%ymm1
vpaddd    %ymm1,%ymm12,%ymm12
vpand     vecmask29d,%ymm11,%ymm11

vpsrld    $29,%ymm12,%ymm1
vpaddd    %ymm1,%ymm13,%ymm13
vpand     vecmask29d,%ymm12,%ymm12

vpsrld    $29,%ymm13,%ymm1
vpaddd    %ymm1,%ymm14,%ymm14
vpand     vecmask29d,%ymm13,%ymm13

vpsrld    $29,%ymm14,%ymm1
vpaddd    %ymm1,%ymm15,%ymm15
vpand     vecmask29d,%ymm14,%ymm14

vpsrld    $29,%ymm15,%ymm1
vpaddd    %ymm1,%ymm8,%ymm8
vpand     vecmask29d,%ymm15,%ymm15

vpand     vecmask3,%ymm8,%ymm1
vpsllq    $3,%ymm1,%ymm1
vpaddd    %ymm1,%ymm0,%ymm0

vpand     vecmask4,%ymm8,%ymm1
vpsrlq    $60,%ymm1,%ymm1
vpaddd    %ymm1,%ymm0,%ymm0
vpand     vecmask2928d,%ymm8,%ymm8

// Pack-D2N
vmovdqa   %ymm0,320(%rsp)
vpsrlq    $32,%ymm0,%ymm1
vmovdqa   %ymm1,608(%rsp)

vmovdqa   %ymm9,352(%rsp)
vpsrlq    $32,%ymm9,%ymm1
vmovdqa   %ymm1,640(%rsp)

vmovdqa   %ymm10,384(%rsp)
vpsrlq    $32,%ymm10,%ymm1
vmovdqa   %ymm1,672(%rsp)

vmovdqa   %ymm11,416(%rsp)
vpsrlq    $32,%ymm11,%ymm1
vmovdqa   %ymm1,704(%rsp)

vmovdqa   %ymm12,448(%rsp)
vpsrlq    $32,%ymm12,%ymm1
vmovdqa   %ymm1,736(%rsp)

vmovdqa   %ymm13,480(%rsp)
vpsrlq    $32,%ymm13,%ymm1
vmovdqa   %ymm1,768(%rsp)

vmovdqa   %ymm14,512(%rsp)
vpsrlq    $32,%ymm14,%ymm1
vmovdqa   %ymm1,800(%rsp)

vmovdqa   %ymm15,544(%rsp)
vpsrlq    $32,%ymm15,%ymm1
vmovdqa   %ymm1,832(%rsp)

vmovdqa   %ymm8,576(%rsp)
vpsrlq    $32,%ymm8,%ymm1
vmovdqa   %ymm1,864(%rsp)

// Dense-CDup
vpbroadcastd 56(%rsp),%ymm1
vpaddd	  dup_c,%ymm1,%ymm1

vpermd	  %ymm0,%ymm1,%ymm0
vpermd	  %ymm9,%ymm1,%ymm9
vpermd	  %ymm10,%ymm1,%ymm10
vpermd	  %ymm11,%ymm1,%ymm11
vpermd	  %ymm12,%ymm1,%ymm12
vpermd	  %ymm13,%ymm1,%ymm13
vpermd	  %ymm14,%ymm1,%ymm14
vpermd	  %ymm15,%ymm1,%ymm15
vpermd	  %ymm8,%ymm1,%ymm8

// Pack-D2N
vmovdqa   %ymm0,64(%rsp)
vmovdqa   %ymm14,96(%rsp)
vmovdqa   %ymm15,128(%rsp)
vmovdqa   %ymm8,160(%rsp)

vpsrlq    $32,%ymm0,%ymm0
vpsrlq    $32,%ymm9,%ymm1
vpsrlq    $32,%ymm10,%ymm2
vpsrlq    $32,%ymm11,%ymm3
vpsrlq    $32,%ymm12,%ymm4
vpsrlq    $32,%ymm13,%ymm5
vpsrlq    $32,%ymm14,%ymm6
vpsrlq    $32,%ymm15,%ymm7
vpsrlq    $32,%ymm8,%ymm8

vmovdqa   %ymm0,192(%rsp)
vmovdqa   %ymm1,224(%rsp)
vmovdqa   %ymm2,256(%rsp)
vmovdqa   %ymm8,288(%rsp)

// Mul
vpmuludq  608(%rsp),%ymm0,%ymm15
vmovdqa   %ymm15,896(%rsp)

vpmuludq  640(%rsp),%ymm0,%ymm15
vpmuludq  608(%rsp),%ymm1,%ymm14
vpaddq    %ymm14,%ymm15,%ymm15
vmovdqa   %ymm15,928(%rsp)

vpmuludq  672(%rsp),%ymm0,%ymm15
vpmuludq  640(%rsp),%ymm1,%ymm14
vpaddq    %ymm14,%ymm15,%ymm15
vpmuludq  608(%rsp),%ymm2,%ymm14
vpaddq    %ymm14,%ymm15,%ymm15
vmovdqa   %ymm15,960(%rsp)

vpmuludq  704(%rsp),%ymm0,%ymm15
vpmuludq  672(%rsp),%ymm1,%ymm14
vpaddq    %ymm14,%ymm15,%ymm15
vpmuludq  640(%rsp),%ymm2,%ymm14
vpaddq    %ymm14,%ymm15,%ymm15
vpmuludq  608(%rsp),%ymm3,%ymm14
vpaddq    %ymm14,%ymm15,%ymm15
vmovdqa   %ymm15,992(%rsp)

vpmuludq  736(%rsp),%ymm0,%ymm15
vpmuludq  704(%rsp),%ymm1,%ymm14
vpaddq    %ymm14,%ymm15,%ymm15
vpmuludq  672(%rsp),%ymm2,%ymm14
vpaddq    %ymm14,%ymm15,%ymm15
vpmuludq  640(%rsp),%ymm3,%ymm14
vpaddq    %ymm14,%ymm15,%ymm15
vpmuludq  608(%rsp),%ymm4,%ymm14
vpaddq    %ymm14,%ymm15,%ymm15
vmovdqa   %ymm15,1024(%rsp)

vpmuludq  768(%rsp),%ymm0,%ymm15
vpmuludq  736(%rsp),%ymm1,%ymm14
vpaddq    %ymm14,%ymm15,%ymm15
vpmuludq  704(%rsp),%ymm2,%ymm14
vpaddq    %ymm14,%ymm15,%ymm15
vpmuludq  672(%rsp),%ymm3,%ymm14
vpaddq    %ymm14,%ymm15,%ymm15
vpmuludq  640(%rsp),%ymm4,%ymm14
vpaddq    %ymm14,%ymm15,%ymm15
vpmuludq  608(%rsp),%ymm5,%ymm14
vpaddq    %ymm14,%ymm15,%ymm15
vmovdqa   %ymm15,1056(%rsp)

vpmuludq  800(%rsp),%ymm0,%ymm15
vpmuludq  768(%rsp),%ymm1,%ymm14
vpaddq    %ymm14,%ymm15,%ymm15
vpmuludq  736(%rsp),%ymm2,%ymm14
vpaddq    %ymm14,%ymm15,%ymm15
vpmuludq  704(%rsp),%ymm3,%ymm14
vpaddq    %ymm14,%ymm15,%ymm15
vpmuludq  672(%rsp),%ymm4,%ymm14
vpaddq    %ymm14,%ymm15,%ymm15
vpmuludq  640(%rsp),%ymm5,%ymm14
vpaddq    %ymm14,%ymm15,%ymm15
vpmuludq  608(%rsp),%ymm6,%ymm14
vpaddq    %ymm14,%ymm15,%ymm15
vmovdqa   %ymm15,1088(%rsp)

vpmuludq  832(%rsp),%ymm0,%ymm15
vpmuludq  800(%rsp),%ymm1,%ymm14
vpaddq    %ymm14,%ymm15,%ymm15
vpmuludq  768(%rsp),%ymm2,%ymm14
vpaddq    %ymm14,%ymm15,%ymm15
vpmuludq  736(%rsp),%ymm3,%ymm14
vpaddq    %ymm14,%ymm15,%ymm15
vpmuludq  704(%rsp),%ymm4,%ymm14
vpaddq    %ymm14,%ymm15,%ymm15
vpmuludq  672(%rsp),%ymm5,%ymm14
vpaddq    %ymm14,%ymm15,%ymm15
vpmuludq  640(%rsp),%ymm6,%ymm14
vpaddq    %ymm14,%ymm15,%ymm15
vpmuludq  608(%rsp),%ymm7,%ymm14
vpaddq    %ymm14,%ymm15,%ymm15
vmovdqa   %ymm15,1120(%rsp)

vpmuludq  864(%rsp),%ymm0,%ymm15
vpmuludq  832(%rsp),%ymm1,%ymm14
vpaddq    %ymm14,%ymm15,%ymm15
vpmuludq  800(%rsp),%ymm2,%ymm14
vpaddq    %ymm14,%ymm15,%ymm15
vpmuludq  768(%rsp),%ymm3,%ymm14
vpaddq    %ymm14,%ymm15,%ymm15
vpmuludq  736(%rsp),%ymm4,%ymm14
vpaddq    %ymm14,%ymm15,%ymm15
vpmuludq  704(%rsp),%ymm5,%ymm14
vpaddq    %ymm14,%ymm15,%ymm15
vpmuludq  672(%rsp),%ymm6,%ymm14
vpaddq    %ymm14,%ymm15,%ymm15
vpmuludq  640(%rsp),%ymm7,%ymm14
vpaddq    %ymm14,%ymm15,%ymm15
vpmuludq  608(%rsp),%ymm8,%ymm14
vpaddq    %ymm14,%ymm15,%ymm15
vmovdqa   %ymm15,1152(%rsp)

vpmuludq  864(%rsp),%ymm1,%ymm15
vpmuludq  832(%rsp),%ymm2,%ymm14
vpaddq    %ymm14,%ymm15,%ymm15
vpmuludq  800(%rsp),%ymm3,%ymm14
vpaddq    %ymm14,%ymm15,%ymm15
vpmuludq  768(%rsp),%ymm4,%ymm14
vpaddq    %ymm14,%ymm15,%ymm15
vpmuludq  736(%rsp),%ymm5,%ymm14
vpaddq    %ymm14,%ymm15,%ymm15
vpmuludq  704(%rsp),%ymm6,%ymm14
vpaddq    %ymm14,%ymm15,%ymm15
vpmuludq  672(%rsp),%ymm7,%ymm14
vpaddq    %ymm14,%ymm15,%ymm15
vpmuludq  640(%rsp),%ymm8,%ymm14
vpaddq    %ymm14,%ymm15,%ymm15
vmovdqa   %ymm15,1184(%rsp)

vpmuludq  864(%rsp),%ymm2,%ymm15
vpmuludq  832(%rsp),%ymm3,%ymm14
vpaddq    %ymm14,%ymm15,%ymm15
vpmuludq  800(%rsp),%ymm4,%ymm14
vpaddq    %ymm14,%ymm15,%ymm15
vpmuludq  768(%rsp),%ymm5,%ymm14
vpaddq    %ymm14,%ymm15,%ymm15
vpmuludq  736(%rsp),%ymm6,%ymm14
vpaddq    %ymm14,%ymm15,%ymm15
vpmuludq  704(%rsp),%ymm7,%ymm14
vpaddq    %ymm14,%ymm15,%ymm15
vpmuludq  672(%rsp),%ymm8,%ymm14
vpaddq    %ymm14,%ymm15,%ymm15
vmovdqa   %ymm15,1216(%rsp)

vpmuludq  864(%rsp),%ymm3,%ymm15
vpmuludq  832(%rsp),%ymm4,%ymm14
vpaddq    %ymm14,%ymm15,%ymm15
vpmuludq  800(%rsp),%ymm5,%ymm14
vpaddq    %ymm14,%ymm15,%ymm15
vpmuludq  768(%rsp),%ymm6,%ymm14
vpaddq    %ymm14,%ymm15,%ymm15
vpmuludq  736(%rsp),%ymm7,%ymm14
vpaddq    %ymm14,%ymm15,%ymm15
vpmuludq  704(%rsp),%ymm8,%ymm14
vpaddq    %ymm14,%ymm15,%ymm15
vmovdqa   %ymm15,1248(%rsp)

vpmuludq  864(%rsp),%ymm4,%ymm15
vpmuludq  832(%rsp),%ymm5,%ymm14
vpaddq    %ymm14,%ymm15,%ymm15
vpmuludq  800(%rsp),%ymm6,%ymm14
vpaddq    %ymm14,%ymm15,%ymm15
vpmuludq  768(%rsp),%ymm7,%ymm14
vpaddq    %ymm14,%ymm15,%ymm15
vpmuludq  736(%rsp),%ymm8,%ymm14
vpaddq    %ymm14,%ymm15,%ymm15
vmovdqa   %ymm15,1280(%rsp)

vpmuludq  864(%rsp),%ymm5,%ymm15
vpmuludq  832(%rsp),%ymm6,%ymm14
vpaddq    %ymm14,%ymm15,%ymm15
vpmuludq  800(%rsp),%ymm7,%ymm14
vpaddq    %ymm14,%ymm15,%ymm15
vpmuludq  768(%rsp),%ymm8,%ymm14
vpaddq    %ymm14,%ymm15,%ymm15
vmovdqa   %ymm15,1312(%rsp)

vpmuludq  864(%rsp),%ymm6,%ymm15
vpmuludq  832(%rsp),%ymm7,%ymm14
vpaddq    %ymm14,%ymm15,%ymm15
vpmuludq  800(%rsp),%ymm8,%ymm14
vpaddq    %ymm14,%ymm15,%ymm15
vmovdqa   %ymm15,1344(%rsp)

vpmuludq  864(%rsp),%ymm7,%ymm15
vpmuludq  832(%rsp),%ymm8,%ymm14
vpaddq    %ymm14,%ymm15,%ymm15
vmovdqa   %ymm15,1376(%rsp)

vpmuludq  864(%rsp),%ymm8,%ymm15
vmovdqa   %ymm15,1408(%rsp)

vmovdqa   64(%rsp),%ymm8
vmovdqa   96(%rsp),%ymm14
vmovdqa   128(%rsp),%ymm15
vmovdqa   160(%rsp),%ymm2

vpmuludq  320(%rsp),%ymm8,%ymm1
vpaddq    896(%rsp),%ymm1,%ymm1 
vmovdqa   %ymm1,1440(%rsp)
vpaddq    896(%rsp),%ymm1,%ymm1     
vmovdqa   %ymm1,896(%rsp)

vpmuludq  352(%rsp),%ymm8,%ymm1
vpmuludq  320(%rsp),%ymm9,%ymm0
vpaddq    %ymm0,%ymm1,%ymm1
vpaddq    928(%rsp),%ymm1,%ymm1
vmovdqa   %ymm1,1472(%rsp)
vpaddq    928(%rsp),%ymm1,%ymm1
vmovdqa   %ymm1,928(%rsp)

vpmuludq  384(%rsp),%ymm8,%ymm1
vpmuludq  352(%rsp),%ymm9,%ymm0
vpaddq    %ymm0,%ymm1,%ymm1
vpmuludq  320(%rsp),%ymm10,%ymm0
vpaddq    %ymm0,%ymm1,%ymm1
vpaddq    960(%rsp),%ymm1,%ymm1
vmovdqa   %ymm1,1504(%rsp)
vpaddq    960(%rsp),%ymm1,%ymm1
vmovdqa   %ymm1,960(%rsp)

vpmuludq  416(%rsp),%ymm8,%ymm1
vpmuludq  384(%rsp),%ymm9,%ymm0
vpaddq    %ymm0,%ymm1,%ymm1
vpmuludq  352(%rsp),%ymm10,%ymm0
vpaddq    %ymm0,%ymm1,%ymm1
vpmuludq  320(%rsp),%ymm11,%ymm0
vpaddq    %ymm0,%ymm1,%ymm1
vpaddq    992(%rsp),%ymm1,%ymm1
vmovdqa   %ymm1,1536(%rsp)
vpaddq    992(%rsp),%ymm1,%ymm1
vmovdqa   %ymm1,992(%rsp)

vpmuludq  448(%rsp),%ymm8,%ymm1
vpmuludq  416(%rsp),%ymm9,%ymm0
vpaddq    %ymm0,%ymm1,%ymm1
vpmuludq  384(%rsp),%ymm10,%ymm0
vpaddq    %ymm0,%ymm1,%ymm1
vpmuludq  352(%rsp),%ymm11,%ymm0
vpaddq    %ymm0,%ymm1,%ymm1
vpmuludq  320(%rsp),%ymm12,%ymm0
vpaddq    %ymm0,%ymm1,%ymm1
vpaddq    1024(%rsp),%ymm1,%ymm1
vmovdqa   %ymm1,1568(%rsp)
vpaddq    1024(%rsp),%ymm1,%ymm1
vmovdqa   %ymm1,1024(%rsp)

vpmuludq  480(%rsp),%ymm8,%ymm1
vpmuludq  448(%rsp),%ymm9,%ymm0
vpaddq    %ymm0,%ymm1,%ymm1
vpmuludq  416(%rsp),%ymm10,%ymm0
vpaddq    %ymm0,%ymm1,%ymm1
vpmuludq  384(%rsp),%ymm11,%ymm0
vpaddq    %ymm0,%ymm1,%ymm1
vpmuludq  352(%rsp),%ymm12,%ymm0
vpaddq    %ymm0,%ymm1,%ymm1
vpmuludq  320(%rsp),%ymm13,%ymm0
vpaddq    %ymm0,%ymm1,%ymm1
vpaddq    1056(%rsp),%ymm1,%ymm1
vmovdqa   %ymm1,1600(%rsp)
vpaddq    1056(%rsp),%ymm1,%ymm1
vmovdqa   %ymm1,1056(%rsp)

vpmuludq  512(%rsp),%ymm8,%ymm1
vpmuludq  480(%rsp),%ymm9,%ymm0
vpaddq    %ymm0,%ymm1,%ymm1
vpmuludq  448(%rsp),%ymm10,%ymm0
vpaddq    %ymm0,%ymm1,%ymm1
vpmuludq  416(%rsp),%ymm11,%ymm0
vpaddq    %ymm0,%ymm1,%ymm1
vpmuludq  384(%rsp),%ymm12,%ymm0
vpaddq    %ymm0,%ymm1,%ymm1
vpmuludq  352(%rsp),%ymm13,%ymm0
vpaddq    %ymm0,%ymm1,%ymm1
vpmuludq  320(%rsp),%ymm14,%ymm0
vpaddq    %ymm0,%ymm1,%ymm1
vpaddq    1088(%rsp),%ymm1,%ymm1
vmovdqa   %ymm1,1632(%rsp)
vpaddq    1088(%rsp),%ymm1,%ymm1
vmovdqa   %ymm1,1088(%rsp)

vpmuludq  544(%rsp),%ymm8,%ymm1
vpmuludq  512(%rsp),%ymm9,%ymm0
vpaddq    %ymm0,%ymm1,%ymm1
vpmuludq  480(%rsp),%ymm10,%ymm0
vpaddq    %ymm0,%ymm1,%ymm1
vpmuludq  448(%rsp),%ymm11,%ymm0
vpaddq    %ymm0,%ymm1,%ymm1
vpmuludq  416(%rsp),%ymm12,%ymm0
vpaddq    %ymm0,%ymm1,%ymm1
vpmuludq  384(%rsp),%ymm13,%ymm0
vpaddq    %ymm0,%ymm1,%ymm1
vpmuludq  352(%rsp),%ymm14,%ymm0
vpaddq    %ymm0,%ymm1,%ymm1
vpmuludq  320(%rsp),%ymm15,%ymm0
vpaddq    %ymm0,%ymm1,%ymm1
vpaddq    1120(%rsp),%ymm1,%ymm1
vmovdqa   %ymm1,1664(%rsp)
vpaddq    1120(%rsp),%ymm1,%ymm1
vmovdqa   %ymm1,1120(%rsp)

vpmuludq  576(%rsp),%ymm8,%ymm1
vpmuludq  544(%rsp),%ymm9,%ymm0
vpaddq    %ymm0,%ymm1,%ymm1
vpmuludq  512(%rsp),%ymm10,%ymm0
vpaddq    %ymm0,%ymm1,%ymm1
vpmuludq  480(%rsp),%ymm11,%ymm0
vpaddq    %ymm0,%ymm1,%ymm1
vpmuludq  448(%rsp),%ymm12,%ymm0
vpaddq    %ymm0,%ymm1,%ymm1
vpmuludq  416(%rsp),%ymm13,%ymm0
vpaddq    %ymm0,%ymm1,%ymm1
vpmuludq  384(%rsp),%ymm14,%ymm0
vpaddq    %ymm0,%ymm1,%ymm1
vpmuludq  352(%rsp),%ymm15,%ymm0
vpaddq    %ymm0,%ymm1,%ymm1
vpmuludq  320(%rsp),%ymm2,%ymm0
vpaddq    %ymm0,%ymm1,%ymm1
vpaddq    1152(%rsp),%ymm1,%ymm1
vmovdqa   %ymm1,1696(%rsp)
vpaddq    1152(%rsp),%ymm1,%ymm1
vmovdqa   %ymm1,1152(%rsp)

vpmuludq  576(%rsp),%ymm9,%ymm1
vpmuludq  544(%rsp),%ymm10,%ymm0
vpaddq    %ymm0,%ymm1,%ymm1
vpmuludq  512(%rsp),%ymm11,%ymm0
vpaddq    %ymm0,%ymm1,%ymm1
vpmuludq  480(%rsp),%ymm12,%ymm0
vpaddq    %ymm0,%ymm1,%ymm1
vpmuludq  448(%rsp),%ymm13,%ymm0
vpaddq    %ymm0,%ymm1,%ymm1
vpmuludq  416(%rsp),%ymm14,%ymm0
vpaddq    %ymm0,%ymm1,%ymm1
vpmuludq  384(%rsp),%ymm15,%ymm0
vpaddq    %ymm0,%ymm1,%ymm1
vpmuludq  352(%rsp),%ymm2,%ymm0
vpaddq    %ymm0,%ymm1,%ymm1
vpaddq    1184(%rsp),%ymm1,%ymm1
vmovdqa   %ymm1,1728(%rsp)
vpaddq    1184(%rsp),%ymm1,%ymm1
vmovdqa   %ymm1,1184(%rsp)

vpmuludq  576(%rsp),%ymm10,%ymm1
vpmuludq  544(%rsp),%ymm11,%ymm0
vpaddq    %ymm0,%ymm1,%ymm1
vpmuludq  512(%rsp),%ymm12,%ymm0
vpaddq    %ymm0,%ymm1,%ymm1
vpmuludq  480(%rsp),%ymm13,%ymm0
vpaddq    %ymm0,%ymm1,%ymm1
vpmuludq  448(%rsp),%ymm14,%ymm0
vpaddq    %ymm0,%ymm1,%ymm1
vpmuludq  416(%rsp),%ymm15,%ymm0
vpaddq    %ymm0,%ymm1,%ymm1
vpmuludq  384(%rsp),%ymm2,%ymm0
vpaddq    %ymm0,%ymm1,%ymm1
vpaddq    1216(%rsp),%ymm1,%ymm1
vmovdqa   %ymm1,1760(%rsp)
vpaddq    1216(%rsp),%ymm1,%ymm1
vmovdqa   %ymm1,1216(%rsp)

vpmuludq  576(%rsp),%ymm11,%ymm1
vpmuludq  544(%rsp),%ymm12,%ymm0
vpaddq    %ymm0,%ymm1,%ymm1
vpmuludq  512(%rsp),%ymm13,%ymm0
vpaddq    %ymm0,%ymm1,%ymm1
vpmuludq  480(%rsp),%ymm14,%ymm0
vpaddq    %ymm0,%ymm1,%ymm1
vpmuludq  448(%rsp),%ymm15,%ymm0
vpaddq    %ymm0,%ymm1,%ymm1
vpmuludq  416(%rsp),%ymm2,%ymm0
vpaddq    %ymm0,%ymm1,%ymm1
vpaddq    1248(%rsp),%ymm1,%ymm1
vmovdqa   %ymm1,1792(%rsp)
vpaddq    1248(%rsp),%ymm1,%ymm1
vmovdqa   %ymm1,1248(%rsp)

vpmuludq  576(%rsp),%ymm12,%ymm1
vpmuludq  544(%rsp),%ymm13,%ymm0
vpaddq    %ymm0,%ymm1,%ymm1
vpmuludq  512(%rsp),%ymm14,%ymm0
vpaddq    %ymm0,%ymm1,%ymm1
vpmuludq  480(%rsp),%ymm15,%ymm0
vpaddq    %ymm0,%ymm1,%ymm1
vpmuludq  448(%rsp),%ymm2,%ymm0
vpaddq    %ymm0,%ymm1,%ymm1
vpaddq    1280(%rsp),%ymm1,%ymm1
vmovdqa   %ymm1,1824(%rsp)
vpaddq    1280(%rsp),%ymm1,%ymm1
vmovdqa   %ymm1,1280(%rsp)

vpmuludq  576(%rsp),%ymm13,%ymm1
vpmuludq  544(%rsp),%ymm14,%ymm0
vpaddq    %ymm0,%ymm1,%ymm1
vpmuludq  512(%rsp),%ymm15,%ymm0
vpaddq    %ymm0,%ymm1,%ymm1
vpmuludq  480(%rsp),%ymm2,%ymm0
vpaddq    %ymm0,%ymm1,%ymm1
vpaddq    1312(%rsp),%ymm1,%ymm1
vmovdqa   %ymm1,1856(%rsp)
vpaddq    1312(%rsp),%ymm1,%ymm1
vmovdqa   %ymm1,1312(%rsp)

vpmuludq  576(%rsp),%ymm14,%ymm1
vpmuludq  544(%rsp),%ymm15,%ymm0
vpaddq    %ymm0,%ymm1,%ymm1
vpmuludq  512(%rsp),%ymm2,%ymm0
vpaddq    %ymm0,%ymm1,%ymm1
vpaddq    1344(%rsp),%ymm1,%ymm1
vmovdqa   %ymm1,1888(%rsp)
vpaddq    1344(%rsp),%ymm1,%ymm1
vmovdqa   %ymm1,1344(%rsp)

vpmuludq  576(%rsp),%ymm15,%ymm1
vpmuludq  544(%rsp),%ymm2,%ymm0
vpaddq    %ymm0,%ymm1,%ymm1
vpaddq    1376(%rsp),%ymm1,%ymm1
vmovdqa   %ymm1,1920(%rsp)
vpaddq    1376(%rsp),%ymm1,%ymm1
vmovdqa   %ymm1,1376(%rsp)

vpmuludq  576(%rsp),%ymm2,%ymm1
vpaddq    1408(%rsp),%ymm1,%ymm1
vmovdqa   %ymm1,1952(%rsp)
vpaddq    1408(%rsp),%ymm1,%ymm1
vmovdqa   %ymm1,1408(%rsp)

vpaddq    192(%rsp),%ymm8,%ymm8
vpaddq    224(%rsp),%ymm9,%ymm9
vpaddq    256(%rsp),%ymm10,%ymm10
vpaddq    %ymm3,%ymm11,%ymm11
vpaddq    %ymm4,%ymm12,%ymm12
vpaddq    %ymm5,%ymm13,%ymm13
vpaddq    %ymm6,%ymm14,%ymm14
vpaddq    %ymm7,%ymm15,%ymm15

vmovdqa   %ymm14,1984(%rsp)
vmovdqa   %ymm15,2016(%rsp)

vmovdqa   160(%rsp),%ymm14
vpaddq    288(%rsp),%ymm14,%ymm14
vmovdqa   %ymm14,2048(%rsp)

vmovdqa   320(%rsp),%ymm0
vmovdqa   352(%rsp),%ymm1
vmovdqa   384(%rsp),%ymm2
vmovdqa   416(%rsp),%ymm3
vmovdqa   448(%rsp),%ymm4
vmovdqa   480(%rsp),%ymm5
vmovdqa   512(%rsp),%ymm6
vmovdqa   544(%rsp),%ymm7

vpaddq    608(%rsp),%ymm0,%ymm0
vpaddq    640(%rsp),%ymm1,%ymm1
vpaddq    672(%rsp),%ymm2,%ymm2
vpaddq    704(%rsp),%ymm3,%ymm3
vpaddq    736(%rsp),%ymm4,%ymm4
vpaddq    768(%rsp),%ymm5,%ymm5
vpaddq    800(%rsp),%ymm6,%ymm6
vpaddq    832(%rsp),%ymm7,%ymm7

vmovdqa   576(%rsp),%ymm14
vpaddq    864(%rsp),%ymm14,%ymm14
vmovdqa   %ymm14,2080(%rsp)

vpmuludq  %ymm8,%ymm0,%ymm15
vmovdqa   %ymm15,2112(%rsp)

vpmuludq  %ymm9,%ymm0,%ymm15
vpmuludq  %ymm8,%ymm1,%ymm14
vpaddq    %ymm14,%ymm15,%ymm15
vmovdqa   %ymm15,2144(%rsp)

vpmuludq  %ymm10,%ymm0,%ymm15
vpmuludq  %ymm9,%ymm1,%ymm14
vpaddq    %ymm14,%ymm15,%ymm15
vpmuludq  %ymm8,%ymm2,%ymm14
vpaddq    %ymm14,%ymm15,%ymm15
vmovdqa   %ymm15,2176(%rsp)

vpmuludq  %ymm11,%ymm0,%ymm15
vpmuludq  %ymm10,%ymm1,%ymm14
vpaddq    %ymm14,%ymm15,%ymm15
vpmuludq  %ymm9,%ymm2,%ymm14
vpaddq    %ymm14,%ymm15,%ymm15
vpmuludq  %ymm8,%ymm3,%ymm14
vpaddq    %ymm14,%ymm15,%ymm15
vmovdqa   %ymm15,2208(%rsp)

vpmuludq  %ymm12,%ymm0,%ymm15
vpmuludq  %ymm11,%ymm1,%ymm14
vpaddq    %ymm14,%ymm15,%ymm15
vpmuludq  %ymm10,%ymm2,%ymm14
vpaddq    %ymm14,%ymm15,%ymm15
vpmuludq  %ymm9,%ymm3,%ymm14
vpaddq    %ymm14,%ymm15,%ymm15
vpmuludq  %ymm8,%ymm4,%ymm14
vpaddq    %ymm14,%ymm15,%ymm15
vmovdqa   %ymm15,2240(%rsp)

vpmuludq  %ymm13,%ymm0,%ymm15
vpmuludq  %ymm12,%ymm1,%ymm14
vpaddq    %ymm14,%ymm15,%ymm15
vpmuludq  %ymm11,%ymm2,%ymm14
vpaddq    %ymm14,%ymm15,%ymm15
vpmuludq  %ymm10,%ymm3,%ymm14
vpaddq    %ymm14,%ymm15,%ymm15
vpmuludq  %ymm9,%ymm4,%ymm14
vpaddq    %ymm14,%ymm15,%ymm15
vpmuludq  %ymm8,%ymm5,%ymm14
vpaddq    %ymm14,%ymm15,%ymm15
vmovdqa   %ymm15,2272(%rsp)

vpmuludq  1984(%rsp),%ymm0,%ymm15
vpmuludq  %ymm13,%ymm1,%ymm14
vpaddq    %ymm14,%ymm15,%ymm15
vpmuludq  %ymm12,%ymm2,%ymm14
vpaddq    %ymm14,%ymm15,%ymm15
vpmuludq  %ymm11,%ymm3,%ymm14
vpaddq    %ymm14,%ymm15,%ymm15
vpmuludq  %ymm10,%ymm4,%ymm14
vpaddq    %ymm14,%ymm15,%ymm15
vpmuludq  %ymm9,%ymm5,%ymm14
vpaddq    %ymm14,%ymm15,%ymm15
vpmuludq  %ymm8,%ymm6,%ymm14
vpaddq    %ymm14,%ymm15,%ymm15
vmovdqa   %ymm15,2304(%rsp)

vpmuludq  2016(%rsp),%ymm0,%ymm15
vpmuludq  1984(%rsp),%ymm1,%ymm14
vpaddq    %ymm14,%ymm15,%ymm15
vpmuludq  %ymm13,%ymm2,%ymm14
vpaddq    %ymm14,%ymm15,%ymm15
vpmuludq  %ymm12,%ymm3,%ymm14
vpaddq    %ymm14,%ymm15,%ymm15
vpmuludq  %ymm11,%ymm4,%ymm14
vpaddq    %ymm14,%ymm15,%ymm15
vpmuludq  %ymm10,%ymm5,%ymm14
vpaddq    %ymm14,%ymm15,%ymm15
vpmuludq  %ymm9,%ymm6,%ymm14
vpaddq    %ymm14,%ymm15,%ymm15
vpmuludq  %ymm8,%ymm7,%ymm14
vpaddq    %ymm14,%ymm15,%ymm15
vmovdqa   %ymm15,2336(%rsp)

vpmuludq  2048(%rsp),%ymm0,%ymm15
vpmuludq  2016(%rsp),%ymm1,%ymm14
vpaddq    %ymm14,%ymm15,%ymm15
vpmuludq  1984(%rsp),%ymm2,%ymm14
vpaddq    %ymm14,%ymm15,%ymm15
vpmuludq  %ymm13,%ymm3,%ymm14
vpaddq    %ymm14,%ymm15,%ymm15
vpmuludq  %ymm12,%ymm4,%ymm14
vpaddq    %ymm14,%ymm15,%ymm15
vpmuludq  %ymm11,%ymm5,%ymm14
vpaddq    %ymm14,%ymm15,%ymm15
vpmuludq  %ymm10,%ymm6,%ymm14
vpaddq    %ymm14,%ymm15,%ymm15
vpmuludq  %ymm9,%ymm7,%ymm14
vpaddq    %ymm14,%ymm15,%ymm15
vpmuludq  2080(%rsp),%ymm8,%ymm14
vpaddq    %ymm14,%ymm15,%ymm15
vmovdqa   %ymm15,2368(%rsp)

vpmuludq  2048(%rsp),%ymm1,%ymm15
vpmuludq  2016(%rsp),%ymm2,%ymm14
vpaddq    %ymm14,%ymm15,%ymm15
vpmuludq  1984(%rsp),%ymm3,%ymm14
vpaddq    %ymm14,%ymm15,%ymm15
vpmuludq  %ymm13,%ymm4,%ymm14
vpaddq    %ymm14,%ymm15,%ymm15
vpmuludq  %ymm12,%ymm5,%ymm14
vpaddq    %ymm14,%ymm15,%ymm15
vpmuludq  %ymm11,%ymm6,%ymm14
vpaddq    %ymm14,%ymm15,%ymm15
vpmuludq  %ymm10,%ymm7,%ymm14
vpaddq    %ymm14,%ymm15,%ymm15
vpmuludq  2080(%rsp),%ymm9,%ymm14
vpaddq    %ymm14,%ymm15,%ymm8

vpmuludq  2048(%rsp),%ymm2,%ymm15
vpmuludq  2016(%rsp),%ymm3,%ymm14
vpaddq    %ymm14,%ymm15,%ymm15
vpmuludq  1984(%rsp),%ymm4,%ymm14
vpaddq    %ymm14,%ymm15,%ymm15
vpmuludq  %ymm13,%ymm5,%ymm14
vpaddq    %ymm14,%ymm15,%ymm15
vpmuludq  %ymm12,%ymm6,%ymm14
vpaddq    %ymm14,%ymm15,%ymm15
vpmuludq  %ymm11,%ymm7,%ymm14
vpaddq    %ymm14,%ymm15,%ymm15
vpmuludq  2080(%rsp),%ymm10,%ymm14
vpaddq    %ymm14,%ymm15,%ymm9

vpmuludq  2048(%rsp),%ymm3,%ymm15
vpmuludq  2016(%rsp),%ymm4,%ymm14
vpaddq    %ymm14,%ymm15,%ymm15
vpmuludq  1984(%rsp),%ymm5,%ymm14
vpaddq    %ymm14,%ymm15,%ymm15
vpmuludq  %ymm13,%ymm6,%ymm14
vpaddq    %ymm14,%ymm15,%ymm15
vpmuludq  %ymm12,%ymm7,%ymm14
vpaddq    %ymm14,%ymm15,%ymm15
vpmuludq  2080(%rsp),%ymm11,%ymm14
vpaddq    %ymm14,%ymm15,%ymm10

vpmuludq  2048(%rsp),%ymm4,%ymm15
vpmuludq  2016(%rsp),%ymm5,%ymm14
vpaddq    %ymm14,%ymm15,%ymm15
vpmuludq  1984(%rsp),%ymm6,%ymm14
vpaddq    %ymm14,%ymm15,%ymm15
vpmuludq  %ymm13,%ymm7,%ymm14
vpaddq    %ymm14,%ymm15,%ymm15
vpmuludq  2080(%rsp),%ymm12,%ymm14
vpaddq    %ymm14,%ymm15,%ymm11

vpmuludq  2048(%rsp),%ymm5,%ymm15
vpmuludq  2016(%rsp),%ymm6,%ymm14
vpaddq    %ymm14,%ymm15,%ymm15
vpmuludq  1984(%rsp),%ymm7,%ymm14
vpaddq    %ymm14,%ymm15,%ymm15
vpmuludq  2080(%rsp),%ymm13,%ymm14
vpaddq    %ymm14,%ymm15,%ymm12

vpmuludq  2048(%rsp),%ymm6,%ymm15
vpmuludq  2016(%rsp),%ymm7,%ymm14
vpaddq    %ymm14,%ymm15,%ymm15
vmovdqa   2080(%rsp),%ymm14
vpmuludq  1984(%rsp),%ymm14,%ymm14
vpaddq    %ymm14,%ymm15,%ymm13

vpmuludq  2048(%rsp),%ymm7,%ymm15
vmovdqa   2080(%rsp),%ymm14
vpmuludq  2016(%rsp),%ymm14,%ymm14
vpaddq    %ymm14,%ymm15,%ymm14

vmovdqa   2080(%rsp),%ymm15
vpmuludq  2048(%rsp),%ymm15,%ymm15

vmovdqa   2112(%rsp),%ymm0
vmovdqa   2144(%rsp),%ymm1
vmovdqa   2176(%rsp),%ymm2
vmovdqa   2208(%rsp),%ymm3
vmovdqa   2240(%rsp),%ymm4
vmovdqa   2272(%rsp),%ymm5
vmovdqa   2304(%rsp),%ymm6

vpsubq    1440(%rsp),%ymm0,%ymm0
vpsubq    1472(%rsp),%ymm1,%ymm1
vpsubq    1504(%rsp),%ymm2,%ymm2
vpsubq    1536(%rsp),%ymm3,%ymm3
vpsubq    1568(%rsp),%ymm4,%ymm4
vpsubq    1600(%rsp),%ymm5,%ymm5
vpsubq    1632(%rsp),%ymm6,%ymm6

vmovdqa   2336(%rsp),%ymm7
vpsubq    1664(%rsp),%ymm7,%ymm7
vmovdqa   %ymm7,1984(%rsp)

vmovdqa   2368(%rsp),%ymm7
vpsubq    1696(%rsp),%ymm7,%ymm7
vmovdqa   %ymm7,2016(%rsp)

vpsubq    1728(%rsp),%ymm8,%ymm8
vpsubq    1760(%rsp),%ymm9,%ymm9
vpsubq    1792(%rsp),%ymm10,%ymm10
vpsubq    1824(%rsp),%ymm11,%ymm11
vpsubq    1856(%rsp),%ymm12,%ymm12
vpsubq    1888(%rsp),%ymm13,%ymm13
vpsubq    1920(%rsp),%ymm14,%ymm14
vpsubq    1952(%rsp),%ymm15,%ymm15

vpaddq    1184(%rsp),%ymm0,%ymm0
vpaddq    1216(%rsp),%ymm1,%ymm1
vpaddq    1248(%rsp),%ymm2,%ymm2
vpaddq    1280(%rsp),%ymm3,%ymm3
vpaddq    1312(%rsp),%ymm4,%ymm4
vpaddq    1344(%rsp),%ymm5,%ymm5
vpaddq    1376(%rsp),%ymm6,%ymm6
vmovdqa   1984(%rsp),%ymm7
vpaddq    1408(%rsp),%ymm7,%ymm7
vmovdqa   %ymm7,1984(%rsp)

vpaddq    %ymm8,%ymm8,%ymm8
vpaddq    896(%rsp),%ymm8,%ymm8
vpaddq    %ymm9,%ymm9,%ymm9
vpaddq    928(%rsp),%ymm9,%ymm9
vpaddq    %ymm10,%ymm10,%ymm10
vpaddq    960(%rsp),%ymm10,%ymm10
vpaddq    %ymm11,%ymm11,%ymm11
vpaddq    992(%rsp),%ymm11,%ymm11
vpaddq    %ymm12,%ymm12,%ymm12
vpaddq    1024(%rsp),%ymm12,%ymm12
vpaddq    %ymm13,%ymm13,%ymm13
vpaddq    1056(%rsp),%ymm13,%ymm13
vpaddq    %ymm14,%ymm14,%ymm14
vpaddq    1088(%rsp),%ymm14,%ymm14
vpaddq    %ymm15,%ymm15,%ymm15
vpaddq    1120(%rsp),%ymm15,%ymm15

vpsrlq    $29,%ymm8,%ymm7
vpaddq    %ymm7,%ymm9,%ymm9
vpand     vecmask29,%ymm8,%ymm8

vpsrlq    $29,%ymm9,%ymm7
vpaddq    %ymm7,%ymm10,%ymm10
vpand     vecmask29,%ymm9,%ymm9

vpsrlq    $29,%ymm10,%ymm7
vpaddq    %ymm7,%ymm11,%ymm11
vpand     vecmask29,%ymm10,%ymm10

vpsrlq    $29,%ymm11,%ymm7
vpaddq    %ymm7,%ymm12,%ymm12
vpand     vecmask29,%ymm11,%ymm11

vpsrlq    $29,%ymm12,%ymm7
vpaddq    %ymm7,%ymm13,%ymm13
vpand     vecmask29,%ymm12,%ymm12

vpsrlq    $29,%ymm13,%ymm7
vpaddq    %ymm7,%ymm14,%ymm14
vpand     vecmask29,%ymm13,%ymm13

vpsrlq    $29,%ymm14,%ymm7
vpaddq    %ymm7,%ymm15,%ymm15
vpand     vecmask29,%ymm14,%ymm14

vmovdqa   %ymm10,128(%rsp)
vpsrlq    $29,%ymm15,%ymm7
vpaddq    1152(%rsp),%ymm7,%ymm10 
vpand     vecmask29,%ymm15,%ymm15

vpsrlq    $29,%ymm10,%ymm7
vpaddq    %ymm7,%ymm0,%ymm0
vpand     vecmask29,%ymm10,%ymm10

vpsrlq    $29,%ymm0,%ymm7
vpaddq    %ymm7,%ymm1,%ymm1
vpand     vecmask29,%ymm0,%ymm0

vpsrlq    $29,%ymm1,%ymm7
vpaddq    %ymm7,%ymm2,%ymm2
vpand     vecmask29,%ymm1,%ymm1

vpsrlq    $29,%ymm2,%ymm7
vpaddq    %ymm7,%ymm3,%ymm3
vpand     vecmask29,%ymm2,%ymm2

vpsrlq    $29,%ymm3,%ymm7
vpaddq    %ymm7,%ymm4,%ymm4
vpand     vecmask29,%ymm3,%ymm3

vpsrlq    $29,%ymm4,%ymm7
vpaddq    %ymm7,%ymm5,%ymm5
vpand     vecmask29,%ymm4,%ymm4

vpsrlq    $29,%ymm5,%ymm7
vpaddq    %ymm7,%ymm6,%ymm6
vpand     vecmask29,%ymm5,%ymm5

vpsrlq    $29,%ymm6,%ymm7
vpaddq    1984(%rsp),%ymm7,%ymm7
vpand     vecmask29,%ymm6,%ymm6

vmovdqa   %ymm10,160(%rsp)
vmovdqa   %ymm11,192(%rsp)

vpsrlq    $29,%ymm7,%ymm10
vpaddq    2016(%rsp),%ymm10,%ymm10
vpand     vecmask29,%ymm7,%ymm7

vpsrlq    $28,%ymm10,%ymm11
vpaddq    %ymm11,%ymm8,%ymm8
vpand     vecmask28,%ymm10,%ymm10

vpsrlq    $29,%ymm8,%ymm11
vpaddq    %ymm11,%ymm9,%ymm9
vpand     vecmask29,%ymm8,%ymm8

// Unreduced-MulC
vpmuludq  vec_c1,%ymm8,%ymm8
vpmuludq  vec_c1,%ymm9,%ymm9
vmovdqa   128(%rsp),%ymm11
vpmuludq  vec_c1,%ymm11,%ymm11
vmovdqa   %ymm11,128(%rsp)
vmovdqa   192(%rsp),%ymm11
vpmuludq  vec_c1,%ymm11,%ymm11
vmovdqa   %ymm11,192(%rsp)
vpmuludq  vec_c1,%ymm12,%ymm12
vpmuludq  vec_c1,%ymm13,%ymm13
vpmuludq  vec_c1,%ymm14,%ymm14
vpmuludq  vec_c1,%ymm15,%ymm15
vmovdqa   160(%rsp),%ymm11
vpmuludq  vec_c1,%ymm11,%ymm11
vmovdqa   %ymm11,160(%rsp)
vpmuludq  vec_c1,%ymm0,%ymm0
vpmuludq  vec_c1,%ymm1,%ymm1
vpmuludq  vec_c1,%ymm2,%ymm2
vpmuludq  vec_c1,%ymm3,%ymm3
vpmuludq  vec_c1,%ymm4,%ymm4
vpmuludq  vec_c1,%ymm5,%ymm5
vpmuludq  vec_c1,%ymm6,%ymm6
vpmuludq  vec_c1,%ymm7,%ymm7
vpmuludq  vec_c1,%ymm10,%ymm10
vmovdqa   %ymm10,64(%rsp)

// HH
vpshufd	  $68,%ymm8,%ymm10
vpshufd	  $238,%ymm8,%ymm11
vpaddq    hh_p1q,%ymm10,%ymm10
vpxor     hh_xor,%ymm11,%ymm11
vpaddq    %ymm10,%ymm11,%ymm8

vpshufd	  $68,%ymm9,%ymm10
vpshufd	  $238,%ymm9,%ymm11
vpaddq    hh_p1q,%ymm10,%ymm10
vpxor     hh_xor,%ymm11,%ymm11
vpaddq    %ymm10,%ymm11,%ymm9

vpshufd	  $68,%ymm12,%ymm10
vpshufd	  $238,%ymm12,%ymm11
vpaddq    hh_p1q,%ymm10,%ymm10
vpxor     hh_xor,%ymm11,%ymm11
vpaddq    %ymm10,%ymm11,%ymm12

vpshufd	  $68,%ymm13,%ymm10
vpshufd	  $238,%ymm13,%ymm11
vpaddq    hh_p1q,%ymm10,%ymm10
vpxor     hh_xor,%ymm11,%ymm11
vpaddq    %ymm10,%ymm11,%ymm13

vpshufd	  $68,%ymm14,%ymm10
vpshufd	  $238,%ymm14,%ymm11
vpaddq    hh_p1q,%ymm10,%ymm10
vpxor     hh_xor,%ymm11,%ymm11
vpaddq    %ymm10,%ymm11,%ymm14

vpshufd	  $68,%ymm15,%ymm10
vpshufd	  $238,%ymm15,%ymm11
vpaddq    hh_p1q,%ymm10,%ymm10
vpxor     hh_xor,%ymm11,%ymm11
vpaddq    %ymm10,%ymm11,%ymm15

vpshufd	  $68,%ymm0,%ymm10
vpshufd	  $238,%ymm0,%ymm11
vpaddq    hh_p1q,%ymm10,%ymm10
vpxor     hh_xor,%ymm11,%ymm11
vpaddq    %ymm10,%ymm11,%ymm0

vpshufd	  $68,%ymm1,%ymm10
vpshufd	  $238,%ymm1,%ymm11
vpaddq    hh_p1q,%ymm10,%ymm10
vpxor     hh_xor,%ymm11,%ymm11
vpaddq    %ymm10,%ymm11,%ymm1

vpshufd	  $68,%ymm2,%ymm10
vpshufd	  $238,%ymm2,%ymm11
vpaddq    hh_p1q,%ymm10,%ymm10
vpxor     hh_xor,%ymm11,%ymm11
vpaddq    %ymm10,%ymm11,%ymm2

vpshufd	  $68,%ymm3,%ymm10
vpshufd	  $238,%ymm3,%ymm11
vpaddq    hh_p1q,%ymm10,%ymm10
vpxor     hh_xor,%ymm11,%ymm11
vpaddq    %ymm10,%ymm11,%ymm3

vpshufd	  $68,%ymm4,%ymm10
vpshufd	  $238,%ymm4,%ymm11
vpaddq    hh_p1q,%ymm10,%ymm10
vpxor     hh_xor,%ymm11,%ymm11
vpaddq    %ymm10,%ymm11,%ymm4

vpshufd	  $68,%ymm5,%ymm10
vpshufd	  $238,%ymm5,%ymm11
vpaddq    hh_p1q,%ymm10,%ymm10
vpxor     hh_xor,%ymm11,%ymm11
vpaddq    %ymm10,%ymm11,%ymm5

vpshufd	  $68,%ymm6,%ymm10
vpshufd	  $238,%ymm6,%ymm11
vpaddq    hh_p1q,%ymm10,%ymm10
vpxor     hh_xor,%ymm11,%ymm11
vpaddq    %ymm10,%ymm11,%ymm6

vpshufd	  $68,%ymm7,%ymm10
vpshufd	  $238,%ymm7,%ymm11
vpaddq    hh_p1q,%ymm10,%ymm10
vpxor     hh_xor,%ymm11,%ymm11
vpaddq    %ymm10,%ymm11,%ymm7

vpshufd	  $68,192(%rsp),%ymm10
vpshufd	  $238,192(%rsp),%ymm11
vpaddq    hh_p1q,%ymm10,%ymm10
vpxor     hh_xor,%ymm11,%ymm11
vpaddq    %ymm10,%ymm11,%ymm10
vmovdqa   %ymm10,192(%rsp)

vpshufd	  $68,160(%rsp),%ymm10
vpshufd	  $238,160(%rsp),%ymm11
vpaddq    hh_p1q,%ymm10,%ymm10
vpxor     hh_xor,%ymm11,%ymm11
vpaddq    %ymm10,%ymm11,%ymm10
vmovdqa   %ymm10,160(%rsp)

vpshufd	  $68,64(%rsp),%ymm10
vpshufd	  $238,64(%rsp),%ymm11
vpaddq    hh_p2q,%ymm10,%ymm10
vpxor     hh_xor,%ymm11,%ymm11
vpaddq    %ymm10,%ymm11,%ymm10
vmovdqa   %ymm10,64(%rsp)

vpshufd	  $68,128(%rsp),%ymm10
vpshufd	  $238,128(%rsp),%ymm11
vpaddq    hh_p1q,%ymm10,%ymm10
vpxor     hh_xor,%ymm11,%ymm11
vpaddq    %ymm10,%ymm11,%ymm10

vpsrlq    $29,%ymm8,%ymm11
vpaddq    %ymm11,%ymm9,%ymm9
vpand     vecmask29,%ymm8,%ymm8
vmovdqa   %ymm8,96(%rsp)

vpsrlq    $29,%ymm9,%ymm11
vpaddq    %ymm11,%ymm10,%ymm10
vpand     vecmask29,%ymm9,%ymm9

vpsrlq    $29,%ymm10,%ymm11
vpaddq    192(%rsp),%ymm11,%ymm8
vpand     vecmask29,%ymm10,%ymm10

vpsrlq    $29,%ymm8,%ymm11
vpaddq    %ymm11,%ymm12,%ymm12
vpand     vecmask29,%ymm8,%ymm8
vmovdqa   %ymm8,192(%rsp)

vpsrlq    $29,%ymm12,%ymm11
vpaddq    %ymm11,%ymm13,%ymm13
vpand     vecmask29,%ymm12,%ymm12

vpsrlq    $29,%ymm13,%ymm11
vpaddq    %ymm11,%ymm14,%ymm14
vpand     vecmask29,%ymm13,%ymm13

vpsrlq    $29,%ymm14,%ymm11
vpaddq    %ymm11,%ymm15,%ymm15
vpand     vecmask29,%ymm14,%ymm14

vpsrlq    $29,%ymm15,%ymm11
vpaddq    160(%rsp),%ymm11,%ymm8
vpand     vecmask29,%ymm15,%ymm15

vpsrlq    $29,%ymm8,%ymm11
vpaddq    %ymm11,%ymm0,%ymm0
vpand     vecmask29,%ymm8,%ymm8
vmovdqa   %ymm8,160(%rsp)

vpsrlq    $29,%ymm0,%ymm11
vpaddq    %ymm11,%ymm1,%ymm1
vpand     vecmask29,%ymm0,%ymm0

vpsrlq    $29,%ymm1,%ymm11
vpaddq    %ymm11,%ymm2,%ymm2
vpand     vecmask29,%ymm1,%ymm1

vpsrlq    $29,%ymm2,%ymm11
vpaddq    %ymm11,%ymm3,%ymm3
vpand     vecmask29,%ymm2,%ymm2

vpsrlq    $29,%ymm3,%ymm11
vpaddq    %ymm11,%ymm4,%ymm4
vpand     vecmask29,%ymm3,%ymm3

vpsrlq    $29,%ymm4,%ymm11
vpaddq    %ymm11,%ymm5,%ymm5
vpand     vecmask29,%ymm4,%ymm4

vpsrlq    $29,%ymm5,%ymm11
vpaddq    %ymm11,%ymm6,%ymm6
vpand     vecmask29,%ymm5,%ymm5

vpsrlq    $29,%ymm6,%ymm11
vpaddq    %ymm11,%ymm7,%ymm7
vpand     vecmask29,%ymm6,%ymm6

vpsrlq    $29,%ymm7,%ymm11
vpaddq    64(%rsp),%ymm11,%ymm8
vpand     vecmask29,%ymm7,%ymm7

vpsrlq    $28,%ymm8,%ymm11
vpaddq    96(%rsp),%ymm11,%ymm11
vpand     vecmask28,%ymm8,%ymm8
vmovdqa   %ymm11,64(%rsp)
vmovdqa   192(%rsp),%ymm11

// Sqr
vmovdqa   %ymm14,96(%rsp)
vmovdqa   %ymm15,128(%rsp)

vmovdqa   %ymm0,192(%rsp)
vmovdqa   %ymm1,224(%rsp)
vmovdqa   %ymm2,256(%rsp)
vmovdqa   %ymm8,288(%rsp)

vpmuludq  %ymm0,%ymm0,%ymm15
vmovdqa   %ymm15,864(%rsp)

vpmuludq  %ymm1,%ymm0,%ymm15
vpaddq    %ymm15,%ymm15,%ymm15
vmovdqa   %ymm15,896(%rsp)

vpmuludq  %ymm2,%ymm0,%ymm15
vpaddq    %ymm15,%ymm15,%ymm15
vpmuludq  %ymm1,%ymm1,%ymm14
vpaddq    %ymm14,%ymm15,%ymm15
vmovdqa   %ymm15,928(%rsp)

vpmuludq  %ymm3,%ymm0,%ymm15
vpmuludq  %ymm2,%ymm1,%ymm14
vpaddq    %ymm14,%ymm15,%ymm15
vpaddq    %ymm15,%ymm15,%ymm15
vmovdqa   %ymm15,960(%rsp)

vpmuludq  %ymm4,%ymm0,%ymm15
vpmuludq  %ymm3,%ymm1,%ymm14
vpaddq    %ymm14,%ymm15,%ymm15
vpaddq    %ymm15,%ymm15,%ymm15
vpmuludq  %ymm2,%ymm2,%ymm14
vpaddq    %ymm14,%ymm15,%ymm15
vmovdqa   %ymm15,992(%rsp)

vpmuludq  %ymm5,%ymm0,%ymm15
vpmuludq  %ymm4,%ymm1,%ymm14
vpaddq    %ymm14,%ymm15,%ymm15
vpmuludq  %ymm3,%ymm2,%ymm14
vpaddq    %ymm14,%ymm15,%ymm15
vpaddq    %ymm15,%ymm15,%ymm15
vmovdqa   %ymm15,1024(%rsp)

vpmuludq  %ymm6,%ymm0,%ymm15
vpmuludq  %ymm5,%ymm1,%ymm14
vpaddq    %ymm14,%ymm15,%ymm15
vpmuludq  %ymm4,%ymm2,%ymm14
vpaddq    %ymm14,%ymm15,%ymm15
vpaddq    %ymm15,%ymm15,%ymm15
vpmuludq  %ymm3,%ymm3,%ymm14
vpaddq    %ymm14,%ymm15,%ymm15
vmovdqa   %ymm15,1056(%rsp)

vpmuludq  %ymm7,%ymm0,%ymm15
vpmuludq  %ymm6,%ymm1,%ymm14
vpaddq    %ymm14,%ymm15,%ymm15
vpmuludq  %ymm5,%ymm2,%ymm14
vpaddq    %ymm14,%ymm15,%ymm15
vpmuludq  %ymm4,%ymm3,%ymm14
vpaddq    %ymm14,%ymm15,%ymm15
vpaddq    %ymm15,%ymm15,%ymm15
vmovdqa   %ymm15,1088(%rsp)

vpmuludq  %ymm8,%ymm0,%ymm15
vpmuludq  %ymm7,%ymm1,%ymm14
vpaddq    %ymm14,%ymm15,%ymm15
vpmuludq  %ymm6,%ymm2,%ymm14
vpaddq    %ymm14,%ymm15,%ymm15
vpmuludq  %ymm5,%ymm3,%ymm14
vpaddq    %ymm14,%ymm15,%ymm15
vpaddq    %ymm15,%ymm15,%ymm15
vpmuludq  %ymm4,%ymm4,%ymm14
vpaddq    %ymm14,%ymm15,%ymm15
vmovdqa   %ymm15,1120(%rsp)

vpmuludq  %ymm8,%ymm1,%ymm15
vpmuludq  %ymm7,%ymm2,%ymm14
vpaddq    %ymm14,%ymm15,%ymm15
vpmuludq  %ymm6,%ymm3,%ymm14
vpaddq    %ymm14,%ymm15,%ymm15
vpmuludq  %ymm5,%ymm4,%ymm14
vpaddq    %ymm14,%ymm15,%ymm15
vpaddq    %ymm15,%ymm15,%ymm15
vmovdqa   %ymm15,1152(%rsp)

vpmuludq  %ymm8,%ymm2,%ymm15
vpmuludq  %ymm7,%ymm3,%ymm14
vpaddq    %ymm14,%ymm15,%ymm15
vpmuludq  %ymm6,%ymm4,%ymm14
vpaddq    %ymm14,%ymm15,%ymm15
vpaddq    %ymm15,%ymm15,%ymm15
vpmuludq  %ymm5,%ymm5,%ymm14
vpaddq    %ymm14,%ymm15,%ymm15
vmovdqa   %ymm15,1184(%rsp)

vpmuludq  %ymm8,%ymm3,%ymm15
vpmuludq  %ymm7,%ymm4,%ymm14
vpaddq    %ymm14,%ymm15,%ymm15
vpmuludq  %ymm6,%ymm5,%ymm14
vpaddq    %ymm14,%ymm15,%ymm15
vpaddq    %ymm15,%ymm15,%ymm15
vmovdqa   %ymm15,1216(%rsp)

vpmuludq  %ymm8,%ymm4,%ymm15
vpmuludq  %ymm7,%ymm5,%ymm14
vpaddq    %ymm14,%ymm15,%ymm15
vpaddq    %ymm15,%ymm15,%ymm15
vpmuludq  %ymm6,%ymm6,%ymm14
vpaddq    %ymm14,%ymm15,%ymm15
vmovdqa   %ymm15,1248(%rsp)

vpmuludq  %ymm8,%ymm5,%ymm15
vpmuludq  %ymm7,%ymm6,%ymm14
vpaddq    %ymm14,%ymm15,%ymm15
vpaddq    %ymm15,%ymm15,%ymm15
vmovdqa   %ymm15,1280(%rsp)

vpmuludq  %ymm8,%ymm6,%ymm15
vpaddq    %ymm15,%ymm15,%ymm15
vpmuludq  %ymm7,%ymm7,%ymm14
vpaddq    %ymm14,%ymm15,%ymm15
vmovdqa   %ymm15,1312(%rsp)

vpmuludq  %ymm8,%ymm7,%ymm15
vpaddq    %ymm15,%ymm15,%ymm15
vmovdqa   %ymm15,1344(%rsp)

vpmuludq  %ymm8,%ymm8,%ymm15
vmovdqa   %ymm15,1376(%rsp)

vmovdqa   64(%rsp),%ymm8
vmovdqa   96(%rsp),%ymm14
vmovdqa   128(%rsp),%ymm15
vmovdqa   160(%rsp),%ymm2

vpmuludq  %ymm8,%ymm8,%ymm1
vpaddq    864(%rsp),%ymm1,%ymm1
vmovdqa   %ymm1,320(%rsp)
vpaddq    864(%rsp),%ymm1,%ymm1
vmovdqa   %ymm1,864(%rsp)

vpmuludq  %ymm9,%ymm8,%ymm1
vpaddq    %ymm1,%ymm1,%ymm1
vpaddq    896(%rsp),%ymm1,%ymm1
vmovdqa   %ymm1,352(%rsp)
vpaddq    896(%rsp),%ymm1,%ymm1
vmovdqa   %ymm1,896(%rsp)

vpmuludq  %ymm10,%ymm8,%ymm1
vpaddq    %ymm1,%ymm1,%ymm1
vpmuludq  %ymm9,%ymm9,%ymm0
vpaddq    %ymm0,%ymm1,%ymm1
vpaddq    928(%rsp),%ymm1,%ymm1
vmovdqa   %ymm1,384(%rsp)
vpaddq    928(%rsp),%ymm1,%ymm1
vmovdqa   %ymm1,928(%rsp)

vpmuludq  %ymm11,%ymm8,%ymm1
vpmuludq  %ymm10,%ymm9,%ymm0
vpaddq    %ymm0,%ymm1,%ymm1
vpaddq    %ymm1,%ymm1,%ymm1
vpaddq    960(%rsp),%ymm1,%ymm1
vmovdqa   %ymm1,416(%rsp)
vpaddq    960(%rsp),%ymm1,%ymm1
vmovdqa   %ymm1,960(%rsp)

vpmuludq  %ymm12,%ymm8,%ymm1
vpmuludq  %ymm11,%ymm9,%ymm0
vpaddq    %ymm0,%ymm1,%ymm1
vpaddq    %ymm1,%ymm1,%ymm1
vpmuludq  %ymm10,%ymm10,%ymm0
vpaddq    %ymm0,%ymm1,%ymm1
vpaddq    992(%rsp),%ymm1,%ymm1
vmovdqa   %ymm1,448(%rsp)
vpaddq    992(%rsp),%ymm1,%ymm1
vmovdqa   %ymm1,992(%rsp)

vpmuludq  %ymm13,%ymm8,%ymm1
vpmuludq  %ymm12,%ymm9,%ymm0
vpaddq    %ymm0,%ymm1,%ymm1
vpmuludq  %ymm11,%ymm10,%ymm0
vpaddq    %ymm0,%ymm1,%ymm1
vpaddq    %ymm1,%ymm1,%ymm1
vpaddq    1024(%rsp),%ymm1,%ymm1
vmovdqa   %ymm1,480(%rsp)
vpaddq    1024(%rsp),%ymm1,%ymm1
vmovdqa   %ymm1,1024(%rsp)

vpmuludq  %ymm14,%ymm8,%ymm1
vpmuludq  %ymm13,%ymm9,%ymm0
vpaddq    %ymm0,%ymm1,%ymm1
vpmuludq  %ymm12,%ymm10,%ymm0
vpaddq    %ymm0,%ymm1,%ymm1
vpaddq    %ymm1,%ymm1,%ymm1
vpmuludq  %ymm11,%ymm11,%ymm0
vpaddq    %ymm0,%ymm1,%ymm1
vpaddq    1056(%rsp),%ymm1,%ymm1
vmovdqa   %ymm1,512(%rsp)
vpaddq    1056(%rsp),%ymm1,%ymm1
vmovdqa   %ymm1,1056(%rsp)

vpmuludq  %ymm15,%ymm8,%ymm1
vpmuludq  %ymm14,%ymm9,%ymm0
vpaddq    %ymm0,%ymm1,%ymm1
vpmuludq  %ymm13,%ymm10,%ymm0
vpaddq    %ymm0,%ymm1,%ymm1
vpmuludq  %ymm12,%ymm11,%ymm0
vpaddq    %ymm0,%ymm1,%ymm1
vpaddq    %ymm1,%ymm1,%ymm1
vpaddq    1088(%rsp),%ymm1,%ymm1
vmovdqa   %ymm1,544(%rsp)
vpaddq    1088(%rsp),%ymm1,%ymm1
vmovdqa   %ymm1,1088(%rsp)

vpmuludq  %ymm15,%ymm9,%ymm1
vpmuludq  %ymm14,%ymm10,%ymm0
vpaddq    %ymm0,%ymm1,%ymm1
vpmuludq  %ymm13,%ymm11,%ymm0
vpaddq    %ymm0,%ymm1,%ymm1
vpmuludq  %ymm2,%ymm8,%ymm0
vpaddq    %ymm0,%ymm1,%ymm1
vpaddq    %ymm1,%ymm1,%ymm1
vpmuludq  %ymm12,%ymm12,%ymm0
vpaddq    %ymm0,%ymm1,%ymm1
vpaddq    1120(%rsp),%ymm1,%ymm1
vmovdqa   %ymm1,576(%rsp)
vpaddq    1120(%rsp),%ymm1,%ymm1
vmovdqa   %ymm1,1120(%rsp)

vpmuludq  %ymm15,%ymm10,%ymm1
vpmuludq  %ymm14,%ymm11,%ymm0
vpaddq    %ymm0,%ymm1,%ymm1
vpmuludq  %ymm13,%ymm12,%ymm0
vpaddq    %ymm0,%ymm1,%ymm1
vpmuludq  %ymm2,%ymm9,%ymm0
vpaddq    %ymm0,%ymm1,%ymm1
vpaddq    %ymm1,%ymm1,%ymm1
vpaddq    1152(%rsp),%ymm1,%ymm1
vmovdqa   %ymm1,608(%rsp)
vpaddq    1152(%rsp),%ymm1,%ymm1
vmovdqa   %ymm1,1152(%rsp)

vpmuludq  %ymm15,%ymm11,%ymm1
vpmuludq  %ymm14,%ymm12,%ymm0
vpaddq    %ymm0,%ymm1,%ymm1
vpmuludq  %ymm2,%ymm10,%ymm0
vpaddq    %ymm0,%ymm1,%ymm1
vpaddq    %ymm1,%ymm1,%ymm1
vpmuludq  %ymm13,%ymm13,%ymm0
vpaddq    %ymm0,%ymm1,%ymm1
vpaddq    1184(%rsp),%ymm1,%ymm1
vmovdqa   %ymm1,640(%rsp)
vpaddq    1184(%rsp),%ymm1,%ymm1
vmovdqa   %ymm1,1184(%rsp)

vpmuludq  %ymm15,%ymm12,%ymm1
vpmuludq  %ymm14,%ymm13,%ymm0
vpaddq    %ymm0,%ymm1,%ymm1
vpmuludq  %ymm2,%ymm11,%ymm0
vpaddq    %ymm0,%ymm1,%ymm1
vpaddq    %ymm1,%ymm1,%ymm1
vpaddq    1216(%rsp),%ymm1,%ymm1
vmovdqa   %ymm1,672(%rsp)
vpaddq    1216(%rsp),%ymm1,%ymm1
vmovdqa   %ymm1,1216(%rsp)

vpmuludq  %ymm15,%ymm13,%ymm1
vpmuludq  %ymm2,%ymm12,%ymm0
vpaddq    %ymm0,%ymm1,%ymm1
vpaddq    %ymm1,%ymm1,%ymm1
vpmuludq  %ymm14,%ymm14,%ymm0
vpaddq    %ymm0,%ymm1,%ymm1
vpaddq    1248(%rsp),%ymm1,%ymm1
vmovdqa   %ymm1,704(%rsp)
vpaddq    1248(%rsp),%ymm1,%ymm1
vmovdqa   %ymm1,1248(%rsp)

vpmuludq  %ymm15,%ymm14,%ymm1
vpmuludq  %ymm2,%ymm13,%ymm0
vpaddq    %ymm0,%ymm1,%ymm1
vpaddq    %ymm1,%ymm1,%ymm1
vpaddq    1280(%rsp),%ymm1,%ymm1
vmovdqa   %ymm1,736(%rsp)
vpaddq    1280(%rsp),%ymm1,%ymm1
vmovdqa   %ymm1,1280(%rsp)

vpmuludq  %ymm2,%ymm14,%ymm1
vpaddq    %ymm1,%ymm1,%ymm1
vpmuludq  %ymm15,%ymm15,%ymm0
vpaddq    %ymm0,%ymm1,%ymm1
vpaddq    1312(%rsp),%ymm1,%ymm1
vmovdqa   %ymm1,768(%rsp)
vpaddq    1312(%rsp),%ymm1,%ymm1
vmovdqa   %ymm1,1312(%rsp)

vpmuludq  %ymm2,%ymm15,%ymm1
vpaddq    %ymm1,%ymm1,%ymm1
vpaddq    1344(%rsp),%ymm1,%ymm1
vmovdqa   %ymm1,800(%rsp)
vpaddq    1344(%rsp),%ymm1,%ymm1
vmovdqa   %ymm1,1344(%rsp)

vpmuludq  %ymm2,%ymm2,%ymm1
vpaddq    1376(%rsp),%ymm1,%ymm1
vmovdqa   %ymm1,832(%rsp)
vpaddq    1376(%rsp),%ymm1,%ymm1
vmovdqa   %ymm1,1376(%rsp)

vpaddq    192(%rsp),%ymm8,%ymm8
vpaddq    224(%rsp),%ymm9,%ymm9
vpaddq    256(%rsp),%ymm10,%ymm10
vpaddq    %ymm3,%ymm11,%ymm11
vpaddq    %ymm4,%ymm12,%ymm12
vpaddq    %ymm5,%ymm13,%ymm13
vpaddq    %ymm6,%ymm14,%ymm14
vpaddq    %ymm7,%ymm15,%ymm15
vpaddq    288(%rsp),%ymm2,%ymm2

vpmuludq  %ymm8,%ymm8,%ymm1
vmovdqa   %ymm1,1408(%rsp)

vpmuludq  %ymm9,%ymm8,%ymm1
vpaddq    %ymm1,%ymm1,%ymm1
vmovdqa   %ymm1,1440(%rsp)

vpmuludq  %ymm10,%ymm8,%ymm1
vpaddq    %ymm1,%ymm1,%ymm1
vpmuludq  %ymm9,%ymm9,%ymm0
vpaddq    %ymm0,%ymm1,%ymm1
vmovdqa   %ymm1,1472(%rsp)

vpmuludq  %ymm11,%ymm8,%ymm1
vpmuludq  %ymm10,%ymm9,%ymm0
vpaddq    %ymm0,%ymm1,%ymm1
vpaddq    %ymm1,%ymm1,%ymm3

vpmuludq  %ymm12,%ymm8,%ymm1
vpmuludq  %ymm11,%ymm9,%ymm0
vpaddq    %ymm0,%ymm1,%ymm1
vpaddq    %ymm1,%ymm1,%ymm1
vpmuludq  %ymm10,%ymm10,%ymm0
vpaddq    %ymm0,%ymm1,%ymm4

vpmuludq  %ymm13,%ymm8,%ymm1
vpmuludq  %ymm12,%ymm9,%ymm0
vpaddq    %ymm0,%ymm1,%ymm1
vpmuludq  %ymm11,%ymm10,%ymm0
vpaddq    %ymm0,%ymm1,%ymm1
vpaddq    %ymm1,%ymm1,%ymm5

vpmuludq  %ymm14,%ymm8,%ymm1
vpmuludq  %ymm13,%ymm9,%ymm0
vpaddq    %ymm0,%ymm1,%ymm1
vpmuludq  %ymm12,%ymm10,%ymm0
vpaddq    %ymm0,%ymm1,%ymm1
vpaddq    %ymm1,%ymm1,%ymm1
vpmuludq  %ymm11,%ymm11,%ymm0
vpaddq    %ymm0,%ymm1,%ymm6

vpmuludq  %ymm15,%ymm8,%ymm1
vpmuludq  %ymm14,%ymm9,%ymm0
vpaddq    %ymm0,%ymm1,%ymm1
vpmuludq  %ymm13,%ymm10,%ymm0
vpaddq    %ymm0,%ymm1,%ymm1
vpmuludq  %ymm12,%ymm11,%ymm0
vpaddq    %ymm0,%ymm1,%ymm1
vpaddq    %ymm1,%ymm1,%ymm1
vmovdqa   %ymm1,1504(%rsp)

vpmuludq  %ymm2,%ymm8,%ymm1
vpmuludq  %ymm15,%ymm9,%ymm0
vpaddq    %ymm0,%ymm1,%ymm1
vpmuludq  %ymm14,%ymm10,%ymm0
vpaddq    %ymm0,%ymm1,%ymm1
vpmuludq  %ymm13,%ymm11,%ymm0
vpaddq    %ymm0,%ymm1,%ymm1
vpaddq    %ymm1,%ymm1,%ymm1
vpmuludq  %ymm12,%ymm12,%ymm0
vpaddq    %ymm0,%ymm1,%ymm1
vmovdqa   %ymm1,1536(%rsp)

vpmuludq  %ymm2,%ymm9,%ymm1
vpmuludq  %ymm15,%ymm10,%ymm0
vpaddq    %ymm0,%ymm1,%ymm1
vpmuludq  %ymm14,%ymm11,%ymm0
vpaddq    %ymm0,%ymm1,%ymm1
vpmuludq  %ymm13,%ymm12,%ymm0
vpaddq    %ymm0,%ymm1,%ymm1
vpaddq    %ymm1,%ymm1,%ymm8

vpmuludq  %ymm2,%ymm10,%ymm1
vpmuludq  %ymm15,%ymm11,%ymm0
vpaddq    %ymm0,%ymm1,%ymm1
vpmuludq  %ymm14,%ymm12,%ymm0
vpaddq    %ymm0,%ymm1,%ymm1
vpaddq    %ymm1,%ymm1,%ymm1
vpmuludq  %ymm13,%ymm13,%ymm0
vpaddq    %ymm0,%ymm1,%ymm9

vpmuludq  %ymm2,%ymm11,%ymm1
vpmuludq  %ymm15,%ymm12,%ymm0
vpaddq    %ymm0,%ymm1,%ymm1
vpmuludq  %ymm14,%ymm13,%ymm0
vpaddq    %ymm0,%ymm1,%ymm1
vpaddq    %ymm1,%ymm1,%ymm10

vpmuludq  %ymm2,%ymm12,%ymm1
vpmuludq  %ymm15,%ymm13,%ymm0
vpaddq    %ymm0,%ymm1,%ymm1
vpaddq    %ymm1,%ymm1,%ymm1
vpmuludq  %ymm14,%ymm14,%ymm0
vpaddq    %ymm0,%ymm1,%ymm11

vpmuludq  %ymm2,%ymm13,%ymm1
vpmuludq  %ymm15,%ymm14,%ymm0
vpaddq    %ymm0,%ymm1,%ymm1
vpaddq    %ymm1,%ymm1,%ymm12

vpmuludq  %ymm2,%ymm14,%ymm1
vpaddq    %ymm1,%ymm1,%ymm1
vpmuludq  %ymm15,%ymm15,%ymm0
vpaddq    %ymm0,%ymm1,%ymm13

vpmuludq  %ymm2,%ymm15,%ymm1
vpaddq    %ymm1,%ymm1,%ymm14

vpmuludq  %ymm2,%ymm2,%ymm15

vmovdqa   1408(%rsp),%ymm0
vmovdqa   1440(%rsp),%ymm1
vmovdqa   1472(%rsp),%ymm2

vpsubq    320(%rsp),%ymm0,%ymm0
vpsubq    352(%rsp),%ymm1,%ymm1
vpsubq    384(%rsp),%ymm2,%ymm2
vpsubq    416(%rsp),%ymm3,%ymm3
vpsubq    448(%rsp),%ymm4,%ymm4
vpsubq    480(%rsp),%ymm5,%ymm5
vpsubq    512(%rsp),%ymm6,%ymm6

vmovdqa   1504(%rsp),%ymm7
vpsubq    544(%rsp),%ymm7,%ymm7
vmovdqa   %ymm7,1408(%rsp)

vmovdqa   1536(%rsp),%ymm7
vpsubq    576(%rsp),%ymm7,%ymm7
vmovdqa   %ymm7,1440(%rsp)

vpsubq    608(%rsp),%ymm8,%ymm8
vpsubq    640(%rsp),%ymm9,%ymm9
vpsubq    672(%rsp),%ymm10,%ymm10
vpsubq    704(%rsp),%ymm11,%ymm11
vpsubq    736(%rsp),%ymm12,%ymm12
vpsubq    768(%rsp),%ymm13,%ymm13
vpsubq    800(%rsp),%ymm14,%ymm14
vpsubq    832(%rsp),%ymm15,%ymm15

vpaddq    1152(%rsp),%ymm0,%ymm0
vpaddq    1184(%rsp),%ymm1,%ymm1
vpaddq    1216(%rsp),%ymm2,%ymm2
vpaddq    1248(%rsp),%ymm3,%ymm3
vpaddq    1280(%rsp),%ymm4,%ymm4
vpaddq    1312(%rsp),%ymm5,%ymm5
vpaddq    1344(%rsp),%ymm6,%ymm6
vmovdqa   1408(%rsp),%ymm7
vpaddq    1376(%rsp),%ymm7,%ymm7
vmovdqa   %ymm7,1408(%rsp)

vpaddq    %ymm8,%ymm8,%ymm8
vpaddq    864(%rsp),%ymm8,%ymm8
vpaddq    %ymm9,%ymm9,%ymm9
vpaddq    896(%rsp),%ymm9,%ymm9
vpaddq    %ymm10,%ymm10,%ymm10
vpaddq    928(%rsp),%ymm10,%ymm10
vpaddq    %ymm11,%ymm11,%ymm11
vpaddq    960(%rsp),%ymm11,%ymm11
vpaddq    %ymm12,%ymm12,%ymm12
vpaddq    992(%rsp),%ymm12,%ymm12
vpaddq    %ymm13,%ymm13,%ymm13
vpaddq    1024(%rsp),%ymm13,%ymm13
vpaddq    %ymm14,%ymm14,%ymm14
vpaddq    1056(%rsp),%ymm14,%ymm14
vpaddq    %ymm15,%ymm15,%ymm15
vpaddq    1088(%rsp),%ymm15,%ymm15

vpsrlq    $29,%ymm8,%ymm7
vpaddq    %ymm7,%ymm9,%ymm9
vpand     vecmask29,%ymm8,%ymm8

vpsrlq    $29,%ymm9,%ymm7
vpaddq    %ymm7,%ymm10,%ymm10
vpand     vecmask29,%ymm9,%ymm9

vpsrlq    $29,%ymm10,%ymm7
vpaddq    %ymm7,%ymm11,%ymm11
vpand     vecmask29,%ymm10,%ymm10

vpsrlq    $29,%ymm11,%ymm7
vpaddq    %ymm7,%ymm12,%ymm12
vpand     vecmask29,%ymm11,%ymm11

vpsrlq    $29,%ymm12,%ymm7
vpaddq    %ymm7,%ymm13,%ymm13
vpand     vecmask29,%ymm12,%ymm12

vpsrlq    $29,%ymm13,%ymm7
vpaddq    %ymm7,%ymm14,%ymm14
vpand     vecmask29,%ymm13,%ymm13

vpsrlq    $29,%ymm14,%ymm7
vpaddq    %ymm7,%ymm15,%ymm15
vpand     vecmask29,%ymm14,%ymm14

vmovdqa   %ymm10,128(%rsp)
vpsrlq    $29,%ymm15,%ymm7
vpaddq    1120(%rsp),%ymm7,%ymm10 
vpand     vecmask29,%ymm15,%ymm15

vpsrlq    $29,%ymm10,%ymm7
vpaddq    %ymm7,%ymm0,%ymm0
vpand     vecmask29,%ymm10,%ymm10

vpsrlq    $29,%ymm0,%ymm7
vpaddq    %ymm7,%ymm1,%ymm1
vpand     vecmask29,%ymm0,%ymm0

vpsrlq    $29,%ymm1,%ymm7
vpaddq    %ymm7,%ymm2,%ymm2
vpand     vecmask29,%ymm1,%ymm1

vpsrlq    $29,%ymm2,%ymm7
vpaddq    %ymm7,%ymm3,%ymm3
vpand     vecmask29,%ymm2,%ymm2

vpsrlq    $29,%ymm3,%ymm7
vpaddq    %ymm7,%ymm4,%ymm4
vpand     vecmask29,%ymm3,%ymm3

vpsrlq    $29,%ymm4,%ymm7
vpaddq    %ymm7,%ymm5,%ymm5
vpand     vecmask29,%ymm4,%ymm4

vpsrlq    $29,%ymm5,%ymm7
vpaddq    %ymm7,%ymm6,%ymm6
vpand     vecmask29,%ymm5,%ymm5

vpsrlq    $29,%ymm6,%ymm7
vpaddq    1408(%rsp),%ymm7,%ymm7
vpand     vecmask29,%ymm6,%ymm6

vmovdqa   %ymm10,96(%rsp)
vmovdqa   %ymm11,160(%rsp)

vpsrlq    $29,%ymm7,%ymm10
vpaddq    1440(%rsp),%ymm10,%ymm10
vpand     vecmask29,%ymm7,%ymm7

vpsrlq    $28,%ymm10,%ymm11
vpaddq    %ymm11,%ymm8,%ymm8
vpand     vecmask28,%ymm10,%ymm10

vpsrlq    $29,%ymm8,%ymm11
vpaddq    %ymm11,%ymm9,%ymm9
vpand     vecmask29,%ymm8,%ymm8

vmovdqa   %ymm7,64(%rsp)

// CSwap
vpbroadcastd 56(%rsp),%ymm7
vpaddd	  swap_c,%ymm7,%ymm7
vpand     swap_mask,%ymm7,%ymm7
vpermd	  vec_c3,%ymm7,%ymm7

// MulC
vpmuludq  %ymm8,%ymm7,%ymm8
vpmuludq  %ymm9,%ymm7,%ymm9
vpmuludq  %ymm12,%ymm7,%ymm12
vpmuludq  %ymm13,%ymm7,%ymm13
vpmuludq  %ymm14,%ymm7,%ymm14
vpmuludq  %ymm15,%ymm7,%ymm15
vpmuludq  %ymm0,%ymm7,%ymm0
vpmuludq  %ymm1,%ymm7,%ymm1
vpmuludq  %ymm2,%ymm7,%ymm2
vpmuludq  %ymm3,%ymm7,%ymm3
vpmuludq  %ymm4,%ymm7,%ymm4
vpmuludq  %ymm5,%ymm7,%ymm5
vpmuludq  %ymm6,%ymm7,%ymm6
vpmuludq  %ymm10,%ymm7,%ymm10

vpmuludq  64(%rsp),%ymm7,%ymm11
vmovdqa   %ymm11,64(%rsp)
vpmuludq  96(%rsp),%ymm7,%ymm11
vmovdqa   %ymm11,96(%rsp)
vpmuludq  128(%rsp),%ymm7,%ymm11
vmovdqa   %ymm11,128(%rsp)
vpmuludq  160(%rsp),%ymm7,%ymm11
vmovdqa   %ymm11,160(%rsp)

vpsrlq    $29,%ymm8,%ymm11
vpaddq    %ymm11,%ymm9,%ymm9
vpand     vecmask29,%ymm8,%ymm8

vpsrlq    $29,%ymm9,%ymm11
vpaddq    128(%rsp),%ymm11,%ymm7
vpand     vecmask29,%ymm9,%ymm9

vpsrlq    $29,%ymm7,%ymm11
vpaddq    160(%rsp),%ymm11,%ymm11
vpand     vecmask29,%ymm7,%ymm7
vmovdqa   %ymm7,128(%rsp)

vpsrlq    $29,%ymm11,%ymm7
vpaddq    %ymm7,%ymm12,%ymm12
vpand     vecmask29,%ymm11,%ymm11
vmovdqa   %ymm11,160(%rsp)

vpsrlq    $29,%ymm12,%ymm11
vpaddq    %ymm11,%ymm13,%ymm13
vpand     vecmask29,%ymm12,%ymm12

vpsrlq    $29,%ymm13,%ymm11
vpaddq    %ymm11,%ymm14,%ymm14
vpand     vecmask29,%ymm13,%ymm13

vpsrlq    $29,%ymm14,%ymm11
vpaddq    %ymm11,%ymm15,%ymm15
vpand     vecmask29,%ymm14,%ymm14

vpsrlq    $29,%ymm15,%ymm11
vpaddq    96(%rsp),%ymm11,%ymm7
vpand     vecmask29,%ymm15,%ymm15

vpsrlq    $29,%ymm7,%ymm11
vpaddq    %ymm11,%ymm0,%ymm0
vpand     vecmask29,%ymm7,%ymm7
vmovdqa   %ymm7,96(%rsp)

vpsrlq    $29,%ymm0,%ymm11
vpaddq    %ymm11,%ymm1,%ymm1
vpand     vecmask29,%ymm0,%ymm0

vpsrlq    $29,%ymm1,%ymm11
vpaddq    %ymm11,%ymm2,%ymm2
vpand     vecmask29,%ymm1,%ymm1

vpsrlq    $29,%ymm2,%ymm11
vpaddq    %ymm11,%ymm3,%ymm3
vpand     vecmask29,%ymm2,%ymm2

vpsrlq    $29,%ymm3,%ymm11
vpaddq    %ymm11,%ymm4,%ymm4
vpand     vecmask29,%ymm3,%ymm3

vpsrlq    $29,%ymm4,%ymm11
vpaddq    %ymm11,%ymm5,%ymm5
vpand     vecmask29,%ymm4,%ymm4

vpsrlq    $29,%ymm5,%ymm11
vpaddq    %ymm11,%ymm6,%ymm6
vpand     vecmask29,%ymm5,%ymm5

vpsrlq    $29,%ymm6,%ymm11
vpaddq    64(%rsp),%ymm11,%ymm7
vpand     vecmask29,%ymm6,%ymm6

vpsrlq    $29,%ymm7,%ymm11
vpaddq    %ymm11,%ymm10,%ymm10
vpand     vecmask29,%ymm7,%ymm7

vpsrlq    $28,%ymm10,%ymm11
vpaddq    %ymm11,%ymm8,%ymm8
vmovdqa   %ymm8,64(%rsp)
vpand     vecmask28,%ymm10,%ymm8

vmovdqa   128(%rsp),%ymm10
vmovdqa   160(%rsp),%ymm11

subb      $1,%cl
cmpb	  $0,%cl
jge       .L2

movb	  $7,%cl
subq      $1,%r15
cmpq	  $0,%r15
jge       .L1

// Reduce
vmovdqa   %ymm7,128(%rsp)
vmovdqa   %ymm8,160(%rsp)

vmovdqa   64(%rsp),%ymm8
vpsrlq    $29,%ymm8,%ymm7
vpaddq    %ymm7,%ymm9,%ymm9
vpand     vecmask29,%ymm8,%ymm8
vmovdqa   %ymm8,64(%rsp)

vpsrlq    $29,%ymm9,%ymm7
vpaddq    %ymm7,%ymm10,%ymm10
vpand     vecmask29,%ymm9,%ymm9

vpsrlq    $29,%ymm10,%ymm7
vpaddq    %ymm7,%ymm11,%ymm11
vpand     vecmask29,%ymm10,%ymm10

vpsrlq    $29,%ymm11,%ymm7
vpaddq    %ymm7,%ymm12,%ymm12
vpand     vecmask29,%ymm11,%ymm11

vpsrlq    $29,%ymm12,%ymm7
vpaddq    %ymm7,%ymm13,%ymm13
vpand     vecmask29,%ymm12,%ymm12

vpsrlq    $29,%ymm13,%ymm7
vpaddq    %ymm7,%ymm14,%ymm14
vpand     vecmask29,%ymm13,%ymm13

vpsrlq    $29,%ymm14,%ymm7
vpaddq    %ymm7,%ymm15,%ymm15
vpand     vecmask29,%ymm14,%ymm14

vpsrlq    $29,%ymm15,%ymm7
vpaddq    96(%rsp),%ymm7,%ymm8
vpand     vecmask29,%ymm15,%ymm15

vpsrlq    $29,%ymm8,%ymm7
vpaddq    %ymm7,%ymm0,%ymm0
vpand     vecmask29,%ymm8,%ymm8
vmovdqa   %ymm8,96(%rsp)

vpsrlq    $29,%ymm0,%ymm7
vpaddq    %ymm7,%ymm1,%ymm1
vpand     vecmask29,%ymm0,%ymm0

vpsrlq    $29,%ymm1,%ymm7
vpaddq    %ymm7,%ymm2,%ymm2
vpand     vecmask29,%ymm1,%ymm1

vpsrlq    $29,%ymm2,%ymm7
vpaddq    %ymm7,%ymm3,%ymm3
vpand     vecmask29,%ymm2,%ymm2

vpsrlq    $29,%ymm3,%ymm7
vpaddq    %ymm7,%ymm4,%ymm4
vpand     vecmask29,%ymm3,%ymm3

vpsrlq    $29,%ymm4,%ymm7
vpaddq    %ymm7,%ymm5,%ymm5
vpand     vecmask29,%ymm4,%ymm4

vpsrlq    $29,%ymm5,%ymm7
vpaddq    %ymm7,%ymm6,%ymm6
vpand     vecmask29,%ymm5,%ymm5

vpsrlq    $29,%ymm6,%ymm7
vpaddq    128(%rsp),%ymm7,%ymm7
vpand     vecmask29,%ymm6,%ymm6

vpsrlq    $29,%ymm7,%ymm8
vpaddq    160(%rsp),%ymm8,%ymm8
vpand     vecmask29,%ymm7,%ymm7

vmovdqa   %ymm10,128(%rsp)
vpsrlq    $28,%ymm8,%ymm10
vpaddq    64(%rsp),%ymm10,%ymm10
vpand     vecmask28,%ymm8,%ymm8

vmovdqa   %ymm11,160(%rsp)
vpsrlq    $29,%ymm10,%ymm11
vpaddq    %ymm11,%ymm9,%ymm9
vpand     vecmask29,%ymm10,%ymm10
vmovdqa   %ymm10,64(%rsp)

vmovdqa   128(%rsp),%ymm10
vmovdqa   160(%rsp),%ymm11

// Store output
vmovdqa   %ymm9, 32(%rdi)
vmovdqa   %ymm10,64(%rdi)
vmovdqa   %ymm11,96(%rdi)
vmovdqa   %ymm12,128(%rdi)
vmovdqa   %ymm13,160(%rdi)
vmovdqa   %ymm14,192(%rdi)
vmovdqa   %ymm15,224(%rdi)
vmovdqa   %ymm0, 288(%rdi)
vmovdqa   %ymm1, 320(%rdi)
vmovdqa   %ymm2, 352(%rdi)
vmovdqa   %ymm3, 384(%rdi)
vmovdqa   %ymm4, 416(%rdi)
vmovdqa   %ymm5, 448(%rdi)
vmovdqa   %ymm6, 480(%rdi)
vmovdqa   %ymm7, 512(%rdi)
vmovdqa   %ymm8, 544(%rdi)

vmovdqa   64(%rsp),%ymm0
vmovdqa   %ymm0, 0(%rdi)
vmovdqa   96(%rsp),%ymm0
vmovdqa   %ymm0, 256(%rdi)

movq 	  0(%rsp), %r11
movq 	  8(%rsp), %r12
movq 	  16(%rsp),%r13
movq 	  24(%rsp),%r14
movq 	  32(%rsp),%r15
movq 	  40(%rsp),%rbx
movq 	  48(%rsp),%rbp

movq 	  %r11,%rsp

ret
