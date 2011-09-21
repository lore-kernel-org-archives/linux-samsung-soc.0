From: Heiko =?iso-8859-1?q?St=FCbner?= <heiko@sntech.de>
Subject: Re: [PATCH 2/7] s3c-adc: describe features via quirk constants
Date: Wed, 21 Sep 2011 15:04:02 +0200
Message-ID: <201109211504.03287.heiko@sntech.de>
References: <201109182241.48858.heiko@sntech.de> <201109182243.40440.heiko@sntech.de> <005801cc785a$7e46a310$7ad3e930$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from h1778886.stratoserver.net ([85.214.133.74]:48066 "EHLO
	h1778886.stratoserver.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753629Ab1IUNEP convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 21 Sep 2011 09:04:15 -0400
In-Reply-To: <005801cc785a$7e46a310$7ad3e930$%kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>, 'Ben Dooks' <ben-linux@fluff.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, heiko@sntech.de

Hi,

Am Mittwoch, 21. September 2011, 14:32:14 schrieben Sie:
> Heiko St=FCbner wrote:
> > The adc blocks of S3C2410 through S5P have a multitude of
> > quirks, i.e. moved bits or whole new registers.
> >=20
> > This patch tries to describe these individual features
> > through constants which can be used to describe an adc.
> >=20
> > As SoCs sometimes share only some of these quirks defining
> > TYPE_ADCVx values for each one wouldn't scale well when
> > adding more variants.
>=20
> Hi Heiko,
>=20
> I don't have idea we really need to use QUIRK in this case...as I kno=
w, the
> QUIRK is used on other situation...
>=20
> In addition, the TYPE_ADCVx can support each Samsung SoCs' ADC...but =
I need
> to check again.
The current types could not support the features of the 2443 and 2416/2=
450 - I=20
checked the datasheets.

The mux register in base+0x18 does not exist on any of the current plat=
forms.
Also the bit 3 in ADCCON to select the resolution is specific to the 24=
16/2450=20
(see comments above constants and quirk definitions in patches 6 and 7)=
=2E

So to support these SoCs would require the definition of two new types.=
=20
Including these new types in the existing conditionals would introduce =
a lot=20
of statements like
	if ( (TYPE_X || TYPE_Y) && !TYPE_Z)

In my opinion testing for specific features also describes the differen=
ce=20
between implementations better if one reads the code later on.


I will change the styling of the "<<"s but am wondering why checkpatch =
did not=20
complain, i.e. it complains for all other whitespace mistakes one can m=
ake but=20
not these.

Heiko

>=20
> > Signed-off-by: Heiko Stuebner <heiko@sntech.de>
> > ---
> >=20
> >  arch/arm/plat-samsung/adc.c |   29 +++++++++++++++++++++++++++++
> >  1 files changed, 29 insertions(+), 0 deletions(-)
> >=20
> > diff --git a/arch/arm/plat-samsung/adc.c b/arch/arm/plat-samsung/ad=
c.c
> > index ee8deef..b209d58 100644
> > --- a/arch/arm/plat-samsung/adc.c
> > +++ b/arch/arm/plat-samsung/adc.c
> > @@ -45,6 +45,35 @@ enum s3c_cpu_type {
> >=20
> >  	TYPE_ADCV3, /* S5PV210, S5PC110, EXYNOS4210 */
> > =20
> >  };
> >=20
> > +/*
> > + * Resolution of the ADC - 10 or 12 bit
> > + */
>=20
> /* ... */
>=20
> > +#define S3C_ADC_QUIRK_10BIT		0
> > +#define S3C_ADC_QUIRK_12BIT		(1<<0)
>=20
> According to coding style, should be added blank around <<.
>=20
> > +
> > +/*
> > + * 12bit ADC can switch resolution between 10 bit and 12 bit
> > + * ADCCON bit 03 for S3C2416
> > + * ADCCON bit 16 for S3C64XX and up
> > + */
> > +#define S3C_ADC_QUIRK_RESSEL03		(1<<1)
> > +#define S3C_ADC_QUIRK_RESSEL16		(1<<2)
>=20
> Same as above.
>=20
> > +
> > +/*
> > + * Input channel select can either be in
> > + * - reg ADCCON, bit for S3C24XX and S3C64XX
> > + * - reg base+0x18 for 2443/2416/2450
> > + * - reg base+0x1C for S5P
> > + */
> > +#define S3C_ADC_QUIRK_MUXADCCON		(1<<3)
> > +#define S3C_ADC_QUIRK_MUX18		(1<<4)
> > +#define S3C_ADC_QUIRK_MUX1C		(1<<5)
>=20
> Same.
>=20
> > +
> > +/*
> > + * CLRINT register on S3C64xx
> > + */
>=20
> /* ... */
>=20
> > +#define S3C_ADC_QUIRK_CLRINT		(1<<6)
>=20
> Same.
>=20
> > +
> >=20
> >  struct s3c_adc_client {
> > =20
> >  	struct platform_device	*pdev;
> >  	struct list_head	 pend;
> >=20
> > --
> > 1.7.2.3
>=20
> Thanks.
>=20
> Best regards,
> Kgene.
> --
> Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
> SW Solution Development Team, Samsung Electronics Co., Ltd.
