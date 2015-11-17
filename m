From: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
Subject: Re: [PATCH 17/25] drm/exynos: fix clipping when scalling is enabled
Date: Tue, 17 Nov 2015 19:17:29 +0100
Message-ID: <564B6F39.7080802@math.uni-bielefeld.de>
References: <1447161821-1877-1-git-send-email-m.szyprowski@samsung.com>
 <1447161821-1877-18-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from smtp.math.uni-bielefeld.de ([129.70.45.10]:38785 "EHLO
	smtp.math.uni-bielefeld.de" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751787AbbKQSRb (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 17 Nov 2015 13:17:31 -0500
In-Reply-To: <1447161821-1877-18-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>, dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org
Cc: Inki Dae <inki.dae@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Andrzej Hajda <a.hajda@samsung.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Gustavo Padovan <gustavo@padovan.org>, Javier Martinez Canillas <javier@osg.samsung.com>

Small typo:
'scalling' -> 'scaling'

With best wishes,
Tobias

Marek Szyprowski wrote:
> This patch fixes calculation of src x/y offset for negative crtc x/y
> values when scalling is enabled. This fixes possible IOMMU fault when
> scalling is enabled.
> 
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
>  drivers/gpu/drm/exynos/exynos_drm_plane.c | 13 +++++++------
>  1 file changed, 7 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_plane.c b/drivers/gpu/drm/exynos/exynos_drm_plane.c
> index e5af4cd5e287..348bcec30489 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_plane.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_plane.c
> @@ -85,25 +85,26 @@ static void exynos_plane_mode_set(struct exynos_drm_plane_state *exynos_state)
>  	src_w = state->src_w >> 16;
>  	src_h = state->src_h >> 16;
>  
> +	/* set ratio */
> +	exynos_state->h_ratio = (src_w << 16) / crtc_w;
> +	exynos_state->v_ratio = (src_h << 16) / crtc_h;
> +
> +	/* clip to visible area */
>  	actual_w = exynos_plane_get_size(crtc_x, crtc_w, mode->hdisplay);
>  	actual_h = exynos_plane_get_size(crtc_y, crtc_h, mode->vdisplay);
>  
>  	if (crtc_x < 0) {
>  		if (actual_w)
> -			src_x -= crtc_x;
> +			src_x += ((-crtc_x) * exynos_state->h_ratio) >> 16;
>  		crtc_x = 0;
>  	}
>  
>  	if (crtc_y < 0) {
>  		if (actual_h)
> -			src_y -= crtc_y;
> +			src_y += ((-crtc_y) * exynos_state->v_ratio) >> 16;
>  		crtc_y = 0;
>  	}
>  
> -	/* set ratio */
> -	exynos_state->h_ratio = (src_w << 16) / crtc_w;
> -	exynos_state->v_ratio = (src_h << 16) / crtc_h;
> -
>  	/* set drm framebuffer data. */
>  	exynos_state->src.x = src_x;
>  	exynos_state->src.y = src_y;
> 
