From: Gustavo Padovan <gustavo@padovan.org>
Subject: Re: [PATCH -v3 11/11] drm/exynos: atomic dpms support
Date: Mon, 6 Apr 2015 14:26:46 -0400
Message-ID: <20150406182646.GA4980@joana>
References: <1428084583-14616-1-git-send-email-gustavo@padovan.org>
 <1428084583-14616-12-git-send-email-gustavo@padovan.org>
 <CAAQKjZMYXR7TxkGDKt=RTpE=ZpYyp7VveH_M6kEEB4EzcfCmcg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qg0-f45.google.com ([209.85.192.45]:34894 "EHLO
	mail-qg0-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753150AbbDFS0s (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 6 Apr 2015 14:26:48 -0400
Received: by qgej70 with SMTP id j70so13479617qge.2
        for <linux-samsung-soc@vger.kernel.org>; Mon, 06 Apr 2015 11:26:47 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <CAAQKjZMYXR7TxkGDKt=RTpE=ZpYyp7VveH_M6kEEB4EzcfCmcg@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Inki Dae <inki.dae@samsung.com>
Cc: "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Gustavo Padovan <gustavo.padovan@collabora.co.uk>, DRI mailing list <dri-devel@lists.freedesktop.org>

Hi Inki,

2015-04-05 Inki Dae <inki.dae@samsung.com>:

> Hi,
> 
> 2015-04-04 3:09 GMT+09:00 Gustavo Padovan <gustavo@padovan.org>:
> > From: Gustavo Padovan <gustavo.padovan@collabora.co.uk>
> >
> > Run dpms operations through the atomic intefaces. This basically removes
> > the .dpms() callback from econders and crtcs and use .disable() and
> > .enable() to turn the crtc on and off.
> >
> > v2: Address comments by Joonyoung:
> >         - make hdmi code call ->disable() instead of ->dpms()
> >         - do not use WARN_ON on crtc enable/disable
> >
> > Signed-off-by: Gustavo Padovan <gustavo.padovan@collabora.co.uk>
> > ---
> >  drivers/gpu/drm/exynos/exynos_dp_core.c       |  2 +-
> >  drivers/gpu/drm/exynos/exynos_drm_connector.c |  2 +-
> >  drivers/gpu/drm/exynos/exynos_drm_crtc.c      | 99 +++++++++++++++------------
> >  drivers/gpu/drm/exynos/exynos_drm_dpi.c       |  2 +-
> >  drivers/gpu/drm/exynos/exynos_drm_drv.h       |  4 +-
> >  drivers/gpu/drm/exynos/exynos_drm_dsi.c       |  2 +-
> >  drivers/gpu/drm/exynos/exynos_drm_encoder.c   | 27 ++------
> >  drivers/gpu/drm/exynos/exynos_drm_vidi.c      |  2 +-
> >  drivers/gpu/drm/exynos/exynos_hdmi.c          |  6 +-
> >  9 files changed, 70 insertions(+), 76 deletions(-)
> >
> 
> ...snip...
> 
> > diff --git a/drivers/gpu/drm/exynos/exynos_hdmi.c b/drivers/gpu/drm/exynos/exynos_hdmi.c
> > index 5b597bc..2ea7d01 100644
> > --- a/drivers/gpu/drm/exynos/exynos_hdmi.c
> > +++ b/drivers/gpu/drm/exynos/exynos_hdmi.c
> > @@ -1051,7 +1051,7 @@ static void hdmi_connector_destroy(struct drm_connector *connector)
> >  }
> >
> >  static struct drm_connector_funcs hdmi_connector_funcs = {
> > -       .dpms = drm_helper_connector_dpms,
> > +       .dpms = drm_atomic_helper_connector_dpms,
> >         .fill_modes = drm_helper_probe_single_connector_modes,
> >         .detect = hdmi_detect,
> >         .destroy = hdmi_connector_destroy,
> > @@ -2127,8 +2127,8 @@ static void hdmi_dpms(struct exynos_drm_display *display, int mode)
> >                  */
> >                 if (crtc)
> >                         funcs = crtc->helper_private;
> > -               if (funcs && funcs->dpms)
> > -                       (*funcs->dpms)(crtc, mode);
> > +               if (funcs && funcs->disable)
> > +                       (*funcs->disable)(crtc, mode);
> 
> This patch makes funcs->disable callback to be called instead of
> funcs->dpms callback. However, funcs->disable callback isn't required
> for second argument so the build is failed like below,
> 
> drivers/gpu/drm/exynos/exynos_hdmi.c: In function 'hdmi_dpms':
> drivers/gpu/drm/exynos/exynos_hdmi.c:2131:4: error: too many arguments
> to function 'funcs->disable'
> 
> Please, keep in mind that you should build it and at least have a
> basic test before posting.

Sure, I think this happened because I've been using exynos_defconfig to test
my kernels and HDMI is not there. Maybe should we add the EXYNOS_DRM_HDMI to
defconfig? What do you think?

	Gustavo
