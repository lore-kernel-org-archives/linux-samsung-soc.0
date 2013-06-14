From: =?UTF-8?B?6rmA7Iq57Jqw?= <sw0312.kim@samsung.com>
Subject: Re: [PATCH 5/9] drm/exynos: add support for exynos5420 mixer
Date: Fri, 14 Jun 2013 16:13:45 +0900
Message-ID: <51BAC2A9.4070301@samsung.com>
References: <1370959891-8923-1-git-send-email-rahul.sharma@samsung.com>
 <1370959891-8923-6-git-send-email-rahul.sharma@samsung.com>
Reply-To: sw0312.kim@samsung.com
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:42042 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751858Ab3FNHNu convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 14 Jun 2013 03:13:50 -0400
Received: from epcpsbgr2.samsung.com
 (u142.gpu120.samsung.co.kr [203.254.230.142])
 by mailout2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MOD006KVG2SAER0@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 14 Jun 2013 16:13:44 +0900 (KST)
In-reply-to: <1370959891-8923-6-git-send-email-rahul.sharma@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Rahul Sharma <rahul.sharma@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, dri-devel@lists.freedesktop.org, kgene.kim@samsung.com, joshi@samsung.com, Seung-Woo Kim <sw0312.kim@samsung.com>

Hello Rahul,

This patch looks good to me just with mixer part of 2nd patch because
there is no hdmiphy related things.

On 2013=EB=85=84 06=EC=9B=94 11=EC=9D=BC 23:11, Rahul Sharma wrote:
> Add support for exynos5420 mixer IP in the drm mixer driver.
>=20
> Signed-off-by: Rahul Sharma <rahul.sharma@samsung.com>
> ---
>  drivers/gpu/drm/exynos/exynos_mixer.c |   49 +++++++++++++++++++++++=
++--------
>  drivers/gpu/drm/exynos/regs-mixer.h   |    7 +++++
>  2 files changed, 44 insertions(+), 12 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/exynos/exynos_mixer.c b/drivers/gpu/drm/=
exynos/exynos_mixer.c
> index 58dfd3f..101d5bb 100644
> --- a/drivers/gpu/drm/exynos/exynos_mixer.c
> +++ b/drivers/gpu/drm/exynos/exynos_mixer.c
> @@ -78,6 +78,7 @@ struct mixer_resources {
>  enum mixer_version_id {
>  	MXR_VER_0_0_0_16,
>  	MXR_VER_16_0_33_0,
> +	MXR_VER_128_0_0_184,
>  };
> =20
>  struct mixer_context {
> @@ -283,17 +284,19 @@ static void mixer_cfg_scan(struct mixer_context=
 *ctx, unsigned int height)
>  	val =3D (ctx->interlace ? MXR_CFG_SCAN_INTERLACE :
>  				MXR_CFG_SCAN_PROGRASSIVE);
> =20
> -	/* choosing between porper HD and SD mode */
> -	if (height <=3D 480)
> -		val |=3D MXR_CFG_SCAN_NTSC | MXR_CFG_SCAN_SD;
> -	else if (height <=3D 576)
> -		val |=3D MXR_CFG_SCAN_PAL | MXR_CFG_SCAN_SD;
> -	else if (height <=3D 720)
> -		val |=3D MXR_CFG_SCAN_HD_720 | MXR_CFG_SCAN_HD;
> -	else if (height <=3D 1080)
> -		val |=3D MXR_CFG_SCAN_HD_1080 | MXR_CFG_SCAN_HD;
> -	else
> -		val |=3D MXR_CFG_SCAN_HD_720 | MXR_CFG_SCAN_HD;
> +	if (ctx->mxr_ver !=3D MXR_VER_128_0_0_184) {
> +		/* choosing between proper HD and SD mode */
> +		if (height <=3D 480)
> +			val |=3D MXR_CFG_SCAN_NTSC | MXR_CFG_SCAN_SD;
> +		else if (height <=3D 576)
> +			val |=3D MXR_CFG_SCAN_PAL | MXR_CFG_SCAN_SD;
> +		else if (height <=3D 720)
> +			val |=3D MXR_CFG_SCAN_HD_720 | MXR_CFG_SCAN_HD;
> +		else if (height <=3D 1080)
> +			val |=3D MXR_CFG_SCAN_HD_1080 | MXR_CFG_SCAN_HD;
> +		else
> +			val |=3D MXR_CFG_SCAN_HD_720 | MXR_CFG_SCAN_HD;
> +	}
> =20
>  	mixer_reg_writemask(res, MXR_CFG, val, MXR_CFG_SCAN_MASK);
>  }
> @@ -557,6 +560,14 @@ static void mixer_graph_buffer(struct mixer_cont=
ext *ctx, int win)
>  	/* setup geometry */
>  	mixer_reg_write(res, MXR_GRAPHIC_SPAN(win), win_data->fb_width);
> =20
> +	/* setup display size */
> +	if (ctx->mxr_ver =3D=3D MXR_VER_128_0_0_184 &&
> +		win =3D=3D MIXER_DEFAULT_WIN) {
> +		val  =3D MXR_MXR_RES_HEIGHT(win_data->fb_height);
> +		val |=3D MXR_MXR_RES_WIDTH(win_data->fb_width);
> +		mixer_reg_write(res, MXR_RESOLUTION, val);
> +	}
> +
>  	val  =3D MXR_GRP_WH_WIDTH(win_data->crtc_width);
>  	val |=3D MXR_GRP_WH_HEIGHT(win_data->crtc_height);
>  	val |=3D MXR_GRP_WH_H_SCALE(x_ratio);
> @@ -581,7 +592,8 @@ static void mixer_graph_buffer(struct mixer_conte=
xt *ctx, int win)
>  	mixer_cfg_layer(ctx, win, true);
> =20
>  	/* layer update mandatory for mixer 16.0.33.0 */
> -	if (ctx->mxr_ver =3D=3D MXR_VER_16_0_33_0)
> +	if (ctx->mxr_ver =3D=3D MXR_VER_16_0_33_0 ||
> +		ctx->mxr_ver =3D=3D MXR_VER_128_0_0_184)
>  		mixer_layer_update(ctx);
> =20
>  	mixer_run(ctx);
> @@ -822,6 +834,7 @@ static void mixer_win_disable(void *ctx, int win)
> =20
>  static int mixer_check_mode(void *ctx, struct drm_display_mode *mode=
)
>  {
> +	struct mixer_context *mixer_ctx =3D ctx;
>  	u32 w, h;
> =20
>  	w =3D mode->hdisplay;
> @@ -831,6 +844,10 @@ static int mixer_check_mode(void *ctx, struct dr=
m_display_mode *mode)
>  		mode->hdisplay, mode->vdisplay, mode->vrefresh,
>  		(mode->flags & DRM_MODE_FLAG_INTERLACE) ? 1 : 0);
> =20
> +	if (mixer_ctx->mxr_ver =3D=3D MXR_VER_0_0_0_16 ||
> +		mixer_ctx->mxr_ver =3D=3D MXR_VER_128_0_0_184)
> +		return 0;
> +
>  	if ((w >=3D 464 && w <=3D 720 && h >=3D 261 && h <=3D 576) ||
>  		(w >=3D 1024 && w <=3D 1280 && h >=3D 576 && h <=3D 720) ||
>  		(w >=3D 1664 && w <=3D 1920 && h >=3D 936 && h <=3D 1080))
> @@ -1127,6 +1144,11 @@ static int vp_resources_init(struct exynos_drm=
_hdmi_context *ctx,
>  	return 0;
>  }
> =20
> +static struct mixer_drv_data exynos5420_mxr_drv_data =3D {
> +	.version =3D MXR_VER_128_0_0_184,
> +	.is_vp_enabled =3D 0,
> +};
> +
>  static struct mixer_drv_data exynos5250_mxr_drv_data =3D {
>  	.version =3D MXR_VER_16_0_33_0,
>  	.is_vp_enabled =3D 0,
> @@ -1151,6 +1173,9 @@ static struct platform_device_id mixer_driver_t=
ypes[] =3D {
> =20
>  static struct of_device_id mixer_match_types[] =3D {
>  	{
> +		.compatible =3D "samsung,exynos5420-mixer",
> +		.data	=3D &exynos5420_mxr_drv_data,
> +	}, {
>  		.compatible =3D "samsung,exynos5250-mixer",
>  		.data	=3D &exynos5250_mxr_drv_data,
>  	}, {
> diff --git a/drivers/gpu/drm/exynos/regs-mixer.h b/drivers/gpu/drm/ex=
ynos/regs-mixer.h
> index 5d8dbc0..4537026 100644
> --- a/drivers/gpu/drm/exynos/regs-mixer.h
> +++ b/drivers/gpu/drm/exynos/regs-mixer.h
> @@ -44,6 +44,9 @@
>  #define MXR_CM_COEFF_Y			0x0080
>  #define MXR_CM_COEFF_CB			0x0084
>  #define MXR_CM_COEFF_CR			0x0088
> +#define MXR_MO				0x0304
> +#define MXR_RESOLUTION			0x0310
> +
>  #define MXR_GRAPHIC0_BASE_S		0x2024
>  #define MXR_GRAPHIC1_BASE_S		0x2044
> =20
> @@ -119,6 +122,10 @@
>  #define MXR_GRP_WH_WIDTH(x)		MXR_MASK_VAL(x, 26, 16)
>  #define MXR_GRP_WH_HEIGHT(x)		MXR_MASK_VAL(x, 10, 0)
> =20
> +/* bits for MXR_RESOLUTION */
> +#define MXR_MXR_RES_HEIGHT(x)		MXR_MASK_VAL(x, 26, 16)
> +#define MXR_MXR_RES_WIDTH(x)		MXR_MASK_VAL(x, 10, 0)
> +
>  /* bits for MXR_GRAPHICn_SXY */
>  #define MXR_GRP_SXY_SX(x)		MXR_MASK_VAL(x, 26, 16)
>  #define MXR_GRP_SXY_SY(x)		MXR_MASK_VAL(x, 10, 0)
>=20

--=20
Seung-Woo Kim
Samsung Software R&D Center
--
