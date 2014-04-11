From: Bartlomiej Zolnierkiewicz <b.zolnierkie-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH] iio: adc: exynos_adc: Control special clock of ADC to
 support Exynos3250 ADC
Date: Fri, 11 Apr 2014 11:41:41 +0200
Message-ID: <18632148.yOYlTYattA@amdc1032>
References: <1397181640-18513-1-git-send-email-cw00.choi@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7Bit
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <1397181640-18513-1-git-send-email-cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Chanwoo Choi <cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, ch.naveen-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Kyungmin Park <kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org


Hi,

On Friday, April 11, 2014 11:00:40 AM Chanwoo Choi wrote:
> This patch control special clock for ADC in Exynos series's FSYS block.

s/control/controls/

> If special clock of ADC is registerd on clock list of common clk framework,
> Exynos ADC drvier have to control this clock.

s/drvier/driver/

> Exynos3250/Exynos4/Exynos5 has 'adc' clock as following:
> - 'adc' clock: bus clock for ADC
> 
> Exynos3250 has additional 'sclk_tsadc' clock as following:
> - 'sclk_tsadc' clock: special clock for ADC which provide clock to internal ADC
> 
> Exynos 4210/4212/4412 and Exynos5250/5420 has not included 'sclk_tsadc' clock
> in FSYS_BLK. But, Exynos3250 based on Cortex-A7 has only included 'sclk_tsadc'
> clock in FSYS_BLK.
> 
> Cc: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> Cc: Kukjin Kim <kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> Cc: Naveen Krishna Chatradhi <ch.naveen-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> Cc: linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> Signed-off-by: Chanwoo Choi <cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> Signed-off-by: Kyungmin Park <kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> ---
>  drivers/iio/adc/exynos_adc.c | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/drivers/iio/adc/exynos_adc.c b/drivers/iio/adc/exynos_adc.c
> index d25b262..4cd1975 100644
> --- a/drivers/iio/adc/exynos_adc.c
> +++ b/drivers/iio/adc/exynos_adc.c
> @@ -88,6 +88,7 @@ struct exynos_adc {
>  	void __iomem		*regs;
>  	void __iomem		*enable_reg;
>  	struct clk		*clk;
> +	struct clk		*sclk;
>  	unsigned int		irq;
>  	struct regulator	*vdd;
>  
> @@ -308,6 +309,13 @@ static int exynos_adc_probe(struct platform_device *pdev)
>  		goto err_irq;
>  	}
>  
> +	info->sclk = devm_clk_get(&pdev->dev, "sclk_tsadc");
> +	if (IS_ERR(info->sclk)) {
> +		dev_warn(&pdev->dev, "failed getting sclk clock, err = %ld\n",
> +							PTR_ERR(info->sclk));
> +		info->sclk = NULL;
> +	}
> +
>  	info->vdd = devm_regulator_get(&pdev->dev, "vdd");
>  	if (IS_ERR(info->vdd)) {
>  		dev_err(&pdev->dev, "failed getting regulator, err = %ld\n",
> @@ -341,6 +349,7 @@ static int exynos_adc_probe(struct platform_device *pdev)
>  		goto err_iio_dev;
>  
>  	clk_prepare_enable(info->clk);
> +	clk_prepare_enable(info->sclk);
>  
>  	exynos_adc_hw_init(info);
>  
> @@ -357,6 +366,7 @@ err_of_populate:
>  				exynos_adc_remove_devices);
>  	regulator_disable(info->vdd);
>  	clk_disable_unprepare(info->clk);
> +	clk_disable_unprepare(info->sclk);

Please disable clocks in the reverse of order in which they were enabled.

>  err_iio_dev:
>  	iio_device_unregister(indio_dev);
>  err_irq:
> @@ -373,6 +383,7 @@ static int exynos_adc_remove(struct platform_device *pdev)
>  				exynos_adc_remove_devices);
>  	regulator_disable(info->vdd);
>  	clk_disable_unprepare(info->clk);
> +	clk_disable_unprepare(info->sclk);

ditto

>  	writel(0, info->enable_reg);
>  	iio_device_unregister(indio_dev);
>  	free_irq(info->irq, info);
> @@ -398,6 +409,7 @@ static int exynos_adc_suspend(struct device *dev)
>  	}
>  
>  	clk_disable_unprepare(info->clk);
> +	clk_disable_unprepare(info->sclk);

ditto

>  	writel(0, info->enable_reg);
>  	regulator_disable(info->vdd);
>  
> @@ -416,6 +428,7 @@ static int exynos_adc_resume(struct device *dev)
>  
>  	writel(1, info->enable_reg);
>  	clk_prepare_enable(info->clk);
> +	clk_prepare_enable(info->sclk);
>  
>  	exynos_adc_hw_init(info);

Best regards,
--
Bartlomiej Zolnierkiewicz
Samsung R&D Institute Poland
Samsung Electronics
