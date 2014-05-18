From: Ajay kumar <ajaynumb@gmail.com>
Subject: Re: [RFC V3 2/3] drm/bridge: add a dummy panel driver to support lvds bridges
Date: Sun, 18 May 2014 13:50:36 +0530
Message-ID: <CAEC9eQN5Z+dGqNBDq_pkMu0AzASkrA9xPpEjKRWRoVYAq2L1bA@mail.gmail.com>
References: <1399647182-20951-1-git-send-email-ajaykumar.rs@samsung.com>
	<1399647182-20951-3-git-send-email-ajaykumar.rs@samsung.com>
	<20140513080501.GH6754@ulmo>
	<CAEC9eQN=AAOVFNqWp61zFsS1jtewyDb18oFP1VAuCjYhQWGRnA@mail.gmail.com>
	<20140514145402.GC8612@ulmo>
	<CAEC9eQOvObG5CKb-GcpuSBXccSnVrEjQsBThAOJ4q5YECc6d0A@mail.gmail.com>
	<20140515081321.GF5952@ulmo>
	<CAEC9eQM_KtHDRaYGCmeT3f61+Rwh5oG2xWDNTTMkQCht6kAydQ@mail.gmail.com>
	<20140517211404.GC1046@mithrandir>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-vc0-f178.google.com ([209.85.220.178]:47620 "EHLO
	mail-vc0-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751783AbaERIUh (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 18 May 2014 04:20:37 -0400
Received: by mail-vc0-f178.google.com with SMTP id hq16so8355045vcb.9
        for <linux-samsung-soc@vger.kernel.org>; Sun, 18 May 2014 01:20:36 -0700 (PDT)
In-Reply-To: <20140517211404.GC1046@mithrandir>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Ajay Kumar <ajaykumar.rs@samsung.com>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Daniel Vetter <daniel.vetter@ffwll.ch>, sunil joshi <joshi@samsung.com>, Andrzej Hajda <a.hajda@samsung.com>, Prashanth G <prashanth.g@samsung.com>

On Sun, May 18, 2014 at 2:44 AM, Thierry Reding
<thierry.reding@gmail.com> wrote:
> On Thu, May 15, 2014 at 05:10:16PM +0530, Ajay kumar wrote:
>> On Thu, May 15, 2014 at 1:43 PM, Thierry Reding <thierry.reding@gmail.com> wrote:
> [...]
>> > I still don't see how controlling the enable GPIO from the panel will be
>> > in any way better, or different for that matter, from simply enabling
>> > the backlight and let the backlight driver handle the enable GPIO. Have
>> > you tried to do that and found that it doesn't work?
>> It works, but it gives me glitch when I try to configure video.
>> This is because backlight_on(pwm-backlight) happens much before
>> I configure video(inside drm), and while configuring video there would
>> be a glitch,
>> and that glitch would be visible to the user since backlight is already enabled.
>
> Okay, so this means that your backlight is turned on too early. Instead
> of working around that problem by moving control of the backlight enable
> GPIO from the backlight driver into the panel driver, the correct way to
> fix it is to make sure the backlight stays off until video is ready.
Ok. Please suggest an idea how to do the same!

I have already suggested a simple idea which conforms to a valid spec.
Just because enable_gpio is already a part of pwm_bl.c, I somewhat feel
like we are forcing people to handle enable_gpio inside pwm_bl.c.
Note that, pwm_bl can still work properly without enabling the backlight GPIO.
And, I did point out to a valid datasheet from AUO, which clearly indicates why
backlight enable GPIO should be a part of panel driver and not pwm_bl driver.
I am not trying to say we should remove enable_gpio from pwm_bl.
Provided that its already an optional property, and if someone wants
to control it in a panel driver, what is wrong in doing so?

Regards,
Ajay
