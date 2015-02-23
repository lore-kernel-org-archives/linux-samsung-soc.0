From: =?UTF-8?B?QW5kcmVhcyBGw6RyYmVy?= <afaerber-l3A5Bk7waGM@public.gmane.org>
Subject: Re: [alsa-devel] [PATCH] ASoC: max98088: Add master clock handling
Date: Mon, 23 Feb 2015 13:23:21 +0100
Message-ID: <54EB1BB9.4030205@suse.de>
References: <1424283959-16289-3-git-send-email-afaerber@suse.de> <1424373526-4135-1-git-send-email-afaerber@suse.de> <54E6A9AB.4070401@gmail.com> <54EAE4DF.3040607@collabora.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <54EAE4DF.3040607-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Javier Martinez Canillas <javier.martinez-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>, Tushar Behera <trblinux-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Sangbeom Kim <sbkim73-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Vincent Palatin <vpalatin-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, Takashi Iwai <tiwai-l3A5Bk7waGM@public.gmane.org>, Xiubo Li <Li.Xiubo-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Tomasz Figa <tomasz.figa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Tushar Behera <tushar.behera-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

Hi,

Am 23.02.2015 um 09:29 schrieb Javier Martinez Canillas:
> On 02/20/2015 04:27 AM, Tushar Behera wrote:
>> On 02/20/2015 12:48 AM, Andreas F=C3=A4rber wrote:
>>> If master clock is provided through device tree, then update
>>> the master clock frequency during set_sysclk.
>>>
>>> Cc: Tushar Behera <tushar.behera-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
>>> Signed-off-by: Andreas F=C3=A4rber <afaerber-l3A5Bk7waGM@public.gmane.org>
>>> ---
>>>  sound/soc/codecs/max98088.c | 24 ++++++++++++++++++++++++
>>>  1 file changed, 24 insertions(+)
>>>
>>
>> Looks good.
>>
>> Acked-by: Tushar Behera <trblinux-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>>
>=20
> Looks good to me as well.
>=20
> Reviewed-by: Javier Martinez Canillas <javier.martinez-ZGY8ohtN/8oXa1LcwEujcA@public.gmane.org=
k>

Thanks guys. One self-doubt: Is there any downside to returning
-EPROBE_DEFER after regcache_mark_dirty(max98088->regmap)? I.e., should
I move the last hunk some lines up to be the very first thing executed?

Cheers,
Andreas

--=20
SUSE Linux GmbH, Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
GF: Felix Imend=C3=B6rffer, Jane Smithard, Jennifer Guild, Dilip Upmany=
u,
Graham Norton; HRB 21284 (AG N=C3=BCrnberg)
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
