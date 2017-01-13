From: Joonyoung Shim <jy0922.shim@samsung.com>
Subject: Re: [PATCH] drm/exynos/decon5433: set STANDALONE_UPDATE_F also if
 planes are disabled
Date: Fri, 13 Jan 2017 17:37:09 +0900
Message-ID: <186cdcc7-be8a-db9a-878d-d2358c3cb139@samsung.com>
References: <CGME20170113081037eucas1p2a87c058901f1bf9544a36b798b8349ff@eucas1p2.samsung.com>
 <1484295026-16435-1-git-send-email-a.hajda@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:45431 "EHLO
        mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751146AbdAMIgo (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 13 Jan 2017 03:36:44 -0500
Received: from epcas1p1.samsung.com (unknown [182.195.41.45])
 by mailout1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0OJP017NPML5LV70@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 13 Jan 2017 17:36:41 +0900 (KST)
In-reply-to: <1484295026-16435-1-git-send-email-a.hajda@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Andrzej Hajda <a.hajda@samsung.com>, Inki Dae <inki.dae@samsung.com>, dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>

Hi Andrzej,

On 01/13/2017 05:10 PM, Andrzej Hajda wrote:
> STANDALONE_UPDATE_F should be set if something changed in plane configurations,
> including plane disable.
> The patch fixes page-faults bugs, caused by decon still using framebuffers
> of disabled planes.
> 
> Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
> ---
>  drivers/gpu/drm/exynos/exynos5433_drm_decon.c | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/exynos/exynos5433_drm_decon.c b/drivers/gpu/drm/exynos/exynos5433_drm_decon.c
> index ef7fcb5..3999e88 100644
> --- a/drivers/gpu/drm/exynos/exynos5433_drm_decon.c
> +++ b/drivers/gpu/drm/exynos/exynos5433_drm_decon.c
> @@ -46,7 +46,8 @@ enum decon_flag_bits {
>  	BIT_CLKS_ENABLED,
>  	BIT_IRQS_ENABLED,
>  	BIT_WIN_UPDATED,
> -	BIT_SUSPENDED
> +	BIT_SUSPENDED,
> +	BIT_REQUEST_UPDATE
>  };
>  
>  struct decon_context {
> @@ -313,6 +314,7 @@ static void decon_update_plane(struct exynos_drm_crtc *crtc,
>  
>  	/* window enable */
>  	decon_set_bits(ctx, DECON_WINCONx(win), WINCONx_ENWIN_F, ~0);
> +	set_bit(BIT_REQUEST_UPDATE, &ctx->flags);
>  }
>  
>  static void decon_disable_plane(struct exynos_drm_crtc *crtc,
> @@ -325,6 +327,7 @@ static void decon_disable_plane(struct exynos_drm_crtc *crtc,
>  		return;
>  
>  	decon_set_bits(ctx, DECON_WINCONx(win), WINCONx_ENWIN_F, 0);
> +	set_bit(BIT_REQUEST_UPDATE, &ctx->flags);
>  }
>  
>  static void decon_atomic_flush(struct exynos_drm_crtc *crtc)
> @@ -339,8 +342,10 @@ static void decon_atomic_flush(struct exynos_drm_crtc *crtc)
>  		decon_shadow_protect_win(ctx, i, false);
>  
>  	/* update iff there are active windows */
> -	if (crtc->base.state->plane_mask)
> +	if (test_bit(BIT_REQUEST_UPDATE, &ctx->flags)) {
>  		decon_set_bits(ctx, DECON_UPDATE, STANDALONE_UPDATE_F, ~0);
> +		set_bit(BIT_REQUEST_UPDATE, &ctx->flags);
> +	}

There is no code to clear BIT_REQUEST_UPDATE, is it right?

Thanks.
