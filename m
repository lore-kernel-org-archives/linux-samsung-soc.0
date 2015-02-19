From: =?UTF-8?B?QW5kcmVhcyBGw6RyYmVy?= <afaerber@suse.de>
Subject: Re: [PATCH 1/6] ASoC: max98088: Document DT bindings
Date: Thu, 19 Feb 2015 15:13:07 +0100
Message-ID: <54E5EF73.2090302@suse.de>
References: <1424283959-16289-1-git-send-email-afaerber@suse.de> <1424283959-16289-2-git-send-email-afaerber@suse.de> <54E5EB36.9020007@collabora.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <54E5EB36.9020007@collabora.co.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: Javier Martinez Canillas <javier.martinez@collabora.co.uk>, alsa-devel@alsa-project.org, linux-samsung-soc@vger.kernel.org, Doug Anderson <dianders@chromium.org>
Cc: Sangbeom Kim <sbkim73@samsung.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Vincent Palatin <vpalatin@chromium.org>, Tomasz Figa <tomasz.figa@gmail.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>
List-Id: linux-samsung-soc@vger.kernel.org

Hello Javier, Doug,

Am 19.02.2015 um 14:55 schrieb Javier Martinez Canillas:
> On 02/18/2015 07:25 PM, Andreas F=C3=A4rber wrote:
>> Signed-off-by: Andreas F=C3=A4rber <afaerber@suse.de>
>> ---
>>  Documentation/devicetree/bindings/sound/max98088.txt | 16 +++++++++=
+++++++
>>  1 file changed, 16 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/sound/max98088=
=2Etxt
>>
>> diff --git a/Documentation/devicetree/bindings/sound/max98088.txt b/=
Documentation/devicetree/bindings/sound/max98088.txt
>> new file mode 100644
>> index 000000000000..6f8fe85040ee
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/sound/max98088.txt
>> @@ -0,0 +1,16 @@
>> +MAX98088 audio CODEC
>> +
>> +This device supports I2C only.
>> +
>> +Required properties:
>> +
>> +- compatible : "maxim,max98088" or "maxim,max98089".
>> +
>> +- reg : The I2C address of the device.
>> +
>> +Example:
>> +
>> +max98089: codec@10 {
>> +	compatible =3D "maxim,max98089";
>> +	reg =3D <0x10>;
>> +};
>>
>=20
> I see that a master clock (mclk) is added in patch 6/6 but the
> max98088 codec driver does handle this clock.
>=20
> If the SoC XCLKOUT provides the master clock to the max98089
> codec in Spring like is the case for the max9809{0,5} codecs
> in the Snow and Peach Pit/Pi Chromebooks then you need to do
> something along the lines of the following commits:
>=20
> e3048c3d2be5 ASoC: max98095: Add master clock handling
> b10ab7b838bd ASoC: max98090: Add master clock handling
>=20
> If that's the case you also have to mention in the DT binding
> doc that "clocks" and "clock-names" are optional properties
> like Documentation/devicetree/bindings/sound/max9809{0,5}.txt.

When I prepared this patch, I believe it was a straight copy from
max98090. Sounds like they changed since then.

My 6/6 adopted the mclk clock from your now-cancelled v2 patch for Snow=
,
assuming it would be the same on all Chromebooks. I tested that last
change by checking for errors in dmesg.

Doug, can you advise on how the clock wiring is for Spring?

Regards,
Andreas

--=20
SUSE Linux GmbH, Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
GF: Felix Imend=C3=B6rffer, Jane Smithard, Jennifer Guild, Dilip Upmany=
u,
Graham Norton; HRB 21284 (AG N=C3=BCrnberg)
