From: Santosh Shukla <santosh.shukla@linaro.org>
Subject: Re: [PATCH v2] ARM: Exynos : Fix build error with thumb2
Date: Mon, 26 May 2014 21:23:30 +0530
Message-ID: <CA+iXiiM3NSArOuDsjOnH0oQUSn0=o7wjgj+H=MrY9eBcp5AmqQ@mail.gmail.com>
References: <1401118187-10844-1-git-send-email-santosh.shukla@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wi0-f172.google.com ([209.85.212.172]:65195 "EHLO
	mail-wi0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751778AbaEZPxd (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 26 May 2014 11:53:33 -0400
Received: by mail-wi0-f172.google.com with SMTP id hi2so194150wib.17
        for <linux-samsung-soc@vger.kernel.org>; Mon, 26 May 2014 08:53:31 -0700 (PDT)
In-Reply-To: <1401118187-10844-1-git-send-email-santosh.shukla@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Viresh Kumar <viresh.kumar@linaro.org>, "kgene.kim" <kgene.kim@samsung.com>, "thomas.abraham" <thomas.abraham@linaro.org>, "t.figa" <t.figa@samsung.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>
Cc: linaro-kernel <linaro-kernel@lists.linaro.org>, santosh shukla <santosh.shukla@linaro.org>

Sorry for incorrect header version and even forgot to add correct list
in loop.. re-posting patch. Pl. ignore.

On 26 May 2014 20:59, Santosh Shukla <santosh.shukla@linaro.org> wrote:
> From: santosh shukla <santosh.shukla@linaro.org>
>
> add non-global symbol .LLl2x0_regs_phys to avoid build break in thumb2 mode.
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
> [1] : https://lkml.org/lkml/2010/3/31/235
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
