From: MyungJoo Ham <myungjoo.ham@gmail.com>
Subject: Re: [PATCH v2] ARM: S5PV210: Add Power Management Support
Date: Tue, 1 Jun 2010 14:13:18 +0900
Message-ID: <AANLkTikdkOvvdsQvwuqS9QFv6yIM7LQJb24NrTi-RA-s@mail.gmail.com>
References: <1275356164-7896-1-git-send-email-kgene.kim@samsung.com>
	<20100601020329.GT4720@trinity.fluff.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-vw0-f46.google.com ([209.85.212.46]:38614 "EHLO
	mail-vw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750804Ab0FAFNU convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 1 Jun 2010 01:13:20 -0400
Received: by vws11 with SMTP id 11so474021vws.19
        for <linux-samsung-soc@vger.kernel.org>; Mon, 31 May 2010 22:13:18 -0700 (PDT)
In-Reply-To: <20100601020329.GT4720@trinity.fluff.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Ben Dooks <ben-linux@fluff.org>, Kukjin Kim <kgene.kim@samsung.com>, linux-samsung-soc@vger.kernel.org, Jongpill Lee <boyko.lee@samsung.com>, linux-arm-kernel@lists.infradead.org

On Tue, Jun 1, 2010 at 11:03 AM, Ben Dooks <ben-linux@fluff.org> wrote:
>
> On Tue, Jun 01, 2010 at 10:36:04AM +0900, Kukjin Kim wrote:
>> From: Jongpill Lee <boyko.lee@samsung.com>
>>
>> This patch adds suspend-to-ram support for S5PV210.
>>
>> Signed-off-by: Jongpill Lee <boyko.lee@samsung.com>
>> Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
>> ---
>> Changes since v1:
>>
>> 1. Fixed comments as per comments from Ben Dooks
>> 2. Removed redunt #if defined(CONFIG_PM)
>> 3. Removed redunt including header files
>> 4. Removed <mach/pm.h> and <plat/pm-s5p.h>
>> 5. Moved 's5pv210_core_save' into machine directory
>> 6. Moved sleep.S into machine directory for S5P SoCs compatibility
>> 7. Added CF retension configuration when wake-up
>>
>> This patch is based on Linus' master (2.6.35-rc1)
>>
>> =C2=A0arch/arm/mach-s5pv210/Kconfig =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | =C2=A0 =C2=A06 +
>> =C2=A0arch/arm/mach-s5pv210/Makefile =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A0 =C2=A01 +
>> =C2=A0arch/arm/mach-s5pv210/include/mach/pm-core.h =C2=A0 =C2=A0| =C2=
=A0 44 ++++++
>> =C2=A0arch/arm/mach-s5pv210/include/mach/regs-clock.h | =C2=A0 =C2=A0=
5 +-
>> =C2=A0arch/arm/mach-s5pv210/mach-smdkc110.c =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 | =C2=A0 =C2=A02 +
>> =C2=A0arch/arm/mach-s5pv210/mach-smdkv210.c =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 | =C2=A0 =C2=A03 +
>> =C2=A0arch/arm/mach-s5pv210/pm.c =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A0180 ++++++++++++++++++=
+++++
>> =C2=A0arch/arm/mach-s5pv210/sleep.S =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | =C2=A0166 +++++++++++++++++++++
>> =C2=A0arch/arm/plat-s5p/Makefile =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A0 =C2=A02 +
>> =C2=A0arch/arm/plat-s5p/include/plat/irqs.h =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 | =C2=A0 =C2=A02 +
>> =C2=A0arch/arm/plat-s5p/irq-pm.c =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A0108 ++++++++++++++
>> =C2=A0arch/arm/plat-s5p/pm.c =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A0 52 +++++++
>> =C2=A0arch/arm/plat-samsung/pm-gpio.c =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 | =C2=A0 =C2=A04 +-
>> =C2=A013 files changed, 572 insertions(+), 3 deletions(-)
>> =C2=A0create mode 100644 arch/arm/mach-s5pv210/include/mach/pm-core.=
h
>> =C2=A0create mode 100644 arch/arm/mach-s5pv210/pm.c
>> =C2=A0create mode 100644 arch/arm/mach-s5pv210/sleep.S
>> =C2=A0create mode 100644 arch/arm/plat-s5p/irq-pm.c
>> =C2=A0create mode 100644 arch/arm/plat-s5p/pm.c
>>
>> diff --git a/arch/arm/mach-s5pv210/Kconfig b/arch/arm/mach-s5pv210/K=
config
>> index 0761eac..86cca1b 100644
>> --- a/arch/arm/mach-s5pv210/Kconfig
>> +++ b/arch/arm/mach-s5pv210/Kconfig
>> @@ -14,6 +14,7 @@ config CPU_S5PV210
>> =C2=A0 =C2=A0 =C2=A0 select PLAT_S5P
>> =C2=A0 =C2=A0 =C2=A0 select S3C_PL330_DMA
>> =C2=A0 =C2=A0 =C2=A0 select S5P_EXT_INT
>> + =C2=A0 =C2=A0 select S5PV210_PM if PM
>> =C2=A0 =C2=A0 =C2=A0 help
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 Enable S5PV210 CPU support
>>
>> @@ -88,4 +89,9 @@ config MACH_SMDKC110
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 Machine support for Samsung SMDKC110
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 S5PC110(MCP) is one of package option of=
 S5PV210
>>
>> +config S5PV210_PM
>> + =C2=A0 =C2=A0 bool
>> + =C2=A0 =C2=A0 help
>> + =C2=A0 =C2=A0 =C2=A0 Power Management code common to S5PV210
>> +
>> =C2=A0endif
>> diff --git a/arch/arm/mach-s5pv210/Makefile b/arch/arm/mach-s5pv210/=
Makefile
>> index 30be9a6..59382ec 100644
>> --- a/arch/arm/mach-s5pv210/Makefile
>> +++ b/arch/arm/mach-s5pv210/Makefile
>> @@ -14,6 +14,7 @@ obj- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0:=3D
>>
>> =C2=A0obj-$(CONFIG_CPU_S5PV210) =C2=A0 =C2=A0+=3D cpu.o init.o clock=
=2Eo dma.o gpiolib.o
>> =C2=A0obj-$(CONFIG_CPU_S5PV210) =C2=A0 =C2=A0+=3D setup-i2c0.o
>> +obj-$(CONFIG_S5PV210_PM) =C2=A0 =C2=A0 +=3D pm.o sleep.o
>>
>> =C2=A0# machine support
>>
>> diff --git a/arch/arm/mach-s5pv210/include/mach/pm-core.h b/arch/arm=
/mach-s5pv210/include/mach/pm-core.h
>> new file mode 100644
>> index 0000000..ca3f827
>> --- /dev/null
>> +++ b/arch/arm/mach-s5pv210/include/mach/pm-core.h
>> @@ -0,0 +1,44 @@
>> +/* linux/arch/arm/mach-s5pv210/include/mach/pm-core.h
>> + *
>> + * Copyright (c) 2010 Samsung Electronics Co., Ltd.
>> + * =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 http://www.samsung.com
>> + *
>> + * Based on arch/arm/mach-s3c2410/include/mach/pm-core.h,
>> + * Copyright 2008 Simtec Electronics
>> + * =C2=A0 =C2=A0 =C2=A0Ben Dooks <ben@simtec.co.uk>
>> + * =C2=A0 =C2=A0 =C2=A0http://armlinux.simtec.co.uk/
>> + *
>> + * S5PV210 - PM core support for arch/arm/plat-s5p/pm.c
>> + *
>> + * This program is free software; you can redistribute it and/or mo=
dify
>> + * it under the terms of the GNU General Public License version 2 a=
s
>> + * published by the Free Software Foundation.
>> +*/
>> +
>> +static inline void s3c_pm_debug_init_uart(void)
>> +{
>> + =C2=A0 =C2=A0 /* nothing here yet */
>> +}
>> +
>> +static inline void s3c_pm_arch_prepare_irqs(void)
>> +{
>> + =C2=A0 =C2=A0 __raw_writel(s3c_irqwake_intmask, S5P_WAKEUP_MASK);
>> + =C2=A0 =C2=A0 __raw_writel(s3c_irqwake_eintmask, S5P_EINT_WAKEUP_M=
ASK);
>> +}
>> +
>> +static inline void s3c_pm_arch_stop_clocks(void)
>> +{
>> + =C2=A0 =C2=A0 /* nothing here yet */
>> +}
>> +
>> +static inline void s3c_pm_arch_show_resume_irqs(void)
>> +{
>> + =C2=A0 =C2=A0 /* nothing here yet */
>> +}
>> +
>> +static inline void s3c_pm_arch_update_uart(void __iomem *regs,
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
struct pm_uart_save *save)
>> +{
>> + =C2=A0 =C2=A0 /* nothing here yet */
>> +}
>> +
>> diff --git a/arch/arm/mach-s5pv210/include/mach/regs-clock.h b/arch/=
arm/mach-s5pv210/include/mach/regs-clock.h
>> index 2a25ab4..f4a443a 100644
>> --- a/arch/arm/mach-s5pv210/include/mach/regs-clock.h
>> +++ b/arch/arm/mach-s5pv210/include/mach/regs-clock.h
>> @@ -157,8 +157,11 @@
>> =C2=A0#define S5P_SLEEP_CFG_USBOSC_EN =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0(1 << 1)
>>
>> =C2=A0/* OTHERS Resgister */
>> +#define S5P_OTHERS_RET_IO =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
(1 << 31)
>> +#define S5P_OTHERS_RET_CF =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
(1 << 30)
>> +#define S5P_OTHERS_RET_MMC =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (1 <<=
 29)
>> +#define S5P_OTHERS_RET_UART =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(1 <<=
 28)
>> =C2=A0#define S5P_OTHERS_USB_SIG_MASK =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0(1 << 16)
>> -#define S5P_OTHERS_MIPI_DPHY_EN =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0(1 << 28)
>>
>> =C2=A0/* MIPI */
>> =C2=A0#define S5P_MIPI_DPHY_EN =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 (3)
>> diff --git a/arch/arm/mach-s5pv210/mach-smdkc110.c b/arch/arm/mach-s=
5pv210/mach-smdkc110.c
>> index 4c8903c..ebb4832 100644
>> --- a/arch/arm/mach-s5pv210/mach-smdkc110.c
>> +++ b/arch/arm/mach-s5pv210/mach-smdkc110.c
>> @@ -25,6 +25,7 @@
>> =C2=A0#include <plat/s5pv210.h>
>> =C2=A0#include <plat/devs.h>
>> =C2=A0#include <plat/cpu.h>
>> +#include <plat/pm.h>
>>
>> =C2=A0/* Following are default values for UCON, ULCON and UFCON UART=
 registers */
>> =C2=A0#define S5PV210_UCON_DEFAULT (S3C2410_UCON_TXILEVEL | =C2=A0 =C2=
=A0 =C2=A0 =C2=A0\
>> @@ -86,6 +87,7 @@ static void __init smdkc110_map_io(void)
>>
>> =C2=A0static void __init smdkc110_machine_init(void)
>> =C2=A0{
>> + =C2=A0 =C2=A0 s3c_pm_init();
>> =C2=A0 =C2=A0 =C2=A0 platform_add_devices(smdkc110_devices, ARRAY_SI=
ZE(smdkc110_devices));
>> =C2=A0}
>>
>> diff --git a/arch/arm/mach-s5pv210/mach-smdkv210.c b/arch/arm/mach-s=
5pv210/mach-smdkv210.c
>> index 0d46279..ba30b5d 100644
>> --- a/arch/arm/mach-s5pv210/mach-smdkv210.c
>> +++ b/arch/arm/mach-s5pv210/mach-smdkv210.c
>> @@ -27,6 +27,7 @@
>> =C2=A0#include <plat/cpu.h>
>> =C2=A0#include <plat/adc.h>
>> =C2=A0#include <plat/ts.h>
>> +#include <plat/pm.h>
>>
>> =C2=A0/* Following are default values for UCON, ULCON and UFCON UART=
 registers */
>> =C2=A0#define S5PV210_UCON_DEFAULT (S3C2410_UCON_TXILEVEL | =C2=A0 =C2=
=A0 =C2=A0 =C2=A0\
>> @@ -96,6 +97,8 @@ static void __init smdkv210_map_io(void)
>>
>> =C2=A0static void __init smdkv210_machine_init(void)
>> =C2=A0{
>> + =C2=A0 =C2=A0 s3c_pm_init();
>> +
>> =C2=A0 =C2=A0 =C2=A0 s3c24xx_ts_set_platdata(&s3c_ts_platform);
>> =C2=A0 =C2=A0 =C2=A0 platform_add_devices(smdkv210_devices, ARRAY_SI=
ZE(smdkv210_devices));
>> =C2=A0}
>> diff --git a/arch/arm/mach-s5pv210/pm.c b/arch/arm/mach-s5pv210/pm.c
>> new file mode 100644
>> index 0000000..0690332
>> --- /dev/null
>> +++ b/arch/arm/mach-s5pv210/pm.c
>> @@ -0,0 +1,180 @@
>> +/* linux/arch/arm/mach-s5pv210/pm.c
>> + *
>> + * Copyright (c) 2010 Samsung Electronics Co., Ltd.
>> + * =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 http://www.samsung.com
>> + *
>> + * S5PV210 - Power Management support
>> + *
>> + * Based on arch/arm/mach-s3c2410/pm.c
>> + * Copyright (c) 2006 Simtec Electronics
>> + * =C2=A0 Ben Dooks <ben@simtec.co.uk>
>> + *
>> + * This program is free software; you can redistribute it and/or mo=
dify
>> + * it under the terms of the GNU General Public License version 2 a=
s
>> + * published by the Free Software Foundation.
>> +*/
>> +
>> +#include <linux/init.h>
>> +#include <linux/suspend.h>
>> +#include <linux/io.h>
>> +
>> +#include <plat/cpu.h>
>> +#include <plat/pm.h>
>> +#include <plat/regs-timer.h>
>> +
>> +#include <mach/regs-irq.h>
>> +#include <mach/regs-clock.h>
>> +
>> +static struct sleep_save s5pv210_core_save[] =3D {
>> + =C2=A0 =C2=A0 /* Clock source */
>> + =C2=A0 =C2=A0 SAVE_ITEM(S5P_CLK_SRC0),
>> + =C2=A0 =C2=A0 SAVE_ITEM(S5P_CLK_SRC1),
>> + =C2=A0 =C2=A0 SAVE_ITEM(S5P_CLK_SRC2),
>> + =C2=A0 =C2=A0 SAVE_ITEM(S5P_CLK_SRC3),
>> + =C2=A0 =C2=A0 SAVE_ITEM(S5P_CLK_SRC4),
>> + =C2=A0 =C2=A0 SAVE_ITEM(S5P_CLK_SRC5),
>> + =C2=A0 =C2=A0 SAVE_ITEM(S5P_CLK_SRC6),
>> +
>> + =C2=A0 =C2=A0 /* Clock source Mask */
>> + =C2=A0 =C2=A0 SAVE_ITEM(S5P_CLK_SRC_MASK0),
>> + =C2=A0 =C2=A0 SAVE_ITEM(S5P_CLK_SRC_MASK1),
>> +
>> + =C2=A0 =C2=A0 /* Clock Divider */
>> + =C2=A0 =C2=A0 SAVE_ITEM(S5P_CLK_DIV0),
>> + =C2=A0 =C2=A0 SAVE_ITEM(S5P_CLK_DIV1),
>> + =C2=A0 =C2=A0 SAVE_ITEM(S5P_CLK_DIV2),
>> + =C2=A0 =C2=A0 SAVE_ITEM(S5P_CLK_DIV3),
>> + =C2=A0 =C2=A0 SAVE_ITEM(S5P_CLK_DIV4),
>> + =C2=A0 =C2=A0 SAVE_ITEM(S5P_CLK_DIV5),
>> + =C2=A0 =C2=A0 SAVE_ITEM(S5P_CLK_DIV6),
>> + =C2=A0 =C2=A0 SAVE_ITEM(S5P_CLK_DIV7),
>> +
>> + =C2=A0 =C2=A0 /* Clock Main Gate */
>> + =C2=A0 =C2=A0 SAVE_ITEM(S5P_CLKGATE_MAIN0),
>> + =C2=A0 =C2=A0 SAVE_ITEM(S5P_CLKGATE_MAIN1),
>> + =C2=A0 =C2=A0 SAVE_ITEM(S5P_CLKGATE_MAIN2),
>> +
>> + =C2=A0 =C2=A0 /* Clock source Peri Gate */
>> + =C2=A0 =C2=A0 SAVE_ITEM(S5P_CLKGATE_PERI0),
>> + =C2=A0 =C2=A0 SAVE_ITEM(S5P_CLKGATE_PERI1),
>> +
>> + =C2=A0 =C2=A0 /* Clock source SCLK Gate */
>> + =C2=A0 =C2=A0 SAVE_ITEM(S5P_CLKGATE_SCLK0),
>> + =C2=A0 =C2=A0 SAVE_ITEM(S5P_CLKGATE_SCLK1),
>> +
>> + =C2=A0 =C2=A0 /* Clock IP Clock gate */
>> + =C2=A0 =C2=A0 SAVE_ITEM(S5P_CLKGATE_IP0),
>> + =C2=A0 =C2=A0 SAVE_ITEM(S5P_CLKGATE_IP1),
>> + =C2=A0 =C2=A0 SAVE_ITEM(S5P_CLKGATE_IP2),
>> + =C2=A0 =C2=A0 SAVE_ITEM(S5P_CLKGATE_IP3),
>> + =C2=A0 =C2=A0 SAVE_ITEM(S5P_CLKGATE_IP4),
>> +
>> + =C2=A0 =C2=A0 /* Clock Blcok and Bus gate */
>> + =C2=A0 =C2=A0 SAVE_ITEM(S5P_CLKGATE_BLOCK),
>> + =C2=A0 =C2=A0 SAVE_ITEM(S5P_CLKGATE_BUS0),
>> +
>> + =C2=A0 =C2=A0 /* Clock ETC */
>> + =C2=A0 =C2=A0 SAVE_ITEM(S5P_CLK_OUT),
>> + =C2=A0 =C2=A0 SAVE_ITEM(S5P_MDNIE_SEL),
>> +
>> + =C2=A0 =C2=A0 /* PWM Register */
>> + =C2=A0 =C2=A0 SAVE_ITEM(S3C2410_TCFG0),
>> + =C2=A0 =C2=A0 SAVE_ITEM(S3C2410_TCFG1),
>> + =C2=A0 =C2=A0 SAVE_ITEM(S3C64XX_TINT_CSTAT),
>> + =C2=A0 =C2=A0 SAVE_ITEM(S3C2410_TCON),
>> + =C2=A0 =C2=A0 SAVE_ITEM(S3C2410_TCNTB(0)),
>> + =C2=A0 =C2=A0 SAVE_ITEM(S3C2410_TCMPB(0)),
>> + =C2=A0 =C2=A0 SAVE_ITEM(S3C2410_TCNTO(0)),
>> +
>> + =C2=A0 =C2=A0 /* VIC 2 and 3*/
>> + =C2=A0 =C2=A0 SAVE_ITEM(VA_VIC2 + VIC_INT_SELECT),
>> + =C2=A0 =C2=A0 SAVE_ITEM(VA_VIC3 + VIC_INT_SELECT),
>> + =C2=A0 =C2=A0 SAVE_ITEM(VA_VIC2 + VIC_INT_ENABLE),
>> + =C2=A0 =C2=A0 SAVE_ITEM(VA_VIC3 + VIC_INT_ENABLE),
>> + =C2=A0 =C2=A0 SAVE_ITEM(VA_VIC2 + VIC_INT_SOFT),
>> + =C2=A0 =C2=A0 SAVE_ITEM(VA_VIC3 + VIC_INT_SOFT),
>
> doesn't the vic driver do this for you? if not, then would be better
> to change the vic to fix this.

The VIC driver does only for VIC0 and VIC1; thus, moving VIC2/3 from
pm.c to irq-pm.c should be fine.
Probably, a few machines supposed to be supported by this irq-pm
driver has only VIC0 and VIC1.
However, it'd be better if irq-pm supports both machines with VIC0/1 an=
d VIC0-3.

>
>> +};
>> +
>> +void s5pv210_cpu_suspend(void)
>> +{
>> + =C2=A0 =C2=A0 unsigned long tmp;
>> +
>> + =C2=A0 =C2=A0 /* issue the standby signal into the pm unit. Note, =
we
>> + =C2=A0 =C2=A0 =C2=A0* issue a write-buffer drain just in case */
>> +
>> + =C2=A0 =C2=A0 tmp =3D 0;
>> +
>> + =C2=A0 =C2=A0 asm("b 1f\n\t"
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 ".align 5\n\t"
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 "1:\n\t"
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 "mcr p15, 0, %0, c7, c10, 5\n\t"
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 "mcr p15, 0, %0, c7, c10, 4\n\t"
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 ".word 0xe320f003" : : "r" (tmp));
>
> why .word? if there's a compiler problem then make a comment about
> what instruction is being synthesised and why.

".word 0xe320f003" may be replaced by "wfi". (wait-for-interrupt)

>
>> + =C2=A0 =C2=A0 /* we should never get past here */
>> + =C2=A0 =C2=A0 panic("sleep resumed to originator?");
>> +}
>> +
>> +static void s5pv210_pm_prepare(void)
>> +{
>> + =C2=A0 =C2=A0 unsigned int tmp;
>> +
>> + =C2=A0 =C2=A0 /* ensure at least INFORM0 has the resume address */
>> + =C2=A0 =C2=A0 __raw_writel(virt_to_phys(s3c_cpu_resume), S5P_INFOR=
M0);
>> +
>> + =C2=A0 =C2=A0 tmp =3D __raw_readl(S5P_SLEEP_CFG);
>> + =C2=A0 =C2=A0 tmp &=3D ~(S5P_SLEEP_CFG_OSC_EN | S5P_SLEEP_CFG_USBO=
SC_EN);
>> + =C2=A0 =C2=A0 __raw_writel(tmp, S5P_SLEEP_CFG);
>> +
>> + =C2=A0 =C2=A0 /* WFI for SLEEP mode configuration by SYSCON */
>> + =C2=A0 =C2=A0 tmp =3D __raw_readl(S5P_PWR_CFG);
>> + =C2=A0 =C2=A0 tmp &=3D S5P_CFG_WFI_CLEAN;
>> + =C2=A0 =C2=A0 tmp |=3D S5P_CFG_WFI_SLEEP;
>> + =C2=A0 =C2=A0 __raw_writel(tmp, S5P_PWR_CFG);
>> +
>> + =C2=A0 =C2=A0 /* SYSCON interrupt handling disable */
>> + =C2=A0 =C2=A0 tmp =3D __raw_readl(S5P_OTHERS);
>> + =C2=A0 =C2=A0 tmp |=3D S5P_OTHER_SYSC_INTOFF;
>> + =C2=A0 =C2=A0 __raw_writel(tmp, S5P_OTHERS);
>> +
>> + =C2=A0 =C2=A0 __raw_writel(0xffffffff, (VA_VIC0 + VIC_INT_ENABLE_C=
LEAR));
>> + =C2=A0 =C2=A0 __raw_writel(0xffffffff, (VA_VIC1 + VIC_INT_ENABLE_C=
LEAR));
>> + =C2=A0 =C2=A0 __raw_writel(0xffffffff, (VA_VIC2 + VIC_INT_ENABLE_C=
LEAR));
>> + =C2=A0 =C2=A0 __raw_writel(0xffffffff, (VA_VIC3 + VIC_INT_ENABLE_C=
LEAR));

It appears to be omitting VIC_INT_SOFT_CLEAR. I'm not sure whether
this is also required as VIC_INT_ENABLE_CLEAR does; however, we've
been doing __raw_writel(0xffffffff, (VA_VICx + VIC_INT_SOFT_CLEAR) as
well.

Clearing pending external interrupt when entering a suspend may be
added here. Sometimes, uncleared pending external interrupts may be
problematic for a sleep; i.e., having waking-up interrupts pending
while entering a sleep may be not too pleasant. "writel(0xff,
S5P_WKUP_INT_PEND**_**);" will do the work. I don't sure whether this
is really "required" for recent S5PV210/S5PC110; however, clearing
pending interrupts improved the stability for the old release of
S5PC110.

>> +
>> + =C2=A0 =C2=A0 s3c_pm_do_save(s5pv210_core_save, ARRAY_SIZE(s5pv210=
_core_save));
>> +}
>> +
>> +static int s5pv210_pm_add(struct sys_device *sysdev)
>> +{
>> + =C2=A0 =C2=A0 pm_cpu_prep =3D s5pv210_pm_prepare;
>> + =C2=A0 =C2=A0 pm_cpu_sleep =3D s5pv210_cpu_suspend;
>> +
>> + =C2=A0 =C2=A0 return 0;
>> +}
>> +
>> +static int s5pv210_pm_resume(struct sys_device *dev)
>> +{
>> + =C2=A0 =C2=A0 u32 tmp;
>> +
>> + =C2=A0 =C2=A0 tmp =3D __raw_readl(S5P_OTHERS);
>> + =C2=A0 =C2=A0 tmp |=3D (S5P_OTHERS_RET_IO | S5P_OTHERS_RET_CF | \
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 S5P_OTHERS_RET_MMC | S5P=
_OTHERS_RET_UART);
>> + =C2=A0 =C2=A0 __raw_writel(tmp , S5P_OTHERS);
>> +
>> + =C2=A0 =C2=A0 s3c_pm_do_restore_core(s5pv210_core_save, ARRAY_SIZE=
(s5pv210_core_save));
>> +
>> + =C2=A0 =C2=A0 return 0;
>> +}

I don't know how may "printk"s exist after s3c_pm_enter is returned
and before this resume function is called. However, printk's (and
debug messages) between these two often generate broken characters on
UART terminal. It may be better if S5P_OTHERS setting is done much
earlier; e.g., at arch/arm/plat-samsung/pm.c:s3c_pm_enter.

However, this operation may be done at the boot-loader; in such a
case, this doesn't matter at all.

>> +
>> +static struct sysdev_driver s5pv210_pm_driver =3D {
>> + =C2=A0 =C2=A0 .add =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D s5=
pv210_pm_add,
>> + =C2=A0 =C2=A0 .resume =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D s5pv210_pm_r=
esume,
>> +};
>> +
>> +static __init int s5pv210_pm_drvinit(void)
>> +{
>> + =C2=A0 =C2=A0 return sysdev_driver_register(&s5pv210_sysclass, &s5=
pv210_pm_driver);
>> +}
>> +arch_initcall(s5pv210_pm_drvinit);
>> diff --git a/arch/arm/mach-s5pv210/sleep.S b/arch/arm/mach-s5pv210/s=
leep.S
>> new file mode 100644
>> index 0000000..b7f8272
>> --- /dev/null
>> +++ b/arch/arm/mach-s5pv210/sleep.S
>> @@ -0,0 +1,166 @@
>> +/* linux/arch/arm/mach-s5pv210/sleep.S
>> + *
>> + * Copyright (c) 2010 Samsung Electronics Co., Ltd.
>> + * =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 http://www.samsung.com
>> + *
>> + * S5PV210 power Manager (Suspend-To-RAM) support
>> + *
>> + * Based on S3C2410 sleep code by:
>> + * =C2=A0 Ben Dooks, (c) 2004 Simtec Electronics
>> + *
>> + * Based on PXA/SA1100 sleep code by:
>> + * =C2=A0 Nicolas Pitre, (c) 2002 Monta Vista Software Inc
>> + * =C2=A0 Cliff Brake, (c) 2001
>> + *
>> + * This program is free software; you can redistribute it and/or mo=
dify
>> + * it under the terms of the GNU General Public License as publishe=
d by
>> + * the Free Software Foundation; either version 2 of the License, o=
r
>> + * (at your option) any later version.
>> + *
>> + * This program is distributed in the hope that it will be useful,
>> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
>> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. =C2=A0See t=
he
>> + * GNU General Public License for more details.
>> + *
>> + * You should have received a copy of the GNU General Public Licens=
e
>> + * along with this program; if not, write to the Free Software
>> + * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA =C2=A00=
2111-1307 =C2=A0USA
>> +*/
>> +
>> +#include <linux/linkage.h>
>> +#include <asm/assembler.h>
>> +#include <asm/memory.h>
>> +
>> + =C2=A0 =C2=A0 .text
>> +
>> + =C2=A0 =C2=A0 /* s3c_cpu_save
>> + =C2=A0 =C2=A0 =C2=A0*
>> + =C2=A0 =C2=A0 =C2=A0* entry:
>> + =C2=A0 =C2=A0 =C2=A0* =C2=A0 =C2=A0 =C2=A0r0 =3D save address (vir=
tual addr of s3c_sleep_save_phys)
>> + =C2=A0 =C2=A0 */
>> +
>> +ENTRY(s3c_cpu_save)
>> +
>> + =C2=A0 =C2=A0 stmfd =C2=A0 sp!, { r3 - r12, lr }
>> +
>> + =C2=A0 =C2=A0 mrc =C2=A0 =C2=A0 p15, 0, r4, c13, c0, 0 =C2=A0@ FCS=
E/PID
>> + =C2=A0 =C2=A0 mrc =C2=A0 =C2=A0 p15, 0, r5, c3, c0, 0 =C2=A0 @ Dom=
ain ID
>> + =C2=A0 =C2=A0 mrc =C2=A0 =C2=A0 p15, 0, r6, c2, c0, 0 =C2=A0 @ Tra=
nslation Table BASE0
>> + =C2=A0 =C2=A0 mrc =C2=A0 =C2=A0 p15, 0, r7, c2, c0, 1 =C2=A0 @ Tra=
nslation Table BASE1
>> + =C2=A0 =C2=A0 mrc =C2=A0 =C2=A0 p15, 0, r8, c2, c0, 2 =C2=A0 @ Tra=
nslation Table Control
>> + =C2=A0 =C2=A0 mrc =C2=A0 =C2=A0 p15, 0, r9, c1, c0, 0 =C2=A0 @ Con=
trol register
>> + =C2=A0 =C2=A0 mrc =C2=A0 =C2=A0 p15, 0, r10, c1, c0, 1 =C2=A0@ Aux=
iliary control register
>> + =C2=A0 =C2=A0 mrc =C2=A0 =C2=A0 p15, 0, r11, c1, c0, 2 =C2=A0@ Co-=
processor access controls
>> + =C2=A0 =C2=A0 mrc =C2=A0 =C2=A0 p15, 0, r12, c10, c2, 0 @ Read PRR=
R
>> + =C2=A0 =C2=A0 mrc =C2=A0 =C2=A0 p15, 0, r3, c10, c2, 1 =C2=A0@ REA=
D NMRR
>> +
>> + =C2=A0 =C2=A0 stmia =C2=A0 r0, { r3 - r13 }
>> +
>> + =C2=A0 =C2=A0 bl =C2=A0 =C2=A0 =C2=A0s3c_pm_cb_flushcache
>> +
>> + =C2=A0 =C2=A0 ldr =C2=A0 =C2=A0 r0, =3Dpm_cpu_sleep
>> + =C2=A0 =C2=A0 ldr =C2=A0 =C2=A0 r0, [ r0 ]
>> + =C2=A0 =C2=A0 mov =C2=A0 =C2=A0 pc, r0
>> +
>> +resume_with_mmu:
>> + =C2=A0 =C2=A0 /* delete added mmu table list */
>
> hmm, where is this being added?
> also, a better description on what it is doing would be better.
>
>> + =C2=A0 =C2=A0 ldr =C2=A0 =C2=A0 r9 , =3D(PAGE_OFFSET - PHYS_OFFSET=
)
>> + =C2=A0 =C2=A0 add =C2=A0 =C2=A0 r4, r4, r9
>> + =C2=A0 =C2=A0 str =C2=A0 =C2=A0 r12, [r4]
>> +
>> + =C2=A0 =C2=A0 ldmfd =C2=A0 sp!, { r3 - r12, pc }
>> +
>> + =C2=A0 =C2=A0 .ltorg
>> +
>> + =C2=A0 =C2=A0 .data
>> +
>> + =C2=A0 =C2=A0 .global s3c_sleep_save_phys
>> +s3c_sleep_save_phys:
>> + =C2=A0 =C2=A0 .word =C2=A0 0
>> +
>> + =C2=A0 =C2=A0 /* sleep magic, to allow the bootloader to check for=
 an valid
>> + =C2=A0 =C2=A0 =C2=A0* image to resume to. Must be the first word b=
efore the
>> + =C2=A0 =C2=A0 =C2=A0* s3c_cpu_resume entry.
>> + =C2=A0 =C2=A0 */
>> +
>> + =C2=A0 =C2=A0 .word =C2=A0 0x2bedf00d
>> +
>> + =C2=A0 =C2=A0 /* s3c_cpu_resume
>> + =C2=A0 =C2=A0 =C2=A0*
>> + =C2=A0 =C2=A0 =C2=A0* resume code entry for bootloader to call
>> + =C2=A0 =C2=A0 =C2=A0*
>> + =C2=A0 =C2=A0 =C2=A0* we must put this code here in the data segme=
nt as we have no
>> + =C2=A0 =C2=A0 =C2=A0* other way of restoring the stack pointer aft=
er sleep, and we
>> + =C2=A0 =C2=A0 =C2=A0* must not write to the code segment (code is =
read-only)
>> + =C2=A0 =C2=A0 */
>> +
>> +ENTRY(s3c_cpu_resume)
>> + =C2=A0 =C2=A0 mov =C2=A0 =C2=A0 r0, #PSR_I_BIT | PSR_F_BIT | SVC_M=
ODE
>> + =C2=A0 =C2=A0 msr =C2=A0 =C2=A0 cpsr_c, r0
>> +
>> + =C2=A0 =C2=A0 mov =C2=A0 =C2=A0 r1, #0
>> + =C2=A0 =C2=A0 mcr =C2=A0 =C2=A0 p15, 0, r1, c8, c7, 0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 @@ invalidate TLBs
>> + =C2=A0 =C2=A0 mcr =C2=A0 =C2=A0 p15, 0, r1, c7, c5, 0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 @@ invalidate I Cache
>> +
>> + =C2=A0 =C2=A0 ldr =C2=A0 =C2=A0 r0, s3c_sleep_save_phys =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 @ address of restore block
>> + =C2=A0 =C2=A0 ldmia =C2=A0 r0, { r3 - r13 }
>> +
>> + =C2=A0 =C2=A0 mcr =C2=A0 =C2=A0 p15, 0, r4, c13, c0, 0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0@ FCSE/PID
>> + =C2=A0 =C2=A0 mcr =C2=A0 =C2=A0 p15, 0, r5, c3, c0, 0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 @ Domain ID
>> +
>> + =C2=A0 =C2=A0 mcr =C2=A0 =C2=A0 p15, 0, r8, c2, c0, 2 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 @ Translation Table Control
>> + =C2=A0 =C2=A0 mcr =C2=A0 =C2=A0 p15, 0, r7, c2, c0, 1 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 @ Translation Table BASE1
>> + =C2=A0 =C2=A0 mcr =C2=A0 =C2=A0 p15, 0, r6, c2, c0, 0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 @ Translation Table BASE0
>> +
>> + =C2=A0 =C2=A0 mcr =C2=A0 =C2=A0 p15, 0, r10, c1, c0, 1 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0@ Auxiliary control register
>> +
>> + =C2=A0 =C2=A0 mov =C2=A0 =C2=A0 r0, #0
>> + =C2=A0 =C2=A0 mcr =C2=A0 =C2=A0 p15, 0, r0, c8, c7, 0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 @ Invalidate I & D TLB
>> +
>> + =C2=A0 =C2=A0 mov =C2=A0 =C2=A0 r0, #0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0@ restor=
e copro access
>> + =C2=A0 =C2=A0 mcr =C2=A0 =C2=A0 p15, 0, r11, c1, c0, 2 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0@ Co-processor access
>> + =C2=A0 =C2=A0 mcr =C2=A0 =C2=A0 p15, 0, r0, c7, c5, 4
>> +
>> + =C2=A0 =C2=A0 mcr =C2=A0 =C2=A0 p15, 0, r12, c10, c2, 0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 @ write PRRR
>> + =C2=A0 =C2=A0 mcr =C2=A0 =C2=A0 p15, 0, r3, c10, c2, 1 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0@ write NMRR
>> +
>> + =C2=A0 =C2=A0 /* Calculate first section address into r8
>> + =C2=A0 =C2=A0 =C2=A0* In Cotex-A8 case, When MMU turn on, MMU is r=
eseted.
>
> i'd fix this typo.
>
>> + =C2=A0 =C2=A0 =C2=A0* So, before call resume_with_mmu, backup orig=
inally data.
>> + =C2=A0 =C2=A0 */
>> +
>> + =C2=A0 =C2=A0 mov =C2=A0 =C2=A0 r4, r6
>> + =C2=A0 =C2=A0 mov =C2=A0 =C2=A0 r4, r4, LSR #14
>> + =C2=A0 =C2=A0 mov =C2=A0 =C2=A0 r4, r4, LSL #14
>> +
>> + =C2=A0 =C2=A0 /* Load TLB Base address from INFORM0 */
>
> do you mean mmu page table?
>
>> + =C2=A0 =C2=A0 ldr =C2=A0 =C2=A0 r11, =3D0xe010f000
>> + =C2=A0 =C2=A0 ldr =C2=A0 =C2=A0 r10, [r11, #0]
>> + =C2=A0 =C2=A0 mov =C2=A0 =C2=A0 r10, r10, LSR #18
>> + =C2=A0 =C2=A0 bic =C2=A0 =C2=A0 r10, r10, #0x3
>> + =C2=A0 =C2=A0 orr =C2=A0 =C2=A0 r4, r4, r10
>> +
>> + =C2=A0 =C2=A0 /* calculate mmu list value into r9 */
>> + =C2=A0 =C2=A0 mov =C2=A0 =C2=A0 r10, r10, LSL #18
>> + =C2=A0 =C2=A0 ldr =C2=A0 =C2=A0 r5, =3D0x40e
>> + =C2=A0 =C2=A0 orr =C2=A0 =C2=A0 r10, r10, r5
>> +
>> + =C2=A0 =C2=A0 /* back up originally data */
>> +
>> + =C2=A0 =C2=A0 ldr =C2=A0 =C2=A0 r12, [r4]
>> +
>> + =C2=A0 =C2=A0 /* Added list about mmu */
>> + =C2=A0 =C2=A0 str =C2=A0 =C2=A0 r10, [r4]
>
>
>
>> + =C2=A0 =C2=A0 ldr =C2=A0 =C2=A0 r2, =3Dresume_with_mmu
>> + =C2=A0 =C2=A0 mcr =C2=A0 =C2=A0 p15, 0, r9, c1, c0, 0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 @ turn on MMU, etc
>> +
>> + =C2=A0 =C2=A0 nop
>> + =C2=A0 =C2=A0 nop
>> + =C2=A0 =C2=A0 nop
>> + =C2=A0 =C2=A0 nop
>> + =C2=A0 =C2=A0 nop =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 @ second-to-last before mmu
>> +
>> + =C2=A0 =C2=A0 mov =C2=A0 =C2=A0 pc, r2 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0@ go bac=
k to virtual address
>> +
>> + =C2=A0 =C2=A0 .ltorg
>> diff --git a/arch/arm/plat-s5p/Makefile b/arch/arm/plat-s5p/Makefile
>> index 39c242b..d04ae49 100644
>> --- a/arch/arm/plat-s5p/Makefile
>> +++ b/arch/arm/plat-s5p/Makefile
>> @@ -18,3 +18,5 @@ obj-y =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 +=3D clock.=
o
>> =C2=A0obj-y =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0+=3D irq.o
>> =C2=A0obj-$(CONFIG_S5P_EXT_INT) =C2=A0 =C2=A0+=3D irq-eint.o
>>
>> +obj-$(CONFIG_PM) =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 +=3D pm.=
o
>> +obj-$(CONFIG_PM) =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 +=3D irq=
-pm.o
>> diff --git a/arch/arm/plat-s5p/include/plat/irqs.h b/arch/arm/plat-s=
5p/include/plat/irqs.h
>> index 3fb3a3a..9ffdd62 100644
>> --- a/arch/arm/plat-s5p/include/plat/irqs.h
>> +++ b/arch/arm/plat-s5p/include/plat/irqs.h
>> @@ -94,4 +94,6 @@
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 ((irq) - S5P_EINT_BASE1) : \
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 ((irq) + 16 - S5P_EINT_BASE2))
>>
>> +#define IRQ_EINT_BIT(x) =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0EINT_OFFSET(x)
>> +
>> =C2=A0#endif /* __ASM_PLAT_S5P_IRQS_H */
>> diff --git a/arch/arm/plat-s5p/irq-pm.c b/arch/arm/plat-s5p/irq-pm.c
>> new file mode 100644
>> index 0000000..03e83a3
>> --- /dev/null
>> +++ b/arch/arm/plat-s5p/irq-pm.c
>> @@ -0,0 +1,108 @@
>> +/* linux/arch/arm/plat-s5p/irq-pm.c
>> + *
>> + * Copyright (c) 2010 Samsung Electronics Co., Ltd.
>> + * =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 http://www.samsung.com
>> + *
>> + * Based on arch/arm/plat-s3c24xx/irq-pm.c,
>> + * Copyright (c) 2003,2004 Simtec Electronics
>> + * =C2=A0 Ben Dooks <ben@simtec.co.uk>
>> + * =C2=A0 http://armlinux.simtec.co.uk/
>> + *
>> + * This program is free software; you can redistribute it and/or mo=
dify
>> + * it under the terms of the GNU General Public License version 2 a=
s
>> + * published by the Free Software Foundation.
>> +*/
>> +
>> +#include <linux/init.h>
>> +#include <linux/module.h>
>> +#include <linux/interrupt.h>
>> +#include <linux/sysdev.h>
>> +
>> +#include <plat/cpu.h>
>> +#include <plat/irqs.h>
>> +#include <plat/pm.h>
>> +#include <mach/map.h>
>> +
>> +#include <mach/regs-gpio.h>
>> +#include <mach/regs-irq.h>
>> +
>> +/* state for IRQs over sleep */
>> +
>> +/* default is to allow for EINT0..EINT31, and IRQ_RTC_TIC, IRQ_RTC_=
ALARM,
>> + * as wakeup sources
>> + *
>> + * set bit to 1 in allow bitfield to enable the wakeup settings on =
it
>> +*/
>> +
>> +unsigned long s3c_irqwake_intallow =C2=A0 =3D 0x00000006L;
>> +unsigned long s3c_irqwake_eintallow =C2=A0=3D 0xffffffffL;
>> +
>> +int s3c_irq_wake(unsigned int irqno, unsigned int state)
>> +{
>> + =C2=A0 =C2=A0 unsigned long irqbit;
>> +
>> + =C2=A0 =C2=A0 switch (irqno) {
>> + =C2=A0 =C2=A0 case IRQ_RTC_TIC:
>> + =C2=A0 =C2=A0 case IRQ_RTC_ALARM:
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 irqbit =3D 1 << (irqno +=
 1 - IRQ_RTC_ALARM);
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!state)
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 s3c_irqwake_intmask |=3D irqbit;
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 s3c_irqwake_intmask &=3D ~irqbit;
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;
>> + =C2=A0 =C2=A0 default:
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -ENOENT;
>> + =C2=A0 =C2=A0 }
>> + =C2=A0 =C2=A0 return 0;
>> +}
>> +
>> +/* this lot should be really saved by the IRQ code */
>> +/* VICXADDRESSXX initilaization to be needed */
>> +static struct sleep_save irq_save[] =3D {
>> + =C2=A0 =C2=A0 SAVE_ITEM(VA_VIC0 + VIC_INT_SELECT),
>> + =C2=A0 =C2=A0 SAVE_ITEM(VA_VIC1 + VIC_INT_SELECT),
>> +
>> + =C2=A0 =C2=A0 SAVE_ITEM(VA_VIC0 + VIC_INT_ENABLE),
>> + =C2=A0 =C2=A0 SAVE_ITEM(VA_VIC1 + VIC_INT_ENABLE),
>> +
>> + =C2=A0 =C2=A0 SAVE_ITEM(VA_VIC0 + VIC_INT_SOFT),
>> + =C2=A0 =C2=A0 SAVE_ITEM(VA_VIC1 + VIC_INT_SOFT),

S5PV210 has VIC2,3 as well. Maybe those can be moved from pm.c to here.

>> +};
>> +
>> +static struct sleep_save eint_save[] =3D {
>> + =C2=A0 =C2=A0 SAVE_ITEM(S5P_EINT_CON(0)),
>> + =C2=A0 =C2=A0 SAVE_ITEM(S5P_EINT_CON(1)),
>> + =C2=A0 =C2=A0 SAVE_ITEM(S5P_EINT_CON(2)),
>> + =C2=A0 =C2=A0 SAVE_ITEM(S5P_EINT_CON(3)),
>> +
>> + =C2=A0 =C2=A0 SAVE_ITEM(S5P_EINT_FLTCON(0)),
>> + =C2=A0 =C2=A0 SAVE_ITEM(S5P_EINT_FLTCON(1)),
>> + =C2=A0 =C2=A0 SAVE_ITEM(S5P_EINT_FLTCON(2)),
>> + =C2=A0 =C2=A0 SAVE_ITEM(S5P_EINT_FLTCON(3)),
>> + =C2=A0 =C2=A0 SAVE_ITEM(S5P_EINT_FLTCON(4)),
>> + =C2=A0 =C2=A0 SAVE_ITEM(S5P_EINT_FLTCON(5)),
>> + =C2=A0 =C2=A0 SAVE_ITEM(S5P_EINT_FLTCON(6)),
>> + =C2=A0 =C2=A0 SAVE_ITEM(S5P_EINT_FLTCON(7)),
>> +
>> + =C2=A0 =C2=A0 SAVE_ITEM(S5P_EINT_MASK(0)),
>> + =C2=A0 =C2=A0 SAVE_ITEM(S5P_EINT_MASK(1)),
>> + =C2=A0 =C2=A0 SAVE_ITEM(S5P_EINT_MASK(2)),
>> + =C2=A0 =C2=A0 SAVE_ITEM(S5P_EINT_MASK(3)),
>> +};
>> +
>> +int s3c24xx_irq_suspend(struct sys_device *dev, pm_message_t state)
>> +{
>> + =C2=A0 =C2=A0 s3c_pm_do_save(eint_save, ARRAY_SIZE(eint_save));
>> + =C2=A0 =C2=A0 s3c_pm_do_save(irq_save, ARRAY_SIZE(irq_save));
>> +
>> + =C2=A0 =C2=A0 return 0;
>> +}
>> +
>> +int s3c24xx_irq_resume(struct sys_device *dev)
>> +{
>> + =C2=A0 =C2=A0 s3c_pm_do_restore(irq_save, ARRAY_SIZE(irq_save));
>> + =C2=A0 =C2=A0 s3c_pm_do_restore(eint_save, ARRAY_SIZE(eint_save));
>> +
>> + =C2=A0 =C2=A0 return 0;
>> +}
>> +
>> diff --git a/arch/arm/plat-s5p/pm.c b/arch/arm/plat-s5p/pm.c
>> new file mode 100644
>> index 0000000..d592b63
>> --- /dev/null
>> +++ b/arch/arm/plat-s5p/pm.c
>> @@ -0,0 +1,52 @@
>> +/* linux/arch/arm/plat-s5p/pm.c
>> + *
>> + * Copyright (c) 2010 Samsung Electronics Co., Ltd.
>> + * =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 http://www.samsung.com
>> + *
>> + * S5P Power Manager (Suspend-To-RAM) support
>> + *
>> + * Based on arch/arm/plat-s3c24xx/pm.c
>> + * Copyright (c) 2004,2006 Simtec Electronics
>> + * =C2=A0 Ben Dooks <ben@simtec.co.uk>
>> + *
>> + * This program is free software; you can redistribute it and/or mo=
dify
>> + * it under the terms of the GNU General Public License version 2 a=
s
>> + * published by the Free Software Foundation.
>> +*/
>> +
>> +#include <linux/suspend.h>
>> +#include <plat/pm.h>
>> +
>> +#define PFX "s5p pm: "
>> +
>> +/* s3c_pm_check_resume_pin
>> + *
>> + * check to see if the pin is configured correctly for sleep mode, =
and
>> + * make any necessary adjustments if it is not
>> +*/
>> +
>> +static void s3c_pm_check_resume_pin(unsigned int pin, unsigned int =
irqoffs)
>> +{
>> + =C2=A0 =C2=A0 /* nothing here yet */
>> +}
>> +
>> +/* s3c_pm_configure_extint
>> + *
>> + * configure all external interrupt pins
>> +*/
>> +
>> +void s3c_pm_configure_extint(void)
>> +{
>> + =C2=A0 =C2=A0 /* nothing here yet */
>> +}
>> +
>> +void s3c_pm_restore_core(void)
>> +{
>> + =C2=A0 =C2=A0 /* nothing here yet */
>> +}
>> +
>> +void s3c_pm_save_core(void)
>> +{
>> + =C2=A0 =C2=A0 /* nothing here yet */
>> +}
>> +
>> diff --git a/arch/arm/plat-samsung/pm-gpio.c b/arch/arm/plat-samsung=
/pm-gpio.c
>> index 7df03f8..9652820 100644
>> --- a/arch/arm/plat-samsung/pm-gpio.c
>> +++ b/arch/arm/plat-samsung/pm-gpio.c
>> @@ -192,7 +192,7 @@ struct s3c_gpio_pm s3c_gpio_pm_2bit =3D {
>> =C2=A0 =C2=A0 =C2=A0 .resume =3D s3c_gpio_pm_2bit_resume,
>> =C2=A0};
>>
>> -#ifdef CONFIG_ARCH_S3C64XX
>> +#if defined(CONFIG_ARCH_S3C64XX) || defined(CONFIG_PLAT_S5P)
>> =C2=A0static void s3c_gpio_pm_4bit_save(struct s3c_gpio_chip *chip)
>> =C2=A0{
>> =C2=A0 =C2=A0 =C2=A0 chip->pm_save[1] =3D __raw_readl(chip->base + O=
=46FS_CON);
>> @@ -302,7 +302,7 @@ struct s3c_gpio_pm s3c_gpio_pm_4bit =3D {
>> =C2=A0 =C2=A0 =C2=A0 .save =C2=A0 =3D s3c_gpio_pm_4bit_save,
>> =C2=A0 =C2=A0 =C2=A0 .resume =3D s3c_gpio_pm_4bit_resume,
>> =C2=A0};
>> -#endif /* CONFIG_ARCH_S3C64XX */
>> +#endif /* CONFIG_ARCH_S3C64XX || CONFIG_PLAT_S5P */
>>
>> =C2=A0/**
>> =C2=A0 * s3c_pm_save_gpio() - save gpio chip data for suspend
>> --
>> 1.6.2.5
>>
>
>
> --
> --
> Ben
>
> Q: =C2=A0 =C2=A0 =C2=A0What's a light-year?
> A: =C2=A0 =C2=A0 =C2=A0One-third less calories than a regular year.
>
>
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
>



--=20
MyungJoo Ham (=ED=95=A8=EB=AA=85=EC=A3=BC), Ph.D.
Mobile Software Platform Lab,
Digital Media and Communications (DMC) Business
Samsung Electronics
cell: 82-10-6714-2858
