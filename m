From: Inki Dae <inki.dae@samsung.com>
Subject: Re: [PATCH v2] drm/exynos: add has_vtsel flag
Date: Fri, 14 Nov 2014 11:56:45 +0900
Message-ID: <54656F6D.1040108@samsung.com>
References: <1415932564-16463-1-git-send-email-jy0922.shim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:65121 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S933665AbaKNC4r (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 13 Nov 2014 21:56:47 -0500
Received: from epcpsbgr1.samsung.com
 (u141.gpu120.samsung.co.kr [203.254.230.141])
 by mailout3.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0NF0004MFDIMC8B0@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 14 Nov 2014 11:56:46 +0900 (KST)
In-reply-to: <1415932564-16463-1-git-send-email-jy0922.shim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Joonyoung Shim <jy0922.shim@samsung.com>
Cc: dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org, sw0312.kim@samsung.com, yj44.cho@samsung.com

On 2014=EB=85=84 11=EC=9B=94 14=EC=9D=BC 11:36, Joonyoung Shim wrote:
> The exynos fimd provides video type selection bits from system regist=
er
> but exynos3 series don't has it, so needs has_vtsel flag and we can
> distinguish whether set video type selection bits.

Applied.

Thanks,
Inki Dae

>=20
> Signed-off-by: Joonyoung Shim <jy0922.shim@samsung.com>
> ---
> Changelog from v1:
> - rebase on latest exynos-drm-next branch
> - add has_vtsel for exynos4415
>=20
>  drivers/gpu/drm/exynos/exynos_drm_fimd.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_fimd.c b/drivers/gpu/d=
rm/exynos/exynos_drm_fimd.c
> index 5cc57f7..93b263e 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_fimd.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
> @@ -96,6 +96,7 @@ struct fimd_driver_data {
>  	unsigned int has_clksel:1;
>  	unsigned int has_limited_fmt:1;
>  	unsigned int has_vidoutcon:1;
> +	unsigned int has_vtsel:1;
>  };
> =20
>  static struct fimd_driver_data s3c64xx_fimd_driver_data =3D {
> @@ -118,6 +119,7 @@ static struct fimd_driver_data exynos4_fimd_drive=
r_data =3D {
>  	.lcdblk_vt_shift =3D 10,
>  	.lcdblk_bypass_shift =3D 1,
>  	.has_shadowcon =3D 1,
> +	.has_vtsel =3D 1,
>  };
> =20
>  static struct fimd_driver_data exynos4415_fimd_driver_data =3D {
> @@ -127,6 +129,7 @@ static struct fimd_driver_data exynos4415_fimd_dr=
iver_data =3D {
>  	.lcdblk_bypass_shift =3D 1,
>  	.has_shadowcon =3D 1,
>  	.has_vidoutcon =3D 1,
> +	.has_vtsel =3D 1,
>  };
> =20
>  static struct fimd_driver_data exynos5_fimd_driver_data =3D {
> @@ -136,6 +139,7 @@ static struct fimd_driver_data exynos5_fimd_drive=
r_data =3D {
>  	.lcdblk_bypass_shift =3D 15,
>  	.has_shadowcon =3D 1,
>  	.has_vidoutcon =3D 1,
> +	.has_vtsel =3D 1,
>  };
> =20
>  struct fimd_win_data {
> @@ -354,7 +358,8 @@ static void fimd_commit(struct exynos_drm_manager=
 *mgr)
>  		writel(0, timing_base + I80IFCONFBx(0));
> =20
>  		/* set video type selection to I80 interface */
> -		if (ctx->sysreg && regmap_update_bits(ctx->sysreg,
> +		if (driver_data->has_vtsel && ctx->sysreg &&
> +				regmap_update_bits(ctx->sysreg,
>  					driver_data->lcdblk_offset,
>  					0x3 << driver_data->lcdblk_vt_shift,
>  					0x1 << driver_data->lcdblk_vt_shift)) {
>=20
