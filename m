From: Ajay kumar <ajaynumb@gmail.com>
Subject: Re: [RFC V3 2/3] drm/bridge: add a dummy panel driver to support lvds bridges
Date: Tue, 20 May 2014 00:37:38 +0530
Message-ID: <CAEC9eQMPR1VbA6+ziDGaPSH_9VHtFS8-YkMKiTtaD90gDTLcKA@mail.gmail.com>
References: <1399647182-20951-1-git-send-email-ajaykumar.rs@samsung.com>
	<1399647182-20951-3-git-send-email-ajaykumar.rs@samsung.com>
	<20140513080501.GH6754@ulmo>
	<CAEC9eQN=AAOVFNqWp61zFsS1jtewyDb18oFP1VAuCjYhQWGRnA@mail.gmail.com>
	<20140514145402.GC8612@ulmo>
	<CAEC9eQOvObG5CKb-GcpuSBXccSnVrEjQsBThAOJ4q5YECc6d0A@mail.gmail.com>
	<20140515081321.GF5952@ulmo>
	<CAEC9eQM_KtHDRaYGCmeT3f61+Rwh5oG2xWDNTTMkQCht6kAydQ@mail.gmail.com>
	<20140517211404.GC1046@mithrandir>
	<CAEC9eQN5Z+dGqNBDq_pkMu0AzASkrA9xPpEjKRWRoVYAq2L1bA@mail.gmail.com>
	<20140519153053.GB30978@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-vc0-f176.google.com ([209.85.220.176]:43994 "EHLO
	mail-vc0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753539AbaESTHj (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 19 May 2014 15:07:39 -0400
Received: by mail-vc0-f176.google.com with SMTP id lg15so10042913vcb.35
        for <linux-samsung-soc@vger.kernel.org>; Mon, 19 May 2014 12:07:38 -0700 (PDT)
In-Reply-To: <20140519153053.GB30978@ulmo>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Ajay Kumar <ajaykumar.rs@samsung.com>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Daniel Vetter <daniel.vetter@ffwll.ch>, sunil joshi <joshi@samsung.com>, Andrzej Hajda <a.hajda@samsung.com>, Prashanth G <prashanth.g@samsung.com>

On 5/19/14, Thierry Reding <thierry.reding@gmail.com> wrote:
> On Sun, May 18, 2014 at 01:50:36PM +0530, Ajay kumar wrote:
>> On Sun, May 18, 2014 at 2:44 AM, Thierry Reding
>> <thierry.reding@gmail.com> wrote:
>> > On Thu, May 15, 2014 at 05:10:16PM +0530, Ajay kumar wrote:
>> >> On Thu, May 15, 2014 at 1:43 PM, Thierry Reding
>> >> <thierry.reding@gmail.com> wrote:
>> > [...]
>> >> > I still don't see how controlling the enable GPIO from the panel will
>> >> > be
>> >> > in any way better, or different for that matter, from simply
>> >> > enabling
>> >> > the backlight and let the backlight driver handle the enable GPIO.
>> >> > Have
>> >> > you tried to do that and found that it doesn't work?
>> >> It works, but it gives me glitch when I try to configure video.
>> >> This is because backlight_on(pwm-backlight) happens much before
>> >> I configure video(inside drm), and while configuring video there would
>> >> be a glitch,
>> >> and that glitch would be visible to the user since backlight is already
>> >> enabled.
>> >
>> > Okay, so this means that your backlight is turned on too early. Instead
>> > of working around that problem by moving control of the backlight
>> > enable
>> > GPIO from the backlight driver into the panel driver, the correct way
>> > to
>> > fix it is to make sure the backlight stays off until video is ready.
>> Ok. Please suggest an idea how to do the same!
>
> I did post a patch[0] a long time ago that added a way to fix this for
> pwm-backlight at least.
I have tried this. We have to wait till the userspace to switch the
backlight on again :(

>> I have already suggested a simple idea which conforms to a valid spec.
>> Just because enable_gpio is already a part of pwm_bl.c, I somewhat feel
>> like we are forcing people to handle enable_gpio inside pwm_bl.c.
>
> And that's a good thing. That's what people will expect. Backlights are
> exposed via sysfs, which is currently also the only way to control the
> backlight from userspace. If the driver for that doesn't have everything
> required to control the backlight how can userspace control it?
This is a valid point, only at the hardware level.
But if you consider a user experience perspective,
user still will not be able to see the backlight even
though enable_gpio is controlled elsewhere, since
pwm is disabled anyhow.
Now lets talk about backlight_on case. Even though user tries to turn
on the backlight, and the driver turns on backlight supply, pwm and
enable_gpio, the driver cannot always guarantee him that backlight is
"really on" since it also depends on panel power.
Such ambiguities exist for few panels. And, for such panels why can't
we keep enable_gpio in another driver, and let the pwm_bl control only
backlight levels?

>> Note that, pwm_bl can still work properly without enabling the backlight
>> GPIO.
>> And, I did point out to a valid datasheet from AUO, which clearly
>> indicates why
>> backlight enable GPIO should be a part of panel driver and not pwm_bl
>> driver.
>
> Just because some spec mentions the backlight enable pin in some panel
> power up sequence diagram that doesn't mean we have to implement it as
> part of the panel driver.
That is not "some spec". I believe all the AUO panels share the same sequence!

>> I am not trying to say we should remove enable_gpio from pwm_bl.
>> Provided that its already an optional property, and if someone wants
>> to control it in a panel driver, what is wrong in doing so?
>
> See above.
>
> Thierry
>
> [0]: https://lkml.org/lkml/2013/10/7/188
>
