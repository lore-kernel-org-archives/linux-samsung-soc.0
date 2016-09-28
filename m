From: Inki Dae <inki.dae@samsung.com>
Subject: Re: [PATCH v3] drm/exynos: mixer: configure layers once in
 mixer_atomic_flush()
Date: Wed, 28 Sep 2016 10:46:53 +0900
Message-ID: <57EB210D.5030406@samsung.com>
References: <CGME20160926113649epcas1p3cc06d1dbcf7a6f4c0a8a0bd07a9e13a8@epcas1p3.samsung.com>
 <1474889789-26721-1-git-send-email-tjakobi@math.uni-bielefeld.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:50808 "EHLO
        mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S933592AbcI1Bqz (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 27 Sep 2016 21:46:55 -0400
Received: from epcpsbgm2new.samsung.com (epcpsbgm2 [203.254.230.27])
 by mailout2.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0OE602DSRYA45G00@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 28 Sep 2016 10:46:53 +0900 (KST)
In-reply-to: <1474889789-26721-1-git-send-email-tjakobi@math.uni-bielefeld.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>, linux-samsung-soc@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, a.hajda@samsung.com, m.szyprowski@samsung.com



2016년 09월 26일 20:36에 Tobias Jakobi 이(가) 쓴 글:
> Only manipulate the MXR_CFG and MXR_LAYER_CFG registers once
> in mixer_cfg_layer().
> Trigger this via atomic flush.
> 
> Changes in v2:
> - issue mixer_cfg_layer() in mixer_disable()
> - rename fields as suggested by Andrzej
> - added docu to mixer context struct
> - simplify mixer_win_reset() as well
> 
> Changes in v3:
> - simplify some conditions as suggested by Inki
> - add docu to mixer_cfg_layer()
> - fold switch statements into a single one
> 
> Signed-off-by: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
> ---
>  drivers/gpu/drm/exynos/exynos_mixer.c | 135 ++++++++++++++++++++++------------
>  drivers/gpu/drm/exynos/regs-mixer.h   |   2 +
>  2 files changed, 92 insertions(+), 45 deletions(-)
> 
> diff --git a/drivers/gpu/drm/exynos/exynos_mixer.c b/drivers/gpu/drm/exynos/exynos_mixer.c
> index 1e78d57..4f06f4d 100644
> --- a/drivers/gpu/drm/exynos/exynos_mixer.c
> +++ b/drivers/gpu/drm/exynos/exynos_mixer.c
> @@ -93,12 +93,25 @@ static const uint32_t vp_formats[] = {
>  	DRM_FORMAT_NV21,
>  };
>  
> +/*
> + * Mixer context structure.
> + *
> + * @crtc: The HDMI CRTC attached to the mixer.
> + * @planes: Array of plane objects for each of the mixer windows.
> + * @active_windows: Cache of the mixer's hardware state.
> + *       Tracks which mixer windows are active/inactive.
> + * @pipe: The CRTC index.
> + * @flags: Bitfield build from the mixer_flag_bits enumerator.
> + * @mixer_resources: A struct containing registers, clocks, etc.
> + * @mxr_ver: The hardware revision/version of the mixer.
> + */
>  struct mixer_context {
>  	struct platform_device *pdev;
>  	struct device		*dev;
>  	struct drm_device	*drm_dev;
>  	struct exynos_drm_crtc	*crtc;
>  	struct exynos_drm_plane	planes[MIXER_WIN_NR];
> +	unsigned long		active_windows;
>  	int			pipe;
>  	unsigned long		flags;
>  
> @@ -418,37 +431,70 @@ static void mixer_cfg_rgb_fmt(struct mixer_context *ctx, unsigned int height)
>  	mixer_reg_writemask(res, MXR_CFG, val, MXR_CFG_RGB_FMT_MASK);
>  }
>  
> -static void mixer_cfg_layer(struct mixer_context *ctx, unsigned int win,
> -			    unsigned int priority, bool enable)
> +/**
> + * mixer_cfg_layer - apply layer configuration to hardware
> + * @ctx: mixer context
> + *
> + * This configures the MXR_CFG and MXR_LAYER_CFG hardware registers
> + * using the 'active_windows' field of the the mixer content, and
> + * the pixel format of the framebuffers associated with the enabled
> + * windows.
> + *
> + * Has to be called under mixer lock.
> + */
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
> +		enable = test_bit(win, &ctx->active_windows);
> +
> +		if (!enable)
> +			continue;
> +
> +		BUG_ON(!fb);
> +
> +		/*
> +		 * TODO: Don't enable alpha blending for the bottom window.
> +		 */
> +		switch (win) {
> +		case 0:
> +			mxr_cfg |=  MXR_CFG_GRP0_ENABLE;
> +			mxr_layer_cfg |= MXR_LAYER_CFG_GRP0_VAL(priority);
> +			mixer_cfg_gfx_blend(ctx, win, is_alpha_format(fb->pixel_format));
> +			break;
> +
> +		case 1:
> +			mxr_cfg |=  MXR_CFG_GRP1_ENABLE;
> +			mxr_layer_cfg |= MXR_LAYER_CFG_GRP1_VAL(priority);
> +			mixer_cfg_gfx_blend(ctx, win, is_alpha_format(fb->pixel_format));
> +			break;
> +
> +		case VP_DEFAULT_WIN:
> +			vp_enable = VP_ENABLE_ON;
> +			mxr_cfg |=  MXR_CFG_VP_ENABLE;
> +			mxr_layer_cfg |= MXR_LAYER_CFG_VP_VAL(priority);
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
>  }
>  
>  static void mixer_run(struct mixer_context *ctx)
> @@ -478,7 +524,6 @@ static void vp_video_buffer(struct mixer_context *ctx,
>  	struct drm_display_mode *mode = &state->base.crtc->state->adjusted_mode;
>  	struct mixer_resources *res = &ctx->mixer_res;
>  	struct drm_framebuffer *fb = state->fb;
> -	unsigned int priority = state->base.normalized_zpos + 1;
>  	unsigned long flags;
>  	dma_addr_t luma_addr[2], chroma_addr[2];
>  	bool tiled_mode = false;
> @@ -563,8 +608,6 @@ static void vp_video_buffer(struct mixer_context *ctx,
>  
>  	mixer_cfg_scan(ctx, mode->vdisplay);
>  	mixer_cfg_rgb_fmt(ctx, mode->vdisplay);
> -	mixer_cfg_layer(ctx, plane->index, priority, true);
> -	mixer_cfg_vp_blend(ctx);
>  	mixer_run(ctx);
>  
>  	spin_unlock_irqrestore(&res->reg_slock, flags);
> @@ -588,7 +631,6 @@ static void mixer_graph_buffer(struct mixer_context *ctx,
>  	struct drm_display_mode *mode = &state->base.crtc->state->adjusted_mode;
>  	struct mixer_resources *res = &ctx->mixer_res;
>  	struct drm_framebuffer *fb = state->fb;
> -	unsigned int priority = state->base.normalized_zpos + 1;
>  	unsigned long flags;
>  	unsigned int win = plane->index;
>  	unsigned int x_ratio = 0, y_ratio = 0;
> @@ -680,8 +722,6 @@ static void mixer_graph_buffer(struct mixer_context *ctx,
>  
>  	mixer_cfg_scan(ctx, mode->vdisplay);
>  	mixer_cfg_rgb_fmt(ctx, mode->vdisplay);
> -	mixer_cfg_layer(ctx, win, priority, true);
> -	mixer_cfg_gfx_blend(ctx, win, is_alpha_format(fb->pixel_format));
>  
>  	/* layer update mandatory for mixer 16.0.33.0 */
>  	if (ctx->mxr_ver == MXR_VER_16_0_33_0 ||
> @@ -726,9 +766,6 @@ static void mixer_win_reset(struct mixer_context *ctx)
>  	mixer_reg_writemask(res, MXR_STATUS, MXR_STATUS_16_BURST,
>  		MXR_STATUS_BURST_MASK);
>  
> -	/* reset default layer priority */
> -	mixer_reg_write(res, MXR_LAYER_CFG, 0);
> -
>  	/* setting background color */
>  	mixer_reg_write(res, MXR_BG_COLOR0, 0x008080);
>  	mixer_reg_write(res, MXR_BG_COLOR1, 0x008080);
> @@ -740,11 +777,9 @@ static void mixer_win_reset(struct mixer_context *ctx)
>  		vp_default_filter(res);
>  	}
>  
> -	/* disable all layers */
> -	mixer_reg_writemask(res, MXR_CFG, 0, MXR_CFG_GRP0_ENABLE);
> -	mixer_reg_writemask(res, MXR_CFG, 0, MXR_CFG_GRP1_ENABLE);
> -	if (test_bit(MXR_BIT_VP_ENABLED, &ctx->flags))
> -		mixer_reg_writemask(res, MXR_CFG, 0, MXR_CFG_VP_ENABLE);
> +	/* disable all layers and reset layer priority to default */
> +	ctx->active_windows = 0;
> +	mixer_cfg_layer(ctx);
>  
>  	spin_unlock_irqrestore(&res->reg_slock, flags);
>  }
> @@ -994,32 +1029,36 @@ static void mixer_update_plane(struct exynos_drm_crtc *crtc,
>  		vp_video_buffer(mixer_ctx, plane);
>  	else
>  		mixer_graph_buffer(mixer_ctx, plane);
> +
> +	__set_bit(plane->index, &mixer_ctx->active_windows);
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
> +	__clear_bit(plane->index, &mixer_ctx->active_windows);
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
> @@ -1053,6 +1092,8 @@ static void mixer_enable(struct exynos_drm_crtc *crtc)
>  static void mixer_disable(struct exynos_drm_crtc *crtc)
>  {
>  	struct mixer_context *ctx = crtc->ctx;
> +	struct mixer_resources *res = &ctx->mixer_res;
> +	unsigned long flags;
>  	int i;
>  
>  	if (!test_bit(MXR_BIT_POWERED, &ctx->flags))
> @@ -1064,6 +1105,10 @@ static void mixer_disable(struct exynos_drm_crtc *crtc)
>  	for (i = 0; i < MIXER_WIN_NR; i++)
>  		mixer_disable_plane(crtc, &ctx->planes[i]);
>  
> +	spin_lock_irqsave(&res->reg_slock, flags);
> +	mixer_cfg_layer(ctx);

Is there any reasone to call mixer_cfg_layer function here? mixer_disable function tries to disable mixer device.
