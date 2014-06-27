From: =?ISO-8859-15?Q?Andreas_F=E4rber?= <afaerber@suse.de>
Subject: Re: [PATCH V2] drm/exynos: Support DP CLKCON register in FIMD driver
Date: Fri, 27 Jun 2014 09:46:38 +0200
Message-ID: <53AD215E.7050704@suse.de>
References: <1403793398-31593-1-git-send-email-ajaykumar.rs@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:49853 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752725AbaF0Hql (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 27 Jun 2014 03:46:41 -0400
In-Reply-To: <1403793398-31593-1-git-send-email-ajaykumar.rs@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Ajay Kumar <ajaykumar.rs@samsung.com>, dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org
Cc: inki.dae@samsung.com, seanpaul@google.com, ajaynumb@gmail.com, joshi@samsung.com, prashanth.g@samsung.com, Jingoo Han <jg1.han@samsung.com>

Am 26.06.2014 16:36, schrieb Ajay Kumar:
> Add the missing setting for DP CLKCON register.
>=20
> This register is present on Exynos5 based FIMD controllers,
> and needs to be used if we are using DP.
>=20
> Signed-off-by: Ajay Kumar <ajaykumar.rs@samsung.com>
> ---
> Changes since V1:
>  - Remove usage of driver_data to configure DP CLKCON register
>  drivers/gpu/drm/exynos/exynos_dp_core.c  | 2 ++
>  drivers/gpu/drm/exynos/exynos_drm_drv.h  | 8 ++++++++
>  drivers/gpu/drm/exynos/exynos_drm_fimd.c | 5 +++++
>  include/video/samsung_fimd.h             | 4 ++++
>  4 files changed, 19 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/exynos/exynos_dp_core.c b/drivers/gpu/dr=
m/exynos/exynos_dp_core.c
> index 2e77a15..d8868f3 100644
> --- a/drivers/gpu/drm/exynos/exynos_dp_core.c
> +++ b/drivers/gpu/drm/exynos/exynos_dp_core.c
> @@ -1336,6 +1336,8 @@ static int exynos_dp_bind(struct device *dev, s=
truct device *master, void *data)
> =20
>  	platform_set_drvdata(pdev, &exynos_dp_display);
> =20
> +	exynos_fimd_output_type =3D EXYNOS_FIMD_OUTPUT_DP;
> +
>  	return exynos_drm_create_enc_conn(drm_dev, &exynos_dp_display);
>  }
> =20
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_drv.h b/drivers/gpu/dr=
m/exynos/exynos_drm_drv.h
> index 36535f3..1089744 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_drv.h
> +++ b/drivers/gpu/drm/exynos/exynos_drm_drv.h
> @@ -60,6 +60,12 @@ enum exynos_drm_output_type {
>  	EXYNOS_DISPLAY_TYPE_VIDI,
>  };
> =20
> +enum exynos_fimd_output_type {
> +	EXYNOS_FIMD_OUTPUT_MIPI,
> +	EXYNOS_FIMD_OUTPUT_DPI,
> +	EXYNOS_FIMD_OUTPUT_DP,
> +};
> +
>  /*
>   * Exynos drm common overlay structure.
>   *
> @@ -380,4 +386,6 @@ extern struct platform_driver fimc_driver;
>  extern struct platform_driver rotator_driver;
>  extern struct platform_driver gsc_driver;
>  extern struct platform_driver ipp_driver;
> +
> +extern enum exynos_fimd_output_type exynos_fimd_output_type;
>  #endif
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_fimd.c b/drivers/gpu/d=
rm/exynos/exynos_drm_fimd.c
> index bb45ab2..a46a9c4 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_fimd.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
> @@ -90,6 +90,8 @@ static struct fimd_driver_data exynos5_fimd_driver_=
data =3D {
>  	.has_shadowcon =3D 1,
>  };
> =20
> +enum exynos_fimd_output_type exynos_fimd_output_type;

This is a non-static variable - doesn't that mean it's only ever
initialized to DP above and uninitialized in C99 otherwise? Unless I'm
missing something, the if below may trigger at random.

Regards,
Andreas

> +
>  struct fimd_win_data {
>  	unsigned int		offset_x;
>  	unsigned int		offset_y;
> @@ -331,6 +333,9 @@ static void fimd_commit(struct exynos_drm_manager=
 *mgr)
>  	if (clkdiv > 1)
>  		val |=3D VIDCON0_CLKVAL_F(clkdiv - 1) | VIDCON0_CLKDIR;
> =20
> +	if (exynos_fimd_output_type =3D=3D EXYNOS_FIMD_OUTPUT_DP)
> +		writel(DP_CLK_ENABLE, ctx->regs + DP_CLKCON);
> +
>  	writel(val, ctx->regs + VIDCON0);
>  }
> =20
> diff --git a/include/video/samsung_fimd.h b/include/video/samsung_fim=
d.h
> index b039320..d8f4b0b 100644
> --- a/include/video/samsung_fimd.h
> +++ b/include/video/samsung_fimd.h
> @@ -435,6 +435,10 @@
>  #define BLENDCON_NEW_8BIT_ALPHA_VALUE		(1 << 0)
>  #define BLENDCON_NEW_4BIT_ALPHA_VALUE		(0 << 0)
> =20
> +/* Video clock enable for DP */
> +#define DP_CLKCON				0x27C
> +#define DP_CLK_ENABLE				0x2
> +
>  /* Notes on per-window bpp settings
>   *
>   * Value	Win0	 Win1	  Win2	   Win3	    Win 4

--=20
SUSE LINUX Products GmbH, Maxfeldstr. 5, 90409 N=FCrnberg, Germany
GF: Jeff Hawn, Jennifer Guild, Felix Imend=F6rffer; HRB 16746 AG N=FCrn=
berg
