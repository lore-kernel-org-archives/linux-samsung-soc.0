From: Hoegeun Kwon <hoegeun.kwon@samsung.com>
Subject: Re: [PATCH v2 4/9] drm/exynos: gsc: Convert driver to IPP v2 core
 API
Date: Tue, 10 Oct 2017 18:27:04 +0900
Message-ID: <9dbd0353-9498-6cb3-8eaa-e48f58df97a8@samsung.com>
References: <1506670374-15689-1-git-send-email-m.szyprowski@samsung.com>
        <CGME20170929073302eucas1p2d226821ba5fb164f770616868a3e50a4@eucas1p2.samsung.com>
        <1506670374-15689-5-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:62853 "EHLO
        mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751398AbdJJJ1G (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 10 Oct 2017 05:27:06 -0400
In-reply-to: <1506670374-15689-5-git-send-email-m.szyprowski@samsung.com>
Content-language: en-US
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>, dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org
Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, Tobias Jakobi <tjakobi@math.uni-bielefeld.de>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Andrzej Pietrasiewicz <andrzej.p@samsung.com>, Hoegeun Kwon <hoegeun.kwon@samsung.com>

Hi Marek,

On 09/29/2017 04:32 PM, Marek Szyprowski wrote:
> This patch adapts Exynos DRM rotator driver to new IPP v2 core API.
> The side effect of this conversion is a switch to driver component API
> to register properly in the Exynos DRM core.
>
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> Tested-by: Hoegeun Kwon <hoegeun.kwon@samsung.com>
> ---
>   drivers/gpu/drm/exynos/Kconfig          |   3 +-
>   drivers/gpu/drm/exynos/exynos_drm_drv.c |   1 +
>   drivers/gpu/drm/exynos/exynos_drm_gsc.c | 853 ++++++++------------------------
>   drivers/gpu/drm/exynos/exynos_drm_gsc.h |  24 -
>   4 files changed, 198 insertions(+), 683 deletions(-)
>   delete mode 100644 drivers/gpu/drm/exynos/exynos_drm_gsc.h
>

...

> +static int gsc_bind(struct device *dev, struct device *master, void *data)
> +{
> +	struct gsc_context *ctx = dev_get_drvdata(dev);
> +	struct drm_device *drm_dev = data;
> +	struct exynos_drm_ipp *ipp = &ctx->ipp;
> +
> +	ctx->drm_dev = drm_dev;
> +	drm_iommu_attach_device(drm_dev, dev);
> +
> +	exynos_drm_ipp_register(drm_dev, ipp, &ipp_funcs,
> +			   DRM_EXYNOS_IPP_CAP_CROP | DRM_EXYNOS_IPP_CAP_ROTATE |
> +			   DRM_EXYNOS_IPP_CAP_SCALE | DRM_EXYNOS_IPP_CAP_CONVERT,
> +			   gsc_formats, "gsc");
> +
> +	dev_info(dev, "The exynos gscaler is probed successfully\n");
> +
> +	return 0;
>   }
>   
> +static void gsc_unbind(struct device *dev, struct device *master,
> +			void *data)
> +{
> +	struct gsc_context *ctx = dev_get_drvdata(dev);

I think there is missing ipp_unregister() in unbind() of GSC and FIMC.

struct drm_device *drm_dev = data;
struct exynos_drm_ipp *ipp = &ctx->ipp;

exynos_drm_ipp_unregister(drm_dev, ipp);

Best regards,
Hoegeun

> +
> +	drm_iommu_detach_device(ctx->drm_dev, ctx->dev);
> +}
> +
> +static const struct component_ops gsc_component_ops = {
> +	.bind	= gsc_bind,
> +	.unbind = gsc_unbind,
> +};
> +
> +
>   static int gsc_probe(struct platform_device *pdev)
>   {
>   	struct device *dev = &pdev->dev;
>   	struct gsc_context *ctx;
>   	struct resource *res;
> -	struct exynos_drm_ippdrv *ippdrv;
>   	int ret;
>   
>   	ctx = devm_kzalloc(dev, sizeof(*ctx), GFP_KERNEL);
>   	if (!ctx)
>   		return -ENOMEM;
>   
> -	if (dev->of_node) {
> -		ctx->sysreg = syscon_regmap_lookup_by_phandle(dev->of_node,
> -							"samsung,sysreg");
> -		if (IS_ERR(ctx->sysreg)) {
> -			dev_warn(dev, "failed to get system register.\n");
> -			ctx->sysreg = NULL;
> -		}
> -	}
> +	ctx->dev = dev;
>   
>   	/* clock control */
>   	ctx->gsc_clk = devm_clk_get(dev, "gscl");
> @@ -1699,8 +1260,8 @@ static int gsc_probe(struct platform_device *pdev)
>   	}
>   
>   	ctx->irq = res->start;
> -	ret = devm_request_threaded_irq(dev, ctx->irq, NULL, gsc_irq_handler,
> -		IRQF_ONESHOT, "drm_gsc", ctx);
> +	ret = devm_request_irq(dev, ctx->irq, gsc_irq_handler, 0,
> +			       dev_name(dev), ctx);
>   	if (ret < 0) {
>   		dev_err(dev, "failed to request irq.\n");
>   		return ret;
> @@ -1709,38 +1270,19 @@ static int gsc_probe(struct platform_device *pdev)
>   	/* context initailization */
>   	ctx->id = pdev->id;
>   
> -	ippdrv = &ctx->ippdrv;
> -	ippdrv->dev = dev;
> -	ippdrv->ops[EXYNOS_DRM_OPS_SRC] = &gsc_src_ops;
> -	ippdrv->ops[EXYNOS_DRM_OPS_DST] = &gsc_dst_ops;
> -	ippdrv->check_property = gsc_ippdrv_check_property;
> -	ippdrv->reset = gsc_ippdrv_reset;
> -	ippdrv->start = gsc_ippdrv_start;
> -	ippdrv->stop = gsc_ippdrv_stop;
> -	ret = gsc_init_prop_list(ippdrv);
> -	if (ret < 0) {
> -		dev_err(dev, "failed to init property list.\n");
> -		return ret;
> -	}
> -
> -	DRM_DEBUG_KMS("id[%d]ippdrv[%pK]\n", ctx->id, ippdrv);
> -
> -	mutex_init(&ctx->lock);
>   	platform_set_drvdata(pdev, ctx);
>   
>   	pm_runtime_enable(dev);
>   
> -	ret = exynos_drm_ippdrv_register(ippdrv);
> -	if (ret < 0) {
> -		dev_err(dev, "failed to register drm gsc device.\n");
> -		goto err_ippdrv_register;
> -	}
> +	ret = component_add(dev, &gsc_component_ops);
> +	if (ret)
> +		goto err_pm_dis;
>   
>   	dev_info(dev, "drm gsc registered successfully.\n");
>   
>   	return 0;
>   
> -err_ippdrv_register:
> +err_pm_dis:
>   	pm_runtime_disable(dev);
>   	return ret;
>   }
> @@ -1748,11 +1290,6 @@ static int gsc_probe(struct platform_device *pdev)
>   static int gsc_remove(struct platform_device *pdev)
>   {
>   	struct device *dev = &pdev->dev;
> -	struct gsc_context *ctx = get_gsc_context(dev);
> -	struct exynos_drm_ippdrv *ippdrv = &ctx->ippdrv;
> -
> -	exynos_drm_ippdrv_unregister(ippdrv);
> -	mutex_destroy(&ctx->lock);
>   
>   	pm_runtime_set_suspended(dev);
>   	pm_runtime_disable(dev);
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_gsc.h b/drivers/gpu/drm/exynos/exynos_drm_gsc.h
> deleted file mode 100644
> index 29ec1c5efcf2..000000000000
> --- a/drivers/gpu/drm/exynos/exynos_drm_gsc.h
> +++ /dev/null
> @@ -1,24 +0,0 @@
> -/*
> - * Copyright (c) 2012 Samsung Electronics Co., Ltd.
> - *
> - * Authors:
> - *	Eunchul Kim <chulspro.kim@samsung.com>
> - *	Jinyoung Jeon <jy0.jeon@samsung.com>
> - *	Sangmin Lee <lsmin.lee@samsung.com>
> - *
> - * This program is free software; you can redistribute  it and/or modify it
> - * under  the terms of  the GNU General  Public License as published by the
> - * Free Software Foundation;  either version 2 of the  License, or (at your
> - * option) any later version.
> - */
> -
> -#ifndef _EXYNOS_DRM_GSC_H_
> -#define _EXYNOS_DRM_GSC_H_
> -
> -/*
> - * TODO
> - * FIMD output interface notifier callback.
> - * Mixer output interface notifier callback.
> - */
> -
> -#endif /* _EXYNOS_DRM_GSC_H_ */
