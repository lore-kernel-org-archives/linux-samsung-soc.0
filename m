From: Inki Dae <inki.dae@samsung.com>
Subject: Re: [PATCH 01/29] drm/exynos/fimd: only finish pageflip if START ==
 START_S
Date: Tue, 30 Dec 2014 23:05:51 +0900
Message-ID: <54A2B13F.1030908@samsung.com>
References: <1418911135-5207-1-git-send-email-gustavo@padovan.org>
 <1418911135-5207-2-git-send-email-gustavo@padovan.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:58366 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750833AbaL3OFx (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 30 Dec 2014 09:05:53 -0500
Received: from epcpsbgr4.samsung.com
 (u144.gpu120.samsung.co.kr [203.254.230.144])
 by mailout2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0NHE00L5PF5R3S00@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 30 Dec 2014 23:05:51 +0900 (KST)
In-reply-to: <1418911135-5207-2-git-send-email-gustavo@padovan.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Gustavo Padovan <gustavo@padovan.org>
Cc: linux-samsung-soc@vger.kernel.org, dri-devel@lists.freedesktop.org, Daniel Kurtz <djkurtz@chromium.org>

On 2014=EB=85=84 12=EC=9B=94 18=EC=9D=BC 22:58, Gustavo Padovan wrote:
> From: Daniel Kurtz <djkurtz@chromium.org>
>=20
> A framebuffer gets committed to FIMD's default window like this:
>  exynos_drm_crtc_update()
>   exynos_plane_commit()
>    fimd_win_commit()
>=20
> fimd_win_commit() programs BUF_START[0].  At each vblank, FIMD hardwa=
re
> copies the value from BUF_START to BUF_START_S (BUF_START's shadow
> register), starts scanning out from BUF_START_S, and asserts its irq.
>=20
> This irq is handled by fimd_irq_handler(), which calls
> exynos_drm_crtc_finish_pageflip() to free the old buffer that FIMD ju=
st
> finished scanning out, and potentially commit the next pending flip.
>=20
> There is a race, however, if fimd_win_commit() programs BUF_START(0)
> between the actual vblank irq, and its corresponding fimd_irq_handler=
().
>=20
>  =3D> FIMD vblank: BUF_START_S[0] :=3D BUF_START[0], and irq asserted
>  | =3D> fimd_win_commit(0) writes new BUF_START[0]
>  |    exynos_drm_crtc_try_do_flip() marks exynos_fb as prepared
>  =3D> fimd_irq_handler()
>     exynos_drm_crtc_finish_pageflip() sees prepared exynos_fb,
>          and unmaps "old" fb
>  =3D=3D> but, since BUF_START_S[0] still points to that "old" fb...
>  =3D=3D> FIMD iommu fault
>=20
> This patch ensures that fimd_irq_handler() only calls
> exynos_drm_crtc_finish_pageflip() if any previously scheduled flip
> has really completed.
>=20
> This works because exynos_drm_crtc's flip fifo ensures that
> fimd_win_commit() is never called more than once per
> exynos_drm_crtc_finish_pageflip().
>=20
> Signed-off-by: Daniel Kurtz <djkurtz@chromium.org>
> Reviewed-by: Sean Paul <seanpaul@chromium.org>
> Signed-off-by: Gustavo Padovan <gustavo.padovan@collabora.co.uk>
> ---
>  drivers/gpu/drm/exynos/exynos_drm_fimd.c | 26 ++++++++++++++++++++++=
----
>  include/video/samsung_fimd.h             |  1 +
>  2 files changed, 23 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_fimd.c b/drivers/gpu/d=
rm/exynos/exynos_drm_fimd.c
> index e5810d1..b379182 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_fimd.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
> @@ -55,6 +55,7 @@
>  #define VIDOSD_D(win)		(VIDOSD_BASE + 0x0C + (win) * 16)
> =20
>  #define VIDWx_BUF_START(win, buf)	(VIDW_BUF_START(buf) + (win) * 8)
> +#define VIDWx_BUF_START_S(win, buf)     (VIDW_BUF_START_S(buf) + (wi=
n) * 8)
>  #define VIDWx_BUF_END(win, buf)		(VIDW_BUF_END(buf) + (win) * 8)
>  #define VIDWx_BUF_SIZE(win, buf)	(VIDW_BUF_SIZE(buf) + (win) * 4)
> =20
> @@ -1039,6 +1040,7 @@ static irqreturn_t fimd_irq_handler(int irq, vo=
id *dev_id)
>  {
>  	struct fimd_context *ctx =3D (struct fimd_context *)dev_id;
>  	u32 val, clear_bit;
> +	u32 start, start_s;
> =20
>  	val =3D readl(ctx->regs + VIDINTCON1);
> =20
> @@ -1050,15 +1052,31 @@ static irqreturn_t fimd_irq_handler(int irq, =
void *dev_id)
>  	if (ctx->pipe < 0 || !ctx->drm_dev)
>  		goto out;
> =20
> -	if (ctx->i80_if) {
> +	if (!ctx->i80_if)
> +		drm_handle_vblank(ctx->drm_dev, ctx->pipe);
> +
> +	/*
> +	 * Ensure finish_pageflip is called iff a pending flip has complete=
d.

Maybe s/iff/if

> +	 * This works around a race between a page_flip request and the lat=
ency
> +	 * between vblank interrupt and this irq_handler:
> +	 *   =3D> FIMD vblank: BUF_START_S[0] :=3D BUF_START[0], and assert=
s irq
> +	 *   | =3D> fimd_win_commit(0) writes new BUF_START[0]
> +	 *   |    exynos_drm_crtc_try_do_flip() marks exynos_fb as prepared
> +	 *   =3D> fimd_irq_handler()
> +	 *       exynos_drm_crtc_finish_pageflip() sees prepared exynos_fb,
> +	 *           and unmaps "old" fb
> +	 *   =3D=3D> but, since BUF_START_S[0] still points to that "old" f=
b...
> +	 *   =3D=3D> FIMD iommu fault
> +	 */
> +	start =3D readl(ctx->regs + VIDWx_BUF_START(0, 0));
> +	start_s =3D readl(ctx->regs + VIDWx_BUF_START_S(0, 0));
> +	if (start =3D=3D start_s)
>  		exynos_drm_crtc_finish_pageflip(ctx->drm_dev, ctx->pipe);

As I already mentioned before, above codes should be called only in cas=
e
of RGB mode until checked for i80 mode. Have you ever tested above code=
s
on i80 mode?

And what if 'start_s' has a value different from one of 'start'? Is it
ok to skip finish_pageflip request this time? Shouldn't it ensure to
wait for that until 'start_s' has a value same as one of 'start'?

Thanks,
Inki Dae

> =20
> +	if (ctx->i80_if) {
>  		/* Exits triggering mode */
>  		atomic_set(&ctx->triggering, 0);
>  	} else {
> -		drm_handle_vblank(ctx->drm_dev, ctx->pipe);
> -		exynos_drm_crtc_finish_pageflip(ctx->drm_dev, ctx->pipe);
> -
>  		/* set wait vsync event to zero and wake up queue. */
>  		if (atomic_read(&ctx->wait_vsync_event)) {
>  			atomic_set(&ctx->wait_vsync_event, 0);
> diff --git a/include/video/samsung_fimd.h b/include/video/samsung_fim=
d.h
> index a20e4a3..f81d081 100644
> --- a/include/video/samsung_fimd.h
> +++ b/include/video/samsung_fimd.h
> @@ -291,6 +291,7 @@
> =20
>  /* Video buffer addresses */
>  #define VIDW_BUF_START(_buff)			(0xA0 + ((_buff) * 8))
> +#define VIDW_BUF_START_S(_buff)                 (0x40A0 + ((_buff) *=
 8))
>  #define VIDW_BUF_START1(_buff)			(0xA4 + ((_buff) * 8))
>  #define VIDW_BUF_END(_buff)			(0xD0 + ((_buff) * 8))
>  #define VIDW_BUF_END1(_buff)			(0xD4 + ((_buff) * 8))
>=20
