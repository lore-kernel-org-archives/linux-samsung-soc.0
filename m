From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: RE: Samsung SoCs: preparation for single kernel
Date: Thu, 24 Jun 2010 07:52:16 +0200
Message-ID: <002d01cb1361$69372c10$3ba58430$%szyprowski@samsung.com>
References: <AANLkTinGwWzIAOe2tj6V2kCrMiPT7PHlYs1kFS-IsiN4@mail.gmail.com>
 <AANLkTil-AOEqhMOXydaiA1X_v0rjoNQxALrO0UY638AS@mail.gmail.com>
 <AANLkTil1i_ZGI8bY14HhjrAk9RooVreAJsTteqqrMgqJ@mail.gmail.com>
 <AANLkTikDml6gQAsiRrCjIt4bUD3hnpAATr1erqCGOJMd@mail.gmail.com>
 <002301cb129c$ec59fe30$c50dfa90$%szyprowski@samsung.com>
 <AANLkTikspf9zHuSKe86wDQxI12HpJo_occBlLUXBkjef@mail.gmail.com>
 <003e01cb12b5$656c0670$30441350$%szyprowski@samsung.com>
 <AANLkTimqQyHLm4KcxYwYC8slSoy9udi2gganKdsD_8Nw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-2
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:29770 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751180Ab0FXFxg convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 24 Jun 2010 01:53:36 -0400
Received: from epmmp2 (mailout4.samsung.com [203.254.224.34])
 by mailout4.samsung.com
 (Sun Java(tm) System Messaging Server 7u3-15.01 64bit (built Feb 12 2010))
 with ESMTP id <0L4I002GY8DA6S10@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 24 Jun 2010 14:53:34 +0900 (KST)
Received: from AMDC159 ([106.116.37.153])
 by mmp2.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0L4I00EFP8CRAR@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 24 Jun 2010 14:53:34 +0900 (KST)
In-reply-to: <AANLkTimqQyHLm4KcxYwYC8slSoy9udi2gganKdsD_8Nw@mail.gmail.com>
Content-language: pl
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Kyungmin Park' <kmpark@infradead.org>
Cc: 'Russell King - ARM Linux' <linux@arm.linux.org.uk>, linux-samsung-soc@vger.kernel.org, 'Eric Miao' <eric.y.miao@gmail.com>, 'Ben Dooks' <ben-linux@fluff.org>, 'arm-linux' <linux-arm-kernel@lists.infradead.org>

Hello,

On Thursday, June 24, 2010 4:08 AM Kyungmin Park wrote:

> On Wed, Jun 23, 2010 at 6:20 PM, Marek Szyprowski
> <m.szyprowski@samsung.com> wrote:
> > Hello,
> >
> > On Wednesday, June 23, 2010 10:02 AM Eric Miao wrote:
> >
> >> >> Now you have
> >> >>
> >> >> s5pv210_device_hsmmc0
> >> >> s5pc100_device_hsmmc0
> >> >> s3c64xx_device_hsmmc0
> >> >> ....
> >> >>
> >> >> each with a different base.
> >> >
> >> > There is no need for such code duplication.
> >>
> >> However, I believe this is the right way to go. A certain level of
> >> duplication is the price to pay for a generic and clean solution.
> >>
> >> When a peripheral controller or IP is moved from one SoC to the
> >> next generation, there are several things could have been changed:
> >>
> >> 1. new base address and IRQ number
> >> 2. fixes and enhancements to the original IP
> >>
> >> 1. will result in a different 'struct resource', and 2. will resul=
t in a
> >> different 'struct platform_device' with a different name, so the d=
river
> >> can match the platform_device_id table as you agreed I'm right on
> >> that recommendation.
> >>
> >> They are actually _two_ different devices.
> >
> > Right, they are separate entities, but would be really good if a si=
milar
> > git brcode could be merged together.
> >
> >> > Ben is working on a solution for
> >> > a single kernel which supports multiple SoCs. Some of his work i=
n
> >> progress can
> >> > be found here: git://git.fluff.org/bjdooks/linux branch wip-sams=
ung-
> dev
> >> and
> >> > wip-samsung-dev2.
> >>
> >> Could you describe it a bit here and bring it on table for discuss=
ion?
> >
> > The idea behind his patches is to provide a table for each SoC with=
 short
> > description of all available devices and generate platform_device e=
ntries
> > dynamically from that table.
> >
> > Here is a short code example:
> >
> > struct s3c_pdev_table s3c6xxx_dev_table[] __initdata =3D {
> > =A0 =A0 =A0 =A0{
> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.type =A0 =3D SAMSUNG_DEVICE_UART,
> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.name =A0 =3D "s3c6400-uart",
> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.index =A0=3D 0,
> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.base =A0 =3D S3C_PA_UART0,
> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.irq =A0 =A0=3D IRQ_S3CUART_RX0,
> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.template =3D &template_uart_s3c64xx=
,
> > =A0 =A0 =A0 =A0}, {
> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.type =A0 =3D SAMSUNG_DEVICE_UART,
> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.name =A0 =3D "s3c6400-uart",
> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.index =A0=3D 1,
> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.base =A0 =3D S3C_PA_UART1,
> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.irq =A0 =A0=3D IRQ_S3CUART_RX1,
> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.template =3D &template_uart_s3c64xx=
,
> > =A0 =A0 =A0 =A0}, {
> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.type =A0 =3D SAMSUNG_DEVICE_UART,
> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.name =A0 =3D "s3c6400-uart",
> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.index =A0=3D 2,
> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.base =A0 =3D S3C_PA_UART2,
> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.irq =A0 =A0=3D IRQ_S3CUART_RX2,
> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.template =3D &template_uart_s3c64xx=
,
> > =A0 =A0 =A0 =A0}, {
> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.type =A0 =3D SAMSUNG_DEVICE_UART,
> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.name =A0 =3D "s3c6400-uart",
> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.index =A0=3D 3,
> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.base =A0 =3D S3C_PA_UART3,
> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.irq =A0 =A0=3D IRQ_S3CUART_RX3,
> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.template =3D &template_uart_s3c64xx=
,
> > =A0 =A0 =A0 =A0}, {
> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.type =A0 =3D SAMSUNG_DEVICE_WATCHDO=
G,
> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.name =A0 =3D "s3c2410-wdt",
> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.index =A0=3D -1,
> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.base =A0 =3D S3C64XX_PA_WATCHDOG,
> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.irq =A0 =A0=3D IRQ_WDT,
> > =A0 =A0 =A0 =A0}, {
> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.type =A0 =3D SAMSUNG_DEVICE_SDHCI,
> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.name =A0 =3D "s3c-sdhci",
> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.index =A0=3D 0,
> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.base =A0 =3D S3C64XX_PA_HSMMC0 ,
> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.irq =A0 =A0=3D IRQ_HSMMC0,
> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.dma =A0 =A0=3D &samsung_std_dma_mas=
k,
> > =A0 =A0 =A0 =A0}, {
> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.type =A0 =3D SAMSUNG_DEVICE_SDHCI,
> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.name =A0 =3D "s3c-sdhci",
> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.index =A0=3D 1,
> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.base =A0 =3D S3C64XX_PA_HSMMC1,
> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.irq =A0 =A0=3D IRQ_HSMMC1,
> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.dma =A0 =A0=3D &samsung_std_dma_mas=
k,
> > =A0 =A0 =A0 =A0}, {
> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.type =A0 =3D SAMSUNG_DEVICE_SDHCI,
> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.name =A0 =3D "s3c-sdhci",
> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.index =A0=3D 2,
> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.base =A0 =3D S3C64XX_PA_HSMMC2,
> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.irq =A0 =A0=3D IRQ_HSMMC1,
> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.dma =A0 =A0=3D &samsung_std_dma_mas=
k,
> > =A0 =A0 =A0 =A0}, {
> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.type =A0 =3D SAMSUNG_DEVICE_OHCI,
> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.name =A0 =3D "s3c2410-ohci",
> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.index =A0=3D -1,
> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.base =A0 =3D S3C64XX_PA_USBHOST,
> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.irq =A0 =A0=3D IRQ_USBH,
> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.dma =A0 =A0=3D &samsung_std_dma_mas=
k,
> > =A0 =A0 =A0 =A0}, {
> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.type =A0 =3D SAMSUNG_DEVICE_NAND,
> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.name =A0 =3D "s3c6400-nand",
> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.index =A0=3D -1,
> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.base =A0 =3D 0x4E000000,
> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.irq =A0 =A0=3D IRQ_NFC,
> > =A0 =A0 =A0 =A0}, {
> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.type =A0 =3D SAMSUNG_DEVICE_I2C,
> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.name =A0 =3D "s3c2440-i2c",
> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.index =A0=3D 0,
> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.base =A0 =3D S3C64XX_PA_IIC0,
> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.irq =A0 =A0=3D IRQ_IIC,
> > =A0 =A0 =A0 =A0}, {
> > ...
> >
> > This solution is imho really clean an easy to understand. It is als=
o
> > easy to check which SoC has which peripherals defined and how.
>=20
> Question. recently it's changed to use MMC0, MMC2, MMC3, then how to =
define
> it?

There is index parameter that defines the instance of the device.

> More basically, where these info are defined for chip or board?

The above table is defined per SoC. Each board then registers the parti=
cular
devices like it is done in the current kernels. The following diff shou=
ld
explain it better:

-static struct platform_device *smdk6400_devices[] __initdata =3D {
-	&s3c_device_hsmmc1,
-	&s3c_device_i2c0,
+static struct s3c_devtable  smdk6400_devtable[] __initdata =3D {
+	{ .type =3D SAMSUNG_DEVICE_SDHCI,	.index =3D 1, },
+	{ .type =3D SAMSUNG_DEVICE_I2C,	.index =3D 0, },

static void __init smdk6400_machine_init(void)
 {
 	i2c_register_board_info(0, i2c_devs, ARRAY_SIZE(i2c_devs));
-	platform_add_devices(smdk6400_devices, ARRAY_SIZE(smdk6400_devices));
+	samsung_add_devices(smdk6400_devtable, ARRAY_SIZE(smdk6400_devtable))=
;
 }

> If chip, the how to handle several variants?

The same way it is handled in the current kernels. Machine init code ca=
n
even do some additional fixups if required.

Best regards
--
Marek Szyprowski
Samsung Poland R&D Center
