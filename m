From: =?UTF-8?B?QW5kcmVhcyBGw6RyYmVy?= <afaerber@suse.de>
Subject: Re: [PATCH 1/6] ASoC: max98088: Document DT bindings
Date: Fri, 20 Feb 2015 01:36:56 +0100
Message-ID: <54E681A8.6040702@suse.de>
References: <1424283959-16289-1-git-send-email-afaerber@suse.de>	<1424283959-16289-2-git-send-email-afaerber@suse.de>	<54E5EB36.9020007@collabora.co.uk>	<54E5EF73.2090302@suse.de> <CAD=FV=VoFnbEsKi4mDDkaTrTXboJmm0UNV5iCk1CvV5ndEZtsA@mail.gmail.com> <54E62E1C.4030105@suse.de> <54E6314E.5060509@suse.de> <54E64C09.5000505@collabora.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <54E64C09.5000505@collabora.co.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: Javier Martinez Canillas <javier.martinez@collabora.co.uk>, Doug Anderson <dianders@chromium.org>
Cc: alsa-devel@alsa-project.org, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Sangbeom Kim <sbkim73@samsung.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Vincent Palatin <vpalatin@chromium.org>, Tomasz Figa <tomasz.figa@gmail.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>
List-Id: linux-samsung-soc@vger.kernel.org

Am 19.02.2015 um 21:48 schrieb Javier Martinez Canillas:
> On 02/19/2015 07:54 PM, Andreas F=C3=A4rber wrote:
>> Am 19.02.2015 um 19:40 schrieb Andreas F=C3=A4rber:
>>> I updated max98088 and had it working on first boot, but on
>>> second boot it complained about the frequency:
>>>
>>> [    7.896834] max98088 7-0010: revision A
>>> [    7.912776] snow-audio sound: HiFi <-> 3830000.i2s mapping ok
>>> [    7.919367] max98088 7-0010: Invalid master clock frequency
>>> [    7.919429] snow-audio sound: ASoC: Spring-I2S-MAX98089 late_pro=
be()
>>> failed: -22
>>> [    7.920019] snow-audio sound: snd_soc_register_card failed (-22)
>>> [    7.920109] snow-audio: probe of sound failed with error -22
>>
>=20
> I had the same error on Snow but even on the first boot and after doi=
ng some
> code archeology, I found the following commit [0] in a Samsung downst=
ream
> tree that solves the issue.
>=20
> The problem is that clk_round_rate(max98095->mclk, freq) returns 0 as=
 the
> rounded rate if XCLOUT is not allowed to be re-parented on rate chang=
e.

Same on Spring:

diff --git a/sound/soc/codecs/max98088.c b/sound/soc/codecs/max98088.c
index 1aa81321afba..46dc64675c26 100644
--- a/sound/soc/codecs/max98088.c
+++ b/sound/soc/codecs/max98088.c
@@ -1365,6 +1365,7 @@ static int max98088_dai_set_sysclk(struct
snd_soc_dai *dai,

        if (!IS_ERR(max98088->mclk)) {
                freq =3D clk_round_rate(max98088->mclk, freq);
+               dev_warn(codec->dev, "freq =3D %u\n", freq);
                clk_set_rate(max98088->mclk, freq);
        }


> With Tushar's patch I see that clk_round_rate() returns 24000000 (24M=
Hz)
> so the codec driver setups the correct PLL clock.

Ditto. With the clkout reparenting patch, clk_round_rate() returns 24MH=
z
just like when double-beep-initialized. However when not
double-beep-initialized, the driver initializes, but no audible output,
so there must be another missing puzzle piece.

>> On a suspicion, the fourth boot I waited for the double-beep of the
>> firmware (waiting for Ctrl+d/u), and then it did work.
>>
>> So it seems the mclk is not always set up properly by the kernel,
>> relying on firmware. Who's in charge of setting that clock up?
>=20
> Right, it seems audio is only working due the firmware doing some pre=
vious
> setup. Probably it works on every boot if you have "sound init" as a =
part of
> the u-boot boot commands?

Indeed it does, 24 MHz without the reparenting patch, and sound working=
=2E

'sound init' code:
https://github.com/afaerber/u-boot/blob/spring/drivers/sound/max98088.c

Regards,
Andreas

--=20
SUSE Linux GmbH, Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
GF: Felix Imend=C3=B6rffer, Jane Smithard, Jennifer Guild, Dilip Upmany=
u,
Graham Norton; HRB 21284 (AG N=C3=BCrnberg)
