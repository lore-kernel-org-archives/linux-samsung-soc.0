From: Joonyoung Shim <jy0922.shim@samsung.com>
Subject: Re: [PATCH 15/15] drm/exynos/fimc: fix source buffer registers
Date: Tue, 26 Aug 2014 14:57:51 +0900
Message-ID: <53FC21DF.1010504@samsung.com>
References: <1408693946-15456-1-git-send-email-a.hajda@samsung.com>
 <1408693946-15456-16-git-send-email-a.hajda@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:37602 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751111AbaHZF5x (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 26 Aug 2014 01:57:53 -0400
In-reply-to: <1408693946-15456-16-git-send-email-a.hajda@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Andrzej Hajda <a.hajda@samsung.com>, Inki Dae <inki.dae@samsung.com>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, dri-devel@lists.freedesktop.org, open list <linux-kernel@vger.kernel.org>, "moderated list:ARM/S5P EXYNOS AR..." <linux-samsung-soc@vger.kernel.org>, Joonyoung Shim <jy0922.shim@samsung.com>

Hi Andrzej,

On 08/22/2014 04:52 PM, Andrzej Hajda wrote:
> FIMC in default mode of operation uses only one input buffer,
> but the driver used also second buffer, as a result only the
> first frame was processed correctly. The patch fixes it.

I can't understand well, then we don't need to distinguish buf_id in
fimc_src_set_addr()?

> 
> Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
> ---
>  drivers/gpu/drm/exynos/exynos_drm_fimc.c | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_fimc.c b/drivers/gpu/drm/exynos/exynos_drm_fimc.c
> index b20078e..e985253 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_fimc.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_fimc.c
> @@ -720,24 +720,24 @@ static int fimc_src_set_addr(struct device *dev,
>  	case IPP_BUF_ENQUEUE:
>  		config = &property->config[EXYNOS_DRM_OPS_SRC];
>  		fimc_write(ctx, buf_info->base[EXYNOS_DRM_PLANAR_Y],
> -			EXYNOS_CIIYSA(buf_id));
> +			EXYNOS_CIIYSA0);
>  
>  		if (config->fmt == DRM_FORMAT_YVU420) {
>  			fimc_write(ctx, buf_info->base[EXYNOS_DRM_PLANAR_CR],
> -				EXYNOS_CIICBSA(buf_id));
> +				EXYNOS_CIICBSA0);
>  			fimc_write(ctx, buf_info->base[EXYNOS_DRM_PLANAR_CB],
> -				EXYNOS_CIICRSA(buf_id));
> +				EXYNOS_CIICRSA0);
>  		} else {
>  			fimc_write(ctx, buf_info->base[EXYNOS_DRM_PLANAR_CB],
> -				EXYNOS_CIICBSA(buf_id));
> +				EXYNOS_CIICBSA0);
>  			fimc_write(ctx, buf_info->base[EXYNOS_DRM_PLANAR_CR],
> -				EXYNOS_CIICRSA(buf_id));
> +				EXYNOS_CIICRSA0);
>  		}
>  		break;
>  	case IPP_BUF_DEQUEUE:
> -		fimc_write(ctx, 0x0, EXYNOS_CIIYSA(buf_id));
> -		fimc_write(ctx, 0x0, EXYNOS_CIICBSA(buf_id));
> -		fimc_write(ctx, 0x0, EXYNOS_CIICRSA(buf_id));
> +		fimc_write(ctx, 0x0, EXYNOS_CIIYSA0);
> +		fimc_write(ctx, 0x0, EXYNOS_CIICBSA0);
> +		fimc_write(ctx, 0x0, EXYNOS_CIICRSA0);
>  		break;
>  	default:
>  		/* bypass */
> 
