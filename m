From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH 02/10] drm/exynos: ipp: fix incorrect format specifiers in
 debug messages
Date: Thu, 04 Feb 2016 11:17:32 +0900
Message-ID: <56B2B4BC.1040708@samsung.com>
References: <1454503374-16382-1-git-send-email-m.szyprowski@samsung.com>
 <1454503374-16382-3-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:58876 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755275AbcBDCRe (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 3 Feb 2016 21:17:34 -0500
Received: from eucpsbgm2.samsung.com (unknown [203.254.199.245])
 by mailout4.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0O2000L9E3P7JZ60@mailout4.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 04 Feb 2016 02:17:31 +0000 (GMT)
In-reply-to: <1454503374-16382-3-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>, dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org
Cc: Inki Dae <inki.dae@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Andrzej Hajda <a.hajda@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>

On 03.02.2016 21:42, Marek Szyprowski wrote:
> Drivers should use %p for printing pointers instead of hardcoding them
> as hexadecimal integers. This patch fixes compilation warnings on 64bit
> architectures.
> 
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
>  drivers/gpu/drm/exynos/exynos_drm_fimc.c    |  2 +-
>  drivers/gpu/drm/exynos/exynos_drm_gsc.c     |  2 +-
>  drivers/gpu/drm/exynos/exynos_drm_ipp.c     | 32 ++++++++++++++---------------
>  drivers/gpu/drm/exynos/exynos_drm_rotator.c |  2 +-
>  4 files changed, 19 insertions(+), 19 deletions(-)
> 
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_fimc.c b/drivers/gpu/drm/exynos/exynos_drm_fimc.c
> index c747824..8a4f4a0 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_fimc.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_fimc.c
> @@ -1723,7 +1723,7 @@ static int fimc_probe(struct platform_device *pdev)
>  		goto err_put_clk;
>  	}
>  
> -	DRM_DEBUG_KMS("id[%d]ippdrv[0x%x]\n", ctx->id, (int)ippdrv);
> +	DRM_DEBUG_KMS("id[%d]ippdrv[%p]\n", ctx->id, ippdrv);

I don't oppose the patch itself but I have different concern. First -
probably you meant %pK because this is a writeable structure with
function pointers.
Second - why the ippdrv has to be printed? Is it useful for debugging?

Best regards,
Krzysztof
