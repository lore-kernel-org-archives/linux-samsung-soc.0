From: Gustavo Padovan <gustavo@padovan.org>
Subject: Re: [PATCH v6 01/12] drm/exynos: atomic phase 1: use
 drm_plane_helper_update()
Date: Fri, 22 May 2015 12:27:54 -0300
Message-ID: <20150522152754.GC14089@joana>
References: <1432238571-31621-1-git-send-email-gustavo@padovan.org>
 <1432238571-31621-2-git-send-email-gustavo@padovan.org>
 <555EA660.3030109@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qk0-f181.google.com ([209.85.220.181]:35776 "EHLO
	mail-qk0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S964811AbbEVP17 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 22 May 2015 11:27:59 -0400
Received: by qkdn188 with SMTP id n188so13959691qkd.2
        for <linux-samsung-soc@vger.kernel.org>; Fri, 22 May 2015 08:27:58 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <555EA660.3030109@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Joonyoung Shim <jy0922.shim@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, dri-devel@lists.freedesktop.org, inki.dae@samsung.com, tjakobi@math.uni-bielefeld.de, Gustavo Padovan <gustavo.padovan@collabora.co.uk>

Hi Joonyoung,

2015-05-22 Joonyoung Shim <jy0922.shim@samsung.com>:

> On 05/22/2015 05:02 AM, Gustavo Padovan wrote:
> > From: Gustavo Padovan <gustavo.padovan@collabora.co.uk>
> > 
> > Rip out the check from exynos_update_plane() and create
> > exynos_check_plane() for the check phase enabling use to use
> > the atomic helpers to call our check and update phases when updating
> > planes.
> > 
> > Update all users of exynos_update_plane() accordingly to call
> > exynos_check_plane() before.
> > 
> > Signed-off-by: Gustavo Padovan <gustavo.padovan@collabora.co.uk>
> > ---
> >  drivers/gpu/drm/exynos/exynos_drm_crtc.c  | 29 +++++++++++-----------
> >  drivers/gpu/drm/exynos/exynos_drm_plane.c | 40 +++++++++++++++++++++++--------
> >  drivers/gpu/drm/exynos/exynos_drm_plane.h |  2 +-
> >  3 files changed, 46 insertions(+), 25 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/exynos/exynos_drm_crtc.c b/drivers/gpu/drm/exynos/exynos_drm_crtc.c
> > index 9006b94..61b8cfe 100644
> > --- a/drivers/gpu/drm/exynos/exynos_drm_crtc.c
> > +++ b/drivers/gpu/drm/exynos/exynos_drm_crtc.c
> > @@ -116,6 +116,7 @@ static int exynos_drm_crtc_mode_set_base(struct drm_crtc *crtc, int x, int y,
> >  	struct drm_framebuffer *fb = crtc->primary->fb;
> >  	unsigned int crtc_w;
> >  	unsigned int crtc_h;
> > +	int ret;
> >  
> >  	/* when framebuffer changing is requested, crtc's dpms should be on */
> >  	if (exynos_crtc->dpms > DRM_MODE_DPMS_ON) {
> > @@ -123,11 +124,16 @@ static int exynos_drm_crtc_mode_set_base(struct drm_crtc *crtc, int x, int y,
> >  		return -EPERM;
> >  	}
> >  
> > +	ret = exynos_check_plane(crtc->primary, fb);
> > +	if (ret)
> > +		return ret;
> > +
> >  	crtc_w = fb->width - x;
> >  	crtc_h = fb->height - y;
> > +	exynos_update_plane(crtc->primary, crtc, fb, 0, 0,
> > +			    crtc_w, crtc_h, x, y, crtc_w, crtc_h);
> >  
> > -	return exynos_update_plane(crtc->primary, crtc, fb, 0, 0,
> > -				   crtc_w, crtc_h, x, y, crtc_w, crtc_h);
> 
> I still think to need "[PATCH] drm/exynos: fix source data argument for
> plane" before merged atomic patches for bisect.
> 
> http://lists.freedesktop.org/archives/dri-devel/2015-April/081368.html

Right. I'll send this patch along with my v7 already rebased on it, so
it will be easier to pick up everything.

	Gustavo
