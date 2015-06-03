From: Inki Dae <inki.dae@samsung.com>
Subject: Re: [PATCH v10 17/17] drm/exynos: split exynos_crtc->dpms in enable()
 and disable()
Date: Wed, 03 Jun 2015 16:53:23 +0900
Message-ID: <556EB273.4030803@samsung.com>
References: <1433171095-23773-1-git-send-email-gustavo@padovan.org>
 <1433171095-23773-18-git-send-email-gustavo@padovan.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:57268 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752652AbbFCHx0 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 3 Jun 2015 03:53:26 -0400
Received: from epcpsbgr5.samsung.com
 (u145.gpu120.samsung.co.kr [203.254.230.145])
 by mailout2.samsung.com (Oracle Communications Messaging Server 7.0.5.31.0
 64bit (built May  5 2014))
 with ESMTP id <0NPC00F1RZ90TNB0@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 03 Jun 2015 16:53:24 +0900 (KST)
In-reply-to: <1433171095-23773-18-git-send-email-gustavo@padovan.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Gustavo Padovan <gustavo@padovan.org>
Cc: linux-samsung-soc@vger.kernel.org, dri-devel@lists.freedesktop.org, jy0922.shim@samsung.com, tjakobi@math.uni-bielefeld.de, Gustavo Padovan <gustavo.padovan@collabora.co.uk>

Hi,

On 2015=EB=85=84 06=EC=9B=94 02=EC=9D=BC 00:04, Gustavo Padovan wrote:
> From: Gustavo Padovan <gustavo.padovan@collabora.co.uk>
>=20
> To follow more closely the new atomic API we split the dpms()
> helper into the enable() and disable() helper to get exactly the
> same semantics.
>=20
> Signed-off-by: Gustavo Padovan <gustavo.padovan@collabora.co.uk>
> ---
>  drivers/gpu/drm/exynos/exynos7_drm_decon.c | 87 ++++++--------------=
----------
>  drivers/gpu/drm/exynos/exynos_drm_crtc.c   |  8 +--
>  drivers/gpu/drm/exynos/exynos_drm_drv.h    |  6 ++-
>  drivers/gpu/drm/exynos/exynos_drm_fimd.c   | 69 +++++---------------=
----
>  drivers/gpu/drm/exynos/exynos_drm_vidi.c   | 53 +++++++-----------
>  drivers/gpu/drm/exynos/exynos_mixer.c      | 26 +++------
>  6 files changed, 62 insertions(+), 187 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/exynos/exynos7_drm_decon.c b/drivers/gpu=
/drm/exynos/exynos7_drm_decon.c
> index f29e4be..d659ba2 100644
> --- a/drivers/gpu/drm/exynos/exynos7_drm_decon.c
> +++ b/drivers/gpu/drm/exynos/exynos7_drm_decon.c
> @@ -603,75 +603,39 @@ static void decon_init(struct decon_context *ct=
x)
>  		writel(VIDCON1_VCLK_HOLD, ctx->regs + VIDCON1(0));
>  }
> =20
> -static int decon_poweron(struct decon_context *ctx)
> +static void decon_enable(struct exynos_drm_crtc *crtc)
>  {
> -	int ret;
> +	struct decon_context *ctx =3D crtc->ctx;
> =20
>  	if (!ctx->suspended)
> -		return 0;
> +		return;
> =20
>  	ctx->suspended =3D false;
> =20
>  	pm_runtime_get_sync(ctx->dev);
> =20
> -	ret =3D clk_prepare_enable(ctx->pclk);
> -	if (ret < 0) {
> -		DRM_ERROR("Failed to prepare_enable the pclk [%d]\n", ret);
> -		goto pclk_err;
> -	}
> -
> -	ret =3D clk_prepare_enable(ctx->aclk);
> -	if (ret < 0) {
> -		DRM_ERROR("Failed to prepare_enable the aclk [%d]\n", ret);
> -		goto aclk_err;
> -	}
> -
> -	ret =3D clk_prepare_enable(ctx->eclk);
> -	if  (ret < 0) {
> -		DRM_ERROR("Failed to prepare_enable the eclk [%d]\n", ret);
> -		goto eclk_err;
> -	}
> -
> -	ret =3D clk_prepare_enable(ctx->vclk);
> -	if  (ret < 0) {
> -		DRM_ERROR("Failed to prepare_enable the vclk [%d]\n", ret);
> -		goto vclk_err;
> -	}
> +	clk_prepare_enable(ctx->pclk);
> +	clk_prepare_enable(ctx->aclk);
> +	clk_prepare_enable(ctx->eclk);
> +	clk_prepare_enable(ctx->vclk);

Merged this patch series to exynos-drm-next. However, this patch
especially above codes is required for more clean-up. Even though
decon_enable function never return error number, I think its internal
codes should be considered for some exception cases to check where an
error occurred at. So could you post the clean-up patch?

Thanks,
Inki Dae

> =20
>  	decon_init(ctx);
> =20
>  	/* if vblank was enabled status, enable it again. */
> -	if (test_and_clear_bit(0, &ctx->irq_flags)) {
> -		ret =3D decon_enable_vblank(ctx->crtc);
> -		if (ret) {
> -			DRM_ERROR("Failed to re-enable vblank [%d]\n", ret);
> -			goto err;
> -		}
> -	}
> +	if (test_and_clear_bit(0, &ctx->irq_flags))
> +		decon_enable_vblank(ctx->crtc);
> =20
>  	decon_window_resume(ctx);
> =20
>  	decon_apply(ctx);
> -
> -	return 0;
> -
> -err:
> -	clk_disable_unprepare(ctx->vclk);
> -vclk_err:
> -	clk_disable_unprepare(ctx->eclk);
> -eclk_err:
> -	clk_disable_unprepare(ctx->aclk);
> -aclk_err:
> -	clk_disable_unprepare(ctx->pclk);
> -pclk_err:
> -	ctx->suspended =3D true;
> -	return ret;
>  }
> =20
> -static int decon_poweroff(struct decon_context *ctx)
> +static void decon_disable(struct exynos_drm_crtc *crtc)
>  {
> +	struct decon_context *ctx =3D crtc->ctx;
> +
>  	if (ctx->suspended)
> -		return 0;
> +		return;
> =20
>  	/*
>  	 * We need to make sure that all windows are disabled before we
> @@ -688,30 +652,11 @@ static int decon_poweroff(struct decon_context =
*ctx)
>  	pm_runtime_put_sync(ctx->dev);
> =20
>  	ctx->suspended =3D true;
> -	return 0;
> -}
> -
> -static void decon_dpms(struct exynos_drm_crtc *crtc, int mode)
> -{
> -	DRM_DEBUG_KMS("%s, %d\n", __FILE__, mode);
> -
> -	switch (mode) {
> -	case DRM_MODE_DPMS_ON:
> -		decon_poweron(crtc->ctx);
> -		break;
> -	case DRM_MODE_DPMS_STANDBY:
> -	case DRM_MODE_DPMS_SUSPEND:
> -	case DRM_MODE_DPMS_OFF:
> -		decon_poweroff(crtc->ctx);
> -		break;
> -	default:
> -		DRM_DEBUG_KMS("unspecified mode %d\n", mode);
> -		break;
> -	}
>  }
> =20
>  static const struct exynos_drm_crtc_ops decon_crtc_ops =3D {
> -	.dpms =3D decon_dpms,
> +	.enable =3D decon_enable,
> +	.disable =3D decon_disable,
>  	.mode_fixup =3D decon_mode_fixup,
>  	.commit =3D decon_commit,
>  	.enable_vblank =3D decon_enable_vblank,
> @@ -796,7 +741,7 @@ static void decon_unbind(struct device *dev, stru=
ct device *master,
>  {
>  	struct decon_context *ctx =3D dev_get_drvdata(dev);
> =20
> -	decon_dpms(ctx->crtc, DRM_MODE_DPMS_OFF);
> +	decon_disable(ctx->crtc);
> =20
>  	if (ctx->display)
>  		exynos_dpi_remove(ctx->display);
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_crtc.c b/drivers/gpu/d=
rm/exynos/exynos_drm_crtc.c
> index b7c6d51..644b4b7 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_crtc.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_crtc.c
> @@ -29,8 +29,8 @@ static void exynos_drm_crtc_enable(struct drm_crtc =
*crtc)
>  	if (exynos_crtc->enabled)
>  		return;
> =20
> -	if (exynos_crtc->ops->dpms)
> -		exynos_crtc->ops->dpms(exynos_crtc, DRM_MODE_DPMS_ON);
> +	if (exynos_crtc->ops->enable)
> +		exynos_crtc->ops->enable(exynos_crtc);
> =20
>  	exynos_crtc->enabled =3D true;
> =20
> @@ -51,8 +51,8 @@ static void exynos_drm_crtc_disable(struct drm_crtc=
 *crtc)
> =20
>  	drm_crtc_vblank_off(crtc);
> =20
> -	if (exynos_crtc->ops->dpms)
> -		exynos_crtc->ops->dpms(exynos_crtc, DRM_MODE_DPMS_OFF);
> +	if (exynos_crtc->ops->disable)
> +		exynos_crtc->ops->disable(exynos_crtc);
> =20
>  	exynos_crtc->enabled =3D false;
>  }
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_drv.h b/drivers/gpu/dr=
m/exynos/exynos_drm_drv.h
> index 86d6894..1c66f65 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_drv.h
> +++ b/drivers/gpu/drm/exynos/exynos_drm_drv.h
> @@ -157,7 +157,8 @@ struct exynos_drm_display {
>  /*
>   * Exynos drm crtc ops
>   *
> - * @dpms: control device power.
> + * @enable: enable the device
> + * @disable: disable the device
>   * @mode_fixup: fix mode data before applying it
>   * @commit: set current hw specific display mode to hw.
>   * @enable_vblank: specific driver callback for enabling vblank inte=
rrupt.
> @@ -175,7 +176,8 @@ struct exynos_drm_display {
>   */
>  struct exynos_drm_crtc;
>  struct exynos_drm_crtc_ops {
> -	void (*dpms)(struct exynos_drm_crtc *crtc, int mode);
> +	void (*enable)(struct exynos_drm_crtc *crtc);
> +	void (*disable)(struct exynos_drm_crtc *crtc);
>  	bool (*mode_fixup)(struct exynos_drm_crtc *crtc,
>  				const struct drm_display_mode *mode,
>  				struct drm_display_mode *adjusted_mode);
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_fimd.c b/drivers/gpu/d=
rm/exynos/exynos_drm_fimd.c
> index b326b31..9661853 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_fimd.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
> @@ -805,57 +805,35 @@ static void fimd_apply(struct fimd_context *ctx=
)
>  	fimd_commit(ctx->crtc);
>  }
> =20
> -static int fimd_poweron(struct fimd_context *ctx)
> +static void fimd_enable(struct exynos_drm_crtc *crtc)
>  {
> -	int ret;
> +	struct fimd_context *ctx =3D crtc->ctx;
> =20
>  	if (!ctx->suspended)
> -		return 0;
> +		return;
> =20
>  	ctx->suspended =3D false;
> =20
>  	pm_runtime_get_sync(ctx->dev);
> =20
> -	ret =3D clk_prepare_enable(ctx->bus_clk);
> -	if (ret < 0) {
> -		DRM_ERROR("Failed to prepare_enable the bus clk [%d]\n", ret);
> -		goto bus_clk_err;
> -	}
> -
> -	ret =3D clk_prepare_enable(ctx->lcd_clk);
> -	if  (ret < 0) {
> -		DRM_ERROR("Failed to prepare_enable the lcd clk [%d]\n", ret);
> -		goto lcd_clk_err;
> -	}
> +	clk_prepare_enable(ctx->bus_clk);
> +	clk_prepare_enable(ctx->lcd_clk);
> =20
>  	/* if vblank was enabled status, enable it again. */
> -	if (test_and_clear_bit(0, &ctx->irq_flags)) {
> -		ret =3D fimd_enable_vblank(ctx->crtc);
> -		if (ret) {
> -			DRM_ERROR("Failed to re-enable vblank [%d]\n", ret);
> -			goto enable_vblank_err;
> -		}
> -	}
> +	if (test_and_clear_bit(0, &ctx->irq_flags))
> +		fimd_enable_vblank(ctx->crtc);
> =20
>  	fimd_window_resume(ctx);
> =20
>  	fimd_apply(ctx);
> -
> -	return 0;
> -
> -enable_vblank_err:
> -	clk_disable_unprepare(ctx->lcd_clk);
> -lcd_clk_err:
> -	clk_disable_unprepare(ctx->bus_clk);
> -bus_clk_err:
> -	ctx->suspended =3D true;
> -	return ret;
>  }
> =20
> -static int fimd_poweroff(struct fimd_context *ctx)
> +static void fimd_disable(struct exynos_drm_crtc *crtc)
>  {
> +	struct fimd_context *ctx =3D crtc->ctx;
> +
>  	if (ctx->suspended)
> -		return 0;
> +		return;
> =20
>  	/*
>  	 * We need to make sure that all windows are disabled before we
> @@ -870,26 +848,6 @@ static int fimd_poweroff(struct fimd_context *ct=
x)
>  	pm_runtime_put_sync(ctx->dev);
> =20
>  	ctx->suspended =3D true;
> -	return 0;
> -}
> -
> -static void fimd_dpms(struct exynos_drm_crtc *crtc, int mode)
> -{
> -	DRM_DEBUG_KMS("%s, %d\n", __FILE__, mode);
> -
> -	switch (mode) {
> -	case DRM_MODE_DPMS_ON:
> -		fimd_poweron(crtc->ctx);
> -		break;
> -	case DRM_MODE_DPMS_STANDBY:
> -	case DRM_MODE_DPMS_SUSPEND:
> -	case DRM_MODE_DPMS_OFF:
> -		fimd_poweroff(crtc->ctx);
> -		break;
> -	default:
> -		DRM_DEBUG_KMS("unspecified mode %d\n", mode);
> -		break;
> -	}
>  }
> =20
>  static void fimd_trigger(struct device *dev)
> @@ -964,7 +922,8 @@ static void fimd_dp_clock_enable(struct exynos_dr=
m_crtc *crtc, bool enable)
>  }
> =20
>  static const struct exynos_drm_crtc_ops fimd_crtc_ops =3D {
> -	.dpms =3D fimd_dpms,
> +	.enable =3D fimd_enable,
> +	.disable =3D fimd_disable,
>  	.mode_fixup =3D fimd_mode_fixup,
>  	.commit =3D fimd_commit,
>  	.enable_vblank =3D fimd_enable_vblank,
> @@ -1051,7 +1010,7 @@ static void fimd_unbind(struct device *dev, str=
uct device *master,
>  {
>  	struct fimd_context *ctx =3D dev_get_drvdata(dev);
> =20
> -	fimd_dpms(ctx->crtc, DRM_MODE_DPMS_OFF);
> +	fimd_disable(ctx->crtc);
> =20
>  	fimd_iommu_detach_devices(ctx);
> =20
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_vidi.c b/drivers/gpu/d=
rm/exynos/exynos_drm_vidi.c
> index 63c1536..abe4ee0 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_vidi.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_vidi.c
> @@ -153,56 +153,38 @@ static void vidi_win_disable(struct exynos_drm_=
crtc *crtc, unsigned int win)
>  	/* TODO. */
>  }
> =20
> -static int vidi_power_on(struct vidi_context *ctx, bool enable)
> +static void vidi_enable(struct exynos_drm_crtc *crtc)
>  {
> +	struct vidi_context *ctx =3D crtc->ctx;
>  	struct exynos_drm_plane *plane;
>  	int i;
> =20
> -	DRM_DEBUG_KMS("%s\n", __FILE__);
> -
> -	if (enable !=3D false && enable !=3D true)
> -		return -EINVAL;
> +	mutex_lock(&ctx->lock);
> =20
> -	if (enable) {
> -		ctx->suspended =3D false;
> +	ctx->suspended =3D false;
> =20
> -		/* if vblank was enabled status, enable it again. */
> -		if (test_and_clear_bit(0, &ctx->irq_flags))
> -			vidi_enable_vblank(ctx->crtc);
> +	/* if vblank was enabled status, enable it again. */
> +	if (test_and_clear_bit(0, &ctx->irq_flags))
> +		vidi_enable_vblank(ctx->crtc);
> =20
> -		for (i =3D 0; i < WINDOWS_NR; i++) {
> -			plane =3D &ctx->planes[i];
> -			if (plane->enabled)
> -				vidi_win_commit(ctx->crtc, i);
> -		}
> -	} else {
> -		ctx->suspended =3D true;
> +	for (i =3D 0; i < WINDOWS_NR; i++) {
> +		plane =3D &ctx->planes[i];
> +		if (plane->enabled)
> +			vidi_win_commit(ctx->crtc, i);
>  	}
> =20
> -	return 0;
> +	mutex_unlock(&ctx->lock);
>  }
> =20
> -static void vidi_dpms(struct exynos_drm_crtc *crtc, int mode)
> +static void vidi_disable(struct exynos_drm_crtc *crtc)
>  {
>  	struct vidi_context *ctx =3D crtc->ctx;
> -
> -	DRM_DEBUG_KMS("%d\n", mode);
> +	struct exynos_drm_plane *plane;
> +	int i;
> =20
>  	mutex_lock(&ctx->lock);
> =20
> -	switch (mode) {
> -	case DRM_MODE_DPMS_ON:
> -		vidi_power_on(ctx, true);
> -		break;
> -	case DRM_MODE_DPMS_STANDBY:
> -	case DRM_MODE_DPMS_SUSPEND:
> -	case DRM_MODE_DPMS_OFF:
> -		vidi_power_on(ctx, false);
> -		break;
> -	default:
> -		DRM_DEBUG_KMS("unspecified mode %d\n", mode);
> -		break;
> -	}
> +	ctx->suspended =3D true;
> =20
>  	mutex_unlock(&ctx->lock);
>  }
> @@ -219,7 +201,8 @@ static int vidi_ctx_initialize(struct vidi_contex=
t *ctx,
>  }
> =20
>  static const struct exynos_drm_crtc_ops vidi_crtc_ops =3D {
> -	.dpms =3D vidi_dpms,
> +	.enable =3D vidi_enable,
> +	.disable =3D vidi_disable,
>  	.enable_vblank =3D vidi_enable_vblank,
>  	.disable_vblank =3D vidi_disable_vblank,
>  	.win_commit =3D vidi_win_commit,
> diff --git a/drivers/gpu/drm/exynos/exynos_mixer.c b/drivers/gpu/drm/=
exynos/exynos_mixer.c
> index 8874c1f..6bab717 100644
> --- a/drivers/gpu/drm/exynos/exynos_mixer.c
> +++ b/drivers/gpu/drm/exynos/exynos_mixer.c
> @@ -1027,8 +1027,9 @@ static void mixer_window_resume(struct mixer_co=
ntext *ctx)
>  	}
>  }
> =20
> -static void mixer_poweron(struct mixer_context *ctx)
> +static void mixer_enable(struct exynos_drm_crtc *crtc)
>  {
> +	struct mixer_context *ctx =3D crtc->ctx;
>  	struct mixer_resources *res =3D &ctx->mixer_res;
> =20
>  	mutex_lock(&ctx->mixer_mutex);
> @@ -1061,8 +1062,9 @@ static void mixer_poweron(struct mixer_context =
*ctx)
>  	mixer_window_resume(ctx);
>  }
> =20
> -static void mixer_poweroff(struct mixer_context *ctx)
> +static void mixer_disable(struct exynos_drm_crtc *crtc)
>  {
> +	struct mixer_context *ctx =3D crtc->ctx;
>  	struct mixer_resources *res =3D &ctx->mixer_res;
> =20
>  	mutex_lock(&ctx->mixer_mutex);
> @@ -1093,23 +1095,6 @@ static void mixer_poweroff(struct mixer_contex=
t *ctx)
>  	pm_runtime_put_sync(ctx->dev);
>  }
> =20
> -static void mixer_dpms(struct exynos_drm_crtc *crtc, int mode)
> -{
> -	switch (mode) {
> -	case DRM_MODE_DPMS_ON:
> -		mixer_poweron(crtc->ctx);
> -		break;
> -	case DRM_MODE_DPMS_STANDBY:
> -	case DRM_MODE_DPMS_SUSPEND:
> -	case DRM_MODE_DPMS_OFF:
> -		mixer_poweroff(crtc->ctx);
> -		break;
> -	default:
> -		DRM_DEBUG_KMS("unknown dpms mode: %d\n", mode);
> -		break;
> -	}
> -}
> -
>  /* Only valid for Mixer version 16.0.33.0 */
>  int mixer_check_mode(struct drm_display_mode *mode)
>  {
> @@ -1131,7 +1116,8 @@ int mixer_check_mode(struct drm_display_mode *m=
ode)
>  }
> =20
>  static const struct exynos_drm_crtc_ops mixer_crtc_ops =3D {
> -	.dpms			=3D mixer_dpms,
> +	.enable			=3D mixer_enable,
> +	.disable		=3D mixer_disable,
>  	.enable_vblank		=3D mixer_enable_vblank,
>  	.disable_vblank		=3D mixer_disable_vblank,
>  	.wait_for_vblank	=3D mixer_wait_for_vblank,
>=20
