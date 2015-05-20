From: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
Subject: Re: [PATCH v3] drm/exynos: calculate vrefresh instead of use
 a fixed value
Date: Wed, 20 May 2015 23:07:46 +0200
Message-ID: <555CF7A2.8050108@math.uni-bielefeld.de>
References: <1432155399-5586-1-git-send-email-gustavo@padovan.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from smtp.math.uni-bielefeld.de ([129.70.45.10]:38438 "EHLO
	smtp.math.uni-bielefeld.de" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1753246AbbETVHs (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 20 May 2015 17:07:48 -0400
In-Reply-To: <1432155399-5586-1-git-send-email-gustavo@padovan.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Gustavo Padovan <gustavo@padovan.org>, linux-samsung-soc@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, inki.dae@samsung.com, jy0922.shim@samsung.com, daniel@fooishbar.org, Gustavo Padovan <gustavo.padovan@collabora.co.uk>

Gustavo Padovan wrote:
> From: Gustavo Padovan <gustavo.padovan@collabora.co.uk>
> 
> When mode's vrefresh is zero we should ask DRM core to calculate vrefresh
> for us so we can get the correct value instead of relying on fixed value
> defined in a macro. But if vrefresh is still zero we should fail the
> update.
> 
> Suggested-by: Daniel Stone <daniels@collabora.com>
> Signed-off-by: Gustavo Padovan <gustavo.padovan@collabora.co.uk>
> ---
>  drivers/gpu/drm/exynos/exynos_drm_fimd.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_fimd.c b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
> index 9819fa6..3f9646d 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_fimd.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
> @@ -42,7 +42,6 @@
>   * CPU Interface.
>   */
>  
> -#define FIMD_DEFAULT_FRAMERATE 60
>  #define MIN_FB_WIDTH_FOR_16WORD_BURST 128
>  
>  /* position control register for hardware window 0, 2 ~ 4.*/
> @@ -329,7 +328,9 @@ static bool fimd_mode_fixup(struct exynos_drm_crtc *crtc,
>  		struct drm_display_mode *adjusted_mode)
>  {
>  	if (adjusted_mode->vrefresh == 0)
> -		adjusted_mode->vrefresh = FIMD_DEFAULT_FRAMERATE;
> +		adjusted_mode->vrefresh = drm_mode_vrefresh(mode);
> +	if (adjusted_mode->vrefresh == 0)
> +		return false;
>  
>  	return true;
>  }
> @@ -427,7 +428,7 @@ static void fimd_commit(struct exynos_drm_crtc *crtc)
>  	if (ctx->driver_data->has_clksel)
>  		val |= VIDCON0_CLKSEL_LCD;
>  
> -	clkdiv = fimd_calc_clkdiv(ctx, mode);
> +	clkdiv = fimd_calc_clkdiv(ctx, &crtc->base.state->adjusted_mode);
I would suggest to just change 'mode' at the top:
struct drm_display_mode *mode = &crtc->base.state->adjusted_mode;

With best wishes,
Tobias


>  	if (clkdiv > 1)
>  		val |= VIDCON0_CLKVAL_F(clkdiv - 1) | VIDCON0_CLKDIR;
>  
> 
