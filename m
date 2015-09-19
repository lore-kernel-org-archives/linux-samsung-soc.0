From: Inki Dae <inki.dae@samsung.com>
Subject: Re: [PATCH 07/10] drm/exynos: add pm_runtime to FIMD
Date: Sat, 19 Sep 2015 12:53:42 +0900
Message-ID: <55FCDC46.5030601@samsung.com>
References: <1441397752-6672-1-git-send-email-gustavo@padovan.org>
 <1441397752-6672-8-git-send-email-gustavo@padovan.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:43470 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754538AbbISDxn convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 18 Sep 2015 23:53:43 -0400
Received: from epcpsbgr1.samsung.com
 (u141.gpu120.samsung.co.kr [203.254.230.141])
 by mailout1.samsung.com (Oracle Communications Messaging Server 7.0.5.31.0
 64bit (built May  5 2014))
 with ESMTP id <0NUW02IW6O5IR020@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Sat, 19 Sep 2015 12:53:42 +0900 (KST)
In-reply-to: <1441397752-6672-8-git-send-email-gustavo@padovan.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Gustavo Padovan <gustavo@padovan.org>, linux-samsung-soc@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, jy0922.shim@samsung.com, tjakobi@math.uni-bielefeld.de, Gustavo Padovan <gustavo.padovan@collabora.co.uk>

On 2015=EB=85=84 09=EC=9B=94 05=EC=9D=BC 05:15, Gustavo Padovan wrote:
> From: Gustavo Padovan <gustavo.padovan@collabora.co.uk>
>=20
> Let pm_runtime handle the enabling/disabling of the device with prope=
r
> refcnt instead of rely on specific flags to track the enabled state.
>=20
> Signed-off-by: Gustavo Padovan <gustavo.padovan@collabora.co.uk>
> ---
>  drivers/gpu/drm/exynos/exynos5433_drm_decon.c |  1 -
>  drivers/gpu/drm/exynos/exynos7_drm_decon.c    |  1 -
>  drivers/gpu/drm/exynos/exynos_drm_fimd.c      | 91 +++++++++++------=
----------
>  3 files changed, 37 insertions(+), 56 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/exynos/exynos5433_drm_decon.c b/drivers/=
gpu/drm/exynos/exynos5433_drm_decon.c
> index 79b2b22..838a9c1 100644
> --- a/drivers/gpu/drm/exynos/exynos5433_drm_decon.c
> +++ b/drivers/gpu/drm/exynos/exynos5433_drm_decon.c
> @@ -478,7 +478,6 @@ static struct exynos_drm_crtc_ops decon_crtc_ops =
=3D {
>  	.commit			=3D decon_commit,
>  	.enable_vblank		=3D decon_enable_vblank,
>  	.disable_vblank		=3D decon_disable_vblank,
> -	.commit			=3D decon_commit,

Above wouldn't be related to this patch.

>  	.atomic_begin		=3D decon_atomic_begin,
>  	.update_plane		=3D decon_update_plane,
>  	.disable_plane		=3D decon_disable_plane,
> diff --git a/drivers/gpu/drm/exynos/exynos7_drm_decon.c b/drivers/gpu=
/drm/exynos/exynos7_drm_decon.c
> index f3826dc..e4646e2 100644
> --- a/drivers/gpu/drm/exynos/exynos7_drm_decon.c
> +++ b/drivers/gpu/drm/exynos/exynos7_drm_decon.c
> @@ -637,7 +637,6 @@ static const struct exynos_drm_crtc_ops decon_crt=
c_ops =3D {
>  	.enable =3D decon_enable,
>  	.disable =3D decon_disable,
>  	.mode_fixup =3D decon_mode_fixup,
> -	.commit =3D decon_commit,

Ditto.

Thanks,
Inki Dae

>  	.enable_vblank =3D decon_enable_vblank,
>  	.disable_vblank =3D decon_disable_vblank,
>  	.wait_for_vblank =3D decon_wait_for_vblank,
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_fimd.c b/drivers/gpu/d=
rm/exynos/exynos_drm_fimd.c
> index 0bbe537..0f17ae0 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_fimd.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
> @@ -160,7 +160,6 @@ struct fimd_context {
>  	u32				vidout_con;
>  	u32				i80ifcon;
>  	bool				i80_if;
> -	bool				suspended;
>  	int				pipe;
>  	wait_queue_head_t		wait_vsync_queue;
>  	atomic_t			wait_vsync_event;
> @@ -209,9 +208,6 @@ static int fimd_enable_vblank(struct exynos_drm_c=
rtc *crtc)
>  	struct fimd_context *ctx =3D crtc->ctx;
>  	u32 val;
> =20
> -	if (ctx->suspended)
> -		return -EPERM;
> -
>  	if (!test_and_set_bit(0, &ctx->irq_flags)) {
>  		val =3D readl(ctx->regs + VIDINTCON0);
> =20
> @@ -241,9 +237,6 @@ static void fimd_disable_vblank(struct exynos_drm=
_crtc *crtc)
>  	struct fimd_context *ctx =3D crtc->ctx;
>  	u32 val;
> =20
> -	if (ctx->suspended)
> -		return;
> -
>  	if (test_and_clear_bit(0, &ctx->irq_flags)) {
>  		val =3D readl(ctx->regs + VIDINTCON0);
> =20
> @@ -264,9 +257,6 @@ static void fimd_wait_for_vblank(struct exynos_dr=
m_crtc *crtc)
>  {
>  	struct fimd_context *ctx =3D crtc->ctx;
> =20
> -	if (ctx->suspended)
> -		return;
> -
>  	atomic_set(&ctx->wait_vsync_event, 1);
> =20
>  	/*
> @@ -339,14 +329,12 @@ static void fimd_clear_channels(struct exynos_d=
rm_crtc *crtc)
>  		int pipe =3D ctx->pipe;
> =20
>  		/* ensure that vblank interrupt won't be reported to core */
> -		ctx->suspended =3D false;
>  		ctx->pipe =3D -1;
> =20
>  		fimd_enable_vblank(ctx->crtc);
>  		fimd_wait_for_vblank(ctx->crtc);
>  		fimd_disable_vblank(ctx->crtc);
> =20
> -		ctx->suspended =3D true;
>  		ctx->pipe =3D pipe;
>  	}
> =20
> @@ -394,9 +382,6 @@ static void fimd_commit(struct exynos_drm_crtc *c=
rtc)
>  	void *timing_base =3D ctx->regs + driver_data->timing_base;
>  	u32 val, clkdiv;
> =20
> -	if (ctx->suspended)
> -		return;
> -
>  	/* nothing to do if we haven't set the mode yet */
>  	if (mode->htotal =3D=3D 0 || mode->vtotal =3D=3D 0)
>  		return;
> @@ -630,9 +615,6 @@ static void fimd_atomic_begin(struct exynos_drm_c=
rtc *crtc,
>  {
>  	struct fimd_context *ctx =3D crtc->ctx;
> =20
> -	if (ctx->suspended)
> -		return;
> -
>  	fimd_shadow_protect_win(ctx, plane->zpos, true);
>  }
> =20
> @@ -641,9 +623,6 @@ static void fimd_atomic_flush(struct exynos_drm_c=
rtc *crtc,
>  {
>  	struct fimd_context *ctx =3D crtc->ctx;
> =20
> -	if (ctx->suspended)
> -		return;
> -
>  	fimd_shadow_protect_win(ctx, plane->zpos, false);
>  }
> =20
> @@ -659,9 +638,6 @@ static void fimd_update_plane(struct exynos_drm_c=
rtc *crtc,
>  	unsigned int bpp =3D state->fb->bits_per_pixel >> 3;
>  	unsigned int pitch =3D state->fb->pitches[0];
> =20
> -	if (ctx->suspended)
> -		return;
> -
>  	offset =3D plane->src_x * bpp;
>  	offset +=3D plane->src_y * pitch;
> =20
> @@ -743,9 +719,6 @@ static void fimd_disable_plane(struct exynos_drm_=
crtc *crtc,
>  	struct fimd_context *ctx =3D crtc->ctx;
>  	unsigned int win =3D plane->zpos;
> =20
> -	if (ctx->suspended)
> -		return;
> -
>  	fimd_enable_video_output(ctx, win, false);
> =20
>  	if (ctx->driver_data->has_shadowcon)
> @@ -755,27 +728,9 @@ static void fimd_disable_plane(struct exynos_drm=
_crtc *crtc,
>  static void fimd_enable(struct exynos_drm_crtc *crtc)
>  {
>  	struct fimd_context *ctx =3D crtc->ctx;
> -	int ret;
> -
> -	if (!ctx->suspended)
> -		return;
> -
> -	ctx->suspended =3D false;
> =20
>  	pm_runtime_get_sync(ctx->dev);
> =20
> -	ret =3D clk_prepare_enable(ctx->bus_clk);
> -	if (ret < 0) {
> -		DRM_ERROR("Failed to prepare_enable the bus clk [%d]\n", ret);
> -		return;
> -	}
> -
> -	ret =3D clk_prepare_enable(ctx->lcd_clk);
> -	if  (ret < 0) {
> -		DRM_ERROR("Failed to prepare_enable the lcd clk [%d]\n", ret);
> -		return;
> -	}
> -
>  	/* if vblank was enabled status, enable it again. */
>  	if (test_and_clear_bit(0, &ctx->irq_flags))
>  		fimd_enable_vblank(ctx->crtc);
> @@ -788,9 +743,6 @@ static void fimd_disable(struct exynos_drm_crtc *=
crtc)
>  	struct fimd_context *ctx =3D crtc->ctx;
>  	int i;
> =20
> -	if (ctx->suspended)
> -		return;
> -
>  	/*
>  	 * We need to make sure that all windows are disabled before we
>  	 * suspend that connector. Otherwise we might try to scan from
> @@ -805,12 +757,7 @@ static void fimd_disable(struct exynos_drm_crtc =
*crtc)
> =20
>  	writel(0, ctx->regs + VIDCON0);
> =20
> -	clk_disable_unprepare(ctx->lcd_clk);
> -	clk_disable_unprepare(ctx->bus_clk);
> -
>  	pm_runtime_put_sync(ctx->dev);
> -
> -	ctx->suspended =3D true;
>  }
> =20
>  static void fimd_trigger(struct device *dev)
> @@ -1019,7 +966,6 @@ static int fimd_probe(struct platform_device *pd=
ev)
>  		return -ENOMEM;
> =20
>  	ctx->dev =3D dev;
> -	ctx->suspended =3D true;
>  	ctx->driver_data =3D drm_fimd_get_driver_data(pdev);
> =20
>  	if (of_property_read_bool(dev->of_node, "samsung,invert-vden"))
> @@ -1129,12 +1075,49 @@ static int fimd_remove(struct platform_device=
 *pdev)
>  	return 0;
>  }
> =20
> +#ifdef CONFIG_PM_SLEEP
> +static int exynos_fimd_suspend(struct device *dev)
> +{
> +	struct fimd_context *ctx =3D dev_get_drvdata(dev);
> +
> +	clk_disable_unprepare(ctx->lcd_clk);
> +	clk_disable_unprepare(ctx->bus_clk);
> +
> +	return 0;
> +}
> +
> +static int exynos_fimd_resume(struct device *dev)
> +{
> +	struct fimd_context *ctx =3D dev_get_drvdata(dev);
> +	int ret;
> +
> +	ret =3D clk_prepare_enable(ctx->bus_clk);
> +	if (ret < 0) {
> +		DRM_ERROR("Failed to prepare_enable the bus clk [%d]\n", ret);
> +		return ret;
> +	}
> +
> +	ret =3D clk_prepare_enable(ctx->lcd_clk);
> +	if  (ret < 0) {
> +		DRM_ERROR("Failed to prepare_enable the lcd clk [%d]\n", ret);
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +#endif
> +
> +static const struct dev_pm_ops exynos_fimd_pm_ops =3D {
> +	SET_RUNTIME_PM_OPS(exynos_fimd_suspend, exynos_fimd_resume, NULL)
> +};
> +
>  struct platform_driver fimd_driver =3D {
>  	.probe		=3D fimd_probe,
>  	.remove		=3D fimd_remove,
>  	.driver		=3D {
>  		.name	=3D "exynos4-fb",
>  		.owner	=3D THIS_MODULE,
> +		.pm	=3D &exynos_fimd_pm_ops,
>  		.of_match_table =3D fimd_driver_dt_match,
>  	},
>  };
>=20
