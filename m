From: Inki Dae <inki.dae@samsung.com>
Subject: Re: [PATCH] exynos/drm: fix no hdmi output
Date: Wed, 04 Feb 2015 17:35:34 +0900
Message-ID: <54D1D9D6.1030801@samsung.com>
References: <1422566320-6126-1-git-send-email-prahal@yahoo.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:36534 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932773AbbBDIfg convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 4 Feb 2015 03:35:36 -0500
In-reply-to: <1422566320-6126-1-git-send-email-prahal@yahoo.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Alban Browaeys <alban.browaeys@gmail.com>
Cc: Gustavo Padovan <gustavo.padovan@collabora.co.uk>, Joonyoung Shim <jy0922.shim@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, linux-samsung-soc@vger.kernel.org, linux-next@vger.kernel.org, Alban Browaeys <prahal@yahoo.com>

Hi,

On 2015=EB=85=84 01=EC=9B=94 30=EC=9D=BC 06:18, Alban Browaeys wrote:
> The hdmi outputs black screen only even though under the hood Xorg an=
d
> framebuffer console  are fine : devices found and initialized, but
> not a pixel out.
>=20
> Commit 93bca243ec96 ("drm/exynos: remove struct exynos_drm_manager")
> changed the call order of mixer_initialize with regards to
>  exynos_drm_crtc_create.
>=20
> This changes breaks hdmi out on Odroid U2 (linux-next with added
>  Marek Szyprowski v4 hdmi patchset from linux-samsung-soc ML).
>=20
> Restore the previous call ordering get hdmi to ouput proper pixels:
> ie call mixer_initialize first then exynos_drm_crtc_create.

Applied. Please use prefix of subject correctly, drm/exynos because you=
r
patch is filtered in my mail box.

Thanks,
Inki Dae

>=20
> Fixes: 93bca243ec96 ("drm/exynos: remove struct exynos_drm_manager")
> Signed-off-by: Alban Browaeys <prahal@yahoo.com>
> ---
>  drivers/gpu/drm/exynos/exynos_mixer.c | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/exynos/exynos_mixer.c b/drivers/gpu/drm/=
exynos/exynos_mixer.c
> index d8fd8e1..188f90f 100644
> --- a/drivers/gpu/drm/exynos/exynos_mixer.c
> +++ b/drivers/gpu/drm/exynos/exynos_mixer.c
> @@ -1258,18 +1258,19 @@ static int mixer_bind(struct device *dev, str=
uct device *manager, void *data)
>  	struct drm_device *drm_dev =3D data;
>  	int ret;
> =20
> +	ret =3D mixer_initialize(ctx, drm_dev);
> +	if (ret)
> +		return ret;
> +
>  	ctx->crtc =3D exynos_drm_crtc_create(drm_dev, ctx->pipe,
>  				     EXYNOS_DISPLAY_TYPE_HDMI,
>  				     &mixer_crtc_ops, ctx);
>  	if (IS_ERR(ctx->crtc)) {
> +		mixer_ctx_remove(ctx);
>  		ret =3D PTR_ERR(ctx->crtc);
>  		goto free_ctx;
>  	}
> =20
> -	ret =3D mixer_initialize(ctx, drm_dev);
> -	if (ret)
> -		goto free_ctx;
> -
>  	return 0;
> =20
>  free_ctx:
>=20
