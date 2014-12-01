From: Krzysztof Kozlowski <k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH v2 3/5] pinctrl: exynos: Fix GPIO setup failure because
 domain clock being gated
Date: Mon, 01 Dec 2014 15:52:08 +0100
Message-ID: <1417445528.31392.8.camel@AMDC1943>
References: <1417011857-10419-1-git-send-email-k.kozlowski@samsung.com>
 <1417011857-10419-4-git-send-email-k.kozlowski@samsung.com>
 <CACRpkdb8F8YcvFeHPvOKHjx_p4HEpimck3XRabB3oHpZTdmRQQ@mail.gmail.com>
 <1417183724.18249.36.camel@AMDC1943>
 <CA+Ln22Ejo51VPWf6DmuRvV_fZr_H=-BXAshSPSOokNE1bz=-QA@mail.gmail.com>
 <1417423043.4055.14.camel@AMDC1943>
 <CA+Ln22H_a9CWxrYO_i9Esm6keXA8XLLYmE1Vg-8ynamJ1sAwpQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <CA+Ln22H_a9CWxrYO_i9Esm6keXA8XLLYmE1Vg-8ynamJ1sAwpQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Tomasz Figa <tomasz.figa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Sylwester Nawrocki <s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Kukjin Kim <kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-samsung-soc <linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Thomas Abraham <thomas.abraham-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Javier Martinez Canillas <javier.martinez-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>, Vivek Gautam <gautam.vivek-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Kevin Hilman <khilman-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Kyungmin Park <kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Marek Szyprowski <m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

On pon, 2014-12-01 at 23:34 +0900, Tomasz Figa wrote:
> 2014-12-01 17:37 GMT+09:00 Krzysztof Kozlowski <k.kozlowski@samsung.c=
om>:
> >
> > On nie, 2014-11-30 at 21:19 +0900, Tomasz Figa wrote:
> >> Hi Krzysztof,
> >>
> >> 2014-11-28 23:08 GMT+09:00 Krzysztof Kozlowski <k.kozlowski@samsun=
g.com>:
> >> > On pi=C4=85, 2014-11-28 at 15:04 +0100, Linus Walleij wrote:
> >> >> On Wed, Nov 26, 2014 at 3:24 PM, Krzysztof Kozlowski
> >> >> <k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org> wrote:
> >> >>
> >> >> > The audio subsystem on Exynos 5420 has separate clocks and GP=
IO. To
> >> >> > operate properly on GPIOs the main block clock 'mau_epll' mus=
t be
> >> >> > enabled.
> >> >> >
> >> >> > This was observed on Peach Pi/Pit and Arndale Octa (after ena=
bling i2s0)
> >> >> > after introducing runtime PM to pl330 DMA driver. After that =
commit the
> >> >> > 'mau_epll' was gated, because the "amba" clock was disabled a=
nd there
> >> >> > were no more users of mau_epll.
> >> >> >
> >> >> > The system hang just before probing i2s0 because
> >> >> > samsung_pinmux_setup() tried to access memory from audss bloc=
k which was
> >> >> > gated.
> >> >> >
> >> >> > Add a clock property to the pinctrl driver and enable the clo=
ck during
> >> >> > GPIO setup. During normal GPIO operations (set, get, set_dire=
ction) the
> >> >> > clock is not enabled.
> >>
> >> Could you make sure that possibility of gating this clock is worth=
 the
> >> effort of adding gating code to all affected drivers? If there is =
no
> >> significant change in power consumption maybe it could be simply k=
eep
> >> running all the time?
> >
> > I had an impression that last time you disliked such idea:
> > http://www.spinics.net/lists/arm-kernel/msg338127.html
> > That's why I developed these patches. Because keeping a clock alway=
s on,
> > even when it is unused, is undesirable.
>=20
> I was mostly concerned about the particular solution implemented by
> that patch that kept the clocks enabled on all platforms, not only th=
e
> affected one. However...
>=20
> >
> > Anyway, I did some simple measurements (after booting Arndale Octa
> > to /bin/sh, idle):
> >  - with mau_epll gated: ~523 mA
> >  - with mau_epll always on: ~531 mA
> >
> > Keeping it on increases energy usage by 1.5% in idle (with measurem=
ent
> > uncertainty ~0.4%).
> >
>=20
> ...this definitely shows that the effort isn't worthless, which means
> that your patch goes in the right direction.

Great!

>=20
> >
> >> Also isn't a similar problem happening due to power domains? I bel=
ieve
> >> the whole maudio block is located in a separate power domain but
> >> somehow it doesn't get turned off?
> >
> > There is Maudio power domain... but I think it is not related here.
>=20
> Could you somehow check what happens when the maudio power domain is
> turned off and maudio pin controller is accessed? Could you also chec=
k
> the difference in power consumption with this domain powered on and
> off?

I can try. I'll let you know the results.

>=20
> > Pinctrl driver does not have runtime PM and is not attached to a do=
main.
> > I thought about other solution to this problem (with utilization of
> > power domains):
> >  - add runtime PM to pinctrl and audss clocks,
> >  - attach pinctrl and audss clocks to maudio power domain,
> >  - enable the clock when power domain is turned on.
> > However almost the same changes had to be added to pinctrl and auds=
s
> > clocks drivers (replace clock_enable() with pm_runtime_get_sync()).
>=20
> Well, if the dependency is there due to hardware design, I think it
> needs to be reflected in the drivers as well.
>=20
> Few other issues that came to my mind:
>=20
>  - Your previous patch added clock control only to pinctrl operations=
=2E
> Shouldn't GPIO operations be included as well?

Yeah... but does it make any sense? For example imagine GPIO is
configured as input. Enabling the clock won't change anything because
already that clock should be enabled by peripheral which writes to such
GPIO.

>  - If power domain dependency is there too, what happens with GPIO
> pins if the domain is powered off? If they lose their states, wouldn'=
t
> it necessary to keep the domain powered on whenever there is some GPI=
O
> pin requested (which usually =3D in use)? (I'd assume that special
> functions shouldn't take a reference on runtime PM, because they are
> related to IP blocks in the same PM domain, which will implicitly kee=
p
> the domain powered on.)

What you're saying makes sense but that look like job for sound soc
driver? Anyway the domain is not present in DTS so by default it is
turned on.

>  - Doesn't the clock controller also lose its state whenever the powe=
r
> domain is powered off? I guess that would be similar to ISP clock
> controller, issues of which are still not resolved in mainline.
> Sylwester could tell you more about this, I guess.

Once again - the domain.

Best regards,
Krzysztof


--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
