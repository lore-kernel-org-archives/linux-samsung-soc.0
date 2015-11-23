From: Inki Dae <inki.dae@samsung.com>
Subject: Re: [PATCH v2 1/5] drm/exynos: mixer: refactor layer setup
Date: Mon, 23 Nov 2015 16:22:36 +0900
Message-ID: <5652BEBC.4060206@samsung.com>
References: <1448208584-6621-1-git-send-email-tjakobi@math.uni-bielefeld.de>
 <1448208584-6621-2-git-send-email-tjakobi@math.uni-bielefeld.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:55229 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751417AbbKWHWi (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 23 Nov 2015 02:22:38 -0500
Received: from epcpsbgr5.samsung.com
 (u145.gpu120.samsung.co.kr [203.254.230.145])
 by mailout2.samsung.com (Oracle Communications Messaging Server 7.0.5.31.0
 64bit (built May  5 2014))
 with ESMTP id <0NY902ICVB5P8QE0@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 23 Nov 2015 16:22:37 +0900 (KST)
In-reply-to: <1448208584-6621-2-git-send-email-tjakobi@math.uni-bielefeld.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>, linux-samsung-soc@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, m.szyprowski@samsung.com, gustavo.padovan@collabora.co.uk, jy0922.shim@samsung.com

Hi Tobias,

2015=EB=85=84 11=EC=9B=94 23=EC=9D=BC 01:09=EC=97=90 Tobias Jakobi =EC=9D=
=B4(=EA=B0=80) =EC=93=B4 =EA=B8=80:
> First step in allowing a more generic way to setup complex
> blending for the different layers.
>=20
> Signed-off-by: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
> ---
>  drivers/gpu/drm/exynos/exynos_mixer.c | 84 +++++++++++++++++++++++++=
+++++-----
>  1 file changed, 73 insertions(+), 11 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/exynos/exynos_mixer.c b/drivers/gpu/drm/=
exynos/exynos_mixer.c
> index 7498c6e..2c1cea3 100644
> --- a/drivers/gpu/drm/exynos/exynos_mixer.c
> +++ b/drivers/gpu/drm/exynos/exynos_mixer.c
> @@ -63,6 +63,11 @@ struct mixer_resources {
>  	struct clk		*mout_mixer;
>  };
> =20
> +struct layer_cfg {
> +	unsigned int index;
> +	unsigned int priority;
> +};
> +
>  enum mixer_version_id {
>  	MXR_VER_0_0_0_16,
>  	MXR_VER_16_0_33_0,
> @@ -92,6 +97,8 @@ struct mixer_context {
>  	struct drm_device	*drm_dev;
>  	struct exynos_drm_crtc	*crtc;
>  	struct exynos_drm_plane	planes[MIXER_WIN_NR];
> +	const struct layer_cfg	*layer_cfg;
> +	unsigned int		num_layer;
>  	int			pipe;
>  	unsigned long		flags;
>  	bool			interlace;
> @@ -110,6 +117,34 @@ struct mixer_drv_data {
>  	bool					has_sclk;
>  };
> =20
> +/*
> + * The default layer priorities for non-VP (video processor)
> + * and VP mixer configurations.
> + *
> + * A higher priority means that the layer is at the top of
> + * the layer stack.
> + * Configurations have to be specified with its entries
> + * sorted with increasing priority.
> + *
> + * The default config assumes the following usage scenario:
> + * layer1: OSD [top]
> + * layer0: main framebuffer
> + * video layer: video overlay [bottom]
> + * Note that the video layer is only usable when the
> + * VP is available.
> + */
> +
> +static const struct layer_cfg nonvp_default_cfg[] =3D {
> +	{ .index =3D 0, .priority =3D 1 },		/* layer0 */
> +	{ .index =3D 1, .priority =3D 2 },		/* layer1 */
> +};
> +
> +static const struct layer_cfg vp_default_cfg[] =3D {
> +	{ .index =3D 2, .priority =3D 1 },		/* video layer */
> +	{ .index =3D 0, .priority =3D 2 },		/* layer0 */
> +	{ .index =3D 1, .priority =3D 3 },		/* layer1 */
> +};
> +
>  static const u8 filter_y_horiz_tap8[] =3D {
>  	0,	-1,	-1,	-1,	-1,	-1,	-1,	-1,
>  	-1,	-1,	-1,	-1,	-1,	0,	0,	0,
> @@ -268,6 +303,34 @@ static void vp_default_filter(struct mixer_resou=
rces *res)
>  		filter_cr_horiz_tap4, sizeof(filter_cr_horiz_tap4));
>  }
> =20
> +static void mixer_layer_priority(struct mixer_context *ctx)
> +{
> +	u32 val =3D 0;
> +	unsigned int i, priority;
> +
> +	for (i =3D 0; i < ctx->num_layer; ++i) {
> +		priority =3D ctx->layer_cfg[i].priority;
> +		BUG_ON(priority > 15);

What doesn constant, 15 mean? You need to clarify the meaning
and please, use a macro instead.
And it'd better to just return in this case so that the layer
configuration can be set with a default value.
I think it'd be enough to print out warning message.

Thanks,
Inki Dae

> +
> +		switch (ctx->layer_cfg[i].index) {
> +		case 0:
> +			val |=3D MXR_LAYER_CFG_GRP0_VAL(priority);
> +			break;
> +		case 1:
> +			val |=3D MXR_LAYER_CFG_GRP1_VAL(priority);
> +			break;
> +		case 2:
> +			val |=3D MXR_LAYER_CFG_VP_VAL(priority);
> +			break;
> +		default:
> +			BUG_ON(true);
> +			break;
> +		}
> +	}
> +
> +	mixer_reg_write(&ctx->mixer_res, MXR_LAYER_CFG, val);
> +}
> +
>  static void mixer_vsync_set_update(struct mixer_context *ctx, bool e=
nable)
>  {
>  	struct mixer_resources *res =3D &ctx->mixer_res;
> @@ -673,17 +736,7 @@ static void mixer_win_reset(struct mixer_context=
 *ctx)
>  	mixer_reg_writemask(res, MXR_STATUS, MXR_STATUS_16_BURST,
>  		MXR_STATUS_BURST_MASK);
> =20
> -	/* setting default layer priority: layer1 > layer0 > video
> -	 * because typical usage scenario would be
> -	 * layer1 - OSD
> -	 * layer0 - framebuffer
> -	 * video - video overlay
> -	 */
> -	val =3D MXR_LAYER_CFG_GRP1_VAL(3);
> -	val |=3D MXR_LAYER_CFG_GRP0_VAL(2);
> -	if (ctx->vp_enabled)
> -		val |=3D MXR_LAYER_CFG_VP_VAL(1);
> -	mixer_reg_write(res, MXR_LAYER_CFG, val);
> +	mixer_layer_priority(ctx);
> =20
>  	/* setting background color */
>  	mixer_reg_write(res, MXR_BG_COLOR0, 0x008080);
> @@ -1209,6 +1262,15 @@ static int mixer_probe(struct platform_device =
*pdev)
>  	ctx->vp_enabled =3D drv->is_vp_enabled;
>  	ctx->has_sclk =3D drv->has_sclk;
>  	ctx->mxr_ver =3D drv->version;
> +
> +	if (drv->is_vp_enabled) {
> +		ctx->layer_cfg =3D vp_default_cfg;
> +		ctx->num_layer =3D ARRAY_SIZE(vp_default_cfg);
> +	} else {
> +		ctx->layer_cfg =3D nonvp_default_cfg;
> +		ctx->num_layer =3D ARRAY_SIZE(nonvp_default_cfg);
> +	}
> +
>  	init_waitqueue_head(&ctx->wait_vsync_queue);
>  	atomic_set(&ctx->wait_vsync_event, 0);
> =20
>=20
