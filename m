From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: Re: [PATCH 2/6] ASoC: max98088: Add DT bindings
Date: Wed, 18 Feb 2015 22:08:44 +0300
Message-ID: <54E4E33C.9040301@cogentembedded.com>
References: <1424283959-16289-1-git-send-email-afaerber@suse.de> <1424283959-16289-3-git-send-email-afaerber@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-la0-f44.google.com ([209.85.215.44]:41573 "EHLO
	mail-la0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752961AbbBRTIt (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 18 Feb 2015 14:08:49 -0500
Received: by labpv20 with SMTP id pv20so3205578lab.8
        for <linux-samsung-soc@vger.kernel.org>; Wed, 18 Feb 2015 11:08:48 -0800 (PST)
In-Reply-To: <1424283959-16289-3-git-send-email-afaerber@suse.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: =?UTF-8?B?QW5kcmVhcyBGw6RyYmVy?= <afaerber@suse.de>, Sangbeom Kim <sbkim73@samsung.com>, alsa-devel@alsa-project.org, linux-samsung-soc@vger.kernel.org
Cc: devicetree@vger.kernel.org, Doug Anderson <dianders@chromium.org>, Vincent Palatin <vpalatin@chromium.org>, Lars-Peter Clausen <lars@metafoo.de>, Takashi Iwai <tiwai@suse.de>, Xiubo Li <Li.Xiubo@freescale.com>, Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Tomasz Figa <tomasz.figa@gmail.com>, Javier Martinez Canillas <javier.martinez@collabora.co.uk>, linux-arm-kernel@lists.infradead.org

Hello.

On 02/18/2015 09:25 PM, Andreas F=C3=A4rber wrote:

> "maxim,max98089" will be used for the Spring Chromebook.

> Signed-off-by: Andreas F=C3=A4rber <afaerber@suse.de>
> ---
>   sound/soc/codecs/max98088.c | 8 ++++++++
>   1 file changed, 8 insertions(+)

> diff --git a/sound/soc/codecs/max98088.c b/sound/soc/codecs/max98088.=
c
> index 805b3f8cd39d..69a21d1946e3 100644
> --- a/sound/soc/codecs/max98088.c
> +++ b/sound/soc/codecs/max98088.c
> @@ -2009,10 +2009,18 @@ static const struct i2c_device_id max98088_i2=
c_id[] =3D {
>   };
>   MODULE_DEVICE_TABLE(i2c, max98088_i2c_id);
>
> +static const struct of_device_id max98088_of_match[] =3D {

    If I don't mistake, gcc will complain about this variable being unu=
sed if=20
CONFIG_OF=3Dn.

> +	{ .compatible =3D "maxim,max98088" },
> +	{ .compatible =3D "maxim,max98089" },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(of, max98088_of_match);
> +
>   static struct i2c_driver max98088_i2c_driver =3D {
>   	.driver =3D {
>   		.name =3D "max98088",
>   		.owner =3D THIS_MODULE,
> +		.of_match_table =3D of_match_ptr(max98088_of_match),

    You probably don;t need of_match_ptr(). Either that or do something=
 with=20
the match table, like enclosing into #ifdef or annotating with '__maybe=
_unused'.

[...]

WBR, Sergei
