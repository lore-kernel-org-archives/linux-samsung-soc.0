From: Gustavo Padovan <gustavo@padovan.org>
Subject: Re: [RFC 1/5] drm/exynos: mixer: refactor layer setup
Date: Thu, 30 Apr 2015 17:29:35 -0300
Message-ID: <20150430202935.GA15382@joana>
References: <1430405816-4183-1-git-send-email-tjakobi@math.uni-bielefeld.de>
 <1430405816-4183-2-git-send-email-tjakobi@math.uni-bielefeld.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qg0-f48.google.com ([209.85.192.48]:36697 "EHLO
	mail-qg0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750802AbbD3U3k (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 30 Apr 2015 16:29:40 -0400
Received: by qgeb100 with SMTP id b100so30058978qge.3
        for <linux-samsung-soc@vger.kernel.org>; Thu, 30 Apr 2015 13:29:39 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <1430405816-4183-2-git-send-email-tjakobi@math.uni-bielefeld.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
Cc: linux-samsung-soc@vger.kernel.org, gustavo.padovan@collabora.co.uk, dri-devel@lists.freedesktop.org

Hi Tobias,

2015-04-30 Tobias Jakobi <tjakobi@math.uni-bielefeld.de>:

> First step in allowing a more generic way to setup complex
> blending for the different layers.
> 
> Signed-off-by: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
> ---
>  drivers/gpu/drm/exynos/exynos_mixer.c | 74 +++++++++++++++++++++++++++++------
>  1 file changed, 63 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/gpu/drm/exynos/exynos_mixer.c b/drivers/gpu/drm/exynos/exynos_mixer.c
> index 4155f43..a06b8e2 100644
> --- a/drivers/gpu/drm/exynos/exynos_mixer.c
> +++ b/drivers/gpu/drm/exynos/exynos_mixer.c
> @@ -63,6 +63,12 @@ struct mixer_resources {
>  	struct clk		*mout_mixer;
>  };
>  
> +struct layer_config {
> +	unsigned int index;
> +	unsigned int priority;
> +	u32 cfg;
> +};

I don't see why you are creating this struct, index and priority are
never used in this patch series.

> +
>  enum mixer_version_id {
>  	MXR_VER_0_0_0_16,
>  	MXR_VER_16_0_33_0,
> @@ -75,6 +81,8 @@ struct mixer_context {
>  	struct drm_device	*drm_dev;
>  	struct exynos_drm_crtc	*crtc;
>  	struct exynos_drm_plane	planes[MIXER_WIN_NR];
> +	const struct layer_config *layer_config;
> +	unsigned int num_layer;
>  	int			pipe;
>  	bool			interlace;
>  	bool			powered;
> @@ -95,6 +103,40 @@ struct mixer_drv_data {
>  	bool					has_sclk;
>  };
>  
> +/*
> + * The default layer priorities. A higher priority means that
> + * the layer is at the top of layer stack.
> + * The current configuration assumes the following usage scenario:
> + * layer1: OSD [top]
> + * layer0: main framebuffer
> + * video layer: video overlay [bottom]
> + * Note that the video layer is only usable when the
> + * video processor is available.
> + */
> +
> +static const struct layer_config default_layer_config[] = {
> +	{
> +		.index = 0, .priority = 1, /* layer0 */
> +		.cfg = MXR_LAYER_CFG_GRP0_VAL(1)
> +	}, {
> +		.index = 1, .priority = 2, /* layer1 */
> +		.cfg = MXR_LAYER_CFG_GRP1_VAL(2)
> +	}
> +};
> +
> +static const struct layer_config vp_layer_config[] = {
> +	{
> +		.index = 2, .priority = 1, /* video layer */
> +		.cfg = MXR_LAYER_CFG_VP_VAL(1)
> +	}, {
> +		.index = 0, .priority = 2, /* layer0 */
> +		.cfg = MXR_LAYER_CFG_GRP0_VAL(2)
> +	}, {
> +		.index = 1, .priority = 3, /* layer1 */
> +		.cfg = MXR_LAYER_CFG_GRP1_VAL(3)
> +	}
> +};
> +
>  static const u8 filter_y_horiz_tap8[] = {
>  	0,	-1,	-1,	-1,	-1,	-1,	-1,	-1,
>  	-1,	-1,	-1,	-1,	-1,	0,	0,	0,
> @@ -253,6 +295,17 @@ static void vp_default_filter(struct mixer_resources *res)
>  		filter_cr_horiz_tap4, sizeof(filter_cr_horiz_tap4));
>  }
>  
> +static void mixer_layer_priority(struct mixer_context *ctx)
> +{
> +	u32 val = 0;
> +	unsigned int i;
> +
> +	for (i = 0; i < ctx->num_layer; ++i)
> +		val |= ctx->layer_config[i].cfg;
> +
> +	mixer_reg_write(&ctx->mixer_res, MXR_LAYER_CFG, val);
> +}
> +
>  static void mixer_vsync_set_update(struct mixer_context *ctx, bool enable)
>  {
>  	struct mixer_resources *res = &ctx->mixer_res;
> @@ -655,17 +708,7 @@ static void mixer_win_reset(struct mixer_context *ctx)
>  	mixer_reg_writemask(res, MXR_STATUS, MXR_STATUS_16_BURST,
>  		MXR_STATUS_BURST_MASK);
>  
> -	/* setting default layer priority: layer1 > layer0 > video
> -	 * because typical usage scenario would be
> -	 * layer1 - OSD
> -	 * layer0 - framebuffer
> -	 * video - video overlay
> -	 */
> -	val = MXR_LAYER_CFG_GRP1_VAL(3);
> -	val |= MXR_LAYER_CFG_GRP0_VAL(2);
> -	if (ctx->vp_enabled)
> -		val |= MXR_LAYER_CFG_VP_VAL(1);
> -	mixer_reg_write(res, MXR_LAYER_CFG, val);

I would move this exaclty piece of code into mixer_layer_priority().

> +	mixer_layer_priority(ctx);
>  
>  	/* setting background color */
>  	mixer_reg_write(res, MXR_BG_COLOR0, 0x008080);
> @@ -1274,6 +1317,15 @@ static int mixer_probe(struct platform_device *pdev)
>  	ctx->vp_enabled = drv->is_vp_enabled;
>  	ctx->has_sclk = drv->has_sclk;
>  	ctx->mxr_ver = drv->version;
> +
> +	if (drv->is_vp_enabled) {
> +		ctx->layer_config = vp_layer_config;
> +		ctx->num_layer = ARRAY_SIZE(vp_layer_config);
> +	} else {
> +		ctx->layer_config = default_layer_config;
> +		ctx->num_layer = ARRAY_SIZE(default_layer_config);
> +	}

Then this piece of code is useless.

	Gustavo
