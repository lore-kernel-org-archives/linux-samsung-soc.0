From: Kyungmin Park <kmpark@infradead.org>
Subject: Re: [PATCH v3] ARM: S5PV210: Add Power Management Support
Date: Fri, 17 Sep 2010 14:43:50 +0900
Message-ID: <AANLkTi=xowkbs2BgEZ1Rw2MTu4jtP3VR=1R-fSE_sDmK@mail.gmail.com>
References: <1284539598-7917-1-git-send-email-sbkim73@samsung.com>
	<AANLkTiksQDVAeac-dNeK6HH1wviYbMLdFhOSnSg_-=87@mail.gmail.com>
	<010801cb5629$c318c760$494a5620$@com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ww0-f44.google.com ([74.125.82.44]:47864 "EHLO
	mail-ww0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752296Ab0IQFnw convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 17 Sep 2010 01:43:52 -0400
Received: by wwb39 with SMTP id 39so378022wwb.1
        for <linux-samsung-soc@vger.kernel.org>; Thu, 16 Sep 2010 22:43:50 -0700 (PDT)
In-Reply-To: <010801cb5629$c318c760$494a5620$@com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sangbeom Kim <sbkim73@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, ben-linux@fluff.org, kgene.kim@samsung.com, Jongpill Lee <boyko.lee@samsung.com>, =?UTF-8?B?7ZWo66qF7KO8?= <myungjoo.ham@samsung.com>, Lukasz Majewski <l.majewski@samsung.com>

2010/9/17 Sangbeom Kim <sbkim73@samsung.com>:
>
>
> Kyungmin Park wrote:
>
>>On Wed, Sep 15, 2010 at 5:33 PM, Sangbeom Kim <sbkim73@samsung.com> w=
rote:
>>> From: Jongpill Lee <boyko.lee@samsung.com>
>>>
>>> This patch adds suspend-to-ram support for S5PV210.
>>> Note. This patch is confirmed on SMDKV210 and SMDKC110 board.
>>>
>>> Signed-off-by: Jongpill Lee <boyko.lee@samsung.com>
>>> Signed-off-by: Sangbeom Kim <sbkim73@samsung.com>
>>> ---
>>> Changes since v2:
>>> 1. Fixed comments as per commnets from Ben Dooks
>>> 2. Removed backup and restore function for VIC 2 and 3
>>>
>>> Changes since v1:
>>> 1. Fixed comments as per comments from Ben Dooks
>>> 2. Removed redunt #if defined(CONFIG_PM)
>>> 3. Removed redunt including header files
>>> 4. Removed <mach/pm.h> and <plat/pm-s5p.h>
>>> 5. Moved 's5pv210_core_save' into machine directory
>>> 6. Moved sleep.S into machine directory for S5P SoCs compatibility
>>> 7. Added CF retension configuration when wake-up
>>>
>>>
>>> =A0arch/arm/mach-s5pv210/Kconfig =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 | =A0 =A06 +
>>> =A0arch/arm/mach-s5pv210/Makefile =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
| =A0 =A01 +
>>> =A0arch/arm/mach-s5pv210/include/mach/pm-core.h =A0 =A0| =A0 43 +++=
+++
>>> =A0arch/arm/mach-s5pv210/include/mach/regs-clock.h | =A0 =A07 +-
>>> =A0arch/arm/mach-s5pv210/mach-smdkc110.c =A0 =A0 =A0 =A0 =A0 | =A0 =
=A03 +
>>> =A0arch/arm/mach-s5pv210/mach-smdkv210.c =A0 =A0 =A0 =A0 =A0 | =A0 =
=A03 +
>>> =A0arch/arm/mach-s5pv210/pm.c =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0| =A0166
>>++++++++++++++++++++++
>>> =A0arch/arm/mach-s5pv210/sleep.S =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 | =A0171
>>+++++++++++++++++++++++
>>> =A0arch/arm/plat-s5p/Makefile =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0| =A0 =A02 +
>>> =A0arch/arm/plat-s5p/include/plat/irqs.h =A0 =A0 =A0 =A0 =A0 | =A0 =
=A01 +
>>> =A0arch/arm/plat-s5p/irq-pm.c =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0| =A0 93 ++++++++++++
>>> =A0arch/arm/plat-s5p/pm.c =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0| =A0 52 +++++++
>>> =A0arch/arm/plat-samsung/pm-gpio.c =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
| =A0 =A04 +-
>>> =A013 files changed, 548 insertions(+), 4 deletions(-)
>>> =A0create mode 100644 arch/arm/mach-s5pv210/include/mach/pm-core.h
>>> =A0create mode 100644 arch/arm/mach-s5pv210/pm.c
>>> =A0create mode 100644 arch/arm/mach-s5pv210/sleep.S
>>> =A0create mode 100644 arch/arm/plat-s5p/irq-pm.c
>>> =A0create mode 100644 arch/arm/plat-s5p/pm.c
>>>
>>> diff --git a/arch/arm/mach-s5pv210/Kconfig b/arch/arm/mach-
>>s5pv210/Kconfig
>>> index b46925b..6649170 100644
>>> --- a/arch/arm/mach-s5pv210/Kconfig
>>> +++ b/arch/arm/mach-s5pv210/Kconfig
>>> @@ -14,6 +14,7 @@ config CPU_S5PV210
>>> =A0 =A0 =A0 =A0select PLAT_S5P
>>> =A0 =A0 =A0 =A0select S3C_PL330_DMA
>>> =A0 =A0 =A0 =A0select S5P_EXT_INT
>>> + =A0 =A0 =A0 select S5PV210_PM if PM
>>> =A0 =A0 =A0 =A0help
>>> =A0 =A0 =A0 =A0 =A0Enable S5PV210 CPU support
>>>
>>> @@ -138,4 +139,9 @@ config MACH_SMDKV210
>>>
>>> =A0endmenu
>>>
>>> +config S5PV210_PM
>>> + =A0 =A0 =A0 bool
>>> + =A0 =A0 =A0 help
>>> + =A0 =A0 =A0 =A0 Power Management code common to S5PV210
>>> +
>>> =A0endif
>>> diff --git a/arch/arm/mach-s5pv210/Makefile b/arch/arm/mach-
>>s5pv210/Makefile
>>> index 7045489..c63c162 100644
>>> --- a/arch/arm/mach-s5pv210/Makefile
>>> +++ b/arch/arm/mach-s5pv210/Makefile
>>> @@ -14,6 +14,7 @@ obj- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0:=3D
>>>
>>> =A0obj-$(CONFIG_CPU_S5PV210) =A0 =A0 =A0+=3D cpu.o init.o clock.o d=
ma.o gpiolib.o
>>> =A0obj-$(CONFIG_CPU_S5PV210) =A0 =A0 =A0+=3D setup-i2c0.o
>>> +obj-$(CONFIG_S5PV210_PM) =A0 =A0 =A0 +=3D pm.o sleep.o
>>>
>>> =A0# machine support
>>>
>>> diff --git a/arch/arm/mach-s5pv210/include/mach/pm-core.h
>>b/arch/arm/mach-s5pv210/include/mach/pm-core.h
>>> new file mode 100644
>>> index 0000000..e8d394f
>>> --- /dev/null
>>> +++ b/arch/arm/mach-s5pv210/include/mach/pm-core.h
>>> @@ -0,0 +1,43 @@
>>> +/* linux/arch/arm/mach-s5pv210/include/mach/pm-core.h
>>> + *
>>> + * Copyright (c) 2010 Samsung Electronics Co., Ltd.
>>> + * =A0 =A0 =A0 =A0 =A0 =A0 http://www.samsung.com
>>> + *
>>> + * Based on arch/arm/mach-s3c2410/include/mach/pm-core.h,
>>> + * Copyright 2008 Simtec Electronics
>>> + * =A0 =A0 =A0Ben Dooks <ben@simtec.co.uk>
>>> + * =A0 =A0 =A0http://armlinux.simtec.co.uk/
>>> + *
>>> + * S5PV210 - PM core support for arch/arm/plat-s5p/pm.c
>>> + *
>>> + * This program is free software; you can redistribute it and/or m=
odify
>>> + * it under the terms of the GNU General Public License version 2 =
as
>>> + * published by the Free Software Foundation.
>>> +*/
>>> +
>>> +static inline void s3c_pm_debug_init_uart(void)
>>> +{
>>> + =A0 =A0 =A0 /* nothing here yet */
>>> +}
>>> +
>>> +static inline void s3c_pm_arch_prepare_irqs(void)
>>> +{
>>> + =A0 =A0 =A0 __raw_writel(s3c_irqwake_intmask, S5P_WAKEUP_MASK);
>>> + =A0 =A0 =A0 __raw_writel(s3c_irqwake_eintmask, S5P_EINT_WAKEUP_MA=
SK);
>>> +}
>>> +
>>> +static inline void s3c_pm_arch_stop_clocks(void)
>>> +{
>>> + =A0 =A0 =A0 /* nothing here yet */
>>> +}
>>> +
>>> +static inline void s3c_pm_arch_show_resume_irqs(void)
>>> +{
>>> + =A0 =A0 =A0 /* nothing here yet */
>>> +}
>>> +
>>> +static inline void s3c_pm_arch_update_uart(void __iomem *regs,
>>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0struct pm_uart_save *save)
>>> +{
>>> + =A0 =A0 =A0 /* nothing here yet */
>>> +}
>>> diff --git a/arch/arm/mach-s5pv210/include/mach/regs-clock.h
>>b/arch/arm/mach-s5pv210/include/mach/regs-clock.h
>>> index 499aef7..929fd3a 100644
>>> --- a/arch/arm/mach-s5pv210/include/mach/regs-clock.h
>>> +++ b/arch/arm/mach-s5pv210/include/mach/regs-clock.h
>>> @@ -95,7 +95,7 @@
>>> =A0/* Registers related to power management */
>>> =A0#define S5P_PWR_CFG =A0 =A0 =A0 =A0 =A0 =A0S5P_CLKREG(0xC000)
>>> =A0#define S5P_EINT_WAKEUP_MASK =A0 S5P_CLKREG(0xC004)
>>> -#define S5P_WAKEUP_MASK =A0 =A0 =A0 =A0S5P_CLKREG(0xC008)
>>> +#define S5P_WAKEUP_MASK =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0S5P_CLKREG(=
0xC008)
>>> =A0#define S5P_PWR_MODE =A0 =A0 =A0 =A0 =A0 S5P_CLKREG(0xC00C)
>>> =A0#define S5P_NORMAL_CFG =A0 =A0 =A0 =A0 S5P_CLKREG(0xC010)
>>> =A0#define S5P_IDLE_CFG =A0 =A0 =A0 =A0 =A0 S5P_CLKREG(0xC020)
>>> @@ -159,8 +159,11 @@
>>> =A0#define S5P_SLEEP_CFG_USBOSC_EN =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0(=
1 << 1)
>>>
>>> =A0/* OTHERS Resgister */
>>> +#define S5P_OTHERS_RET_IO =A0 =A0 =A0 =A0 =A0 =A0 =A0(1 << 31)
>>> +#define S5P_OTHERS_RET_CF =A0 =A0 =A0 =A0 =A0 =A0 =A0(1 << 30)
>>> +#define S5P_OTHERS_RET_MMC =A0 =A0 =A0 =A0 =A0 =A0 (1 << 29)
>>> +#define S5P_OTHERS_RET_UART =A0 =A0 =A0 =A0 =A0 =A0(1 << 28)
>>> =A0#define S5P_OTHERS_USB_SIG_MASK =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0(=
1 << 16)
>>> -#define S5P_OTHERS_MIPI_DPHY_EN =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0(1 =
<< 28)
>>>
>>> =A0/* MIPI */
>>> =A0#define S5P_MIPI_DPHY_EN =A0 =A0 =A0 =A0 =A0 =A0 =A0 (3)
>>> diff --git a/arch/arm/mach-s5pv210/mach-smdkc110.c b/arch/arm/mach-
>>s5pv210/mach-smdkc110.c
>>> index 8211bb8..053b50d 100644
>>> --- a/arch/arm/mach-s5pv210/mach-smdkc110.c
>>> +++ b/arch/arm/mach-s5pv210/mach-smdkc110.c
>>> @@ -28,6 +28,7 @@
>>> =A0#include <plat/cpu.h>
>>> =A0#include <plat/ata.h>
>>> =A0#include <plat/iic.h>
>>> +#include <plat/pm.h>
>>>
>>> =A0/* Following are default values for UCON, ULCON and UFCON UART r=
egisters
>>*/
>>> =A0#define SMDKC110_UCON_DEFAULT =A0(S3C2410_UCON_TXILEVEL | =A0 =A0=
 =A0 =A0\
>>> @@ -110,6 +111,8 @@ static void __init smdkc110_map_io(void)
>>>
>>> =A0static void __init smdkc110_machine_init(void)
>>> =A0{
>>> + =A0 =A0 =A0 s3c_pm_init();
>>
>>Umm How about to add the cpu common code. e.g., mach-s5pv210/cpu.c? I=
f
>>chip support the pm feature. why not use it for each board?
>
>
> This issue has been discussed before.
> I followed Ben's comment.
> its operation depends on machine.
>
>>> +
>>> =A0 =A0 =A0 =A0s3c_i2c0_set_platdata(NULL);
>>> =A0 =A0 =A0 =A0s3c_i2c1_set_platdata(NULL);
>>> =A0 =A0 =A0 =A0s3c_i2c2_set_platdata(NULL);
>>> diff --git a/arch/arm/mach-s5pv210/mach-smdkv210.c b/arch/arm/mach-
>>s5pv210/mach-smdkv210.c
>>> index fbbc0a3..5a9c79c 100644
>>> --- a/arch/arm/mach-s5pv210/mach-smdkv210.c
>>> +++ b/arch/arm/mach-s5pv210/mach-smdkv210.c
>>> @@ -31,6 +31,7 @@
>>> =A0#include <plat/ata.h>
>>> =A0#include <plat/iic.h>
>>> =A0#include <plat/keypad.h>
>>> +#include <plat/pm.h>
>>>
>>> =A0/* Following are default values for UCON, ULCON and UFCON UART r=
egisters
>>*/
>>> =A0#define SMDKV210_UCON_DEFAULT =A0(S3C2410_UCON_TXILEVEL | =A0 =A0=
 =A0 =A0\
>>> @@ -145,6 +146,8 @@ static void __init smdkv210_map_io(void)
>>>
>>> =A0static void __init smdkv210_machine_init(void)
>>> =A0{
>>> + =A0 =A0 =A0 s3c_pm_init();
>>> +
>>> =A0 =A0 =A0 =A0samsung_keypad_set_platdata(&smdkv210_keypad_data);
>>> =A0 =A0 =A0 =A0s3c24xx_ts_set_platdata(&s3c_ts_platform);
>>>
>>> diff --git a/arch/arm/mach-s5pv210/pm.c b/arch/arm/mach-s5pv210/pm.=
c
>>> new file mode 100644
>>> index 0000000..549d792
>>> --- /dev/null
>>> +++ b/arch/arm/mach-s5pv210/pm.c
>>> @@ -0,0 +1,166 @@
>>> +/* linux/arch/arm/mach-s5pv210/pm.c
>>> + *
>>> + * Copyright (c) 2010 Samsung Electronics Co., Ltd.
>>> + * =A0 =A0 =A0 =A0 =A0 =A0 http://www.samsung.com
>>> + *
>>> + * S5PV210 - Power Management support
>>> + *
>>> + * Based on arch/arm/mach-s3c2410/pm.c
>>> + * Copyright (c) 2006 Simtec Electronics
>>> + * =A0 =A0 Ben Dooks <ben@simtec.co.uk>
>>> + *
>>> + * This program is free software; you can redistribute it and/or m=
odify
>>> + * it under the terms of the GNU General Public License version 2 =
as
>>> + * published by the Free Software Foundation.
>>> +*/
>>> +
>>> +#include <linux/init.h>
>>> +#include <linux/suspend.h>
>>> +#include <linux/io.h>
>>> +
>>> +#include <plat/cpu.h>
>>> +#include <plat/pm.h>
>>> +#include <plat/regs-timer.h>
>>> +
>>> +#include <mach/regs-irq.h>
>>> +#include <mach/regs-clock.h>
>>> +
>>> +static struct sleep_save s5pv210_core_save[] =3D {
>>> + =A0 =A0 =A0 /* Clock source */
>>> + =A0 =A0 =A0 SAVE_ITEM(S5P_CLK_SRC0),
>>> + =A0 =A0 =A0 SAVE_ITEM(S5P_CLK_SRC1),
>>> + =A0 =A0 =A0 SAVE_ITEM(S5P_CLK_SRC2),
>>> + =A0 =A0 =A0 SAVE_ITEM(S5P_CLK_SRC3),
>>> + =A0 =A0 =A0 SAVE_ITEM(S5P_CLK_SRC4),
>>> + =A0 =A0 =A0 SAVE_ITEM(S5P_CLK_SRC5),
>>> + =A0 =A0 =A0 SAVE_ITEM(S5P_CLK_SRC6),
>>> +
>>> + =A0 =A0 =A0 /* Clock source Mask */
>>> + =A0 =A0 =A0 SAVE_ITEM(S5P_CLK_SRC_MASK0),
>>> + =A0 =A0 =A0 SAVE_ITEM(S5P_CLK_SRC_MASK1),
>>> +
>>> + =A0 =A0 =A0 /* Clock Divider */
>>> + =A0 =A0 =A0 SAVE_ITEM(S5P_CLK_DIV0),
>>> + =A0 =A0 =A0 SAVE_ITEM(S5P_CLK_DIV1),
>>> + =A0 =A0 =A0 SAVE_ITEM(S5P_CLK_DIV2),
>>> + =A0 =A0 =A0 SAVE_ITEM(S5P_CLK_DIV3),
>>> + =A0 =A0 =A0 SAVE_ITEM(S5P_CLK_DIV4),
>>> + =A0 =A0 =A0 SAVE_ITEM(S5P_CLK_DIV5),
>>> + =A0 =A0 =A0 SAVE_ITEM(S5P_CLK_DIV6),
>>> + =A0 =A0 =A0 SAVE_ITEM(S5P_CLK_DIV7),
>>> +
>>> + =A0 =A0 =A0 /* Clock Main Gate */
>>> + =A0 =A0 =A0 SAVE_ITEM(S5P_CLKGATE_MAIN0),
>>> + =A0 =A0 =A0 SAVE_ITEM(S5P_CLKGATE_MAIN1),
>>> + =A0 =A0 =A0 SAVE_ITEM(S5P_CLKGATE_MAIN2),
>>> +
>>> + =A0 =A0 =A0 /* Clock source Peri Gate */
>>> + =A0 =A0 =A0 SAVE_ITEM(S5P_CLKGATE_PERI0),
>>> + =A0 =A0 =A0 SAVE_ITEM(S5P_CLKGATE_PERI1),
>>> +
>>> + =A0 =A0 =A0 /* Clock source SCLK Gate */
>>> + =A0 =A0 =A0 SAVE_ITEM(S5P_CLKGATE_SCLK0),
>>> + =A0 =A0 =A0 SAVE_ITEM(S5P_CLKGATE_SCLK1),
>>> +
>>> + =A0 =A0 =A0 /* Clock IP Clock gate */
>>> + =A0 =A0 =A0 SAVE_ITEM(S5P_CLKGATE_IP0),
>>> + =A0 =A0 =A0 SAVE_ITEM(S5P_CLKGATE_IP1),
>>> + =A0 =A0 =A0 SAVE_ITEM(S5P_CLKGATE_IP2),
>>> + =A0 =A0 =A0 SAVE_ITEM(S5P_CLKGATE_IP3),
>>> + =A0 =A0 =A0 SAVE_ITEM(S5P_CLKGATE_IP4),
>>> +
>>> + =A0 =A0 =A0 /* Clock Blcok and Bus gate */
>>> + =A0 =A0 =A0 SAVE_ITEM(S5P_CLKGATE_BLOCK),
>>> + =A0 =A0 =A0 SAVE_ITEM(S5P_CLKGATE_BUS0),
>>> +
>>> + =A0 =A0 =A0 /* Clock ETC */
>>> + =A0 =A0 =A0 SAVE_ITEM(S5P_CLK_OUT),
>>> + =A0 =A0 =A0 SAVE_ITEM(S5P_MDNIE_SEL),
>>> +
>>> + =A0 =A0 =A0 /* PWM Register */
>>> + =A0 =A0 =A0 SAVE_ITEM(S3C2410_TCFG0),
>>> + =A0 =A0 =A0 SAVE_ITEM(S3C2410_TCFG1),
>>> + =A0 =A0 =A0 SAVE_ITEM(S3C64XX_TINT_CSTAT),
>>> + =A0 =A0 =A0 SAVE_ITEM(S3C2410_TCON),
>>> + =A0 =A0 =A0 SAVE_ITEM(S3C2410_TCNTB(0)),
>>> + =A0 =A0 =A0 SAVE_ITEM(S3C2410_TCMPB(0)),
>>> + =A0 =A0 =A0 SAVE_ITEM(S3C2410_TCNTO(0)),
>>> +};
>>> +
>>> +void s5pv210_cpu_suspend(void)
>>> +{
>>> + =A0 =A0 =A0 unsigned long tmp;
>>> +
>>> + =A0 =A0 =A0 /* issue the standby signal into the pm unit. Note, w=
e
>>> + =A0 =A0 =A0 =A0* issue a write-buffer drain just in case */
>>> +
>>> + =A0 =A0 =A0 tmp =3D 0;
>>> +
>>> + =A0 =A0 =A0 asm("b 1f\n\t"
>>> + =A0 =A0 =A0 =A0 =A0 ".align 5\n\t"
>>> + =A0 =A0 =A0 =A0 =A0 "1:\n\t"
>>> + =A0 =A0 =A0 =A0 =A0 "mcr p15, 0, %0, c7, c10, 5\n\t"
>>> + =A0 =A0 =A0 =A0 =A0 "mcr p15, 0, %0, c7, c10, 4\n\t"
>>> + =A0 =A0 =A0 =A0 =A0 "wfi" : : "r" (tmp));
>>> +
>>> + =A0 =A0 =A0 /* we should never get past here */
>>> + =A0 =A0 =A0 panic("sleep resumed to originator?");
>>> +}
>>> +
>>> +static void s5pv210_pm_prepare(void)
>>> +{
>>> + =A0 =A0 =A0 unsigned int tmp;
>>> +
>>> + =A0 =A0 =A0 /* ensure at least INFORM0 has the resume address */
>>> + =A0 =A0 =A0 __raw_writel(virt_to_phys(s3c_cpu_resume), S5P_INFORM=
0);
>>> +
>>> + =A0 =A0 =A0 tmp =3D __raw_readl(S5P_SLEEP_CFG);
>>> + =A0 =A0 =A0 tmp &=3D ~(S5P_SLEEP_CFG_OSC_EN | S5P_SLEEP_CFG_USBOS=
C_EN);
>>> + =A0 =A0 =A0 __raw_writel(tmp, S5P_SLEEP_CFG);
>>> +
>>> + =A0 =A0 =A0 /* WFI for SLEEP mode configuration by SYSCON */
>>> + =A0 =A0 =A0 tmp =3D __raw_readl(S5P_PWR_CFG);
>>> + =A0 =A0 =A0 tmp &=3D S5P_CFG_WFI_CLEAN;
>>> + =A0 =A0 =A0 tmp |=3D S5P_CFG_WFI_SLEEP;
>>> + =A0 =A0 =A0 __raw_writel(tmp, S5P_PWR_CFG);
>>> +
>>> + =A0 =A0 =A0 /* SYSCON interrupt handling disable */
>>> + =A0 =A0 =A0 tmp =3D __raw_readl(S5P_OTHERS);
>>> + =A0 =A0 =A0 tmp |=3D S5P_OTHER_SYSC_INTOFF;
>>> + =A0 =A0 =A0 __raw_writel(tmp, S5P_OTHERS);
>>> +
>>> + =A0 =A0 =A0 s3c_pm_do_save(s5pv210_core_save, ARRAY_SIZE(s5pv210_=
core_save));
>>> +}
>>> +
>>> +static int s5pv210_pm_add(struct sys_device *sysdev)
>>> +{
>>> + =A0 =A0 =A0 pm_cpu_prep =3D s5pv210_pm_prepare;
>>> + =A0 =A0 =A0 pm_cpu_sleep =3D s5pv210_cpu_suspend;
>>> +
>>> + =A0 =A0 =A0 return 0;
>>> +}
>>> +
>>> +static int s5pv210_pm_resume(struct sys_device *dev)
>>> +{
>>> + =A0 =A0 =A0 u32 tmp;
>>> +
>>> + =A0 =A0 =A0 tmp =3D __raw_readl(S5P_OTHERS);
>>> + =A0 =A0 =A0 tmp |=3D (S5P_OTHERS_RET_IO | S5P_OTHERS_RET_CF |\
>>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 S5P_OTHERS_RET_MMC | S5P_OTHERS_RET_U=
ART);
>>> + =A0 =A0 =A0 __raw_writel(tmp , S5P_OTHERS);
>>> +
>>> + =A0 =A0 =A0 s3c_pm_do_restore_core(s5pv210_core_save,
>>ARRAY_SIZE(s5pv210_core_save));
>>> +
>>> + =A0 =A0 =A0 return 0;
>>> +}
>>> +
>>> +static struct sysdev_driver s5pv210_pm_driver =3D {
>>> + =A0 =A0 =A0 .add =A0 =A0 =A0 =A0 =A0 =A0=3D s5pv210_pm_add,
>>> + =A0 =A0 =A0 .resume =A0 =A0 =A0 =A0 =3D s5pv210_pm_resume,
>>> +};
>>> +
>>> +static __init int s5pv210_pm_drvinit(void)
>>> +{
>>> + =A0 =A0 =A0 return sysdev_driver_register(&s5pv210_sysclass,
>>&s5pv210_pm_driver);
>>> +}
>>> +arch_initcall(s5pv210_pm_drvinit);
>>> diff --git a/arch/arm/mach-s5pv210/sleep.S b/arch/arm/mach-
>>s5pv210/sleep.S
>>> new file mode 100644
>>> index 0000000..4124fd4
>>> --- /dev/null
>>> +++ b/arch/arm/mach-s5pv210/sleep.S
>>> @@ -0,0 +1,171 @@
>>> +/* linux/arch/arm/plat-s5p/sleep.S
>>> + *
>>> + * Copyright (c) 2010 Samsung Electronics Co., Ltd.
>>> + * =A0 =A0 =A0 =A0 =A0 =A0 http://www.samsung.com
>>> + *
>>> + * S5PV210 power Manager (Suspend-To-RAM) support
>>> + * Based on S3C2410 sleep code by:
>>> + * =A0 =A0 Ben Dooks, (c) 2004 Simtec Electronics
>>> + *
>>> + * Based on PXA/SA1100 sleep code by:
>>> + * =A0 =A0 Nicolas Pitre, (c) 2002 Monta Vista Software Inc
>>> + * =A0 =A0 Cliff Brake, (c) 2001
>>> + *
>>> + * This program is free software; you can redistribute it and/or m=
odify
>>> + * it under the terms of the GNU General Public License as publish=
ed by
>>> + * the Free Software Foundation; either version 2 of the License, =
or
>>> + * (at your option) any later version.
>>> + *
>>> + * This program is distributed in the hope that it will be useful,
>>> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
>>> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. =A0See the
>>> + * GNU General Public License for more details.
>>> + *
>>> + * You should have received a copy of the GNU General Public Licen=
se
>>> + * along with this program; if not, write to the Free Software
>>> + * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA =A0021=
11-
>>1307 =A0USA
>>> +*/
>>> +
>>> +#include <linux/linkage.h>
>>> +#include <asm/assembler.h>
>>> +#include <asm/memory.h>
>>> +
>>> + =A0 =A0 =A0 .text
>>> +
>>> + =A0 =A0 =A0 /* s3c_cpu_save
>>> + =A0 =A0 =A0 =A0*
>>> + =A0 =A0 =A0 =A0* entry:
>>> + =A0 =A0 =A0 =A0* =A0 =A0 =A0r0 =3D save address (virtual addr of =
s3c_sleep_save_phys)
>>> + =A0 =A0 =A0 */
>>> +
>>> +ENTRY(s3c_cpu_save)
>>> +
>>> + =A0 =A0 =A0 stmfd =A0 sp!, { r3 - r12, lr }
>>> +
>>> + =A0 =A0 =A0 mrc =A0 =A0 p15, 0, r4, c13, c0, 0 =A0@ FCSE/PID
>>> + =A0 =A0 =A0 mrc =A0 =A0 p15, 0, r5, c3, c0, 0 =A0 @ Domain ID
>>> + =A0 =A0 =A0 mrc =A0 =A0 p15, 0, r6, c2, c0, 0 =A0 @ Translation T=
able BASE0
>>> + =A0 =A0 =A0 mrc =A0 =A0 p15, 0, r7, c2, c0, 1 =A0 @ Translation T=
able BASE1
>>> + =A0 =A0 =A0 mrc =A0 =A0 p15, 0, r8, c2, c0, 2 =A0 @ Translation T=
able Control
>>> + =A0 =A0 =A0 mrc =A0 =A0 p15, 0, r9, c1, c0, 0 =A0 @ Control regis=
ter
>>> + =A0 =A0 =A0 mrc =A0 =A0 p15, 0, r10, c1, c0, 1 =A0@ Auxiliary con=
trol register
>>> + =A0 =A0 =A0 mrc =A0 =A0 p15, 0, r11, c1, c0, 2 =A0@ Co-processor =
access controls
>>> + =A0 =A0 =A0 mrc =A0 =A0 p15, 0, r12, c10, c2, 0 @ Read PRRR
>>> + =A0 =A0 =A0 mrc =A0 =A0 p15, 0, r3, c10, c2, 1 =A0@ READ NMRR
>>> +
>>> + =A0 =A0 =A0 stmia =A0 r0, { r3 - r13 }
>>> +
>>> + =A0 =A0 =A0 bl =A0 =A0 =A0s3c_pm_cb_flushcache
>>> +
>>> + =A0 =A0 =A0 ldr =A0 =A0 r0, =3Dpm_cpu_sleep
>>> + =A0 =A0 =A0 ldr =A0 =A0 r0, [ r0 ]
>>> + =A0 =A0 =A0 mov =A0 =A0 pc, r0
>>> +
>>> +resume_with_mmu:
>>> + =A0 =A0 =A0 /*
>>> + =A0 =A0 =A0 =A0* After MMU is turned on, restore the previous MMU=
 table.
>>> + =A0 =A0 =A0 =A0*/
>>> + =A0 =A0 =A0 ldr =A0 =A0 r9 , =3D(PAGE_OFFSET - PHYS_OFFSET)
>>> + =A0 =A0 =A0 add =A0 =A0 r4, r4, r9
>>> + =A0 =A0 =A0 str =A0 =A0 r12, [r4]
>>> +
>>> + =A0 =A0 =A0 ldmfd =A0 sp!, { r3 - r12, pc }
>>> +
>>> + =A0 =A0 =A0 .ltorg
>>> +
>>> + =A0 =A0 =A0 .data
>>> +
>>> + =A0 =A0 =A0 .global s3c_sleep_save_phys
>>> +s3c_sleep_save_phys:
>>> + =A0 =A0 =A0 .word =A0 0
>>> +
>>> + =A0 =A0 =A0 /* sleep magic, to allow the bootloader to check for =
an valid
>>> + =A0 =A0 =A0 =A0* image to resume to. Must be the first word befor=
e the
>>> + =A0 =A0 =A0 =A0* s3c_cpu_resume entry.
>>> + =A0 =A0 =A0 */
>>> +
>>> + =A0 =A0 =A0 .word =A0 0x2bedf00d
>>> +
>>> + =A0 =A0 =A0 /* s3c_cpu_resume
>>> + =A0 =A0 =A0 =A0*
>>> + =A0 =A0 =A0 =A0* resume code entry for bootloader to call
>>> + =A0 =A0 =A0 =A0*
>>> + =A0 =A0 =A0 =A0* we must put this code here in the data segment a=
s we have no
>>> + =A0 =A0 =A0 =A0* other way of restoring the stack pointer after s=
leep, and we
>>> + =A0 =A0 =A0 =A0* must not write to the code segment (code is read=
-only)
>>> + =A0 =A0 =A0 */
>>> +
>>> +ENTRY(s3c_cpu_resume)
>>> + =A0 =A0 =A0 mov =A0 =A0 r0, #PSR_I_BIT | PSR_F_BIT | SVC_MODE
>>> + =A0 =A0 =A0 msr =A0 =A0 cpsr_c, r0
>>> +
>>> + =A0 =A0 =A0 mov =A0 =A0 r1, #0
>>> + =A0 =A0 =A0 mcr =A0 =A0 p15, 0, r1, c8, c7, 0 =A0 =A0 =A0 =A0 =A0=
 @ invalidate TLBs
>>> + =A0 =A0 =A0 mcr =A0 =A0 p15, 0, r1, c7, c5, 0 =A0 =A0 =A0 =A0 =A0=
 @ invalidate I Cache
>>> +
>>> + =A0 =A0 =A0 ldr =A0 =A0 r0, s3c_sleep_save_phys =A0 =A0 =A0 =A0 @=
 address of restore block
>>> + =A0 =A0 =A0 ldmia =A0 r0, { r3 - r13 }
>>> +
>>> + =A0 =A0 =A0 mcr =A0 =A0 p15, 0, r4, c13, c0, 0 =A0 =A0 =A0 =A0 =A0=
@ FCSE/PID
>>> + =A0 =A0 =A0 mcr =A0 =A0 p15, 0, r5, c3, c0, 0 =A0 =A0 =A0 =A0 =A0=
 @ Domain ID
>>> +
>>> + =A0 =A0 =A0 mcr =A0 =A0 p15, 0, r8, c2, c0, 2 =A0 =A0 =A0 =A0 =A0=
 @ Translation Table Control
>>> + =A0 =A0 =A0 mcr =A0 =A0 p15, 0, r7, c2, c0, 1 =A0 =A0 =A0 =A0 =A0=
 @ Translation Table BASE1
>>> + =A0 =A0 =A0 mcr =A0 =A0 p15, 0, r6, c2, c0, 0 =A0 =A0 =A0 =A0 =A0=
 @ Translation Table BASE0
>>> +
>>> + =A0 =A0 =A0 mcr =A0 =A0 p15, 0, r10, c1, c0, 1 =A0 =A0 =A0 =A0 =A0=
@ Auxiliary control register
>>> +
>>> + =A0 =A0 =A0 mov =A0 =A0 r0, #0
>>> + =A0 =A0 =A0 mcr =A0 =A0 p15, 0, r0, c8, c7, 0 =A0 =A0 =A0 =A0 =A0=
 @ Invalidate I & D TLB
>>> +
>>> + =A0 =A0 =A0 mov =A0 =A0 r0, #0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0@ restore copro access
>>> + =A0 =A0 =A0 mcr =A0 =A0 p15, 0, r11, c1, c0, 2 =A0 =A0 =A0 =A0 =A0=
@ Co-processor access
>>> + =A0 =A0 =A0 mcr =A0 =A0 p15, 0, r0, c7, c5, 4
>>> +
>>> + =A0 =A0 =A0 mcr =A0 =A0 p15, 0, r12, c10, c2, 0 =A0 =A0 =A0 =A0 @=
 write PRRR
>>> + =A0 =A0 =A0 mcr =A0 =A0 p15, 0, r3, c10, c2, 1 =A0 =A0 =A0 =A0 =A0=
@ write NMRR
>>> +
>>> + =A0 =A0 =A0 /*
>>> + =A0 =A0 =A0 =A0* In Cortex-A8, when MMU is turned on, the pipelin=
e is flushed.
>>> + =A0 =A0 =A0 =A0* And there are no valid entries in the MMU table =
at this point.
>>> + =A0 =A0 =A0 =A0* So before turning on the MMU, the MMU entry for =
the DRAM
>>address
>>> + =A0 =A0 =A0 =A0* range is added. After the MMU is turned on, the =
other entries
>>> + =A0 =A0 =A0 =A0* in the MMU table will be restored.
>>> + =A0 =A0 =A0 */
>>> +
>>> + =A0 =A0 =A0 /* r6 =3D Translation Table BASE0 */
>>> + =A0 =A0 =A0 mov =A0 =A0 r4, r6
>>> + =A0 =A0 =A0 mov =A0 =A0 r4, r4, LSR #14
>>> + =A0 =A0 =A0 mov =A0 =A0 r4, r4, LSL #14
>>> +
>>> + =A0 =A0 =A0 /* Load address for adding to MMU table list */
>>> + =A0 =A0 =A0 ldr =A0 =A0 r11, =3D0xE010F000
>>what's the address 0xE010F000?
> Physical address of INFORM0 register.
Then should be use the macro?
>
>>> + =A0 =A0 =A0 ldr =A0 =A0 r10, [r11, #0]
>>> + =A0 =A0 =A0 mov =A0 =A0 r10, r10, LSR #18
>>> + =A0 =A0 =A0 bic =A0 =A0 r10, r10, #0x3
>>> + =A0 =A0 =A0 orr =A0 =A0 r4, r4, r10
>>> +
>>> + =A0 =A0 =A0 /* Calculate MMU table entry */
>>> + =A0 =A0 =A0 mov =A0 =A0 r10, r10, LSL #18
>>> + =A0 =A0 =A0 ldr =A0 =A0 r5, =3D0x40E
>>> + =A0 =A0 =A0 orr =A0 =A0 r10, r10, r5
>>> +
>>> + =A0 =A0 =A0 /* Back up originally data */
>>> + =A0 =A0 =A0 ldr =A0 =A0 r12, [r4]
>>> +
>>> + =A0 =A0 =A0 /* Add calculated MMU table entry into MMU table list=
 */
>>> + =A0 =A0 =A0 str =A0 =A0 r10, [r4]
>>> +
>>> + =A0 =A0 =A0 ldr =A0 =A0 r2, =3Dresume_with_mmu
>>> + =A0 =A0 =A0 mcr =A0 =A0 p15, 0, r9, c1, c0, 0 =A0 =A0 =A0 =A0 =A0=
 @ turn on MMU, etc
>>> +
>>> + =A0 =A0 =A0 nop
>>> + =A0 =A0 =A0 nop
>>> + =A0 =A0 =A0 nop
>>> + =A0 =A0 =A0 nop
>>> + =A0 =A0 =A0 nop =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 @ second-to-last before mmu
>>> +
>>> + =A0 =A0 =A0 mov =A0 =A0 pc, r2 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0@ go back to virtual address
>>> +
>>> + =A0 =A0 =A0 .ltorg
>>> +
>>> diff --git a/arch/arm/plat-s5p/Makefile b/arch/arm/plat-s5p/Makefil=
e
>>> index f3e917e..4b838f6 100644
>>> --- a/arch/arm/plat-s5p/Makefile
>>> +++ b/arch/arm/plat-s5p/Makefile
>>> @@ -18,6 +18,8 @@ obj-y =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 +=3D cpu.o
>>> =A0obj-y =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0+=3D cl=
ock.o
>>> =A0obj-y =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0+=3D ir=
q.o
>>> =A0obj-$(CONFIG_S5P_EXT_INT) =A0 =A0 =A0+=3D irq-eint.o
>>> +obj-$(CONFIG_PM) =A0 =A0 =A0 =A0 =A0 =A0 =A0 +=3D pm.o
>>> +obj-$(CONFIG_PM) =A0 =A0 =A0 =A0 =A0 =A0 =A0 +=3D irq-pm.o
>>Please make one line.
> I think that it isn't matter.
>>>
>>> =A0# devices
>>>
>>> diff --git a/arch/arm/plat-s5p/include/plat/irqs.h b/arch/arm/plat-
>>s5p/include/plat/irqs.h
>>> index 3fb3a3a..2f8128a 100644
>>> --- a/arch/arm/plat-s5p/include/plat/irqs.h
>>> +++ b/arch/arm/plat-s5p/include/plat/irqs.h
>>> @@ -94,4 +94,5 @@
>>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0((irq) - S5P_EINT_BASE1) : \
>>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0((irq) + 16 - S5P_EINT_BASE2))
>>>
>>> +#define IRQ_EINT_BIT(x) =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0EINT_OFFSET=
(x)
>>where use it?
>>> =A0#endif /* __ASM_PLAT_S5P_IRQS_H */
>>> diff --git a/arch/arm/plat-s5p/irq-pm.c b/arch/arm/plat-s5p/irq-pm.=
c
>>> new file mode 100644
>>> index 0000000..dc33b9e
>>> --- /dev/null
>>> +++ b/arch/arm/plat-s5p/irq-pm.c
>>> @@ -0,0 +1,93 @@
>>> +/* linux/arch/arm/plat-s5p/irq-pm.c
>>> + *
>>> + * Copyright (c) 2010 Samsung Electronics Co., Ltd.
>>> + * =A0 =A0 =A0 =A0 =A0 =A0 http://www.samsung.com
>>> + *
>>> + * Based on arch/arm/plat-s3c24xx/irq-pm.c,
>>> + * Copyright (c) 2003,2004 Simtec Electronics
>>> + * =A0 =A0 Ben Dooks <ben@simtec.co.uk>
>>> + * =A0 =A0 http://armlinux.simtec.co.uk/
>>> + *
>>> + * This program is free software; you can redistribute it and/or m=
odify
>>> + * it under the terms of the GNU General Public License version 2 =
as
>>> + * published by the Free Software Foundation.
>>> +*/
>>> +
>>> +#include <linux/init.h>
>>> +#include <linux/module.h>
>>> +#include <linux/interrupt.h>
>>> +#include <linux/sysdev.h>
>>> +
>>> +#include <plat/cpu.h>
>>> +#include <plat/irqs.h>
>>> +#include <plat/pm.h>
>>> +#include <mach/map.h>
>>> +
>>> +#include <mach/regs-gpio.h>
>>> +#include <mach/regs-irq.h>
>>> +
>>> +/* state for IRQs over sleep */
>>> +
>>> +/* default is to allow for EINT0..EINT31, and IRQ_RTC_TIC, IRQ_RTC=
_ALARM,
>>> + * as wakeup sources
>>> + *
>>> + * set bit to 1 in allow bitfield to enable the wakeup settings on=
 it
>>> +*/
>>> +
>>> +unsigned long s3c_irqwake_intallow =A0 =A0 =3D 0x00000006L;
>>> +unsigned long s3c_irqwake_eintallow =A0 =A0=3D 0xffffffffL;
>>> +
>>> +int s3c_irq_wake(unsigned int irqno, unsigned int state)
>>> +{
>>> + =A0 =A0 =A0 unsigned long irqbit;
>>> +
>>> + =A0 =A0 =A0 switch (irqno) {
>>> + =A0 =A0 =A0 case IRQ_RTC_TIC:
>>> + =A0 =A0 =A0 case IRQ_RTC_ALARM:
>>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 irqbit =3D 1 << (irqno + 1 - IRQ_RTC_=
ALARM);
>>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (!state)
>>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 s3c_irqwake_intmask |=
=3D irqbit;
>>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 else
>>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 s3c_irqwake_intmask &=
=3D ~irqbit;
>>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 break;
>>> + =A0 =A0 =A0 default:
>>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 return -ENOENT;
>>> + =A0 =A0 =A0 }
>>> + =A0 =A0 =A0 return 0;
>>> +}
>>> +
>>> +static struct sleep_save eint_save[] =3D {
>>> + =A0 =A0 =A0 SAVE_ITEM(S5P_EINT_CON(0)),
>>> + =A0 =A0 =A0 SAVE_ITEM(S5P_EINT_CON(1)),
>>> + =A0 =A0 =A0 SAVE_ITEM(S5P_EINT_CON(2)),
>>> + =A0 =A0 =A0 SAVE_ITEM(S5P_EINT_CON(3)),
>>> +
>>> + =A0 =A0 =A0 SAVE_ITEM(S5P_EINT_FLTCON(0)),
>>> + =A0 =A0 =A0 SAVE_ITEM(S5P_EINT_FLTCON(1)),
>>> + =A0 =A0 =A0 SAVE_ITEM(S5P_EINT_FLTCON(2)),
>>> + =A0 =A0 =A0 SAVE_ITEM(S5P_EINT_FLTCON(3)),
>>> + =A0 =A0 =A0 SAVE_ITEM(S5P_EINT_FLTCON(4)),
>>> + =A0 =A0 =A0 SAVE_ITEM(S5P_EINT_FLTCON(5)),
>>> + =A0 =A0 =A0 SAVE_ITEM(S5P_EINT_FLTCON(6)),
>>> + =A0 =A0 =A0 SAVE_ITEM(S5P_EINT_FLTCON(7)),
>>> +
>>> + =A0 =A0 =A0 SAVE_ITEM(S5P_EINT_MASK(0)),
>>> + =A0 =A0 =A0 SAVE_ITEM(S5P_EINT_MASK(1)),
>>> + =A0 =A0 =A0 SAVE_ITEM(S5P_EINT_MASK(2)),
>>> + =A0 =A0 =A0 SAVE_ITEM(S5P_EINT_MASK(3)),
>>> +};
>>> +
>>> +int s3c24xx_irq_suspend(struct sys_device *dev, pm_message_t state=
)
>>> +{
>>> + =A0 =A0 =A0 s3c_pm_do_save(eint_save, ARRAY_SIZE(eint_save));
>>> +
>>> + =A0 =A0 =A0 return 0;
>>> +}
>>> +
>>> +int s3c24xx_irq_resume(struct sys_device *dev)
>>> +{
>>> + =A0 =A0 =A0 s3c_pm_do_restore(eint_save, ARRAY_SIZE(eint_save));
>>> +
>>> + =A0 =A0 =A0 return 0;
>>> +}
>>> +
>>> diff --git a/arch/arm/plat-s5p/pm.c b/arch/arm/plat-s5p/pm.c
>>> new file mode 100644
>>> index 0000000..d592b63
>>> --- /dev/null
>>> +++ b/arch/arm/plat-s5p/pm.c
>>> @@ -0,0 +1,52 @@
>>> +/* linux/arch/arm/plat-s5p/pm.c
>>> + *
>>> + * Copyright (c) 2010 Samsung Electronics Co., Ltd.
>>> + * =A0 =A0 =A0 =A0 =A0 =A0 http://www.samsung.com
>>> + *
>>> + * S5P Power Manager (Suspend-To-RAM) support
>>> + *
>>> + * Based on arch/arm/plat-s3c24xx/pm.c
>>> + * Copyright (c) 2004,2006 Simtec Electronics
>>> + * =A0 =A0 Ben Dooks <ben@simtec.co.uk>
>>> + *
>>> + * This program is free software; you can redistribute it and/or m=
odify
>>> + * it under the terms of the GNU General Public License version 2 =
as
>>> + * published by the Free Software Foundation.
>>> +*/
>>> +
>>> +#include <linux/suspend.h>
>>> +#include <plat/pm.h>
>>> +
>>> +#define PFX "s5p pm: "
>>> +
>>> +/* s3c_pm_check_resume_pin
>>> + *
>>> + * check to see if the pin is configured correctly for sleep mode,=
 and
>>> + * make any necessary adjustments if it is not
>>> +*/
>>> +
>>> +static void s3c_pm_check_resume_pin(unsigned int pin, unsigned int
>>irqoffs)
>>> +{
>>> + =A0 =A0 =A0 /* nothing here yet */
>>> +}
>>> +
>>> +/* s3c_pm_configure_extint
>>> + *
>>> + * configure all external interrupt pins
>>> +*/
>>> +
>>> +void s3c_pm_configure_extint(void)
>>> +{
>>> + =A0 =A0 =A0 /* nothing here yet */
>>> +}
>>> +
>>> +void s3c_pm_restore_core(void)
>>> +{
>>> + =A0 =A0 =A0 /* nothing here yet */
>>> +}
>>> +
>>> +void s3c_pm_save_core(void)
>>> +{
>>> + =A0 =A0 =A0 /* nothing here yet */
>>> +}
>>> +
>>> diff --git a/arch/arm/plat-samsung/pm-gpio.c b/arch/arm/plat-samsun=
g/pm-
>>gpio.c
>>> index 7df03f8..9652820 100644
>>> --- a/arch/arm/plat-samsung/pm-gpio.c
>>> +++ b/arch/arm/plat-samsung/pm-gpio.c
>>> @@ -192,7 +192,7 @@ struct s3c_gpio_pm s3c_gpio_pm_2bit =3D {
>>> =A0 =A0 =A0 =A0.resume =3D s3c_gpio_pm_2bit_resume,
>>> =A0};
>>>
>>> -#ifdef CONFIG_ARCH_S3C64XX
>>> +#if defined(CONFIG_ARCH_S3C64XX) || defined(CONFIG_PLAT_S5P)
>>> =A0static void s3c_gpio_pm_4bit_save(struct s3c_gpio_chip *chip)
>>> =A0{
>>> =A0 =A0 =A0 =A0chip->pm_save[1] =3D __raw_readl(chip->base + OFFS_C=
ON);
>>> @@ -302,7 +302,7 @@ struct s3c_gpio_pm s3c_gpio_pm_4bit =3D {
>>> =A0 =A0 =A0 =A0.save =A0 =3D s3c_gpio_pm_4bit_save,
>>> =A0 =A0 =A0 =A0.resume =3D s3c_gpio_pm_4bit_resume,
>>> =A0};
>>> -#endif /* CONFIG_ARCH_S3C64XX */
>>> +#endif /* CONFIG_ARCH_S3C64XX || CONFIG_PLAT_S5P */
>>>
>>> =A0/**
>>> =A0* s3c_pm_save_gpio() - save gpio chip data for suspend
>>> --
>>> 1.6.2.5
>>>
>>> --
>>> To unsubscribe from this list: send the line "unsubscribe linux-sam=
sung-
>>soc" in
>>> the body of a message to majordomo@vger.kernel.org
>>> More majordomo info at =A0http://vger.kernel.org/majordomo-info.htm=
l
>>>
>
> Thanks and regards,
>
> S.B. Kim
>
>
