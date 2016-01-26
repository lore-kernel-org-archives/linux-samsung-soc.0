From: Inki Dae <inki.dae@samsung.com>
Subject: Re: [PATCH] drm/exynos: fix building without CONFIG_PM_SLEEP
Date: Tue, 26 Jan 2016 15:21:41 +0900
Message-ID: <56A71075.7070606@samsung.com>
References: <9569056.LBRz4v8fSj@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:58005 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752838AbcAZGVn convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 26 Jan 2016 01:21:43 -0500
In-reply-to: <9569056.LBRz4v8fSj@wuerfel>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: Joonyoung Shim <jy0922.shim@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org

Hi Arnd,

Sorry for late.

2015=EB=85=84 11=EC=9B=94 18=EC=9D=BC 00:08=EC=97=90 Arnd Bergmann =EC=9D=
=B4(=EA=B0=80) =EC=93=B4 =EA=B8=80:
> The runtime PM operations use the suspend/resume functions
> even when CONFIG_PM_SLEEP is not set, but this now fails
> for the exynos DRM driver:
>=20
> exynos_mixer.c:1289:61: error: 'exynos_mixer_resume' undeclared here =
(not in a function)
>   SET_RUNTIME_PM_OPS(exynos_mixer_suspend, exynos_mixer_resume, NULL)
>=20
> This removes the #ifdef and instead marks the functions as
> __maybe_unused, which does the right thing in all cases and
> also looks nicer.
>=20
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> Fixes: 	 ("drm/exynos: add pm_runtime to Mixer")
>=20
> diff --git a/drivers/gpu/drm/exynos/exynos_mixer.c b/drivers/gpu/drm/=
exynos/exynos_mixer.c
> index 7498c6e76a53..fcaf71df77c1 100644
> --- a/drivers/gpu/drm/exynos/exynos_mixer.c
> +++ b/drivers/gpu/drm/exynos/exynos_mixer.c
> @@ -1230,8 +1230,7 @@ static int mixer_remove(struct platform_device =
*pdev)
>  	return 0;
>  }
> =20
> -#ifdef CONFIG_PM_SLEEP

How about just changing it to CONFIG_PM for consistency of other kms dr=
ivers?
Actually, I had modified it to PM since original auther, Gustavo Padova=
n, posted runtime pm support.
However, it seems missing this one.

Thanks,
Inki Dae

> -static int exynos_mixer_suspend(struct device *dev)
> +static int __maybe_unused exynos_mixer_suspend(struct device *dev)
>  {
>  	struct mixer_context *ctx =3D dev_get_drvdata(dev);
>  	struct mixer_resources *res =3D &ctx->mixer_res;
> @@ -1247,7 +1246,7 @@ static int exynos_mixer_suspend(struct device *=
dev)
>  	return 0;
>  }
> =20
> -static int exynos_mixer_resume(struct device *dev)
> +static int __maybe_unused exynos_mixer_resume(struct device *dev)
>  {
>  	struct mixer_context *ctx =3D dev_get_drvdata(dev);
>  	struct mixer_resources *res =3D &ctx->mixer_res;
> @@ -1283,7 +1282,6 @@ static int exynos_mixer_resume(struct device *d=
ev)
> =20
>  	return 0;
>  }
> -#endif
> =20
>  static const struct dev_pm_ops exynos_mixer_pm_ops =3D {
>  	SET_RUNTIME_PM_OPS(exynos_mixer_suspend, exynos_mixer_resume, NULL)
>=20
>=20
