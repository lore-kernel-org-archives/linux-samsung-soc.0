From: Santosh Shukla <santosh.shukla@linaro.org>
Subject: Re: [PATCH] ARM: Exynos : Fix build error with thumb2
Date: Wed, 28 May 2014 19:33:28 +0530
Message-ID: <CA+iXiiNWFa+K73vrXhy2bUV2rUpEb7FWdCBcAVpak=Asy6s4LQ@mail.gmail.com>
References: <1401119625-11309-1-git-send-email-santosh.shukla@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-we0-f176.google.com ([74.125.82.176]:53381 "EHLO
	mail-we0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752995AbaE1OD3 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 28 May 2014 10:03:29 -0400
Received: by mail-we0-f176.google.com with SMTP id q59so11027965wes.7
        for <linux-samsung-soc@vger.kernel.org>; Wed, 28 May 2014 07:03:28 -0700 (PDT)
In-Reply-To: <1401119625-11309-1-git-send-email-santosh.shukla@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>, Arnd Bergmann <arnd@arndb.de>, linux@arm.linux.org.uk, Catalin Marinas <catalin.marinas@arm.com>
Cc: Thomas Abraham <thomas.abraham@linaro.org>, "t.figa" <t.figa@samsung.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, linaro-kernel <linaro-kernel@lists.linaro.org>, Viresh Kumar <viresh.kumar@linaro.org>, linux-arm-kernel@lists.infradead.org, santosh shukla <santosh.shukla@linaro.org>

ping!

On 26 May 2014 21:23, Santosh Shukla <santosh.shukla@linaro.org> wrote:
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
> ---
>  arch/arm/mach-exynos/sleep.S |    4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/arch/arm/mach-exynos/sleep.S b/arch/arm/mach-exynos/sleep.S
> index a2613e9..dc8c6b6 100644
> --- a/arch/arm/mach-exynos/sleep.S
> +++ b/arch/arm/mach-exynos/sleep.S
> @@ -54,7 +54,7 @@ ENTRY(exynos_cpu_resume)
>         ldr     r1, =CPU_CORTEX_A9
>         cmp     r0, r1
>         bne     skip_l2_resume
> -       adr     r0, l2x0_regs_phys
> +       adr     r0, .Ll2x0_regs_phys
>         ldr     r0, [r0]
>         cmp     r0, #0
>         beq     skip_l2_resume
> @@ -79,6 +79,8 @@ skip_l2_resume:
>         b       cpu_resume
>  ENDPROC(exynos_cpu_resume)
>  #ifdef CONFIG_CACHE_L2X0
> +
> +.Ll2x0_regs_phys:
>         .globl l2x0_regs_phys
>  l2x0_regs_phys:
>         .long   0
> --
> 1.7.9.5
>
