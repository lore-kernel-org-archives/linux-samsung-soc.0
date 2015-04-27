From: Joonyoung Shim <jy0922.shim@samsung.com>
Subject: Re: [PATCH 2/2] drm/exynos: mixer: remove buffer count handling in
 vp_video_buffer()
Date: Mon, 27 Apr 2015 16:24:59 +0900
Message-ID: <553DE44B.2090605@samsung.com>
References: <1429993914-2708-1-git-send-email-tjakobi@math.uni-bielefeld.de>
 <1429993914-2708-2-git-send-email-tjakobi@math.uni-bielefeld.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:58979 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752722AbbD0HYv (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 27 Apr 2015 03:24:51 -0400
Received: from epcpsbgr4.samsung.com
 (u144.gpu120.samsung.co.kr [203.254.230.144])
 by mailout3.samsung.com (Oracle Communications Messaging Server 7.0.5.31.0
 64bit (built May  5 2014))
 with ESMTP id <0NNG00M5BF9DX140@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 27 Apr 2015 16:24:49 +0900 (KST)
In-reply-to: <1429993914-2708-2-git-send-email-tjakobi@math.uni-bielefeld.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>, linux-samsung-soc@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, gustavo.padovan@collabora.co.uk, inki.dae@samsung.com

Hi Tobias,

On 04/26/2015 05:31 AM, Tobias Jakobi wrote:
> The video processor (VP) supports four formats: NV12, NV21 and its
> tiled variants. All these formats are bi-planar, so the buffer
> count in vp_video_buffer() is always 2.
> 
> While we're at it, also add support for NV21 and properly exit
> if we're called with an invalid (non-VP) pixelformat.
> 
> Signed-off-by: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
> ---
>  drivers/gpu/drm/exynos/exynos_mixer.c | 20 +++++---------------
>  1 file changed, 5 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/gpu/drm/exynos/exynos_mixer.c b/drivers/gpu/drm/exynos/exynos_mixer.c
> index 534a594..6fb4faa 100644
> --- a/drivers/gpu/drm/exynos/exynos_mixer.c
> +++ b/drivers/gpu/drm/exynos/exynos_mixer.c
> @@ -388,7 +388,6 @@ static void vp_video_buffer(struct mixer_context *ctx, int win)
>  	struct mixer_resources *res = &ctx->mixer_res;
>  	unsigned long flags;
>  	struct exynos_drm_plane *plane;
> -	unsigned int buf_num = 1;
>  	dma_addr_t luma_addr[2], chroma_addr[2];
>  	bool tiled_mode = false;
>  	bool crcb_mode = false;
> @@ -399,27 +398,18 @@ static void vp_video_buffer(struct mixer_context *ctx, int win)
>  	switch (plane->pixel_format) {
>  	case DRM_FORMAT_NV12:
>  		crcb_mode = false;
> -		buf_num = 2;
>  		break;
> -	/* TODO: single buffer format NV12, NV21 */
> +	case DRM_FORMAT_NV21:
> +		crcb_mode = true;
> +		break;

To support NV21, how about make to other patch? because this patch is to
fix buffer number.

>  	default:
> -		/* ignore pixel format at disable time */
> -		if (!plane->dma_addr[0])
> -			break;
> -
>  		DRM_ERROR("pixel format for vp is wrong [%d].\n",
>  				plane->pixel_format);
>  		return;
>  	}
>  
> -	if (buf_num == 2) {
> -		luma_addr[0] = plane->dma_addr[0];
> -		chroma_addr[0] = plane->dma_addr[1];
> -	} else {
> -		luma_addr[0] = plane->dma_addr[0];
> -		chroma_addr[0] = plane->dma_addr[0]
> -			+ (plane->pitch * plane->fb_height);
> -	}
> +	luma_addr[0] = plane->dma_addr[0];
> +	chroma_addr[0] = plane->dma_addr[1];

Hmm, dma_addr[0] and dma_addr[1] are same address if it uses just one
buffer for two planes, then need offset information of each plane.

Thanks.

>  
>  	if (plane->scan_flag & DRM_MODE_FLAG_INTERLACE) {
>  		ctx->interlace = true;
> 
