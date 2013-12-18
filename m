From: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: drm_do_probe_ddc_edid ENXIO check too aggressive?
Date: Wed, 18 Dec 2013 09:43:13 +0100
Message-ID: <20131218084313.GD26371@phenom.ffwll.local>
References: <CAD8Lp44qijfMGtYVcA1xjgzzusA4SaR_mtUqzJiT1rRk+DZVEw@mail.gmail.com>
 <CAKMK7uFtCYajeHnnbMOe8VaWypj8aKM5O7CVXkROVjxqbk5VzA@mail.gmail.com>
 <CAD8Lp47DvhV1tg4ntBSvvUefOv29cutcXt17h2Pvp6HjBRLVnA@mail.gmail.com>
 <CAKMK7uG3tp1qnEUBh4=UKT7s4JjBwS--4kaKGf+4e1yFXmCKYA@mail.gmail.com>
 <CAD8Lp46aXTRA8uOory2zMrHakcG6pUf9jSxgYjo=_q5mZP3U_A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ee0-f48.google.com ([74.125.83.48]:34132 "EHLO
	mail-ee0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751072Ab3LRImW (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 18 Dec 2013 03:42:22 -0500
Received: by mail-ee0-f48.google.com with SMTP id e49so3355477eek.7
        for <linux-samsung-soc@vger.kernel.org>; Wed, 18 Dec 2013 00:42:20 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <CAD8Lp46aXTRA8uOory2zMrHakcG6pUf9jSxgYjo=_q5mZP3U_A@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Daniel Drake <drake@endlessm.com>
Cc: Daniel Vetter <daniel@ffwll.ch>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, "Dodonov, Eugeni" <eugeni.dodonov@intel.com>, chris@hchris-wilson.co.uk, dri-devel <dri-devel@lists.freedesktop.org>

On Tue, Dec 17, 2013 at 09:12:42AM -0600, Daniel Drake wrote:
> On Mon, Dec 16, 2013 at 5:40 PM, Daniel Vetter <daniel@ffwll.ch> wrote:
> > Have a bit of logic in the exynos ->detect function to re-try a 2nd
> > round of edid probing after each hdp interrupt if the first one
> > returns an -ENXIO. Only tricky part is to be careful with edge
> > detection so that userspace gets all the hotplug events still.
> > Presuming you don't have any funkiness with reprobing causing yet
> > another hpd interrupt and stuff like that (seen it all), as long as
> > you're using the helpers in drm_crtc_helper.c it should all be working
> > correctly. So you want a work item which just grabs all modeset locks
> > and then calls drm_helper_probe_single_connector_modes or something on
> > the right connector.
> 
> Thanks for the tips. Having trouble sticking to those details though.
> exynos_drm_connector_detect() is actually a long way away from EDID
> probing so it is hard to detect the ENXIO case there.

Yeah, was a bit hand-wavy ;-)

> What happens here is:
> exynos hdmi_irq_thread() calls drm_helper_hpd_irq_event()
> That then calls exynos_drm_connector_detect(), which returns a simple
> "yes, hpd detection says we are connected"
> Then it calls drm_kms_helper_hotplug_event() for which the call chain is:
> 
> drm_kms_helper_hotplug_event
> exynos_drm_output_poll_changed
> drm_fb_helper_hotplug_event
> drm_fb_helper_probe_connector_mode
> exynos_drm_connector_fill_modes
> drm_helper_probe_single_connector_modes
> exynos_drm_connector_get_modes
> drm_get_edid
> drm_do_get_edid
> drm_do_probe_ddc_edid <-- ENXIO in here
> 
> drm_do_probe_ddc_edid actually swallows the ENXIO code and just
> returns -1, so that particular error is indistinguishable from others.
> 
> Trying to follow your suggestions, the closest would seem to be something like:
> 
> 1. Modify exynos_drm_connector_detect to read and cache the EDID right
> away. If EDID read fails for any reason, report "no connection" and
> schedule a work item to retry the EDID read. If the later EDID read
> succeeds, call drm_kms_helper_hotplug_event()
> 
> 2. Modify exynos_drm_connector_get_modes to return cached EDID

I think we can do it simpler. When you get a hpd interrupt you eventually
call drm_helper_hpd_irq_event which will update all the state and poke
connectors. I'd just create a delay_work which you launch from
hdmi_irq_thread with a 1 second delay which again calls
drm_helper_hpd_irq_event. That way you won't miss the EDID (presuming the
user isn't _really_ careful with pluggin in the cable slowly).

It's a bit inefficient but also doesn't really matter since hpd don't
happen often. And when they do userspace usually wants to do a modeset
anyway, so an added 30ms to read the edid twice won't really hurt.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
+41 (0) 79 365 57 48 - http://blog.ffwll.ch
