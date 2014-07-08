From: Tomasz Figa <t.figa@samsung.com>
Subject: Re: [PATCH v6 2/4] ARM: EXYNOS: Refactored code for using PMU address
 via DT
Date: Tue, 08 Jul 2014 16:28:09 +0200
Message-ID: <53BBFFF9.5020306@samsung.com>
References: <1404710376-16448-1-git-send-email-pankaj.dubey@samsung.com>
 <1404710376-16448-3-git-send-email-pankaj.dubey@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:27413 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750707AbaGHO2n (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 8 Jul 2014 10:28:43 -0400
In-reply-to: <1404710376-16448-3-git-send-email-pankaj.dubey@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Pankaj Dubey <pankaj.dubey@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: kgene.kim@samsung.com, linux@arm.linux.org.uk, vikas.sajjan@samsung.com, joshi@samsung.com, naushad@samsung.com, thomas.ab@samsung.com, chow.kim@samsung.com

Hi Pankaj,

Except one minor comment inline, looks good.

On 07.07.2014 07:19, Pankaj Dubey wrote:

[snip]

> diff --git a/arch/arm/mach-exynos/mcpm-exynos.c b/arch/arm/mach-exynos/mcpm-exynos.c
> index 9315ba9..8f6a111 100644
> --- a/arch/arm/mach-exynos/mcpm-exynos.c
> +++ b/arch/arm/mach-exynos/mcpm-exynos.c
> @@ -55,7 +55,7 @@
>  	"dsb\n\t" \
>  	"ldmfd	sp!, {fp, ip}" \
>  	: \
> -	: "Ir" (S5P_INFORM0) \
> +	: "Ir" (pmu_base_addr + S5P_INFORM0) \
>  	: "r0", "r1", "r2", "r3", "r4", "r5", "r6", "r7", \
>  	  "r9", "r10", "lr", "memory")
>  
> @@ -337,7 +337,8 @@ static int __init exynos_mcpm_init(void)
>  	 * To increase the stability of KFC reset we need to program
>  	 * the PMU SPARE3 register
>  	 */
> -	__raw_writel(EXYNOS5420_SWRESET_KFC_SEL, S5P_PMU_SPARE3);
> +	__raw_writel(EXYNOS5420_SWRESET_KFC_SEL,
> +			pmu_base_addr + S5P_PMU_SPARE3);

Here's yet another place where pmu_raw_writel() helper could be used.
Maybe move them to a header, even common.h and then use whenever PMU is
accessed in arch code.

With this minor thing fixed, feel free to add

Reviewed-by: Tomasz Figa <t.figa@samsung.com>

--
Best regards,
Tomasz
