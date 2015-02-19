From: =?UTF-8?B?QW5kcmVhcyBGw6RyYmVy?= <afaerber@suse.de>
Subject: Re: [PATCH 1/6] ASoC: max98088: Document DT bindings
Date: Thu, 19 Feb 2015 19:40:28 +0100
Message-ID: <54E62E1C.4030105@suse.de>
References: <1424283959-16289-1-git-send-email-afaerber@suse.de>	<1424283959-16289-2-git-send-email-afaerber@suse.de>	<54E5EB36.9020007@collabora.co.uk>	<54E5EF73.2090302@suse.de> <CAD=FV=VoFnbEsKi4mDDkaTrTXboJmm0UNV5iCk1CvV5ndEZtsA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAD=FV=VoFnbEsKi4mDDkaTrTXboJmm0UNV5iCk1CvV5ndEZtsA@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Doug Anderson <dianders@chromium.org>
Cc: Javier Martinez Canillas <javier.martinez@collabora.co.uk>, alsa-devel@alsa-project.org, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Sangbeom Kim <sbkim73@samsung.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Vincent Palatin <vpalatin@chromium.org>, Tomasz Figa <tomasz.figa@gmail.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>
List-Id: linux-samsung-soc@vger.kernel.org

Am 19.02.2015 um 18:48 schrieb Doug Anderson:
> On Thu, Feb 19, 2015 at 6:13 AM, Andreas F=C3=A4rber <afaerber@suse.d=
e> wrote:
>>> I see that a master clock (mclk) is added in patch 6/6 but the
>>> max98088 codec driver does handle this clock.
>>>
>>> If the SoC XCLKOUT provides the master clock to the max98089
>>> codec in Spring like is the case for the max9809{0,5} codecs
>>> in the Snow and Peach Pit/Pi Chromebooks then you need to do
>>> something along the lines of the following commits:
>>>
>>> e3048c3d2be5 ASoC: max98095: Add master clock handling
>>> b10ab7b838bd ASoC: max98090: Add master clock handling
>>>
>>> If that's the case you also have to mention in the DT binding
>>> doc that "clocks" and "clock-names" are optional properties
>>> like Documentation/devicetree/bindings/sound/max9809{0,5}.txt.
>>
>> When I prepared this patch, I believe it was a straight copy from
>> max98090. Sounds like they changed since then.
>>
>> My 6/6 adopted the mclk clock from your now-cancelled v2 patch for S=
now,
>> assuming it would be the same on all Chromebooks. I tested that last
>> change by checking for errors in dmesg.
>>
>> Doug, can you advise on how the clock wiring is for Spring?
>=20
> I can confirm that XCLKOUT is connected to the codec MCLK on the
> Spring schematics I have.

Thanks! I updated max98088 and had it working on first boot, but on
second boot it complained about the frequency:

[    7.896834] max98088 7-0010: revision A
[    7.912776] snow-audio sound: HiFi <-> 3830000.i2s mapping ok
[    7.919367] max98088 7-0010: Invalid master clock frequency
[    7.919429] snow-audio sound: ASoC: Spring-I2S-MAX98089 late_probe()
failed: -22
[    7.920019] snow-audio sound: snd_soc_register_card failed (-22)
[    7.920109] snow-audio: probe of sound failed with error -22

Will investigate.

Andreas

--=20
SUSE Linux GmbH, Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
GF: Felix Imend=C3=B6rffer, Jane Smithard, Jennifer Guild, Dilip Upmany=
u,
Graham Norton; HRB 21284 (AG N=C3=BCrnberg)
