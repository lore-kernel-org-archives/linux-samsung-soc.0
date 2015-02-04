From: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH 11/14] drm/exynos: atomic phase 2: keep track of
 framebuffer pointer
Date: Wed, 4 Feb 2015 15:33:02 +0100
Message-ID: <20150204143302.GJ14009@phenom.ffwll.local>
References: <1422990871-21355-1-git-send-email-gustavo@padovan.org>
 <1422990871-21355-12-git-send-email-gustavo@padovan.org>
 <54D1CFE8.6070100@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wg0-f47.google.com ([74.125.82.47]:37474 "EHLO
	mail-wg0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S933819AbbBDObk (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 4 Feb 2015 09:31:40 -0500
Received: by mail-wg0-f47.google.com with SMTP id n12so2066508wgh.6
        for <linux-samsung-soc@vger.kernel.org>; Wed, 04 Feb 2015 06:31:39 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <54D1CFE8.6070100@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Joonyoung Shim <jy0922.shim@samsung.com>
Cc: Gustavo Padovan <gustavo@padovan.org>, linux-samsung-soc@vger.kernel.org, Gustavo Padovan <gustavo.padovan@collabora.co.uk>, dri-devel@lists.freedesktop.org

On Wed, Feb 04, 2015 at 04:53:12PM +0900, Joonyoung Shim wrote:
> Hi,
> 
> On 02/04/2015 04:14 AM, Gustavo Padovan wrote:
> > From: Gustavo Padovan <gustavo.padovan@collabora.co.uk>
> > 
> > Use drm_atomic_set_fb_for_plane() in the legacy page_flip path to keep
> > track of the framebuffer pointer and reference.
> > 
> > Signed-off-by: Gustavo Padovan <gustavo.padovan@collabora.co.uk>
> > ---
> >  drivers/gpu/drm/exynos/exynos_drm_crtc.c | 3 +++
> >  1 file changed, 3 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/exynos/exynos_drm_crtc.c b/drivers/gpu/drm/exynos/exynos_drm_crtc.c
> > index 660ad64..2edc73c 100644
> > --- a/drivers/gpu/drm/exynos/exynos_drm_crtc.c
> > +++ b/drivers/gpu/drm/exynos/exynos_drm_crtc.c
> > @@ -211,6 +211,9 @@ static int exynos_drm_crtc_page_flip(struct drm_crtc *crtc,
> >  			    crtc_w, crtc_h, crtc->x, crtc->y,
> >  			    crtc_w, crtc_h);
> >  
> > +	if (crtc->primary->state)
> > +		drm_atomic_set_fb_for_plane(crtc->primary->state, fb);
> > +
> 
> I'm not sure whether this needs, how about go to
> drm_atomic_helper_page_flip?

You can only do that once you have full async atomic commit support, which
is done in phase 3. Until that's the case you need to keep this little bit
of temporary fixup code around.

I've had the same in my exynos branch, we have the same now in i915 (well
it looks a bit different since we dont use all the helpers but roll some
things ourselves).

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> 
> Thanks.
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> http://lists.freedesktop.org/mailman/listinfo/dri-devel

-- 
Daniel Vetter
Software Engineer, Intel Corporation
+41 (0) 79 365 57 48 - http://blog.ffwll.ch
