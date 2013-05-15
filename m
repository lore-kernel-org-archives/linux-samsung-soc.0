From: Heiko =?iso-8859-1?q?St=FCbner?= <heiko@sntech.de>
Subject: Re: [RFC 2/4] dma: add dmaengine driver for Samsung s3c24xx SoCs
Date: Thu, 16 May 2013 00:45:03 +0200
Message-ID: <201305160045.03934.heiko@sntech.de>
References: <201305111330.05046.heiko@sntech.de> <201305152348.32171.heiko@sntech.de> <45625193.0y3McEvmiD@flatron>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from gloria.sntech.de ([95.129.55.99]:42618 "EHLO gloria.sntech.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752742Ab3EOWpO (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 15 May 2013 18:45:14 -0400
In-Reply-To: <45625193.0y3McEvmiD@flatron>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <tomasz.figa@gmail.com>
Cc: Sylwester Nawrocki <sylvester.nawrocki@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, Dan Williams <djbw@fb.com>, Vinod Koul <vinod.koul@intel.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Kukjin Kim <kgene.kim@samsung.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Russell King - ARM Linux <linux@arm.linux.org.uk>

Am Donnerstag, 16. Mai 2013, 00:02:40 schrieb Tomasz Figa:
> On Wednesday 15 of May 2013 23:48:31 Heiko St=FCbner wrote:
> > Am Mittwoch, 15. Mai 2013, 23:20:08 schrieb Sylwester Nawrocki:
> > > On 05/15/2013 10:31 PM, Heiko St=FCbner wrote:
> > > >>> +       BUG();
> > > >>>=20
> > > >> >  Isn't that a bit nasty. This macro should be used with care=
 and
> > > >> >  we
> > > >> >  should recover if possible. dev_err()?
> > > >=20
> > > > runtime_config already denies any settings not in the 1,2 or 4b=
ytes
> > > > range - the default-part should therefore never be reached. So =
if
> > > > any other value magically appears in the register and triggers =
the
> > > > default-part, something is seriously wrong. So my guess is, the=
 BUG
> > > > might be appropriate.
> > > >=20
> > > > On the other hand the whole default+BUG part could also simply =
go
> > > > away,
> > > > for the same reasons.
> > >=20
> > > IMHO BUG() is not needed at all. As Linus suggested dev_err() is =
such
> > > case or WARN_ON() would be more appropriate. This has been discus=
sed
> > > in the past extensively, not sure if you are aware of the other
> > > Linus' opinion on BUG()/BUG_ON() proliferation:
> > > https://lkml.org/lkml/2012/9/27/461
> >=20
> > Very interesting read and I'll keep this in mind in the future. Wha=
t
> > about the other option ... i.e. simply getting rid of the whole "er=
ror
> > handling", as the other code paths should already make sure that on=
ly
> > valid values get written into the register.
> >=20
> > Can the value change in the register somehow on its own without ker=
nel
> > intervention, or does this not happen?
>=20
> Hmm, it depends on hardware, I guess. Not sure how it works on this
> particular IP.
>=20
> Still, the mentioned BUG() was about a value in a driver-filled struc=
t,
> wasn't it?
>=20
> /* Quoting the the code for reference */
>=20
> > +static u32 s3c24xx_dma_getbytes_chan(struct s3c24xx_dma_chan *s3cc=
han)
> > +{
> > +       struct s3c24xx_dma_phy *phy =3D s3cchan->phy;
> > +       struct s3c24xx_txd *txd =3D s3cchan->at;
> > +       u32 tc =3D readl(phy->base + DSTAT) & DSTAT_CURRTC_MASK;
> > +
> > +       switch (txd->dcon & DCON_DSZ_MASK) {
> > +       case DCON_DSZ_BYTE:
> > +               return tc;
> > +       case DCON_DSZ_HALFWORD:
> > +               return tc * 2;
> > +       case DCON_DSZ_WORD:
> > +               return tc * 4;
> > +       default:
> > +               break;
> > +       }
> > +
> > +       BUG();
>=20
> (Btw. I don't see anything setting the DCON_DSZ bits in this field. A=
m I
> missing something?)

this is for calculating the remaining bytes of the transaction. which i=
s used=20
in s3c24xx_dma_tx_status.=20

And when looking at it again, I can't really fathom why I did it this w=
ay with=20
decoding the DSZ from the dcon value of the s3c24xx_txd again instead o=
f=20
simply using the width value of the same struct ....=20

So it can be much simpler as
	(...)
     u32 tc =3D readl(phy->base + DSTAT) & DSTAT_CURRTC_MASK;
	return tc * txd->width;

getting rid of this stuff alltogether


still puzzled how I came up with this strangeness in the first place
Heiko
