From: Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH 5/6] ASoC: samsung: Extend Snow driver to support max98089
Date: Thu, 19 Feb 2015 09:44:08 -0800
Message-ID: <CAD=FV=WkieDSSB_-a6DtH1hmq6SyZk4NAR-eXQ11hxUDMTvRfg@mail.gmail.com>
References: <1424283959-16289-1-git-send-email-afaerber@suse.de>
	<1424283959-16289-6-git-send-email-afaerber@suse.de>
	<20150219094425.GB3198@finisterre.sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150219094425.GB3198-bheZrs9scGb3/WHNxyQH9YN0K6Il/+VY@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber-l3A5Bk7waGM@public.gmane.org>, Sangbeom Kim <sbkim73-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, linux-samsung-soc <linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Vincent Palatin <vpalatin-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Javier Martinez Canillas <javier.martinez-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>, Tomasz Figa <tomasz.figa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Kukjin Kim <kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Jaroslav Kysela <perex-/Fr2/VpizcU@public.gmane.org>, Takashi Iwai <tiwai-l3A5Bk7waGM@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

Mark,

On Thu, Feb 19, 2015 at 1:44 AM, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
> On Wed, Feb 18, 2015 at 07:25:58PM +0100, Andreas F=C3=A4rber wrote:
>
>>  static const struct of_device_id snow_of_match[] =3D {
>> +     { .compatible =3D "google,snow-audio-max98089", },
>>       { .compatible =3D "google,snow-audio-max98090", },
>>       { .compatible =3D "google,snow-audio-max98091", },
>>       { .compatible =3D "google,snow-audio-max98095", },
>
> Since we completely ignore the CODEC in the property might it not be
> better to just add a plain old snow-audio compatible and bind to that=
,
> that way we don't need these driver updates?  Just the "snow" bit sho=
uld
> be enough to know it's one of this class of machines.

I think what you're suggesting is that here we should add a new
compatible string "google,snow-audio" instead of adding
"google,snow-audio-max98089" here.  Then the sound node in the spring
DTS would look like:

  compatible =3D "google,snow-audio-max98089", "google,snow-audio";

That would allow us to later figure out that we're on a board with
max98089 in case it became important but means that any other minor
tweaks like this wouldn't need anything special.  I haven't tried that
to make sure that the fallback compatible string actually works in
this case, but it seems like the right way to go...

Sound good?

-Doug
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
