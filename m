From: Inki Dae <inki.dae@samsung.com>
Subject: Re: [PATCH 26/29] drm/exynos: atomic phase 1: add
 atomic_begin()/atomic_flush()
Date: Tue, 30 Dec 2014 23:42:24 +0900
Message-ID: <54A2B9D0.8000602@samsung.com>
References: <1418911135-5207-1-git-send-email-gustavo@padovan.org>
 <1418911135-5207-27-git-send-email-gustavo@padovan.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:42915 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751454AbaL3Om0 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 30 Dec 2014 09:42:26 -0500
Received: from epcpsbgr4.samsung.com
 (u144.gpu120.samsung.co.kr [203.254.230.144])
 by mailout3.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0NHE0023KGUOWK20@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 30 Dec 2014 23:42:24 +0900 (KST)
In-reply-to: <1418911135-5207-27-git-send-email-gustavo@padovan.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Gustavo Padovan <gustavo@padovan.org>
Cc: linux-samsung-soc@vger.kernel.org, dri-devel@lists.freedesktop.org, Gustavo Padovan <gustavo.padovan@collabora.co.uk>

On 2014=EB=85=84 12=EC=9B=94 18=EC=9D=BC 22:58, Gustavo Padovan wrote:
> From: Gustavo Padovan <gustavo.padovan@collabora.co.uk>
>=20
> Add CRTC callbacks .atomic_begin() .atomic_flush(). On exynos they
> unprotect the windows before the commit and protects it after based o=
n
> a plane mask tha store which plane will be updated.

tha? Typo?

>=20
> For that we create two new exynos_crtc callbacks: .win_protect() and
> .win_unprotect(). The only driver that implement those now is FIMD.
>=20
> Signed-off-by: Gustavo Padovan <gustavo.padovan@collabora.co.uk>
> ---
>  drivers/gpu/drm/exynos/exynos_drm_crtc.c  | 34 +++++++++++++++++++
>  drivers/gpu/drm/exynos/exynos_drm_drv.h   |  4 +++
>  drivers/gpu/drm/exynos/exynos_drm_fimd.c  | 56 +++++++++++++++++++++=
+---------
>  drivers/gpu/drm/exynos/exynos_drm_plane.c |  4 +++
>  4 files changed, 82 insertions(+), 16 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_crtc.c b/drivers/gpu/d=
rm/exynos/exynos_drm_crtc.c
> index 74980c5..f231eb8 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_crtc.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_crtc.c
> @@ -156,6 +156,38 @@ static void exynos_drm_crtc_disable(struct drm_c=
rtc *crtc)
>  	}
>  }
> =20
> +static void exynos_crtc_atomic_begin(struct drm_crtc *crtc)
> +{
> +	struct exynos_drm_crtc *exynos_crtc =3D to_exynos_crtc(crtc);
> +	struct drm_plane *plane;
> +	int index =3D 0;
> +

Isn't drm_modest_lock_all(dev) required? Or is this function atomic
context? I didn't look into all codes yet so there may be my missing po=
int.

> +	list_for_each_entry(plane, &crtc->dev->mode_config.plane_list, head=
) {
> +		if (exynos_crtc->ops->win_protect &&
> +		    exynos_crtc->plane_mask & (0x01 << index))
> +			exynos_crtc->ops->win_protect(exynos_crtc, index);
> +
> +		index++;
> +	}
> +}
> +
> +static void exynos_crtc_atomic_flush(struct drm_crtc *crtc)
> +{
> +	struct exynos_drm_crtc *exynos_crtc =3D to_exynos_crtc(crtc);
> +	struct drm_plane *plane;
> +	int index =3D 0;
> +

Ditto.

> +	list_for_each_entry(plane, &crtc->dev->mode_config.plane_list, head=
) {
> +		if (exynos_crtc->ops->win_unprotect &&
> +		    exynos_crtc->plane_mask & (0x01 << index))
> +			exynos_crtc->ops->win_unprotect(exynos_crtc, index);
> +
> +		index++;
> +	}
> +
> +	exynos_crtc->plane_mask =3D 0;
> +}
> +
>  static struct drm_crtc_helper_funcs exynos_crtc_helper_funcs =3D {
>  	.dpms		=3D exynos_drm_crtc_dpms,
>  	.prepare	=3D exynos_drm_crtc_prepare,
> @@ -164,6 +196,8 @@ static struct drm_crtc_helper_funcs exynos_crtc_h=
elper_funcs =3D {
>  	.mode_set	=3D exynos_drm_crtc_mode_set,
>  	.mode_set_base	=3D exynos_drm_crtc_mode_set_base,
>  	.disable	=3D exynos_drm_crtc_disable,
> +	.atomic_begin	=3D exynos_crtc_atomic_begin,
> +	.atomic_flush	=3D exynos_crtc_atomic_flush,
>  };
> =20
>  static int exynos_drm_crtc_page_flip(struct drm_crtc *crtc,
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_drv.h b/drivers/gpu/dr=
m/exynos/exynos_drm_drv.h
> index d490b49..1df769f 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_drv.h
> +++ b/drivers/gpu/drm/exynos/exynos_drm_drv.h
> @@ -195,6 +195,8 @@ struct exynos_drm_crtc_ops {
>  	void (*win_enable)(struct exynos_drm_crtc *crtc, int zpos);
>  	void (*win_disable)(struct exynos_drm_crtc *crtc, int zpos);
>  	void (*te_handler)(struct exynos_drm_crtc *crtc);
> +	void (*win_protect)(struct exynos_drm_crtc *crtc, int zpos);
> +	void (*win_unprotect)(struct exynos_drm_crtc *crtc, int zpos);
>  };
> =20
>  enum exynos_crtc_mode {
> @@ -215,6 +217,7 @@ enum exynos_crtc_mode {
>   *	we can refer to the crtc to current hardware interrupt occurred t=
hrough
>   *	this pipe value.
>   * @dpms: store the crtc dpms value
> + * @plane_mask: store planes to be updated on atomic modesetting
>   * @mode: store the crtc mode value
>   * @ops: pointer to callbacks for exynos drm specific functionality
>   * @ctx: A pointer to the crtc's implementation specific context
> @@ -224,6 +227,7 @@ struct exynos_drm_crtc {
>  	enum exynos_drm_output_type	type;
>  	unsigned int			pipe;
>  	unsigned int			dpms;
> +	unsigned int			plane_mask;
>  	enum exynos_crtc_mode		mode;
>  	wait_queue_head_t		pending_flip_queue;
>  	atomic_t			pending_flip;
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_fimd.c b/drivers/gpu/d=
rm/exynos/exynos_drm_fimd.c
> index 0e01b17..4a5ef31 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_fimd.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
> @@ -644,6 +644,16 @@ static void fimd_shadow_protect_win(struct fimd_=
context *ctx,
>  {
>  	u32 reg, bits, val;
> =20
> +	/*
> +	 * SHADOWCON/PRTCON register is used for enabling timing.
> +	 *
> +	 * for example, once only width value of a register is set,
> +	 * if the dma is started then fimd hardware could malfunction so
> +	 * with protect window setting, the register fields with prefix '_F=
'
> +	 * wouldn't be updated at vsync also but updated once unprotect win=
dow
> +	 * is set.
> +	 */
> +
>  	if (ctx->driver_data->has_shadowcon) {
>  		reg =3D SHADOWCON;
>  		bits =3D SHADOWCON_WINx_PROTECT(win);
> @@ -686,19 +696,6 @@ static void fimd_win_commit(struct exynos_drm_cr=
tc *crtc, int zpos)
>  		return;
>  	}
> =20
> -	/*
> -	 * SHADOWCON/PRTCON register is used for enabling timing.
> -	 *
> -	 * for example, once only width value of a register is set,
> -	 * if the dma is started then fimd hardware could malfunction so
> -	 * with protect window setting, the register fields with prefix '_F=
'
> -	 * wouldn't be updated at vsync also but updated once unprotect win=
dow
> -	 * is set.
> -	 */
> -
> -	/* protect windows */
> -	fimd_shadow_protect_win(ctx, win, true);

fimd_win_commit can be called by setmode, setplane or page flip request=
=2E
If you remove this function call, these operations will not work
correctly because the registers related to overlay should be updated
together. Your patch is considered only for atomic page flip or mode
setting.

Thanks,
Inki Dae

> -
>  	/* buffer start address */
>  	val =3D (unsigned long)win_data->dma_addr;
>  	writel(val, ctx->regs + VIDWx_BUF_START(win, 0));
> @@ -774,9 +771,6 @@ static void fimd_win_commit(struct exynos_drm_crt=
c *crtc, int zpos)
>  	if (ctx->driver_data->has_shadowcon)
>  		fimd_enable_shadow_channel_path(ctx, win, true);
> =20
> -	/* Enable DMA channel and unprotect windows */
> -	fimd_shadow_protect_win(ctx, win, false);
> -
>  	win_data->enabled =3D true;
> =20
>  	if (ctx->i80_if)
> @@ -1005,6 +999,34 @@ static void fimd_te_handler(struct exynos_drm_c=
rtc *crtc)
>  		drm_handle_vblank(ctx->drm_dev, ctx->pipe);
>  }
> =20
> +static void fimd_win_protect(struct exynos_drm_crtc *crtc, int zpos)
> +{
> +	struct fimd_context *ctx =3D crtc->ctx;
> +	int win =3D zpos;
> +
> +	if (win =3D=3D DEFAULT_ZPOS)
> +		win =3D ctx->default_win;
> +
> +	if (win < 0 || win >=3D WINDOWS_NR)
> +		return;
> +
> +	fimd_shadow_protect_win(ctx, win, true);
> +}
> +
> +static void fimd_win_unprotect(struct exynos_drm_crtc *crtc, int zpo=
s)
> +{
> +	struct fimd_context *ctx =3D crtc->ctx;
> +	int win =3D zpos;
> +
> +	if (win =3D=3D DEFAULT_ZPOS)
> +		win =3D ctx->default_win;
> +
> +	if (win < 0 || win >=3D WINDOWS_NR)
> +		return;
> +
> +	fimd_shadow_protect_win(ctx, win, false);
> +}
> +
>  static struct exynos_drm_crtc_ops fimd_crtc_ops =3D {
>  	.dpms =3D fimd_dpms,
>  	.mode_fixup =3D fimd_mode_fixup,
> @@ -1016,6 +1038,8 @@ static struct exynos_drm_crtc_ops fimd_crtc_ops=
 =3D {
>  	.win_commit =3D fimd_win_commit,
>  	.win_disable =3D fimd_win_disable,
>  	.te_handler =3D fimd_te_handler,
> +	.win_protect =3D fimd_win_protect,
> +	.win_unprotect =3D fimd_win_unprotect,
>  };
> =20
>  static irqreturn_t fimd_irq_handler(int irq, void *dev_id)
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_plane.c b/drivers/gpu/=
drm/exynos/exynos_drm_plane.c
> index dfca218..7bf922b 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_plane.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_plane.c
> @@ -65,6 +65,7 @@ static int exynos_plane_get_size(int start, unsigne=
d length, unsigned last)
>  int exynos_check_plane(struct drm_plane *plane, struct drm_framebuff=
er *fb)
>  {
>  	struct exynos_drm_plane *exynos_plane =3D to_exynos_plane(plane);
> +	struct exynos_drm_crtc *exynos_crtc =3D to_exynos_crtc(plane->crtc)=
;
>  	int nr;
>  	int i;
> =20
> @@ -83,6 +84,9 @@ int exynos_check_plane(struct drm_plane *plane, str=
uct drm_framebuffer *fb)
>  				i, (unsigned long)exynos_plane->dma_addr[i]);
>  	}
> =20
> +	if (exynos_crtc)
> +		exynos_crtc->plane_mask +=3D 1 << exynos_plane->zpos;
> +
>  	return 0;
>  }
> =20
>=20
