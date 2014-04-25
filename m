From: Ajay kumar <ajaynumb@gmail.com>
Subject: Re: [PATCH V2 2/9] drm/panel: add pre_enable and post_disable routines
Date: Fri, 25 Apr 2014 11:34:48 +0530
Message-ID: <CAEC9eQNCnp5GzrG82OKf5LOo=VE1S-aKy5OVQTEAG53RX4QDnw@mail.gmail.com>
References: <1398119958-32005-1-git-send-email-ajaykumar.rs@samsung.com>
	<1398119958-32005-3-git-send-email-ajaykumar.rs@samsung.com>
	<20140422081948.GA17275@ulmo>
	<CAEC9eQO8Kahh2YVO4nCjk2m+TzJNJ_iSkVRLe0NM_yqL9uPNaw@mail.gmail.com>
	<20140423072915.GV10722@phenom.ffwll.local>
	<20140423074212.GF31226@ulmo>
	<CAEC9eQNCvfUbaRL7DnNVF21QjwCX2E2sndHRDvLUE9EL1cVN4Q@mail.gmail.com>
	<20140424183104.GB27443@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-vc0-f173.google.com ([209.85.220.173]:45365 "EHLO
	mail-vc0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751176AbaDYGEt (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 25 Apr 2014 02:04:49 -0400
Received: by mail-vc0-f173.google.com with SMTP id il7so4187585vcb.18
        for <linux-samsung-soc@vger.kernel.org>; Thu, 24 Apr 2014 23:04:48 -0700 (PDT)
In-Reply-To: <20140424183104.GB27443@ulmo>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Daniel Vetter <daniel@ffwll.ch>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Sean Paul <seanpaul@google.com>, sunil joshi <joshi@samsung.com>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, Prashanth G <prashanth.g@samsung.com>, Ajay Kumar <ajaykumar.rs@samsung.com>

On Friday, April 25, 2014, Thierry Reding <thierry.reding@gmail.com> wrote:
>
> On Thu, Apr 24, 2014 at 12:56:02AM +0530, Ajay kumar wrote:
> > Thierry,
> >
> > On Wed, Apr 23, 2014 at 1:12 PM, Thierry Reding
> > <thierry.reding@gmail.com> wrote:
> > > On Wed, Apr 23, 2014 at 09:29:15AM +0200, Daniel Vetter wrote:
> [...]
> > >> Imo this makes sense, especially if we go through with the idea talked
> > >> about yesterday of creating a drm_bridge to wrap-up a drm_panel with
> > >> sufficient isolation between all components.
> > >
> > > I'm not at all comfortable with these. The names are totally confusing.
> > > Next somebody will need to do something after the panel has been enabled
> > > and we'll have to introduce .post_enable() and .pre_disable() functions.
> > > And worse, what if somebody needs something to be done between
> > > .pre_enable() and .enable()? .post_pre_enable()? Where does it end?
> > >
> > > According to the above description the only reason why we need this is
> > > to avoid visible glitches when the panel is already on, but the video
> > > stream hasn't started yet. If that's the only reason why we need this,
> > > then perhaps adding a way for a panel to expose the associated backlight
> > > would be better?
> > Actually, we need not expose the entire backlight device.
> > AFAIK, the glitch is caused when you enable BL_EN before
> > there is valid video data. So, one way to mask off the glitch is to
> > follow this sequence:
> > -- power up the panel.
> > -- start video data, (start PWM here or)
> > -- (start PWM here), enable backlight
>
> That's very difficult to get right, isn't it? Even if you have fine-
> grained control over what to enable you still need a way to determine
> _when_ it's safe to enable the backlight. Typically I guess that would
> be the duration of one frame (or perhaps 2, depending on when the panel
> syncs to the video signal).
We need not "determine", its already present in LVDS datasheet.
The LVDS datasheet says at least 200ms delay is needed from "Valid
data" to "BL on".

> Perhaps it could even by sync'ed to the VBLANK?
No. vblanks are related to crtc. And the bridge/panel driver should be
independent of vblank.

> > The problem is that the above scenario cannot be mapped to panel-simple driver.
> > IMO, panel_simple should provide enable/disable controls both for LCD
> > and backlight.
> > something like panel_simple_lcd_enable/panel_simple_led_enable, and
> > panel_simple_lcd_disable/panel_simple_led_disable.
>
> That's not what the simple panel driver can do. If we want this it needs
> to be solved in a generic way for all panels since they all need to use
> the drm_panel_*() functions to abstract away the details from drivers
> that use the panels.
Right. So only I have added pre_enable and post_disable callbacks.
Using that name won't harm existing panel drivers and still addresses
our requirement.


Regards,
Ajay
