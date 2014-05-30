From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [PATCH] ARM: EXYNOS: SWRESET is needed to boot secondary CPU
 on Exynos3250
Date: Fri, 30 May 2014 13:45:37 +0200
Message-ID: <53886F61.7070900@gmail.com>
References: <1400152691-29705-1-git-send-email-k.kozlowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-we0-f173.google.com ([74.125.82.173]:52408 "EHLO
	mail-we0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752074AbaE3Lp4 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 30 May 2014 07:45:56 -0400
In-Reply-To: <1400152691-29705-1-git-send-email-k.kozlowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>, Russell King <linux@arm.linux.org.uk>, Kukjin Kim <kgene.kim@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Kyungmin Park <kyungmin.park@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Tomasz Figa <t.figa@samsung.com>

Hi Krzysztof,

On 15.05.2014 13:18, Krzysztof Kozlowski wrote:
> Without software reset the secondary CPU does not power up and
> exynos_boot_secondary() ends with pen_release equal to 1. This can be
> observed in dmesg:
> 	CPU1: failed to come online
> 	Brought up 1 CPUs
> 	SMP: Total of 1 processors activated.
> 	CPU: All CPU(s) started in SVC mode.
> 
> When booting the secondary CPU on Exynos3250 execute also software
> reset for core 1.
> 
> Signed-off-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
> ---
>  arch/arm/mach-exynos/platsmp.c  | 22 ++++++++++++++++++++++
>  arch/arm/mach-exynos/regs-pmu.h |  3 +++
>  2 files changed, 25 insertions(+)
> 
> diff --git a/arch/arm/mach-exynos/platsmp.c b/arch/arm/mach-exynos/platsmp.c
> index 8b88eb2f077b..64ec5ca18f60 100644
> --- a/arch/arm/mach-exynos/platsmp.c
> +++ b/arch/arm/mach-exynos/platsmp.c
> @@ -76,6 +76,25 @@ static inline void __iomem *cpu_boot_reg(int cpu)
>  }
>  
>  /*
> + * Set wake up by local power mode and execute software reset for given core.
> + *
> + * Currently this is needed only when booting secondary CPU on Exynos3250.
> + */
> +static inline void exynos_core_restart(u32 core_id)

nit: AFAIK when not strictly necessary, it's preferable to let the
compiler decide to inline a function or not, instead of adding the
inline keyword.

> +{
> +	if (of_machine_is_compatible("samsung,exynos3250")) {

nit: This could be probably changed into

	if (!of_machine_is_compatible("samsung,exynos3250"))
		return;

Other than these two minor nitpicks the patch looks good, so if there is
no reason to resend, feel free to ignore them. Although I think it might
be necessary to rebase it on Kukjin's for-next.

Reviewed-by: Tomasz Figa <t.figa@samsung.com>

Best regards,
Tomasz
