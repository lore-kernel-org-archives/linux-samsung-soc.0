From: Heiko =?iso-8859-1?q?St=FCbner?= <heiko@sntech.de>
Subject: Re: [PATCH] ARM: S3C24XX: Fix configuration of gpio port sizes on S3C24XX.
Date: Fri, 13 Dec 2013 09:42:03 +0100
Message-ID: <201312130942.03674.heiko@sntech.de>
References: <1378889173-7437-1-git-send-email-jose.goncalves@inov.pt> <52AA6909.8050200@inov.pt> <CACRpkdbBqqbkp3ap3Y=C5zC3Cq9jd+dL4iPZ9-2-Fd81GLAPBA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <CACRpkdbBqqbkp3ap3Y=C5zC3Cq9jd+dL4iPZ9-2-Fd81GLAPBA@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: =?iso-8859-1?q?Jos=E9_Miguel_Gon=E7alves?= <jose.goncalves@inov.pt>, Ben Dooks <ben-linux@fluff.org>, Kukjin Kim <kgene.kim@samsung.com>, Tomasz Figa <t.figa@samsung.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-samsung-soc@vger.kernel.org

Am Freitag, 13. Dezember 2013, 09:12:52 schrieb Linus Walleij:
> On Fri, Dec 13, 2013 at 2:55 AM, Jos=E9 Miguel Gon=E7alves
>=20
> <jose.goncalves@inov.pt> wrote:
> > On 27-09-2013 15:17, Linus Walleij wrote:
> >> On Wed, Sep 11, 2013 at 10:46 AM, Jos=E9 Miguel Gon=E7alves
> >>=20
> >> <jose.goncalves@inov.pt> wrote:
> >>> Some GPIO line limits are incorrectly set which, for instance,
> >>> does not allow nRTS1 (GPH11) configuration on a S3C2416 chip.
> >>>=20
> >>> Signed-off-by: Jos=E9 Miguel Gon=E7alves <jose.goncalves@inov.pt>
> >>> ---
> >>>=20
> >>>   arch/arm/mach-s3c24xx/include/mach/gpio.h |   10 +++++-----
>=20
> (...)
>=20
> > Was this patch forgotten?
>=20
> Not by me, I just never got an ACK from the Samsung maintainers,
> so I can't apply it to the GPIO tree.
>=20
> Ben, Kukjin: can one of you ACK this so I can take it through the
> GPIO tree?

again not the maintainer :-), but I've looked through the manuals of s3=
c24xx=20
socs and the new values look correct [I had looked up the patch content=
 in the=20
list archive], so

Acked-by: Heiko Stuebner <heiko@sntech.de>


But Jose, you should really really look into moving to devicetree with =
your=20
platform, if you're not already doing so. Pinctrl support is already pr=
esent,=20
and I'm hopefull the move to the common clock framework I posted a few =
days=20
ago might make it too.


Heiko
--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
