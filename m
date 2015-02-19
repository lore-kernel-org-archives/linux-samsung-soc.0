From: =?UTF-8?B?QW5kcmVhcyBGw6RyYmVy?= <afaerber@suse.de>
Subject: Re: [PATCH 5/6] ASoC: samsung: Extend Snow driver to support max98089
Date: Thu, 19 Feb 2015 18:56:25 +0100
Message-ID: <54E623C9.7070001@suse.de>
References: <1424283959-16289-1-git-send-email-afaerber@suse.de>	<1424283959-16289-6-git-send-email-afaerber@suse.de>	<20150219094425.GB3198@finisterre.sirena.org.uk> <CAD=FV=WkieDSSB_-a6DtH1hmq6SyZk4NAR-eXQ11hxUDMTvRfg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAD=FV=WkieDSSB_-a6DtH1hmq6SyZk4NAR-eXQ11hxUDMTvRfg@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Doug Anderson <dianders@chromium.org>
Cc: Mark Brown <broonie@kernel.org>, Sangbeom Kim <sbkim73@samsung.com>, alsa-devel@alsa-project.org, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Vincent Palatin <vpalatin@chromium.org>, Javier Martinez Canillas <javier.martinez@collabora.co.uk>, Tomasz Figa <tomasz.figa@gmail.com>, Kukjin Kim <kgene@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.de>, Olof Johansson <olof@lixom.net>
List-Id: linux-samsung-soc@vger.kernel.org

Am 19.02.2015 um 18:44 schrieb Doug Anderson:
> On Thu, Feb 19, 2015 at 1:44 AM, Mark Brown <broonie@kernel.org> wrot=
e:
>> On Wed, Feb 18, 2015 at 07:25:58PM +0100, Andreas F=C3=A4rber wrote:
>>
>>>  static const struct of_device_id snow_of_match[] =3D {
>>> +     { .compatible =3D "google,snow-audio-max98089", },
>>>       { .compatible =3D "google,snow-audio-max98090", },
>>>       { .compatible =3D "google,snow-audio-max98091", },
>>>       { .compatible =3D "google,snow-audio-max98095", },
>>
>> Since we completely ignore the CODEC in the property might it not be
>> better to just add a plain old snow-audio compatible and bind to tha=
t,
>> that way we don't need these driver updates?  Just the "snow" bit sh=
ould
>> be enough to know it's one of this class of machines.
>=20
> I think what you're suggesting is that here we should add a new
> compatible string "google,snow-audio" instead of adding
> "google,snow-audio-max98089" here.  Then the sound node in the spring
> DTS would look like:
>=20
>   compatible =3D "google,snow-audio-max98089", "google,snow-audio";

If we want to be specific just in case, was it an active decision not t=
o
use "google,peach-pi[t]-audio-max98..."?

Again, either way works for me.

Andreas

--=20
SUSE Linux GmbH, Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
GF: Felix Imend=C3=B6rffer, Jane Smithard, Jennifer Guild, Dilip Upmany=
u,
Graham Norton; HRB 21284 (AG N=C3=BCrnberg)
