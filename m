From: Joonyoung Shim <jy0922.shim@samsung.com>
Subject: Re: [PATCH v3 5/7] drm/exynos: mixer: refactor layer setup
Date: Thu, 17 Dec 2015 13:19:35 +0900
Message-ID: <567237D7.4020204@samsung.com>
References: <1450268508-15028-1-git-send-email-m.szyprowski@samsung.com>
 <1450268508-15028-6-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:54118 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751173AbbLQETj (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 16 Dec 2015 23:19:39 -0500
Received: from epcpsbgr3.samsung.com
 (u143.gpu120.samsung.co.kr [203.254.230.143])
 by mailout4.samsung.com (Oracle Communications Messaging Server 7.0.5.31.0
 64bit (built May  5 2014))
 with ESMTP id <0NZH01ON5IOP0280@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 17 Dec 2015 13:19:37 +0900 (KST)
In-reply-to: <1450268508-15028-6-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>, dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org
Cc: Inki Dae <inki.dae@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Andrzej Hajda <a.hajda@samsung.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Tobias Jakobi <tjakobi@math.uni-bielefeld.de>, Gustavo Padovan <gustavo@padovan.org>

Hi Marek,

On 12/16/2015 09:21 PM, Marek Szyprowski wrote:
> Properly configure blending properties of given hardware layer based on
> the selected pixel format. Currently only per-pixel-based alpha is possible
> when respective pixel format has been selected. Configuration of global,
> per-plane alpha value, color key and background color will be added later.
> 
> This patch is heavily inspired by earlier work done by Tobias Jakobi
> <tjakobi@math.uni-bielefeld.de>.
> 
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
>  drivers/gpu/drm/exynos/exynos_mixer.c | 43 +++++++++++++++++++++++++++++++++++
>  drivers/gpu/drm/exynos/regs-mixer.h   |  1 +
>  2 files changed, 44 insertions(+)
> 
> diff --git a/drivers/gpu/drm/exynos/exynos_mixer.c b/drivers/gpu/drm/exynos/exynos_mixer.c
> index c572e271579e..ae7b122274ac 100644
> --- a/drivers/gpu/drm/exynos/exynos_mixer.c
> +++ b/drivers/gpu/drm/exynos/exynos_mixer.c
> @@ -165,6 +165,16 @@ static const u8 filter_cr_horiz_tap4[] = {
>  	70,	59,	48,	37,	27,	19,	11,	5,
>  };
>  
> +static inline bool is_alpha_format(unsigned int pixel_format)
> +{
> +	switch (pixel_format) {
> +	case DRM_FORMAT_ARGB8888:
> +		return true;
> +	default:
> +		return false;
> +	}
> +}
> +
>  static inline u32 vp_reg_read(struct mixer_resources *res, u32 reg_id)
>  {
>  	return readl(res->vp_regs + reg_id);
> @@ -294,6 +304,37 @@ static void vp_default_filter(struct mixer_resources *res)
>  		filter_cr_horiz_tap4, sizeof(filter_cr_horiz_tap4));
>  }
>  
> +static void mixer_cfg_gfx_blend(struct mixer_context *ctx, unsigned int win,
> +				bool alpha)
> +{
> +	struct mixer_resources *res = &ctx->mixer_res;
> +	u32 val;
> +
> +	val  = MXR_GRP_CFG_COLOR_KEY_DISABLE; /* no blank key */
> +	if (alpha) {
> +		/* blending based on pixel alpha */
> +		val |= MXR_GRP_CFG_BLEND_PRE_MUL;
> +		val |= MXR_GRP_CFG_PIXEL_BLEND_EN;
> +	}
> +	mixer_reg_writemask(res, MXR_GRAPHIC_CFG(win),
> +			    val, MXR_GRP_CFG_MISC_MASK);

I think the priority of plane and whether vp layer exists should be
considered for blending setting. When priority of graphic layer0 is 
lowest and vp layer is not, this will blend background layer. 
It was not permitted to blend background layer until current.

Thanks.

> +}
> +
> +static void mixer_cfg_vp_blend(struct mixer_context *ctx)
> +{
> +	struct mixer_resources *res = &ctx->mixer_res;
> +	u32 val;
> +
> +	/*
> +	 * No blending at the moment since the NV12/NV21 pixelformats don't
> +	 * have an alpha channel. However the mixer supports a global alpha
> +	 * value for a layer. Once this functionality is exposed, we can
> +	 * support blending of the video layer through this.
> +	 */
> +	val = 0;
> +	mixer_reg_write(res, MXR_VIDEO_CFG, val);
> +}
> +
>  static void mixer_vsync_set_update(struct mixer_context *ctx, bool enable)
>  {
>  	struct mixer_resources *res = &ctx->mixer_res;
> @@ -519,6 +560,7 @@ static void vp_video_buffer(struct mixer_context *ctx,
>  	mixer_cfg_scan(ctx, mode->vdisplay);
>  	mixer_cfg_rgb_fmt(ctx, mode->vdisplay);
>  	mixer_cfg_layer(ctx, plane->index, state->zpos + 1, true);
> +	mixer_cfg_vp_blend(ctx);
>  	mixer_run(ctx);
>  
>  	mixer_vsync_set_update(ctx, true);
> @@ -634,6 +676,7 @@ static void mixer_graph_buffer(struct mixer_context *ctx,
>  	mixer_cfg_scan(ctx, mode->vdisplay);
>  	mixer_cfg_rgb_fmt(ctx, mode->vdisplay);
>  	mixer_cfg_layer(ctx, win, state->zpos + 1, true);
> +	mixer_cfg_gfx_blend(ctx, win, is_alpha_format(fb->pixel_format));
>  
>  	/* layer update mandatory for mixer 16.0.33.0 */
>  	if (ctx->mxr_ver == MXR_VER_16_0_33_0 ||
> diff --git a/drivers/gpu/drm/exynos/regs-mixer.h b/drivers/gpu/drm/exynos/regs-mixer.h
> index dbdbc0af3358..7f22df5bf707 100644
> --- a/drivers/gpu/drm/exynos/regs-mixer.h
> +++ b/drivers/gpu/drm/exynos/regs-mixer.h
> @@ -113,6 +113,7 @@
>  #define MXR_GRP_CFG_BLEND_PRE_MUL	(1 << 20)
>  #define MXR_GRP_CFG_WIN_BLEND_EN	(1 << 17)
>  #define MXR_GRP_CFG_PIXEL_BLEND_EN	(1 << 16)
> +#define MXR_GRP_CFG_MISC_MASK		((3 << 16) | (3 << 20))
>  #define MXR_GRP_CFG_FORMAT_VAL(x)	MXR_MASK_VAL(x, 11, 8)
>  #define MXR_GRP_CFG_FORMAT_MASK		MXR_GRP_CFG_FORMAT_VAL(~0)
>  #define MXR_GRP_CFG_ALPHA_VAL(x)	MXR_MASK_VAL(x, 7, 0)
> 
