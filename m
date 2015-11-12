From: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
Subject: Re: [PATCH 18/25] drm/exynos: fimd: fix dma burst size setting for
 small plane size
Date: Thu, 12 Nov 2015 16:17:09 +0100
Message-ID: <5644AD75.6000103@math.uni-bielefeld.de>
References: <1447161821-1877-1-git-send-email-m.szyprowski@samsung.com>
 <1447161821-1877-19-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from smtp.math.uni-bielefeld.de ([129.70.45.10]:59154 "EHLO
	smtp.math.uni-bielefeld.de" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1754494AbbKLPRM (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 12 Nov 2015 10:17:12 -0500
In-Reply-To: <1447161821-1877-19-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>, dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org
Cc: Inki Dae <inki.dae@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Andrzej Hajda <a.hajda@samsung.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Gustavo Padovan <gustavo@padovan.org>, Javier Martinez Canillas <javier@osg.samsung.com>

This one looks a bit strange. It only changes the argument list of
fimd_win_set_pixfmt() but the commit message that it actually fixes
something.

The corresponding upstream commit:
https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/commit/?id=66367461e573321f0fbb0be0391165b5a54d5fe4

With best wishes,
Tobias


Marek Szyprowski wrote:
> This patch fixes trashed display of buffers cropped to very small width.
> Even if DMA is unstable and causes tearing when changing the burst size,
> it is still better than displaying a garbage.
> 
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
>  drivers/gpu/drm/exynos/exynos_drm_fimd.c | 24 +++++++++++-------------
>  1 file changed, 11 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_fimd.c b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
> index 44226b2b46c7..6c04ff6432d4 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_fimd.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
> @@ -487,7 +487,7 @@ static void fimd_commit(struct exynos_drm_crtc *crtc)
>  
>  
>  static void fimd_win_set_pixfmt(struct fimd_context *ctx, unsigned int win,
> -				struct drm_framebuffer *fb)
> +				uint32_t pixel_format, int width)
>  {
>  	unsigned long val;
>  
> @@ -498,11 +498,11 @@ static void fimd_win_set_pixfmt(struct fimd_context *ctx, unsigned int win,
>  	 * So the request format is ARGB8888 then change it to XRGB8888.
>  	 */
>  	if (ctx->driver_data->has_limited_fmt && !win) {
> -		if (fb->pixel_format == DRM_FORMAT_ARGB8888)
> -			fb->pixel_format = DRM_FORMAT_XRGB8888;
> +		if (pixel_format == DRM_FORMAT_ARGB8888)
> +			pixel_format = DRM_FORMAT_XRGB8888;
>  	}
>  
> -	switch (fb->pixel_format) {
> +	switch (pixel_format) {
>  	case DRM_FORMAT_C8:
>  		val |= WINCON0_BPPMODE_8BPP_PALETTE;
>  		val |= WINCONx_BURSTLEN_8WORD;
> @@ -538,17 +538,15 @@ static void fimd_win_set_pixfmt(struct fimd_context *ctx, unsigned int win,
>  		break;
>  	}
>  
> -	DRM_DEBUG_KMS("bpp = %d\n", fb->bits_per_pixel);
> -
>  	/*
> -	 * In case of exynos, setting dma-burst to 16Word causes permanent
> -	 * tearing for very small buffers, e.g. cursor buffer. Burst Mode
> -	 * switching which is based on plane size is not recommended as
> -	 * plane size varies alot towards the end of the screen and rapid
> -	 * movement causes unstable DMA which results into iommu crash/tear.
> +	 * Setting dma-burst to 16Word causes permanent tearing for very small
> +	 * buffers, e.g. cursor buffer. Burst Mode switching which based on
> +	 * plane size is not recommended as plane size varies alot towards the
> +	 * end of the screen and rapid movement causes unstable DMA, but it is
> +	 * still better to change dma-burst than displaying garbage.
>  	 */
>  
> -	if (fb->width < MIN_FB_WIDTH_FOR_16WORD_BURST) {
> +	if (width < MIN_FB_WIDTH_FOR_16WORD_BURST) {
>  		val &= ~WINCONx_BURSTLEN_MASK;
>  		val |= WINCONx_BURSTLEN_4WORD;
>  	}
> @@ -723,7 +721,7 @@ static void fimd_update_plane(struct exynos_drm_crtc *crtc,
>  		DRM_DEBUG_KMS("osd size = 0x%x\n", (unsigned int)val);
>  	}
>  
> -	fimd_win_set_pixfmt(ctx, win, fb);
> +	fimd_win_set_pixfmt(ctx, win, fb->pixel_format, state->src.w);
>  
>  	/* hardware window 0 doesn't support color key. */
>  	if (win != 0)
> 
