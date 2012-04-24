From: Kukjin Kim <kgene.kim@samsung.com>
Subject: Re: [PATCH] ARM: EXYNOS: Fix compilation error when CONFIG_OF is
 not defined
Date: Tue, 24 Apr 2012 16:54:04 -0700
Message-ID: <4F973D1C.50402@samsung.com>
References: <1335247608-28518-1-git-send-email-tushar.behera@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=EUC-KR
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pz0-f51.google.com ([209.85.210.51]:46261 "EHLO
	mail-pz0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758642Ab2DXXyI (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 24 Apr 2012 19:54:08 -0400
Received: by dadz8 with SMTP id z8so1552713dad.10
        for <linux-samsung-soc@vger.kernel.org>; Tue, 24 Apr 2012 16:54:08 -0700 (PDT)
In-Reply-To: <1335247608-28518-1-git-send-email-tushar.behera@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tushar Behera <tushar.behera@linaro.org>
Cc: linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, patches@linaro.org, Thomas Abraham <thomas.abraham@linaro.org>

Tushar Behera wrote:
> Fixed following compile time error.
> arch/arm/mach-exynos/common.c: In function 'exynos5_init_irq':
> arch/arm/mach-exynos/common.c:539:2: error: implicit declaration of function 'of_irq_init'
> arch/arm/mach-exynos/common.c:539:14: error: 'exynos4_dt_irq_match' undeclared (first use in this function)
> arch/arm/mach-exynos/common.c:539:14: note: each undeclared identifier is reported only once for each function it appears in
> 
> CC: Thomas Abraham<thomas.abraham@linaro.org>
> Signed-off-by: Tushar Behera<tushar.behera@linaro.org>
> ---
>   arch/arm/mach-exynos/common.c |    2 ++
>   1 files changed, 2 insertions(+), 0 deletions(-)
> 
> diff --git a/arch/arm/mach-exynos/common.c b/arch/arm/mach-exynos/common.c
> index 1396c06..42de625 100644
> --- a/arch/arm/mach-exynos/common.c
> +++ b/arch/arm/mach-exynos/common.c
> @@ -536,7 +536,9 @@ void __init exynos5_init_irq(void)
>   {
>   	int irq;
> 
> +#ifdef CONFIG_OF
>   	of_irq_init(exynos4_dt_irq_match);
> +#endif
> 
>   	for (irq = 0; irq<  EXYNOS5_MAX_COMBINER_NR; irq++) {
>   		combiner_init(irq, (void __iomem *)S5P_VA_COMBINER(irq),

Yes, right. Now, we need this for exynos4 and exynos5 in mach-exynos.
Will apply, thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
