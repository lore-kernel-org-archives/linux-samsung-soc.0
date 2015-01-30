From: Gustavo Padovan <gustavo@padovan.org>
Subject: Re: [PATCH -v2] drm/exynos: track vblank events on a per crtc basis
Date: Fri, 30 Jan 2015 12:30:37 -0200
Message-ID: <20150130143037.GB30820@joana>
References: <1422016980-23806-2-git-send-email-gustavo@padovan.org>
 <1422551459-25812-1-git-send-email-gustavo@padovan.org>
 <54CAF028.6060902@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qc0-f180.google.com ([209.85.216.180]:36968 "EHLO
	mail-qc0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753492AbbA3Oan (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 30 Jan 2015 09:30:43 -0500
Received: by mail-qc0-f180.google.com with SMTP id r5so20556975qcx.11
        for <linux-samsung-soc@vger.kernel.org>; Fri, 30 Jan 2015 06:30:42 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <54CAF028.6060902@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Joonyoung Shim <jy0922.shim@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, dri-devel@lists.freedesktop.org, =?utf-8?B?IifrjIDsnbjquLAvTW9iaWxlIFMvVyBQbGF0Zm9ybSBMYWIuKO2GteyLoA==?= =?utf-8?B?7JewKS9FMyjsgqzsm5ApL+yCvOyEseyghOyekCci?= <inki.dae@samsung.com>

2015-01-30 Joonyoung Shim <jy0922.shim@samsung.com>:

> +Cc Inki,
> 
> Hi,
> 
> On 01/30/2015 02:10 AM, Gustavo Padovan wrote:
> > From: Mandeep Singh Baines <msb@chromium.org>
> > 
> > The goal of the change is to make sure we send the vblank event on the
> > current vblank. My hope is to fix any races that might be causing flicker.
> > After this change I only see a flicker in the transition plymouth and
> > X11.
> > 
> > Simplified the code by tracking vblank events on a per-crtc basis. This
> > allowed me to remove all error paths from the callback. It also allowed
> > me to remove the vblank wait from the callback.
> > 
> > Signed-off-by: Mandeep Singh Baines <msb@chromium.org>
> > Signed-off-by: Gustavo Padovan <gustavo.padovan@collabora.co.uk>
> > ---
> >  drivers/gpu/drm/exynos/exynos_drm_crtc.c | 29 +++++++----------------------
> >  drivers/gpu/drm/exynos/exynos_drm_drv.c  | 19 -------------------
> >  drivers/gpu/drm/exynos/exynos_drm_drv.h  |  6 ++----
> >  3 files changed, 9 insertions(+), 45 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/exynos/exynos_drm_crtc.c b/drivers/gpu/drm/exynos/exynos_drm_crtc.c
> > index a85c451..91c175b 100644
> > --- a/drivers/gpu/drm/exynos/exynos_drm_crtc.c
> > +++ b/drivers/gpu/drm/exynos/exynos_drm_crtc.c
> > @@ -34,9 +34,8 @@ static void exynos_drm_crtc_dpms(struct drm_crtc *crtc, int mode)
> >  	if (mode > DRM_MODE_DPMS_ON) {
> >  		/* wait for the completion of page flip. */
> >  		if (!wait_event_timeout(exynos_crtc->pending_flip_queue,
> > -				!atomic_read(&exynos_crtc->pending_flip),
> > -				HZ/20))
> > -			atomic_set(&exynos_crtc->pending_flip, 0);
> > +				(exynos_crtc->event == NULL), HZ/20))
> > +			exynos_crtc->event = NULL;
> >  		drm_crtc_vblank_off(crtc);
> >  	}
> >  
> > @@ -166,7 +165,6 @@ static int exynos_drm_crtc_page_flip(struct drm_crtc *crtc,
> >  				     uint32_t page_flip_flags)
> >  {
> >  	struct drm_device *dev = crtc->dev;
> > -	struct exynos_drm_private *dev_priv = dev->dev_private;
> >  	struct exynos_drm_crtc *exynos_crtc = to_exynos_crtc(crtc);
> >  	struct drm_framebuffer *old_fb = crtc->primary->fb;
> >  	unsigned int crtc_w, crtc_h;
> > @@ -195,9 +193,7 @@ static int exynos_drm_crtc_page_flip(struct drm_crtc *crtc,
> >  		}
> >  
> >  		spin_lock_irq(&dev->event_lock);
> > -		list_add_tail(&event->base.link,
> > -				&dev_priv->pageflip_event_list);
> > -		atomic_set(&exynos_crtc->pending_flip, 1);
> > +		exynos_crtc->event = event;
> 
> We will lose unfinished prior events by this change. That's why we use
> linked list.

I think you are right, but I was using exynos_crtc->event to do exactly the
same as exynos_crtc->pending_flip. So we were losing a event in
exynos_drm_crtc_dpms() before too. I change this patch to have a page_flip
list on the crtc. 

	Gustavo
