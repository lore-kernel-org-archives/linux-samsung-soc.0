From: Jingoo Han <jg1.han@samsung.com>
Subject: Re: [PATCH] ARM: EXYNOS: add FIMD1 support for EXYNOS5
Date: Fri, 08 Jun 2012 09:04:27 +0900
Message-ID: <000201cd450a$45adcce0$d10966a0$%han@samsung.com>
References: <000c01cd423e$8c9c9510$a5d5bf30$%han@samsung.com>
 <CAJuYYwTgqtigbeGxtCZQGFvODpfn_ZMmjeiBUmqanKnMK8aB0Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:23603 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752928Ab2FHAEb convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 7 Jun 2012 20:04:31 -0400
Received: from epcpsbgm1.samsung.com (mailout1.samsung.com [203.254.224.24])
 by mailout1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0M5900D7LUUWO8K0@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 08 Jun 2012 09:04:28 +0900 (KST)
Received: from DOJG1HAN02 ([12.23.119.56])
 by mmp1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0M5900I3VUVFKTC0@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 08 Jun 2012 09:04:28 +0900 (KST)
In-reply-to: <CAJuYYwTgqtigbeGxtCZQGFvODpfn_ZMmjeiBUmqanKnMK8aB0Q@mail.gmail.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Thomas Abraham' <thomas.abraham@linaro.org>
Cc: 'Kukjin Kim' <kgene.kim@samsung.com>, linux-samsung-soc@vger.kernel.org, 'Jingoo Han' <jg1.han@samsung.com>

On 4 June 2012 20:53, Thomas Abraham <thomas.abraham@linaro.org> wrote:

>=20
> Dear Mr. Han,
>=20
> On 4 June 2012 16:11, Jingoo Han <jg1.han@samsung.com> wrote:
> > This patch adds platform device s5p_device_fimd1 for EXYNOS FIMD1.
> > EXYNOS has two FIMDs(FIMD0, FIMD1). Some definitions used to enable
> > EXYNOS FIMD1 are added.
> >
> > This patch also adds resource definitions for EXYNOS5 FIMD1.
> > FIMD1 clock and SFR definitions are added.
>=20
> Since Exynos5 has support for only device tree, additions related to
> adding platform devices, functions to setup gpio and macros can be
> dropped from this patch.

OK, I will remove 'additions related to adding platform devices,
functions to setup gpio and macros'.

Thank you for reviewing the patch.

Best regards,
Jingoo Han

>=20
> Thanks,
> Thomas.
>=20
> >
> > Signed-off-by: Jingoo Han <jg1.han@samsung.com>
> > ---
> > =A0arch/arm/mach-exynos/Kconfig =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 | =A0=
 =A05 +++
> > =A0arch/arm/mach-exynos/Makefile =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0| =A0=
 =A01 +
> > =A0arch/arm/mach-exynos/clock-exynos5.c =A0 =A0 =A0 =A0 | =A0 11 ++=
+++++-
> > =A0arch/arm/mach-exynos/common.c =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0| =A0=
 =A02 +
> > =A0arch/arm/mach-exynos/include/mach/irqs.h =A0 =A0 | =A0 =A04 +++
> > =A0arch/arm/mach-exynos/include/mach/map.h =A0 =A0 =A0| =A0 =A02 +
> > =A0arch/arm/mach-exynos/setup-fimd1.c =A0 =A0 =A0 =A0 =A0 | =A0 36 =
++++++++++++++++++++++++++
> > =A0arch/arm/plat-samsung/Kconfig =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0| =A0=
 =A05 +++
> > =A0arch/arm/plat-samsung/devs.c =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 | =A0=
 28 ++++++++++++++++++++
> > =A0arch/arm/plat-samsung/include/plat/devs.h =A0 =A0| =A0 =A01 +
> > =A0arch/arm/plat-samsung/include/plat/fb-core.h | =A0 =A05 +++
> > =A0arch/arm/plat-samsung/include/plat/fb.h =A0 =A0 =A0| =A0 15 ++++=
+++++++
> > =A012 files changed, 114 insertions(+), 1 deletions(-)
> > =A0create mode 100644 arch/arm/mach-exynos/setup-fimd1.c
> >
> > diff --git a/arch/arm/mach-exynos/Kconfig b/arch/arm/mach-exynos/Kc=
onfig
> > index 573be57..49a9e21 100644
> > --- a/arch/arm/mach-exynos/Kconfig
> > +++ b/arch/arm/mach-exynos/Kconfig
> > @@ -93,6 +93,11 @@ config EXYNOS4_SETUP_FIMD0
> > =A0 =A0 =A0 =A0help
> > =A0 =A0 =A0 =A0 =A0Common setup code for FIMD0.
> >
> > +config EXYNOS_SETUP_FIMD1
> > + =A0 =A0 =A0 bool
> > + =A0 =A0 =A0 help
> > + =A0 =A0 =A0 =A0 Common setup code for FIMD1.
> > +
> > =A0config EXYNOS_DEV_SYSMMU
> > =A0 =A0 =A0 =A0bool
> > =A0 =A0 =A0 =A0help
> > diff --git a/arch/arm/mach-exynos/Makefile b/arch/arm/mach-exynos/M=
akefile
> > index 9b58024..fd8263c 100644
> > --- a/arch/arm/mach-exynos/Makefile
> > +++ b/arch/arm/mach-exynos/Makefile
> > @@ -59,6 +59,7 @@ obj-$(CONFIG_EXYNOS_DEV_SYSMMU) =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 +=3D dev-sysmmu.o
> > =A0obj-$(CONFIG_ARCH_EXYNOS) =A0 =A0 =A0 =A0 =A0 =A0 =A0+=3D setup-=
i2c0.o
> > =A0obj-$(CONFIG_EXYNOS4_SETUP_FIMC) =A0 =A0 =A0 +=3D setup-fimc.o
> > =A0obj-$(CONFIG_EXYNOS4_SETUP_FIMD0) =A0 =A0 =A0+=3D setup-fimd0.o
> > +obj-$(CONFIG_EXYNOS_SETUP_FIMD1) =A0 =A0 =A0 +=3D setup-fimd1.o
> > =A0obj-$(CONFIG_EXYNOS4_SETUP_I2C1) =A0 =A0 =A0 +=3D setup-i2c1.o
> > =A0obj-$(CONFIG_EXYNOS4_SETUP_I2C2) =A0 =A0 =A0 +=3D setup-i2c2.o
> > =A0obj-$(CONFIG_EXYNOS4_SETUP_I2C3) =A0 =A0 =A0 +=3D setup-i2c3.o
> > diff --git a/arch/arm/mach-exynos/clock-exynos5.c b/arch/arm/mach-e=
xynos/clock-exynos5.c
> > index fefa336..49e2ad2 100644
> > --- a/arch/arm/mach-exynos/clock-exynos5.c
> > +++ b/arch/arm/mach-exynos/clock-exynos5.c
> > @@ -868,6 +868,13 @@ static struct clk exynos5_clk_mdma1 =3D {
> > =A0 =A0 =A0 =A0.ctrlbit =A0 =A0 =A0 =A0=3D (1 << 4),
> > =A0};
> >
> > +static struct clk exynos5_clk_fimd1 =3D {
> > + =A0 =A0 =A0 .name =A0 =A0 =A0 =A0 =A0 =3D "fimd",
> > + =A0 =A0 =A0 .devname =A0 =A0 =A0 =A0=3D "exynos5-fb.1",
> > + =A0 =A0 =A0 .enable =A0 =A0 =A0 =A0 =3D exynos5_clk_ip_disp1_ctrl=
,
> > + =A0 =A0 =A0 .ctrlbit =A0 =A0 =A0 =A0=3D (1 << 0),
> > +};
> > +
> > =A0struct clk *exynos5_clkset_group_list[] =3D {
> > =A0 =A0 =A0 =A0[0] =3D &clk_ext_xtal_mux,
> > =A0 =A0 =A0 =A0[1] =3D NULL,
> > @@ -1046,7 +1053,7 @@ static struct clksrc_clk exynos5_clksrcs[] =3D=
 {
> > =A0 =A0 =A0 =A0}, {
> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.clk =A0 =A0=3D {
> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.name =A0 =A0 =A0 =A0=
 =A0 =3D "sclk_fimd",
> > - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 .devname =A0 =A0 =A0 =
=A0=3D "s3cfb.1",
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 .devname =A0 =A0 =A0 =
=A0=3D "exynos5-fb.1",
> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.enable =A0 =A0 =A0 =
=A0 =3D exynos5_clksrc_mask_disp1_0_ctrl,
> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.ctrlbit =A0 =A0 =A0=
 =A0=3D (1 << 0),
> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0},
> > @@ -1154,6 +1161,7 @@ static struct clk *exynos5_clk_cdev[] =3D {
> > =A0 =A0 =A0 =A0&exynos5_clk_pdma0,
> > =A0 =A0 =A0 =A0&exynos5_clk_pdma1,
> > =A0 =A0 =A0 =A0&exynos5_clk_mdma1,
> > + =A0 =A0 =A0 &exynos5_clk_fimd1,
> > =A0};
> >
> > =A0static struct clksrc_clk *exynos5_clksrc_cdev[] =3D {
> > @@ -1176,6 +1184,7 @@ static struct clk_lookup exynos5_clk_lookup[]=
 =3D {
> > =A0 =A0 =A0 =A0CLKDEV_INIT("exynos4-sdhci.1", "mmc_busclk.2", &exyn=
os5_clk_sclk_mmc1.clk),
> > =A0 =A0 =A0 =A0CLKDEV_INIT("exynos4-sdhci.2", "mmc_busclk.2", &exyn=
os5_clk_sclk_mmc2.clk),
> > =A0 =A0 =A0 =A0CLKDEV_INIT("exynos4-sdhci.3", "mmc_busclk.2", &exyn=
os5_clk_sclk_mmc3.clk),
> > + =A0 =A0 =A0 CLKDEV_INIT("exynos5-fb.1", "lcd", &exynos5_clk_fimd1=
),
> > =A0 =A0 =A0 =A0CLKDEV_INIT("dma-pl330.0", "apb_pclk", &exynos5_clk_=
pdma0),
> > =A0 =A0 =A0 =A0CLKDEV_INIT("dma-pl330.1", "apb_pclk", &exynos5_clk_=
pdma1),
> > =A0 =A0 =A0 =A0CLKDEV_INIT("dma-pl330.2", "apb_pclk", &exynos5_clk_=
mdma1),
> > diff --git a/arch/arm/mach-exynos/common.c b/arch/arm/mach-exynos/c=
ommon.c
> > index 742edd3..84a187d 100644
> > --- a/arch/arm/mach-exynos/common.c
> > +++ b/arch/arm/mach-exynos/common.c
> > @@ -366,6 +366,8 @@ static void __init exynos5_map_io(void)
> > =A0 =A0 =A0 =A0s3c_i2c0_setname("s3c2440-i2c");
> > =A0 =A0 =A0 =A0s3c_i2c1_setname("s3c2440-i2c");
> > =A0 =A0 =A0 =A0s3c_i2c2_setname("s3c2440-i2c");
> > +
> > + =A0 =A0 =A0 s5p_fb_setname(1, "exynos5-fb");
> > =A0}
> >
> > =A0static void __init exynos4_init_clocks(int xtal)
> > diff --git a/arch/arm/mach-exynos/include/mach/irqs.h b/arch/arm/ma=
ch-exynos/include/mach/irqs.h
> > index 7a4b478..608b0c6 100644
> > --- a/arch/arm/mach-exynos/include/mach/irqs.h
> > +++ b/arch/arm/mach-exynos/include/mach/irqs.h
> > @@ -232,6 +232,10 @@
> > =A0#define IRQ_FIMD0_VSYNC =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0EXYNOS4_IRQ_FIMD0_VSYNC
> > =A0#define IRQ_FIMD0_SYSTEM =A0 =A0 =A0 =A0 =A0 =A0 =A0 EXYNOS4_IRQ=
_FIMD0_SYSTEM
> >
> > +#define IRQ_FIMD1_FIFO =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 EXYNOS5_IRQ=
_FIMD1_FIFO
> > +#define IRQ_FIMD1_VSYNC =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0EXYNOS5_IRQ_FIMD1_VSYNC
> > +#define IRQ_FIMD1_SYSTEM =A0 =A0 =A0 =A0 =A0 =A0 =A0 EXYNOS5_IRQ_F=
IMD1_SYSTEM
> > +
> > =A0#define IRQ_GPIO1_NR_GROUPS =A0 =A0 =A0 =A0 =A0 =A0EXYNOS4_IRQ_G=
PIO1_NR_GROUPS
> > =A0#define IRQ_GPIO2_NR_GROUPS =A0 =A0 =A0 =A0 =A0 =A0EXYNOS4_IRQ_G=
PIO2_NR_GROUPS
> >
> > diff --git a/arch/arm/mach-exynos/include/mach/map.h b/arch/arm/mac=
h-exynos/include/mach/map.h
> > index ca4aa89..07d0028 100644
> > --- a/arch/arm/mach-exynos/include/mach/map.h
> > +++ b/arch/arm/mach-exynos/include/mach/map.h
> > @@ -167,6 +167,7 @@
> > =A0#define EXYNOS4_PA_MIPI_CSIS1 =A0 =A0 =A0 =A0 =A00x11890000
> >
> > =A0#define EXYNOS4_PA_FIMD0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 0x11C00000
> > +#define EXYNOS5_PA_FIMD1 =A0 =A0 =A0 =A0 =A0 =A0 =A0 0x14400000
> >
> > =A0#define EXYNOS4_PA_HSMMC(x) =A0 =A0 =A0 =A0 =A0 =A0(0x12510000 +=
 ((x) * 0x10000))
> > =A0#define EXYNOS4_PA_DWMCI =A0 =A0 =A0 =A0 =A0 =A0 =A0 0x12550000
> > @@ -240,6 +241,7 @@
> > =A0#define S5P_PA_JPEG =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0EXYNO=
S4_PA_JPEG
> > =A0#define S5P_PA_G2D =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 EXYNO=
S4_PA_G2D
> > =A0#define S5P_PA_FIMD0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 EXYNOS4=
_PA_FIMD0
> > +#define S5P_PA_FIMD1 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 EXYNOS5_P=
A_FIMD1
> > =A0#define S5P_PA_HDMI =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0EXYNO=
S4_PA_HDMI
> > =A0#define S5P_PA_IIC_HDMIPHY =A0 =A0 =A0 =A0 =A0 =A0 EXYNOS4_PA_II=
C_HDMIPHY
> > =A0#define S5P_PA_MFC =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 EXYNO=
S4_PA_MFC
> > diff --git a/arch/arm/mach-exynos/setup-fimd1.c b/arch/arm/mach-exy=
nos/setup-fimd1.c
> > new file mode 100644
> > index 0000000..ecab126
> > --- /dev/null
> > +++ b/arch/arm/mach-exynos/setup-fimd1.c
> > @@ -0,0 +1,36 @@
> > +/* linux/arch/arm/mach-exynos/setup-fimd1.c
> > + *
> > + * Copyright (c) 2012 Samsung Electronics Co., Ltd.
> > + * =A0 =A0 =A0 =A0 =A0 =A0 http://www.samsung.com
> > + *
> > + * Base Exynos FIMD 1 configuration
> > + *
> > + * This program is free software; you can redistribute it and/or m=
odify
> > + * it under the terms of the GNU General Public License version 2 =
as
> > + * published by the Free Software Foundation.
> > + */
> > +
> > +#include <linux/fb.h>
> > +#include <linux/gpio.h>
> > +
> > +#include <plat/gpio-cfg.h>
> > +#include <plat/regs-fb-v4.h>
> > +
> > +#include <mach/map.h>
> > +
> > +void exynos5_fimd1_gpio_setup_24bpp(void)
> > +{
> > + =A0 =A0 =A0 unsigned int reg;
> > +
> > + =A0 =A0 =A0 /*
> > + =A0 =A0 =A0 =A0* Set DISP1BLK_CFG register for Display path selec=
tion
> > + =A0 =A0 =A0 =A0*
> > + =A0 =A0 =A0 =A0* FIMD of DISP1_BLK Bypass selection : DISP1BLK_CF=
G[15]
> > + =A0 =A0 =A0 =A0* ---------------------
> > + =A0 =A0 =A0 =A0* =A00 | MIE/MDINE
> > + =A0 =A0 =A0 =A0* =A01 | FIMD : selected
> > + =A0 =A0 =A0 =A0*/
> > + =A0 =A0 =A0 reg =3D __raw_readl(S3C_VA_SYS + 0x0214);
> > + =A0 =A0 =A0 reg |=3D (1 << 15);
> > + =A0 =A0 =A0 __raw_writel(reg, S3C_VA_SYS + 0x0214);
> > +}
> > diff --git a/arch/arm/plat-samsung/Kconfig b/arch/arm/plat-samsung/=
Kconfig
> > index a2fae4e..63d3435 100644
> > --- a/arch/arm/plat-samsung/Kconfig
> > +++ b/arch/arm/plat-samsung/Kconfig
> > @@ -362,6 +362,11 @@ config S5P_DEV_FIMD0
> > =A0 =A0 =A0 =A0help
> > =A0 =A0 =A0 =A0 =A0Compile in platform device definitions for FIMD =
controller 0
> >
> > +config S5P_DEV_FIMD1
> > + =A0 =A0 =A0 bool
> > + =A0 =A0 =A0 help
> > + =A0 =A0 =A0 =A0 Compile in platform device definitions for FIMD c=
ontroller 1
> > +
> > =A0config S5P_DEV_G2D
> > =A0 =A0 =A0 =A0bool
> > =A0 =A0 =A0 =A0help
> > diff --git a/arch/arm/plat-samsung/devs.c b/arch/arm/plat-samsung/d=
evs.c
> > index 1d214cb..bb1c39d 100644
> > --- a/arch/arm/plat-samsung/devs.c
> > +++ b/arch/arm/plat-samsung/devs.c
> > @@ -334,6 +334,34 @@ void __init s5p_fimd0_set_platdata(struct s3c_=
fb_platdata *pd)
> > =A0}
> > =A0#endif /* CONFIG_S5P_DEV_FIMD0 */
> >
> > +/* FIMD1 */
> > +
> > +#ifdef CONFIG_S5P_DEV_FIMD1
> > +static struct resource s5p_fimd1_resource[] =3D {
> > + =A0 =A0 =A0 [0] =3D DEFINE_RES_MEM(S5P_PA_FIMD1, SZ_32K),
> > + =A0 =A0 =A0 [1] =3D DEFINE_RES_IRQ(IRQ_FIMD1_VSYNC),
> > + =A0 =A0 =A0 [2] =3D DEFINE_RES_IRQ(IRQ_FIMD1_FIFO),
> > + =A0 =A0 =A0 [3] =3D DEFINE_RES_IRQ(IRQ_FIMD1_SYSTEM),
> > +};
> > +
> > +struct platform_device s5p_device_fimd1 =3D {
> > + =A0 =A0 =A0 .name =A0 =A0 =A0 =A0 =A0 =3D "s5p-fb",
> > + =A0 =A0 =A0 .id =A0 =A0 =A0 =A0 =A0 =A0 =3D 1,
> > + =A0 =A0 =A0 .num_resources =A0=3D ARRAY_SIZE(s5p_fimd1_resource),
> > + =A0 =A0 =A0 .resource =A0 =A0 =A0 =3D s5p_fimd1_resource,
> > + =A0 =A0 =A0 .dev =A0 =A0 =A0 =A0 =A0 =A0=3D {
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .dma_mask =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =3D &samsung_device_dma_mask,
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .coherent_dma_mask =A0 =A0 =A0=3D DMA=
_BIT_MASK(32),
> > + =A0 =A0 =A0 },
> > +};
> > +
> > +void __init s5p_fimd1_set_platdata(struct s3c_fb_platdata *pd)
> > +{
> > + =A0 =A0 =A0 s3c_set_platdata(pd, sizeof(struct s3c_fb_platdata),
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0&s5p_device_fimd1)=
;
> > +}
> > +#endif /* CONFIG_S5P_DEV_FIMD1 */
> > +
> > =A0/* HWMON */
> >
> > =A0#ifdef CONFIG_S3C_DEV_HWMON
> > diff --git a/arch/arm/plat-samsung/include/plat/devs.h b/arch/arm/p=
lat-samsung/include/plat/devs.h
> > index 61ca2f3..f06980f 100644
> > --- a/arch/arm/plat-samsung/include/plat/devs.h
> > +++ b/arch/arm/plat-samsung/include/plat/devs.h
> > @@ -84,6 +84,7 @@ extern struct platform_device s5p_device_fimc_md;
> > =A0extern struct platform_device s5p_device_jpeg;
> > =A0extern struct platform_device s5p_device_g2d;
> > =A0extern struct platform_device s5p_device_fimd0;
> > +extern struct platform_device s5p_device_fimd1;
> > =A0extern struct platform_device s5p_device_hdmi;
> > =A0extern struct platform_device s5p_device_i2c_hdmiphy;
> > =A0extern struct platform_device s5p_device_mfc;
> > diff --git a/arch/arm/plat-samsung/include/plat/fb-core.h b/arch/ar=
m/plat-samsung/include/plat/fb-
> core.h
> > index 6abcbf1..8766794 100644
> > --- a/arch/arm/plat-samsung/include/plat/fb-core.h
> > +++ b/arch/arm/plat-samsung/include/plat/fb-core.h
> > @@ -35,6 +35,11 @@ static inline void s5p_fb_setname(int id, char *=
name)
> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0s5p_device_fimd0.name =3D name;
> > =A0 =A0 =A0 =A0break;
> > =A0#endif
> > +#ifdef CONFIG_S5P_DEV_FIMD1
> > + =A0 =A0 =A0 case 1:
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 s5p_device_fimd1.name =3D name;
> > + =A0 =A0 =A0 break;
> > +#endif
> > =A0 =A0 =A0 =A0default:
> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0printk(KERN_ERR "%s: invalid device =
id(%d)\n", __func__, id);
> > =A0 =A0 =A0 =A0break;
> > diff --git a/arch/arm/plat-samsung/include/plat/fb.h b/arch/arm/pla=
t-samsung/include/plat/fb.h
> > index 536002f..331ca5b 100644
> > --- a/arch/arm/plat-samsung/include/plat/fb.h
> > +++ b/arch/arm/plat-samsung/include/plat/fb.h
> > @@ -83,6 +83,14 @@ extern void s3c_fb_set_platdata(struct s3c_fb_pl=
atdata *pd);
> > =A0extern void s5p_fimd0_set_platdata(struct s3c_fb_platdata *pd);
> >
> > =A0/**
> > + * s5p_fimd1_set_platdata() - Setup the FB device with platform da=
ta.
> > + * @pd: The platform data to set. The data is copied from the pass=
ed structure
> > + * =A0 =A0 =A0so the machine data can mark the data __initdata so =
that any unused
> > + * =A0 =A0 =A0machines will end up dumping their data at runtime.
> > + */
> > +extern void s5p_fimd1_set_platdata(struct s3c_fb_platdata *pd);
> > +
> > +/**
> > =A0* s3c64xx_fb_gpio_setup_24bpp() - S3C64XX setup function for 24b=
pp LCD
> > =A0*
> > =A0* Initialise the GPIO for an 24bpp LCD display on the RGB interf=
ace.
> > @@ -111,6 +119,13 @@ extern void s5pv210_fb_gpio_setup_24bpp(void);
> > =A0extern void exynos4_fimd0_gpio_setup_24bpp(void);
> >
> > =A0/**
> > + * exynos5_fimd1_gpio_setup_24bpp() - Exynos5 setup function for 2=
4bpp LCD0
> > + *
> > + * Initialise the GPIO for an 24bpp LCD display on the RGB interfa=
ce 1.
> > + */
> > +extern void exynos5_fimd1_gpio_setup_24bpp(void);
> > +
> > +/**
> > =A0* s5p64x0_fb_gpio_setup_24bpp() - S5P6440/S5P6450 setup function=
 for 24bpp LCD
> > =A0*
> > =A0* Initialise the GPIO for an 24bpp LCD display on the RGB interf=
ace.
> > --
> > 1.7.1
> >
> >
> > --
> > To unsubscribe from this list: send the line "unsubscribe linux-sam=
sung-soc" in
> > the body of a message to majordomo@vger.kernel.org
> > More majordomo info at =A0http://vger.kernel.org/majordomo-info.htm=
l
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsu=
ng-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
