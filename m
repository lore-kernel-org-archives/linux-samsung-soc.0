From: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Subject: Re: [PATCH 1/6] ASoC: max98088: Document DT bindings
Date: Thu, 19 Feb 2015 21:48:09 +0100
Message-ID: <54E64C09.5000505@collabora.co.uk>
References: <1424283959-16289-1-git-send-email-afaerber@suse.de>	<1424283959-16289-2-git-send-email-afaerber@suse.de>	<54E5EB36.9020007@collabora.co.uk>	<54E5EF73.2090302@suse.de> <CAD=FV=VoFnbEsKi4mDDkaTrTXboJmm0UNV5iCk1CvV5ndEZtsA@mail.gmail.com> <54E62E1C.4030105@suse.de> <54E6314E.5060509@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from bhuna.collabora.co.uk ([93.93.135.160]:38276 "EHLO
	bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752852AbbBSUsQ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 19 Feb 2015 15:48:16 -0500
In-Reply-To: <54E6314E.5060509@suse.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: =?UTF-8?B?QW5kcmVhcyBGw6RyYmVy?= <afaerber@suse.de>, Doug Anderson <dianders@chromium.org>
Cc: alsa-devel@alsa-project.org, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Sangbeom Kim <sbkim73@samsung.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Vincent Palatin <vpalatin@chromium.org>, Tomasz Figa <tomasz.figa@gmail.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>

Hello Andreas,

We already talked over irc but for completeness I'll comment here
as well.

On 02/19/2015 07:54 PM, Andreas F=C3=A4rber wrote:
> Am 19.02.2015 um 19:40 schrieb Andreas F=C3=A4rber:
>> Am 19.02.2015 um 18:48 schrieb Doug Anderson:
>>> On Thu, Feb 19, 2015 at 6:13 AM, Andreas F=C3=A4rber <afaerber@suse=
=2Ede> wrote:
>>>>> I see that a master clock (mclk) is added in patch 6/6 but the
>>>>> max98088 codec driver does handle this clock.

Sorry, I wanted to say " the driver *does not* handle this clock" but
fortunately you understood what I meant :)

>>>>>
>>>>> If the SoC XCLKOUT provides the master clock to the max98089
>>>>> codec in Spring like is the case for the max9809{0,5} codecs
>>>>> in the Snow and Peach Pit/Pi Chromebooks then you need to do
>>>>> something along the lines of the following commits:
>>>>>
>>>>> e3048c3d2be5 ASoC: max98095: Add master clock handling
>>>>> b10ab7b838bd ASoC: max98090: Add master clock handling
>>>>>
>>>>> If that's the case you also have to mention in the DT binding
>>>>> doc that "clocks" and "clock-names" are optional properties
>>>>> like Documentation/devicetree/bindings/sound/max9809{0,5}.txt.
>>>>
>>>> When I prepared this patch, I believe it was a straight copy from
>>>> max98090. Sounds like they changed since then.
>>>>
>>>> My 6/6 adopted the mclk clock from your now-cancelled v2 patch for=
 Snow,
>>>> assuming it would be the same on all Chromebooks. I tested that la=
st
>>>> change by checking for errors in dmesg.
>>>>
>>>> Doug, can you advise on how the clock wiring is for Spring?
>>>
>>> I can confirm that XCLKOUT is connected to the codec MCLK on the
>>> Spring schematics I have.
>>=20
>> Thanks! I updated max98088 and had it working on first boot, but on
>> second boot it complained about the frequency:
>>
>> [    7.896834] max98088 7-0010: revision A
>> [    7.912776] snow-audio sound: HiFi <-> 3830000.i2s mapping ok
>> [    7.919367] max98088 7-0010: Invalid master clock frequency
>> [    7.919429] snow-audio sound: ASoC: Spring-I2S-MAX98089 late_prob=
e()
>> failed: -22
>> [    7.920019] snow-audio sound: snd_soc_register_card failed (-22)
>> [    7.920109] snow-audio: probe of sound failed with error -22
>

I had the same error on Snow but even on the first boot and after doing=
 some
code archeology, I found the following commit [0] in a Samsung downstre=
am
tree that solves the issue.

The problem is that clk_round_rate(max98095->mclk, freq) returns 0 as t=
he
rounded rate if XCLOUT is not allowed to be re-parented on rate change.

With Tushar's patch I see that clk_round_rate() returns 24000000 (24MHz=
)
so the codec driver setups the correct PLL clock.

You mentioned that it does make the error go away but still audio is no=
t
working on Spring. Let's see if someone has an idea of what could be mi=
ssing.
=20
> Reproducible on third boot.
>=20
> On a suspicion, the fourth boot I waited for the double-beep of the
> firmware (waiting for Ctrl+d/u), and then it did work.
>=20
> So it seems the mclk is not always set up properly by the kernel,
> relying on firmware. Who's in charge of setting that clock up?
>

Right, it seems audio is only working due the firmware doing some previ=
ous
setup. Probably it works on every boot if you have "sound init" as a pa=
rt of
the u-boot boot commands?

> Regards,
> Andreas
>

Best regards,
Javier

[0]: https://github.com/exynos-reference/kernel/commit/34ae055b32e62140=
9a92dea6a29f65b723798f33
