From: Inki Dae <inki.dae@samsung.com>
Subject: Re: [PATCH] drm/exynos: support exynos5422 mipi-dsi
Date: Thu, 11 Feb 2016 20:07:05 +0900
Message-ID: <56BC6B59.9080705@samsung.com>
References: <1454163110-20103-1-git-send-email-parkch98@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:43063 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751407AbcBKLHH (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 11 Feb 2016 06:07:07 -0500
Received: from epcpsbgr4.samsung.com
 (u144.gpu120.samsung.co.kr [203.254.230.144])
 by mailout2.samsung.com (Oracle Communications Messaging Server 7.0.5.31.0
 64bit (built May  5 2014))
 with ESMTP id <0O2D00L62QVT4320@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 11 Feb 2016 20:07:05 +0900 (KST)
In-reply-to: <1454163110-20103-1-git-send-email-parkch98@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Chanho Park <parkch98@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org, Chanho Park <chanho61.park@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>

Hi Chanho,

2016=EB=85=84 01=EC=9B=94 30=EC=9D=BC 23:11=EC=97=90 Chanho Park =EC=9D=
=B4(=EA=B0=80) =EC=93=B4 =EA=B8=80:
> From: Chanho Park <chanho61.park@samsung.com>
>=20
> This patch supports mipi dsi for exynos5422. The dsi register
> offsets of the exynos5422 are similar with exynos5433. However,
> the values of the registers are quite different from the
> exynos5433. For example, the exynos5422 uses sw reset like
> previous chips.

Picked it up.

Thanks,
Inki Dae

>=20
> Cc: Inki Dae <inki.dae@samsung.com>
> Cc: Joonyoung Shim <jy0922.shim@samsung.com>
> Cc: Seung-Woo Kim <sw0312.kim@samsung.com>
> Signed-off-by: Chanho Park <chanho61.park@samsung.com>
> ---
>  .../bindings/display/exynos/exynos_dsim.txt        |  1 +
>  drivers/gpu/drm/exynos/exynos_drm_dsi.c            | 31 ++++++++++++=
++++++++++
>  2 files changed, 32 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/display/exynos/exynos_=
dsim.txt b/Documentation/devicetree/bindings/display/exynos/exynos_dsim=
=2Etxt
> index 0e6f0c0..22756b3 100644
> --- a/Documentation/devicetree/bindings/display/exynos/exynos_dsim.tx=
t
> +++ b/Documentation/devicetree/bindings/display/exynos/exynos_dsim.tx=
t
> @@ -6,6 +6,7 @@ Required properties:
>  		"samsung,exynos4210-mipi-dsi" /* for Exynos4 SoCs */
>  		"samsung,exynos4415-mipi-dsi" /* for Exynos4415 SoC */
>  		"samsung,exynos5410-mipi-dsi" /* for Exynos5410/5420/5440 SoCs */
> +		"samsung,exynos5422-mipi-dsi" /* for Exynos5422/5800 SoCs */
>  		"samsung,exynos5433-mipi-dsi" /* for Exynos5433 SoCs */
>    - reg: physical base address and length of the registers set for t=
he device
>    - interrupts: should contain DSI interrupt
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_dsi.c b/drivers/gpu/dr=
m/exynos/exynos_drm_dsi.c
> index d84a498..3eff6bf 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
> @@ -408,6 +408,24 @@ static unsigned int reg_values[] =3D {
>  	[PHYTIMING_HS_TRAIL] =3D DSIM_PHYTIMING2_HS_TRAIL(0x0b),
>  };
> =20
> +static unsigned int exynos5422_reg_values[] =3D {
> +	[RESET_TYPE] =3D DSIM_SWRST,
> +	[PLL_TIMER] =3D 500,
> +	[STOP_STATE_CNT] =3D 0xf,
> +	[PHYCTRL_ULPS_EXIT] =3D DSIM_PHYCTRL_ULPS_EXIT(0xaf),
> +	[PHYCTRL_VREG_LP] =3D 0,
> +	[PHYCTRL_SLEW_UP] =3D 0,
> +	[PHYTIMING_LPX] =3D DSIM_PHYTIMING_LPX(0x08),
> +	[PHYTIMING_HS_EXIT] =3D DSIM_PHYTIMING_HS_EXIT(0x0d),
> +	[PHYTIMING_CLK_PREPARE] =3D DSIM_PHYTIMING1_CLK_PREPARE(0x09),
> +	[PHYTIMING_CLK_ZERO] =3D DSIM_PHYTIMING1_CLK_ZERO(0x30),
> +	[PHYTIMING_CLK_POST] =3D DSIM_PHYTIMING1_CLK_POST(0x0e),
> +	[PHYTIMING_CLK_TRAIL] =3D DSIM_PHYTIMING1_CLK_TRAIL(0x0a),
> +	[PHYTIMING_HS_PREPARE] =3D DSIM_PHYTIMING2_HS_PREPARE(0x0c),
> +	[PHYTIMING_HS_ZERO] =3D DSIM_PHYTIMING2_HS_ZERO(0x11),
> +	[PHYTIMING_HS_TRAIL] =3D DSIM_PHYTIMING2_HS_TRAIL(0x0d),
> +};
> +
>  static unsigned int exynos5433_reg_values[] =3D {
>  	[RESET_TYPE] =3D DSIM_FUNCRST,
>  	[PLL_TIMER] =3D 22200,
> @@ -482,6 +500,17 @@ static struct exynos_dsi_driver_data exynos5433_=
dsi_driver_data =3D {
>  	.reg_values =3D exynos5433_reg_values,
>  };
> =20
> +static struct exynos_dsi_driver_data exynos5422_dsi_driver_data =3D =
{
> +	.reg_ofs =3D exynos5433_reg_ofs,
> +	.plltmr_reg =3D 0xa0,
> +	.has_clklane_stop =3D 1,
> +	.num_clks =3D 2,
> +	.max_freq =3D 1500,
> +	.wait_for_reset =3D 1,
> +	.num_bits_resol =3D 12,
> +	.reg_values =3D exynos5422_reg_values,
> +};
> +
>  static struct of_device_id exynos_dsi_of_match[] =3D {
>  	{ .compatible =3D "samsung,exynos3250-mipi-dsi",
>  	  .data =3D &exynos3_dsi_driver_data },
> @@ -491,6 +520,8 @@ static struct of_device_id exynos_dsi_of_match[] =
=3D {
>  	  .data =3D &exynos4415_dsi_driver_data },
>  	{ .compatible =3D "samsung,exynos5410-mipi-dsi",
>  	  .data =3D &exynos5_dsi_driver_data },
> +	{ .compatible =3D "samsung,exynos5422-mipi-dsi",
> +	  .data =3D &exynos5422_dsi_driver_data },
>  	{ .compatible =3D "samsung,exynos5433-mipi-dsi",
>  	  .data =3D &exynos5433_dsi_driver_data },
>  	{ }
>=20
