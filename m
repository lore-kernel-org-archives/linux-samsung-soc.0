From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [RFC PATCH 2/2] ARM: EXYNOS: Make sure that the Exynos5420 MDMA0
 clock is enabled during suspend
Date: Fri, 27 Mar 2015 15:36:00 +0100
Message-ID: <55156AD0.5070107@samsung.com>
References: <1427466097-7287-1-git-send-email-javier.martinez@collabora.co.uk>
 <1427466097-7287-3-git-send-email-javier.martinez@collabora.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:31350 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751802AbbC0OgO (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 27 Mar 2015 10:36:14 -0400
In-reply-to: <1427466097-7287-3-git-send-email-javier.martinez@collabora.co.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Cc: Kukjin Kim <kgene@kernel.org>, Doug Anderson <dianders@chromium.org>, Olof Johansson <olof@lixom.net>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Abhilash Kesavan <kesavan.abhilash@gmail.com>, Kevin Hilman <khilman@linaro.org>, Tyler Baker <tyler.baker@linaro.org>, Steve Capper <steve.capper@linaro.org>, Amit Kucheria <amit.kucheria@linaro.org>, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org

Hello Javier,

On 27/03/15 15:21, Javier Martinez Canillas wrote:
> Commit ae43b3289186 ("ARM: 8202/1: dmaengine: pl330: Add runtime Power
> Management support v12") added pm support for the pl330 dma driver but
> it makes the clock for the Exynos5420 MDMA0 DMA controller to be gated
> during suspend and this clock needs to remain enabled in order to make
> the system resume from a system suspend state.
> 
> To make sure that the clock is enabled during suspend, enable it prior
> to entering a suspend state and disable it once the system has resumed.
> 
> Thanks to Abhilash Kesavan for figuring out that this was the issue.
> 
> Fixes: ae43b32 ("ARM: 8202/1: dmaengine: pl330: Add runtime Power Management support v12")
> Signed-off-by: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
> ---
>  arch/arm/mach-exynos/suspend.c | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
> 
> diff --git a/arch/arm/mach-exynos/suspend.c b/arch/arm/mach-exynos/suspend.c
> index 1521eaf99265..6dbc0a6d1bb5 100644
> --- a/arch/arm/mach-exynos/suspend.c
> +++ b/arch/arm/mach-exynos/suspend.c
> @@ -16,6 +16,7 @@
>  #include <linux/init.h>
>  #include <linux/suspend.h>
>  #include <linux/syscore_ops.h>
> +#include <linux/clk.h>
>  #include <linux/cpu_pm.h>
>  #include <linux/io.h>
>  #include <linux/irq.h>
> @@ -79,6 +80,7 @@ static const struct exynos_pm_data *pm_data;
>  
>  static int exynos5420_cpu_state;
>  static unsigned int exynos_pmu_spare3;
> +static struct clk *clk;
>  
>  /*
>   * GIC wake-up support
> @@ -374,6 +376,16 @@ static void exynos5420_pm_prepare(void)
>  {
>  	unsigned int tmp;
>  
> +	/*
> +	 * Exynos5420 requires the MDMA0 controller clock to be
> +	 * ungated on suspend in order to be resumed correctly.
> +	 */
> +	clk = clk_get(NULL, "mdma0");
> +	if (IS_ERR(clk))
> +		pr_warn("Failed to get mdma0 clk (%ld)\n", PTR_ERR(clk));

I suppose you want this clk_get() call in exynos_pm_init(), now there
is clk_put() missing and this will cause a memory leak.

> +	else
> +		clk_prepare_enable(clk);
> +
>  	/* Set wake-up mask registers */
>  	exynos_pm_set_wakeup_mask();
>  
> @@ -516,6 +528,9 @@ static void exynos5420_pm_resume(void)
>  {
>  	unsigned long tmp;
>  
> +	if (!IS_ERR_OR_NULL(clk))

This should be just IS_ERR().

> +		clk_disable_unprepare(clk);
> +
>  	/* Restore the CPU0 low power state register */
>  	tmp = pmu_raw_readl(EXYNOS5_ARM_CORE0_SYS_PWR_REG);
>  	pmu_raw_writel(tmp | S5P_CORE_LOCAL_PWR_EN,

--
Regards,
Sylwester
