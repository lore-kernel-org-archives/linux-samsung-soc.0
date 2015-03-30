From: Chanwoo Choi <cw00.choi@samsung.com>
Subject: Re: [RFC PATCH 2/2] ARM: EXYNOS: Make sure that the Exynos5420 MDMA0
 clock is enabled during suspend
Date: Mon, 30 Mar 2015 11:04:07 +0900
Message-ID: <5518AF17.2060207@samsung.com>
References: <1427466097-7287-1-git-send-email-javier.martinez@collabora.co.uk>
 <1427466097-7287-3-git-send-email-javier.martinez@collabora.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <1427466097-7287-3-git-send-email-javier.martinez@collabora.co.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Cc: Kukjin Kim <kgene@kernel.org>, Doug Anderson <dianders@chromium.org>, Olof Johansson <olof@lixom.net>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Abhilash Kesavan <kesavan.abhilash@gmail.com>, Kevin Hilman <khilman@linaro.org>, Tyler Baker <tyler.baker@linaro.org>, Steve Capper <steve.capper@linaro.org>, Amit Kucheria <amit.kucheria@linaro.org>, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

Hi Javier,

On 03/27/2015 11:21 PM, Javier Martinez Canillas wrote:
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
> +	else
> +		clk_prepare_enable(clk);
> +

I faced on the similiar issue. If some clock was disabled,
Exynos SoC could not enter the suspend mode

But, I think it is not prpper method to resolve this issue.
about that that specific clock (e.g., mdma0) is handled in this dirver.
Also, ARM-64bit don't include any '../mach-exynos' directory.

IMHO, some clock issue have to be handled in SoC clk driver or others.

[snip]

Best Regards,
Chanwoo Choi
