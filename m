From: Naveen Krishna Ch <naveenkrishna.ch@gmail.com>
Subject: Re: SMDK6440: I2C writes fails
Date: Thu, 24 Jun 2010 18:05:12 +0530
Message-ID: <AANLkTikxaMB4eqnNuC8lneEt333gRWzKfLHy2-ChQeB5@mail.gmail.com>
References: <AANLkTim5qV8N_0iZ9DViJG1-IqYHhO-DKJZrd7RHpWbB@mail.gmail.com>
	<20100624113236.GA3958@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-gx0-f174.google.com ([209.85.161.174]:41148 "EHLO
	mail-gx0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754456Ab0FXMfd convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 24 Jun 2010 08:35:33 -0400
Received: by gxk28 with SMTP id 28so708644gxk.19
        for <linux-samsung-soc@vger.kernel.org>; Thu, 24 Jun 2010 05:35:32 -0700 (PDT)
In-Reply-To: <20100624113236.GA3958@opensource.wolfsonmicro.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Mark Brown <broonie@opensource.wolfsonmicro.com>
Cc: linux-samsung-soc@vger.kernel.org, Ben Dooks <ben-linux@fluff.org>

Hi Mark,

On 24 June 2010 17:02, Mark Brown <broonie@opensource.wolfsonmicro.com>=
 wrote:
>
> On Wed, Jun 23, 2010 at 11:15:55AM +0530, Naveen Krishna Ch wrote:
>
> > Where should i be looking,
>
> I would suggest looking at the driver and comparing it with the
> datasheet.
>
> > Will changing the spin counts work?
>
> I'd expect this to be unlikely. =A0Note that if we run out of spins w=
e
> still go for the 1ms sleep that was being used originally so it's mor=
e
> likely that there's a bug in the chip when that register is being rea=
d
> (though this would be surprising) or some other change in your kernel=
 is
> causing problems.

=A0--- a/drivers/i2c/busses/i2c-s3c2410.c
+++ b/drivers/i2c/busses/i2c-s3c2410.c
@@ -527,7 +527,7 @@ static int s3c24xx_i2c_doxfer(struct s3c24xx_i2c *i=
2c,
=A0=A0 =A0 =A0 =A0/* first, try busy waiting briefly */
=A0=A0 =A0 =A0 =A0do {
=A0=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0iicstat =3D readl(i2c->regs + S3C2410=
_IICSTAT);
- =A0 =A0 =A0 } while ((iicstat & S3C2410_IICSTAT_START) && --spins);
+ =A0 =A0 =A0 } while (--spins && (iicstat & S3C2410_IICSTAT_START));

=A0=A0 =A0 =A0 =A0/* if that timed out sleep */
=A0=A0 =A0 =A0 =A0if (!spins) {

Does the trick..

--
Shine bright,
(: Naveen Krishna Ch :)
