From: Chanwoo Choi <cw00.choi@samsung.com>
Subject: Re: [PATCH] drm: exynos: Add runtime PM support to MIC driver
Date: Wed, 11 Jan 2017 10:39:42 +0900
Message-ID: <58758CDE.50300@samsung.com>
References: <CGME20170110125756eucas1p1d9fe25f1ca7e0e982abaf2d71a607f0d@eucas1p1.samsung.com>
 <1484053067-31665-1-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:43605 "EHLO
        mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753361AbdAKBjq (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 10 Jan 2017 20:39:46 -0500
Received: from epcas1p1.samsung.com (unknown [182.195.41.45])
 by mailout3.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0OJL02TPGDY8EO30@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 11 Jan 2017 10:39:44 +0900 (KST)
In-reply-to: <1484053067-31665-1-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>, dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org
Cc: Inki Dae <inki.dae@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Andrzej Hajda <a.hajda@samsung.com>

Hi Marek,

On 2017년 01월 10일 21:57, Marek Szyprowski wrote:
> This patch adds pm_runtime_get/put calls to notify device core when MIC
> device is really in use. This is needed to let power domain with this
> device to be turned off when display is turned off.
> 
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
>  drivers/gpu/drm/exynos/exynos_drm_mic.c | 17 ++++++++++++++++-
>  1 file changed, 16 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_mic.c b/drivers/gpu/drm/exynos/exynos_drm_mic.c
> index a0def0be6d65..f643c380cb9a 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_mic.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_mic.c
> @@ -19,6 +19,7 @@
>  #include <linux/of_graph.h>
>  #include <linux/clk.h>
>  #include <linux/component.h>
> +#include <linux/pm_runtime.h>
>  #include <drm/drmP.h>
>  #include <linux/mfd/syscon.h>
>  #include <linux/regmap.h>
> @@ -323,6 +324,7 @@ static void mic_post_disable(struct drm_bridge *bridge)
>  	for (i = NUM_CLKS - 1; i > -1; i--)
>  		clk_disable_unprepare(mic->clks[i]);
>  
> +	pm_runtime_put(mic->dev);
>  	mic->enabled = 0;

It is minor comment.

How about calling the pm_runtime_put() after 'mic->enabled = 0'?
I think that you better to call the runtime_pm funtcion after completing
the handle of data of mic device driver. Because this patch just notifies
the status.

>  
>  already_disabled:
> @@ -338,6 +340,8 @@ static void mic_pre_enable(struct drm_bridge *bridge)
>  	if (mic->enabled)
>  		goto already_enabled;
>  
> +	pm_runtime_get_sync(mic->dev);
> +
>  	for (i = 0; i < NUM_CLKS; i++) {
>  		ret = clk_prepare_enable(mic->clks[i]);
>  		if (ret < 0) {
> @@ -473,8 +477,18 @@ static int exynos_mic_probe(struct platform_device *pdev)
>  
>  	platform_set_drvdata(pdev, mic);
>  
> +	pm_runtime_enable(dev);
> +
> +	ret = component_add(dev, &exynos_mic_component_ops);
> +	if (ret)
> +		goto err_pm;
> +
>  	DRM_DEBUG_KMS("MIC has been probed\n");
> -	return component_add(dev, &exynos_mic_component_ops);
> +
> +	return 0;
> +
> +err_pm:
> +	pm_runtime_disable(dev);
>  
>  err:
>  	return ret;
> @@ -483,6 +497,7 @@ static int exynos_mic_probe(struct platform_device *pdev)
>  static int exynos_mic_remove(struct platform_device *pdev)
>  {
>  	component_del(&pdev->dev, &exynos_mic_component_ops);
> +	pm_runtime_disable(&pdev->dev);
>  	return 0;
>  }
>  
> 

If this patch just notifies the status(enabled or disabled)
of mic device with pm runtime interface, looks good to me.

Reviewed-by: Chanwoo Choi <cw00.choi@samsung.com>

-- 
Best Regards,
Chanwoo Choi
S/W Center, Samsung Electronics
