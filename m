From: Kukjin Kim <kgene.kim@samsung.com>
Subject: Re: [PATCH 3/4] ARM: Exynos5: Fix incorrect initialization of GIC
Date: Wed, 28 Mar 2012 18:46:09 -0700
Message-ID: <4F73BEE1.5050301@samsung.com>
References: <1332840365-24827-1-git-send-email-thomas.abraham@linaro.org> <1332840365-24827-4-git-send-email-thomas.abraham@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=EUC-KR
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pb0-f46.google.com ([209.85.160.46]:45164 "EHLO
	mail-pb0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756083Ab2C2BqM (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 28 Mar 2012 21:46:12 -0400
Received: by pbcun15 with SMTP id un15so2616516pbc.19
        for <linux-samsung-soc@vger.kernel.org>; Wed, 28 Mar 2012 18:46:12 -0700 (PDT)
In-Reply-To: <1332840365-24827-4-git-send-email-thomas.abraham@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Thomas Abraham <thomas.abraham@linaro.org>
Cc: linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, linux-arm-kernel@lists.infradead.org

Thomas Abraham wrote:
> Use the of_irq_init() call to setup the gic which also properly registers
> the gic device node pointer with gic irq domain, without which all interrupt
> specifier translations for gic fail.
> 
> Signed-off-by: Thomas Abraham<thomas.ab@samsung.com>
> ---
>   arch/arm/mach-exynos/common.c |    2 +-
>   1 files changed, 1 insertions(+), 1 deletions(-)
> 
> diff --git a/arch/arm/mach-exynos/common.c b/arch/arm/mach-exynos/common.c
> index f265dc4..3bf39a8 100644
> --- a/arch/arm/mach-exynos/common.c
> +++ b/arch/arm/mach-exynos/common.c
> @@ -542,7 +542,7 @@ void __init exynos5_init_irq(void)
>   {
>   	int irq;
> 
> -	gic_init(0, IRQ_PPI(0), S5P_VA_GIC_DIST, S5P_VA_GIC_CPU);
> +	of_irq_init(exynos4_dt_irq_match);
> 
>   	for (irq = 0; irq<  EXYNOS5_MAX_COMBINER_NR; irq++) {
>   		combiner_init(irq, (void __iomem *)S5P_VA_COMBINER(irq),

Yes, right. The of_irq_init() shold be used instead. But I need to check
about the usage of SPI and if any updates, let you know :)

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
