From: Andrzej Hajda <a.hajda@samsung.com>
Subject: Re: [RFC 2/2] drm/exynos: mixer: configure layers once in
 mixer_atomic_flush()
Date: Tue, 20 Sep 2016 12:00:51 +0200
Message-ID: <65ebc459-91c6-9a93-45ae-356c76cc323b@samsung.com>
References: <CGME20160919141707eucas1p281593c95940e8c0b833a84175f39ffe2@eucas1p2.samsung.com>
 <1474294604-18876-1-git-send-email-tjakobi@math.uni-bielefeld.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:44171 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751540AbcITKA7 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 20 Sep 2016 06:00:59 -0400
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout1.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0ODS00BPJRTKYS70@mailout1.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 20 Sep 2016 11:00:56 +0100 (BST)
In-reply-to: <1474294604-18876-1-git-send-email-tjakobi@math.uni-bielefeld.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>, linux-samsung-soc@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, m.szyprowski@samsung.com

On 19.09.2016 16:16, Tobias Jakobi wrote:
> Only manipulate the MXR_CFG and MXR_LAYER_CFG registers once
> in mixer_cfg_layer().
> Trigger this via atomic flush.
>
> Signed-off-by: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
> ---
>  drivers/gpu/drm/exynos/exynos_mixer.c | 104 ++++++++++++++++++++++------------
>  drivers/gpu/drm/exynos/regs-mixer.h   |   2 +
>  2 files changed, 69 insertions(+), 37 deletions(-)
>
> diff --git a/drivers/gpu/drm/exynos/exynos_mixer.c b/drivers/gpu/drm/exynos/exynos_mixer.c
> index 1e78d57..d4efd9c 100644
> --- a/drivers/gpu/drm/exynos/exynos_mixer.c
> +++ b/drivers/gpu/drm/exynos/exynos_mixer.c
> @@ -99,6 +99,7 @@ struct mixer_context {
>  	struct drm_device	*drm_dev;
>  	struct exynos_drm_crtc	*crtc;
>  	struct exynos_drm_plane	planes[MIXER_WIN_NR];
> +	unsigned long		state_cache;

The name of the variable is cryptic.

>  	int			pipe;
>  	unsigned long		flags;
>  
> @@ -418,37 +419,68 @@ static void mixer_cfg_rgb_fmt(struct mixer_context *ctx, unsigned int height)
>  	mixer_reg_writemask(res, MXR_CFG, val, MXR_CFG_RGB_FMT_MASK);
>  }
>  
> -static void mixer_cfg_layer(struct mixer_context *ctx, unsigned int win,
> -			    unsigned int priority, bool enable)
> +static void mixer_cfg_layer(struct mixer_context *ctx)
>  {
>  	struct mixer_resources *res = &ctx->mixer_res;
> -	u32 val = enable ? ~0 : 0;
> -
> -	switch (win) {
> -	case 0:
> -		mixer_reg_writemask(res, MXR_CFG, val, MXR_CFG_GRP0_ENABLE);
> -		mixer_reg_writemask(res, MXR_LAYER_CFG,
> -				    MXR_LAYER_CFG_GRP0_VAL(priority),
> -				    MXR_LAYER_CFG_GRP0_MASK);
> -		break;
> -	case 1:
> -		mixer_reg_writemask(res, MXR_CFG, val, MXR_CFG_GRP1_ENABLE);
> -		mixer_reg_writemask(res, MXR_LAYER_CFG,
> -				    MXR_LAYER_CFG_GRP1_VAL(priority),
> -				    MXR_LAYER_CFG_GRP1_MASK);
> +	unsigned int win;
>  
> -		break;
> -	case VP_DEFAULT_WIN:
> -		if (test_bit(MXR_BIT_VP_ENABLED, &ctx->flags)) {
> -			vp_reg_writemask(res, VP_ENABLE, val, VP_ENABLE_ON);
> -			mixer_reg_writemask(res, MXR_CFG, val,
> -				MXR_CFG_VP_ENABLE);
> -			mixer_reg_writemask(res, MXR_LAYER_CFG,
> -					    MXR_LAYER_CFG_VP_VAL(priority),
> -					    MXR_LAYER_CFG_VP_MASK);
> +	struct exynos_drm_plane_state *state;
> +	struct drm_framebuffer *fb;
> +	unsigned int priority;
> +	u32 mxr_cfg = 0, mxr_layer_cfg = 0, vp_enable = 0;
> +	bool enable;
> +
> +	for (win = 0; win < MIXER_WIN_NR; ++win) {
> +		state = to_exynos_plane_state(ctx->planes[win].base.state);
> +		fb = state->fb;
> +
> +		priority = state->base.normalized_zpos + 1;
> +		enable = test_bit(win, &ctx->state_cache);
> +
> +		if (!enable)
> +			continue;
> +
> +		switch (win) {
> +		case 0:
> +			mxr_cfg |=  MXR_CFG_GRP0_ENABLE;
> +			mxr_layer_cfg |= MXR_LAYER_CFG_GRP0_VAL(priority);
> +			break;
> +
> +		case 1:
> +			mxr_cfg |=  MXR_CFG_GRP1_ENABLE;
> +			mxr_layer_cfg |= MXR_LAYER_CFG_GRP1_VAL(priority);
> +			break;
> +
> +		case VP_DEFAULT_WIN:
> +			vp_enable = VP_ENABLE_ON;
> +			mxr_cfg |=  MXR_CFG_VP_ENABLE;
> +			mxr_layer_cfg |= MXR_LAYER_CFG_VP_VAL(priority);
> +			break;
> +		}
> +
> +		if (!fb)
> +			continue;
> +
> +		/*
> +		 * TODO: Don't enable alpha blending for the bottom window.
> +		 */
> +		switch (win) {
> +		case 0:
> +		case 1:
> +			mixer_cfg_gfx_blend(ctx, win, is_alpha_format(fb->pixel_format));
> +			break;
> +
> +		case VP_DEFAULT_WIN:
> +			mixer_cfg_vp_blend(ctx);
> +			break;
>  		}
> -		break;
>  	}
> +
> +	if (test_bit(MXR_BIT_VP_ENABLED, &ctx->flags))
> +		vp_reg_writemask(res, VP_ENABLE, vp_enable, VP_ENABLE_ON);
> +
> +	mixer_reg_writemask(res, MXR_CFG, mxr_cfg, MXR_CFG_ENABLE_MASK);
> +	mixer_reg_writemask(res, MXR_LAYER_CFG, mxr_layer_cfg, MXR_LAYER_CFG_MASK);

What about enabled planes which are not updated?
Corresponding bit in ctx->state_cache will be 0.
It looks like this routine will disable them in hardware, am I right?

Regards
Andrzej

>  }
>  
>  static void mixer_run(struct mixer_context *ctx)
> @@ -478,7 +510,6 @@ static void vp_video_buffer(struct mixer_context *ctx,
>  	struct drm_display_mode *mode = &state->base.crtc->state->adjusted_mode;
>  	struct mixer_resources *res = &ctx->mixer_res;
>  	struct drm_framebuffer *fb = state->fb;
> -	unsigned int priority = state->base.normalized_zpos + 1;
>  	unsigned long flags;
>  	dma_addr_t luma_addr[2], chroma_addr[2];
>  	bool tiled_mode = false;
> @@ -563,8 +594,6 @@ static void vp_video_buffer(struct mixer_context *ctx,
>  
>  	mixer_cfg_scan(ctx, mode->vdisplay);
>  	mixer_cfg_rgb_fmt(ctx, mode->vdisplay);
> -	mixer_cfg_layer(ctx, plane->index, priority, true);
> -	mixer_cfg_vp_blend(ctx);
>  	mixer_run(ctx);
>  
>  	spin_unlock_irqrestore(&res->reg_slock, flags);
> @@ -588,7 +617,6 @@ static void mixer_graph_buffer(struct mixer_context *ctx,
>  	struct drm_display_mode *mode = &state->base.crtc->state->adjusted_mode;
>  	struct mixer_resources *res = &ctx->mixer_res;
>  	struct drm_framebuffer *fb = state->fb;
> -	unsigned int priority = state->base.normalized_zpos + 1;
>  	unsigned long flags;
>  	unsigned int win = plane->index;
>  	unsigned int x_ratio = 0, y_ratio = 0;
> @@ -680,8 +708,6 @@ static void mixer_graph_buffer(struct mixer_context *ctx,
>  
>  	mixer_cfg_scan(ctx, mode->vdisplay);
>  	mixer_cfg_rgb_fmt(ctx, mode->vdisplay);
> -	mixer_cfg_layer(ctx, win, priority, true);
> -	mixer_cfg_gfx_blend(ctx, win, is_alpha_format(fb->pixel_format));
>  
>  	/* layer update mandatory for mixer 16.0.33.0 */
>  	if (ctx->mxr_ver == MXR_VER_16_0_33_0 ||
> @@ -994,32 +1020,36 @@ static void mixer_update_plane(struct exynos_drm_crtc *crtc,
>  		vp_video_buffer(mixer_ctx, plane);
>  	else
>  		mixer_graph_buffer(mixer_ctx, plane);
> +
> +	__set_bit(plane->index, &mixer_ctx->state_cache);
>  }
>  
>  static void mixer_disable_plane(struct exynos_drm_crtc *crtc,
>  				struct exynos_drm_plane *plane)
>  {
>  	struct mixer_context *mixer_ctx = crtc->ctx;
> -	struct mixer_resources *res = &mixer_ctx->mixer_res;
> -	unsigned long flags;
>  
>  	DRM_DEBUG_KMS("win: %d\n", plane->index);
>  
>  	if (!test_bit(MXR_BIT_POWERED, &mixer_ctx->flags))
>  		return;
>  
> -	spin_lock_irqsave(&res->reg_slock, flags);
> -	mixer_cfg_layer(mixer_ctx, plane->index, 0, false);
> -	spin_unlock_irqrestore(&res->reg_slock, flags);
> +	__clear_bit(plane->index, &mixer_ctx->state_cache);
>  }
>  
>  static void mixer_atomic_flush(struct exynos_drm_crtc *crtc)
>  {
>  	struct mixer_context *mixer_ctx = crtc->ctx;
> +	struct mixer_resources *res = &mixer_ctx->mixer_res;
> +	unsigned long flags;
>  
>  	if (!test_bit(MXR_BIT_POWERED, &mixer_ctx->flags))
>  		return;
>  
> +	spin_lock_irqsave(&res->reg_slock, flags);
> +	mixer_cfg_layer(mixer_ctx);
> +	spin_unlock_irqrestore(&res->reg_slock, flags);
> +
>  	mixer_vsync_set_update(mixer_ctx, true);
>  }
>  
> diff --git a/drivers/gpu/drm/exynos/regs-mixer.h b/drivers/gpu/drm/exynos/regs-mixer.h
> index 7f22df5..728a18e 100644
> --- a/drivers/gpu/drm/exynos/regs-mixer.h
> +++ b/drivers/gpu/drm/exynos/regs-mixer.h
> @@ -100,6 +100,7 @@
>  #define MXR_CFG_GRP1_ENABLE		(1 << 5)
>  #define MXR_CFG_GRP0_ENABLE		(1 << 4)
>  #define MXR_CFG_VP_ENABLE		(1 << 3)
> +#define MXR_CFG_ENABLE_MASK		(0x7 << 3)
>  #define MXR_CFG_SCAN_INTERLACE		(0 << 2)
>  #define MXR_CFG_SCAN_PROGRESSIVE	(1 << 2)
>  #define MXR_CFG_SCAN_NTSC		(0 << 1)
> @@ -151,6 +152,7 @@
>  #define MXR_LAYER_CFG_GRP0_MASK		MXR_LAYER_CFG_GRP0_VAL(~0)
>  #define MXR_LAYER_CFG_VP_VAL(x)		MXR_MASK_VAL(x, 3, 0)
>  #define MXR_LAYER_CFG_VP_MASK		MXR_LAYER_CFG_VP_VAL(~0)
> +#define MXR_LAYER_CFG_MASK		0xFFF
>  
>  #endif /* SAMSUNG_REGS_MIXER_H */
>  
