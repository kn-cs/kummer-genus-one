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
.globl gfp50645mul
gfp50645mul:

movq 	%rsp, %r11
subq 	$272, %rsp

movq 	%r11,  0(%rsp)
movq 	%r12,  8(%rsp)
movq 	%r13, 16(%rsp)
movq 	%r14, 24(%rsp)
movq 	%r15, 32(%rsp)
movq 	%rbp, 40(%rsp)
movq 	%rbx, 48(%rsp)
movq 	%rdi, 56(%rsp)

movq    0(%rsi),   %r8
movq    8(%rsi),   %r9
movq    16(%rsi), %r10
movq    24(%rsi), %r11
movq    32(%rsi), %r12
movq    40(%rsi), %r13
movq    48(%rsi), %r14
movq    56(%rsi), %r15

movq    %r8,  64(%rsp)
movq    %r9,  72(%rsp)
movq    %r10, 80(%rsp)
movq    %r11, 88(%rsp)
movq    %r12, 96(%rsp)
movq    %r13, 104(%rsp)
movq    %r14, 112(%rsp)
movq    %r15, 120(%rsp)

movq    0(%rdx),   %r8
movq    8(%rdx),   %r9
movq    16(%rdx), %r10
movq    24(%rdx), %r11
movq    32(%rdx), %r12
movq    40(%rdx), %r13
movq    48(%rdx), %r14
movq    56(%rdx), %r15

movq    %r8,  128(%rsp)
movq    %r9,  136(%rsp)
movq    %r10, 144(%rsp)
movq    %r11, 152(%rsp)
movq    %r12, 160(%rsp)
movq    %r13, 168(%rsp)
movq    %r14, 176(%rsp)
movq    %r15, 184(%rsp)
 
movq    128(%rsp), %rdx    

mulx    64(%rsp), %r8, %r9
mulx    72(%rsp), %rcx, %r10
addq    %rcx, %r9

mulx    80(%rsp), %rcx, %r11
adcq    %rcx, %r10

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

movq    %r8,  192(%rsp)
movq    %r9,  200(%rsp)
movq    %r10, 208(%rsp)
movq    %r11, 216(%rsp)

movq    136(%rsp), %rdx

mulx    64(%rsp), %r8, %r9
mulx    72(%rsp), %rcx, %r10
addq    %rcx, %r9

mulx    80(%rsp), %rcx, %r11
adcq    %rcx, %r10

mulx    88(%rsp), %rcx, %rbx
adcq    %rcx, %r11

mulx    96(%rsp), %rcx, %rbp
adcq    %rcx, %rbx

mulx    104(%rsp), %rcx, %rsi
adcq    %rcx, %rbp

mulx    112(%rsp), %rcx, %rdi
adcq    %rcx, %rsi

mulx    120(%rsp), %rdx, %rcx
adcq    %rdx, %rdi
adcq    $0, %rcx

addq    200(%rsp), %r8
adcq    208(%rsp), %r9
adcq    216(%rsp), %r10
adcq    %r12, %r11
adcq    %rbx, %r13
adcq    %rbp, %r14
adcq    %rsi, %r15
adcq    %rdi, %rax
adcq    $0,   %rcx

movq    %r8,  200(%rsp)
movq    %r9,  208(%rsp)
movq    %r10, 216(%rsp)
movq    %r11, 224(%rsp)

movq    144(%rsp), %rdx

mulx    64(%rsp), %r8, %r9
mulx    72(%rsp), %r12, %r10
addq    %r12, %r9

mulx    80(%rsp), %r12, %r11
adcq    %r12, %r10

mulx    88(%rsp), %r12, %rbx
adcq    %r12, %r11

mulx    96(%rsp), %r12, %rbp
adcq    %r12, %rbx

mulx    104(%rsp), %r12, %rsi
adcq    %r12, %rbp

mulx    112(%rsp), %r12, %rdi
adcq    %r12, %rsi

mulx    120(%rsp), %rdx, %r12
adcq    %rdx, %rdi
adcq    $0, %r12

addq    208(%rsp), %r8
adcq    216(%rsp), %r9
adcq    224(%rsp), %r10
adcq    %r13, %r11
adcq    %rbx, %r14
adcq    %rbp, %r15
adcq    %rsi, %rax
adcq    %rdi, %rcx
adcq    $0,   %r12

movq    %r8,  208(%rsp)
movq    %r9,  216(%rsp)
movq    %r10, 224(%rsp)
movq    %r11, 232(%rsp)

movq    152(%rsp), %rdx

mulx    64(%rsp), %r8, %r9
mulx    72(%rsp), %r13, %r10
addq    %r13, %r9

mulx    80(%rsp), %r13, %r11
adcq    %r13, %r10

mulx    88(%rsp), %r13, %rbx
adcq    %r13, %r11

mulx    96(%rsp), %r13, %rbp
adcq    %r13, %rbx

mulx    104(%rsp), %r13, %rsi
adcq    %r13, %rbp

mulx    112(%rsp), %r13, %rdi
adcq    %r13, %rsi

mulx    120(%rsp), %rdx, %r13
adcq    %rdx, %rdi
adcq    $0, %r13

addq    216(%rsp), %r8
adcq    224(%rsp), %r9
adcq    232(%rsp), %r10
adcq    %r14, %r11
adcq    %rbx, %r15
adcq    %rbp, %rax
adcq    %rsi, %rcx
adcq    %rdi, %r12
adcq    $0,   %r13

movq    %r8,  216(%rsp)
movq    %r9,  224(%rsp)
movq    %r10, 232(%rsp)
movq    %r11, 240(%rsp)

movq    160(%rsp), %rdx

mulx    64(%rsp), %r8, %r9
mulx    72(%rsp), %r14, %r10
addq    %r14, %r9

mulx    80(%rsp), %r14, %r11
adcq    %r14, %r10

mulx    88(%rsp), %r14, %rbx
adcq    %r14, %r11

mulx    96(%rsp), %r14, %rbp
adcq    %r14, %rbx

mulx    104(%rsp), %r14, %rsi
adcq    %r14, %rbp

mulx    112(%rsp), %r14, %rdi
adcq    %r14, %rsi

mulx    120(%rsp), %rdx, %r14
adcq    %rdx, %rdi
adcq    $0, %r14

addq    224(%rsp), %r8
adcq    232(%rsp), %r9
adcq    240(%rsp), %r10
adcq    %r15, %r11
adcq    %rbx, %rax
adcq    %rbp, %rcx
adcq    %rsi, %r12
adcq    %rdi, %r13
adcq    $0,   %r14

movq    %r8,  224(%rsp)
movq    %r9,  232(%rsp)
movq    %r10, 240(%rsp)
movq    %r11, 248(%rsp)

movq    168(%rsp), %rdx

mulx    64(%rsp), %r8, %r9
mulx    72(%rsp), %r15, %r10
addq    %r15, %r9

mulx    80(%rsp), %r15, %r11
adcq    %r15, %r10

mulx    88(%rsp), %r15, %rbx
adcq    %r15, %r11

mulx    96(%rsp), %r15, %rbp
adcq    %r15, %rbx

mulx    104(%rsp), %r15, %rsi
adcq    %r15, %rbp

mulx    112(%rsp), %r15, %rdi
adcq    %r15, %rsi

mulx    120(%rsp), %rdx, %r15
adcq    %rdx, %rdi
adcq    $0, %r15

addq    232(%rsp),  %r8
adcq    240(%rsp),  %r9
adcq    248(%rsp), %r10
adcq    %rax, %r11
adcq    %rbx, %rcx
adcq    %rbp, %r12
adcq    %rsi, %r13
adcq    %rdi, %r14
adcq    $0,   %r15

movq    %r8,  232(%rsp)
movq    %r9,  240(%rsp)
movq    %r10, 248(%rsp)
movq    %r11, 256(%rsp)

movq    176(%rsp), %rdx

mulx    64(%rsp), %r8, %r9
mulx    72(%rsp), %rax, %r10
addq    %rax, %r9

mulx    80(%rsp), %rax, %r11
adcq    %rax, %r10

mulx    88(%rsp), %rax, %rbx
adcq    %rax, %r11

mulx    96(%rsp), %rax, %rbp
adcq    %rax, %rbx

mulx    104(%rsp), %rax, %rsi
adcq    %rax, %rbp

mulx    112(%rsp), %rax, %rdi
adcq    %rax, %rsi

mulx    120(%rsp), %rdx, %rax
adcq    %rdx, %rdi
adcq    $0, %rax

addq    240(%rsp), %r8
adcq    248(%rsp), %r9
adcq    256(%rsp), %r10
adcq    %rcx, %r11
adcq    %rbx, %r12
adcq    %rbp, %r13
adcq    %rsi, %r14
adcq    %rdi, %r15
adcq    $0,   %rax

movq    %r8,  240(%rsp)
movq    %r9,  248(%rsp)
movq    %r10, 256(%rsp)
movq    %r11, 264(%rsp)

movq    184(%rsp), %rdx

mulx    64(%rsp), %r8, %r9
mulx    72(%rsp), %rcx, %r10
addq    %rcx, %r9

mulx    80(%rsp), %rcx, %r11
adcq    %rcx, %r10

mulx    88(%rsp), %rcx, %rbx
adcq    %rcx, %r11

mulx    96(%rsp), %rcx, %rbp
adcq    %rcx, %rbx

mulx    104(%rsp), %rcx, %rsi
adcq    %rcx, %rbp

mulx    112(%rsp), %rcx, %rdi
adcq    %rcx, %rsi

mulx    120(%rsp), %rdx, %rcx
adcq    %rdx, %rdi
adcq    $0, %rcx

addq    248(%rsp), %r8
adcq    256(%rsp), %r9
adcq    264(%rsp), %r10
adcq    %r12, %r11
adcq    %rbx, %r13
adcq    %rbp, %r14
adcq    %rsi, %r15
adcq    %rdi, %rax
adcq    $0,   %rcx

movq    $2880, %rdx

mulx    %r9,  %r9, %rbx
mulx    %r10, %r10, %rbp
addq    %rbx, %r10

mulx    %r11, %r11, %rbx
adcq    %rbp, %r11

mulx    %r13, %r13, %rbp
adcq    %rbx, %r13

mulx    %r14, %r14, %rbx
adcq    %rbp, %r14

mulx    %r15, %r15, %rbp
adcq    %rbx, %r15

mulx    %rax, %rax, %rbx
adcq    %rbp, %rax

mulx    %rcx, %rcx, %rbp
adcq    %rbx, %rcx
adcq    $0, %rbp

addq    192(%rsp), %r9
adcq    200(%rsp), %r10
adcq    208(%rsp), %r11
adcq    216(%rsp), %r13
adcq    224(%rsp), %r14
adcq    232(%rsp), %r15
adcq    240(%rsp), %rax
adcq    %r8, %rcx
adcq    $0,  %rbp


shld    $6, %rcx, %rbp
andq	mask58, %rcx

imul    $45, %rbp, %rbp
addq    %rbp, %r9
adcq    $0, %r10
adcq    $0, %r11
adcq    $0, %r13
adcq    $0, %r14
adcq    $0, %r15
adcq    $0, %rax
adcq    $0, %rcx

movq   	56(%rsp), %rdi

movq   	%r9,   0(%rdi)
movq   	%r10,  8(%rdi)
movq   	%r11, 16(%rdi)
movq   	%r13, 24(%rdi)
movq   	%r14, 32(%rdi)
movq   	%r15, 40(%rdi)
movq   	%rax, 48(%rdi)
movq   	%rcx, 56(%rdi)

movq 	 0(%rsp), %r11
movq 	 8(%rsp), %r12
movq 	16(%rsp), %r13
movq 	24(%rsp), %r14
movq 	32(%rsp), %r15
movq 	40(%rsp), %rbp
movq 	48(%rsp), %rbx

movq 	%r11, %rsp

ret


.p2align 5
.globl gfp50645reduce
gfp50645reduce:

movq    0(%rdi),   %r8
movq    8(%rdi),   %r9
movq    56(%rdi), %r10

movq    %r10, %r11
shrq    $58, %r11
andq	mask58, %r10

imul    $45, %r11, %r11
addq    %r11, %r8
adcq    $0, %r9

movq    %r8,   0(%rdi)
movq    %r9,   8(%rdi)
movq    %r10, 56(%rdi)

ret
