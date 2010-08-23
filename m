From: Kyungmin Park <kmpark@infradead.org>
Subject: Re: [PATCH RE-SEND] ARM: S5P: Move OneNAND device definitions in plat-s5p
Date: Mon, 23 Aug 2010 12:58:49 +0900
Message-ID: <AANLkTi=V52VyR7ydy6CPChsn0Qp0jW0G0x=ozroDBZYo@mail.gmail.com>
References: <1282522043-2420-1-git-send-email-kgene.kim@samsung.com>
	<01ba01cb4268$8346fa50$89d4eef0$%park@samsung.com>
	<006001cb426b$e84dd560$b8e98020$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ww0-f44.google.com ([74.125.82.44]:61792 "EHLO
	mail-ww0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753053Ab0HWD6v convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 22 Aug 2010 23:58:51 -0400
Received: by wwd20 with SMTP id 20so623641wwd.1
        for <linux-samsung-soc@vger.kernel.org>; Sun, 22 Aug 2010 20:58:49 -0700 (PDT)
In-Reply-To: <006001cb426b$e84dd560$b8e98020$%kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, ben-linux@fluff.org, Kyungmin Park <"Kyungmin Park <kyungmin.park"@samsung.com>

On Mon, Aug 23, 2010 at 11:35 AM, Kukjin Kim <kgene.kim@samsung.com> wr=
ote:
> Kyungmin Park wrote:
>>
>> " Note: S5PC110 and S5PC210 have same OneNAND driver."
>>
>> Yes I also think it's same device. At least Spec is same. But I hear=
d it
> has
>> some different feature related with DMA operation.
>> I'm not yet receive the official release from LSI. So I can't tell t=
he
> exact
>> one.
>>
>> If it's true. we need to separate it if required.
>>
> No need to separate this stuff.
> It means that no problem to use this commonly for S5PC110 and S5PC210=
=2E
As DMA operation is changed, we need to register onenand device
separately like s5pc210-onenand.
to use the different read operations.

>
> But...I will check it again before applying.
>
>> Thank you,
>> Kyungmin Park
>>
>> -----Original Message-----
>> From: Kukjin Kim [mailto:kgene.kim@samsung.com]
>> Sent: Monday, August 23, 2010 9:07 AM
>> To: linux-arm-kernel@lists.infradead.org;
> linux-samsung-soc@vger.kernel.org
>> Cc: ben-linux@fluff.org; Kukjin Kim; Kyungmin Park
>> Subject: [PATCH RE-SEND] ARM: S5P: Move OneNAND device definitions i=
n
>> plat-s5p
>>
>> This patch moves OneNAND device definitions from mach-s5pv210 to pla=
t-s5p
>> so that can support it commonly.
>>
>> Note: S5PC110 and S5PC210 have same OneNAND driver.
>>
>> Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
>> Cc: Kyungmin Park <Kyungmin Park <kyungmin.park@samsung.com>
>> ---
>> =A0arch/arm/mach-s5pv210/Kconfig =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 | =A0 =A09 +-----
>> =A0arch/arm/mach-s5pv210/Makefile =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0| =A0 =A01 -
>> =A0arch/arm/mach-s5pv210/include/mach/map.h =A0 =A0 =A0 =A0 =A0| =A0=
 =A03 ++
>> =A0arch/arm/mach-s5pv210/mach-aquila.c =A0 =A0 =A0 =A0 =A0 =A0 =A0 |=
 =A0 =A02 +-
>> =A0arch/arm/mach-s5pv210/mach-goni.c =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 | =A0 =A02 +-
>> =A0arch/arm/mach-s5pv310/include/mach/irqs.h =A0 =A0 =A0 =A0 | =A0 =A0=
2 +
>> =A0arch/arm/mach-s5pv310/include/mach/map.h =A0 =A0 =A0 =A0 =A0| =A0=
 =A06 ++++
>> =A0arch/arm/plat-s5p/Kconfig =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 | =A0 =A05 +++
>> =A0arch/arm/plat-s5p/Makefile =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0| =A0 =A01 +
>> =A0arch/arm/{mach-s5pv210 =3D> plat-s5p}/dev-onenand.c | =A0 28
>> +++++++++++---------
>> =A0arch/arm/plat-samsung/include/plat/devs.h =A0 =A0 =A0 =A0 | =A0 =A0=
2 +-
>> =A011 files changed, 37 insertions(+), 24 deletions(-)
>> =A0rename arch/arm/{mach-s5pv210 =3D> plat-s5p}/dev-onenand.c (59%)
>>
>> diff --git a/arch/arm/mach-s5pv210/Kconfig b/arch/arm/mach-s5pv210/K=
config
>> index d3a3895..5315fec 100644
>> --- a/arch/arm/mach-s5pv210/Kconfig
>> +++ b/arch/arm/mach-s5pv210/Kconfig
>> @@ -53,11 +53,6 @@ config S5PV210_SETUP_SDHCI_GPIO
>> =A0 =A0 =A0 help
>> =A0 =A0 =A0 =A0 Common setup code for SDHCI gpio.
>>
>> -config S5PC110_DEV_ONENAND
>> - =A0 =A0 bool
>> - =A0 =A0 help
>> - =A0 =A0 =A0 Compile in platform device definition for OneNAND1 con=
troller
>> -
>> =A0menu "S5PC110 Machines"
>>
>> =A0config MACH_AQUILA
>> @@ -71,7 +66,7 @@ config MACH_AQUILA
>> =A0 =A0 =A0 select S3C_DEV_HSMMC
>> =A0 =A0 =A0 select S3C_DEV_HSMMC1
>> =A0 =A0 =A0 select S3C_DEV_HSMMC2
>> - =A0 =A0 select S5PC110_DEV_ONENAND
>> + =A0 =A0 select S5P_DEV_ONENAND
>> =A0 =A0 =A0 select S5PV210_SETUP_FB_24BPP
>> =A0 =A0 =A0 select S5PV210_SETUP_SDHCI
>> =A0 =A0 =A0 help
>> @@ -88,7 +83,7 @@ config MACH_GONI
>> =A0 =A0 =A0 select S3C_DEV_HSMMC
>> =A0 =A0 =A0 select S3C_DEV_HSMMC1
>> =A0 =A0 =A0 select S3C_DEV_HSMMC2
>> - =A0 =A0 select S5PC110_DEV_ONENAND
>> + =A0 =A0 select S5P_DEV_ONENAND
>> =A0 =A0 =A0 select S5PV210_SETUP_FB_24BPP
>> =A0 =A0 =A0 select S5PV210_SETUP_SDHCI
>> =A0 =A0 =A0 help
>> diff --git a/arch/arm/mach-s5pv210/Makefile
> b/arch/arm/mach-s5pv210/Makefile
>> index 05048c5..7045489 100644
>> --- a/arch/arm/mach-s5pv210/Makefile
>> +++ b/arch/arm/mach-s5pv210/Makefile
>> @@ -26,7 +26,6 @@ obj-$(CONFIG_MACH_GONI) =A0 =A0 =A0 =A0 =A0 =A0 +=3D=
 mach-goni.o
>>
>> =A0obj-y =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0+=3D dev-audio.o
>> =A0obj-$(CONFIG_S3C64XX_DEV_SPI) =A0 =A0 =A0 =A0+=3D dev-spi.o
>> -obj-$(CONFIG_S5PC110_DEV_ONENAND) +=3D dev-onenand.o
>>
>> =A0obj-$(CONFIG_S5PV210_SETUP_FB_24BPP) +=3D setup-fb-24bpp.o
>> =A0obj-$(CONFIG_S5PV210_SETUP_I2C1) =A0 =A0 +=3D setup-i2c1.o
>> diff --git a/arch/arm/mach-s5pv210/include/mach/map.h
>> b/arch/arm/mach-s5pv210/include/mach/map.h
>> index dd4fb6b..aa19d2f 100644
>> --- a/arch/arm/mach-s5pv210/include/mach/map.h
>> +++ b/arch/arm/mach-s5pv210/include/mach/map.h
>> @@ -17,7 +17,10 @@
>> =A0#include <plat/map-s5p.h>
>>
>> =A0#define S5PC110_PA_ONENAND =A0 (0xB0000000)
>> +#define S5P_PA_ONENAND =A0 =A0 =A0 =A0 =A0 =A0 =A0 S5PC110_PA_ONENA=
ND
>> +
>> =A0#define S5PC110_PA_ONENAND_DMA =A0 =A0 =A0 (0xB0600000)
>> +#define S5P_PA_ONENAND_DMA =A0 S5PC110_PA_ONENAND_DMA
>>
>> =A0#define S5PV210_PA_CHIPID =A0 =A0(0xE0000000)
>> =A0#define S5P_PA_CHIPID =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0S5PV210_PA_C=
HIPID
>> diff --git a/arch/arm/mach-s5pv210/mach-aquila.c
>> b/arch/arm/mach-s5pv210/mach-aquila.c
>> index 0dda801..bf772de 100644
>> --- a/arch/arm/mach-s5pv210/mach-aquila.c
>> +++ b/arch/arm/mach-s5pv210/mach-aquila.c
>> @@ -477,7 +477,7 @@ static struct platform_device *aquila_devices[]
>> __initdata =3D {
>> =A0 =A0 =A0 &aquila_i2c_gpio_pmic,
>> =A0 =A0 =A0 &aquila_device_gpiokeys,
>> =A0 =A0 =A0 &s3c_device_fb,
>> - =A0 =A0 &s5pc110_device_onenand,
>> + =A0 =A0 &s5p_device_onenand,
>> =A0 =A0 =A0 &s3c_device_hsmmc0,
>> =A0 =A0 =A0 &s3c_device_hsmmc1,
>> =A0 =A0 =A0 &s3c_device_hsmmc2,
>> diff --git a/arch/arm/mach-s5pv210/mach-goni.c
>> b/arch/arm/mach-s5pv210/mach-goni.c
>> index 53754d7..fdc5cca 100644
>> --- a/arch/arm/mach-s5pv210/mach-goni.c
>> +++ b/arch/arm/mach-s5pv210/mach-goni.c
>> @@ -456,7 +456,7 @@ static void goni_setup_sdhci(void)
>>
>> =A0static struct platform_device *goni_devices[] __initdata =3D {
>> =A0 =A0 =A0 &s3c_device_fb,
>> - =A0 =A0 &s5pc110_device_onenand,
>> + =A0 =A0 &s5p_device_onenand,
>> =A0 =A0 =A0 &goni_i2c_gpio_pmic,
>> =A0 =A0 =A0 &goni_device_gpiokeys,
>> =A0 =A0 =A0 &s5p_device_fimc0,
>> diff --git a/arch/arm/mach-s5pv310/include/mach/irqs.h
>> b/arch/arm/mach-s5pv310/include/mach/irqs.h
>> index 522352f..7b4b09f 100644
>> --- a/arch/arm/mach-s5pv310/include/mach/irqs.h
>> +++ b/arch/arm/mach-s5pv310/include/mach/irqs.h
>> @@ -73,6 +73,8 @@
>> =A0#define IRQ_HSMMC2 =A0 =A0 =A0 =A0 =A0 COMBINER_IRQ(29, 2)
>> =A0#define IRQ_HSMMC3 =A0 =A0 =A0 =A0 =A0 COMBINER_IRQ(29, 3)
>>
>> +#define IRQ_ONENAND_AUDI =A0 =A0 COMBINER_IRQ(34, 0)
>> +
>> =A0/* Set the default NR_IRQS */
>>
>> =A0#define NR_IRQS
>> =A0 =A0 =A0 COMBINER_IRQ(MAX_COMBINER_NR, 0)
>> diff --git a/arch/arm/mach-s5pv310/include/mach/map.h
>> b/arch/arm/mach-s5pv310/include/mach/map.h
>> index 6c7b1fc..5288f5a 100644
>> --- a/arch/arm/mach-s5pv310/include/mach/map.h
>> +++ b/arch/arm/mach-s5pv310/include/mach/map.h
>> @@ -23,6 +23,12 @@
>>
>> =A0#include <plat/map-s5p.h>
>>
>> +#define S5PC210_PA_ONENAND =A0 =A0 =A0 =A0 =A0 (0x0C000000)
>> +#define S5P_PA_ONENAND =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
S5PC210_PA_ONENAND
>> +
>> +#define S5PC210_PA_ONENAND_DMA =A0 =A0 =A0 =A0 =A0 =A0 =A0 (0x0C600=
000)
>> +#define S5P_PA_ONENAND_DMA
>> =A0 =A0 =A0 S5PC210_PA_ONENAND_DMA
>> +
>> =A0#define S5PV310_PA_CHIPID =A0 =A0 =A0 =A0 =A0 =A0(0x10000000)
>> =A0#define S5P_PA_CHIPID =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0S5PV310_PA_CHIPID
>>
>> diff --git a/arch/arm/plat-s5p/Kconfig b/arch/arm/plat-s5p/Kconfig
>> index c6a855d..407e323 100644
>> --- a/arch/arm/plat-s5p/Kconfig
>> +++ b/arch/arm/plat-s5p/Kconfig
>> @@ -46,3 +46,8 @@ config S5P_DEV_FIMC2
>> =A0 =A0 =A0 bool
>> =A0 =A0 =A0 help
>> =A0 =A0 =A0 =A0 Compile in platform device definitions for FIMC cont=
roller 2
>> +
>> +config S5P_DEV_ONENAND
>> + =A0 =A0 bool
>> + =A0 =A0 help
>> + =A0 =A0 =A0 Compile in platform device definition for OneNAND cont=
roller
>> diff --git a/arch/arm/plat-s5p/Makefile b/arch/arm/plat-s5p/Makefile
>> index b2e0296..f3e917e 100644
>> --- a/arch/arm/plat-s5p/Makefile
>> +++ b/arch/arm/plat-s5p/Makefile
>> @@ -24,3 +24,4 @@ obj-$(CONFIG_S5P_EXT_INT) =A0 +=3D irq-eint.o
>> =A0obj-$(CONFIG_S5P_DEV_FIMC0) =A0+=3D dev-fimc0.o
>> =A0obj-$(CONFIG_S5P_DEV_FIMC1) =A0+=3D dev-fimc1.o
>> =A0obj-$(CONFIG_S5P_DEV_FIMC2) =A0+=3D dev-fimc2.o
>> +obj-$(CONFIG_S5P_DEV_ONENAND) =A0 =A0 =A0 =A0+=3D dev-onenand.o
>> diff --git a/arch/arm/mach-s5pv210/dev-onenand.c
>> b/arch/arm/plat-s5p/dev-onenand.c
>> similarity index 59%
>> rename from arch/arm/mach-s5pv210/dev-onenand.c
>> rename to arch/arm/plat-s5p/dev-onenand.c
>> index f8ede33..6db9262 100644
>> --- a/arch/arm/mach-s5pv210/dev-onenand.c
>> +++ b/arch/arm/plat-s5p/dev-onenand.c
>> @@ -1,10 +1,12 @@
>> -/*
>> - * linux/arch/arm/mach-s5pv210/dev-onenand.c
>> +/* linux/arch/arm/plat-s5p/dev-onenand.c
>> + *
>> + * Copyright 2010 Samsung Electronics Co., Ltd.
>> + * =A0 =A0 =A0 =A0 =A0 http://www.samsung.com
>> =A0 *
>> =A0 * =A0Copyright (c) 2008-2010 Samsung Electronics
>> =A0 * =A0Kyungmin Park <kyungmin.park@samsung.com>
>> =A0 *
>> - * S5PC110 series device definition for OneNAND devices
>> + * S5P series device definition for OneNAND devices
>> =A0 *
>> =A0 * This program is free software; you can redistribute it and/or =
modify
>> =A0 * it under the terms of the GNU General Public License version 2=
 as
>> @@ -19,15 +21,15 @@
>> =A0#include <mach/irqs.h>
>> =A0#include <mach/map.h>
>>
>> -static struct resource s5pc110_onenand_resources[] =3D {
>> +static struct resource s5p_onenand_resources[] =3D {
>> =A0 =A0 =A0 [0] =3D {
>> - =A0 =A0 =A0 =A0 =A0 =A0 .start =A0=3D S5PC110_PA_ONENAND,
>> - =A0 =A0 =A0 =A0 =A0 =A0 .end =A0 =A0=3D S5PC110_PA_ONENAND + SZ_12=
8K - 1,
>> + =A0 =A0 =A0 =A0 =A0 =A0 .start =A0=3D S5P_PA_ONENAND,
>> + =A0 =A0 =A0 =A0 =A0 =A0 .end =A0 =A0=3D S5P_PA_ONENAND + SZ_128K -=
 1,
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 .flags =A0=3D IORESOURCE_MEM,
>> =A0 =A0 =A0 },
>> =A0 =A0 =A0 [1] =3D {
>> - =A0 =A0 =A0 =A0 =A0 =A0 .start =A0=3D S5PC110_PA_ONENAND_DMA,
>> - =A0 =A0 =A0 =A0 =A0 =A0 .end =A0 =A0=3D S5PC110_PA_ONENAND_DMA + S=
Z_8K - 1,
>> + =A0 =A0 =A0 =A0 =A0 =A0 .start =A0=3D S5P_PA_ONENAND_DMA,
>> + =A0 =A0 =A0 =A0 =A0 =A0 .end =A0 =A0=3D S5P_PA_ONENAND_DMA + SZ_8K=
 - 1,
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 .flags =A0=3D IORESOURCE_MEM,
>> =A0 =A0 =A0 },
>> =A0 =A0 =A0 [2] =3D {
>> @@ -37,19 +39,19 @@ static struct resource s5pc110_onenand_resources=
[] =3D {
>> =A0 =A0 =A0 },
>> =A0};
>>
>> -struct platform_device s5pc110_device_onenand =3D {
>> +struct platform_device s5p_device_onenand =3D {
>> =A0 =A0 =A0 .name =A0 =A0 =A0 =A0 =A0 =3D "s5pc110-onenand",
>> =A0 =A0 =A0 .id =A0 =A0 =A0 =A0 =A0 =A0 =3D -1,
>> - =A0 =A0 .num_resources =A0=3D ARRAY_SIZE(s5pc110_onenand_resources=
),
>> - =A0 =A0 .resource =A0 =A0 =A0 =3D s5pc110_onenand_resources,
>> + =A0 =A0 .num_resources =A0=3D ARRAY_SIZE(s5p_onenand_resources),
>> + =A0 =A0 .resource =A0 =A0 =A0 =3D s5p_onenand_resources,
>> =A0};
>>
>> -void s5pc110_onenand_set_platdata(struct onenand_platform_data *pda=
ta)
>> +void s5p_onenand_set_platdata(struct onenand_platform_data *pdata)
>> =A0{
>> =A0 =A0 =A0 struct onenand_platform_data *pd;
>>
>> =A0 =A0 =A0 pd =3D kmemdup(pdata, sizeof(struct onenand_platform_dat=
a),
>> GFP_KERNEL);
>> =A0 =A0 =A0 if (!pd)
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 printk(KERN_ERR "%s: no memory for platf=
orm data\n",
>> __func__);
>> - =A0 =A0 s5pc110_device_onenand.dev.platform_data =3D pd;
>> + =A0 =A0 s5p_device_onenand.dev.platform_data =3D pd;
>> =A0}
>> diff --git a/arch/arm/plat-samsung/include/plat/devs.h
>> b/arch/arm/plat-samsung/include/plat/devs.h
>> index 85f6f23..cb12102 100644
>> --- a/arch/arm/plat-samsung/include/plat/devs.h
>> +++ b/arch/arm/plat-samsung/include/plat/devs.h
>> @@ -73,7 +73,7 @@ extern struct platform_device s3c_device_hwmon;
>> =A0extern struct platform_device s3c_device_nand;
>> =A0extern struct platform_device s3c_device_onenand;
>> =A0extern struct platform_device s3c64xx_device_onenand1;
>> -extern struct platform_device s5pc110_device_onenand;
>> +extern struct platform_device s5p_device_onenand;
>>
>> =A0extern struct platform_device s3c_device_usbgadget;
>> =A0extern struct platform_device s3c_device_usb_hsotg;
>> --
>> 1.6.2.5
>
>
> Thanks.
>
> Best regards,
> Kgene.
> --
> Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
> SW Solution Development Team, Samsung Electronics Co., Ltd.
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsu=
ng-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
>
