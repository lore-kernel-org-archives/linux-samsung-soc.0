From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH v2] drm/exynos: clear channels only when iommu is enabled
Date: Fri, 31 Jul 2015 09:32:43 +0900
Message-ID: <55BAC22B.4090605@samsung.com>
References: <1438073462-32560-1-git-send-email-jy0922.shim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:37659 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751013AbbGaAcn (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 30 Jul 2015 20:32:43 -0400
Received: from eucpsbgm2.samsung.com (unknown [203.254.199.245])
 by mailout4.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0NSB0063KTIH0LB0@mailout4.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 31 Jul 2015 01:32:41 +0100 (BST)
In-reply-to: <1438073462-32560-1-git-send-email-jy0922.shim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Joonyoung Shim <jy0922.shim@samsung.com>, dri-devel@lists.freedesktop.org
Cc: inki.dae@samsung.com, sw0312.kim@samsung.com, m.szyprowski@samsung.com, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>

On 28.07.2015 17:51, Joonyoung Shim wrote:
> This is simplest solution about reported problem[1]. It's no problem to
> clear channel only when iommu is enabled, if we consider that we cannot
> recognize iommu errors when iommu is disabled and it have been valid
> until now. But this cannot be nice solution.
> 
> [1] https://lkml.org/lkml/2015/7/21/404
> 
> Reported-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
> Signed-off-by: Joonyoung Shim <jy0922.shim@samsung.com>

I tested this patch on my Odroid XU3-Lite with hardkernel u-boot and it
fixes the booting hang. Thanks!

The test was not thorough - only booting and without any display output
(HDMI).

Best regards,
Krzysztof


> ---
> v2: add Reported-by.
> 
>  drivers/gpu/drm/exynos/exynos_drm_fimd.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_fimd.c b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
> index 8d362b9..337af02 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_fimd.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
> @@ -956,7 +956,8 @@ static int fimd_bind(struct device *dev, struct device *master, void *data)
>  	if (ctx->display)
>  		exynos_drm_create_enc_conn(drm_dev, ctx->display);
>  
> -	fimd_clear_channels(ctx->crtc);
> +	if (is_drm_iommu_supported(drm_dev))
> +		fimd_clear_channels(ctx->crtc);
>  
>  	ret = drm_iommu_attach_device(drm_dev, dev);
>  	if (ret)
> 
