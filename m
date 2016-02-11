From: Inki Dae <inki.dae@samsung.com>
Subject: Re: [PATCH] drm/exynos: add mic_bypass option for exynos542x fimd
Date: Thu, 11 Feb 2016 19:37:17 +0900
Message-ID: <56BC645D.4070902@samsung.com>
References: <1454162331-23555-1-git-send-email-parkch98@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:60597 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750977AbcBKKhU convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 11 Feb 2016 05:37:20 -0500
Received: from epcpsbgr2.samsung.com
 (u142.gpu120.samsung.co.kr [203.254.230.142])
 by mailout1.samsung.com (Oracle Communications Messaging Server 7.0.5.31.0
 64bit (built May  5 2014))
 with ESMTP id <0O2D00T2YPI5L340@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 11 Feb 2016 19:37:17 +0900 (KST)
In-reply-to: <1454162331-23555-1-git-send-email-parkch98@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Chanho Park <parkch98@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org, Chanho Park <chanho61.park@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>

Hi Chanho,

2016=EB=85=84 01=EC=9B=94 30=EC=9D=BC 22:58=EC=97=90 Chanho Park =EC=9D=
=B4(=EA=B0=80) =EC=93=B4 =EA=B8=80:
> From: Chanho Park <chanho61.park@samsung.com>
>=20
> This patch adds a mic_bypass option to bypass the mic
> from display out path. The mic(Mobile image compressor) compresses
> RGB data from fimd and send the compressed data to the mipi dsi.
> The bypass option can be founded from system register and the bit
> of the option is 11.
>=20
> Cc: Inki Dae <inki.dae@samsung.com>
> Cc: Joonyoung Shim <jy0922.shim@samsung.com>
> Cc: Seung-Woo Kim <sw0312.kim@samsung.com>
> Signed-off-by: Chanho Park <chanho61.park@samsung.com>
> ---
>  .../devicetree/bindings/display/exynos/samsung-fimd.txt    |  2 ++
>  drivers/gpu/drm/exynos/exynos_drm_fimd.c                   | 14 ++++=
++++++++++
>  2 files changed, 16 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/display/exynos/samsung=
-fimd.txt b/Documentation/devicetree/bindings/display/exynos/samsung-fi=
md.txt
> index 27c3ce0..7f90c4a 100644
> --- a/Documentation/devicetree/bindings/display/exynos/samsung-fimd.t=
xt
> +++ b/Documentation/devicetree/bindings/display/exynos/samsung-fimd.t=
xt
> @@ -45,6 +45,8 @@ Optional Properties:
>  		Can be used in case timings cannot be provided otherwise
>  		or to override timings provided by the panel.
>  - samsung,sysreg: handle to syscon used to control the system regist=
ers
> +- samsung,mic-bypass: bypass mic(mobile image compressor) from displ=
ay path.
> +		      This option is only available since exynos5420.
>  - i80-if-timings: timing configuration for lcd i80 interface support=
=2E
>    - cs-setup: clock cycles for the active period of address signal i=
s enabled
>                until chip select is enabled.
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_fimd.c b/drivers/gpu/d=
rm/exynos/exynos_drm_fimd.c
> index 70194d0..4fb2952 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_fimd.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
> @@ -94,6 +94,7 @@ struct fimd_driver_data {
>  	unsigned int lcdblk_offset;
>  	unsigned int lcdblk_vt_shift;
>  	unsigned int lcdblk_bypass_shift;
> +	unsigned int lcdblk_mic_bypass_shift;
> =20
>  	unsigned int has_shadowcon:1;
>  	unsigned int has_clksel:1;
> @@ -140,6 +141,7 @@ static struct fimd_driver_data exynos5_fimd_drive=
r_data =3D {
>  	.lcdblk_offset =3D 0x214,
>  	.lcdblk_vt_shift =3D 24,
>  	.lcdblk_bypass_shift =3D 15,
> +	.lcdblk_mic_bypass_shift =3D 11,
>  	.has_shadowcon =3D 1,
>  	.has_vidoutcon =3D 1,
>  	.has_vtsel =3D 1,
> @@ -162,6 +164,7 @@ struct fimd_context {
>  	u32				i80ifcon;
>  	bool				i80_if;
>  	bool				suspended;
> +	bool				mic_bypass;
>  	int				pipe;
>  	wait_queue_head_t		wait_vsync_queue;
>  	atomic_t			wait_vsync_event;
> @@ -461,6 +464,14 @@ static void fimd_commit(struct exynos_drm_crtc *=
crtc)
>  		return;
>  	}
> =20
> +	if (ctx->mic_bypass && ctx->sysreg && regmap_update_bits(ctx->sysre=
g,
> +				driver_data->lcdblk_offset,
> +				0x1 << driver_data->lcdblk_mic_bypass_shift,
> +				0x1 << driver_data->lcdblk_mic_bypass_shift)) {
> +		DRM_ERROR("Failed to update sysreg for bypass mic.\n");
> +		return;
> +	}

It'd better to consider mic path also because mic bypass bit of lcdblk =
could be true by bootloader. In this case, fimd driver wouldn't do anyt=
hing if mic_bypass property isn't declared but the mic_bypass bit of lc=
dblk register is still set to 1.

=46or this, I think you could check lcdblk_mic_pypass_shift to identify=
 whether mic path is supported or not like below,
if (ctx->lcdblk_mic_bypass_shift) {
	if (ctx->sysreg && regmap_update_bits(ctx->sysreg,
					driver_data->lcdblk_offset,
					ctx->mic_bypass << driver_data->lcdblk_mic_bypass_shift,
					ctx->mic_bypass << driver_data->lcdblk_mic_bypass_shift)) {
		...	=09
	}
}
=09
Thanks,
Inki Dae

> +
>  	/* setup horizontal and vertical display size. */
>  	val =3D VIDTCON2_LINEVAL(mode->vdisplay - 1) |
>  	       VIDTCON2_HOZVAL(mode->hdisplay - 1) |
> @@ -1014,6 +1025,9 @@ static int fimd_probe(struct platform_device *p=
dev)
>  	if (of_property_read_bool(dev->of_node, "samsung,invert-vclk"))
>  		ctx->vidcon1 |=3D VIDCON1_INV_VCLK;
> =20
> +	if (of_property_read_bool(dev->of_node, "samsung,mic-bypass"))
> +		ctx->mic_bypass =3D true;
> +
>  	i80_if_timings =3D of_get_child_by_name(dev->of_node, "i80-if-timin=
gs");
>  	if (i80_if_timings) {
>  		u32 val;
>=20
