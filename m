From: Inki Dae <inki.dae@samsung.com>
Subject: Re: [PATCH v2] drm/exynos: add error messages if clks failed to get
 enabled
Date: Thu, 11 Jun 2015 23:12:10 +0900
Message-ID: <5579973A.8010900@samsung.com>
References: <1433341832-2686-1-git-send-email-gustavo@padovan.org>
 <1433362636-10975-1-git-send-email-gustavo@padovan.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:39574 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754706AbbFKOMM (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 11 Jun 2015 10:12:12 -0400
Received: from epcpsbgr1.samsung.com
 (u141.gpu120.samsung.co.kr [203.254.230.141])
 by mailout1.samsung.com (Oracle Communications Messaging Server 7.0.5.31.0
 64bit (built May  5 2014))
 with ESMTP id <0NPS02PZQA420N90@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 11 Jun 2015 23:12:02 +0900 (KST)
In-reply-to: <1433362636-10975-1-git-send-email-gustavo@padovan.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Gustavo Padovan <gustavo@padovan.org>
Cc: linux-samsung-soc@vger.kernel.org, dri-devel@lists.freedesktop.org, jy0922.shim@samsung.com, tjakobi@math.uni-bielefeld.de, Gustavo Padovan <gustavo.padovan@collabora.co.uk>

On 2015=EB=85=84 06=EC=9B=94 04=EC=9D=BC 05:17, Gustavo Padovan wrote:
> From: Gustavo Padovan <gustavo.padovan@collabora.co.uk>
>=20
> Check error and call DRM_ERROR if clk_prepare_enable() fails.

Applied.

Thanks,
Inki Dae

>=20
> Signed-off-by: Gustavo Padovan <gustavo.padovan@collabora.co.uk>
> ---
>  drivers/gpu/drm/exynos/exynos7_drm_decon.c | 28 ++++++++++++++++++++=
+++----
>  drivers/gpu/drm/exynos/exynos_drm_fimd.c   | 14 ++++++++++++--
>  drivers/gpu/drm/exynos/exynos_mixer.c      | 31 ++++++++++++++++++++=
+++++-----
>  3 files changed, 62 insertions(+), 11 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/exynos/exynos7_drm_decon.c b/drivers/gpu=
/drm/exynos/exynos7_drm_decon.c
> index d659ba2..d9798e2 100644
> --- a/drivers/gpu/drm/exynos/exynos7_drm_decon.c
> +++ b/drivers/gpu/drm/exynos/exynos7_drm_decon.c
> @@ -606,6 +606,7 @@ static void decon_init(struct decon_context *ctx)
>  static void decon_enable(struct exynos_drm_crtc *crtc)
>  {
>  	struct decon_context *ctx =3D crtc->ctx;
> +	int ret;
> =20
>  	if (!ctx->suspended)
>  		return;
> @@ -614,10 +615,29 @@ static void decon_enable(struct exynos_drm_crtc=
 *crtc)
> =20
>  	pm_runtime_get_sync(ctx->dev);
> =20
> -	clk_prepare_enable(ctx->pclk);
> -	clk_prepare_enable(ctx->aclk);
> -	clk_prepare_enable(ctx->eclk);
> -	clk_prepare_enable(ctx->vclk);
> +	ret =3D clk_prepare_enable(ctx->pclk);
> +	if (ret < 0) {
> +		DRM_ERROR("Failed to prepare_enable the pclk [%d]\n", ret);
> +		return;
> +	}
> +
> +	ret =3D clk_prepare_enable(ctx->aclk);
> +	if (ret < 0) {
> +		DRM_ERROR("Failed to prepare_enable the aclk [%d]\n", ret);
> +		return;
> +	}
> +
> +	ret =3D clk_prepare_enable(ctx->eclk);
> +	if  (ret < 0) {
> +		DRM_ERROR("Failed to prepare_enable the eclk [%d]\n", ret);
> +		return;
> +	}
> +
> +	ret =3D clk_prepare_enable(ctx->vclk);
> +	if  (ret < 0) {
> +		DRM_ERROR("Failed to prepare_enable the vclk [%d]\n", ret);
> +		return;
> +	}
> =20
>  	decon_init(ctx);
> =20
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_fimd.c b/drivers/gpu/d=
rm/exynos/exynos_drm_fimd.c
> index 9661853..7c8ba61 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_fimd.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
> @@ -808,6 +808,7 @@ static void fimd_apply(struct fimd_context *ctx)
>  static void fimd_enable(struct exynos_drm_crtc *crtc)
>  {
>  	struct fimd_context *ctx =3D crtc->ctx;
> +	int ret;
> =20
>  	if (!ctx->suspended)
>  		return;
> @@ -816,8 +817,17 @@ static void fimd_enable(struct exynos_drm_crtc *=
crtc)
> =20
>  	pm_runtime_get_sync(ctx->dev);
> =20
> -	clk_prepare_enable(ctx->bus_clk);
> -	clk_prepare_enable(ctx->lcd_clk);
> +	ret =3D clk_prepare_enable(ctx->bus_clk);
> +	if (ret < 0) {
> +		DRM_ERROR("Failed to prepare_enable the bus clk [%d]\n", ret);
> +		return;
> +	}
> +
> +	ret =3D clk_prepare_enable(ctx->lcd_clk);
> +	if  (ret < 0) {
> +		DRM_ERROR("Failed to prepare_enable the lcd clk [%d]\n", ret);
> +		return;
> +	}
> =20
>  	/* if vblank was enabled status, enable it again. */
>  	if (test_and_clear_bit(0, &ctx->irq_flags))
> diff --git a/drivers/gpu/drm/exynos/exynos_mixer.c b/drivers/gpu/drm/=
exynos/exynos_mixer.c
> index 6bab717..1b77fc7 100644
> --- a/drivers/gpu/drm/exynos/exynos_mixer.c
> +++ b/drivers/gpu/drm/exynos/exynos_mixer.c
> @@ -1031,6 +1031,7 @@ static void mixer_enable(struct exynos_drm_crtc=
 *crtc)
>  {
>  	struct mixer_context *ctx =3D crtc->ctx;
>  	struct mixer_resources *res =3D &ctx->mixer_res;
> +	int ret;
> =20
>  	mutex_lock(&ctx->mixer_mutex);
>  	if (ctx->powered) {
> @@ -1042,12 +1043,32 @@ static void mixer_enable(struct exynos_drm_cr=
tc *crtc)
> =20
>  	pm_runtime_get_sync(ctx->dev);
> =20
> -	clk_prepare_enable(res->mixer);
> -	clk_prepare_enable(res->hdmi);
> +	ret =3D clk_prepare_enable(res->mixer);
> +	if (ret < 0) {
> +		DRM_ERROR("Failed to prepare_enable the mixer clk [%d]\n", ret);
> +		return;
> +	}
> +	ret =3D clk_prepare_enable(res->hdmi);
> +	if (ret < 0) {
> +		DRM_ERROR("Failed to prepare_enable the hdmi clk [%d]\n", ret);
> +		return;
> +	}
>  	if (ctx->vp_enabled) {
> -		clk_prepare_enable(res->vp);
> -		if (ctx->has_sclk)
> -			clk_prepare_enable(res->sclk_mixer);
> +		ret =3D clk_prepare_enable(res->vp);
> +		if (ret < 0) {
> +			DRM_ERROR("Failed to prepare_enable the vp clk [%d]\n",
> +				  ret);
> +			return;
> +		}
> +		if (ctx->has_sclk) {
> +			ret =3D clk_prepare_enable(res->sclk_mixer);
> +			if (ret < 0) {
> +				DRM_ERROR("Failed to prepare_enable the " \
> +					   "sclk_mixer clk [%d]\n",
> +					  ret);
> +				return;
> +			}
> +		}
>  	}
> =20
>  	mutex_lock(&ctx->mixer_mutex);
>=20
