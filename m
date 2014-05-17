From: Ajay kumar <ajaynumb@gmail.com>
Subject: Re: [RFC V3 2/3] drm/bridge: add a dummy panel driver to support lvds bridges
Date: Sun, 18 May 2014 02:03:32 +0530
Message-ID: <CAEC9eQN8Kwg+WfGTFopNMEif1PhgxoJo2vt4-+oZEgbHDEnUzA@mail.gmail.com>
References: <1399647182-20951-1-git-send-email-ajaykumar.rs@samsung.com>
	<1399647182-20951-3-git-send-email-ajaykumar.rs@samsung.com>
	<20140513080501.GH6754@ulmo>
	<CAEC9eQN=AAOVFNqWp61zFsS1jtewyDb18oFP1VAuCjYhQWGRnA@mail.gmail.com>
	<20140514145402.GC8612@ulmo>
	<CAEC9eQOvObG5CKb-GcpuSBXccSnVrEjQsBThAOJ4q5YECc6d0A@mail.gmail.com>
	<20140515081321.GF5952@ulmo>
	<CAEC9eQM_KtHDRaYGCmeT3f61+Rwh5oG2xWDNTTMkQCht6kAydQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ve0-f176.google.com ([209.85.128.176]:54006 "EHLO
	mail-ve0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751461AbaEQUdd (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 17 May 2014 16:33:33 -0400
Received: by mail-ve0-f176.google.com with SMTP id jz11so4712859veb.21
        for <linux-samsung-soc@vger.kernel.org>; Sat, 17 May 2014 13:33:32 -0700 (PDT)
In-Reply-To: <CAEC9eQM_KtHDRaYGCmeT3f61+Rwh5oG2xWDNTTMkQCht6kAydQ@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Ajay Kumar <ajaykumar.rs@samsung.com>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Daniel Vetter <daniel.vetter@ffwll.ch>, sunil joshi <joshi@samsung.com>, Andrzej Hajda <a.hajda@samsung.com>, Prashanth G <prashanth.g@samsung.com>

ping.

On Thu, May 15, 2014 at 5:10 PM, Ajay kumar <ajaynumb@gmail.com> wrote:
> On Thu, May 15, 2014 at 1:43 PM, Thierry Reding
> <thierry.reding@gmail.com> wrote:
>> On Wed, May 14, 2014 at 11:39:30PM +0530, Ajay kumar wrote:
>> [...]
>>> >> >> diff --git a/Documentation/devicetree/bindings/drm/bridge/bridge_panel.txt b/Documentation/devicetree/bindings/drm/bridge/bridge_panel.txt
>>> >> > [...]
>>> >> >> +     -led-en-gpio:
>>> >> >> +             eDP panel LED enable GPIO.
>>> >> >> +                     Indicates which GPIO needs to be powered up as output
>>> >> >> +                     to enable the backlight.
>>> >> >
>>> >> > Since this is used to control a backlight, then this should really be a
>>> >> > separate node to describe the backlight device (and use the
>>> >> > corresponding backlight driver) rather than duplicating a subset of that
>>> >> > functionality.
>>> >> I am stressing this point again!
>>> >> Backlight should ideally be enabled only after:
>>> >> 1) Panel is powered up (LCD_VDD)
>>> >> 2) HPD is thrown.
>>> >> 3) Valid data starts coming from the encoder(DP in our case)
>>> >> All the above 3 are controlled inside drm, but pwm-backlight is
>>> >> independent of drm. So, we let the pwm_config happen in pwm-backlight driver
>>> >> and enable backlight GPIO(BL_EN) inside drm, after valid video data starts
>>> >> coming out of the encoder.
>>> >
>>> > But that's completely the wrong way around. Why can't you simply control
>>> > the backlight from within DRM and only enable it at the right time?
>>> I am trying to reuse existing code as much as possible. pwm-backlight driver
>>> takes care of generating proper pwm signals for the given backlight value,
>>> so I am reusing that part of it. Even though it also provides a way to handle
>>> "backlight enable" pin(which is ofcourse optional) I wish to control it in the
>>> panel drvier, because generally all panel datasheets say you should control
>>> backlight enable along with panel controls.
>>
>> I still don't see how controlling the enable GPIO from the panel will be
>> in any way better, or different for that matter, from simply enabling
>> the backlight and let the backlight driver handle the enable GPIO. Have
>> you tried to do that and found that it doesn't work?
> It works, but it gives me glitch when I try to configure video.
> This is because backlight_on(pwm-backlight) happens much before
> I configure video(inside drm), and while configuring video there would
> be a glitch,
> and that glitch would be visible to the user since backlight is already enabled.
>
> On the other hand, if I choose to delay enabling backlight till I am sure enough
> that video is properly configured, then even though the glitch comes up, the
> user cannot make it out since backlight if off - a better user experience!
>
>>> >> As you said, we can get this GPIO from a backlight device node, but since
>>> >> this GPIO is related to panel also, I think conceptually its not wrong
>>> >> to have this
>>> >> GPIO binding defined in a panel node.
>>> >
>>> > It's not related to the panel. It's an enable for the backlight.
>>> > Backlight could be considered part of the panel, therefore it makes
>>> > sense to control the backlight from the panel driver.
>>> Ok. This GPIO goes from my AP to the backlight unit of the panel.
>>> Basically, a board related GPIO which exists on all the boards.
>>> Where should I be handling this?
>>
>> In the driver that handles the backlight unit. That is: pwm-backlight.
>>
>>> >> > What are panel_VCC or video_enable?
>>> >> It is the time taken for the panel to throw a valid HPD from the point
>>> >> we enabled LCD_VCC.
>>> >> After HPD is thrown, we can start sending video data.
>>> >
>>> > What does "throw a valid HPD" mean? Is it an actual signal that can be
>>> > captured via software (GPIO, interrupt, ...)? If so then it would be
>>> > preferable to not use a delay at all but rather rely on that mechanism
>>> > to determine when it's safe to send a video signal.
>>> Right, your explanation holds good, but only for the case of eDP panels.
>>> But, when we use eDP-LVDS bridges(ps8622), its a different case!
>>> the bridge takes care of sending HPD, so the encoder gets HPD interrupt
>>> and tries to read edid from the panel, but the panel might not have powered up
>>> enough to read edid. In such cases we would need delay.
>>> So, having a delay field here would be really useful.
>>
>> Okay.
>>
>>> May be, while describing this particular DT binding I should elaborate more.
>>
>> Yes, something like the above explanation would be good to have in the
>> binding.
> Ok, will do that.
>
>>> >> >> diff --git a/drivers/gpu/drm/bridge/bridge_panel.c b/drivers/gpu/drm/bridge/bridge_panel.c
>>> >> > [...]
>>> >> >
>>> >> > This duplicates much of the functionality that panels should provide. I
>>> >> > think a better solution would be to properly integrate panels with
>>> >> > bridges.
>>> >> True, ideally I should be calling drm_panel functions from a simple dummy
>>> >> bridge which sits at the end of the bridge chain. But, since you are not
>>> >> convinced with having pre_enable and post_disable calls for panels, I had
>>> >> no other way to do this, than stuffing these panel controls inside
>>> >> bridge! :(
>>> >
>>> > What makes you think that I would suddenly be any more convinced by this
>>> > solution than by your prior proposal? I didn't say outright no to what
>>> > you proposed earlier. What I said was that I didn't like it and that I
>>> > thought we could come up with a better solution. Part of getting to a
>>> > better solution is trying to understand the problems involved. You don't
>>> > solve a problem by simply moving code into a different driver.
>>> Ok. What is better solution according to you?
>>> Handling the backlight enable GPIO in pwm-backlight driver is not
>>> a better soultion "ALWAYS". Sometimes, we may just need to control it
>>> along with video encoders.
>>
>> You keep saying that, but you haven't said *why* you need to do that.
> I have explained above. Also see chapter 6.5 in [1]
>
>>> And, even the panel datasheets mention that  in "Power On/off sequence"
>>> chapter.
>>
>> Can you point me to such a datasheet?
> [1] : http://www.yslcd.com.tw/docs/product/B116XW03%20V.0.pdf
> chapter 6.5
>
>>> And, I have explained the problems and feasible solutions.
>>
>> You have explained the solutions that you've found to the problem. I'm
>> trying to understand the problem fully so that perhaps we can find a
>> more generic solution.
>>
>>> If drm_panel can support pre_enable/post_disable, we can easily
>>> implement a generic bridge which sits at the end of bridge chain, and
>>> calls corresponding drm_panel functions.
>>
>> The problem with blindly adding .pre_enable() and .post_disable()
>> without thinking this through is that it can easily introduce
>> incompatibilities between various drivers and panels. There is a risk
>> that some of the code that goes into a panel's .pre_enable() will be
>> specific to a given setup (and perhaps not even related to the panel
>> at all). If that panel is reused on a different board where the
>> restrictions may be different the panel may not work.
> Ok, I understand. That's why I am pointing out to the LVDS datasheet above.
> I have a similar datasheet for eDP panel B133HTN01, but its private and I am
> not supposed to share it! :(
>
>> So before we go and add any new functions to DRM panel I'd like to see
>> them properly documented. It needs to be defined precisely what the
>> effect of these functions should be so that both panel driver writers
>> know what to implement and display driver writers need to know when to
>> call which function.
> Agreed, we should put in precise explanation in bindings/comments.
>
>> Also, please let's not call them .pre_enable() and .post_disable(). The
>> names should be something more specific to reflect what they are meant
>> to do. Even something like .prepare() and .unprepare() would be better
>> choices.
> .prepare() and .unprepare() also sound good and meaningful.
> powering up the LCD unit goes into prepare()
> powering up the LED unit goes into enable()
>
> Regards,
> Ajay
