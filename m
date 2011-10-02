From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH 2/7] s3c-adc: describe features via quirk constants
Date: Sun, 02 Oct 2011 16:38:18 +0900
Message-ID: <001a01cc80d6$40bf7e70$c23e7b50$%kim@samsung.com>
References: <201109182241.48858.heiko@sntech.de>
 <201109182243.40440.heiko@sntech.de>
 <005801cc785a$7e46a310$7ad3e930$%kim@samsung.com>
 <201109211504.03287.heiko@sntech.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:8661 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751696Ab1JBHiT convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 2 Oct 2011 03:38:19 -0400
Received: from epcpsbgm1.samsung.com (mailout1.samsung.com [203.254.224.24])
 by mailout1.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LSF00D23H7UNE40@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Sun, 02 Oct 2011 16:38:18 +0900 (KST)
Received: from kgenekim ([12.23.120.114])
 by mmp1.samsung.com (Oracle Communications Messaging Exchange Server 7u4-19.01
 64bit (built Sep  7 2010)) with ESMTPA id <0LSF00BV7H7UT130@mmp1.samsung.com>
 for linux-samsung-soc@vger.kernel.org; Sun, 02 Oct 2011 16:38:18 +0900 (KST)
In-reply-to: <201109211504.03287.heiko@sntech.de>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: =?ISO-8859-1?Q?'Heiko_St=FCbner'?= <heiko@sntech.de>, 'Ben Dooks' <ben-linux@fluff.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

Heiko St=FCbner wrote:
>=20
> Hi,
>=20
> Am Mittwoch, 21. September 2011, 14:32:14 schrieben Sie:
> > Heiko St=FCbner wrote:
> > > The adc blocks of S3C2410 through S5P have a multitude of
> > > quirks, i.e. moved bits or whole new registers.
> > >
> > > This patch tries to describe these individual features
> > > through constants which can be used to describe an adc.
> > >
> > > As SoCs sometimes share only some of these quirks defining
> > > TYPE_ADCVx values for each one wouldn't scale well when
> > > adding more variants.
> >
> > Hi Heiko,
> >
> > I don't have idea we really need to use QUIRK in this case...as I k=
now,
the
> > QUIRK is used on other situation...
> >
> > In addition, the TYPE_ADCVx can support each Samsung SoCs' ADC...bu=
t I
> need
> > to check again.
> The current types could not support the features of the 2443 and 2416=
/2450
- I
> checked the datasheets.
>=20
> The mux register in base+0x18 does not exist on any of the current
platforms.
> Also the bit 3 in ADCCON to select the resolution is specific to the
2416/2450
> (see comments above constants and quirk definitions in patches 6 and =
7).
>=20
> So to support these SoCs would require the definition of two new type=
s.
> Including these new types in the existing conditionals would introduc=
e a
lot
> of statements like
> 	if ( (TYPE_X || TYPE_Y) && !TYPE_Z)
>=20
> In my opinion testing for specific features also describes the differ=
ence
> between implementations better if one reads the code later on.
>=20
>=20
> I will change the styling of the "<<"s but am wondering why checkpatc=
h did
not
> complain, i.e. it complains for all other whitespace mistakes one can=
 make
but
> not these.
>=20

Hi Heiko,

How about following? I think following is also not bad...

diff --git a/arch/arm/plat-samsung/adc.c b/arch/arm/plat-samsung/adc.c
index ee8deef..f5c6703 100644
--- a/arch/arm/plat-samsung/adc.c
+++ b/arch/arm/plat-samsung/adc.c
@@ -41,6 +41,8 @@
=20
 enum s3c_cpu_type {
 	TYPE_ADCV1, /* S3C24XX */
+	TYPE_ADCV11, /* S3C2416 */
+	TYPE_ADCV12, /* S3C2443 */
 	TYPE_ADCV2, /* S3C64XX, S5P64X0, S5PC100 */
 	TYPE_ADCV3, /* S5PV210, S5PC110, EXYNOS4210 */
 };
@@ -98,13 +100,17 @@ static inline void s3c_adc_select(struct adc_devic=
e
*adc,
=20
 	client->select_cb(client, 1);
=20
-	con &=3D ~S3C2410_ADCCON_MUXMASK;
+	if (cpu =3D=3D TYPE_ADCV1 || cpu =3D=3D TYPE_ADCV2)
+		con &=3D ~S3C2410_ADCCON_MUXMASK;
 	con &=3D ~S3C2410_ADCCON_STDBM;
 	con &=3D ~S3C2410_ADCCON_STARTMASK;
=20
 	if (!client->is_ts) {
 		if (cpu =3D=3D TYPE_ADCV3)
 			writel(client->channel & 0xf, adc->regs +
S5P_ADCMUX);
+		elif (cpu =3D=3D TYPE_ADCV12)
+			writel(client->channel & 0xf,
+				adc->regs + S3C2443_ADCMUX);
 		else
 			con |=3D S3C2410_ADCCON_SELMUX(client->channel);
 	}
@@ -293,13 +299,13 @@ static irqreturn_t s3c_adc_irq(int irq, void *pw)
=20
 	client->nr_samples--;
=20
-	if (cpu !=3D TYPE_ADCV1) {
-		/* S3C64XX/S5P ADC resolution is 12-bit */
-		data0 &=3D 0xfff;
-		data1 &=3D 0xfff;
-	} else {
+	if (cpu =3D=3D TYPE_ADCV1 || cpu =3D=3D TYPE_ADCV12) {
 		data0 &=3D 0x3ff;
 		data1 &=3D 0x3ff;
+	} else {
+		/* S3C2416, S3C64XX/S5P ADC resolution is 12-bit */
+		data0 &=3D 0xfff;
+		data1 &=3D 0xfff;
 	}
=20
 	if (client->convert_cb)
@@ -320,7 +326,7 @@ static irqreturn_t s3c_adc_irq(int irq, void *pw)
 	}
=20
 exit:
-	if (cpu !=3D TYPE_ADCV1) {
+	if (cpu =3D=3D TYPE_ADCV2 || cpu =3D=3D TYPE_ADCV3) {
 		/* Clear ADC interrupt */
 		writel(0, adc->regs + S3C64XX_ADCCLRINT);
 	}
@@ -332,6 +338,7 @@ static int s3c_adc_probe(struct platform_device *pd=
ev)
 	struct device *dev =3D &pdev->dev;
 	struct adc_device *adc;
 	struct resource *regs;
+	enum s3c_cpu_type cpu =3D platform_get_device_id(pdev)->driver_data;
 	int ret;
 	unsigned tmp;
=20
@@ -394,10 +401,13 @@ static int s3c_adc_probe(struct platform_device *=
pdev)
 	clk_enable(adc->clk);
=20
 	tmp =3D adc->prescale | S3C2410_ADCCON_PRSCEN;
-	if (platform_get_device_id(pdev)->driver_data !=3D TYPE_ADCV1) {
-		/* Enable 12-bit ADC resolution */
+
+	/* Enable 12-bit ADC resolution */
+	if (cpu =3D=3D TYPE_ADCV11)
+		tmp |=3D S3C2416_ADCCON_RESSEL;
+	if (cpu =3D=3D TYPE_ADCV2 || cpu =3D=3D TYPE_ADCV3)
 		tmp |=3D S3C64XX_ADCCON_RESSEL;
-	}
+
 	writel(tmp, adc->regs + S3C2410_ADCCON);
=20
 	dev_info(dev, "attached adc driver\n");
@@ -464,6 +474,7 @@ static int s3c_adc_resume(struct device *dev)
 	struct platform_device *pdev =3D container_of(dev,
 			struct platform_device, dev);
 	struct adc_device *adc =3D platform_get_drvdata(pdev);
+	enum s3c_cpu_type cpu =3D platform_get_device_id(pdev)->driver_data;
 	int ret;
 	unsigned long tmp;
=20
@@ -474,9 +485,13 @@ static int s3c_adc_resume(struct device *dev)
 	enable_irq(adc->irq);
=20
 	tmp =3D adc->prescale | S3C2410_ADCCON_PRSCEN;
+
 	/* Enable 12-bit ADC resolution */
-	if (platform_get_device_id(pdev)->driver_data !=3D TYPE_ADCV1)
+	if (cpu =3D=3D TYPE_ADCV11)
+		tmp |=3D S3C2416_ADCCON_RESSEL;
+	if (cpu =3D=3D TYPE_ADCV2 || cpu =3D=3D TYPE_ADCV3)
 		tmp |=3D S3C64XX_ADCCON_RESSEL;
+
 	writel(tmp, adc->regs + S3C2410_ADCCON);
=20
 	return 0;
@@ -492,6 +507,12 @@ static struct platform_device_id s3c_adc_driver_id=
s[] =3D
{
 		.name           =3D "s3c24xx-adc",
 		.driver_data    =3D TYPE_ADCV1,
 	}, {
+		.name		=3D "s3c2416-adc",
+		.driver_data	=3D TYPE_ADCV11
+	}, {
+		.name		=3D "s3c2443-adc",
+		.driver_data	=3D TYPE_ADCV12
+	}, {
 		.name           =3D "s3c64xx-adc",
 		.driver_data    =3D TYPE_ADCV2,
 	}, {

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.

> Heiko
>=20
> >
> > > Signed-off-by: Heiko Stuebner <heiko@sntech.de>
> > > ---
> > >
> > >  arch/arm/plat-samsung/adc.c |   29 +++++++++++++++++++++++++++++
> > >  1 files changed, 29 insertions(+), 0 deletions(-)
> > >
> > > diff --git a/arch/arm/plat-samsung/adc.c b/arch/arm/plat-samsung/=
adc.c
> > > index ee8deef..b209d58 100644
> > > --- a/arch/arm/plat-samsung/adc.c
> > > +++ b/arch/arm/plat-samsung/adc.c
> > > @@ -45,6 +45,35 @@ enum s3c_cpu_type {
> > >
> > >  	TYPE_ADCV3, /* S5PV210, S5PC110, EXYNOS4210 */
> > >
> > >  };
> > >
> > > +/*
> > > + * Resolution of the ADC - 10 or 12 bit
> > > + */
> >
> > /* ... */
> >
> > > +#define S3C_ADC_QUIRK_10BIT		0
> > > +#define S3C_ADC_QUIRK_12BIT		(1<<0)
> >
> > According to coding style, should be added blank around <<.
> >
> > > +
> > > +/*
> > > + * 12bit ADC can switch resolution between 10 bit and 12 bit
> > > + * ADCCON bit 03 for S3C2416
> > > + * ADCCON bit 16 for S3C64XX and up
> > > + */
> > > +#define S3C_ADC_QUIRK_RESSEL03		(1<<1)
> > > +#define S3C_ADC_QUIRK_RESSEL16		(1<<2)
> >
> > Same as above.
> >
> > > +
> > > +/*
> > > + * Input channel select can either be in
> > > + * - reg ADCCON, bit for S3C24XX and S3C64XX
> > > + * - reg base+0x18 for 2443/2416/2450
> > > + * - reg base+0x1C for S5P
> > > + */
> > > +#define S3C_ADC_QUIRK_MUXADCCON		(1<<3)
> > > +#define S3C_ADC_QUIRK_MUX18		(1<<4)
> > > +#define S3C_ADC_QUIRK_MUX1C		(1<<5)
> >
> > Same.
> >
> > > +
> > > +/*
> > > + * CLRINT register on S3C64xx
> > > + */
> >
> > /* ... */
> >
> > > +#define S3C_ADC_QUIRK_CLRINT		(1<<6)
> >
> > Same.
> >
> > > +
> > >
> > >  struct s3c_adc_client {
> > >
> > >  	struct platform_device	*pdev;
> > >  	struct list_head	 pend;
> > >
> > > --
> > > 1.7.2.3
> >
> > Thanks.
> >
> > Best regards,
> > Kgene.
> > --
> > Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
> > SW Solution Development Team, Samsung Electronics Co., Ltd.
