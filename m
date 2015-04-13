From: Gustavo Padovan <gustavo@padovan.org>
Subject: Re: [PATCH] drm/exynos: remove unnecessary calls to disable_plane()
Date: Mon, 13 Apr 2015 13:35:11 -0400
Message-ID: <20150413173511.GB6542@joana>
References: <1428084583-14616-12-git-send-email-gustavo@padovan.org>
 <1428692226-7157-1-git-send-email-gustavo@padovan.org>
 <552B62E8.3090906@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-vn0-f44.google.com ([209.85.216.44]:45114 "EHLO
	mail-vn0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932415AbbDMRfO (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 13 Apr 2015 13:35:14 -0400
Received: by vnbg190 with SMTP id g190so21943780vnb.12
        for <linux-samsung-soc@vger.kernel.org>; Mon, 13 Apr 2015 10:35:13 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <552B62E8.3090906@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Joonyoung Shim <jy0922.shim@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, dri-devel@lists.freedesktop.org, inki.dae@samsung.com, Gustavo Padovan <gustavo.padovan@collabora.co.uk>

2015-04-13 Joonyoung Shim <jy0922.shim@samsung.com>:

> Hi,
> 
> On 04/11/2015 03:57 AM, Gustavo Padovan wrote:
> > From: Gustavo Padovan <gustavo.padovan@collabora.co.uk>
> > 
> > The planes are already disabled by the drm_atomic_helper_commit() code
> > so we don't need to disable the in these two places.
> > 
> > Signed-off-by: Gustavo Padovan <gustavo.padovan@collabora.co.uk>
> > ---
> >  drivers/gpu/drm/exynos/exynos_drm_crtc.c    | 11 -----------
> >  drivers/gpu/drm/exynos/exynos_drm_encoder.c |  8 --------
> >  2 files changed, 19 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/exynos/exynos_drm_crtc.c b/drivers/gpu/drm/exynos/exynos_drm_crtc.c
> > index 519c569..9bf25ff 100644
> > --- a/drivers/gpu/drm/exynos/exynos_drm_crtc.c
> > +++ b/drivers/gpu/drm/exynos/exynos_drm_crtc.c
> > @@ -47,8 +47,6 @@ static void exynos_drm_crtc_enable(struct drm_crtc *crtc)
> >  static void exynos_drm_crtc_disable(struct drm_crtc *crtc)
> >  {
> >  	struct exynos_drm_crtc *exynos_crtc = to_exynos_crtc(crtc);
> > -	struct drm_plane *plane;
> > -	int ret;
> >  
> >  	if (!exynos_crtc->enabled)
> >  		return;
> > @@ -64,15 +62,6 @@ static void exynos_drm_crtc_disable(struct drm_crtc *crtc)
> >  		exynos_crtc->ops->dpms(exynos_crtc, DRM_MODE_DPMS_OFF);
> >  
> >  	exynos_crtc->enabled = false;
> > -
> > -	drm_for_each_legacy_plane(plane, &crtc->dev->mode_config.plane_list) {
> > -		if (plane->crtc != crtc)
> > -			continue;
> > -
> > -		ret = plane->funcs->disable_plane(plane);
> > -		if (ret)
> > -			DRM_ERROR("Failed to disable plane %d\n", ret);
> > -	}
> 
> If remove here disable codes, when crtc is disabled, enabled overlay
> planes may not be disabled.
> 
> E.g, user can remove fb of crtc via DRM_IOCTL_MODE_RMFB ioctl, then crtc
> is disabled but overlay planes no.

That not true anymore with atomic modesetting, the overlay planes are also
disabled, so we should let the atomic core solve this and remove these pieces
of code from here.

	Gustavo
