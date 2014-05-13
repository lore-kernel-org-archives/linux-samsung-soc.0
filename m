From: Ajay kumar <ajaynumb@gmail.com>
Subject: Re: [RFC V3 2/3] drm/bridge: add a dummy panel driver to support lvds bridges
Date: Tue, 13 May 2014 22:19:33 +0530
Message-ID: <CAEC9eQN=AAOVFNqWp61zFsS1jtewyDb18oFP1VAuCjYhQWGRnA@mail.gmail.com>
References: <1399647182-20951-1-git-send-email-ajaykumar.rs@samsung.com>
	<1399647182-20951-3-git-send-email-ajaykumar.rs@samsung.com>
	<20140513080501.GH6754@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ve0-f180.google.com ([209.85.128.180]:55463 "EHLO
	mail-ve0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751035AbaEMQte (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 13 May 2014 12:49:34 -0400
Received: by mail-ve0-f180.google.com with SMTP id db12so788930veb.39
        for <linux-samsung-soc@vger.kernel.org>; Tue, 13 May 2014 09:49:33 -0700 (PDT)
In-Reply-To: <20140513080501.GH6754@ulmo>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Ajay Kumar <ajaykumar.rs@samsung.com>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Daniel Vetter <daniel.vetter@ffwll.ch>, sunil joshi <joshi@samsung.com>, Andrzej Hajda <a.hajda@samsung.com>, Prashanth G <prashanth.g@samsung.com>

On Tue, May 13, 2014 at 1:35 PM, Thierry Reding
<thierry.reding@gmail.com> wrote:
> On Fri, May 09, 2014 at 08:23:01PM +0530, Ajay Kumar wrote:
>> implement basic panel controls as a drm_bridge so that
>> the existing bridges can make use of it.
>>
>> The driver assumes that it is the last entity in the bridge chain.
>>
>> Signed-off-by: Ajay Kumar <ajaykumar.rs@samsung.com>
>> ---
>>  .../bindings/drm/bridge/bridge_panel.txt           |   45 ++++
>
> Can we please stop adding files to this directory? Device tree bindings
> are supposed to be OS agnostic, but DRM is specific to Linux and should
> not be used when describing hardware.
One should not be adding a devicetree node if it is not describing the
actual hardware?

>> diff --git a/Documentation/devicetree/bindings/drm/bridge/bridge_panel.txt b/Documentation/devicetree/bindings/drm/bridge/bridge_panel.txt
> [...]
>> +     -led-en-gpio:
>> +             eDP panel LED enable GPIO.
>> +                     Indicates which GPIO needs to be powered up as output
>> +                     to enable the backlight.
>
> Since this is used to control a backlight, then this should really be a
> separate node to describe the backlight device (and use the
> corresponding backlight driver) rather than duplicating a subset of that
> functionality.
I am stressing this point again!
Backlight should ideally be enabled only after:
1) Panel is powered up (LCD_VDD)
2) HPD is thrown.
3) Valid data starts coming from the encoder(DP in our case)
All the above 3 are controlled inside drm, but pwm-backlight is
independent of drm. So, we let the pwm_config happen in pwm-backlight driver
and enable backlight GPIO(BL_EN) inside drm, after valid video data starts
coming out of the encoder.
As you said, we can get this GPIO from a backlight device node, but since
this GPIO is related to panel also, I think conceptually its not wrong
to have this
GPIO binding defined in a panel node.

>> +     -panel-pre-enable-delay:
>> +             delay value in ms required for panel_pre_enable process
>> +                     Delay in ms needed for the eDP panel LCD unit to
>> +                     powerup, and delay needed between panel_VCC and
>> +                     video_enable.
>
> What are panel_VCC or video_enable?
It is the time taken for the panel to throw a valid HPD from the point
we enabled LCD_VCC.
After HPD is thrown, we can start sending video data.
>> +     -panel-enable-delay:
>> +             delay value in ms required for panel_enable process
>> +                     Delay in ms needed for the eDP panel backlight/LED unit
>> +                     to powerup, and delay needed between video_enable and
>> +                     BL_EN.
>
> Similarily, what does BL_EN stand for?
Backlight Enable, same as "enable-gpios" in pwm-backlight driver.

>> +     bridge-panel {
>> +             compatible = "drm-bridge,panel";
>
> Again, drm- doesn't mean anything outside of Linux (and maybe BSD),
> therefore shouldn't be used to describe hardware in device tree.
Agreed. :)

>> diff --git a/drivers/gpu/drm/bridge/bridge_panel.c b/drivers/gpu/drm/bridge/bridge_panel.c
> [...]
>
> This duplicates much of the functionality that panels should provide. I
> think a better solution would be to properly integrate panels with
> bridges.
True, ideally I should be calling drm_panel functions from a simple dummy bridge
which sits at the end of the bridge chain. But, since you are not
convinced with having
pre_enable and post_disable calls for panels, I had no other way to do
this, than
stuffing these panel controls inside bridge! :(
See the discussion here. I have already explained this!
http://www.spinics.net/lists/dri-devel/msg57973.html

Ajay
