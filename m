From: Vincent Palatin <vpalatin@chromium.org>
Subject: Re: [RFC 0/4] ARM: dts: exynos: Prepare Spring
Date: Tue, 24 Jun 2014 16:44:14 -0700
Message-ID: <CAP_ceTzu530D8X13hhRRzpJ67zBvjJp7cVW5y=S+ZrTY6GXJ3Q@mail.gmail.com>
References: <1403486483-4063-1-git-send-email-afaerber@suse.de> <53AA074C.3090904@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ve0-f175.google.com ([209.85.128.175]:57622 "EHLO
	mail-ve0-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752975AbaFXXog convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 24 Jun 2014 19:44:36 -0400
Received: by mail-ve0-f175.google.com with SMTP id jx11so1171648veb.34
        for <linux-samsung-soc@vger.kernel.org>; Tue, 24 Jun 2014 16:44:36 -0700 (PDT)
In-Reply-To: <53AA074C.3090904@suse.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>
Cc: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Stephan van Schaik <stephan@synkhronix.com>, Doug Anderson <dianders@chromium.org>

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
>
> Adding a pwm backlight node like on snow did not help.

On this board, the backlight is driven by the Parade PS8622 DP-to-LVDS
bridge (rather than a SoC PWM as on Snow).
You need to ensure that the PS8622 GPIOs (Reset/Sleep) are correctly dr=
iven
oh, it seems that the PS8622 DRM bridge driver is still in-flight :
https://www.mail-archive.com/linux-samsung-soc@vger.kernel.org/msg32243=
=2Ehtml

> If it's supposed
> to work from GNOME's display brightness slider, it doesn't seem to wo=
rk.
> The 3.8 tree had no backlight node at all.
>
> Andreas
>
> --
> SUSE LINUX Products GmbH, Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
> GF: Jeff Hawn, Jennifer Guild, Felix Imend=C3=B6rffer; HRB 16746 AG N=
=C3=BCrnberg
