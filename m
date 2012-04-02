From: Heiko =?iso-8859-1?q?St=FCbner?= <heiko@sntech.de>
Subject: Re: [PATCH 1/6] ARM: S3C24XX: Add forgotten clock lookup table to S3C2443
Date: Tue, 3 Apr 2012 00:37:07 +0200
Message-ID: <201204030037.07993.heiko@sntech.de>
References: <201203121959.32966.heiko@sntech.de> <201203122000.31216.heiko@sntech.de> <4F7A153A.5070701@samsung.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from s15407518.onlinehome-server.info ([82.165.136.167]:60404 "EHLO
	s15407518.onlinehome-server.info" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751295Ab2DBWhS convert rfc822-to-8bit
	(ORCPT <rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 2 Apr 2012 18:37:18 -0400
In-Reply-To: <4F7A153A.5070701@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: ben-linux@fluff.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

Am Montag 02 April 2012, 23:08:10 schrieb Kukjin Kim:
> Heiko St=FCbner wrote:
> > When the hsmmc clock lookup was changed to be lookup tables based,
> > it seems the S3C2443 was forgotten.
> >=20
> > As subsequent patches will want to add more lookups to it, this
> > patch adds the base table with the missing hsmmc lookup.
> >=20
> > Signed-off-by: Heiko Stuebner<heiko@sntech.de>
> > ---
> >=20
> >   arch/arm/mach-s3c24xx/clock-s3c2443.c |    5 +++++
> >   1 files changed, 5 insertions(+), 0 deletions(-)
> >=20
> > diff --git a/arch/arm/mach-s3c24xx/clock-s3c2443.c
> > b/arch/arm/mach-s3c24xx/clock-s3c2443.c index efb3ac3..bce1cd3 1006=
44
> > --- a/arch/arm/mach-s3c24xx/clock-s3c2443.c
> > +++ b/arch/arm/mach-s3c24xx/clock-s3c2443.c
> > @@ -179,6 +179,10 @@ static struct clk *clks[] __initdata =3D {
> >=20
> >   	&clk_hsmmc,
> >  =20
> >   };
> >=20
> > +static struct clk_lookup s3c2443_clk_lookup[] =3D {
> > +	CLKDEV_INIT("s3c-sdhci.1", "mmc_busclk.2",&clk_hsmmc),
> > +};
> > +
> >=20
> >   void __init s3c2443_init_clocks(int xtal)
> >   {
> >  =20
> >   	unsigned long epllcon =3D __raw_readl(S3C2443_EPLLCON);
> >=20
> > @@ -210,6 +214,7 @@ void __init s3c2443_init_clocks(int xtal)
> >=20
> >   	s3c_register_clocks(init_clocks_off, ARRAY_SIZE(init_clocks_off)=
);
> >   	s3c_disable_clocks(init_clocks_off, ARRAY_SIZE(init_clocks_off))=
;
> >=20
> > +	clkdev_add_table(s3c2443_clk_lookup, ARRAY_SIZE(s3c2443_clk_looku=
p));
> >=20
> >   	s3c_pwmclk_init();
> >  =20
> >   }
>=20
> Uhm..how about mach-s3c24xx/common-s3c2443.c?

Nope. This clock is really specific to only the s3c2443. There is only =
one=20
hsmmc clock that is identical on both the s3c2443 and s3c2416/2450 and =
this=20
one already is in common-s3c2443.c .

common-s3c2443.c was meant for stuff common to s3c2443 _and newer_, i.e=
=2E=20
common clocks and so on.

> I think, we need to sort out some files in mach-s3c24xx/ and some
> remained mach-s3c24.. directories, actually, as you know, we didn't h=
ave
> much time to do it last time :)

yeah, we did cut it quite close :-), but it also doesn't seem to have p=
roduced=20
much fall-out. I moved my s3c2416 based development code to 3.4-rc1 wit=
hout=20
major hickups.

Getting rid of the remaining mach-directories and also the plat-s3c24xx=
 would=20
be good. But I'm not sure what you would want to change in mach-s3c24xx=
=20
directory itself.

I don't know the earlier SoCs, but the s3c2443 and s3c2416/2450 SoCs cu=
rrently=20
don't have redundancies and in the current layout it's quite easy to=20
understand what belongs to which SoC.


Heiko
