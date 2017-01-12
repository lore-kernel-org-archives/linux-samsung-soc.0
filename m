From: Inki Dae <inki.dae@samsung.com>
Subject: Re: [PATCH] drm/exynos/decon5433: update shadow registers iff there
 are active windows
Date: Thu, 12 Jan 2017 18:22:42 +0900
Message-ID: <58774AE2.8040202@samsung.com>
References: <CGME20170109143305eucas1p24cb7e4ef9559afcdcb1b6c6854d9c5e3@eucas1p2.samsung.com>
 <1483972382-15984-1-git-send-email-a.hajda@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:43666 "EHLO
        mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750856AbdALJWv (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 12 Jan 2017 04:22:51 -0500
Received: from epcas1p4.samsung.com (unknown [182.195.41.48])
 by mailout2.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0OJN02QRJU1VY970@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 12 Jan 2017 18:22:43 +0900 (KST)
In-reply-to: <1483972382-15984-1-git-send-email-a.hajda@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Andrzej Hajda <a.hajda@samsung.com>, dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org
Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>

Applied.

Thanks.

2017년 01월 09일 23:33에 Andrzej Hajda 이(가) 쓴 글:
> Improper usage of DECON_UPDATE register leads to subtle errors.
> If it set in decon_commit when there are no active windows it results
> in slow registry updates - all subsequent shadow registry updates takes more
> than full vblank. On the other side if it is not set when there are
> active windows it results in garbage on the screen after suspend/resume of
> FB console.
> 
> The patch hopefully fixes it.
> 
> Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
> ---
>  drivers/gpu/drm/exynos/exynos5433_drm_decon.c | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/exynos/exynos5433_drm_decon.c b/drivers/gpu/drm/exynos/exynos5433_drm_decon.c
> index ca75fe1..f15d9b1 100644
> --- a/drivers/gpu/drm/exynos/exynos5433_drm_decon.c
> +++ b/drivers/gpu/drm/exynos/exynos5433_drm_decon.c
> @@ -209,8 +209,6 @@ static void decon_commit(struct exynos_drm_crtc *crtc)
>  
>  	/* enable output and display signal */
>  	decon_set_bits(ctx, DECON_VIDCON0, VIDCON0_ENVID | VIDCON0_ENVID_F, ~0);
> -
> -	decon_set_bits(ctx, DECON_UPDATE, STANDALONE_UPDATE_F, ~0);
>  }
>  
>  static void decon_win_set_pixfmt(struct decon_context *ctx, unsigned int win,
> @@ -361,8 +359,9 @@ static void decon_atomic_flush(struct exynos_drm_crtc *crtc)
>  	for (i = ctx->first_win; i < WINDOWS_NR; i++)
>  		decon_shadow_protect_win(ctx, i, false);
>  
> -	/* standalone update */
> -	decon_set_bits(ctx, DECON_UPDATE, STANDALONE_UPDATE_F, ~0);
> +	/* update iff there are active windows */
> +	if (crtc->base.state->plane_mask)
> +		decon_set_bits(ctx, DECON_UPDATE, STANDALONE_UPDATE_F, ~0);
>  
>  	if (ctx->out_type & IFTYPE_I80)
>  		set_bit(BIT_WIN_UPDATED, &ctx->flags);
> 
