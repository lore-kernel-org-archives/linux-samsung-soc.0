From: Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH 5/6] ASoC: samsung: Extend Snow driver to support max98089
Date: Thu, 19 Feb 2015 11:01:57 -0800
Message-ID: <CAD=FV=U1613Wv0Lyda_O80j6tTt2sPz++Z5cwzcjAQb=L-qkeA@mail.gmail.com>
References: <1424283959-16289-1-git-send-email-afaerber@suse.de>
	<1424283959-16289-6-git-send-email-afaerber@suse.de>
	<20150219094425.GB3198@finisterre.sirena.org.uk>
	<CAD=FV=WkieDSSB_-a6DtH1hmq6SyZk4NAR-eXQ11hxUDMTvRfg@mail.gmail.com>
	<54E623C9.7070001@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <54E623C9.7070001-l3A5Bk7waGM@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber-l3A5Bk7waGM@public.gmane.org>
Cc: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Sangbeom Kim <sbkim73-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, linux-samsung-soc <linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Vincent Palatin <vpalatin-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Javier Martinez Canillas <javier.martinez-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>, Tomasz Figa <tomasz.figa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Kukjin Kim <kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Jaroslav Kysela <perex-/Fr2/VpizcU@public.gmane.org>, Takashi Iwai <tiwai-l3A5Bk7waGM@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

Andreas,

On Thu, Feb 19, 2015 at 9:56 AM, Andreas F=C3=A4rber <afaerber-l3A5Bk7waGM@public.gmane.org>=
 wrote:
> Am 19.02.2015 um 18:44 schrieb Doug Anderson:
>> On Thu, Feb 19, 2015 at 1:44 AM, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wro=
te:
>>> On Wed, Feb 18, 2015 at 07:25:58PM +0100, Andreas F=C3=A4rber wrote=
:
>>>
>>>>  static const struct of_device_id snow_of_match[] =3D {
>>>> +     { .compatible =3D "google,snow-audio-max98089", },
>>>>       { .compatible =3D "google,snow-audio-max98090", },
>>>>       { .compatible =3D "google,snow-audio-max98091", },
>>>>       { .compatible =3D "google,snow-audio-max98095", },
>>>
>>> Since we completely ignore the CODEC in the property might it not b=
e
>>> better to just add a plain old snow-audio compatible and bind to th=
at,
>>> that way we don't need these driver updates?  Just the "snow" bit s=
hould
>>> be enough to know it's one of this class of machines.
>>
>> I think what you're suggesting is that here we should add a new
>> compatible string "google,snow-audio" instead of adding
>> "google,snow-audio-max98089" here.  Then the sound node in the sprin=
g
>> DTS would look like:
>>
>>   compatible =3D "google,snow-audio-max98089", "google,snow-audio";
>
> If we want to be specific just in case, was it an active decision not=
 to
> use "google,peach-pi[t]-audio-max98..."?
>
> Again, either way works for me.

I don't think it was an active decision, but I am certainly nowhere
near an audio expert and I don't think I made that particular decision
(I could be wrong).

One could make the argument that "snow" describes the general hookup
style of the hardware and then you list the actual codec after that,
but that's a pretty weak argument...

-Doug
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
