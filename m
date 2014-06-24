From: Doug Anderson <dianders@chromium.org>
Subject: Re: [RFC 0/4] ARM: dts: exynos: Prepare Spring
Date: Tue, 24 Jun 2014 16:42:58 -0700
Message-ID: <CAD=FV=Ue5fd2248vJaDMmg_u22NBugqaSDmOQD72efpMUK2+wA@mail.gmail.com>
References: <1403486483-4063-1-git-send-email-afaerber@suse.de>
	<53AA074C.3090904@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-vc0-f170.google.com ([209.85.220.170]:64263 "EHLO
	mail-vc0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751826AbaFXXnA convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 24 Jun 2014 19:43:00 -0400
Received: by mail-vc0-f170.google.com with SMTP id hy10so1115660vcb.15
        for <linux-samsung-soc@vger.kernel.org>; Tue, 24 Jun 2014 16:42:59 -0700 (PDT)
In-Reply-To: <53AA074C.3090904@suse.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>
Cc: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Stephan van Schaik <stephan@synkhronix.com>, Vincent Palatin <vpalatin@chromium.org>, Rahul Sharma <rahul.sharma@samsung.com>, Sean Paul <seanpaul@chromium.org>, Daniel Kurtz <djkurtz@chromium.org>

Andreas,

On Tue, Jun 24, 2014 at 4:18 PM, Andreas F=C3=A4rber <afaerber@suse.de>=
 wrote:
> Am 23.06.2014 03:21, schrieb Andreas F=C3=A4rber:
>> The display goes dark unfortunately (drm bridge series not yet teste=
d),
>> but I am able to log in via ssh over USB ethernet adapter okay.
>
> Tracked this down to the dp-controller@145B0000 node: The pinctrl see=
ms
> irrelevant, only commenting out the whole node helps keep the display=
=2E
> That is, hdmi and fimd nodes don't interfere.

Adding Rahul from Samsung.  I don't know that he's ever tested things
on exynos5250-spring but he might be able to point you in the right
direction.


> Adding a pwm backlight node like on snow did not help. If it's suppos=
ed
> to work from GNOME's display brightness slider, it doesn't seem to wo=
rk.
> The 3.8 tree had no backlight node at all.

I do know that we don't want the exynos pwm backlight for spring.  On
spring the backlight is controlled completely by the bridge chip which
has a PWM on it.

-Doug
