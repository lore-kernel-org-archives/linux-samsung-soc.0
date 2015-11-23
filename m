From: Inki Dae <inki.dae@samsung.com>
Subject: Re: [PATCH v2 4/5] drm/exynos: mixer: do blending setup in
 mixer_cfg_layer()
Date: Mon, 23 Nov 2015 16:34:10 +0900
Message-ID: <5652C172.4090701@samsung.com>
References: <1448208584-6621-1-git-send-email-tjakobi@math.uni-bielefeld.de>
 <1448208584-6621-5-git-send-email-tjakobi@math.uni-bielefeld.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:42319 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752730AbbKWHeL (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 23 Nov 2015 02:34:11 -0500
Received: from epcpsbgr4.samsung.com
 (u144.gpu120.samsung.co.kr [203.254.230.144])
 by mailout1.samsung.com (Oracle Communications Messaging Server 7.0.5.31.0
 64bit (built May  5 2014))
 with ESMTP id <0NY9019USBOYF720@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 23 Nov 2015 16:34:10 +0900 (KST)
In-reply-to: <1448208584-6621-5-git-send-email-tjakobi@math.uni-bielefeld.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>, linux-samsung-soc@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, m.szyprowski@samsung.com, gustavo.padovan@collabora.co.uk, jy0922.shim@samsung.com



2015=EB=85=84 11=EC=9B=94 23=EC=9D=BC 01:09=EC=97=90 Tobias Jakobi =EC=9D=
=B4(=EA=B0=80) =EC=93=B4 =EA=B8=80:
> This updates the blending setup when the layer configuration
> changes (triggered by mixer_win_{commit,disable}).
>=20
> To avoid unnecesary reconfigurations we cache the layer
> state in the mixer context.
>=20
> Extra care has to be taken for the layer that is currently
> being enabled/disabled.
>=20
> Signed-off-by: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
> ---
>  drivers/gpu/drm/exynos/exynos_mixer.c | 41 +++++++++++++++++++++++++=
++++++++--
>  1 file changed, 39 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/exynos/exynos_mixer.c b/drivers/gpu/drm/=
exynos/exynos_mixer.c
> index ec9659e..1c24fb5 100644
> --- a/drivers/gpu/drm/exynos/exynos_mixer.c
> +++ b/drivers/gpu/drm/exynos/exynos_mixer.c
> @@ -99,6 +99,7 @@ struct mixer_context {
>  	struct exynos_drm_plane	planes[MIXER_WIN_NR];
>  	const struct layer_cfg	*layer_cfg;
>  	unsigned int		num_layer;
> +	u32			layer_state;
>  	int			pipe;
>  	unsigned long		flags;
>  	bool			interlace;
> @@ -189,6 +190,27 @@ static inline bool is_alpha_format(const struct =
mixer_context* ctx, unsigned int
>  	}
>  }
> =20
> +static inline u32 get_layer_state(const struct mixer_context *ctx,
> +	unsigned int win, bool enable)
> +{
> +	u32 enable_state, alpha_state;
> +
> +	enable_state =3D ctx->layer_state & 0xffff;
> +	alpha_state =3D ctx->layer_state >> 16;
> +
> +	if (enable)
> +		enable_state |=3D (1 << win);
> +	else
> +		enable_state &=3D ~(1 << win);
> +
> +	if (enable && is_alpha_format(ctx, win))
> +		alpha_state |=3D (1 << win);
> +	else
> +		alpha_state &=3D ~(1 << win);
> +
> +	return ((alpha_state << 16) | enable_state);
> +}
> +
>  static inline u32 vp_reg_read(struct mixer_resources *res, u32 reg_i=
d)
>  {
>  	return readl(res->vp_regs + reg_id);
> @@ -370,8 +392,9 @@ static void mixer_general_layer(struct mixer_cont=
ext *ctx,
>  {
>  	u32 val;
>  	struct mixer_resources *res =3D &ctx->mixer_res;
> +	const u32 alpha_state =3D ctx->layer_state >> 16;
> =20
> -	if (is_alpha_format(ctx, cfg->index)) {
> +	if (alpha_state & (1 << cfg->index)) {
>  		val  =3D MXR_GRP_CFG_COLOR_KEY_DISABLE; /* no blank key */
>  		val |=3D MXR_GRP_CFG_BLEND_PRE_MUL;
>  		val |=3D MXR_GRP_CFG_PIXEL_BLEND_EN; /* blending based on pixel al=
pha */
> @@ -397,10 +420,11 @@ static void mixer_general_layer(struct mixer_co=
ntext *ctx,
>  	}
>  }
> =20
> -static void mixer_layer_blending(struct mixer_context *ctx, unsigned=
 int enable_state)
> +static void mixer_layer_blending(struct mixer_context *ctx)
>  {
>  	unsigned int i, index;
>  	bool bottom_layer =3D false;
> +	const u32 enable_state =3D ctx->layer_state & 0xffff;
> =20
>  	for (i =3D 0; i < ctx->num_layer; ++i) {
>  		index =3D ctx->layer_cfg[i].index;
> @@ -503,8 +527,19 @@ static void mixer_cfg_layer(struct mixer_context=
 *ctx, unsigned int win,
>  				bool enable)
>  {
>  	struct mixer_resources *res =3D &ctx->mixer_res;
> +	u32 new_layer_state;
>  	u32 val =3D enable ? ~0 : 0;
> =20
> +	new_layer_state =3D get_layer_state(ctx, win, enable);
> +	if (new_layer_state =3D=3D ctx->layer_state)
> +		return;
> +
> +	/*
> +	 * Update the layer state so that mixer_layer_blending()
> +	 * below can use it.
> +	 */
> +	ctx->layer_state =3D new_layer_state;

It may be trivial but I think it'd be better to move above line to most=
 bottom of this function.

> +
>  	switch (win) {
>  	case 0:
>  		mixer_reg_writemask(res, MXR_CFG, val, MXR_CFG_GRP0_ENABLE);
> @@ -520,6 +555,8 @@ static void mixer_cfg_layer(struct mixer_context =
*ctx, unsigned int win,
>  		}
>  		break;
>  	}
> +
> +	mixer_layer_blending(ctx);

Here.

Thanks,
Inki Dae

>  }
> =20
>  static void mixer_run(struct mixer_context *ctx)
>=20
