From: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: drm_do_probe_ddc_edid ENXIO check too aggressive?
Date: Wed, 18 Dec 2013 18:15:50 +0100
Message-ID: <20131218171550.GP26371@phenom.ffwll.local>
References: <CAD8Lp44qijfMGtYVcA1xjgzzusA4SaR_mtUqzJiT1rRk+DZVEw@mail.gmail.com>
 <CAKMK7uFtCYajeHnnbMOe8VaWypj8aKM5O7CVXkROVjxqbk5VzA@mail.gmail.com>
 <CAD8Lp47DvhV1tg4ntBSvvUefOv29cutcXt17h2Pvp6HjBRLVnA@mail.gmail.com>
 <CAKMK7uG3tp1qnEUBh4=UKT7s4JjBwS--4kaKGf+4e1yFXmCKYA@mail.gmail.com>
 <CAD8Lp46aXTRA8uOory2zMrHakcG6pUf9jSxgYjo=_q5mZP3U_A@mail.gmail.com>
 <20131218084313.GD26371@phenom.ffwll.local>
 <CAD8Lp44Bty-zA9SBVqk_XRZPLY9gXXXmOd+kecxxRqF02LH-yw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ea0-f181.google.com ([209.85.215.181]:46944 "EHLO
	mail-ea0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754356Ab3LRRO6 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 18 Dec 2013 12:14:58 -0500
Received: by mail-ea0-f181.google.com with SMTP id m10so3663445eaj.26
        for <linux-samsung-soc@vger.kernel.org>; Wed, 18 Dec 2013 09:14:57 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <CAD8Lp44Bty-zA9SBVqk_XRZPLY9gXXXmOd+kecxxRqF02LH-yw@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Daniel Drake <drake@endlessm.com>
Cc: Daniel Vetter <daniel@ffwll.ch>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>

On Wed, Dec 18, 2013 at 10:28:37AM -0600, Daniel Drake wrote:
> On Wed, Dec 18, 2013 at 2:43 AM, Daniel Vetter <daniel@ffwll.ch> wrote:
> > I think we can do it simpler. When you get a hpd interrupt you eventually
> > call drm_helper_hpd_irq_event which will update all the state and poke
> > connectors. I'd just create a delay_work which you launch from
> > hdmi_irq_thread with a 1 second delay which again calls
> > drm_helper_hpd_irq_event. That way you won't miss the EDID (presuming the
> > user isn't _really_ careful with pluggin in the cable slowly).
> 
> OK, I like this more simplistic option.
> 
> However, one more pesky detail, if I am understanding your suggestion
> correctly. You are hoping for:
> 
> 1. I connect the display, causing HPD interrupt
> 2. hpd irq handler calls drm_helper_hpd_irq_event() directly. Fails to
> read EDID, no big deal.
> 3. hpd irq handles schedules a work item to call
> drm_helper_hpd_irq_event() a second time, 1 second later. Reads EDID
> sucessfully, image gets output to display.
> 
> That doesn't quite work. drm_helper_hpd_irq_event() in step 2 notices
> and records the state change (disconnected --> connected). And after
> drm_helper_probe_single_connector_modes() fails to read the EDID, it
> starts outputting an image at 1024x768. When we come to step 3, we
> call drm_helper_hpd_irq_event again, but that just returns without
> doing anything as it does not detect any new state change.
> 
> If we skip step 2, i.e. always delay the call to
> drm_helper_hpd_irq_event by 1 second, the problem is solved. As a
> user, the 1 second delay is not noticable. What do you think about
> just doing this?

Oh right, if you use the hpd pin for detection then this will happen. So I
guess always delaying is the right option. Or you could make the connector
state only conditional on an edid being present for HDMI, which would also
work.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
+41 (0) 79 365 57 48 - http://blog.ffwll.ch
