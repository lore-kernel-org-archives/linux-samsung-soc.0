From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [PATCH 1/2] pinctrl: samsung: fix suspend/resume functionality
Date: Fri, 17 May 2013 00:56:41 +0200
Message-ID: <1475116.qtX3b3bLWZ@flatron>
References: <1368724352-10849-1-git-send-email-dianders@chromium.org> <2099430.Q29j0K3hPy@flatron> <201305170030.39266.heiko@sntech.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ee0-f51.google.com ([74.125.83.51]:52798 "EHLO
	mail-ee0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754308Ab3EPW4p convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 16 May 2013 18:56:45 -0400
In-Reply-To: <201305170030.39266.heiko@sntech.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
Cc: Doug Anderson <dianders@chromium.org>, Kukjin Kim <kgene.kim@samsung.com>, Olof Johansson <olof@lixom.net>, Stephen Warren <swarren@wwwdotorg.org>, Thomas Abraham <thomas.abraham@linaro.org>, Linus Walleij <linus.walleij@linaro.org>, Prathyush K <prathyush.k@samsung.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Friday 17 of May 2013 00:30:38 Heiko St=FCbner wrote:
> Am Freitag, 17. Mai 2013, 00:08:34 schrieb Tomasz Figa:
> > On Thursday 16 of May 2013 14:51:53 Doug Anderson wrote:
> > > Tomasz,
> > >=20
> > > On Thu, May 16, 2013 at 2:27 PM, Tomasz Figa <tomasz.figa@gmail.c=
om>
> >=20
> > wrote:
> > > > OK. I will be fine to go with your patches, after addressing th=
e
> > > > comments. In the end it's good that you posted them, as reviewi=
ng
> > > > them allowed me to find even better ways of doing some things t=
han
> > > > I
> > > > had in mine ;) .
> > >=20
> > > Yes.  I often find that the best way to review code is to think
> > > about
> > > how I would implement it myself.  Certainly I think we've ended u=
p
> > > with something better / less buggy this way.  ;)
> > >=20
> > > > How all of this works is basically a good question. I couldn't
> > > > find
> > > > any
> > > > mention about pins switching from power down to normal mode in =
the
> > > > documentation, but maybe there is a small side note somewhere,
> > > > which I
> > > > could miss.
> > > >=20
> > > > On S3C6410, for example, there are two modes. State is switched=
 to
> > > > power down mode automatically, but can be switched out either
> > > > automatically on wake-up (exact timing is unknown to me) or by
> > > > clearing a special bit, depending on value of other special bit=
=2E
> > > >=20
> > > > IMHO this is rather important, so we should find out how it wor=
k
> > > > on
> > > > other SoCs and make the code account for it.
> > >=20
> > > Agreed that it's important.  ...but it's also good not to have to=
ns
> > > of
> > > complexity when it's not needed.  It sounds like S3C6410 could be
> > > handled OK by just using the special bits and waiting to take thi=
ngs
> > > out of power down mode.
> > >=20
> > > ...thinking about it, all SoCs that have power down modes (which =
you
> > > _must_ have if your pinctrl state is lost across a low power) wou=
ld
> > > be
> > > slightly broken if they didn't have a bit to switch out of power
> > > down
> > > mode.  Otherwise you're asking for at least some type of glitch
> > > because you'll end up in the default state of pins for a little
> > > while
> > > during resume.
> > >=20
> > > That's not to say that there aren't broken SoCs out there and it'=
s
> > > entirely possible that people even designed systems around them
> > > (knowing that the default state of each pin after wakeup is not
> > > harmful to whatever is connected to that pin).  If there are any
> > > cases
> > > like this then they would need the special code like my V1 patch
> > > had.
> > > Do you know of any SoCs like this that we need to support on kern=
el
> > > 3.10 and higher?
> >=20
> > Hmm, I just checked documentation of S3C2440 and S3C2416 they seem =
to
> > retain GPIO settings completely in sleep mode. This would mean that
> > they don't require any suspend/resume support in pinctrl driver.
> > Heiko, can you confirm this?
>=20
> Hmm, my system does not have a working suspend right now, but looking=
 at
> the legacy code (mach-s3c24xx/pm.c, etc) tells me that the gpio banks
> were never saved during suspend.
>=20
> And as there were (and still are) systems with working suspend around=
,
> I'd assume that you're correct that the pins retain their state.
>=20
> Is the same true for the s3c64xx, as I didn't find any gpio suspend
> handling for it either.

Seems like I need some sleep, as I'm already starting to overlook large=
=20
blobs of code.=20

Originally, GPIO suspend/resume handlers have been configured in=20
drivers/gpio/gpio-samsung.c, by setting pm field of samsung_gpio_chip=20
struct to point to appropriate samsung_gpio_pm struct, which contains=20
pointers to save and resume callbacks.

In result, samsung_gpio_pm_2bit_* or samsung_gpio_pm_4bit_* have been=20
used, depending on bank type, on all SoCs.

Now since the documentation states that wake-up reset doesn't reset GPI=
O=20
registers (at least on S3C2440 and S3C2416), I wonder what is the corre=
ct=20
way of handling them.

Best regards,
Tomasz
