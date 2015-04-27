From: Joonyoung Shim <jy0922.shim@samsung.com>
Subject: Re: [PATCH v2 2/2] drm/exynos: cleanup exynos_drm_plane
Date: Mon, 27 Apr 2015 15:58:06 +0900
Message-ID: <553DDDFE.3080909@samsung.com>
References: <1429985214-4651-1-git-send-email-tjakobi@math.uni-bielefeld.de>
 <1429985214-4651-2-git-send-email-tjakobi@math.uni-bielefeld.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:58030 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932074AbbD0G56 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 27 Apr 2015 02:57:58 -0400
Received: from epcpsbgr2.samsung.com
 (u142.gpu120.samsung.co.kr [203.254.230.142])
 by mailout1.samsung.com (Oracle Communications Messaging Server 7.0.5.31.0
 64bit (built May  5 2014))
 with ESMTP id <0NNG00ATGE0K37B0@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 27 Apr 2015 15:57:56 +0900 (KST)
In-reply-to: <1429985214-4651-2-git-send-email-tjakobi@math.uni-bielefeld.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>, linux-samsung-soc@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, gustavo.padovan@collabora.co.uk, inki.dae@samsung.com

Hi Tobias,

On 04/26/2015 03:06 AM, Tobias Jakobi wrote:
> Remove the unused fields of struct exynos_drm_plane.
> 
> v2: Remove index_color as well, also unused (thanks Joonyoung).
> 
> Reviewed-by: Gustavo Padovan <gustavo.padovan@collabora.co.uk>
> Signed-off-by: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
> ---
>  drivers/gpu/drm/exynos/exynos_drm_drv.h | 13 -------------
>  1 file changed, 13 deletions(-)
> 
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_drv.h b/drivers/gpu/drm/exynos/exynos_drm_drv.h
> index e12ecb5..b1014c6 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_drv.h
> +++ b/drivers/gpu/drm/exynos/exynos_drm_drv.h
> @@ -71,13 +71,6 @@ enum exynos_drm_output_type {
>   * @dma_addr: array of bus(accessed by dma) address to the memory region
>   *	      allocated for a overlay.
>   * @zpos: order of overlay layer(z position).
> - * @index_color: if using color key feature then this value would be used
> - *			as index color.
> - * @default_win: a window to be enabled.
> - * @color_key: color key on or off.
> - * @local_path: in case of lcd type, local path mode on or off.
> - * @transparency: transparency on or off.
> - * @activated: activated or not.
>   * @enabled: enabled or not.
>   * @resume: to resume or not.
>   *
> @@ -108,13 +101,7 @@ struct exynos_drm_plane {
>  	uint32_t pixel_format;
>  	dma_addr_t dma_addr[MAX_FB_BUFFER];
>  	unsigned int zpos;
> -	unsigned int index_color;
>  
> -	bool default_win:1;
> -	bool color_key:1;
> -	bool local_path:1;
> -	bool transparency:1;
> -	bool activated:1;
>  	bool enabled:1;
>  	bool resume:1;
>  };
> 

Acked-by: Joonyoung Shim <jy0922.shim@samsung.com>

Thanks.
