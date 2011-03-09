From: Kyungmin Park <kyungmin.park@samsung.com>
Subject: Re: [PATCH 2/6] universal: i2c: add I2C controller 8 (HDMIPHY)
Date: Wed, 9 Mar 2011 21:10:57 +0900
Message-ID: <AANLkTikAPkVJ_xM7dKNiNxE1=0=81s=OLv-v8XC=3NUh@mail.gmail.com>
References: <1299253314-10065-1-git-send-email-t.stanislaws@samsung.com>
	<1299253314-10065-3-git-send-email-t.stanislaws@samsung.com>
	<000a01cbde51$a3c05800$eb410800$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-media-owner@vger.kernel.org>
In-Reply-To: <000a01cbde51$a3c05800$eb410800$%kim@samsung.com>
Sender: linux-media-owner@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: Tomasz Stanislawski <t.stanislaws@samsung.com>, linux-media@vger.kernel.org, linux-samsung-soc@vger.kernel.org, m.szyprowski@samsung.com
List-Id: linux-samsung-soc@vger.kernel.org

On Wed, Mar 9, 2011 at 9:00 PM, Kukjin Kim <kgene.kim@samsung.com> wrot=
e:
> Tomasz Stanislawski wrote:
>>
>> Signed-off-by: Tomasz Stanislawski <t.stanislaws@samsung.com>
>> Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
>> ---
>> =A0arch/arm/mach-s5pv310/clock.c =A0 =A0 =A0 =A0 =A0 =A0 | =A0 =A06 =
+++
>> =A0arch/arm/mach-s5pv310/include/mach/irqs.h | =A0 =A04 ++
>> =A0arch/arm/mach-s5pv310/include/mach/map.h =A0| =A0 =A01 +
>> =A0arch/arm/plat-samsung/Kconfig =A0 =A0 =A0 =A0 =A0 =A0 | =A0 =A05 =
++
>> =A0arch/arm/plat-samsung/Makefile =A0 =A0 =A0 =A0 =A0 =A0| =A0 =A01 =
+
>> =A0arch/arm/plat-samsung/dev-i2c8.c =A0 =A0 =A0 =A0 =A0| =A0 68
>> +++++++++++++++++++++++++++++
>> =A0arch/arm/plat-samsung/include/plat/devs.h | =A0 =A01 +
>> =A0arch/arm/plat-samsung/include/plat/iic.h =A0| =A0 =A01 +
>> =A08 files changed, 87 insertions(+), 0 deletions(-)
>> =A0create mode 100644 arch/arm/plat-samsung/dev-i2c8.c
>>
>> diff --git a/arch/arm/mach-s5pv310/clock.c b/arch/arm/mach-s5pv310/c=
lock.c
>> index d28fa6f..465beb9 100644
>> --- a/arch/arm/mach-s5pv310/clock.c
>> +++ b/arch/arm/mach-s5pv310/clock.c
>> @@ -685,6 +685,12 @@ static struct clk init_clocks_off[] =3D {
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 .parent =A0 =A0 =A0 =A0 =3D &clk_aclk_10=
0.clk,
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 .enable =A0 =A0 =A0 =A0 =3D s5pv310_clk_=
ip_peril_ctrl,
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 .ctrlbit =A0 =A0 =A0 =A0=3D (1 << 13),
>> + =A0 =A0 }, {
>> + =A0 =A0 =A0 =A0 =A0 =A0 .name =A0 =A0 =A0 =A0 =A0 =3D "i2c",
>> + =A0 =A0 =A0 =A0 =A0 =A0 .id =A0 =A0 =A0 =A0 =A0 =A0 =3D 8,
>> + =A0 =A0 =A0 =A0 =A0 =A0 .parent =A0 =A0 =A0 =A0 =3D &clk_aclk_100.=
clk,
>> + =A0 =A0 =A0 =A0 =A0 =A0 .enable =A0 =A0 =A0 =A0 =3D s5pv310_clk_ip=
_peril_ctrl,
>> + =A0 =A0 =A0 =A0 =A0 =A0 .ctrlbit =A0 =A0 =A0 =A0=3D (1 << 14),
>> =A0 =A0 =A0 },
>> =A0};
>>
>> diff --git a/arch/arm/mach-s5pv310/include/mach/irqs.h b/arch/arm/ma=
ch-
>> s5pv310/include/mach/irqs.h
>> index f6b99c6..f7ddc98 100644
>> --- a/arch/arm/mach-s5pv310/include/mach/irqs.h
>> +++ b/arch/arm/mach-s5pv310/include/mach/irqs.h
>> @@ -77,6 +77,9 @@
>> =A0#define IRQ_PDMA0 =A0 =A0 =A0 =A0 =A0 =A0COMBINER_IRQ(21, 0)
>> =A0#define IRQ_PDMA1 =A0 =A0 =A0 =A0 =A0 =A0COMBINER_IRQ(21, 1)
>>
>> +#define IRQ_HDMI =A0 =A0 =A0 =A0 =A0 =A0 COMBINER_IRQ(16, 0)
>> +#define IRQ_HDMI_I2C =A0 =A0 =A0 =A0 COMBINER_IRQ(16, 1)
>> +
>> =A0#define IRQ_TIMER0_VIC =A0 =A0 =A0 =A0 =A0 =A0 =A0 COMBINER_IRQ(2=
2, 0)
>> =A0#define IRQ_TIMER1_VIC =A0 =A0 =A0 =A0 =A0 =A0 =A0 COMBINER_IRQ(2=
2, 1)
>> =A0#define IRQ_TIMER2_VIC =A0 =A0 =A0 =A0 =A0 =A0 =A0 COMBINER_IRQ(2=
2, 2)
>> @@ -100,6 +103,7 @@
>> =A0#define IRQ_IIC5 =A0 =A0 =A0 =A0 =A0 =A0 COMBINER_IRQ(27, 5)
>> =A0#define IRQ_IIC6 =A0 =A0 =A0 =A0 =A0 =A0 COMBINER_IRQ(27, 6)
>> =A0#define IRQ_IIC7 =A0 =A0 =A0 =A0 =A0 =A0 COMBINER_IRQ(27, 7)
>> +#define IRQ_IIC8 =A0 =A0 =A0 =A0 =A0 =A0 IRQ_HDMI_I2C
>>
>> =A0#define IRQ_HSMMC0 =A0 =A0 =A0 =A0 =A0 COMBINER_IRQ(29, 0)
>> =A0#define IRQ_HSMMC1 =A0 =A0 =A0 =A0 =A0 COMBINER_IRQ(29, 1)
>> diff --git a/arch/arm/mach-s5pv310/include/mach/map.h b/arch/arm/mac=
h-
>> s5pv310/include/mach/map.h
>> index 576ba55..0aa0171 100644
>> --- a/arch/arm/mach-s5pv310/include/mach/map.h
>> +++ b/arch/arm/mach-s5pv310/include/mach/map.h
>> @@ -120,6 +120,7 @@
>> =A0#define S3C_PA_IIC5 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0S5PV310_PA=
_IIC(5)
>> =A0#define S3C_PA_IIC6 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0S5PV310_PA=
_IIC(6)
>> =A0#define S3C_PA_IIC7 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0S5PV310_PA=
_IIC(7)
>> +#define S3C_PA_IIC8 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0S5PV310_PA_I=
IC(8)
>> =A0#define S3C_PA_RTC =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 S5PV310_PA=
_RTC
>> =A0#define S3C_PA_WDT =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 S5PV310_PA=
_WATCHDOG
>>
>> diff --git a/arch/arm/plat-samsung/Kconfig b/arch/arm/plat-samsung/K=
config
>> index 32be05c..dd1fd15 100644
>> --- a/arch/arm/plat-samsung/Kconfig
>> +++ b/arch/arm/plat-samsung/Kconfig
>> @@ -211,6 +211,11 @@ config S3C_DEV_I2C7
>> =A0 =A0 =A0 help
>> =A0 =A0 =A0 =A0 Compile in platform device definition for I2C contro=
ller 7
>>
>> +config S3C_DEV_I2C8
>> + =A0 =A0 bool
>> + =A0 =A0 help
>> + =A0 =A0 =A0 Compile in platform device definitions for I2C channel=
 8 (HDMIPHY)
>> +
>> =A0config S3C_DEV_FB
>> =A0 =A0 =A0 bool
>> =A0 =A0 =A0 help
>> diff --git a/arch/arm/plat-samsung/Makefile
> b/arch/arm/plat-samsung/Makefile
>> index 7e92457..826ae4f 100644
>> --- a/arch/arm/plat-samsung/Makefile
>> +++ b/arch/arm/plat-samsung/Makefile
>> @@ -46,6 +46,7 @@ obj-$(CONFIG_S3C_DEV_I2C4) =A0+=3D dev-i2c4.o
>> =A0obj-$(CONFIG_S3C_DEV_I2C5) =A0 +=3D dev-i2c5.o
>> =A0obj-$(CONFIG_S3C_DEV_I2C6) =A0 +=3D dev-i2c6.o
>> =A0obj-$(CONFIG_S3C_DEV_I2C7) =A0 +=3D dev-i2c7.o
>> +obj-$(CONFIG_S3C_DEV_I2C8) =A0 +=3D dev-i2c8.o
>> =A0obj-$(CONFIG_S3C_DEV_FB) =A0 =A0 +=3D dev-fb.o
>> =A0obj-y =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0+=3D dev-uart.o
>> =A0obj-$(CONFIG_S3C_DEV_USB_HOST) =A0 =A0 =A0 +=3D dev-usb.o
>> diff --git a/arch/arm/plat-samsung/dev-i2c8.c b/arch/arm/plat-samsun=
g/dev-
>> i2c8.c
>> new file mode 100644
>> index 0000000..8edba7f
>> --- /dev/null
>> +++ b/arch/arm/plat-samsung/dev-i2c8.c
>> @@ -0,0 +1,68 @@
>> +/* linux/arch/arm/plat-samsung/dev-i2c7.c
>> + *
>> + * Copyright (c) 2010 Samsung Electronics Co., Ltd.
>> + * =A0 =A0 =A0 =A0 =A0 http://www.samsung.com/
>> + *
>> + * S3C series device definition for i2c device 8
>> + *
>> + * Based on plat-samsung/dev-i2c8.c
>> + *
>> + * This program is free software; you can redistribute it and/or mo=
dify
>> + * it under the terms of the GNU General Public License version 2 a=
s
>> + * published by the Free Software Foundation.
>> +*/
>> +
>> +#include <linux/gfp.h>
>> +#include <linux/kernel.h>
>> +#include <linux/string.h>
>> +#include <linux/platform_device.h>
>> +
>> +#include <mach/irqs.h>
>> +#include <mach/map.h>
>> +
>> +#include <plat/regs-iic.h>
>> +#include <plat/iic.h>
>> +#include <plat/devs.h>
>> +#include <plat/cpu.h>
>> +
>> +static struct resource s3c_i2c_resource[] =3D {
>> + =A0 =A0 [0] =3D {
>> + =A0 =A0 =A0 =A0 =A0 =A0 .start =3D S3C_PA_IIC8,
>> + =A0 =A0 =A0 =A0 =A0 =A0 .end =A0 =3D S3C_PA_IIC8 + SZ_4K - 1,
>> + =A0 =A0 =A0 =A0 =A0 =A0 .flags =3D IORESOURCE_MEM,
>> + =A0 =A0 },
>> + =A0 =A0 [1] =3D {
>> + =A0 =A0 =A0 =A0 =A0 =A0 .start =3D IRQ_IIC8,
>> + =A0 =A0 =A0 =A0 =A0 =A0 .end =A0 =3D IRQ_IIC8,
>> + =A0 =A0 =A0 =A0 =A0 =A0 .flags =3D IORESOURCE_IRQ,
>> + =A0 =A0 },
>> +};
>> +
>> +struct platform_device s3c_device_i2c8 =3D {
>> + =A0 =A0 .name =A0 =A0 =A0 =A0 =A0 =A0 =3D "s3c2440-hdmiphy-i2c",
>> + =A0 =A0 .id =A0 =A0 =A0 =A0 =A0 =A0 =A0 =3D 8,
>> + =A0 =A0 .num_resources =A0 =A0=3D ARRAY_SIZE(s3c_i2c_resource),
>> + =A0 =A0 .resource =A0 =A0 =A0 =A0 =3D s3c_i2c_resource,
>> +};
>> +
>> +static struct s3c2410_platform_i2c default_i2c_data8 __initdata =3D=
 {
>> + =A0 =A0 .flags =A0 =A0 =A0 =A0 =A0=3D 0,
>> + =A0 =A0 .bus_num =A0 =A0 =A0 =A0=3D 8,
>> + =A0 =A0 .slave_addr =A0 =A0 =3D 0x10,
>> + =A0 =A0 .frequency =A0 =A0 =A0=3D 400*1000,
>> + =A0 =A0 .sda_delay =A0 =A0 =A0=3D 100,
>> +};
>> +
>> +void __init s3c_i2c8_set_platdata(struct s3c2410_platform_i2c *pd)
>> +{
>> + =A0 =A0 struct s3c2410_platform_i2c *npd;
>> +
>> + =A0 =A0 if (!pd)
>> + =A0 =A0 =A0 =A0 =A0 =A0 pd =3D &default_i2c_data8;
>> +
>> + =A0 =A0 npd =3D kmemdup(pd, sizeof(struct s3c2410_platform_i2c), G=
=46P_KERNEL);
>> + =A0 =A0 if (!npd)
>> + =A0 =A0 =A0 =A0 =A0 =A0 printk(KERN_ERR "%s: no memory for platfor=
m data\n",
> __func__);
>> +
>> + =A0 =A0 s3c_device_i2c8.dev.platform_data =3D npd;
>> +}
>> diff --git a/arch/arm/plat-samsung/include/plat/devs.h b/arch/arm/pl=
at-
>> samsung/include/plat/devs.h
>> index 6a869b8..f14709c 100644
>> --- a/arch/arm/plat-samsung/include/plat/devs.h
>> +++ b/arch/arm/plat-samsung/include/plat/devs.h
>> @@ -53,6 +53,7 @@ extern struct platform_device s3c_device_i2c4;
>> =A0extern struct platform_device s3c_device_i2c5;
>> =A0extern struct platform_device s3c_device_i2c6;
>> =A0extern struct platform_device s3c_device_i2c7;
>> +extern struct platform_device s3c_device_i2c8;
>> =A0extern struct platform_device s3c_device_rtc;
>> =A0extern struct platform_device s3c_device_adc;
>> =A0extern struct platform_device s3c_device_sdi;
>> diff --git a/arch/arm/plat-samsung/include/plat/iic.h b/arch/arm/pla=
t-
>> samsung/include/plat/iic.h
>> index 1543da8..dd0d728 100644
>> --- a/arch/arm/plat-samsung/include/plat/iic.h
>> +++ b/arch/arm/plat-samsung/include/plat/iic.h
>> @@ -60,6 +60,7 @@ extern void s3c_i2c4_set_platdata(struct
>> s3c2410_platform_i2c *i2c);
>> =A0extern void s3c_i2c5_set_platdata(struct s3c2410_platform_i2c *i2=
c);
>> =A0extern void s3c_i2c6_set_platdata(struct s3c2410_platform_i2c *i2=
c);
>> =A0extern void s3c_i2c7_set_platdata(struct s3c2410_platform_i2c *i2=
c);
>> +extern void s3c_i2c8_set_platdata(struct s3c2410_platform_i2c *i2c)=
;
>>
>> =A0/* defined by architecture to configure gpio */
>> =A0extern void s3c_i2c0_cfg_gpio(struct platform_device *dev);
>> --
>> 1.7.1.569.g6f426
>
> Basically, EXYNOS4 can't support I2C channel 8 for general purpose.
> Yeah, it is dedicated to HDMI..it means we can't use i2c8 stuff...
>
> (As a note, I2C interface for HDMI PHY is internally connected.)

Please give the specific and proper comments/review instead of general =
comment.
so what's the proper name? i2c-hdmi? or others?

Yes, it will be not a proper name, i2c8. Some time later new chip
supports more than 7 I2Cs. then it will be conflict with i2c8.
But we can't predict the when this chip comes.

Kyungmin Park
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
