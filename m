From: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH 02/14] drm/exynos: Remove exynos_plane_dpms() call with
 no effect
Date: Wed, 4 Feb 2015 15:16:45 +0100
Message-ID: <20150204141645.GE14009@phenom.ffwll.local>
References: <1422990871-21355-1-git-send-email-gustavo@padovan.org>
 <1422990871-21355-3-git-send-email-gustavo@padovan.org>
 <54D1CD81.6020704@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wi0-f174.google.com ([209.85.212.174]:52711 "EHLO
	mail-wi0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S964821AbbBDOPY (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 4 Feb 2015 09:15:24 -0500
Received: by mail-wi0-f174.google.com with SMTP id n3so32128333wiv.1
        for <linux-samsung-soc@vger.kernel.org>; Wed, 04 Feb 2015 06:15:22 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <54D1CD81.6020704@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Joonyoung Shim <jy0922.shim@samsung.com>
Cc: Gustavo Padovan <gustavo@padovan.org>, linux-samsung-soc@vger.kernel.org, Gustavo Padovan <gustavo.padovan@collabora.co.uk>, dri-devel@lists.freedesktop.org

On Wed, Feb 04, 2015 at 04:42:57PM +0900, Joonyoung Shim wrote:
> Hi,
> 
> On 02/04/2015 04:14 AM, Gustavo Padovan wrote:
> > From: Gustavo Padovan <gustavo.padovan@collabora.co.uk>
> > 
> > exynos_plane_dpms(DRM_MODE_DPMS_ON) calls the win_enable()'s callback
> > from the underlying layer. However neither one of these layers implement
> > win_enable() - FIMD, Mixer and VIDI. Thus the call to exynos_plane_dpms()
> > is pointless.
> > 
> > Signed-off-by: Gustavo Padovan <gustavo.padovan@collabora.co.uk>
> > ---
> >  drivers/gpu/drm/exynos/exynos_drm_crtc.c | 2 --
> >  1 file changed, 2 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/exynos/exynos_drm_crtc.c b/drivers/gpu/drm/exynos/exynos_drm_crtc.c
> > index b2a4b84..ad675fb 100644
> > --- a/drivers/gpu/drm/exynos/exynos_drm_crtc.c
> > +++ b/drivers/gpu/drm/exynos/exynos_drm_crtc.c
> > @@ -65,8 +65,6 @@ static void exynos_drm_crtc_commit(struct drm_crtc *crtc)
> >  
> >  	if (exynos_crtc->ops->commit)
> >  		exynos_crtc->ops->commit(exynos_crtc);
> > -
> > -	exynos_plane_dpms(crtc->primary, DRM_MODE_DPMS_ON);
> 
> As i said, this needs to keep pair enabled flag of struct
> exynos_drm_plane.

The reason exynos needs that exynos_plane->enable is because it has its
own per-plane dpms state. There's two problems with that:
- It's highyl non-standard, the drm kms way is to just disable the plane
  and not have some additional knob on top.
- The atomic helpers will not be able to handle this. They assume that
  there's only one dpms knob for the entire display pipeline, and
  per-plane enable/disable is handled by setting plane->state->crtc, which
  must be set iff plane->state->fb is set right now.

I recommend we rip this all out if we can adjust existing userspace to
stop using the "mode" property on planes and crtcs.

And with that non-standard exynos plane mode thing gone we can indeed rip
out exynos_plane_dpms and exynos_plane->enabled and just directly call
manager->ops->win_enable/disble. And then rip out the win_enable since
it's unused.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
+41 (0) 79 365 57 48 - http://blog.ffwll.ch
