From: Naveen Krishna Ch <naveenkrishna.ch@gmail.com>
Subject: Re: SMDK6440: I2C writes fails
Date: Mon, 28 Jun 2010 11:24:39 +0530
Message-ID: <AANLkTinobDuo9ffJ3O6iNlYG8yPOnSA-WCeO_y9eXOg2@mail.gmail.com>
References: <AANLkTim5qV8N_0iZ9DViJG1-IqYHhO-DKJZrd7RHpWbB@mail.gmail.com>
	<20100624113236.GA3958@opensource.wolfsonmicro.com> <AANLkTikxaMB4eqnNuC8lneEt333gRWzKfLHy2-ChQeB5@mail.gmail.com>
	<34703F8C-7A9C-43FE-A748-9F6E90F3D425@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qw0-f46.google.com ([209.85.216.46]:44692 "EHLO
	mail-qw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752556Ab0F1FzB convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 28 Jun 2010 01:55:01 -0400
Received: by qwi4 with SMTP id 4so1598986qwi.19
        for <linux-samsung-soc@vger.kernel.org>; Sun, 27 Jun 2010 22:54:59 -0700 (PDT)
In-Reply-To: <34703F8C-7A9C-43FE-A748-9F6E90F3D425@opensource.wolfsonmicro.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Mark Brown <broonie@opensource.wolfsonmicro.com>
Cc: "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Ben Dooks <ben-linux@fluff.org>

Hi Mark,

On 24 June 2010 22:05, Mark Brown <broonie@opensource.wolfsonmicro.com>=
 wrote:
>
> On 24 Jun 2010, at 13:35, Naveen Krishna Ch <naveenkrishna.ch@gmail.c=
om> wrote:
>
> > Hi Mark,
> >
> > On 24 June 2010 17:02, Mark Brown <broonie@opensource.wolfsonmicro.=
com> wrote:
> >>
> >> On Wed, Jun 23, 2010 at 11:15:55AM +0530, Naveen Krishna Ch wrote:
> >>
> >>> Where should i be looking,
> >>
> >> I would suggest looking at the driver and comparing it with the
> >> datasheet.
> >>
> >>> Will changing the spin counts work?
> >>
> >> I'd expect this to be unlikely. =A0Note that if we run out of spin=
s we
> >> still go for the 1ms sleep that was being used originally so it's =
more
> >> likely that there's a bug in the chip when that register is being =
read
> >> (though this would be surprising) or some other change in your ker=
nel is
> >> causing problems.
> >
> > =A0--- a/drivers/i2c/busses/i2c-s3c2410.c
> > +++ b/drivers/i2c/busses/i2c-s3c2410.c
> > @@ -527,7 +527,7 @@ static int s3c24xx_i2c_doxfer(struct s3c24xx_i2=
c *i2c,
> > =A0 =A0 =A0 =A0 /* first, try busy waiting briefly */
> > =A0 =A0 =A0 =A0 do {
> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 iicstat =3D readl(i2c->regs + S3C24=
10_IICSTAT);
> > - =A0 =A0 =A0 } while ((iicstat & S3C2410_IICSTAT_START) && --spins=
);
> > + =A0 =A0 =A0 } while (--spins && (iicstat & S3C2410_IICSTAT_START)=
);
> >
> > =A0 =A0 =A0 =A0 /* if that timed out sleep */
> > =A0 =A0 =A0 =A0 if (!spins) {
> >
> > Does the trick..
>
> That smells rather like a compiler bug to me - the two versions
> ought to be equivalent apart from the ordering of the comparisons.
I'm not sure, I'm using arm-2009q3 toolchain.

--
Shine bright,
(: Naveen Krishna Ch :)
