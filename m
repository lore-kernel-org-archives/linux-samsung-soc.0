From: Inki Dae <inki.dae@samsung.com>
Subject: Re: [PATCH 1/4] drm/exynos: dsi: support Exynos4415 SoC
Date: Thu, 13 Nov 2014 17:42:43 +0900
Message-ID: <54646F03.7000605@samsung.com>
References: <1415340747-27904-1-git-send-email-yj44.cho@samsung.com>
 <1415340747-27904-2-git-send-email-yj44.cho@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:60335 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751120AbaKMImq (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 13 Nov 2014 03:42:46 -0500
In-reply-to: <1415340747-27904-2-git-send-email-yj44.cho@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: YoungJun Cho <yj44.cho@samsung.com>
Cc: dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, mark.rutland@arm.com, pawel.moll@arm.com, ijc+devicetree@hellion.org.uk, robh+dt@kernel.org, galak@codeaurora.org, kyungmin.park@samsung.com, jy0922.shim@samsung.com, sw0312.kim@samsung.com, a.hajda@samsung.com, cw00.choi@samsung.com, kgene.kim@samsung.com

On 2014=EB=85=84 11=EC=9B=94 07=EC=9D=BC 15:12, YoungJun Cho wrote:
> This patch supports Exynos4415 SoC.
>=20

Applied.

Thanks,
Inki Dae

> Signed-off-by: YoungJun Cho <yj44.cho@samsung.com>
> Acked-by: Kyungmin Park <kyungmin.park@samsung.com>
> ---
>  Documentation/devicetree/bindings/video/exynos_dsim.txt | 1 +
>  drivers/gpu/drm/exynos/exynos_drm_dsi.c                 | 7 +++++++
>  2 files changed, 8 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/video/exynos_dsim.txt =
b/Documentation/devicetree/bindings/video/exynos_dsim.txt
> index e74243b..ca2b4aa 100644
> --- a/Documentation/devicetree/bindings/video/exynos_dsim.txt
> +++ b/Documentation/devicetree/bindings/video/exynos_dsim.txt
> @@ -4,6 +4,7 @@ Required properties:
>    - compatible: value should be one of the following
>  		"samsung,exynos3250-mipi-dsi" /* for Exynos3250/3472 SoCs */
>  		"samsung,exynos4210-mipi-dsi" /* for Exynos4 SoCs */
> +		"samsung,exynos4415-mipi-dsi" /* for Exynos4415 SoC */
>  		"samsung,exynos5410-mipi-dsi" /* for Exynos5410/5420/5440 SoCs */
>    - reg: physical base address and length of the registers set for t=
he device
>    - interrupts: should contain DSI interrupt
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_dsi.c b/drivers/gpu/dr=
m/exynos/exynos_drm_dsi.c
> index acf7e9e..ff17c6e 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
> @@ -316,6 +316,11 @@ static struct exynos_dsi_driver_data exynos4_dsi=
_driver_data =3D {
>  	.has_clklane_stop =3D 1,
>  };
> =20
> +static struct exynos_dsi_driver_data exynos4415_dsi_driver_data =3D =
{
> +	.plltmr_reg =3D 0x58,
> +	.has_clklane_stop =3D 1,
> +};
> +
>  static struct exynos_dsi_driver_data exynos5_dsi_driver_data =3D {
>  	.plltmr_reg =3D 0x58,
>  };
> @@ -325,6 +330,8 @@ static struct of_device_id exynos_dsi_of_match[] =
=3D {
>  	  .data =3D &exynos3_dsi_driver_data },
>  	{ .compatible =3D "samsung,exynos4210-mipi-dsi",
>  	  .data =3D &exynos4_dsi_driver_data },
> +	{ .compatible =3D "samsung,exynos4415-mipi-dsi",
> +	  .data =3D &exynos4415_dsi_driver_data },
>  	{ .compatible =3D "samsung,exynos5410-mipi-dsi",
>  	  .data =3D &exynos5_dsi_driver_data },
>  	{ }
>=20
