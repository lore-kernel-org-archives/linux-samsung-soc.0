From: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH 2/6] drm/exynos: track vblank events on a per crtc basis
Date: Tue, 27 Jan 2015 14:02:48 +0100
Message-ID: <20150127130248.GA4764@phenom.ffwll.local>
References: <1422016980-23806-1-git-send-email-gustavo@padovan.org>
 <1422016980-23806-2-git-send-email-gustavo@padovan.org>
 <CAPj87rNsVBAYxOA-Ob3poeqZFDTU2GVJh74+89frb8YSBN8Zzg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wg0-f45.google.com ([74.125.82.45]:59749 "EHLO
	mail-wg0-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932372AbbA0NDR (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 27 Jan 2015 08:03:17 -0500
Received: by mail-wg0-f45.google.com with SMTP id x12so14650730wgg.4
        for <linux-samsung-soc@vger.kernel.org>; Tue, 27 Jan 2015 05:03:16 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <CAPj87rNsVBAYxOA-Ob3poeqZFDTU2GVJh74+89frb8YSBN8Zzg@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Daniel Stone <daniel@fooishbar.org>
Cc: Gustavo Padovan <gustavo@padovan.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>

On Tue, Jan 27, 2015 at 12:59:15PM +0000, Daniel Stone wrote:
> Hi,
> 
> On 23 January 2015 at 12:42, Gustavo Padovan <gustavo@padovan.org> wrote:
> >  void exynos_drm_crtc_finish_pageflip(struct drm_device *dev, int pipe)
> >  {
> >         struct exynos_drm_private *dev_priv = dev->dev_private;
> > -       struct drm_pending_vblank_event *e, *t;
> >         struct drm_crtc *drm_crtc = dev_priv->crtc[pipe];
> >         struct exynos_drm_crtc *exynos_crtc = to_exynos_crtc(drm_crtc);
> > -       unsigned long flags;
> >
> > -       spin_lock_irqsave(&dev->event_lock, flags);
> > +       if (exynos_crtc->event) {
> >
> > -       list_for_each_entry_safe(e, t, &dev_priv->pageflip_event_list,
> > -                       base.link) {
> > -               /* if event's pipe isn't same as crtc then ignore it. */
> > -               if (pipe != e->pipe)
> > -                       continue;
> > -
> > -               list_del(&e->base.link);
> > -               drm_send_vblank_event(dev, -1, e);
> > +               spin_lock_irq(&dev->event_lock);
> > +               drm_send_vblank_event(dev, -1, exynos_crtc->event);
> >                 drm_vblank_put(dev, pipe);
> > -               atomic_set(&exynos_crtc->pending_flip, 0);
> >                 wake_up(&exynos_crtc->pending_flip_queue);
> > -       }
> > +               spin_unlock_irq(&dev->event_lock);
> >
> > -       spin_unlock_irqrestore(&dev->event_lock, flags);
> > +               exynos_crtc->event = NULL;
> > +       }
> >  }
> 
> Doesn't this need to hold the CRTC lock to not race with, e.g, the
> page_flip caller? This gets called from IRQ context though, so might
> need conversion to soft-IRQ to do so, or another per-CRTC spinlock
> just to protect the event.

dev->even_lock should be enough, but I suspect that lock also protects
exynos_crtc->event (at least that's the case in i915.ko). So would need to
be moved out of the if block again.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
+41 (0) 79 365 57 48 - http://blog.ffwll.ch
