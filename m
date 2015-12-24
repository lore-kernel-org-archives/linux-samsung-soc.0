From: Inki Dae <inki.dae@samsung.com>
Subject: Re: [PATCH v3 1/7] drm/exynos: rename zpos to index
Date: Thu, 24 Dec 2015 17:21:16 +0900
Message-ID: <567BAAFC.1040801@samsung.com>
References: <1450268508-15028-1-git-send-email-m.szyprowski@samsung.com>
 <1450268508-15028-2-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:34627 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751726AbbLXIV0 convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 24 Dec 2015 03:21:26 -0500
Received: from epcpsbgr4.samsung.com
 (u144.gpu120.samsung.co.kr [203.254.230.144])
 by mailout4.samsung.com (Oracle Communications Messaging Server 7.0.5.31.0
 64bit (built May  5 2014))
 with ESMTP id <0NZU02POWSJO8440@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 24 Dec 2015 17:21:24 +0900 (KST)
In-reply-to: <1450268508-15028-2-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>, dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org
Cc: Joonyoung Shim <jy0922.shim@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Andrzej Hajda <a.hajda@samsung.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Tobias Jakobi <tjakobi@math.uni-bielefeld.de>, Gustavo Padovan <gustavo@padovan.org>

Below just trivial issue,

2015=EB=85=84 12=EC=9B=94 16=EC=9D=BC 21:21=EC=97=90 Marek Szyprowski =EC=
=9D=B4(=EA=B0=80) =EC=93=B4 =EA=B8=80:
> This patch renames zpos entry to index, because in most places it is
> used as index for selecting hardware layer/window instead of
> configurable layer position. This will later enable to make the zpos
> property configurable.
>=20
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
>  drivers/gpu/drm/exynos/exynos5433_drm_decon.c | 10 +++++-----
>  drivers/gpu/drm/exynos/exynos7_drm_decon.c    | 10 +++++-----
>  drivers/gpu/drm/exynos/exynos_drm_drv.h       |  4 ++--
>  drivers/gpu/drm/exynos/exynos_drm_fimd.c      | 10 +++++-----
>  drivers/gpu/drm/exynos/exynos_drm_plane.c     |  4 ++--
>  drivers/gpu/drm/exynos/exynos_drm_plane.h     |  2 +-
>  drivers/gpu/drm/exynos/exynos_drm_vidi.c      |  2 +-
>  drivers/gpu/drm/exynos/exynos_mixer.c         | 14 +++++++-------
>  8 files changed, 28 insertions(+), 28 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/exynos/exynos5433_drm_decon.c b/drivers/=
gpu/drm/exynos/exynos5433_drm_decon.c
> index c7362b99ce28..88d022ad5280 100644
> --- a/drivers/gpu/drm/exynos/exynos5433_drm_decon.c
> +++ b/drivers/gpu/drm/exynos/exynos5433_drm_decon.c
> @@ -256,7 +256,7 @@ static void decon_atomic_begin(struct exynos_drm_=
crtc *crtc,
>  	if (test_bit(BIT_SUSPENDED, &ctx->flags))
>  		return;
> =20
> -	decon_shadow_protect_win(ctx, plane->zpos, true);
> +	decon_shadow_protect_win(ctx, plane->index, true);
>  }
> =20
>  #define BIT_VAL(x, e, s) (((x) & ((1 << ((e) - (s) + 1)) - 1)) << (s=
))
> @@ -270,7 +270,7 @@ static void decon_update_plane(struct exynos_drm_=
crtc *crtc,
>  				to_exynos_plane_state(plane->base.state);
>  	struct decon_context *ctx =3D crtc->ctx;
>  	struct drm_framebuffer *fb =3D state->base.fb;
> -	unsigned int win =3D plane->zpos;
> +	unsigned int win =3D plane->index;
>  	unsigned int bpp =3D fb->bits_per_pixel >> 3;
>  	unsigned int pitch =3D fb->pitches[0];
>  	dma_addr_t dma_addr =3D exynos_drm_fb_dma_addr(fb, 0);
> @@ -320,7 +320,7 @@ static void decon_disable_plane(struct exynos_drm=
_crtc *crtc,
>  				struct exynos_drm_plane *plane)
>  {
>  	struct decon_context *ctx =3D crtc->ctx;
> -	unsigned int win =3D plane->zpos;
> +	unsigned int win =3D plane->index;
> =20
>  	if (test_bit(BIT_SUSPENDED, &ctx->flags))
>  		return;
> @@ -344,7 +344,7 @@ static void decon_atomic_flush(struct exynos_drm_=
crtc *crtc,
>  	if (test_bit(BIT_SUSPENDED, &ctx->flags))
>  		return;
> =20
> -	decon_shadow_protect_win(ctx, plane->zpos, false);
> +	decon_shadow_protect_win(ctx, plane->index, false);
> =20
>  	if (ctx->out_type =3D=3D IFTYPE_I80)
>  		set_bit(BIT_WIN_UPDATED, &ctx->flags);
> @@ -502,7 +502,7 @@ static int decon_bind(struct device *dev, struct =
device *master, void *data)
>  		ctx->configs[win].zpos =3D win;
>  		ctx->configs[win].type =3D decon_win_types[tmp];
> =20
> -		ret =3D exynos_plane_init(drm_dev, &ctx->planes[win],
> +		ret =3D exynos_plane_init(drm_dev, &ctx->planes[win], i,

'i' isn't declared so you have to use win instead.
Please, post the patch set at least after build test.

Thanks,
Inki Dae=20
