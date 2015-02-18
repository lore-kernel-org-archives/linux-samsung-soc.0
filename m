From: =?UTF-8?B?QW5kcmVhcyBGw6RyYmVy?= <afaerber@suse.de>
Subject: Re: [PATCH 2/6] ASoC: max98088: Add DT bindings
Date: Wed, 18 Feb 2015 20:17:59 +0100
Message-ID: <54E4E567.2060403@suse.de>
References: <1424283959-16289-1-git-send-email-afaerber@suse.de> <1424283959-16289-3-git-send-email-afaerber@suse.de> <54E4E33C.9040301@cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <54E4E33C.9040301@cogentembedded.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: Sangbeom Kim <sbkim73@samsung.com>, alsa-devel@alsa-project.org, linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, Doug Anderson <dianders@chromium.org>, Vincent Palatin <vpalatin@chromium.org>, Lars-Peter Clausen <lars@metafoo.de>, Takashi Iwai <tiwai@suse.de>, Xiubo Li <Li.Xiubo@freescale.com>, Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Tomasz Figa <tomasz.figa@gmail.com>, Javier Martinez Canillas <javier.martinez@collabora.co.uk>, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org

Hi,

Am 18.02.2015 um 20:08 schrieb Sergei Shtylyov:
> On 02/18/2015 09:25 PM, Andreas F=C3=A4rber wrote:
>=20
>> "maxim,max98089" will be used for the Spring Chromebook.
>=20
>> Signed-off-by: Andreas F=C3=A4rber <afaerber@suse.de>
>> ---
>>   sound/soc/codecs/max98088.c | 8 ++++++++
>>   1 file changed, 8 insertions(+)
>=20
>> diff --git a/sound/soc/codecs/max98088.c b/sound/soc/codecs/max98088=
=2Ec
>> index 805b3f8cd39d..69a21d1946e3 100644
>> --- a/sound/soc/codecs/max98088.c
>> +++ b/sound/soc/codecs/max98088.c
>> @@ -2009,10 +2009,18 @@ static const struct i2c_device_id
>> max98088_i2c_id[] =3D {
>>   };
>>   MODULE_DEVICE_TABLE(i2c, max98088_i2c_id);
>>
>> +static const struct of_device_id max98088_of_match[] =3D {
>=20
>    If I don't mistake, gcc will complain about this variable being
> unused if CONFIG_OF=3Dn.

I assume there will be no warning because of the "const".
=46or just "static" you would be right.

>> +    { .compatible =3D "maxim,max98088" },
>> +    { .compatible =3D "maxim,max98089" },
>> +    { }
>> +};
>> +MODULE_DEVICE_TABLE(of, max98088_of_match);
>> +
>>   static struct i2c_driver max98088_i2c_driver =3D {
>>       .driver =3D {
>>           .name =3D "max98088",
>>           .owner =3D THIS_MODULE,
>> +        .of_match_table =3D of_match_ptr(max98088_of_match),
>=20
>    You probably don;t need of_match_ptr(). Either that or do somethin=
g
> with the match table, like enclosing into #ifdef or annotating with
> '__maybe_unused'.

This was copied from max98090 and max98095.

Cheers,
Andreas

--=20
SUSE Linux GmbH, Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
GF: Felix Imend=C3=B6rffer, Jane Smithard, Jennifer Guild, Dilip Upmany=
u,
Graham Norton; HRB 21284 (AG N=C3=BCrnberg)
