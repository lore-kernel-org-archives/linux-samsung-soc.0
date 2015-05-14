From: Gustavo Padovan <gustavo@padovan.org>
Subject: Re: drm/exynos: Add atomic modesetting support
Date: Thu, 14 May 2015 15:41:13 -0300
Message-ID: <20150514184113.GB23061@joana>
References: <1430430651-22416-1-git-send-email-gustavo@padovan.org>
 <554D2FC7.1070208@gmx.net>
 <CAAQKjZPCQZV7DxTuf12NyPbT2H5PJhNQs4CwtM8g563Zuw8-6w@mail.gmail.com>
 <554DF9DE.7000200@gmx.net>
 <CAAQKjZMRG_a1FrTRD9dACSBz8w3zvrLYWSSM0-wUbaVePaPA2Q@mail.gmail.com>
 <20150512182908.GB3327@joana>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qg0-f48.google.com ([209.85.192.48]:35020 "EHLO
	mail-qg0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S933401AbbENSlR (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 14 May 2015 14:41:17 -0400
Received: by qgej70 with SMTP id j70so42065007qge.2
        for <linux-samsung-soc@vger.kernel.org>; Thu, 14 May 2015 11:41:17 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <20150512182908.GB3327@joana>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Inki Dae <inki.dae@samsung.com>, Tobias Jakobi <liquid.acid@gmx.net>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, DRI mailing list <dri-devel@lists.freedesktop.org>

Hi Inki and Tobias,

2015-05-12 Gustavo Padovan <gustavo@padovan.org>:

> 2015-05-10 Inki Dae <inki.dae@samsung.com>:
> 
> > 2015-05-09 21:13 GMT+09:00 Tobias Jakobi <liquid.acid@gmx.net>:
> > > Hello Inki,
> > >
> > >
> > > Inki Dae wrote:
> > >> Hi,
> > >>
> > >> 2015-05-09 6:51 GMT+09:00 Tobias Jakobi <liquid.acid@gmx.net>:
> > >>> Hello,
> > >>>
> > >>> I've tested this on my Hardkernel Odroid-X2 (connected via HDMI to a
> > >>> 1080p panel).
> > >>>
> > >>> Run the usual modetest tests (just primary plane, primary plane with
> > >>> vsync, primary plane with overlay, primary plane with overlay and video
> > >>> overlay, overlay partially outside of crtc area, etc.) and haven't
> > >>> noticed any issues so far.
> > >>
> > >> As I mentioned several times, it works well in case that only one crtc
> > >> driver is enabled. Could you check it again after you enable two or
> > >> more crtc drivers such as FIMD and HDMI or FIMD, HDMI and VIDI
> > >> together? For this, dts file for X2 should contain their device nodes
> > >> and also should be configurated though menuconfig.
> > > I've enabled VIDI and FIMD and confirmed that they should up properly in
> > > modetest before applying the series.
> > >
> > > Booting with the atomic series works fine, but I get a segfault when
> > > calling modetest. I've attached the kernel log below.
> > 
> > Below panic issue is same as one I faced with at previous patch seris,
> > v3, which was invalid memory access - state->crtc is NULL whille
> > modetest is being performed. It seems that the last patch of v4 didn't
> > resolve this issue yet.
> 
> The weird thing is that it works quite fine on my exynos 5 hardware.
> I'll take a look on what could be be happening to cause this kind of
> crash.

Can you please check if the following diff solves the issue?

iff --git a/drivers/gpu/drm/exynos/exynos_drm_plane.c b/drivers/gpu/drm/exynos/exynos_drm_plane.c
index 8a1cd8b..3d64799 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_plane.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_plane.c
@@ -163,6 +163,9 @@ static void exynos_plane_atomic_update(struct drm_plane *plane,
        struct exynos_drm_crtc *exynos_crtc = to_exynos_crtc(state->crtc);
        struct exynos_drm_plane *exynos_plane = to_exynos_plane(plane);
 
+       if (!state->crtc)
+               return;
+
        exynos_plane_mode_set(plane, state->crtc, state->fb,
                              state->crtc_x, state->crtc_y,
                              state->crtc_w, state->crtc_h,
@@ -179,6 +182,9 @@ static void exynos_plane_atomic_disable(struct drm_plane *plane,
        struct exynos_drm_plane *exynos_plane = to_exynos_plane(plane);
        struct exynos_drm_crtc *exynos_crtc = to_exynos_crtc(old_state->crtc);
 
+       if (!old_state->crtc)
+               return;
+
        if (exynos_crtc->ops->disable_plane)
                exynos_crtc->ops->disable_plane(exynos_crtc,
                                                exynos_plane->zpos);
