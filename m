From: Heiko =?iso-8859-15?q?St=FCbner?= <heiko@sntech.de>
Subject: Re: question about arch/arm/mach-s3c24xx/irq.c
Date: Sun, 24 Feb 2013 18:49:41 +0100
Message-ID: <201302241849.41638.heiko@sntech.de>
References: <alpine.DEB.2.02.1302241241440.1943@hadrien> <201302241611.13028.heiko@sntech.de> <alpine.DEB.2.02.1302241644540.1943@hadrien>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=iso-8859-15
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from gloria.sntech.de ([95.129.55.99]:37328 "EHLO gloria.sntech.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751015Ab3BXRt6 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 24 Feb 2013 12:49:58 -0500
In-Reply-To: <alpine.DEB.2.02.1302241644540.1943@hadrien>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Julia Lawall <julia.lawall@lip6.fr>
Cc: Russell King - ARM Linux <linux@arm.linux.org.uk>, ben-linux@fluff.org, kgene.kim@samsung.com, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org

Am Sonntag, 24. Februar 2013, 16:45:18 schrieb Julia Lawall:
> On Sun, 24 Feb 2013, Heiko St=FCbner wrote:
> > Am Sonntag, 24. Februar 2013, 14:39:45 schrieb Julia Lawall:
> > > [Adding the person who introduced the code]
> > >=20
> > > On Sun, 24 Feb 2013, Russell King - ARM Linux wrote:
> > > > On Sun, Feb 24, 2013 at 12:45:11PM +0100, Julia Lawall wrote:
> > > > > The function s3c24xx_irq_map in arch/arm/mach-s3c24xx/irq.c
> > > > > contains the
> > > > >=20
> > > > > code:
> > > > >                 parent_irq_data =3D
> > > > >                 &parent_intc->irqs[irq_data->parent_irq];
> > > > > 	=09
> > > > > 		if (!irq_data) {
> > > > > 	=09
> > > > >                         pr_err("irq-s3c24xx: no irq data foun=
d for
> > > > >                         hwirq %lu\n",
> > > > >                        =20
> > > > >                                hw);
> > > > >                        =20
> > > > >                         goto err;
> > > > > 	=09
> > > > > 		}
> > > > >=20
> > > > > At this point irq_data has already been tested, so the null t=
est on
> > > > > irq_data does not look correct.  But I wonder if parent_irq_d=
ata
> > > > > could ever be null here?
> > > >=20
> > > > That would be really obscure - because that would require paren=
t_intc
> > > > to be a "negative" pointer (to counter-act the indexing by
> > > > irq_data->parent_irq).  So it looks to me like the above is
> > > > redundant.
> > >=20
> > > Even at its original definition irq_data seems unlikely to be NUL=
L:
> > >         struct s3c_irq_intc *intc =3D h->host_data;
> > > =09
> > > 	struct s3c_irq_data *irq_data =3D &intc->irqs[hw];
> > > 	...
> > > 	if (!irq_data) {
> > > =09
> > >                 pr_err("irq-s3c24xx: no irq data found for hwirq
> > >                 %lu\n",
> > >=20
> > > hw); return -EINVAL;
> > >=20
> > >         }
> > >=20
> > > That is, it could be an invalid value, but whether it actually hi=
ts 0
> > > would seem to depend on the value hw?
> > >=20
> > > Heiko, is NULL really a possibility?
> >=20
> > The test you quoted is of course wrong ... it would need to test
> > parent_irq_data. But you're also right that the test is not necessa=
ry at
> > all.
> >=20
> > All the s3c_irq_data arrays used always contain 32 entries to reach=
 all
> > bits of the register (which is used differently on each SoC). So if=
 we
> > have found the parent_intc at all, it should contain a 32 entries a=
rray
> > of irq_data structs, so no need to test for the existence of the
> > individual array element.
> >=20
> >=20
> > And now that I look at it, I also see another glitch. The code test=
s for
> > parent_irq !=3D 0, which of course won't work if the parent_irq is =
the
> > 0-hwirq of the parent controller.
> > The only SoC using such a mapping is the s3c2412 [0], which explain=
s why
> > I haven't been bitten by this myself.
>=20
> Do you want to make all the fixes?

Yep, I just need to find out what the best fix for my parent_irq mess u=
p would=20
be :-)

The easiest way would of course be to use a value outside the valid ran=
ge to=20
indicate no parent-irq, so either < 0 (would need a type change) or > 3=
2 .

But I might be overlooking something here.
