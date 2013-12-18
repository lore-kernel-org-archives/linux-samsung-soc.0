From: Daniel Drake <drake@endlessm.com>
Subject: Re: drm_do_probe_ddc_edid ENXIO check too aggressive?
Date: Wed, 18 Dec 2013 10:28:37 -0600
Message-ID: <CAD8Lp44Bty-zA9SBVqk_XRZPLY9gXXXmOd+kecxxRqF02LH-yw@mail.gmail.com>
References: <CAD8Lp44qijfMGtYVcA1xjgzzusA4SaR_mtUqzJiT1rRk+DZVEw@mail.gmail.com>
	<CAKMK7uFtCYajeHnnbMOe8VaWypj8aKM5O7CVXkROVjxqbk5VzA@mail.gmail.com>
	<CAD8Lp47DvhV1tg4ntBSvvUefOv29cutcXt17h2Pvp6HjBRLVnA@mail.gmail.com>
	<CAKMK7uG3tp1qnEUBh4=UKT7s4JjBwS--4kaKGf+4e1yFXmCKYA@mail.gmail.com>
	<CAD8Lp46aXTRA8uOory2zMrHakcG6pUf9jSxgYjo=_q5mZP3U_A@mail.gmail.com>
	<20131218084313.GD26371@phenom.ffwll.local>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wg0-f44.google.com ([74.125.82.44]:59974 "EHLO
	mail-wg0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753427Ab3LRQ2i (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 18 Dec 2013 11:28:38 -0500
Received: by mail-wg0-f44.google.com with SMTP id a1so7583996wgh.11
        for <linux-samsung-soc@vger.kernel.org>; Wed, 18 Dec 2013 08:28:37 -0800 (PST)
In-Reply-To: <20131218084313.GD26371@phenom.ffwll.local>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Daniel Vetter <daniel@ffwll.ch>
Cc: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>

On Wed, Dec 18, 2013 at 2:43 AM, Daniel Vetter <daniel@ffwll.ch> wrote:
> I think we can do it simpler. When you get a hpd interrupt you eventually
> call drm_helper_hpd_irq_event which will update all the state and poke
> connectors. I'd just create a delay_work which you launch from
> hdmi_irq_thread with a 1 second delay which again calls
> drm_helper_hpd_irq_event. That way you won't miss the EDID (presuming the
> user isn't _really_ careful with pluggin in the cable slowly).

OK, I like this more simplistic option.

However, one more pesky detail, if I am understanding your suggestion
correctly. You are hoping for:

1. I connect the display, causing HPD interrupt
2. hpd irq handler calls drm_helper_hpd_irq_event() directly. Fails to
read EDID, no big deal.
3. hpd irq handles schedules a work item to call
drm_helper_hpd_irq_event() a second time, 1 second later. Reads EDID
sucessfully, image gets output to display.

That doesn't quite work. drm_helper_hpd_irq_event() in step 2 notices
and records the state change (disconnected --> connected). And after
drm_helper_probe_single_connector_modes() fails to read the EDID, it
starts outputting an image at 1024x768. When we come to step 3, we
call drm_helper_hpd_irq_event again, but that just returns without
doing anything as it does not detect any new state change.

If we skip step 2, i.e. always delay the call to
drm_helper_hpd_irq_event by 1 second, the problem is solved. As a
user, the 1 second delay is not noticable. What do you think about
just doing this?

Daniel
