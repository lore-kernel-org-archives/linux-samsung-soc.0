From: Gustavo Padovan <gustavo@padovan.org>
Subject: Re: [PATCH 01/29] drm/exynos/fimd: only finish pageflip if START ==
 START_S
Date: Mon, 12 Jan 2015 19:13:27 -0200
Message-ID: <20150112211327.GF2001@joana>
References: <1418911135-5207-1-git-send-email-gustavo@padovan.org>
 <1418911135-5207-2-git-send-email-gustavo@padovan.org>
 <54A2B13F.1030908@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qc0-f169.google.com ([209.85.216.169]:52412 "EHLO
	mail-qc0-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750973AbbALVNe convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 12 Jan 2015 16:13:34 -0500
Received: by mail-qc0-f169.google.com with SMTP id w7so19977873qcr.0
        for <linux-samsung-soc@vger.kernel.org>; Mon, 12 Jan 2015 13:13:34 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <54A2B13F.1030908@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Inki Dae <inki.dae@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, dri-devel@lists.freedesktop.org, Daniel Kurtz <djkurtz@chromium.org>

2014-12-30 Inki Dae <inki.dae@samsung.com>:

> On 2014=EB=85=84 12=EC=9B=94 18=EC=9D=BC 22:58, Gustavo Padovan wrote=
:
> > From: Daniel Kurtz <djkurtz@chromium.org>
> >=20
> > A framebuffer gets committed to FIMD's default window like this:
> >  exynos_drm_crtc_update()
> >   exynos_plane_commit()
> >    fimd_win_commit()
> >=20
> > fimd_win_commit() programs BUF_START[0].  At each vblank, FIMD hard=
ware
> > copies the value from BUF_START to BUF_START_S (BUF_START's shadow
> > register), starts scanning out from BUF_START_S, and asserts its ir=
q.
> >=20
> > This irq is handled by fimd_irq_handler(), which calls
> > exynos_drm_crtc_finish_pageflip() to free the old buffer that FIMD =
just
> > finished scanning out, and potentially commit the next pending flip=
=2E
> >=20
> > There is a race, however, if fimd_win_commit() programs BUF_START(0=
)
> > between the actual vblank irq, and its corresponding fimd_irq_handl=
er().
> >=20
> >  =3D> FIMD vblank: BUF_START_S[0] :=3D BUF_START[0], and irq assert=
ed
> >  | =3D> fimd_win_commit(0) writes new BUF_START[0]
> >  |    exynos_drm_crtc_try_do_flip() marks exynos_fb as prepared
> >  =3D> fimd_irq_handler()
> >     exynos_drm_crtc_finish_pageflip() sees prepared exynos_fb,
> >          and unmaps "old" fb
> >  =3D=3D> but, since BUF_START_S[0] still points to that "old" fb...
> >  =3D=3D> FIMD iommu fault
> >=20
> > This patch ensures that fimd_irq_handler() only calls
> > exynos_drm_crtc_finish_pageflip() if any previously scheduled flip
> > has really completed.
> >=20
> > This works because exynos_drm_crtc's flip fifo ensures that
> > fimd_win_commit() is never called more than once per
> > exynos_drm_crtc_finish_pageflip().
> >=20
> > Signed-off-by: Daniel Kurtz <djkurtz@chromium.org>
> > Reviewed-by: Sean Paul <seanpaul@chromium.org>
> > Signed-off-by: Gustavo Padovan <gustavo.padovan@collabora.co.uk>
> > ---
> >  drivers/gpu/drm/exynos/exynos_drm_fimd.c | 26 ++++++++++++++++++++=
++----
> >  include/video/samsung_fimd.h             |  1 +
> >  2 files changed, 23 insertions(+), 4 deletions(-)
> >=20
> > diff --git a/drivers/gpu/drm/exynos/exynos_drm_fimd.c b/drivers/gpu=
/drm/exynos/exynos_drm_fimd.c
> > index e5810d1..b379182 100644
> > --- a/drivers/gpu/drm/exynos/exynos_drm_fimd.c
> > +++ b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
> > @@ -55,6 +55,7 @@
> >  #define VIDOSD_D(win)		(VIDOSD_BASE + 0x0C + (win) * 16)
> > =20
> >  #define VIDWx_BUF_START(win, buf)	(VIDW_BUF_START(buf) + (win) * 8=
)
> > +#define VIDWx_BUF_START_S(win, buf)     (VIDW_BUF_START_S(buf) + (=
win) * 8)
> >  #define VIDWx_BUF_END(win, buf)		(VIDW_BUF_END(buf) + (win) * 8)
> >  #define VIDWx_BUF_SIZE(win, buf)	(VIDW_BUF_SIZE(buf) + (win) * 4)
> > =20
> > @@ -1039,6 +1040,7 @@ static irqreturn_t fimd_irq_handler(int irq, =
void *dev_id)
> >  {
> >  	struct fimd_context *ctx =3D (struct fimd_context *)dev_id;
> >  	u32 val, clear_bit;
> > +	u32 start, start_s;
> > =20
> >  	val =3D readl(ctx->regs + VIDINTCON1);
> > =20
> > @@ -1050,15 +1052,31 @@ static irqreturn_t fimd_irq_handler(int irq=
, void *dev_id)
> >  	if (ctx->pipe < 0 || !ctx->drm_dev)
> >  		goto out;
> > =20
> > -	if (ctx->i80_if) {
> > +	if (!ctx->i80_if)
> > +		drm_handle_vblank(ctx->drm_dev, ctx->pipe);
> > +
> > +	/*
> > +	 * Ensure finish_pageflip is called iff a pending flip has comple=
ted.
>=20
> Maybe s/iff/if
>=20
> > +	 * This works around a race between a page_flip request and the l=
atency
> > +	 * between vblank interrupt and this irq_handler:
> > +	 *   =3D> FIMD vblank: BUF_START_S[0] :=3D BUF_START[0], and asse=
rts irq
> > +	 *   | =3D> fimd_win_commit(0) writes new BUF_START[0]
> > +	 *   |    exynos_drm_crtc_try_do_flip() marks exynos_fb as prepar=
ed
> > +	 *   =3D> fimd_irq_handler()
> > +	 *       exynos_drm_crtc_finish_pageflip() sees prepared exynos_f=
b,
> > +	 *           and unmaps "old" fb
> > +	 *   =3D=3D> but, since BUF_START_S[0] still points to that "old"=
 fb...
> > +	 *   =3D=3D> FIMD iommu fault
> > +	 */
> > +	start =3D readl(ctx->regs + VIDWx_BUF_START(0, 0));
> > +	start_s =3D readl(ctx->regs + VIDWx_BUF_START_S(0, 0));
> > +	if (start =3D=3D start_s)
> >  		exynos_drm_crtc_finish_pageflip(ctx->drm_dev, ctx->pipe);
>=20
> As I already mentioned before, above codes should be called only in c=
ase
> of RGB mode until checked for i80 mode. Have you ever tested above co=
des
> on i80 mode?

I haven't tested it as I don't have any hardware that does i80 mode.
Let's keep this check only for !i80 then.=20

>=20
> And what if 'start_s' has a value different from one of 'start'? Is i=
t
> ok to skip finish_pageflip request this time? Shouldn't it ensure to
> wait for that until 'start_s' has a value same as one of 'start'?

I think it is okay to skip finish_pageflip, but we could return directl=
y
if they are different, so we keep the wait_vsync_queue running until th=
e next
irq happens or it timeouts. How does this look to you?

	Gustavo
