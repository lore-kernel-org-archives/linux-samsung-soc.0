From: Florian Tobias Schandinat <FlorianSchandinat@gmx.de>
Subject: Re: [PATCH] video: exynos_dp: use clk_prepare_enable and clk_disable_unprepare
Date: Wed, 10 Oct 2012 12:35:12 +0000
Message-ID: <50756B80.7080306@gmx.de>
References: <006701cda1fb$cee12fe0$6ca38fa0$%han@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout-de.gmx.net ([213.165.64.23]:35510 "HELO
	mailout-de.gmx.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with SMTP id S1755724Ab2JJMfZ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 10 Oct 2012 08:35:25 -0400
In-Reply-To: <006701cda1fb$cee12fe0$6ca38fa0$%han@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Jingoo Han <jg1.han@samsung.com>
Cc: linux-fbdev@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 'Thomas Abraham' <thomas.abraham@linaro.org>

On 10/04/2012 06:45 AM, Jingoo Han wrote:
> Convert clk_enable/clk_disable to clk_prepare_enable/clk_disable_unprepare
> calls as required by common clock framework.
> 
> Signed-off-by: Jingoo Han <jg1.han@samsung.com>

Applied.


Thanks,

Florian Tobias Schandinat


> ---
>  drivers/video/exynos/exynos_dp_core.c |    8 ++++----
>  1 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/video/exynos/exynos_dp_core.c b/drivers/video/exynos/exynos_dp_core.c
> index cdc1398..d55470e 100644
> --- a/drivers/video/exynos/exynos_dp_core.c
> +++ b/drivers/video/exynos/exynos_dp_core.c
> @@ -885,7 +885,7 @@ static int __devinit exynos_dp_probe(struct platform_device *pdev)
>  		return PTR_ERR(dp->clock);
>  	}
>  
> -	clk_enable(dp->clock);
> +	clk_prepare_enable(dp->clock);
>  
>  	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
>  
> @@ -956,7 +956,7 @@ static int __devexit exynos_dp_remove(struct platform_device *pdev)
>  	if (pdata && pdata->phy_exit)
>  		pdata->phy_exit();
>  
> -	clk_disable(dp->clock);
> +	clk_disable_unprepare(dp->clock);
>  
>  	return 0;
>  }
> @@ -971,7 +971,7 @@ static int exynos_dp_suspend(struct device *dev)
>  	if (pdata && pdata->phy_exit)
>  		pdata->phy_exit();
>  
> -	clk_disable(dp->clock);
> +	clk_disable_unprepare(dp->clock);
>  
>  	return 0;
>  }
> @@ -985,7 +985,7 @@ static int exynos_dp_resume(struct device *dev)
>  	if (pdata && pdata->phy_init)
>  		pdata->phy_init();
>  
> -	clk_enable(dp->clock);
> +	clk_prepare_enable(dp->clock);
>  
>  	exynos_dp_init_dp(dp);
>  
