Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5231DC433F5
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 21 Dec 2021 10:38:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230361AbhLUKi5 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 21 Dec 2021 05:38:57 -0500
Received: from mailout1.w1.samsung.com ([210.118.77.11]:40648 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229925AbhLUKi5 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 21 Dec 2021 05:38:57 -0500
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
        by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20211221103855euoutp01bba8239c76c10e3baf8c7c1d600cdb1f~CvuwFU7_G1426414264euoutp01k
        for <linux-samsung-soc@vger.kernel.org>; Tue, 21 Dec 2021 10:38:55 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20211221103855euoutp01bba8239c76c10e3baf8c7c1d600cdb1f~CvuwFU7_G1426414264euoutp01k
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1640083135;
        bh=oF8lfB+A41EFcbA/czBlshe/FcRz3uGLOzbfN68xBVE=;
        h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
        b=txXmAUeBBCsLRsDmCkHowmIXNsRi5OZFNQnPhIoHve2VAp1bz0zh9o+khP9y0IJfk
         SSbLV607Cf75f1mf1dlDOI7QxJEdR8vdFftas+GsuwWYBeW2UeIfUajafgphhUAjsc
         kwOIXP5LXB0DTntjN+dVeKQ3kxnUIPrzr3+SCocI=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTP id
        20211221103854eucas1p269d063845d6cd43885c6d068d0831823~CvuvlAqXk2062520625eucas1p2K;
        Tue, 21 Dec 2021 10:38:54 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
        eusmges2new.samsung.com (EUCPMTA) with SMTP id 6D.E2.09887.EBEA1C16; Tue, 21
        Dec 2021 10:38:54 +0000 (GMT)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
        20211221103854eucas1p2592e38fcc84c1c3506fce87f1dab6739~CvuvIaD_I1659016590eucas1p2W;
        Tue, 21 Dec 2021 10:38:54 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
        eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20211221103854eusmtrp1d97454f402c389f9122a7d07115d3883~CvuvHcXMl0887408874eusmtrp1O;
        Tue, 21 Dec 2021 10:38:54 +0000 (GMT)
X-AuditID: cbfec7f4-45bff7000000269f-ad-61c1aebef6bf
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
        eusmgms1.samsung.com (EUCPMTA) with SMTP id 45.37.09522.EBEA1C16; Tue, 21
        Dec 2021 10:38:54 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
        eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20211221103853eusmtip24efd417384f28ccb1d39d7f07f984450~CvuucqjCN0648506485eusmtip2S;
        Tue, 21 Dec 2021 10:38:53 +0000 (GMT)
Message-ID: <0ffc858f-27e7-6789-4be1-c4c5ad61eb9d@samsung.com>
Date:   Tue, 21 Dec 2021 11:38:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0)
        Gecko/20100101 Thunderbird/91.4.0
Subject: Re: [PATCH v4 7/7] ARM: implement support for vmap'ed stacks
Content-Language: en-US
To:     Ard Biesheuvel <ardb@kernel.org>,
        linux-arm-kernel@lists.infradead.org
Cc:     Russell King <linux@armlinux.org.uk>,
        Nicolas Pitre <nico@fluxnic.net>,
        Arnd Bergmann <arnd@arndb.de>,
        Kees Cook <keescook@chromium.org>,
        Keith Packard <keithpac@amazon.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Tony Lindgren <tony@atomide.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        'Linux Samsung SOC' <linux-samsung-soc@vger.kernel.org>
From:   Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <20211122092816.2865873-8-ardb@kernel.org>
Content-Transfer-Encoding: 7bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrEKsWRmVeSWpSXmKPExsWy7djPc7r71h1MNOi8pmzx88t7Rou/k46x
        W5zpzrW4t/M+o8X58xvYLab8Wc5ksenxNVaLGef3MVkcmrqX0eLDhP9MFvNevGCz2H/Fy4HH
        Y8WFLlaPy9cuMnv8/jWJ0ePb10ksHrMbLrJ4PDvRzuaxYFOpx6ZVnWwed67tYfPYvKTe4/Mm
        uQDuKC6blNSczLLUIn27BK6MF7uPsxWc7WKsOP5rAVsDY0dOFyMnh4SAicSy3xdZuhi5OIQE
        VjBKrH7cxgrhfGGU+LnhLlTmM6PElV/32WFanq/ZDVW1nFHizdEtzCAJIYGPjBJtM1JBbF4B
        O4lv7VPAGlgEVCUO9t9khIgLSpyc+YQFxBYVSJJo7fjDBGILC7hKNN9aClbDLCAucevJfKA4
        B4eIgJfEvBncILuYBSYzS6ya8J4NpIZNwFCi620XmM0pYC7Re3cRC0SvvMT2t3OYQRokBJZz
        Snx83MMCcbWLxLZlEA0SAsISr45vgfpGRuL05B4WiIZmRomH59ayQzg9jBKXm2YwQlRZS9w5
        94sN5CRmAU2J9bv0IcKOEvN3/WcHCUsI8EnceCsIcQSfxKRt05khwrwSHW1CENVqErOOr4Nb
        e/DCJeYJjEqzkIJlFpL3ZyF5ZxbC3gWMLKsYxVNLi3PTU4uN8lLL9YoTc4tL89L1kvNzNzEC
        k93pf8e/7GBc/uqj3iFGJg7GQ4wSHMxKIrxbZu9PFOJNSaysSi3Kjy8qzUktPsQozcGiJM6b
        nLkhUUggPbEkNTs1tSC1CCbLxMEp1cCkGnD8zF7vB92+R36x2jtVsG/VK2GZt/X4awUPRsO2
        2dIePv1b0/cbSF44E5/v9+dbi4f4sblPNwb2hHEdLFh3Qe2vM8ef2ks1bRcXRfYvn1xvHJJ9
        o76sM4z5s+vGy69MhRwCz085d9fHYKp66PS37YG+P1q6/6o0ahVoz7Thfxc+bdsVpm+Rp2uT
        AzPm2q0s03xSI7T+/n/hWfyc7SbX/+2/rf/ywbeyDX8fpMxmL5/+Pkqh4HpHM+O9j0mLYvVa
        PCRl5tg8E0v6ZW89+1MB/xo3q/3ZE89ueuArcKVHarHmMYv669G8Pros6js+Tl2/8PaVh3EG
        4duW7W2quPi34sX1/8rmE05OEj33av0OJZbijERDLeai4kQASYCIAuUDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrMIsWRmVeSWpSXmKPExsVy+t/xe7r71h1MNNg9n9Xi55f3jBZ/Jx1j
        tzjTnWtxb+d9Rovz5zewW0z5s5zJYtPja6wWM87vY7I4NHUvo8WHCf+ZLOa9eMFmsf+KlwOP
        x4oLXawel69dZPb4/WsSo8e3r5NYPGY3XGTxeHainc1jwaZSj02rOtk87lzbw+axeUm9x+dN
        cgHcUXo2RfmlJakKGfnFJbZK0YYWRnqGlhZ6RiaWeobG5rFWRqZK+nY2Kak5mWWpRfp2CXoZ
        L3YfZys428VYcfzXArYGxo6cLkZODgkBE4nna3azdjFycQgJLGWUuL5oNhNEQkbi5LQGVghb
        WOLPtS42iKL3jBJXd01gAUnwCthJfGufwg5iswioShzsv8kIEReUODnzCViNqECSxO51W9lA
        bGEBV4nmW0vBapgFxCVuPZkPtIyDQ0TAS2LeDG6I8GRmiW+dsSC2kECyxOKHm8HGswkYSnS9
        7QIbwylgLtF7dxELRL2ZRNfWLqiR8hLb385hnsAoNAvJFbOQbJuFpGUWkpYFjCyrGEVSS4tz
        03OLDfWKE3OLS/PS9ZLzczcxAmN727Gfm3cwznv1Ue8QIxMH4yFGCQ5mJRHeLbP3JwrxpiRW
        VqUW5ccXleakFh9iNAUGxURmKdHkfGByySuJNzQzMDU0MbM0MLU0M1YS5/Us6EgUEkhPLEnN
        Tk0tSC2C6WPi4JRqYPItivhT052ZYLHtQcvzq5+shD74XNp+6k7W+s0zZl5rmr9/udQhA/Zm
        u7u3Zs9qKy4517Ju5+7MGQdYgqdoPHFac4t9xeKm7V4LLjFcLHWokV/R+qWFy3RaWFHbO6cr
        r+UyUkSXRuVPPGyoWMZj+Fnhy80MlsVWWzc4h2yOk3Pl5nsi+8ZMMsxSfqZgWrLcj69mh7On
        5/K+NL2RKrnoy8K/30L0Fh3Q3GHcuTmnfU3Ors07n4mX1CzwOqzSuYGh990jHf8aoe27VHPs
        XmRNPqJ+ra3doFIiLbT6QqDMuh3Wi/ZllDts2sRV0ds4ySbzirOIQBLDVrW+lNj1Fx3eyrjE
        MPKmfpfMP7XquduJq0osxRmJhlrMRcWJAAeHI4p2AwAA
X-CMS-MailID: 20211221103854eucas1p2592e38fcc84c1c3506fce87f1dab6739
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20211221103854eucas1p2592e38fcc84c1c3506fce87f1dab6739
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20211221103854eucas1p2592e38fcc84c1c3506fce87f1dab6739
References: <20211122092816.2865873-1-ardb@kernel.org>
        <20211122092816.2865873-8-ardb@kernel.org>
        <CGME20211221103854eucas1p2592e38fcc84c1c3506fce87f1dab6739@eucas1p2.samsung.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Hi,

On 22.11.2021 10:28, Ard Biesheuvel wrote:
> Wire up the generic support for managing task stack allocations via vmalloc,
> and implement the entry code that detects whether we faulted because of a
> stack overrun (or future stack overrun caused by pushing the pt_regs array)
>
> While this adds a fair amount of tricky entry asm code, it should be
> noted that it only adds a TST + branch to the svc_entry path. The code
> implementing the non-trivial handling of the overflow stack is emitted
> out-of-line into the .text section.
>
> Since on ARM, we rely on do_translation_fault() to keep PMD level page
> table entries that cover the vmalloc region up to date, we need to
> ensure that we don't hit such a stale PMD entry when accessing the
> stack. So we do a dummy read from the new stack while still running from
> the old one on the context switch path, and bump the vmalloc_seq counter
> when PMD level entries in the vmalloc range are modified, so that the MM
> switch fetches the latest version of the entries.
>
> Note that we need to increase the per-mode stack by 1 word, to gain some
> space to stash a GPR until we know it is safe to touch the stack.
> However, due to the cacheline alignment of the struct, this does not
> actually increase the memory footprint of the struct stack array at all.
>
> Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
> Tested-by: Keith Packard <keithpac@amazon.com>


This patch landed recently in linux-next 20211220 as commit a1c510d0adc6 
("ARM: implement support for vmap'ed stacks"). Sadly it breaks 
suspend/resume operation on all ARM 32bit Exynos SoCs. Probably the 
suspend/resume related code must be updated somehow (it partially works 
on physical addresses and disabled MMU), but I didn't analyze it yet. If 
you have any hints, let me know.


> ---
>   arch/arm/Kconfig                   |  1 +
>   arch/arm/include/asm/page.h        |  4 +
>   arch/arm/include/asm/thread_info.h |  8 ++
>   arch/arm/kernel/entry-armv.S       | 97 +++++++++++++++++++-
>   arch/arm/kernel/entry-header.S     | 37 ++++++++
>   arch/arm/kernel/irq.c              |  9 +-
>   arch/arm/kernel/setup.c            |  8 +-
>   arch/arm/kernel/sleep.S            |  8 ++
>   arch/arm/kernel/traps.c            | 80 +++++++++++++++-
>   arch/arm/kernel/unwind.c           |  3 +-
>   arch/arm/kernel/vmlinux.lds.S      |  4 +-
>   11 files changed, 244 insertions(+), 15 deletions(-)
>
> diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
> index b1eba1b4168c..7a0853bd298f 100644
> --- a/arch/arm/Kconfig
> +++ b/arch/arm/Kconfig
> @@ -127,6 +127,7 @@ config ARM
>   	select RTC_LIB
>   	select SYS_SUPPORTS_APM_EMULATION
>   	select THREAD_INFO_IN_TASK if CURRENT_POINTER_IN_TPIDRURO
> +	select HAVE_ARCH_VMAP_STACK if THREAD_INFO_IN_TASK && (!LD_IS_LLD || LLD_VERSION >= 140000)
>   	select TRACE_IRQFLAGS_SUPPORT if !CPU_V7M
>   	# Above selects are sorted alphabetically; please add new ones
>   	# according to that.  Thanks.
> diff --git a/arch/arm/include/asm/page.h b/arch/arm/include/asm/page.h
> index 11b058a72a5b..7b871ed99ccf 100644
> --- a/arch/arm/include/asm/page.h
> +++ b/arch/arm/include/asm/page.h
> @@ -149,6 +149,10 @@ extern void copy_page(void *to, const void *from);
>   #include <asm/pgtable-2level-types.h>
>   #endif
>   
> +#ifdef CONFIG_VMAP_STACK
> +#define ARCH_PAGE_TABLE_SYNC_MASK	PGTBL_PMD_MODIFIED
> +#endif
> +
>   #endif /* CONFIG_MMU */
>   
>   typedef struct page *pgtable_t;
> diff --git a/arch/arm/include/asm/thread_info.h b/arch/arm/include/asm/thread_info.h
> index 164e15f26485..004b89d86224 100644
> --- a/arch/arm/include/asm/thread_info.h
> +++ b/arch/arm/include/asm/thread_info.h
> @@ -25,6 +25,14 @@
>   #define THREAD_SIZE		(PAGE_SIZE << THREAD_SIZE_ORDER)
>   #define THREAD_START_SP		(THREAD_SIZE - 8)
>   
> +#ifdef CONFIG_VMAP_STACK
> +#define THREAD_ALIGN		(2 * THREAD_SIZE)
> +#else
> +#define THREAD_ALIGN		THREAD_SIZE
> +#endif
> +
> +#define OVERFLOW_STACK_SIZE	SZ_4K
> +
>   #ifndef __ASSEMBLY__
>   
>   struct task_struct;
> diff --git a/arch/arm/kernel/entry-armv.S b/arch/arm/kernel/entry-armv.S
> index b447f7d0708c..54210dce80e1 100644
> --- a/arch/arm/kernel/entry-armv.S
> +++ b/arch/arm/kernel/entry-armv.S
> @@ -57,6 +57,10 @@ UNWIND(	.setfp	fpreg, sp		)
>   	@
>   	subs	r2, sp, r0		@ SP above bottom of IRQ stack?
>   	rsbscs	r2, r2, #THREAD_SIZE	@ ... and below the top?
> +#ifdef CONFIG_VMAP_STACK
> +	ldr_l	r2, high_memory, cc	@ End of the linear region
> +	cmpcc	r2, r0			@ Stack pointer was below it?
> +#endif
>   	movcs	sp, r0			@ If so, revert to incoming SP
>   
>   #ifndef CONFIG_UNWINDER_ARM
> @@ -188,13 +192,18 @@ ENDPROC(__und_invalid)
>   #define SPFIX(code...)
>   #endif
>   
> -	.macro	svc_entry, stack_hole=0, trace=1, uaccess=1
> +	.macro	svc_entry, stack_hole=0, trace=1, uaccess=1, overflow_check=1
>    UNWIND(.fnstart		)
> - UNWIND(.save {r0 - pc}		)
>   	sub	sp, sp, #(SVC_REGS_SIZE + \stack_hole)
> + THUMB(	add	sp, r1		)	@ get SP in a GPR without
> + THUMB(	sub	r1, sp, r1	)	@ using a temp register
> +
> +	.if	\overflow_check
> + UNWIND(.save	{r0 - pc}	)
> +	do_overflow_check (SVC_REGS_SIZE + \stack_hole)
> +	.endif
> +
>   #ifdef CONFIG_THUMB2_KERNEL
> -	add	sp, r1			@ get SP in a GPR without
> -	sub	r1, sp, r1		@ using a temp register
>   	tst	r1, #4			@ test stack pointer alignment
>   	sub	r1, sp, r1		@ restore original R0
>   	sub	sp, r1			@ restore original SP
> @@ -827,12 +836,20 @@ ENTRY(__switch_to)
>   	str	r7, [r8]
>   #endif
>   	mov	r0, r5
> -#if !defined(CONFIG_THUMB2_KERNEL)
> +#if !defined(CONFIG_THUMB2_KERNEL) && !defined(CONFIG_VMAP_STACK)
>   	set_current r7
>   	ldmia	r4, {r4 - sl, fp, sp, pc}	@ Load all regs saved previously
>   #else
>   	mov	r1, r7
>   	ldmia	r4, {r4 - sl, fp, ip, lr}	@ Load all regs saved previously
> +#ifdef CONFIG_VMAP_STACK
> +	@
> +	@ Do a dummy read from the new stack while running from the old one so
> +	@ that we can rely on do_translation_fault() to fix up any stale PMD
> +	@ entries covering the vmalloc region.
> +	@
> +	ldr	r2, [ip]
> +#endif
>   
>   	@ When CONFIG_THREAD_INFO_IN_TASK=n, the update of SP itself is what
>   	@ effectuates the task switch, as that is what causes the observable
> @@ -849,6 +866,76 @@ ENTRY(__switch_to)
>    UNWIND(.fnend		)
>   ENDPROC(__switch_to)
>   
> +#ifdef CONFIG_VMAP_STACK
> +	.text
> +	.align	2
> +__bad_stack:
> +	@
> +	@ We've just detected an overflow. We need to load the address of this
> +	@ CPU's overflow stack into the stack pointer register. We have only one
> +	@ scratch register so let's use a sequence of ADDs including one
> +	@ involving the PC, and decorate them with PC-relative group
> +	@ relocations. As these are ARM only, switch to ARM mode first.
> +	@
> +	@ We enter here with IP clobbered and its value stashed on the mode
> +	@ stack.
> +	@
> +THUMB(	bx	pc		)
> +THUMB(	nop			)
> +THUMB(	.arm			)
> +	mrc	p15, 0, ip, c13, c0, 4		@ Get per-CPU offset
> +
> +	.globl	overflow_stack_ptr
> +	.reloc	0f, R_ARM_ALU_PC_G0_NC, overflow_stack_ptr
> +	.reloc	1f, R_ARM_ALU_PC_G1_NC, overflow_stack_ptr
> +	.reloc	2f, R_ARM_LDR_PC_G2, overflow_stack_ptr
> +	add	ip, ip, pc
> +0:	add	ip, ip, #-4
> +1:	add	ip, ip, #0
> +2:	ldr	ip, [ip, #4]
> +
> +	str	sp, [ip, #-4]!			@ Preserve original SP value
> +	mov	sp, ip				@ Switch to overflow stack
> +	pop	{ip}				@ Original SP in IP
> +
> +#if defined(CONFIG_UNWINDER_FRAME_POINTER) && defined(CONFIG_CC_IS_GCC)
> +	mov	ip, ip				@ mov expected by unwinder
> +	push	{fp, ip, lr, pc}		@ GCC flavor frame record
> +#else
> +	str	ip, [sp, #-8]!			@ store original SP
> +	push	{fpreg, lr}			@ Clang flavor frame record
> +#endif
> +UNWIND( ldr	ip, [r0, #4]	)		@ load exception LR
> +UNWIND( str	ip, [sp, #12]	)		@ store in the frame record
> +	ldr	ip, [r0, #12]			@ reload IP
> +
> +	@ Store the original GPRs to the new stack.
> +	svc_entry uaccess=0, overflow_check=0
> +
> +UNWIND( .save   {sp, pc}	)
> +UNWIND( .save   {fpreg, lr}	)
> +UNWIND( .setfp  fpreg, sp	)
> +
> +	ldr	fpreg, [sp, #S_SP]		@ Add our frame record
> +						@ to the linked list
> +#if defined(CONFIG_UNWINDER_FRAME_POINTER) && defined(CONFIG_CC_IS_GCC)
> +	ldr	r1, [fp, #4]			@ reload SP at entry
> +	add	fp, fp, #12
> +#else
> +	ldr	r1, [fpreg, #8]
> +#endif
> +	str	r1, [sp, #S_SP]			@ store in pt_regs
> +
> +	@ Stash the regs for handle_bad_stack
> +	mov	r0, sp
> +
> +	@ Time to die
> +	bl	handle_bad_stack
> +	nop
> +UNWIND( .fnend			)
> +ENDPROC(__bad_stack)
> +#endif
> +
>   	__INIT
>   
>   /*
> diff --git a/arch/arm/kernel/entry-header.S b/arch/arm/kernel/entry-header.S
> index ae24dd54e9ef..81df2a3561ca 100644
> --- a/arch/arm/kernel/entry-header.S
> +++ b/arch/arm/kernel/entry-header.S
> @@ -423,3 +423,40 @@ scno	.req	r7		@ syscall number
>   tbl	.req	r8		@ syscall table pointer
>   why	.req	r8		@ Linux syscall (!= 0)
>   tsk	.req	r9		@ current thread_info
> +
> +	.macro	do_overflow_check, frame_size:req
> +#ifdef CONFIG_VMAP_STACK
> +	@
> +	@ Test whether the SP has overflowed. Task and IRQ stacks are aligned
> +	@ so that SP & BIT(THREAD_SIZE_ORDER + PAGE_SHIFT) should always be
> +	@ zero.
> +	@
> +ARM(	tst	sp, #1 << (THREAD_SIZE_ORDER + PAGE_SHIFT)	)
> +THUMB(	tst	r1, #1 << (THREAD_SIZE_ORDER + PAGE_SHIFT)	)
> +THUMB(	it	ne						)
> +	bne	.Lstack_overflow_check\@
> +
> +	.pushsection	.text
> +.Lstack_overflow_check\@:
> +	@
> +	@ The stack pointer is not pointing to a valid vmap'ed stack, but it
> +	@ may be pointing into the linear map instead, which may happen if we
> +	@ are already running from the overflow stack. We cannot detect overflow
> +	@ in such cases so just carry on.
> +	@
> +	str	ip, [r0, #12]			@ Stash IP on the mode stack
> +	ldr_l	ip, high_memory			@ Start of VMALLOC space
> +ARM(	cmp	sp, ip			)	@ SP in vmalloc space?
> +THUMB(	cmp	r1, ip			)
> +THUMB(	itt	lo			)
> +	ldrlo	ip, [r0, #12]			@ Restore IP
> +	blo	.Lout\@				@ Carry on
> +
> +THUMB(	sub	r1, sp, r1		)	@ Restore original R1
> +THUMB(	sub	sp, r1			)	@ Restore original SP
> +	add	sp, sp, #\frame_size		@ Undo svc_entry's SP change
> +	b	__bad_stack			@ Handle VMAP stack overflow
> +	.popsection
> +.Lout\@:
> +#endif
> +	.endm
> diff --git a/arch/arm/kernel/irq.c b/arch/arm/kernel/irq.c
> index e05219bca218..5deb40f39999 100644
> --- a/arch/arm/kernel/irq.c
> +++ b/arch/arm/kernel/irq.c
> @@ -56,7 +56,14 @@ static void __init init_irq_stacks(void)
>   	int cpu;
>   
>   	for_each_possible_cpu(cpu) {
> -		stack = (u8 *)__get_free_pages(GFP_KERNEL, THREAD_SIZE_ORDER);
> +		if (!IS_ENABLED(CONFIG_VMAP_STACK))
> +			stack = (u8 *)__get_free_pages(GFP_KERNEL,
> +						       THREAD_SIZE_ORDER);
> +		else
> +			stack = __vmalloc_node(THREAD_SIZE, THREAD_ALIGN,
> +					       THREADINFO_GFP, NUMA_NO_NODE,
> +					       __builtin_return_address(0));
> +
>   		if (WARN_ON(!stack))
>   			break;
>   		per_cpu(irq_stack_ptr, cpu) = &stack[THREAD_SIZE];
> diff --git a/arch/arm/kernel/setup.c b/arch/arm/kernel/setup.c
> index 284a80c0b6e1..039feb7cd590 100644
> --- a/arch/arm/kernel/setup.c
> +++ b/arch/arm/kernel/setup.c
> @@ -141,10 +141,10 @@ EXPORT_SYMBOL(outer_cache);
>   int __cpu_architecture __read_mostly = CPU_ARCH_UNKNOWN;
>   
>   struct stack {
> -	u32 irq[3];
> -	u32 abt[3];
> -	u32 und[3];
> -	u32 fiq[3];
> +	u32 irq[4];
> +	u32 abt[4];
> +	u32 und[4];
> +	u32 fiq[4];
>   } ____cacheline_aligned;
>   
>   #ifndef CONFIG_CPU_V7M
> diff --git a/arch/arm/kernel/sleep.S b/arch/arm/kernel/sleep.S
> index 43077e11dafd..803b51e5cba0 100644
> --- a/arch/arm/kernel/sleep.S
> +++ b/arch/arm/kernel/sleep.S
> @@ -67,6 +67,14 @@ ENTRY(__cpu_suspend)
>   	ldr	r4, =cpu_suspend_size
>   #endif
>   	mov	r5, sp			@ current virtual SP
> +#ifdef CONFIG_VMAP_STACK
> +	@ Run the suspend code from the overflow stack so we don't have to rely
> +	@ on vmalloc-to-phys conversions anywhere in the arch suspend code.
> +	@ The original SP value captured in R5 will be restored on the way out.
> +	mov_l	r6, overflow_stack_ptr	@ Base pointer
> +	mrc	p15, 0, r7, c13, c0, 4	@ Get per-CPU offset
> +	ldr	sp, [r6, r7]		@ Address of this CPU's overflow stack
> +#endif
>   	add	r4, r4, #12		@ Space for pgd, virt sp, phys resume fn
>   	sub	sp, sp, r4		@ allocate CPU state on stack
>   	ldr	r3, =sleep_save_sp
> diff --git a/arch/arm/kernel/traps.c b/arch/arm/kernel/traps.c
> index b42c446cec9a..b28a705c49cb 100644
> --- a/arch/arm/kernel/traps.c
> +++ b/arch/arm/kernel/traps.c
> @@ -121,7 +121,8 @@ void dump_backtrace_stm(u32 *stack, u32 instruction, const char *loglvl)
>   static int verify_stack(unsigned long sp)
>   {
>   	if (sp < PAGE_OFFSET ||
> -	    (sp > (unsigned long)high_memory && high_memory != NULL))
> +	    (!IS_ENABLED(CONFIG_VMAP_STACK) &&
> +	     sp > (unsigned long)high_memory && high_memory != NULL))
>   		return -EFAULT;
>   
>   	return 0;
> @@ -291,7 +292,8 @@ static int __die(const char *str, int err, struct pt_regs *regs)
>   
>   	if (!user_mode(regs) || in_interrupt()) {
>   		dump_mem(KERN_EMERG, "Stack: ", regs->ARM_sp,
> -			 ALIGN(regs->ARM_sp, THREAD_SIZE));
> +			 ALIGN(regs->ARM_sp - THREAD_SIZE, THREAD_ALIGN)
> +			 + THREAD_SIZE);
>   		dump_backtrace(regs, tsk, KERN_EMERG);
>   		dump_instr(KERN_EMERG, regs);
>   	}
> @@ -838,3 +840,77 @@ void __init early_trap_init(void *vectors_base)
>   	 */
>   #endif
>   }
> +
> +#ifdef CONFIG_VMAP_STACK
> +
> +DECLARE_PER_CPU(u8 *, irq_stack_ptr);
> +
> +asmlinkage DEFINE_PER_CPU(u8 *, overflow_stack_ptr);
> +
> +static int __init allocate_overflow_stacks(void)
> +{
> +	u8 *stack;
> +	int cpu;
> +
> +	for_each_possible_cpu(cpu) {
> +		stack = (u8 *)__get_free_page(GFP_KERNEL);
> +		if (WARN_ON(!stack))
> +			return -ENOMEM;
> +		per_cpu(overflow_stack_ptr, cpu) = &stack[OVERFLOW_STACK_SIZE];
> +	}
> +	return 0;
> +}
> +early_initcall(allocate_overflow_stacks);
> +
> +asmlinkage void handle_bad_stack(struct pt_regs *regs)
> +{
> +	unsigned long tsk_stk = (unsigned long)current->stack;
> +	unsigned long irq_stk = (unsigned long)this_cpu_read(irq_stack_ptr);
> +	unsigned long ovf_stk = (unsigned long)this_cpu_read(overflow_stack_ptr);
> +
> +	console_verbose();
> +	pr_emerg("Insufficient stack space to handle exception!");
> +
> +	pr_emerg("Task stack:     [0x%08lx..0x%08lx]\n",
> +		 tsk_stk, tsk_stk + THREAD_SIZE);
> +	pr_emerg("IRQ stack:      [0x%08lx..0x%08lx]\n",
> +		 irq_stk - THREAD_SIZE, irq_stk);
> +	pr_emerg("Overflow stack: [0x%08lx..0x%08lx]\n",
> +		 ovf_stk - OVERFLOW_STACK_SIZE, ovf_stk);
> +
> +	die("kernel stack overflow", regs, 0);
> +}
> +
> +/*
> + * Normally, we rely on the logic in do_translation_fault() to update stale PMD
> + * entries covering the vmalloc space in a task's page tables when it first
> + * accesses the region in question. Unfortunately, this is not sufficient when
> + * the task stack resides in the vmalloc region, as do_translation_fault() is a
> + * C function that needs a stack to run.
> + *
> + * So we need to ensure that these PMD entries are up to date *before* the MM
> + * switch. As we already have some logic in the MM switch path that takes care
> + * of this, let's trigger it by bumping the counter every time the core vmalloc
> + * code modifies a PMD entry in the vmalloc region.
> + */
> +void arch_sync_kernel_mappings(unsigned long start, unsigned long end)
> +{
> +	if (start > VMALLOC_END || end < VMALLOC_START)
> +		return;
> +
> +	/*
> +	 * This hooks into the core vmalloc code to receive notifications of
> +	 * any PMD level changes that have been made to the kernel page tables.
> +	 * This means it should only be triggered once for every MiB worth of
> +	 * vmalloc space, given that we don't support huge vmalloc/vmap on ARM,
> +	 * and that kernel PMD level table entries are rarely (if ever)
> +	 * updated.
> +	 *
> +	 * This means that the counter is going to max out at ~250 for the
> +	 * typical case. If it overflows, something entirely unexpected has
> +	 * occurred so let's throw a warning if that happens.
> +	 */
> +	WARN_ON(++init_mm.context.vmalloc_seq == UINT_MAX);
> +}
> +
> +#endif
> diff --git a/arch/arm/kernel/unwind.c b/arch/arm/kernel/unwind.c
> index e8d729975f12..c5ea328c428d 100644
> --- a/arch/arm/kernel/unwind.c
> +++ b/arch/arm/kernel/unwind.c
> @@ -389,7 +389,8 @@ int unwind_frame(struct stackframe *frame)
>   
>   	/* store the highest address on the stack to avoid crossing it*/
>   	ctrl.sp_low = frame->sp;
> -	ctrl.sp_high = ALIGN(ctrl.sp_low, THREAD_SIZE);
> +	ctrl.sp_high = ALIGN(ctrl.sp_low - THREAD_SIZE, THREAD_ALIGN)
> +		       + THREAD_SIZE;
>   
>   	pr_debug("%s(pc = %08lx lr = %08lx sp = %08lx)\n", __func__,
>   		 frame->pc, frame->lr, frame->sp);
> diff --git a/arch/arm/kernel/vmlinux.lds.S b/arch/arm/kernel/vmlinux.lds.S
> index f02d617e3359..aa12b65a7fd6 100644
> --- a/arch/arm/kernel/vmlinux.lds.S
> +++ b/arch/arm/kernel/vmlinux.lds.S
> @@ -138,12 +138,12 @@ SECTIONS
>   #ifdef CONFIG_STRICT_KERNEL_RWX
>   	. = ALIGN(1<<SECTION_SHIFT);
>   #else
> -	. = ALIGN(THREAD_SIZE);
> +	. = ALIGN(THREAD_ALIGN);
>   #endif
>   	__init_end = .;
>   
>   	_sdata = .;
> -	RW_DATA(L1_CACHE_BYTES, PAGE_SIZE, THREAD_SIZE)
> +	RW_DATA(L1_CACHE_BYTES, PAGE_SIZE, THREAD_ALIGN)
>   	_edata = .;
>   
>   	BSS_SECTION(0, 0, 0)

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

