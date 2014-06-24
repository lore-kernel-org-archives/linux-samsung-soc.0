From: =?UTF-8?B?QW5kcmVhcyBGw6RyYmVy?= <afaerber@suse.de>
Subject: Re: [RFC 0/4] ARM: dts: exynos: Prepare Spring
Date: Wed, 25 Jun 2014 01:56:44 +0200
Message-ID: <53AA103C.5040709@suse.de>
References: <1403486483-4063-1-git-send-email-afaerber@suse.de> <53AA074C.3090904@suse.de> <CAP_ceTzu530D8X13hhRRzpJ67zBvjJp7cVW5y=S+ZrTY6GXJ3Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:55088 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752381AbaFXX4r (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 24 Jun 2014 19:56:47 -0400
In-Reply-To: <CAP_ceTzu530D8X13hhRRzpJ67zBvjJp7cVW5y=S+ZrTY6GXJ3Q@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Vincent Palatin <vpalatin@chromium.org>, Doug Anderson <dianders@chromium.org>
Cc: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Stephan van Schaik <stephan@synkhronix.com>

Vincent and Doug,

Am 25.06.2014 01:44, schrieb Vincent Palatin:
> On Tue, Jun 24, 2014 at 4:18 PM, Andreas F=C3=A4rber <afaerber@suse.d=
e> wrote:
>> Am 23.06.2014 03:21, schrieb Andreas F=C3=A4rber:
>>> The display goes dark unfortunately (drm bridge series not yet test=
ed),
>>> but I am able to log in via ssh over USB ethernet adapter okay.
>>
>> Tracked this down to the dp-controller@145B0000 node: The pinctrl se=
ems
>> irrelevant, only commenting out the whole node helps keep the displa=
y.
>> That is, hdmi and fimd nodes don't interfere.
>>
>> Adding a pwm backlight node like on snow did not help.
>=20
> On this board, the backlight is driven by the Parade PS8622 DP-to-LVD=
S
> bridge (rather than a SoC PWM as on Snow).
> You need to ensure that the PS8622 GPIOs (Reset/Sleep) are correctly =
driven
> oh, it seems that the PS8622 DRM bridge driver is still in-flight :
> https://www.mail-archive.com/linux-samsung-soc@vger.kernel.org/msg322=
43.html

Yeah, that's the one I meant with "drm bridge series" above. :)

Thanks for confirming.

Cheers,
Andreas

--=20
SUSE LINUX Products GmbH, Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
GF: Jeff Hawn, Jennifer Guild, Felix Imend=C3=B6rffer; HRB 16746 AG N=C3=
=BCrnberg
