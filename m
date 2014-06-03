From: Ajay kumar <ajaynumb@gmail.com>
Subject: Re: [RFC V3 2/3] drm/bridge: add a dummy panel driver to support lvds bridges
Date: Tue, 3 Jun 2014 15:28:07 +0530
Message-ID: <CAEC9eQPs62G7TYfc8n5XzESwQ1t1TE_HUMEHWj3Egh-3FZrFDQ@mail.gmail.com>
References: <20140513080501.GH6754@ulmo>
	<CAEC9eQN=AAOVFNqWp61zFsS1jtewyDb18oFP1VAuCjYhQWGRnA@mail.gmail.com>
	<20140514145402.GC8612@ulmo>
	<CAEC9eQOvObG5CKb-GcpuSBXccSnVrEjQsBThAOJ4q5YECc6d0A@mail.gmail.com>
	<20140515081321.GF5952@ulmo>
	<CAEC9eQM_KtHDRaYGCmeT3f61+Rwh5oG2xWDNTTMkQCht6kAydQ@mail.gmail.com>
	<20140517211404.GC1046@mithrandir>
	<CAEC9eQN5Z+dGqNBDq_pkMu0AzASkrA9xPpEjKRWRoVYAq2L1bA@mail.gmail.com>
	<20140519153053.GB30978@ulmo>
	<CAEC9eQMPR1VbA6+ziDGaPSH_9VHtFS8-YkMKiTtaD90gDTLcKA@mail.gmail.com>
	<20140519201003.GB30737@mithrandir>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-vc0-f179.google.com ([209.85.220.179]:50476 "EHLO
	mail-vc0-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750786AbaFCJ6I (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 3 Jun 2014 05:58:08 -0400
Received: by mail-vc0-f179.google.com with SMTP id ij19so2034187vcb.38
        for <linux-samsung-soc@vger.kernel.org>; Tue, 03 Jun 2014 02:58:07 -0700 (PDT)
In-Reply-To: <20140519201003.GB30737@mithrandir>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Ajay Kumar <ajaykumar.rs@samsung.com>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Daniel Vetter <daniel.vetter@ffwll.ch>, sunil joshi <joshi@samsung.com>, Andrzej Hajda <a.hajda@samsung.com>, Prashanth G <prashanth.g@samsung.com>

On Tue, May 20, 2014 at 1:40 AM, Thierry Reding
<thierry.reding@gmail.com> wrote:
> On Tue, May 20, 2014 at 12:37:38AM +0530, Ajay kumar wrote:
>> On 5/19/14, Thierry Reding <thierry.reding@gmail.com> wrote:
>> > On Sun, May 18, 2014 at 01:50:36PM +0530, Ajay kumar wrote:
>> >> On Sun, May 18, 2014 at 2:44 AM, Thierry Reding
>> >> <thierry.reding@gmail.com> wrote:
>> >> > On Thu, May 15, 2014 at 05:10:16PM +0530, Ajay kumar wrote:
>> >> >> On Thu, May 15, 2014 at 1:43 PM, Thierry Reding
>> >> >> <thierry.reding@gmail.com> wrote:
>> >> > [...]
>> >> >> > I still don't see how controlling the enable GPIO from the panel will
>> >> >> > be
>> >> >> > in any way better, or different for that matter, from simply
>> >> >> > enabling
>> >> >> > the backlight and let the backlight driver handle the enable GPIO.
>> >> >> > Have
>> >> >> > you tried to do that and found that it doesn't work?
>> >> >> It works, but it gives me glitch when I try to configure video.
>> >> >> This is because backlight_on(pwm-backlight) happens much before
>> >> >> I configure video(inside drm), and while configuring video there would
>> >> >> be a glitch,
>> >> >> and that glitch would be visible to the user since backlight is already
>> >> >> enabled.
>> >> >
>> >> > Okay, so this means that your backlight is turned on too early. Instead
>> >> > of working around that problem by moving control of the backlight
>> >> > enable
>> >> > GPIO from the backlight driver into the panel driver, the correct way
>> >> > to
>> >> > fix it is to make sure the backlight stays off until video is ready.
>> >> Ok. Please suggest an idea how to do the same!
>> >
>> > I did post a patch[0] a long time ago that added a way to fix this for
>> > pwm-backlight at least.
>> I have tried this. We have to wait till the userspace to switch the
>> backlight on again :(
>
> Erm... why?
Because, backlight remains in powerdown state till the userspace startup scripts
turn it back on!

>> >> I have already suggested a simple idea which conforms to a valid spec.
>> >> Just because enable_gpio is already a part of pwm_bl.c, I somewhat feel
>> >> like we are forcing people to handle enable_gpio inside pwm_bl.c.
>> >
>> > And that's a good thing. That's what people will expect. Backlights are
>> > exposed via sysfs, which is currently also the only way to control the
>> > backlight from userspace. If the driver for that doesn't have everything
>> > required to control the backlight how can userspace control it?
>> This is a valid point, only at the hardware level.
>> But if you consider a user experience perspective,
>> user still will not be able to see the backlight even
>> though enable_gpio is controlled elsewhere, since
>> pwm is disabled anyhow.
>
> But that's precisely my point. If the enable_gpio is controlled
> elsewhere there will be no way for the userspace interface to enable the
> backlight.
Hmm, this is a valid point. Still, see my explanation below.[1]

>> Now lets talk about backlight_on case. Even though user tries to turn
>> on the backlight, and the driver turns on backlight supply, pwm and
>> enable_gpio, the driver cannot always guarantee him that backlight is
>> "really on" since it also depends on panel power.
>
> No. If the backlight is properly hooked up to all resources, then
> turning it on will *really turn it on*.
[1] : This is what I am trying to elaborate.
Backlight really does depend on panel power also, and
you cannot tie LCD resources to backlight driver.
Now, consider that panel/LCD is off and user wishes to control backlight,
it will have no effect.
So, ideally backlight drivers are not "completely independent" in generating
backlight in most of the cases.
LCD driver and backlight driver should both co ordinate at user/kernel level
to make things work properly.

Lets consider this also as a similar case - "backlight enable being handled in
panel driver."
Here also, things will work if LCD and backlight drivers work in tandem,
at user space.

>> >> Note that, pwm_bl can still work properly without enabling the backlight
>> >> GPIO.
>> >> And, I did point out to a valid datasheet from AUO, which clearly
>> >> indicates why
>> >> backlight enable GPIO should be a part of panel driver and not pwm_bl
>> >> driver.
>> >
>> > Just because some spec mentions the backlight enable pin in some panel
>> > power up sequence diagram that doesn't mean we have to implement it as
>> > part of the panel driver.
>> That is not "some spec". I believe all the AUO panels share the same
>> sequence!
>
> Just because some specs mention the backlight enable pin in some panel
> power up sequence diagram that doesn't mean we have to implement it as
> part of the panel driver.
> Thierry
