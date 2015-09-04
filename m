From: Inki Dae <inki.dae@samsung.com>
Subject: Re: [PATCH] drm/exynos: add cursor plane support
Date: Fri, 04 Sep 2015 13:05:35 +0900
Message-ID: <55E9188F.5040601@samsung.com>
References: <1441311297-5083-1-git-send-email-gustavo@padovan.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:40783 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752584AbbIDEFi (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 4 Sep 2015 00:05:38 -0400
Received: from epcpsbgr1.samsung.com
 (u141.gpu120.samsung.co.kr [203.254.230.141])
 by mailout2.samsung.com (Oracle Communications Messaging Server 7.0.5.31.0
 64bit (built May  5 2014))
 with ESMTP id <0NU401RWHWPCYZA0@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 04 Sep 2015 13:05:36 +0900 (KST)
In-reply-to: <1441311297-5083-1-git-send-email-gustavo@padovan.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Gustavo Padovan <gustavo@padovan.org>, linux-samsung-soc@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, jy0922.shim@samsung.com, tjakobi@math.uni-bielefeld.de, Gustavo Padovan <gustavo.padovan@collabora.co.uk>

Hi Gustavo,

I had already a review but I didn't give any comment to you. Sorry abou=
t
that. This patch looks good to me but one thing isn't clear. Below is m=
y
comment.


On 2015=EB=85=84 09=EC=9B=94 04=EC=9D=BC 05:14, Gustavo Padovan wrote:
> From: Gustavo Padovan <gustavo.padovan@collabora.co.uk>
>=20
> Set one of the planes for each crtc driver as a cursor plane enabled
> window managers to fully work on exynos.
>=20
> Signed-off-by: Gustavo Padovan <gustavo.padovan@collabora.co.uk>
> ---
>  drivers/gpu/drm/exynos/exynos5433_drm_decon.c |  9 ++-------
>  drivers/gpu/drm/exynos/exynos7_drm_decon.c    |  8 ++------
>  drivers/gpu/drm/exynos/exynos_drm_drv.h       |  3 +++
>  drivers/gpu/drm/exynos/exynos_drm_fimd.c      |  8 ++------
>  drivers/gpu/drm/exynos/exynos_drm_plane.c     | 18 +++++++++++++++--=
-
>  drivers/gpu/drm/exynos/exynos_drm_plane.h     |  5 ++---
>  drivers/gpu/drm/exynos/exynos_drm_vidi.c      |  9 ++-------
>  drivers/gpu/drm/exynos/exynos_mixer.c         | 10 +++-------
>  8 files changed, 31 insertions(+), 39 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/exynos/exynos5433_drm_decon.c b/drivers/=
gpu/drm/exynos/exynos5433_drm_decon.c
> index b3c7307..79b2b22 100644
> --- a/drivers/gpu/drm/exynos/exynos5433_drm_decon.c
> +++ b/drivers/gpu/drm/exynos/exynos5433_drm_decon.c
> @@ -33,7 +33,6 @@ struct decon_context {
>  	struct exynos_drm_plane		planes[WINDOWS_NR];
>  	void __iomem			*addr;
>  	struct clk			*clks[6];
> -	unsigned int			default_win;
>  	unsigned long			irq_flags;
>  	int				pipe;
>  	bool				suspended;
> @@ -493,7 +492,6 @@ static int decon_bind(struct device *dev, struct =
device *master, void *data)
>  	struct drm_device *drm_dev =3D data;
>  	struct exynos_drm_private *priv =3D drm_dev->dev_private;
>  	struct exynos_drm_plane *exynos_plane;
> -	enum drm_plane_type type;
>  	unsigned int zpos;
>  	int ret;
> =20
> @@ -501,16 +499,14 @@ static int decon_bind(struct device *dev, struc=
t device *master, void *data)
>  	ctx->pipe =3D priv->pipe++;
> =20
>  	for (zpos =3D 0; zpos < WINDOWS_NR; zpos++) {
> -		type =3D (zpos =3D=3D ctx->default_win) ? DRM_PLANE_TYPE_PRIMARY :
> -							DRM_PLANE_TYPE_OVERLAY;
>  		ret =3D exynos_plane_init(drm_dev, &ctx->planes[zpos],
> -				1 << ctx->pipe, type, decon_formats,
> +				1 << ctx->pipe, decon_formats,
>  				ARRAY_SIZE(decon_formats), zpos);
>  		if (ret)
>  			return ret;
>  	}
> =20
> -	exynos_plane =3D &ctx->planes[ctx->default_win];
> +	exynos_plane =3D &ctx->planes[DEFAULT_WIN];
>  	ctx->crtc =3D exynos_drm_crtc_create(drm_dev, &exynos_plane->base,
>  					ctx->pipe, EXYNOS_DISPLAY_TYPE_LCD,
>  					&decon_crtc_ops, ctx);
> @@ -607,7 +603,6 @@ static int exynos5433_decon_probe(struct platform=
_device *pdev)
>  	if (!ctx)
>  		return -ENOMEM;
> =20
> -	ctx->default_win =3D 0;
>  	ctx->suspended =3D true;
>  	ctx->dev =3D dev;
>  	if (of_get_child_by_name(dev->of_node, "i80-if-timings"))
> diff --git a/drivers/gpu/drm/exynos/exynos7_drm_decon.c b/drivers/gpu=
/drm/exynos/exynos7_drm_decon.c
> index cbdb78e..f3826dc 100644
> --- a/drivers/gpu/drm/exynos/exynos7_drm_decon.c
> +++ b/drivers/gpu/drm/exynos/exynos7_drm_decon.c
> @@ -52,7 +52,6 @@ struct decon_context {
>  	struct clk			*eclk;
>  	struct clk			*vclk;
>  	void __iomem			*regs;
> -	unsigned int			default_win;
>  	unsigned long			irq_flags;
>  	bool				i80_if;
>  	bool				suspended;
> @@ -691,7 +690,6 @@ static int decon_bind(struct device *dev, struct =
device *master, void *data)
>  	struct decon_context *ctx =3D dev_get_drvdata(dev);
>  	struct drm_device *drm_dev =3D data;
>  	struct exynos_drm_plane *exynos_plane;
> -	enum drm_plane_type type;
>  	unsigned int zpos;
>  	int ret;
> =20
> @@ -702,16 +700,14 @@ static int decon_bind(struct device *dev, struc=
t device *master, void *data)
>  	}
> =20
>  	for (zpos =3D 0; zpos < WINDOWS_NR; zpos++) {
> -		type =3D (zpos =3D=3D ctx->default_win) ? DRM_PLANE_TYPE_PRIMARY :
> -						DRM_PLANE_TYPE_OVERLAY;
>  		ret =3D exynos_plane_init(drm_dev, &ctx->planes[zpos],
> -					1 << ctx->pipe, type, decon_formats,
> +					1 << ctx->pipe, decon_formats,
>  					ARRAY_SIZE(decon_formats), zpos);
>  		if (ret)
>  			return ret;
>  	}
> =20
> -	exynos_plane =3D &ctx->planes[ctx->default_win];
> +	exynos_plane =3D &ctx->planes[DEFAULT_WIN];
>  	ctx->crtc =3D exynos_drm_crtc_create(drm_dev, &exynos_plane->base,
>  					   ctx->pipe, EXYNOS_DISPLAY_TYPE_LCD,
>  					   &decon_crtc_ops, ctx);
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_drv.h b/drivers/gpu/dr=
m/exynos/exynos_drm_drv.h
> index b7ba21d..cc56c3d 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_drv.h
> +++ b/drivers/gpu/drm/exynos/exynos_drm_drv.h
> @@ -22,6 +22,9 @@
>  #define MAX_PLANE	5
>  #define MAX_FB_BUFFER	4
> =20
> +#define DEFAULT_WIN	0
> +#define CURSOR_WIN	1

You fixed overlay number for cursor with 1. However, Display controller=
s
of Exynos SoC have fixed overlay priority like this,

win 4 > win 3 > win 2 > win 1 > win 0 so if we fix the overlay number
for cursor and we use another overlay - which has a higher layer than
cursor - to display caption or UI then the we couldn't see the cursor o=
n
screen without additional work such as color key or alpha channel.

So before that, you need to check how many overlays can be used
according to Exynos SoC versions, and which way is better - one is for
top layer to be fixed for cursor, other is for one given layer to be
fixed by user-space for cursor.

Thanks,
Inki Dae

> +
