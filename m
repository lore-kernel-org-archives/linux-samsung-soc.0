From: Inki Dae <inki.dae@samsung.com>
Subject: Re: [PATCH 1/2] drm/exynos: fimd: Remove drm_dev and pipe members from
 fimd_context
Date: Mon, 08 Dec 2014 22:37:53 +0900
Message-ID: <5485A9B1.30703@samsung.com>
References: <1417953876-28266-1-git-send-email-ajaykumar.rs@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:50305 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751468AbaLHNh4 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 8 Dec 2014 08:37:56 -0500
In-reply-to: <1417953876-28266-1-git-send-email-ajaykumar.rs@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Ajay Kumar <ajaykumar.rs@samsung.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, jy0922.shim@samsung.com, jg1.han@samsung.com, seanpaul@google.com, ajaynumb@gmail.com, bhushan.r@samsung.com, prashanth.g@samsung.com, cpgs@samsung.com

On 2014=EB=85=84 12=EC=9B=94 07=EC=9D=BC 21:04, Ajay Kumar wrote:
> ctx->drm_dev is unnecessary since it can be easily accessed
> via ctx->manager->drm_dev. Even the pipe variable inside
> fimd_context is redundant. Cleaning up the same.

Already applied.

Thanks,
Inki Dae

>=20
> Signed-off-by: Ajay Kumar <ajaykumar.rs@samsung.com>
> ---
>  drivers/gpu/drm/exynos/exynos_drm_fimd.c |   28 ++++++++++++++------=
--------
>  1 file changed, 14 insertions(+), 14 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_fimd.c b/drivers/gpu/d=
rm/exynos/exynos_drm_fimd.c
> index e5810d1..157f4dd 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_fimd.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
> @@ -159,7 +159,6 @@ struct fimd_win_data {
>  struct fimd_context {
>  	struct exynos_drm_manager	manager;
>  	struct device			*dev;
> -	struct drm_device		*drm_dev;
>  	struct clk			*bus_clk;
>  	struct clk			*lcd_clk;
>  	void __iomem			*regs;
> @@ -174,7 +173,6 @@ struct fimd_context {
>  	u32				i80ifcon;
>  	bool				i80_if;
>  	bool				suspended;
> -	int				pipe;
>  	wait_queue_head_t		wait_vsync_queue;
>  	atomic_t			wait_vsync_event;
>  	atomic_t			win_updated;
> @@ -298,17 +296,17 @@ static int fimd_mgr_initialize(struct exynos_dr=
m_manager *mgr,
>  	struct exynos_drm_private *priv;
>  	priv =3D drm_dev->dev_private;
> =20
> -	mgr->drm_dev =3D ctx->drm_dev =3D drm_dev;
> -	mgr->pipe =3D ctx->pipe =3D priv->pipe++;
> +	mgr->drm_dev =3D drm_dev;
> +	mgr->pipe =3D priv->pipe++;
> =20
>  	/* attach this sub driver to iommu mapping if supported. */
> -	if (is_drm_iommu_supported(ctx->drm_dev)) {
> +	if (is_drm_iommu_supported(mgr->drm_dev)) {
>  		/*
>  		 * If any channel is already active, iommu will throw
>  		 * a PAGE FAULT when enabled. So clear any channel if enabled.
>  		 */
>  		fimd_clear_channel(mgr);
> -		drm_iommu_attach_device(ctx->drm_dev, ctx->dev);
> +		drm_iommu_attach_device(mgr->drm_dev, ctx->dev);
>  	}
> =20
>  	return 0;
> @@ -319,8 +317,8 @@ static void fimd_mgr_remove(struct exynos_drm_man=
ager *mgr)
>  	struct fimd_context *ctx =3D mgr_to_fimd(mgr);
> =20
>  	/* detach this sub driver from iommu mapping if supported. */
> -	if (is_drm_iommu_supported(ctx->drm_dev))
> -		drm_iommu_detach_device(ctx->drm_dev, ctx->dev);
> +	if (is_drm_iommu_supported(mgr->drm_dev))
> +		drm_iommu_detach_device(mgr->drm_dev, ctx->dev);
>  }
> =20
>  static u32 fimd_calc_clkdiv(struct fimd_context *ctx,
> @@ -1001,7 +999,7 @@ static void fimd_te_handler(struct exynos_drm_ma=
nager *mgr)
>  	struct fimd_context *ctx =3D mgr_to_fimd(mgr);
> =20
>  	/* Checks the crtc is detached already from encoder */
> -	if (ctx->pipe < 0 || !ctx->drm_dev)
> +	if (mgr->pipe < 0 || !mgr->drm_dev)
>  		return;
> =20
>  	/*
> @@ -1018,7 +1016,7 @@ static void fimd_te_handler(struct exynos_drm_m=
anager *mgr)
>  	}
> =20
>  	if (test_bit(0, &ctx->irq_flags))
> -		drm_handle_vblank(ctx->drm_dev, ctx->pipe);
> +		drm_handle_vblank(mgr->drm_dev, mgr->pipe);
>  }
> =20
>  static struct exynos_drm_manager_ops fimd_manager_ops =3D {
> @@ -1047,17 +1045,19 @@ static irqreturn_t fimd_irq_handler(int irq, =
void *dev_id)
>  		writel(clear_bit, ctx->regs + VIDINTCON1);
> =20
>  	/* check the crtc is detached already from encoder */
> -	if (ctx->pipe < 0 || !ctx->drm_dev)
> +	if (ctx->manager.pipe < 0 || !ctx->manager.drm_dev)
>  		goto out;
> =20
>  	if (ctx->i80_if) {
> -		exynos_drm_crtc_finish_pageflip(ctx->drm_dev, ctx->pipe);
> +		exynos_drm_crtc_finish_pageflip(ctx->manager.drm_dev,
> +							ctx->manager.pipe);
> =20
>  		/* Exits triggering mode */
>  		atomic_set(&ctx->triggering, 0);
>  	} else {
> -		drm_handle_vblank(ctx->drm_dev, ctx->pipe);
> -		exynos_drm_crtc_finish_pageflip(ctx->drm_dev, ctx->pipe);
> +		drm_handle_vblank(ctx->manager.drm_dev, ctx->manager.pipe);
> +		exynos_drm_crtc_finish_pageflip(ctx->manager.drm_dev,
> +							ctx->manager.pipe);
> =20
>  		/* set wait vsync event to zero and wake up queue. */
>  		if (atomic_read(&ctx->wait_vsync_event)) {
>=20
