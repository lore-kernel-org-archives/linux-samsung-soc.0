From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: Re: [PATCH] drm/exynos/fimc: fix runtime pm support
Date: Thu, 06 Aug 2015 12:13:31 +0200
Message-ID: <55C3334B.9060907@samsung.com>
References: <1428569160-20628-1-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:39735 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932155AbbHFKNf (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 6 Aug 2015 06:13:35 -0400
Received: from eucpsbgm2.samsung.com (unknown [203.254.199.245])
 by mailout1.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0NSN003NBOEK6Z90@mailout1.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 06 Aug 2015 11:13:32 +0100 (BST)
In-reply-to: <1428569160-20628-1-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, Andrzej Hajda <a.hajda@samsung.com>, Inki Dae <inki.dae@samsung.com>, jy0922.shim@samsung.com

Hello,

On 2015-04-09 10:46, Marek Szyprowski wrote:
> Once pm_runtime_set_active() gets called, the kernel assumes that given
> device has already enabled runtime pm and will call pm_runtime_suspend()
> without matching pm_runtime_resume(). In case of DRM FIMC IPP driver,
> this will result in calling clk_disable() without respective call to
> clk_enable(). This patch removes call to pm_runtime_set_active() to
> ensure that pm_runtime_suspend/resume calls will match.
>
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>

Gentle ping...

> ---
>   drivers/gpu/drm/exynos/exynos_drm_fimc.c | 1 -
>   1 file changed, 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_fimc.c b/drivers/gpu/drm/exynos/exynos_drm_fimc.c
> index 842d6b8dc3c4..2a652359af64 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_fimc.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_fimc.c
> @@ -1745,7 +1745,6 @@ static int fimc_probe(struct platform_device *pdev)
>   	spin_lock_init(&ctx->lock);
>   	platform_set_drvdata(pdev, ctx);
>   
> -	pm_runtime_set_active(dev);
>   	pm_runtime_enable(dev);
>   
>   	ret = exynos_drm_ippdrv_register(ippdrv);

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland
