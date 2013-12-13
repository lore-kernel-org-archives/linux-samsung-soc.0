From: Heiko =?iso-8859-1?q?St=FCbner?= <heiko@sntech.de>
Subject: Re: [PATCH] ARM: S3C24XX: Fix configuration of gpio port sizes on S3C24XX.
Date: Fri, 13 Dec 2013 10:29:19 +0100
Message-ID: <201312131029.20078.heiko@sntech.de>
References: <1378889173-7437-1-git-send-email-jose.goncalves@inov.pt> <52AA6909.8050200@inov.pt> <0bc301cef7e5$319ac0c0$94d04240$@kernel.org>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <0bc301cef7e5$319ac0c0$94d04240$@kernel.org>
Sender: linux-gpio-owner@vger.kernel.org
To: kgene@kernel.org
Cc: =?iso-8859-1?q?=27Jos=E9_Miguel?= =?iso-8859-1?q?_Gon=E7alves=27?= <jose.goncalves@inov.pt>, 'Linus Walleij' <linus.walleij@linaro.org>, 'Tomasz Figa' <t.figa@samsung.com>, 'linux-samsung-soc' <linux-samsung-soc@vger.kernel.org>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

Am Freitag, 13. Dezember 2013, 10:24:59 schrieb kgene@kernel.org:
> Jos=E9 Miguel Gon=E7alves wrote:
> > On 27-09-2013 15:17, Linus Walleij wrote:
> > > On Wed, Sep 11, 2013 at 10:46 AM, Jos=E9 Miguel Gon=E7alves
> > >=20
> > > <jose.goncalves@inov.pt> wrote:
> > >> Some GPIO line limits are incorrectly set which, for instance,
> > >> does not allow nRTS1 (GPH11) configuration on a S3C2416 chip.
> > >>=20
> > >> Signed-off-by: Jos=E9 Miguel Gon=E7alves <jose.goncalves@inov.pt=
>
> > >> ---
> > >>=20
> > >>   arch/arm/mach-s3c24xx/include/mach/gpio.h |   10 +++++-----
> > >=20
> > > OK but grrrr!
> > >=20
> > > What needs to happen to the s3c24xx is to get rid of this file.
> > >=20
> > > - Define ARCH_NR_GPIOS in arch/arm/Kconfig entry
> > >=20
> > >    ARCH_NR_GPIO like everyone else
> > >=20
> > > - Get rid of the config symbol NEED_MACH_GPIO_H
> > >=20
> > > -  Move this file down into arch/arm/mach-s3c24xx/s3c24xx-gpio.h
> > >=20
> > >    or whatever and make it local...
> > >=20
> > > I will try to do this myself if noone else helps out, so I'd like=
 to
> > > carry this patch in the GPIO tree provided I can get an ACK from
> > > the S3C24xx maintainer. Tomasz, is that you or Kukjin?
> > >=20
> > > (BTW the above maybe goes for S3c64xx as well .. and S5P
> > > oh well I will get to it.)
> >=20
> > Was this patch forgotten?
>=20
> Hi Jose,
>=20
> Sorry about missing your patch. It's my fault :( and as you know, at =
this
> moment the file will be removed by Linus' patch...
>=20
> Anyway, let me look at the Samsung patches closely ;)

The comment that is changed in the header is removed by Linus' patch, b=
ut the=20
change to the gpio driver is still relevant for the time being I'd thin=
k.


Heiko
--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
