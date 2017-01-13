From: Inki Dae <inki.dae@samsung.com>
Subject: Re: [PATCH v3] drm/exynos/decon5433: set STANDALONE_UPDATE_F also if
 planes are disabled
Date: Fri, 13 Jan 2017 18:26:19 +0900
Message-ID: <58789D3B.3010005@samsung.com>
References: <aa240581-5f90-400b-baef-f6488dec939a@samsung.com>
 <CGME20170113092102eucas1p2e9cc739f2ff96b5ad760f5e5c821037d@eucas1p2.samsung.com>
 <1484299258-2371-1-git-send-email-a.hajda@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:56897 "EHLO
        mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750923AbdAMJ0X (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 13 Jan 2017 04:26:23 -0500
Received: from epcas1p4.samsung.com (unknown [182.195.41.48])
 by mailout3.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0OJP01S0ZOVXK2C0@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 13 Jan 2017 18:26:21 +0900 (KST)
In-reply-to: <1484299258-2371-1-git-send-email-a.hajda@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Andrzej Hajda <a.hajda@samsung.com>, dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org, Joonyoung Shim <jy0922.shim@samsung.com>
Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>



2017년 01월 13일 18:20에 Andrzej Hajda 이(가) 쓴 글:
> STANDALONE_UPDATE_F should be set if something changed in plane configurations,
> including plane disable.
> The patch fixes page-faults bugs, caused by decon still using framebuffers
> of disabled planes.

Excellent! Applied and this patch will go to -fixes with below another one[1],

[1] [PATCH] drm/exynos/decon5433: update shadow registers iff there are active windows

Thanks.

> 
> Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
> Tested-by: Joonyoung Shim <jy0922.shim@samsung.com>
> ---
> v2: fixed clear-bit code (Thx Marek)
> v3: use test_and_clear_bit (Thx Joonyoung)
> ---
>  drivers/gpu/drm/exynos/exynos5433_drm_decon.c | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/exynos/exynos5433_drm_decon.c b/drivers/gpu/drm/exynos/exynos5433_drm_decon.c
> index ef7fcb5..09e8cc3 100644
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
> @@ -338,8 +341,7 @@ static void decon_atomic_flush(struct exynos_drm_crtc *crtc)
>  	for (i = ctx->first_win; i < WINDOWS_NR; i++)
>  		decon_shadow_protect_win(ctx, i, false);
>  
> -	/* update iff there are active windows */
> -	if (crtc->base.state->plane_mask)
> +	if (test_and_clear_bit(BIT_REQUEST_UPDATE, &ctx->flags))
>  		decon_set_bits(ctx, DECON_UPDATE, STANDALONE_UPDATE_F, ~0);
>  
>  	if (ctx->out_type & IFTYPE_I80)
> 
