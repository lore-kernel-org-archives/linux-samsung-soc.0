From: Inki Dae <inki.dae@samsung.com>
Subject: Re: [PATCH 1/2] drm/exynos: add exynos5420 support for fimd
Date: Tue, 23 Feb 2016 19:46:13 +0900
Message-ID: <56CC3875.6060109@samsung.com>
References: <1455283900-6913-1-git-send-email-chanho61.park@samsung.com>
 <1455283900-6913-2-git-send-email-chanho61.park@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:45077 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752143AbcBWKqP (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 23 Feb 2016 05:46:15 -0500
Received: from epcpsbgr4.samsung.com
 (u144.gpu120.samsung.co.kr [203.254.230.144])
 by mailout3.samsung.com (Oracle Communications Messaging Server 7.0.5.31.0
 64bit (built May  5 2014))
 with ESMTP id <0O2Z034I2XX11V50@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 23 Feb 2016 19:46:13 +0900 (KST)
In-reply-to: <1455283900-6913-2-git-send-email-chanho61.park@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Chanho Park <parkch98@gmail.com>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, linux-samsung-soc@vger.kernel.org, dri-devel@lists.freedesktop.org
Cc: Chanho Park <chanho61.park@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>

Picked it up.

Thanks,
Inki Dae

2016=EB=85=84 02=EC=9B=94 12=EC=9D=BC 22:31=EC=97=90 Chanho Park =EC=9D=
=B4(=EA=B0=80) =EC=93=B4 =EA=B8=80:
> This patch adds a exynos5420 driver data to support mic_bypass
> option to bypass the mic from display out path.
> The mic(Mobile image compressor) compresses RGB data from fimd
> and send the compressed data to the mipi dsi.
> The bypass option can be founded from system register and the bit
> is 11. The option bit has been introduced since exynos5420. The
> only difference between exynos5250 and exynos5420/exynos5422 is
> existence of the bit. Until the MIC is defined and enabled from
> device tree, the bypass mic will be default option.
>=20
> Cc: Inki Dae <inki.dae@samsung.com>
> Cc: Joonyoung Shim <jy0922.shim@samsung.com>
> Cc: Seung-Woo Kim <sw0312.kim@samsung.com>
> Signed-off-by: Chanho Park <chanho61.park@samsung.com>
> ---
>  .../bindings/display/exynos/samsung-fimd.txt       |  3 ++-
>  drivers/gpu/drm/exynos/exynos_drm_fimd.c           | 31 ++++++++++++=
+++++++++-
>  2 files changed, 32 insertions(+), 2 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/display/exynos/samsung=
-fimd.txt b/Documentation/devicetree/bindings/display/exynos/samsung-fi=
md.txt
> index 27c3ce0..c7c6b9a 100644
> --- a/Documentation/devicetree/bindings/display/exynos/samsung-fimd.t=
xt
> +++ b/Documentation/devicetree/bindings/display/exynos/samsung-fimd.t=
xt
> @@ -12,7 +12,8 @@ Required properties:
>  		"samsung,exynos3250-fimd"; /* for Exynos3250/3472 SoCs */
>  		"samsung,exynos4210-fimd"; /* for Exynos4 SoCs */
>  		"samsung,exynos4415-fimd"; /* for Exynos4415 SoC */
> -		"samsung,exynos5250-fimd"; /* for Exynos5 SoCs */
> +		"samsung,exynos5250-fimd"; /* for Exynos5250 SoCs */
> +		"samsung,exynos5420-fimd"; /* for Exynos5420/5422/5800 SoCs */
> =20
>  - reg: physical base address and length of the FIMD registers set.
> =20
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_fimd.c b/drivers/gpu/d=
rm/exynos/exynos_drm_fimd.c
> index 70194d0..41c3bb2 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_fimd.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
> @@ -94,12 +94,14 @@ struct fimd_driver_data {
>  	unsigned int lcdblk_offset;
>  	unsigned int lcdblk_vt_shift;
>  	unsigned int lcdblk_bypass_shift;
> +	unsigned int lcdblk_mic_bypass_shift;
> =20
>  	unsigned int has_shadowcon:1;
>  	unsigned int has_clksel:1;
>  	unsigned int has_limited_fmt:1;
>  	unsigned int has_vidoutcon:1;
>  	unsigned int has_vtsel:1;
> +	unsigned int has_mic_bypass:1;
>  };
> =20
>  static struct fimd_driver_data s3c64xx_fimd_driver_data =3D {
> @@ -145,6 +147,18 @@ static struct fimd_driver_data exynos5_fimd_driv=
er_data =3D {
>  	.has_vtsel =3D 1,
>  };
> =20
> +static struct fimd_driver_data exynos5420_fimd_driver_data =3D {
> +	.timing_base =3D 0x20000,
> +	.lcdblk_offset =3D 0x214,
> +	.lcdblk_vt_shift =3D 24,
> +	.lcdblk_bypass_shift =3D 15,
> +	.lcdblk_mic_bypass_shift =3D 11,
> +	.has_shadowcon =3D 1,
> +	.has_vidoutcon =3D 1,
> +	.has_vtsel =3D 1,
> +	.has_mic_bypass =3D 1,
> +};
> +
>  struct fimd_context {
>  	struct device			*dev;
>  	struct drm_device		*drm_dev;
> @@ -184,6 +198,8 @@ static const struct of_device_id fimd_driver_dt_m=
atch[] =3D {
>  	  .data =3D &exynos4415_fimd_driver_data },
>  	{ .compatible =3D "samsung,exynos5250-fimd",
>  	  .data =3D &exynos5_fimd_driver_data },
> +	{ .compatible =3D "samsung,exynos5420-fimd",
> +	  .data =3D &exynos5420_fimd_driver_data },
>  	{},
>  };
>  MODULE_DEVICE_TABLE(of, fimd_driver_dt_match);
> @@ -461,6 +477,18 @@ static void fimd_commit(struct exynos_drm_crtc *=
crtc)
>  		return;
>  	}
> =20
> +	/* TODO: When MIC is enabled for display path, the lcdblk_mic_bypas=
s
> +	 * bit should be cleared.
> +	 */
> +	if (driver_data->has_mic_bypass && ctx->sysreg &&
> +	    regmap_update_bits(ctx->sysreg,
> +				driver_data->lcdblk_offset,
> +				0x1 << driver_data->lcdblk_mic_bypass_shift,
> +				0x1 << driver_data->lcdblk_mic_bypass_shift)) {
> +		DRM_ERROR("Failed to update sysreg for bypass mic.\n");
> +		return;
> +	}
> +
>  	/* setup horizontal and vertical display size. */
>  	val =3D VIDTCON2_LINEVAL(mode->vdisplay - 1) |
>  	       VIDTCON2_HOZVAL(mode->hdisplay - 1) |
> @@ -861,7 +889,8 @@ static void fimd_dp_clock_enable(struct exynos_dr=
m_crtc *crtc, bool enable)
>  	 * clock. On these SoCs the bootloader may enable it but any
>  	 * power domain off/on will reset it to disable state.
>  	 */
> -	if (ctx->driver_data !=3D &exynos5_fimd_driver_data)
> +	if (ctx->driver_data !=3D &exynos5_fimd_driver_data ||
> +	    ctx->driver_data !=3D &exynos5420_fimd_driver_data)
>  		return;
> =20
>  	val =3D enable ? DP_MIE_CLK_DP_ENABLE : DP_MIE_CLK_DISABLE;
>=20
