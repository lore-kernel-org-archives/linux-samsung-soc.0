From: Dave Martin <Dave.Martin@arm.com>
Subject: Re: [PATCH] ARM: Exynos : Fix build error with thumb2
Date: Mon, 2 Jun 2014 11:10:24 +0100
Message-ID: <20140602101023.GB3855@e103592.cambridge.arm.com>
References: <1401119625-11309-1-git-send-email-santosh.shukla@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from fw-tnat.cambridge.arm.com ([217.140.96.21]:51564 "EHLO
	cam-smtp0.cambridge.arm.com" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1752784AbaFBKKc (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 2 Jun 2014 06:10:32 -0400
Content-Disposition: inline
In-Reply-To: <1401119625-11309-1-git-send-email-santosh.shukla@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Santosh Shukla <santosh.shukla@linaro.org>
Cc: kgene.kim@samsung.com, arnd@arndb.de, linux@arm.linux.org.uk, catalin.marinas@arm.com, linux-samsung-soc@vger.kernel.org, viresh.kumar@linaro.org, t.figa@samsung.com, linaro-kernel@lists.linaro.org, thomas.abraham@linaro.org, linux-arm-kernel@lists.infradead.org

On Mon, May 26, 2014 at 09:23:45PM +0530, Santosh Shukla wrote:
> From: santosh shukla <santosh.shukla@linaro.org>
> 
> Add non-global symbol .LLl2x0_regs_phys to avoid build break in thumb2 mode.
> 
> IIUC, arm assembler fail to load value of "global" variable
> l2xo_regs_phys for thum2 mode and wrapping it in non-global symbol like
> .Ll2x0_regs_phys solves the build break issue.
> 
> arch/arm/mach-exynos/sleep.S: Assembler messages:
> arch/arm/mach-exynos/sleep.S:57: Error: invalid immediate for address
> calculation (value = 0x00000004)
> 
> fix inspired from [1]
> 
> [1] https://lkml.org/lkml/2010/3/31/235
> 
> Signed-off-by: santosh shukla <santosh.shukla@linaro.org>

Reviewed-by: Dave Martin <Dave.Martin@arm.com>

The binutils folks insist that this is not a bug in gas.  (I disagreed, but
it's a grey area.)  This is the established pattern for working round this
issue -- looks fine to me.

Cheers
---Dave


> ---
>  arch/arm/mach-exynos/sleep.S |    4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm/mach-exynos/sleep.S b/arch/arm/mach-exynos/sleep.S
> index a2613e9..dc8c6b6 100644
> --- a/arch/arm/mach-exynos/sleep.S
> +++ b/arch/arm/mach-exynos/sleep.S
> @@ -54,7 +54,7 @@ ENTRY(exynos_cpu_resume)
>  	ldr	r1, =CPU_CORTEX_A9
>  	cmp	r0, r1
>  	bne	skip_l2_resume
> -	adr	r0, l2x0_regs_phys
> +	adr	r0, .Ll2x0_regs_phys
>  	ldr	r0, [r0]
>  	cmp	r0, #0
>  	beq	skip_l2_resume
> @@ -79,6 +79,8 @@ skip_l2_resume:
>  	b	cpu_resume
>  ENDPROC(exynos_cpu_resume)
>  #ifdef CONFIG_CACHE_L2X0
> +
> +.Ll2x0_regs_phys:
>  	.globl l2x0_regs_phys
>  l2x0_regs_phys:
>  	.long	0
> -- 
> 1.7.9.5
> 
> 
> _______________________________________________
> linaro-kernel mailing list
> linaro-kernel@lists.linaro.org
> http://lists.linaro.org/mailman/listinfo/linaro-kernel
