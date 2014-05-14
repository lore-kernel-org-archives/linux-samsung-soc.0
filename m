From: Ajay kumar <ajaynumb@gmail.com>
Subject: Re: [RFC V3 2/3] drm/bridge: add a dummy panel driver to support lvds bridges
Date: Wed, 14 May 2014 23:39:30 +0530
Message-ID: <CAEC9eQOvObG5CKb-GcpuSBXccSnVrEjQsBThAOJ4q5YECc6d0A@mail.gmail.com>
References: <1399647182-20951-1-git-send-email-ajaykumar.rs@samsung.com>
	<1399647182-20951-3-git-send-email-ajaykumar.rs@samsung.com>
	<20140513080501.GH6754@ulmo>
	<CAEC9eQN=AAOVFNqWp61zFsS1jtewyDb18oFP1VAuCjYhQWGRnA@mail.gmail.com>
	<20140514145402.GC8612@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ve0-f169.google.com ([209.85.128.169]:40103 "EHLO
	mail-ve0-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750906AbaENSJb (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 14 May 2014 14:09:31 -0400
Received: by mail-ve0-f169.google.com with SMTP id jx11so2937773veb.28
        for <linux-samsung-soc@vger.kernel.org>; Wed, 14 May 2014 11:09:30 -0700 (PDT)
In-Reply-To: <20140514145402.GC8612@ulmo>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Ajay Kumar <ajaykumar.rs@samsung.com>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Daniel Vetter <daniel.vetter@ffwll.ch>, sunil joshi <joshi@samsung.com>, Andrzej Hajda <a.hajda@samsung.com>, Prashanth G <prashanth.g@samsung.com>

On Wed, May 14, 2014 at 8:24 PM, Thierry Reding
<thierry.reding@gmail.com> wrote:
> On Tue, May 13, 2014 at 10:19:33PM +0530, Ajay kumar wrote:
>> On Tue, May 13, 2014 at 1:35 PM, Thierry Reding
>> <thierry.reding@gmail.com> wrote:
>> > On Fri, May 09, 2014 at 08:23:01PM +0530, Ajay Kumar wrote:
>> >> implement basic panel controls as a drm_bridge so that
>> >> the existing bridges can make use of it.
>> >>
>> >> The driver assumes that it is the last entity in the bridge chain.
>> >>
>> >> Signed-off-by: Ajay Kumar <ajaykumar.rs@samsung.com>
>> >> ---
>> >>  .../bindings/drm/bridge/bridge_panel.txt           |   45 ++++
>> >
>> > Can we please stop adding files to this directory? Device tree bindings
>> > are supposed to be OS agnostic, but DRM is specific to Linux and should
>> > not be used when describing hardware.
>> One should not be adding a devicetree node if it is not describing the
>> actual hardware?
>
> Correct. But my point is that even if you describe actual hardware, then
> the bindings don't belong in a drm subdirectory, because DRM does not
> make any sense in a hardware context.
>
> Something like video/bridge may be a better name for a directory.
Ok, this is just about the name.

>> >> diff --git a/Documentation/devicetree/bindings/drm/bridge/bridge_panel.txt b/Documentation/devicetree/bindings/drm/bridge/bridge_panel.txt
>> > [...]
>> >> +     -led-en-gpio:
>> >> +             eDP panel LED enable GPIO.
>> >> +                     Indicates which GPIO needs to be powered up as output
>> >> +                     to enable the backlight.
>> >
>> > Since this is used to control a backlight, then this should really be a
>> > separate node to describe the backlight device (and use the
>> > corresponding backlight driver) rather than duplicating a subset of that
>> > functionality.
>> I am stressing this point again!
>> Backlight should ideally be enabled only after:
>> 1) Panel is powered up (LCD_VDD)
>> 2) HPD is thrown.
>> 3) Valid data starts coming from the encoder(DP in our case)
>> All the above 3 are controlled inside drm, but pwm-backlight is
>> independent of drm. So, we let the pwm_config happen in pwm-backlight driver
>> and enable backlight GPIO(BL_EN) inside drm, after valid video data starts
>> coming out of the encoder.
>
> But that's completely the wrong way around. Why can't you simply control
> the backlight from within DRM and only enable it at the right time?
I am trying to reuse existing code as much as possible. pwm-backlight driver
takes care of generating proper pwm signals for the given backlight value,
so I am reusing that part of it. Even though it also provides a way to handle
"backlight enable" pin(which is ofcourse optional) I wish to control it in the
panel drvier, because generally all panel datasheets say you should control
backlight enable along with panel controls.

>> As you said, we can get this GPIO from a backlight device node, but since
>> this GPIO is related to panel also, I think conceptually its not wrong
>> to have this
>> GPIO binding defined in a panel node.
>
> It's not related to the panel. It's an enable for the backlight.
> Backlight could be considered part of the panel, therefore it makes
> sense to control the backlight from the panel driver.
Ok. This GPIO goes from my AP to the backlight unit of the panel.
Basically, a board related GPIO which exists on all the boards.
Where should I be handling this?

>> >> +     -panel-pre-enable-delay:
>> >> +             delay value in ms required for panel_pre_enable process
>> >> +                     Delay in ms needed for the eDP panel LCD unit to
>> >> +                     powerup, and delay needed between panel_VCC and
>> >> +                     video_enable.
>> >
>> > What are panel_VCC or video_enable?
>> It is the time taken for the panel to throw a valid HPD from the point
>> we enabled LCD_VCC.
>> After HPD is thrown, we can start sending video data.
>
> What does "throw a valid HPD" mean? Is it an actual signal that can be
> captured via software (GPIO, interrupt, ...)? If so then it would be
> preferable to not use a delay at all but rather rely on that mechanism
> to determine when it's safe to send a video signal.
Right, your explanation holds good, but only for the case of eDP panels.
But, when we use eDP-LVDS bridges(ps8622), its a different case!
the bridge takes care of sending HPD, so the encoder gets HPD interrupt
and tries to read edid from the panel, but the panel might not have powered up
enough to read edid. In such cases we would need delay.
So, having a delay field here would be really useful.
May be, while describing this particular DT binding I should elaborate more.

>> >> +     -panel-enable-delay:
>> >> +             delay value in ms required for panel_enable process
>> >> +                     Delay in ms needed for the eDP panel backlight/LED unit
>> >> +                     to powerup, and delay needed between video_enable and
>> >> +                     BL_EN.
>> >
>> > Similarily, what does BL_EN stand for?
>> Backlight Enable, same as "enable-gpios" in pwm-backlight driver.
>
> When writing a binding it's useful to describe these things without
> referring to signal names or abbreviations, since they may be something
> else for different people.
Ok. Will take care of this from now on :)

>> >> diff --git a/drivers/gpu/drm/bridge/bridge_panel.c b/drivers/gpu/drm/bridge/bridge_panel.c
>> > [...]
>> >
>> > This duplicates much of the functionality that panels should provide. I
>> > think a better solution would be to properly integrate panels with
>> > bridges.
>> True, ideally I should be calling drm_panel functions from a simple dummy
>> bridge which sits at the end of the bridge chain. But, since you are not
>> convinced with having pre_enable and post_disable calls for panels, I had
>> no other way to do this, than stuffing these panel controls inside
>> bridge! :(
>
> What makes you think that I would suddenly be any more convinced by this
> solution than by your prior proposal? I didn't say outright no to what
> you proposed earlier. What I said was that I didn't like it and that I
> thought we could come up with a better solution. Part of getting to a
> better solution is trying to understand the problems involved. You don't
> solve a problem by simply moving code into a different driver.
Ok. What is better solution according to you?
Handling the backlight enable GPIO in pwm-backlight driver is not
a better soultion "ALWAYS". Sometimes, we may just need to control it
along with video encoders. And, even the panel datasheets mention that
in "Power On/off sequence" chapter.
And, I have explained the problems and feasible solutions.
If drm_panel can support pre_enable/post_disable, we can easily
implement a generic bridge which sits at the end of bridge chain, and calls
corresponding drm_panel functions.

Please see the discussion happening here:
https://www.mail-archive.com/linux-samsung-soc@vger.kernel.org/msg30586.html


Ajay
