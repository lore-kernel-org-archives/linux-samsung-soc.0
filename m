From: Chanwoo Choi <cw00.choi@samsung.com>
Subject: Re: [PATCH] ARM: exynos: Fix wake-up interrupts for Exynos3250
Date: Thu, 23 Apr 2015 09:24:41 +0900
Message-ID: <55383BC9.5010604@samsung.com>
References: <1429724452-26563-1-git-send-email-marc.zyngier@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:31962 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932737AbbDWAYo (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 22 Apr 2015 20:24:44 -0400
Received: from epcpsbgr2.samsung.com
 (u142.gpu120.samsung.co.kr [203.254.230.142])
 by mailout2.samsung.com (Oracle Communications Messaging Server 7.0.5.31.0
 64bit (built May  5 2014))
 with ESMTP id <0NN800KTDH56LU50@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 23 Apr 2015 09:24:42 +0900 (KST)
In-reply-to: <1429724452-26563-1-git-send-email-marc.zyngier@arm.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Marc Zyngier <marc.zyngier@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Kyungmin Park <kyungmin.park@samsung.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Kukjin Kim <kgene@kernel.org>

Hi Marc,

On 04/23/2015 02:40 AM, Marc Zyngier wrote:
> Commit 8b283c025443 (ARM: exynos4/5: convert pmu wakeup to
> stacked domains) changed the Exynos PMU code to use stacked
> domains. This has led to a number of interrupt numbers to be
> fixed.
> 
> In the meantime, support for Exynos 3250 was added, missing
> the required change to this platform. This amounts to revert
> ace283a04a4a (ARM: EXYNOS: Fix wrong hwirq of RTC interrupt
> for Exynos3250 SoC), as the initial patch was right, just a
> bit early...
> 
> Cc: Chanwoo Choi <cw00.choi@samsung.com>
> Cc: Kyungmin Park <kyungmin.park@samsung.com>
> Cc: Krzysztof Kozlowski <k.kozlowski@samsung.com>
> Cc: Kukjin Kim <kgene@kernel.org>
> Signed-off-by: Marc Zyngier <marc.zyngier@arm.com>
> ---
>  arch/arm/mach-exynos/suspend.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm/mach-exynos/suspend.c b/arch/arm/mach-exynos/suspend.c
> index 3e6aea7..40dce36 100644
> --- a/arch/arm/mach-exynos/suspend.c
> +++ b/arch/arm/mach-exynos/suspend.c
> @@ -87,8 +87,8 @@ static unsigned int exynos_pmu_spare3;
>  static u32 exynos_irqwake_intmask = 0xffffffff;
>  
>  static const struct exynos_wkup_irq exynos3250_wkup_irq[] = {
> -	{ 105, BIT(1) }, /* RTC alarm */
> -	{ 106, BIT(2) }, /* RTC tick */
> +	{ 73, BIT(1) }, /* RTC alarm */
> +	{ 74, BIT(2) }, /* RTC tick */
>  	{ /* sentinel */ },
>  };
>  
> 

Reviewed-by: Chanwoo Choi <cw00.choi@samsung.com>

Thanks,
Chanwoo Choi
