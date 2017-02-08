From: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 8/8] mfd: exynos-lpass: Add runtime PM support
Date: Wed, 8 Feb 2017 10:58:35 +0000
Message-ID: <20170208105835.sin35b3ayzgxlpgf@dell>
References: <1485419634-28331-1-git-send-email-m.szyprowski@samsung.com>
 <CGME20170126083406eucas1p20148fa4f3ca70d333400c806dd490aef@eucas1p2.samsung.com>
 <1485419634-28331-9-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1485419634-28331-9-git-send-email-m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Marek Szyprowski <m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Sylwester Nawrocki <s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Krzysztof Kozlowski <krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Tomasz Figa <tomasz.figa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

On Thu, 26 Jan 2017, Marek Szyprowski wrote:

> Convert exisitng lpass-suspend/resume callbacks into runtime PM callbacks.
> This way Exynos LPASS driver will be ready for use with power domains
> enabled. LPASS will be runtime resumed/suspended as a result of its child
> devices runtime PM transitions.
> 
> Signed-off-by: Marek Szyprowski <m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> Acked-by: Krzysztof Kozlowski <krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> ---
>  drivers/mfd/exynos-lpass.c | 14 +++++++++++---
>  1 file changed, 11 insertions(+), 3 deletions(-)

For my own reference:
  Acked-for-MFD-by: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
  
> diff --git a/drivers/mfd/exynos-lpass.c b/drivers/mfd/exynos-lpass.c
> index 9dbbedad916f..6d735e22acda 100644
> --- a/drivers/mfd/exynos-lpass.c
> +++ b/drivers/mfd/exynos-lpass.c
> @@ -22,6 +22,7 @@
>  #include <linux/of.h>
>  #include <linux/of_platform.h>
>  #include <linux/platform_device.h>
> +#include <linux/pm_runtime.h>
>  #include <linux/regmap.h>
>  #include <linux/types.h>
>  
> @@ -132,6 +133,8 @@ static int exynos_lpass_probe(struct platform_device *pdev)
>  	}
>  
>  	platform_set_drvdata(pdev, lpass);
> +	pm_runtime_set_active(dev);
> +	pm_runtime_enable(dev);
>  	exynos_lpass_enable(lpass);
>  
>  	return of_platform_populate(dev->of_node, NULL, NULL, dev);
> @@ -141,7 +144,9 @@ static int exynos_lpass_remove(struct platform_device *pdev)
>  {
>  	struct exynos_lpass *lpass = platform_get_drvdata(pdev);
>  
> -	exynos_lpass_disable(lpass);
> +	pm_runtime_disable(&pdev->dev);
> +	if (!pm_runtime_status_suspended(&pdev->dev))
> +		exynos_lpass_disable(lpass);
>  	regmap_exit(lpass->top);
>  
>  	return 0;
> @@ -165,8 +170,11 @@ static int __maybe_unused exynos_lpass_resume(struct device *dev)
>  	return 0;
>  }
>  
> -static SIMPLE_DEV_PM_OPS(lpass_pm_ops, exynos_lpass_suspend,
> -					exynos_lpass_resume);
> +static const struct dev_pm_ops lpass_pm_ops = {
> +	SET_RUNTIME_PM_OPS(exynos_lpass_suspend, exynos_lpass_resume, NULL)
> +	SET_LATE_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
> +				     pm_runtime_force_resume)
> +};
>  
>  static const struct of_device_id exynos_lpass_of_match[] = {
>  	{ .compatible = "samsung,exynos5433-lpass" },

-- 
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
