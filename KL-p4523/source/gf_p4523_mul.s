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
.globl gfp4523mul
gfp4523mul:

movq 	%rsp, %r11
subq 	$176, %rsp

movq 	%r11,  0(%rsp)
movq 	%r12,  8(%rsp)
movq 	%r13, 16(%rsp)
movq 	%r14, 24(%rsp)
movq 	%r15, 32(%rsp)
movq 	%rbp, 40(%rsp)
movq 	%rbx, 48(%rsp)
movq 	%rdi, 56(%rsp)

movq    %rdx, %rbx
    
movq    0(%rbx), %rdx    

mulx    0(%rsi), %r8, %r9
mulx    8(%rsi), %rcx, %r10
addq    %rcx, %r9

mulx    16(%rsi), %rcx, %r11
adcq    %rcx, %r10

mulx    24(%rsi), %rcx, %r12
adcq    %rcx, %r11

mulx    32(%rsi), %rcx, %r13
adcq    %rcx, %r12

mulx    40(%rsi), %rcx, %r14
adcq    %rcx, %r13

mulx    48(%rsi), %rcx, %r15
adcq    %rcx, %r14

mulx    56(%rsi), %rcx, %rax
adcq    %rcx, %r15
adcq    $0, %rax

movq    %r8,   64(%rsp)
movq    %r9,   72(%rsp)
movq    %r10, 80(%rsp)
movq    %r11, 88(%rsp)
movq    %r12, 96(%rsp)
movq    %r13, 104(%rsp)
movq    %r14, 112(%rsp)
movq    %r15, 120(%rsp)
movq    %rax, 128(%rsp)

movq    8(%rbx), %rdx

mulx    0(%rsi), %r8, %r9
mulx    8(%rsi), %rcx, %r10
addq    %rcx, %r9

mulx    16(%rsi), %rcx, %r11
adcq    %rcx, %r10

mulx    24(%rsi), %rcx, %r12
adcq    %rcx, %r11

mulx    32(%rsi), %rcx, %r13
adcq    %rcx, %r12

mulx    40(%rsi), %rcx, %r14
adcq    %rcx, %r13

mulx    48(%rsi), %rcx, %r15
adcq    %rcx, %r14

mulx    56(%rsi), %rcx, %rax
adcq    %rcx, %r15
adcq    $0, %rax

addq    72(%rsp),   %r8
adcq    80(%rsp),  %r9
adcq    88(%rsp), %r10
adcq    96(%rsp), %r11
adcq    104(%rsp), %r12
adcq    112(%rsp), %r13
adcq    120(%rsp), %r14
adcq    128(%rsp), %r15
adcq    $0, 	     %rax

movq    %r8,   72(%rsp)
movq    %r9,  80(%rsp)
movq    %r10, 88(%rsp)
movq    %r11, 96(%rsp)
movq    %r12, 104(%rsp)
movq    %r13, 112(%rsp)
movq    %r14, 120(%rsp)
movq    %r15, 128(%rsp)
movq    %rax, 136(%rsp)

movq    16(%rbx), %rdx

mulx    0(%rsi), %r8, %r9
mulx    8(%rsi), %rcx, %r10
addq    %rcx, %r9

mulx    16(%rsi), %rcx, %r11
adcq    %rcx, %r10

mulx    24(%rsi), %rcx, %r12
adcq    %rcx, %r11

mulx    32(%rsi), %rcx, %r13
adcq    %rcx, %r12

mulx    40(%rsi), %rcx, %r14
adcq    %rcx, %r13

mulx    48(%rsi), %rcx, %r15
adcq    %rcx, %r14

mulx    56(%rsi), %rcx, %rax
adcq    %rcx, %r15
adcq    $0, %rax

addq    80(%rsp),  %r8
adcq    88(%rsp),  %r9
adcq    96(%rsp), %r10
adcq    104(%rsp), %r11
adcq    112(%rsp), %r12
adcq    120(%rsp), %r13
adcq    128(%rsp), %r14
adcq    136(%rsp), %r15
adcq    $0, 	     %rax

movq    %r8,  80(%rsp)
movq    %r9,  88(%rsp)
movq    %r10, 96(%rsp)
movq    %r11, 104(%rsp)
movq    %r12, 112(%rsp)
movq    %r13, 120(%rsp)
movq    %r14, 128(%rsp)
movq    %r15, 136(%rsp)
movq    %rax, 144(%rsp)

movq    24(%rbx), %rdx

mulx    0(%rsi), %r8, %r9
mulx    8(%rsi), %rcx, %r10
addq    %rcx, %r9

mulx    16(%rsi), %rcx, %r11
adcq    %rcx, %r10

mulx    24(%rsi), %rcx, %r12
adcq    %rcx, %r11

mulx    32(%rsi), %rcx, %r13
adcq    %rcx, %r12

mulx    40(%rsi), %rcx, %r14
adcq    %rcx, %r13

mulx    48(%rsi), %rcx, %r15
adcq    %rcx, %r14

mulx    56(%rsi), %rcx, %rax
adcq    %rcx, %r15
adcq    $0, %rax

addq    88(%rsp),  %r8
adcq    96(%rsp),  %r9
adcq    104(%rsp), %r10
adcq    112(%rsp), %r11
adcq    120(%rsp), %r12
adcq    128(%rsp), %r13
adcq    136(%rsp), %r14
adcq    144(%rsp), %r15
adcq    $0, 	     %rax

movq    %r8,  88(%rsp)
movq    %r9,  96(%rsp)
movq    %r10, 104(%rsp)
movq    %r11, 112(%rsp)
movq    %r12, 120(%rsp)
movq    %r13, 128(%rsp)
movq    %r14, 136(%rsp)
movq    %r15, 144(%rsp)
movq    %rax, 152(%rsp)

movq    32(%rbx), %rdx

mulx    0(%rsi), %r8, %r9
mulx    8(%rsi), %rcx, %r10
addq    %rcx, %r9

mulx    16(%rsi), %rcx, %r11
adcq    %rcx, %r10

mulx    24(%rsi), %rcx, %r12
adcq    %rcx, %r11

mulx    32(%rsi), %rcx, %r13
adcq    %rcx, %r12

mulx    40(%rsi), %rcx, %r14
adcq    %rcx, %r13

mulx    48(%rsi), %rcx, %r15
adcq    %rcx, %r14

mulx    56(%rsi), %rcx, %rax
adcq    %rcx, %r15
adcq    $0, %rax

addq    96(%rsp),  %r8
adcq    104(%rsp),  %r9
adcq    112(%rsp), %r10
adcq    120(%rsp), %r11
adcq    128(%rsp), %r12
adcq    136(%rsp), %r13
adcq    144(%rsp), %r14
adcq    152(%rsp), %r15
adcq    $0, 	     %rax

movq    %r8,  96(%rsp)
movq    %r9,  104(%rsp)
movq    %r10, 112(%rsp)
movq    %r11, 120(%rsp)
movq    %r12, 128(%rsp)
movq    %r13, 136(%rsp)
movq    %r14, 144(%rsp)
movq    %r15, 152(%rsp)
movq    %rax, 160(%rsp)

movq    40(%rbx), %rdx

mulx    0(%rsi), %r8, %r9
mulx    8(%rsi), %rcx, %r10
addq    %rcx, %r9

mulx    16(%rsi), %rcx, %r11
adcq    %rcx, %r10

mulx    24(%rsi), %rcx, %r12
adcq    %rcx, %r11

mulx    32(%rsi), %rcx, %r13
adcq    %rcx, %r12

mulx    40(%rsi), %rcx, %r14
adcq    %rcx, %r13

mulx    48(%rsi), %rcx, %r15
adcq    %rcx, %r14

mulx    56(%rsi), %rcx, %rax
adcq    %rcx, %r15
adcq    $0, %rax

addq    104(%rsp),  %r8
adcq    112(%rsp),  %r9
adcq    120(%rsp), %r10
adcq    128(%rsp), %r11
adcq    136(%rsp), %r12
adcq    144(%rsp), %r13
adcq    152(%rsp), %r14
adcq    160(%rsp), %r15
adcq    $0, 	     %rax

movq    %r8,  104(%rsp)
movq    %r9,  112(%rsp)
movq    %r10, 120(%rsp)
movq    %r11, 128(%rsp)
movq    %r12, 136(%rsp)
movq    %r13, 144(%rsp)
movq    %r14, 152(%rsp)
movq    %r15, 160(%rsp)
movq    %rax, 168(%rsp)

movq    48(%rbx), %rdx

mulx    0(%rsi), %r8, %r9
mulx    8(%rsi), %rcx, %r10
addq    %rcx, %r9

mulx    16(%rsi), %rcx, %r11
adcq    %rcx, %r10

mulx    24(%rsi), %rcx, %r12
adcq    %rcx, %r11

mulx    32(%rsi), %rcx, %r13
adcq    %rcx, %r12

mulx    40(%rsi), %rcx, %r14
adcq    %rcx, %r13

mulx    48(%rsi), %rcx, %rbp
adcq    %rcx, %r14

mulx    56(%rsi), %rcx, %rdi
adcq    %rcx, %rbp
adcq    $0, %rdi

addq    112(%rsp),   %r8
adcq    120(%rsp),   %r9
adcq    128(%rsp),  %r10
adcq    136(%rsp),  %r11
adcq    144(%rsp),  %r12
adcq    152(%rsp),  %r13
adcq    160(%rsp),  %r14
adcq    168(%rsp), %rbp
adcq    $0, 	      %rdi

movq    %r8,  112(%rsp)
movq    %r9,  120(%rsp)
movq    %r10, 128(%rsp)
movq    %r11, 136(%rsp)
movq    %r12, 144(%rsp)
movq    %r13, 152(%rsp)
movq    %r14, 160(%rsp)

movq    56(%rbx), %rdx

mulx    0(%rsi), %r8, %r9
mulx    8(%rsi), %rcx, %r10
addq    %rcx, %r9

mulx    16(%rsi), %rcx, %r11
adcq    %rcx, %r10

mulx    24(%rsi), %rcx, %r12
adcq    %rcx, %r11

mulx    32(%rsi), %rcx, %r13
adcq    %rcx, %r12

mulx    40(%rsi), %rcx, %r14
adcq    %rcx, %r13

mulx    48(%rsi), %rcx, %r15
adcq    %rcx, %r14

mulx    56(%rsi), %rcx, %rax
adcq    %rcx, %r15

addq    120(%rsp), %r8
adcq    128(%rsp), %r9
adcq    136(%rsp), %r10
adcq    144(%rsp), %r11
adcq    152(%rsp), %r12
adcq    160(%rsp), %r13
adcq    %rbp, %r14
adcq    %rdi, %r15

movq    twoe60x3, %rdx

mulx    %r9,  %r9, %rbx
mulx    %r10, %r10, %rcx
addq    %rbx, %r10

mulx    %r11, %r11, %rbx
adcq    %rcx, %r11

mulx    %r12, %r12, %rcx
adcq    %rbx, %r12

mulx    %r13, %r13, %rbx
adcq    %rcx, %r13

mulx    %r14, %r14, %rcx
adcq    %rbx, %r14

mulx    %r15, %r15, %rbx
adcq    %rcx, %r15
adcq    $0, %rbx

addq    64(%rsp),   %r9
adcq    72(%rsp),  %r10
adcq    80(%rsp), %r11
adcq    88(%rsp), %r12
adcq    96(%rsp), %r13
adcq    104(%rsp), %r14
adcq    112(%rsp), %r15
adcq    %r8, %rbx

movq    %rbx, %rcx
shrq    $4, %rcx
andq	mask4, %rbx

imul    $3, %rcx, %rcx
addq    %rcx, %r9
adcq    $0, %r10
adcq    $0, %r11
adcq    $0, %r12
adcq    $0, %r13
adcq    $0, %r14
adcq    $0, %r15
adcq    $0, %rbx

movq   	56(%rsp), %rdi

movq   	%r9,   0(%rdi)
movq   	%r10,  8(%rdi)
movq   	%r11, 16(%rdi)
movq   	%r12, 24(%rdi)
movq   	%r13, 32(%rdi)
movq   	%r14, 40(%rdi)
movq   	%r15, 48(%rdi)
movq   	%rbx, 56(%rdi)

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
.globl gfp4523reduce
gfp4523reduce:

movq    0(%rdi),   %r8
movq    8(%rdi),   %r9
movq    56(%rdi), %r10

movq    %r10, %r11
shrq    $4, %r11
andq    mask4, %r10

imul    $3, %r11, %r11
addq    %r11, %r8
adcq    $0, %r9

movq    %r8,   0(%rdi)
movq    %r9,   8(%rdi)
movq    %r10, 56(%rdi)

ret
