From: Kyungmin Park <kyungmin.park@samsung.com>
Subject: Re: [PATCH v4 3/8] ARM: Samsung: Add platform definitions and helpers
	for FIMC driver
Date: Tue, 3 Aug 2010 09:54:19 +0900
Message-ID: <AANLkTinuDaOKe1cMTCC+kmZg0dg2y75szDPQaa93gWbn@mail.gmail.com>
References: <1279902083-21250-4-git-send-email-s.nawrocki@samsung.com>
	<1280750229-15732-1-git-send-email-m.szyprowski@samsung.com>
	<00e101cb329e$a50ceb60$ef26c220$%kim@samsung.com>
	<AANLkTimJcQccG-H_661bPSz-sQ+L=GYNLd2A3W02wUUP@mail.gmail.com>
	<00e501cb32a5$5775ed50$0661c7f0$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ww0-f44.google.com ([74.125.82.44]:56631 "EHLO
	mail-ww0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753787Ab0HCAyV convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 2 Aug 2010 20:54:21 -0400
Received: by wwj40 with SMTP id 40so4562944wwj.1
        for <linux-samsung-soc@vger.kernel.org>; Mon, 02 Aug 2010 17:54:20 -0700 (PDT)
In-Reply-To: <00e501cb32a5$5775ed50$0661c7f0$%kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, s.nawrocki@samsung.com, p.osciak@samsung.com, ben-linux@fluff.org

On Tue, Aug 3, 2010 at 9:46 AM, Kukjin Kim <kgene.kim@samsung.com> wrot=
e:
> Kyungmin Park wrote:
>>
>> On Tue, Aug 3, 2010 at 8:58 AM, Kukjin Kim <kgene.kim@samsung.com> w=
rote:
>> > Marek Szyprowski wrote:
>> >>
>> >> From: Sylwester Nawrocki <s.nawrocki@samsung.com>
>> >>
>> >> FIMC (CAMIF) device is a camera interface embedded in S3C/S5P Sam=
sung
>> >> SOC series. It supports ITU-R BT.601/656 and MIPI-CSI2 standards,
>> >> memory to memory operations, color conversion, resizing and rotat=
ion.
>> >>
>> >> Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
>> >> Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
>> >> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
>> >> ---
>> >>
>> >> This is patch is a v3 version rebased onto latest kgene/for-next =
tree.
>> >> New entries in map.h files has been sorted by the physicall addre=
ss.
>> >>
>> > Thanks for your addressing.
>> >
>> >> I'm resending this patch on behalf of Sylwester who is on holiday=
s this
>> >> week.
>> >>
>> >> Best regards
>> >> --
>> >> Marek Szyprowski
>> >> Samsung Poland R&D Center
>> >> ---
>> >> =A0arch/arm/mach-s5pc100/include/mach/map.h =A0 =A0 =A0 | =A0 =A0=
7 ++++
>> >> =A0arch/arm/mach-s5pv210/cpu.c =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0| =A0 =A05 +++
>> >> =A0arch/arm/mach-s5pv210/include/mach/map.h =A0 =A0 =A0 | =A0 =A0=
8 ++++
>> >> =A0arch/arm/plat-s5p/Kconfig =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0| =A0 16 ++++++++
>> >> =A0arch/arm/plat-s5p/Makefile =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 | =A0 =A03 ++
>> >> =A0arch/arm/plat-s5p/dev-fimc0.c =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0| =A0 35
>> >> ++++++++++++++++++
>> >> =A0arch/arm/plat-s5p/dev-fimc1.c =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0| =A0 35
>> >> ++++++++++++++++++
>> >> =A0arch/arm/plat-s5p/dev-fimc2.c =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0| =A0 35
>> >> ++++++++++++++++++
>> >> =A0arch/arm/plat-samsung/include/plat/fimc-core.h | =A0 45
>> >> ++++++++++++++++++++++++
>> >> =A0arch/arm/plat-samsung/include/plat/fimc.h =A0 =A0 =A0| =A0 22 =
+++++++++++
>> >> =A010 files changed, 211 insertions(+), 0 deletions(-)
>> >> =A0create mode 100644 arch/arm/plat-s5p/dev-fimc0.c
>> >> =A0create mode 100644 arch/arm/plat-s5p/dev-fimc1.c
>> >> =A0create mode 100644 arch/arm/plat-s5p/dev-fimc2.c
>> >> =A0create mode 100644 arch/arm/plat-samsung/include/plat/fimc-cor=
e.h
>> >> =A0create mode 100644 arch/arm/plat-samsung/include/plat/fimc.h
>> >>
>> >> diff --git a/arch/arm/mach-s5pc100/include/mach/map.h b/arch/arm/=
mach-
>> >> s5pc100/include/mach/map.h
>> >> index c018697..3abe7f5 100644
>> >> --- a/arch/arm/mach-s5pc100/include/mach/map.h
>> >> +++ b/arch/arm/mach-s5pc100/include/mach/map.h
>> >> @@ -99,6 +99,10 @@
>> >>
>> >> =A0#define S5PC100_PA_FB =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0(0xEE0000=
00)
>> >>
>> >> +#define S5PC100_PA_FIMC0 =A0 =A0 (0xEE200000)
>> >> +#define S5PC100_PA_FIMC1 =A0 =A0 (0xEE300000)
>> >> +#define S5PC100_PA_FIMC2 =A0 =A0 (0xEE400000)
>> >> +
>> >> =A0#define S5PC100_PA_I2S0 =A0 =A0 =A0 =A0 =A0 =A0 =A0(0xF2000000=
)
>> >> =A0#define S5PC100_PA_I2S1 =A0 =A0 =A0 =A0 =A0 =A0 =A0(0xF2100000=
)
>> >> =A0#define S5PC100_PA_I2S2 =A0 =A0 =A0 =A0 =A0 =A0 =A0(0xF2200000=
)
>> >> @@ -143,6 +147,9 @@
>> >> =A0#define S3C_PA_ONENAND_BUF =A0 S5PC100_PA_ONENAND_BUF
>> >> =A0#define S3C_SZ_ONENAND_BUF =A0 S5PC100_SZ_ONENAND_BUF
>> >> =A0#define S3C_PA_RTC =A0 =A0 =A0 =A0 =A0 S5PC100_PA_RTC
>> >> +#define S5P_PA_FIMC0 =A0 =A0 =A0 =A0 S5PC100_PA_FIMC0
>> >> +#define S5P_PA_FIMC1 =A0 =A0 =A0 =A0 S5PC100_PA_FIMC1
>> >> +#define S5P_PA_FIMC2 =A0 =A0 =A0 =A0 S5PC100_PA_FIMC2
>> >>
>> >> =A0#define SAMSUNG_PA_ADC =A0 =A0 =A0 =A0 =A0 =A0 =A0 S5PC100_PA_=
TSADC
>> >> =A0#define SAMSUNG_PA_CFCON =A0 =A0 S5PC100_PA_CFCON
>> >> diff --git a/arch/arm/mach-s5pv210/cpu.c b/arch/arm/mach-s5pv210/=
cpu.c
>> >> index ea09c32..a7446d4 100644
>> >> --- a/arch/arm/mach-s5pv210/cpu.c
>> >> +++ b/arch/arm/mach-s5pv210/cpu.c
>> >> @@ -37,6 +37,7 @@
>> >> =A0#include <plat/iic-core.h>
>> >> =A0#include <plat/keypad-core.h>
>> >> =A0#include <plat/sdhci.h>
>> >> +#include <plat/fimc-core.h>
>> >> =A0#include <plat/reset.h>
>> >>
>> >> =A0/* Initial IO mappings */
>> >> @@ -104,6 +105,10 @@ void __init s5pv210_map_io(void)
>> >>
>> >> =A0 =A0 =A0 /* Use s5pv210-keypad instead of samsung-keypad */
>> >> =A0 =A0 =A0 samsung_keypad_setname("s5pv210-keypad");
>> >> +
>> >> + =A0 =A0 s3c_fimc_setname(0, "s5pv210-fimc");
>> >> + =A0 =A0 s3c_fimc_setname(1, "s5pv210-fimc");
>> >> + =A0 =A0 s3c_fimc_setname(2, "s5pv210-fimc");
>> >> =A0}
>> >>
>> >> =A0void __init s5pv210_init_clocks(int xtal)
>> >> diff --git a/arch/arm/mach-s5pv210/include/mach/map.h b/arch/arm/=
mach-
>> >> s5pv210/include/mach/map.h
>> >> index 986b285..6a07e55 100644
>> >> --- a/arch/arm/mach-s5pv210/include/mach/map.h
>> >> +++ b/arch/arm/mach-s5pv210/include/mach/map.h
>> >> @@ -65,6 +65,10 @@
>> >>
>> >> =A0#define S5PV210_PA_FB =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0(0xF80000=
00)
>> >>
>> >> +#define S5PV210_PA_FIMC0 =A0 =A0 (0xFB200000)
>> >> +#define S5PV210_PA_FIMC1 =A0 =A0 (0xFB300000)
>> >> +#define S5PV210_PA_FIMC2 =A0 =A0 (0xFB400000)
>> >> +
>> >> =A0#define S5PV210_PA_HSMMC(x) =A0(0xEB000000 + ((x) * 0x100000))
>> >>
>> >> =A0#define S5PV210_PA_VIC0 =A0 =A0 =A0 =A0 =A0 =A0 =A0(0xF2000000=
)
>> >> @@ -114,4 +118,8 @@
>> >> =A0#define SAMSUNG_PA_CFCON =A0 =A0 S5PV210_PA_CFCON
>> >> =A0#define SAMSUNG_PA_KEYPAD =A0 =A0S5PV210_PA_KEYPAD
>> >>
>> >> +#define S5P_PA_FIMC0 =A0 =A0 =A0 =A0 S5PV210_PA_FIMC0
>> >> +#define S5P_PA_FIMC1 =A0 =A0 =A0 =A0 S5PV210_PA_FIMC1
>> >> +#define S5P_PA_FIMC2 =A0 =A0 =A0 =A0 S5PV210_PA_FIMC2
>> >
>> > To use one style is better for reading, merge conflict handling an=
d so
> on...
>> > The style means to add S5P_PA_XXX after S3C_PA_XXX with C100 case =
or to
>> > modify above C100 case like this.
>>
>> Use the same conversion as previous one. are you okay?
>>
>> #define S5PV210_PA_VIC0 =A0 =A0 =A0 =A0 (0xF2000000)
>> #define S5P_PA_VIC0 =A0 =A0 =A0 =A0 =A0 =A0 S5PV210_PA_VIC0
>>
>> #define S5PV210_PA_VIC1 =A0 =A0 =A0 =A0 (0xF2100000)
>> #define S5P_PA_VIC1 =A0 =A0 =A0 =A0 =A0 =A0 S5PV210_PA_VIC1
>>
>> #define S5PV210_PA_VIC2 =A0 =A0 =A0 =A0 (0xF2200000)
>> #define S5P_PA_VIC2 =A0 =A0 =A0 =A0 =A0 =A0 S5PV210_PA_VIC2
>>
>> #define S5PV210_PA_VIC3 =A0 =A0 =A0 =A0 (0xF2300000)
>> #define S5P_PA_VIC3 =A0 =A0 =A0 =A0 =A0 =A0 S5PV210_PA_VIC3
>>
>> #define S5PV210_PA_SDRAM =A0 =A0 =A0 =A0(0x30000000)
>> #define S5P_PA_SDRAM =A0 =A0 =A0 =A0 =A0 =A0S5PV210_PA_SDRAM
>>
> No.
>
> Did you see above C100?
>
> --- C100
>
> =A0#define S3C_PA_ONENAND_BUF =A0 =A0 =A0 =A0 =A0 =A0 S5PC100_PA_ONEN=
AND_BUF
> =A0#define S3C_SZ_ONENAND_BUF =A0 =A0 =A0 =A0 =A0 =A0 S5PC100_SZ_ONEN=
AND_BUF
> =A0#define S3C_PA_RTC =A0 =A0 =A0 =A0 =A0 =A0 S5PC100_PA_RTC
> +#define S5P_PA_FIMC0 =A0 =A0 =A0 =A0 =A0 S5PC100_PA_FIMC0
> +#define S5P_PA_FIMC1 =A0 =A0 =A0 =A0 =A0 S5PC100_PA_FIMC1
> +#define S5P_PA_FIMC2 =A0 =A0 =A0 =A0 =A0 S5PC100_PA_FIMC2
>
> =A0#define SAMSUNG_PA_ADC =A0 =A0 =A0 =A0 =A0 =A0 =A0 S5PC100_PA_TSAD=
C
> =A0#define SAMSUNG_PA_CFCON =A0 =A0 S5PC100_PA_CFCON
>
> --- V210
>
> =A0#define SAMSUNG_PA_CFCON =A0 =A0 =A0 =A0 =A0 =A0 =A0 S5PV210_PA_CF=
CON
> =A0#define SAMSUNG_PA_KEYPAD =A0 =A0 =A0 =A0 =A0 =A0 =A0S5PV210_PA_KE=
YPAD
>
> +#define S5P_PA_FIMC0 =A0 =A0 =A0 =A0 =A0 S5PV210_PA_FIMC0
> +#define S5P_PA_FIMC1 =A0 =A0 =A0 =A0 =A0 S5PV210_PA_FIMC1
> +#define S5P_PA_FIMC2 =A0 =A0 =A0 =A0 =A0 S5PV210_PA_FIMC2
>
> I mean it's just ordering.

Yes I also mean it don't separate the related definitions. so place
adjacent as the the previous.

>
>> >
>> >> +
>> >> =A0#endif /* __ASM_ARCH_MAP_H */
>> >> diff --git a/arch/arm/plat-s5p/Kconfig b/arch/arm/plat-s5p/Kconfi=
g
>> >> index 907ac63..9c79106 100644
>> >> --- a/arch/arm/plat-s5p/Kconfig
>> >> +++ b/arch/arm/plat-s5p/Kconfig
>> >> @@ -5,6 +5,22 @@
>> >> =A0#
>> >> =A0# Licensed under GPLv2
>> >>
>> >> +config S5P_DEV_FIMC0
>> >> + =A0 =A0 bool
>> >> + =A0 =A0 help
>> >> + =A0 =A0 =A0 Compile in platform device definitions for FIMC con=
troller 0
>> >> +
>> >> +config S5P_DEV_FIMC1
>> >> + =A0 =A0 bool
>> >> + =A0 =A0 help
>> >> + =A0 =A0 =A0 Compile in platform device definitions for FIMC con=
troller 1
>> >> +
>> >> +config S5P_DEV_FIMC2
>> >> + =A0 =A0 bool
>> >> + =A0 =A0 help
>> >> + =A0 =A0 =A0 Compile in platform device definitions for FIMC con=
troller 2
>> >> +
>> >> +
>> >
>> > 2 empty lines.
>> >
>> >> =A0config PLAT_S5P
>> >> =A0 =A0 =A0 bool
>> >> =A0 =A0 =A0 depends on (ARCH_S5P6440 || ARCH_S5P6442 || ARCH_S5PC=
100 ||
>> >> ARCH_S5PV210 || ARCH_S5PV310)
>> >> diff --git a/arch/arm/plat-s5p/Makefile b/arch/arm/plat-s5p/Makef=
ile
>> >> index 7e34194..a2d9905 100644
>> >> --- a/arch/arm/plat-s5p/Makefile
>> >> +++ b/arch/arm/plat-s5p/Makefile
>> >> @@ -19,3 +19,6 @@ obj-y =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 +=3D clock.o
>> >> =A0obj-y =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0+=3D irq.o
>> >> =A0obj-$(CONFIG_S5P_EXT_INT) =A0 =A0+=3D irq-eint.o
>> >>
>> >
>> > Please add '# devices' here...
>> It's not related with this patch.
>> >
>> >> +obj-$(CONFIG_S5P_DEV_FIMC0) =A0+=3D dev-fimc0.o
>> >> +obj-$(CONFIG_S5P_DEV_FIMC1) =A0+=3D dev-fimc1.o
>> >> +obj-$(CONFIG_S5P_DEV_FIMC2) =A0+=3D dev-fimc2.o
>> >> diff --git a/arch/arm/plat-s5p/dev-fimc0.c
> b/arch/arm/plat-s5p/dev-fimc0.c
>> >> new file mode 100644
>> >> index 0000000..8849de4
>> >> --- /dev/null
>> >> +++ b/arch/arm/plat-s5p/dev-fimc0.c
>> >> @@ -0,0 +1,35 @@
>> >> +/* linux/arch/arm/plat-s5p/dev-fimc0.c
>> >> + *
>> >> + * Copyright (c) 2010 Samsung Electronics
>> >> + *
>> >> + * Base S5P FIMC0 resource and device definitions
>> >> + *
>> >> + * This program is free software; you can redistribute it and/or
> modify
>> >> + * it under the terms of the GNU General Public License version =
2 as
>> >> + * published by the Free Software Foundation.
>> >> + */
>> >
>> > Being 1 empty line is better here.
>> >
>> >> +#include <linux/kernel.h>
>> >> +#include <linux/platform_device.h>
>> >> +#include <linux/interrupt.h>
>> >> +#include <linux/ioport.h>
>> >> +#include <mach/map.h>
>> >> +
>> >> +static struct resource s5p_fimc_resource[] =3D {
>> >
>> > Please change to s5p_fimc0_resource...it'd helpful to merging dev-=
fimcX
>> > files later...
>> >
>> >> + =A0 =A0 [0] =3D {
>> >> + =A0 =A0 =A0 =A0 =A0 =A0 .start =A0=3D S5P_PA_FIMC0,
>> >> + =A0 =A0 =A0 =A0 =A0 =A0 .end =A0 =A0=3D S5P_PA_FIMC0 + SZ_1M - =
1,
>> >> + =A0 =A0 =A0 =A0 =A0 =A0 .flags =A0=3D IORESOURCE_MEM,
>> >> + =A0 =A0 },
>> >> + =A0 =A0 [1] =3D {
>> >> + =A0 =A0 =A0 =A0 =A0 =A0 .start =A0=3D IRQ_FIMC0,
>> >> + =A0 =A0 =A0 =A0 =A0 =A0 .end =A0 =A0=3D IRQ_FIMC0,
>> >> + =A0 =A0 =A0 =A0 =A0 =A0 .flags =A0=3D IORESOURCE_IRQ,
>> >> + =A0 =A0 },
>> >> +};
>> >> +
>> >> +struct platform_device s5p_device_fimc0 =3D {
>> >> + =A0 =A0 .name =A0 =A0 =A0 =A0 =A0 =3D "s5p-fimc",
>> >> + =A0 =A0 .id =A0 =A0 =A0 =A0 =A0 =A0 =3D 0,
>> >> + =A0 =A0 .num_resources =A0=3D ARRAY_SIZE(s5p_fimc_resource),
>> >
>> > s5p_fimc0_resource...
>> >
>> >> + =A0 =A0 .resource =A0 =A0 =A0 =3D s5p_fimc_resource,
>> >
>> > s5p_fimc0_resource...
>> >
>> >> +};
>> >> diff --git a/arch/arm/plat-s5p/dev-fimc1.c
> b/arch/arm/plat-s5p/dev-fimc1.c
>> >> new file mode 100644
>> >> index 0000000..b1f8970
>> >> --- /dev/null
>> >> +++ b/arch/arm/plat-s5p/dev-fimc1.c
>> >> @@ -0,0 +1,35 @@
>> >> +/* linux/arch/arm/plat-s5p/dev-fimc1.c
>> >> + *
>> >> + * Copyright (c) 2010 Samsung Electronics
>> >> + *
>> >> + * Base S5P FIMC1 resource and device definitions
>> >> + *
>> >> + * This program is free software; you can redistribute it and/or
> modify
>> >> + * it under the terms of the GNU General Public License version =
2 as
>> >> + * published by the Free Software Foundation.
>> >> + */
>> >> +#include <linux/kernel.h>
>> >> +#include <linux/platform_device.h>
>> >> +#include <linux/interrupt.h>
>> >> +#include <linux/ioport.h>
>> >> +#include <mach/map.h>
>> >> +
>> >> +static struct resource s5p_fimc_resource[] =3D {
>> >> + =A0 =A0 [0] =3D {
>> >> + =A0 =A0 =A0 =A0 =A0 =A0 .start =A0=3D S5P_PA_FIMC1,
>> >> + =A0 =A0 =A0 =A0 =A0 =A0 .end =A0 =A0=3D S5P_PA_FIMC1 + SZ_1M - =
1,
>> >> + =A0 =A0 =A0 =A0 =A0 =A0 .flags =A0=3D IORESOURCE_MEM,
>> >> + =A0 =A0 },
>> >> + =A0 =A0 [1] =3D {
>> >> + =A0 =A0 =A0 =A0 =A0 =A0 .start =A0=3D IRQ_FIMC1,
>> >> + =A0 =A0 =A0 =A0 =A0 =A0 .end =A0 =A0=3D IRQ_FIMC1,
>> >> + =A0 =A0 =A0 =A0 =A0 =A0 .flags =A0=3D IORESOURCE_IRQ,
>> >> + =A0 =A0 },
>> >> +};
>> >> +
>> >> +struct platform_device s5p_device_fimc1 =3D {
>> >> + =A0 =A0 .name =A0 =A0 =A0 =A0 =A0 =3D "s5p-fimc",
>> >> + =A0 =A0 .id =A0 =A0 =A0 =A0 =A0 =A0 =3D 1,
>> >> + =A0 =A0 .num_resources =A0=3D ARRAY_SIZE(s5p_fimc_resource),
>> >> + =A0 =A0 .resource =A0 =A0 =A0 =3D s5p_fimc_resource,
>> >> +};
>> >> diff --git a/arch/arm/plat-s5p/dev-fimc2.c
> b/arch/arm/plat-s5p/dev-fimc2.c
>> >> new file mode 100644
>> >> index 0000000..20df59d
>> >> --- /dev/null
>> >> +++ b/arch/arm/plat-s5p/dev-fimc2.c
>> >> @@ -0,0 +1,35 @@
>> >> +/* linux/arch/arm/plat-s5p/dev-fimc2.c
>> >> + *
>> >> + * Copyright (c) 2010 Samsung Electronics
>> >> + *
>> >> + * Base S5P FIMC2 resource and device definitions
>> >> + *
>> >> + * This program is free software; you can redistribute it and/or
> modify
>> >> + * it under the terms of the GNU General Public License version =
2 as
>> >> + * published by the Free Software Foundation.
>> >> + */
>> >> +#include <linux/kernel.h>
>> >> +#include <linux/platform_device.h>
>> >> +#include <linux/interrupt.h>
>> >> +#include <linux/ioport.h>
>> >> +#include <mach/map.h>
>> >> +
>> >> +static struct resource s5p_fimc_resource[] =3D {
>> >> + =A0 =A0 [0] =3D {
>> >> + =A0 =A0 =A0 =A0 =A0 =A0 .start =A0=3D S5P_PA_FIMC2,
>> >> + =A0 =A0 =A0 =A0 =A0 =A0 .end =A0 =A0=3D S5P_PA_FIMC2 + SZ_1M - =
1,
>> >> + =A0 =A0 =A0 =A0 =A0 =A0 .flags =A0=3D IORESOURCE_MEM,
>> >> + =A0 =A0 },
>> >> + =A0 =A0 [1] =3D {
>> >> + =A0 =A0 =A0 =A0 =A0 =A0 .start =A0=3D IRQ_FIMC2,
>> >> + =A0 =A0 =A0 =A0 =A0 =A0 .end =A0 =A0=3D IRQ_FIMC2,
>> >> + =A0 =A0 =A0 =A0 =A0 =A0 .flags =A0=3D IORESOURCE_IRQ,
>> >> + =A0 =A0 },
>> >> +};
>> >> +
>> >> +struct platform_device s5p_device_fimc2 =3D {
>> >> + =A0 =A0 .name =A0 =A0 =A0 =A0 =A0 =3D "s5p-fimc",
>> >> + =A0 =A0 .id =A0 =A0 =A0 =A0 =A0 =A0 =3D 2,
>> >> + =A0 =A0 .num_resources =A0=3D ARRAY_SIZE(s5p_fimc_resource),
>> >> + =A0 =A0 .resource =A0 =A0 =A0 =3D s5p_fimc_resource,
>> >> +};
>> >
>> > This is just for your information...
>> > I'm working on handling plat device in case of various # of each A=
P FIMC
>> > with CONFIG_NR_FIMC...
>> > So in this case, all of plat data for FIMC will be merged into
>> > 'plat-s5p/dev-fimc.c' or 'devs.c' later.
>> > ...but I'm not sure some stuff...anyway...
>>
>> If you have these plan, then there's no reason to separate the
>> dev-fimcX as this patch, Just one file the dev-fimc from now.
>> Other devices are same rules.
>>
> If you want now, just 'dev-fimc.c' is ok...but in that case, need to =
add
> '#ifdef CONFIG_S5P_DEV_FIMCX' in there..and 'OR' in Makefile for dev-=
fimc.o
>
>> >
>> >> diff --git a/arch/arm/plat-samsung/include/plat/fimc-core.h
>> > b/arch/arm/plat-
>> >> samsung/include/plat/fimc-core.h
>> >> new file mode 100644
>> >> index 0000000..a884ede
>> >> --- /dev/null
>> >> +++ b/arch/arm/plat-samsung/include/plat/fimc-core.h
>> >> @@ -0,0 +1,45 @@
>> >> +/*
>> >> + * arch/arm/plat-samsung/include/plat/fimc-core.h
>> >> + *
>> >> + * Copyright 2010 Samsung Electronics Co., Ltd.
>> >> + * =A0 Sylwester Nawrocki <s.nawrocki@samsung.com>
>> >> + *
>> >> + * Samsung camera interface driver core functions
>> >> + *
>> >> + * This program is free software; you can redistribute it and/or
> modify
>> >> + * it under the terms of the GNU General Public License version =
2 as
>> >> + * published by the Free Software Foundation.
>> >> + */
>> >> +#ifndef __ASM_PLAT_FIMC_CORE_H
>> >> +#define __ASM_PLAT_FIMC_CORE_H __FILE__
>> >> +
>> >> +/*
>> >> + * These functions are only for use with the core support code, =
such
> as
>> >> + * the CPU-specific initialization code.
>> >> + */
>> >> +
>> >> +#include <plat/fimc.h>
>> >> +
>> >> +/* Re-define device name to differentiate the subsystem in vario=
us
> SoCs.
>> > */
>> >> +static inline void s3c_fimc_setname(int id, char *name)
>> >> +{
>> >> + =A0 =A0 switch (id) {
>> >> +#ifdef CONFIG_S5P_DEV_FIMC0
>> >> + =A0 =A0 case 0:
>> >> + =A0 =A0 =A0 =A0 =A0 =A0 s5p_device_fimc0.name =3D name;
>> >> + =A0 =A0 =A0 =A0 =A0 =A0 break;
>> >> +#endif
>> >> +#ifdef CONFIG_S5P_DEV_FIMC1
>> >> + =A0 =A0 case 1:
>> >> + =A0 =A0 =A0 =A0 =A0 =A0 s5p_device_fimc1.name =3D name;
>> >> + =A0 =A0 =A0 =A0 =A0 =A0 break;
>> >> +#endif
>> >> +#ifdef CONFIG_S5P_DEV_FIMC2
>> >> + =A0 =A0 case 2:
>> >> + =A0 =A0 =A0 =A0 =A0 =A0 s5p_device_fimc2.name =3D name;
>> >> + =A0 =A0 =A0 =A0 =A0 =A0 break;
>> >> +#endif
>> >> + =A0 =A0 }
>> >> +}
>> >> +
>> >> +#endif /* __ASM_PLAT_FIMC_CORE_H */
>> >> diff --git a/arch/arm/plat-samsung/include/plat/fimc.h b/arch/arm=
/plat-
>> >> samsung/include/plat/fimc.h
>> >> new file mode 100644
>> >> index 0000000..fda2040
>> >> --- /dev/null
>> >> +++ b/arch/arm/plat-samsung/include/plat/fimc.h
>> >> @@ -0,0 +1,22 @@
>> >> +/* linux/arch/arm/plat-samsung/include/plat/fimc.h
>> >> + *
>> >> + * Platform header file for S3C/S5P FIMC driver
>> >> + *
>> >> + * Copyright (c) 2010 Samsung Electronics
>> >> + *
>> >> + * Sylwester Nawrocki, <s.nawrocki@samsung.com>
>> >> + *
>> >> + * This program is free software; you can redistribute it and/or
> modify
>> >> + * it under the terms of the GNU General Public License version =
2 as
>> >> + * published by the Free Software Foundation.
>> >> + */
>> >> +#ifndef FIMC_H_
>> >> +#define FIMC_H_
>> >> +
>> >> +#include <linux/platform_device.h>
>> >> +
>> >> +extern struct platform_device s5p_device_fimc0;
>> >> +extern struct platform_device s5p_device_fimc1;
>> >> +extern struct platform_device s5p_device_fimc2;
>> >
>> > Should being in 'plat-samsung/include/plat/devs.h'.
>> >
>> >> +
>> >> +#endif /* FIMC_H_ */
>> >> --
>> >
>> > Marek, could you please address as soon as possible?
>> >
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
