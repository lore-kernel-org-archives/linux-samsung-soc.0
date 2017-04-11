From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v4 6/6] mfd: exynos-lpass: Add runtime PM support
Date: Tue, 11 Apr 2017 13:03:31 +0100
Message-ID: <20170411120331.ic7syfg3s4vtyay6@dell>
References: <1490256207-10061-1-git-send-email-m.szyprowski@samsung.com>
 <CGME20170323080350eucas1p273814a2f183f04f180f8f2a2a362b86e@eucas1p2.samsung.com>
 <1490256207-10061-7-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wr0-f177.google.com ([209.85.128.177]:35531 "EHLO
        mail-wr0-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754726AbdDKMDf (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 11 Apr 2017 08:03:35 -0400
Received: by mail-wr0-f177.google.com with SMTP id o21so139007444wrb.2
        for <linux-samsung-soc@vger.kernel.org>; Tue, 11 Apr 2017 05:03:34 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <1490256207-10061-7-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, Sylwester Nawrocki <s.nawrocki@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Tomasz Figa <tomasz.figa@gmail.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>

On Thu, 23 Mar 2017, Marek Szyprowski wrote:

> Convert exisitng lpass-suspend/resume callbacks into runtime PM callbacks.
> This way Exynos LPASS driver will be ready for use with power domains
> enabled. LPASS will be runtime resumed/suspended as a result of its child
> devices runtime PM transitions.
> 
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> Acked-by: Krzysztof Kozlowski <krzk@kernel.org>
> Acked-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
> Acked-for-MFD-by: Lee Jones <lee.jones@linaro.org>
> ---
>  drivers/mfd/exynos-lpass.c | 14 +++++++++++---
>  1 file changed, 11 insertions(+), 3 deletions(-)

Applied, thanks.

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
