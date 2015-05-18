From: Gustavo Padovan <gustavo@padovan.org>
Subject: Re: drm/exynos: Add atomic modesetting support
Date: Mon, 18 May 2015 18:02:39 -0300
Message-ID: <20150518210239.GB18856@joana>
References: <10cea26ae89c8bf2f26c2d258dcabd3a@math.uni-bielefeld.de>
 <20150518195101.GA18856@joana>
 <CAPj87rOnseYOzPqetbxKpq7_4855Vup2cySzZJmz8JejBHFPMw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qc0-f173.google.com ([209.85.216.173]:35715 "EHLO
	mail-qc0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750801AbbERVCo (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 18 May 2015 17:02:44 -0400
Received: by qcbgu10 with SMTP id gu10so95480546qcb.2
        for <linux-samsung-soc@vger.kernel.org>; Mon, 18 May 2015 14:02:44 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <CAPj87rOnseYOzPqetbxKpq7_4855Vup2cySzZJmz8JejBHFPMw@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Daniel Stone <daniel@fooishbar.org>
Cc: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>, "inki.dae@samsung.com" <inki.dae@samsung.com>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "liquid.acid@gmx.net" <liquid.acid@gmx.net>

2015-05-18 Daniel Stone <daniel@fooishbar.org>:

> Hi,
> 
> On Monday, May 18, 2015, Gustavo Padovan <gustavo@padovan.org> wrote:
> 
> > Hi Tobias,
> >
> > 2015-05-15 Tobias Jakobi <tjakobi@math.uni-bielefeld.de <javascript:;>>:
> > > I did another run with drm.debug=0xff and also tried to figure out where
> > the
> > > div-by-zero comes from.
> > >
> > > The only division I see is in fimd_calc_clkdiv() (which is called by
> > > fimd_commit()). So it looks like 'ideal_clk' is zero when calling
> > > DIV_ROUND_UP().
> > >
> > > 'htotal' and 'vtotal' can't be zero, since this is checked early in
> > > fimd_commit(). So 'vrefresh' has to be zero. Maybe this helps?
> >
> > What is is the output when you run with this patch:
> >
> > diff --git a/drivers/gpu/drm/exynos/exynos_drm_fimd.c
> > b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
> > index 12ab80c..f5d215d 100644
> > --- a/drivers/gpu/drm/exynos/exynos_drm_fimd.c
> > +++ b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
> > @@ -310,6 +310,8 @@ static u32 fimd_calc_clkdiv(struct fimd_context *ctx,
> >         unsigned long ideal_clk = mode->htotal * mode->vtotal *
> > mode->vrefresh;
> >         u32 clkdiv;
> >
> > +       DRM_DEBUG_KMS("vrefresh %d\n", mode->vrefresh);
> > +
> >         if (ctx->i80_if) {
> >                 /*
> >                  * The frame done interrupt should be occurred prior to the
> > @@ -328,6 +330,7 @@ static bool fimd_mode_fixup(struct exynos_drm_crtc
> > *crtc,
> >                 const struct drm_display_mode *mode,
> >                 struct drm_display_mode *adjusted_mode)
> >  {
> > +       DRM_DEBUG_KMS("vrefresh %d\n", adjusted_mode->vrefresh);
> >         if (adjusted_mode->vrefresh == 0)
> >                 adjusted_mode->vrefresh = FIMD_DEFAULT_FRAMERATE;
> >
> 
> vrefresh can legitimately be zero, which makes this FIMD_DEFAULT_FRAMERATE
> assignment problematic rather than harmless.
> 
> If it's zero, you can find a vrefresh value with drm_mode_vrefresh, which
> will calculate it for you.

So better try this. Ideally fimd_mode_fixup should go away too, I'll do a proper
patch once we know this works.

diff --git a/drivers/gpu/drm/exynos/exynos_drm_fimd.c b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
index 12ab80c..363353b 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_fimd.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
@@ -307,9 +307,17 @@ static void fimd_iommu_detach_devices(struct fimd_context *ctx)
 static u32 fimd_calc_clkdiv(struct fimd_context *ctx,
                const struct drm_display_mode *mode)
 {
-       unsigned long ideal_clk = mode->htotal * mode->vtotal * mode->vrefresh;
+       unsigned long ideal_clk;
+       int vrefresh;
        u32 clkdiv;
 
+       if (mode->vrefresh == 0)
+               vrefresh = drm_mode_vrefresh(mode);
+       else
+               vrefresh = mode->vrefresh;
+
+       ideal_clk =  mode->htotal * mode->vtotal * vrefresh;
+
        if (ctx->i80_if) {
                /*
                 * The frame done interrupt should be occurred prior to the
