From: =?EUC-KR?B?sei9wr/s?= <sw0312.kim@samsung.com>
Subject: Re: [PATCH v3 2/3] drm/exynos: add support for exynos5420 mixer
Date: Thu, 20 Jun 2013 11:03:17 +0900
Message-ID: <51C262E5.6050605@samsung.com>
References: <1371646269-21880-1-git-send-email-rahul.sharma@samsung.com>
 <1371646269-21880-3-git-send-email-rahul.sharma@samsung.com>
Reply-To: sw0312.kim@samsung.com
Mime-Version: 1.0
Content-Type: text/plain; charset=EUC-KR
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:59638 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S935237Ab3FTCDN convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 19 Jun 2013 22:03:13 -0400
Received: from epcpsbgr5.samsung.com
 (u145.gpu120.samsung.co.kr [203.254.230.145])
 by mailout4.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MOO00L9W5OVQKB0@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 20 Jun 2013 11:03:11 +0900 (KST)
In-reply-to: <1371646269-21880-3-git-send-email-rahul.sharma@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Rahul Sharma <rahul.sharma@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, dri-devel@lists.freedesktop.org, kgene.kim@samsung.com, inki.dae@samsung.com, seanpaul@chromium.org, l.stach@pengutronix.de, tomasz.figa@gmail.com, rob.herring@calxeda.com, s.nawrocki@samsung.com, grant.likely@linaro.org, joshi@samsung.com, r.sh.open@gmail.com, Seung-Woo Kim <sw0312.kim@samsung.com>

Hello Rahul,

This patch is exactly same with v2 2/4 and only rebased on v3 1/3, so m=
y
ack is valid for this patch.

On 2013=B3=E2 06=BF=F9 19=C0=CF 21:51, Rahul Sharma wrote:
> Add support for exynos5420 mixer IP in the drm mixer driver.
>=20
> Signed-off-by: Rahul Sharma <rahul.sharma@samsung.com>

Acked-by: Seung-Woo Kim <sw0312.kim@samsung.com>

Anyway, this patch can be merged after merging [Patch v3 1/3] as like v=
2.

Best Regards,
- Seung-Woo Kim

> ---
>  .../devicetree/bindings/video/exynos_mixer.txt     |    1 +
>  drivers/gpu/drm/exynos/exynos_mixer.c              |   49 ++++++++++=
+++++-----
>  drivers/gpu/drm/exynos/regs-mixer.h                |    7 +++
>  3 files changed, 45 insertions(+), 12 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/video/exynos_mixer.txt=
 b/Documentation/devicetree/bindings/video/exynos_mixer.txt
> index 9131b99..3334b0a 100644
> --- a/Documentation/devicetree/bindings/video/exynos_mixer.txt
> +++ b/Documentation/devicetree/bindings/video/exynos_mixer.txt
> @@ -5,6 +5,7 @@ Required properties:
>  	1) "samsung,exynos5-mixer" <DEPRECATED>
>  	2) "samsung,exynos4210-mixer"
>  	3) "samsung,exynos5250-mixer"
> +	4) "samsung,exynos5420-mixer"
> =20
>  - reg: physical base address of the mixer and length of memory mappe=
d
>  	region.
> diff --git a/drivers/gpu/drm/exynos/exynos_mixer.c b/drivers/gpu/drm/=
exynos/exynos_mixer.c
> index 6225501..b1280b4 100644
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
> @@ -816,6 +828,7 @@ static void mixer_win_disable(void *ctx, int win)
> =20
>  static int mixer_check_mode(void *ctx, struct drm_display_mode *mode=
)
>  {
> +	struct mixer_context *mixer_ctx =3D ctx;
>  	u32 w, h;
> =20
>  	w =3D mode->hdisplay;
> @@ -825,6 +838,10 @@ static int mixer_check_mode(void *ctx, struct dr=
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
> @@ -1115,6 +1132,11 @@ static int vp_resources_init(struct exynos_drm=
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
> @@ -1145,6 +1167,9 @@ static struct of_device_id mixer_match_types[] =
=3D {
>  		.compatible =3D "samsung,exynos5250-mixer",
>  		.data	=3D &exynos5250_mxr_drv_data,
>  	}, {
> +		.compatible =3D "samsung,exynos5420-mixer",
> +		.data	=3D &exynos5420_mxr_drv_data,
> +	}, {
>  		/* end node */
>  	}
>  };
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
