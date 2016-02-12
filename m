From: Inki Dae <inki.dae@samsung.com>
Subject: Re: [PATCH] drm/exynos/decon: fix disable clocks order
Date: Fri, 12 Feb 2016 15:41:44 +0900
Message-ID: <56BD7EA8.3050408@samsung.com>
References: <1455189904-29167-1-git-send-email-a.hajda@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:44965 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750761AbcBLGlq (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 12 Feb 2016 01:41:46 -0500
Received: from epcpsbgr2.samsung.com
 (u142.gpu120.samsung.co.kr [203.254.230.142])
 by mailout2.samsung.com (Oracle Communications Messaging Server 7.0.5.31.0
 64bit (built May  5 2014))
 with ESMTP id <0O2F01E6W99KYHB0@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 12 Feb 2016 15:41:44 +0900 (KST)
In-reply-to: <1455189904-29167-1-git-send-email-a.hajda@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Andrzej Hajda <a.hajda@samsung.com>
Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, "open list:DRM DRIVERS FOR EXYNOS" <dri-devel@lists.freedesktop.org>, "moderated list:ARM/SAMSUNG EXYNOS ARM ARCHITECTURES" <linux-samsung-soc@vger.kernel.org>

Picked it up.

Thanks,
Inki Dae

2016=EB=85=84 02=EC=9B=94 11=EC=9D=BC 20:25=EC=97=90 Andrzej Hajda =EC=9D=
=B4(=EA=B0=80) =EC=93=B4 =EA=B8=80:
> Decon requires that clocks should be disabled in reverse order. Other=
wise
> system hangs.
>=20
> Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
> ---
>  drivers/gpu/drm/exynos/exynos5433_drm_decon.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/exynos/exynos5433_drm_decon.c b/drivers/=
gpu/drm/exynos/exynos5433_drm_decon.c
> index 1bf6a21..98615e2 100644
> --- a/drivers/gpu/drm/exynos/exynos5433_drm_decon.c
> +++ b/drivers/gpu/drm/exynos/exynos5433_drm_decon.c
> @@ -582,9 +582,9 @@ out:
>  static int exynos5433_decon_suspend(struct device *dev)
>  {
>  	struct decon_context *ctx =3D dev_get_drvdata(dev);
> -	int i;
> +	int i =3D ARRAY_SIZE(decon_clks_name);
> =20
> -	for (i =3D 0; i < ARRAY_SIZE(decon_clks_name); i++)
> +	while (--i >=3D 0)
>  		clk_disable_unprepare(ctx->clks[i]);
> =20
>  	return 0;
>=20
