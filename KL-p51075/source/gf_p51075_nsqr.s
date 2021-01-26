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
.globl gfp51075nsqr
gfp51075nsqr:

movq 	%rsp, %r11
subq 	$168, %rsp

movq 	%r11,  0(%rsp)
movq 	%r12,  8(%rsp)
movq 	%r13, 16(%rsp)
movq 	%r14, 24(%rsp)
movq 	%r15, 32(%rsp)
movq 	%rbp, 40(%rsp)
movq 	%rbx, 48(%rsp)
movq 	%rdi, 56(%rsp)

movq 	 0(%rsi), %r8	
movq 	 8(%rsi), %r9	
movq 	16(%rsi), %r10	
movq 	24(%rsi), %r11
movq 	32(%rsi), %r12
movq 	40(%rsi), %r13
movq 	48(%rsi), %r14
movq 	56(%rsi), %r15

movq 	%r8,  64(%rsp)
movq 	%r9,  72(%rsp)
movq 	%r10, 80(%rsp)
movq 	%r11, 88(%rsp)
movq 	%r12, 96(%rsp)
movq 	%r13, 104(%rsp)
movq 	%r14, 112(%rsp)
movq 	%r15, 120(%rsp)

movq 	%rdx, %rax

.START:

subq  	$1, %rax
movq 	%rax, 160(%rsp)

movq    64(%rsp), %rdx
    
mulx    72(%rsp), %r9, %r10
mulx    80(%rsp), %rcx, %r11
addq    %rcx, %r10

mulx    88(%rsp), %rcx, %r12
adcq    %rcx, %r11

mulx    96(%rsp), %rcx, %r13
adcq    %rcx, %r12

mulx    104(%rsp), %rcx, %r14
adcq    %rcx, %r13

mulx    112(%rsp), %rcx, %r15
adcq    %rcx, %r14

mulx    120(%rsp), %rcx, %rax
adcq    %rcx, %r15
adcq    $0, %rax

movq    %r9, 128(%rsp)
movq    72(%rsp), %rdx

mulx    80(%rsp), %rdi, %rbx
mulx    88(%rsp), %rcx, %rbp
addq    %rcx, %rbx

mulx    96(%rsp), %rcx, %rsi
adcq    %rcx, %rbp

mulx    104(%rsp), %rcx, %r8
adcq    %rcx, %rsi

mulx    112(%rsp), %rcx, %r9
adcq    %rcx, %r8

mulx    120(%rsp), %rdx, %rcx
adcq    %rdx, %r9
adcq    $0, %rcx

addq    %rdi, %r11
adcq    %rbx, %r12
adcq    %rbp, %r13
adcq    %rsi, %r14
adcq    %r8,  %r15
adcq    %r9,  %rax
adcq    $0,   %rcx

movq    80(%rsp), %rdx

mulx    88(%rsp), %rdi, %rbx
mulx    96(%rsp), %r8, %rbp
addq    %r8, %rbx

mulx    104(%rsp), %r8, %rsi
adcq    %r8, %rbp

mulx    112(%rsp), %r8, %r9
adcq    %r8, %rsi

mulx    120(%rsp), %rdx, %r8
adcq    %rdx, %r9
adcq    $0, %r8

addq    %rdi, %r13
adcq    %rbx, %r14
adcq    %rbp, %r15
adcq    %rsi, %rax
adcq    %r9,  %rcx
adcq    $0,    %r8

movq    88(%rsp), %rdx

mulx    96(%rsp), %rdi, %rbx
mulx    104(%rsp), %r9,  %rbp
addq    %r9, %rbx

mulx    112(%rsp), %r9, %rsi
adcq    %r9, %rbp

mulx    120(%rsp), %rdx, %r9
adcq    %rdx, %rsi
adcq    $0, %r9

addq    %rdi, %r15
adcq    %rbx, %rax
adcq    %rbp, %rcx
adcq    %rsi,  %r8
adcq    $0,    %r9

movq    96(%rsp), %rdx

mulx    104(%rsp), %rdi, %rbx
mulx    112(%rsp), %rsi, %rbp
addq    %rsi, %rbx

mulx    120(%rsp), %rdx, %rsi
adcq    %rdx, %rbp
adcq    $0, %rsi

addq    %rdi, %rcx
adcq    %rbx,  %r8
adcq    %rbp,  %r9
adcq    $0,   %rsi

movq    104(%rsp), %rdx

mulx    112(%rsp), %rdi, %rbx
mulx    120(%rsp), %rdx, %rbp
addq    %rdx, %rbx
adcq    $0,   %rbp

addq    %rdi,  %r9
adcq    %rbx, %rsi
adcq    $0,   %rbp

movq    112(%rsp), %rdx

mulx    120(%rsp), %rdi, %rbx
addq    %rdi, %rbp
adcq    $0,   %rbx

movq    128(%rsp), %rdx

movq    $0, %rdi
shld    $1, %rbx, %rdi
shld    $1, %rbp, %rbx
shld    $1, %rsi, %rbp
shld    $1, %r9,  %rsi
shld    $1, %r8,  %r9
shld    $1, %rcx, %r8
shld    $1, %rax, %rcx
shld    $1, %r15, %rax
shld    $1, %r14, %r15
shld    $1, %r13, %r14
shld    $1, %r12, %r13
shld    $1, %r11, %r12
shld    $1, %r10, %r11
shld    $1, %rdx, %r10
shlq    $1, %rdx

movq    %rdx, 128(%rsp)
movq    %r10, 136(%rsp)
movq    %r11, 144(%rsp)
movq    %r12, 152(%rsp)

movq    64(%rsp), %rdx
mulx    %rdx, %r12, %r11
addq    128(%rsp), %r11
movq    %r11, 128(%rsp)

movq    72(%rsp), %rdx
mulx    %rdx, %r10, %r11
adcq    136(%rsp), %r10
adcq    144(%rsp), %r11
movq    %r10, 136(%rsp)
movq    %r11, 144(%rsp)

movq    80(%rsp), %rdx
mulx    %rdx, %r10, %r11
adcq    152(%rsp), %r10
adcq    %r11, %r13
movq    %r10, 152(%rsp)

movq    88(%rsp), %rdx
mulx    %rdx, %r10, %r11
adcq    %r10, %r14
adcq    %r11, %r15

movq    96(%rsp), %rdx
mulx    %rdx, %r10, %r11
adcq    %r10, %rax
adcq    %r11, %rcx

movq    104(%rsp), %rdx
mulx    %rdx, %r10, %r11
adcq    %r10, %r8
adcq    %r11, %r9

movq    112(%rsp), %rdx
mulx    %rdx, %r10, %r11
adcq    %r10, %rsi
adcq    %r11, %rbp

movq    120(%rsp), %rdx
mulx    %rdx, %r10, %r11
adcq    %r10, %rbx
adcq    %r11, %rdi

movq    $300, %rdx

mulx    %rax, %rax, %r10
mulx    %rcx, %rcx, %r11
addq    %r10, %rcx

mulx    %r8, %r8, %r10
adcq    %r11, %r8

mulx    %r9, %r9, %r11
adcq    %r10, %r9

mulx    %rsi, %rsi, %r10
adcq    %r11, %rsi

mulx    %rbp, %rbp, %r11
adcq    %r10, %rbp

mulx    %rbx, %rbx, %r10
adcq    %r11, %rbx

mulx    %rdi, %rdi, %r11
adcq    %r10, %rdi
adcq    $0, %r11

addq    %rax, %r12
adcq    128(%rsp), %rcx
adcq    136(%rsp), %r8
adcq    144(%rsp), %r9
adcq    152(%rsp), %rsi
adcq    %rbp, %r13
adcq    %rbx, %r14
adcq    %rdi, %r15
adcq    $0,   %r11

shld    $2, %r15, %r11
andq	mask62, %r15

imul    $75, %r11, %r11
addq    %r11, %r12
adcq    $0, %rcx
adcq    $0, %r8
adcq    $0, %r9
adcq    $0, %rsi
adcq    $0, %r13
adcq    $0, %r14
adcq    $0, %r15

movq   	%r12, 64(%rsp)
movq   	%rcx, 72(%rsp)
movq   	%r8,  80(%rsp)
movq   	%r9,  88(%rsp)
movq   	%rsi, 96(%rsp)
movq   	%r13, 104(%rsp)
movq   	%r14, 112(%rsp)
movq   	%r15, 120(%rsp)

movq 	160(%rsp), %rax
cmpq    $0, %rax

jne     .START

movq   	56(%rsp), %rdi

movq   	%r12,  0(%rdi)
movq   	%rcx,  8(%rdi)
movq   	%r8,  16(%rdi)
movq   	%r9,  24(%rdi)
movq   	%rsi, 32(%rdi)
movq   	%r13, 40(%rdi)
movq   	%r14, 48(%rdi)
movq   	%r15, 56(%rdi)

movq 	 0(%rsp), %r11
movq 	 8(%rsp), %r12
movq 	16(%rsp), %r13
movq 	24(%rsp), %r14
movq 	32(%rsp), %r15
movq 	40(%rsp), %rbp
movq 	48(%rsp), %rbx

movq 	%r11, %rsp

ret
