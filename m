From: Inderpal Singh <inderpal.singh@linaro.org>
Subject: Re: [PATCH] ARM: EXYNOS4: Configure MAX8997 PMIC for Origen
Date: Wed, 17 Aug 2011 16:20:22 +0530
Message-ID: <CAG17yqRvL1=PdWL8r1FVd7HHYX5Nd7gYY5HLD+L2pofBQc-DQg@mail.gmail.com>
References: <1313034965-21286-1-git-send-email-inderpal.singh@linaro.org>
	<20110814150148.GB25504@sirena.org.uk>
	<CAG17yqTP+Amg_UhWNjwZ0x8bH+VzV82k3La5Y0fep9WRArbe+g@mail.gmail.com>
	<20110816151916.GA15484@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qw0-f46.google.com ([209.85.216.46]:37387 "EHLO
	mail-qw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753048Ab1HQKuX convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 17 Aug 2011 06:50:23 -0400
Received: by qwk3 with SMTP id 3so491002qwk.19
        for <linux-samsung-soc@vger.kernel.org>; Wed, 17 Aug 2011 03:50:22 -0700 (PDT)
In-Reply-To: <20110816151916.GA15484@opensource.wolfsonmicro.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Mark Brown <broonie@opensource.wolfsonmicro.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, myungjoo.ham@samsung.com, Inderpal Singh <inderpal.s@samsung.com>

On 16 August 2011 20:49, Mark Brown <broonie@opensource.wolfsonmicro.co=
m> wrote:
>
> On Tue, Aug 16, 2011 at 04:38:46PM +0530, Inderpal Singh wrote:
> > On 14 August 2011 20:31, Mark Brown <broonie@opensource.wolfsonmicr=
o.com>wrote:
> > > On Thu, Aug 11, 2011 at 09:26:05AM +0530, Inderpal Singh wrote:
>
> > > > +static struct regulator_consumer_supply __initdata ldo7_consum=
er[] =3D {
> > > > + =A0 =A0 REGULATOR_SUPPLY("avdd", "soc-audio"), /* Reatek ALC5=
625*/
> > > > +};
>
> > > Ick, no. =A0The soc-audio device is a virtual device within Linux=
 and is
> > > being phased out, any driver adding new soc-audio devices will be
> > > rejected. =A0The CODEC driver should deal with its own power.
>
> > Ok. So does it mean that sound cards will have their own devices? A=
nd those
> > device names should be listed as consumers?
>
> As I said above "The CODEC driver should deal with its own power."

Ok, will change accordingly.

>
> > > > +static struct i2c_board_info i2c0_devs[] __initdata =3D {
> > > > +[I2C0_MAX8997] =3D {
> > > > + =A0 =A0 I2C_BOARD_INFO("max8997", (0xCC >> 1)),
> > > > + =A0 =A0 .platform_data =3D &origen_max8997_pdata,
> > > > + =A0 =A0 },
> > > > +};
>
> > > Why are you assigning the array index? =A0That's very unusual.
>
> > Have seen this kind of initialisation at few places. It looked more
> > readable.
> > If its not preferred, I will remove it.
>
> You shouldn't need to be looking up individual members in a board inf=
o
> array in the first place.

Ok, will remove array index assignment.

>
> > > > + =A0 =A0 s3c_i2c0_set_platdata(NULL);
> > > > + =A0 =A0 i2c0_devs[I2C0_MAX8997].irq =3D gpio_to_irq(EXYNOS4_G=
PX0(4));
>
> > > There should be defines to do this statically.
>
> > What advantages do you see in using defines?
>
> It's non-idiomatic to modify the I2C board info at runtime, all the
> numbers are known at compile time anyway.

This line is External Interrupt line, so will use suitable IRQ_EINT
macro and resubmit the patch.


With Regards,
Inder
