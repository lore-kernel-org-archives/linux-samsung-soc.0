From: Abhilash Kesavan <kesavan.abhilash@gmail.com>
Subject: Re: [PATCH 5/5] ARM: S5P64X0: Add Power Management support
Date: Wed, 7 Sep 2011 12:03:52 +0530
Message-ID: <CAM4voa=sRSNCwxvHs=RHzRabksA83iXfapKcBe_g7H=NatHs3A@mail.gmail.com>
References: <1313144787-30666-1-git-send-email-a.kesavan@samsung.com>
	<1313144787-30666-6-git-send-email-a.kesavan@samsung.com>
	<000501cc6d23$a7730e00$f6592a00$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-gy0-f174.google.com ([209.85.160.174]:33378 "EHLO
	mail-gy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753237Ab1IGGdw convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 7 Sep 2011 02:33:52 -0400
Received: by gya6 with SMTP id 6so4481462gya.19
        for <linux-samsung-soc@vger.kernel.org>; Tue, 06 Sep 2011 23:33:52 -0700 (PDT)
In-Reply-To: <000501cc6d23$a7730e00$f6592a00$%kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

Hi Mr Kim,

On Wed, Sep 7, 2011 at 11:31 AM, Kukjin Kim <kgene.kim@samsung.com> wro=
te:
> Abhilash Kesavan wrote:
>>
>> Add suspend-to-ram support for SMDK6440/50
>>
>> Signed-off-by: Abhilash Kesavan <a.kesavan@samsung.com>
>> ---
>> =A0arch/arm/Kconfig =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0| =A0 =A02 +-
>> =A0arch/arm/mach-s5p64x0/Kconfig =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 | =A0 =A04 +
>> =A0arch/arm/mach-s5p64x0/Makefile =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
| =A0 =A01 +
>> =A0arch/arm/mach-s5p64x0/include/mach/map.h =A0 =A0 =A0 =A0| =A0 =A0=
1 +
>> =A0arch/arm/mach-s5p64x0/include/mach/pm-core.h =A0 =A0| =A0117 ++++=
+++++++++
>> =A0arch/arm/mach-s5p64x0/include/mach/regs-clock.h | =A0 33 ++++
>> =A0arch/arm/mach-s5p64x0/include/mach/regs-gpio.h =A0| =A0 19 ++
>> =A0arch/arm/mach-s5p64x0/irq-eint.c =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0|=
 =A0 =A02 +
>> =A0arch/arm/mach-s5p64x0/irq-pm.c =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
| =A0 92 ++++++++++
>> =A0arch/arm/mach-s5p64x0/pm.c =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0| =A0204
>> +++++++++++++++++++++++
>> =A010 files changed, 474 insertions(+), 1 deletions(-)
>> =A0create mode 100644 arch/arm/mach-s5p64x0/include/mach/pm-core.h
>> =A0create mode 100644 arch/arm/mach-s5p64x0/irq-pm.c
>> =A0create mode 100644 arch/arm/mach-s5p64x0/pm.c
>>
>> diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
>> index 2c71a8f..47aed0d 100644
>> --- a/arch/arm/Kconfig
>> +++ b/arch/arm/Kconfig
>> @@ -2071,7 +2071,7 @@ menu "Power management options"
>> =A0source "kernel/power/Kconfig"
>>
>> =A0config ARCH_SUSPEND_POSSIBLE
>> - =A0 =A0 depends on !ARCH_S5P64X0 && !ARCH_S5PC100
>> + =A0 =A0 depends on !ARCH_S5PC100
>> =A0 =A0 =A0 depends on CPU_ARM920T || CPU_ARM926T || CPU_SA1100 || \
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 CPU_V6 || CPU_V6K || CPU_V7 || CPU_XSC3 =
|| CPU_XSCALE
>> =A0 =A0 =A0 def_bool y
>> diff --git a/arch/arm/mach-s5p64x0/Kconfig b/arch/arm/mach-s5p64x0/K=
config
>> index 65c7518..d7f034a 100644
>> --- a/arch/arm/mach-s5p64x0/Kconfig
>> +++ b/arch/arm/mach-s5p64x0/Kconfig
>> @@ -11,6 +11,8 @@ config CPU_S5P6440
>> =A0 =A0 =A0 bool
>> =A0 =A0 =A0 select S3C_PL330_DMA
>> =A0 =A0 =A0 select S5P_HRT
>> + =A0 =A0 select SAMSUNG_SLEEP if PM
>> + =A0 =A0 select SAMSUNG_WAKEMASK if PM
>> =A0 =A0 =A0 help
>> =A0 =A0 =A0 =A0 Enable S5P6440 CPU support
>>
>> @@ -18,6 +20,8 @@ config CPU_S5P6450
>> =A0 =A0 =A0 bool
>> =A0 =A0 =A0 select S3C_PL330_DMA
>> =A0 =A0 =A0 select S5P_HRT
>> + =A0 =A0 select SAMSUNG_SLEEP if PM
>> + =A0 =A0 select SAMSUNG_WAKEMASK if PM
>> =A0 =A0 =A0 help
>> =A0 =A0 =A0 =A0 Enable S5P6450 CPU support
>>
>> diff --git a/arch/arm/mach-s5p64x0/Makefile
> b/arch/arm/mach-s5p64x0/Makefile
>> index 5f6afdf..acfebb7 100644
>> --- a/arch/arm/mach-s5p64x0/Makefile
>> +++ b/arch/arm/mach-s5p64x0/Makefile
>> @@ -16,6 +16,7 @@ obj-$(CONFIG_ARCH_S5P64X0) =A0+=3D cpu.o init.o
>> clock.o dma.o gpiolib.o
>> =A0obj-$(CONFIG_ARCH_S5P64X0) =A0 +=3D setup-i2c0.o irq-eint.o
>> =A0obj-$(CONFIG_CPU_S5P6440) =A0 =A0+=3D clock-s5p6440.o
>> =A0obj-$(CONFIG_CPU_S5P6450) =A0 =A0+=3D clock-s5p6450.o
>> +obj-$(CONFIG_PM) =A0 =A0 =A0 =A0 =A0 =A0 +=3D pm.o irq-pm.o
>>
>> =A0# machine support
>>
>> diff --git a/arch/arm/mach-s5p64x0/include/mach/map.h b/arch/arm/mac=
h-
>> s5p64x0/include/mach/map.h
>> index 95c9125..6138f7c 100644
>> --- a/arch/arm/mach-s5p64x0/include/mach/map.h
>> +++ b/arch/arm/mach-s5p64x0/include/mach/map.h
>> @@ -85,5 +85,6 @@
>> =A0#define S5P_PA_UART5 =A0 =A0 =A0 =A0 S5P6450_PA_UART(5)
>>
>> =A0#define S5P_SZ_UART =A0 =A0 =A0 =A0 =A0SZ_256
>> +#define S3C_VA_UARTx(x) =A0 =A0 =A0 =A0 =A0 =A0 =A0(S3C_VA_UART + (=
(x) *
>> S3C_UART_OFFSET))
>>
>> =A0#endif /* __ASM_ARCH_MAP_H */
>> diff --git a/arch/arm/mach-s5p64x0/include/mach/pm-core.h b/arch/arm=
/mach-
>> s5p64x0/include/mach/pm-core.h
>> new file mode 100644
>> index 0000000..aee9d85
>> --- /dev/null
>> +++ b/arch/arm/mach-s5p64x0/include/mach/pm-core.h
>> @@ -0,0 +1,117 @@
>> +/* linux/arch/arm/mach-s5p64x0/include/mach/pm-core.h
>> + *
>> + * Copyright (c) 2011 Samsung Electronics Co., Ltd.
>> + * =A0 =A0 =A0 =A0 =A0 http://www.samsung.com
>> + *
>> + * S5P64X0 - PM core support for arch/arm/plat-samsung/pm.c
>> + *
>> + * Based on PM core support for S3C64XX by Ben Dooks
>> + *
>> + * This program is free software; you can redistribute it and/or mo=
dify
>> + * it under the terms of the GNU General Public License version 2 a=
s
>> + * published by the Free Software Foundation.
>> + */
>> +
>> +#include <mach/regs-gpio.h>
>> +
>> +static inline void s3c_pm_debug_init_uart(void)
>> +{
>> + =A0 =A0 u32 tmp =3D __raw_readl(S5P64X0_CLK_GATE_PCLK);
>> +
>> + =A0 =A0 /*
>> + =A0 =A0 =A0* As a note, since the S5P64X0 UARTs generally have mul=
tiple
>> + =A0 =A0 =A0* clock sources, we simply enable PCLK at the moment an=
d hope
>> + =A0 =A0 =A0* that the resume settings for the UART are suitable fo=
r the
>> + =A0 =A0 =A0* use with PCLK.
>> + =A0 =A0 =A0*/
>> + =A0 =A0 tmp |=3D S5P64X0_CLKCON_PCLK_UART0;
>> + =A0 =A0 tmp |=3D S5P64X0_CLKCON_PCLK_UART1;
>> + =A0 =A0 tmp |=3D S5P64X0_CLKCON_PCLK_UART2;
>> + =A0 =A0 tmp |=3D S5P64X0_CLKCON_PCLK_UART3;
>> +
>> + =A0 =A0 __raw_writel(tmp, S5P64X0_CLK_GATE_PCLK);
>> + =A0 =A0 udelay(10);
>> +}
>> +
>> +static inline void s3c_pm_arch_prepare_irqs(void)
>> +{
>> + =A0 =A0 /* VIC should have already been taken care of */
>> +
>> + =A0 =A0 /* clear any pending EINT0 interrupts */
>> + =A0 =A0 __raw_writel(__raw_readl(S5P64X0_EINT0PEND), S5P64X0_EINT0=
PEND);
>> +}
>> +
>> +static inline void s3c_pm_arch_stop_clocks(void) { }
>> +static inline void s3c_pm_arch_show_resume_irqs(void) { }
>> +
>> +/*
>> + * make these defines, we currently do not have any need to change
>> + * the IRQ wake controls depending on the CPU we are running on
>> + */
>> +#define s3c_irqwake_eintallow =A0 =A0 =A0 =A0((1 << 16) - 1)
>> +#define s3c_irqwake_intallow (~0)
>> +
>> +static inline void s3c_pm_arch_update_uart(void __iomem *regs,
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 struct pm_uart_save *save)
>> +{
>> + =A0 =A0 u32 ucon =3D __raw_readl(regs + S3C2410_UCON);
>> + =A0 =A0 u32 ucon_clk =3D ucon & S3C6400_UCON_CLKMASK;
>> + =A0 =A0 u32 save_clk =3D save->ucon & S3C6400_UCON_CLKMASK;
>> + =A0 =A0 u32 new_ucon;
>> + =A0 =A0 u32 delta;
>> +
>> + =A0 =A0 /*
>> + =A0 =A0 =A0* S5P64X0 UART blocks only support level interrupts, so=
 ensure that
>> + =A0 =A0 =A0* when we restore unused UART blocks we force the level=
 interrupt
>> + =A0 =A0 =A0* settings.
>> + =A0 =A0 =A0*/
>> + =A0 =A0 save->ucon |=3D S3C2410_UCON_TXILEVEL | S3C2410_UCON_RXILE=
VEL;
>> +
>> + =A0 =A0 /*
>> + =A0 =A0 =A0* We have a constraint on changing the clock type of th=
e UART
>> + =A0 =A0 =A0* between UCLKx and PCLK, so ensure that when we restor=
e UCON
>> + =A0 =A0 =A0* that the CLK field is correctly modified if the bootl=
oader
>> + =A0 =A0 =A0* has changed anything.
>> + =A0 =A0 =A0*/
>> + =A0 =A0 if (ucon_clk !=3D save_clk) {
>> + =A0 =A0 =A0 =A0 =A0 =A0 new_ucon =3D save->ucon;
>> + =A0 =A0 =A0 =A0 =A0 =A0 delta =3D ucon_clk ^ save_clk;
>> +
>> + =A0 =A0 =A0 =A0 =A0 =A0 /*
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0* change from UCLKx =3D> wrong PCLK,
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0* either UCLK can be tested for by a bi=
t-test
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0* with UCLK0
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0*/
>> + =A0 =A0 =A0 =A0 =A0 =A0 if (ucon_clk & S3C6400_UCON_UCLK0 &&
>> + =A0 =A0 =A0 =A0 =A0 =A0 !(save_clk & S3C6400_UCON_UCLK0) &&
>> + =A0 =A0 =A0 =A0 =A0 =A0 delta & S3C6400_UCON_PCLK2) {
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 new_ucon &=3D ~S3C6400_UCO=
N_UCLK0;
>> + =A0 =A0 =A0 =A0 =A0 =A0 } else if (delta =3D=3D S3C6400_UCON_PCLK2=
) {
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 /*
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0* as a precaution, don'=
t change from
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0* PCLK2 =3D> PCLK or vi=
ce-versa
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0*/
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 new_ucon ^=3D S3C6400_UCON=
_PCLK2;
>> + =A0 =A0 =A0 =A0 =A0 =A0 }
>> +
>> + =A0 =A0 =A0 =A0 =A0 =A0 S3C_PMDBG("ucon change %04x =3D> %04x (sav=
e=3D%04x)\n",
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 ucon, new_ucon, save->ucon=
);
>> + =A0 =A0 =A0 =A0 =A0 =A0 save->ucon =3D new_ucon;
>> + =A0 =A0 }
>> +}
>> +
>> +static inline void s3c_pm_restored_gpios(void)
>> +{
>> + =A0 =A0 /* ensure sleep mode has been cleared from the system */
>> + =A0 =A0 __raw_writel(0, S5P64X0_SLPEN);
>> +}
>> +
>> +static inline void s3c_pm_saved_gpios(void)
>> +{
>> + =A0 =A0 /*
>> + =A0 =A0 =A0* turn on the sleep mode and keep it there, as it seems=
 that during
>> + =A0 =A0 =A0* suspend the xCON registers get re-set and thus you ca=
n end up
> with
>> + =A0 =A0 =A0* problems between going to sleep and resuming.
>> + =A0 =A0 =A0*/
>> + =A0 =A0 __raw_writel(S5P64X0_SLPEN_USE_xSLP, S5P64X0_SLPEN);
>> +}
>> diff --git a/arch/arm/mach-s5p64x0/include/mach/regs-clock.h
> b/arch/arm/mach-
>> s5p64x0/include/mach/regs-clock.h
>> index a133f22..75f66a9 100644
>> --- a/arch/arm/mach-s5p64x0/include/mach/regs-clock.h
>> +++ b/arch/arm/mach-s5p64x0/include/mach/regs-clock.h
>> @@ -41,17 +41,50 @@
>> =A0#define S5P6450_DPLL_CON =A0 =A0 =A0 =A0 =A0 =A0 S5P_CLKREG(0x50)
>> =A0#define S5P6450_DPLL_CON_K =A0 =A0 =A0 =A0 =A0 S5P_CLKREG(0x54)
>>
>> +#define S5P64X0_AHB_CON0 =A0 =A0 =A0 =A0 =A0 =A0 S5P_CLKREG(0x100)
>> =A0#define S5P64X0_CLK_SRC1 =A0 =A0 =A0 =A0 =A0 =A0 S5P_CLKREG(0x10C=
)
>>
>> =A0#define S5P64X0_SYS_ID =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 S5P_CLKREG(0x118)
>> =A0#define S5P64X0_SYS_OTHERS =A0 =A0 =A0 =A0 =A0 S5P_CLKREG(0x11C)
>>
>> =A0#define S5P64X0_PWR_CFG =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
S5P_CLKREG(0x804)
>> +#define S5P64X0_EINT_WAKEUP_MASK =A0 =A0 S5P_CLKREG(0x808)
>> +#define S5P64X0_SLEEP_CFG =A0 =A0 =A0 =A0 =A0 =A0S5P_CLKREG(0x818)
>> +#define S5P64X0_PWR_STABLE =A0 =A0 =A0 =A0 =A0 S5P_CLKREG(0x828)
>> +
>> =A0#define S5P64X0_OTHERS =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 S5P_CLKREG(0x900)
>> +#define S5P64X0_WAKEUP_STAT =A0 =A0 =A0 =A0 =A0S5P_CLKREG(0x908)
>> +
>> +#define S5P64X0_INFORM0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
S5P_CLKREG(0xA00)
>>
>> =A0#define S5P64X0_CLKDIV0_HCLK_SHIFT =A0 (8)
>> =A0#define S5P64X0_CLKDIV0_HCLK_MASK =A0 =A0(0xF <<
>> S5P64X0_CLKDIV0_HCLK_SHIFT)
>>
>> +/* HCLK GATE Registers */
>> +#define S5P64X0_CLKCON_HCLK1_FIMGVG =A0(1<<2)
>
> Should be added blank around "<<" like (1 << 2).
> And if possible, the name should be same with datasheet like
> ...CLK_GATE_HCLK1_FIMGVG.
>
> Please don't make new name.
OK..will change
>
>> +#define S5P64X0_CLKCON_SCLK1_FIMGVG =A0(1<<2)
>
> Same as above.
OK..will change
> ...CLK_GATE_SCLK1_FIMGVG
>
>> +
>> +/* PCLK GATE Registers */
>> +#define S5P64X0_CLKCON_PCLK_UART3 =A0 =A0(1<<4)
>> +#define S5P64X0_CLKCON_PCLK_UART2 =A0 =A0(1<<3)
>> +#define S5P64X0_CLKCON_PCLK_UART1 =A0 =A0(1<<2)
>> +#define S5P64X0_CLKCON_PCLK_UART0 =A0 =A0(1<<1)
>
> Same as above.
OK..will change
>
>> +
>> +#define S5P64X0_PWRCFG_MMC1_DISABLE =A0(1 << 15)
>> +#define S5P64X0_PWRCFG_MMC0_DISABLE =A0(1 << 14)
>> +#define S5P64X0_PWRCFG_RTC_TICK_DISABLE =A0 =A0 =A0(1 << 11)
>> +#define S5P64X0_PWRCFG_RTC_ALRM_DISABLE =A0 =A0 =A0(1 << 10)
>> +#define S5P64X0_PWRCFG_CFG_WFI_MASK =A0(3 << 5)
>> +#define S5P64X0_PWRCFG_CFG_WFI_SLEEP (3 << 5)
>> +
>> +#define S5P64X0_SLEEP_CFG_OSC_EN =A0 =A0 (1 << 0)
>> +
>> +#define S5P64X0_PWR_STABLE_CNT_VAL_4 (4 << 0)
>
> Same...please use same name with datasheet.
would you like it to be PWR_STABLE_PWR_CNT_VAL_4 ?
>
>> +
>> +#define S5P6450_OTHERS_DISABLE_INT =A0 (1 << 31)
>> +#define S5P64X0_OTHERS_RET_UART =A0 =A0 =A0 =A0 =A0 =A0 =A0(1 << 26=
)
>> +#define S5P64X0_OTHERS_RET_MMC1 =A0 =A0 =A0 =A0 =A0 =A0 =A0(1 << 25=
)
>> +#define S5P64X0_OTHERS_RET_MMC0 =A0 =A0 =A0 =A0 =A0 =A0 =A0(1 << 24=
)
>> =A0#define S5P64X0_OTHERS_USB_SIG_MASK =A0(1 << 16)
>>
>> =A0/* Compatibility defines */
>> diff --git a/arch/arm/mach-s5p64x0/include/mach/regs-gpio.h
> b/arch/arm/mach-
>> s5p64x0/include/mach/regs-gpio.h
>> index 6ce2547..27a2230 100644
>> --- a/arch/arm/mach-s5p64x0/include/mach/regs-gpio.h
>> +++ b/arch/arm/mach-s5p64x0/include/mach/regs-gpio.h
>> @@ -34,14 +34,33 @@
>> =A0#define S5P6450_GPQ_BASE =A0 =A0 =A0 =A0 =A0 =A0 (S5P_VA_GPIO + 0=
x0180)
>> =A0#define S5P6450_GPS_BASE =A0 =A0 =A0 =A0 =A0 =A0 (S5P_VA_GPIO + 0=
x0300)
>>
>> +#define S5P64X0_SPCON0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
(S5P_VA_GPIO + 0x1A0)
>> +#define S5P64X0_SPCON1 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
(S5P_VA_GPIO + 0x2B0)
>> +
>> +#define S5P64X0_MEM0CONSLP0 =A0 =A0 =A0 =A0 =A0(S5P_VA_GPIO + 0x1C0=
)
>> +#define S5P64X0_MEM0CONSLP1 =A0 =A0 =A0 =A0 =A0(S5P_VA_GPIO + 0x1C4=
)
>> +#define S5P64X0_MEM0DRVCON =A0 =A0 =A0 =A0 =A0 (S5P_VA_GPIO + 0x1D0=
)
>> +#define S5P64X0_MEM1DRVCON =A0 =A0 =A0 =A0 =A0 (S5P_VA_GPIO + 0x1D4=
)
>> +
>> +#define S5P64X0_EINT12CON =A0 =A0 =A0 =A0 =A0 =A0(S5P_VA_GPIO + 0x2=
00)
>> +#define S5P64X0_EINT12FLTCON =A0 =A0 =A0 =A0 (S5P_VA_GPIO + 0x220)
>> +#define S5P64X0_EINT12MASK =A0 =A0 =A0 =A0 =A0 (S5P_VA_GPIO + 0x240=
)
>> +
>> =A0/* External interrupt control registers for group0 */
>>
>> =A0#define EINT0CON0_OFFSET =A0 =A0 =A0 =A0 =A0 =A0 (0x900)
>> +#define EINT0FLTCON0_OFFSET =A0 =A0 =A0 =A0 =A0(0x910)
>> +#define EINT0FLTCON1_OFFSET =A0 =A0 =A0 =A0 =A0(0x914)
>> =A0#define EINT0MASK_OFFSET =A0 =A0 =A0 =A0 =A0 =A0 (0x920)
>> =A0#define EINT0PEND_OFFSET =A0 =A0 =A0 =A0 =A0 =A0 (0x924)
>>
>> =A0#define S5P64X0_EINT0CON0 =A0 =A0 =A0 =A0 =A0 =A0(S5P_VA_GPIO +
>> EINT0CON0_OFFSET)
>> +#define S5P64X0_EINT0FLTCON0 =A0 =A0 =A0 =A0 (S5P_VA_GPIO +
>> EINT0FLTCON0_OFFSET)
>> +#define S5P64X0_EINT0FLTCON1 =A0 =A0 =A0 =A0 (S5P_VA_GPIO +
>> EINT0FLTCON1_OFFSET)
>> =A0#define S5P64X0_EINT0MASK =A0 =A0 =A0 =A0 =A0 =A0(S5P_VA_GPIO +
>> EINT0MASK_OFFSET)
>> =A0#define S5P64X0_EINT0PEND =A0 =A0 =A0 =A0 =A0 =A0(S5P_VA_GPIO +
>> EINT0PEND_OFFSET)
>>
>> +#define S5P64X0_SLPEN =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
(S5P_VA_GPIO + 0x930)
>> +#define S5P64X0_SLPEN_USE_xSLP =A0 =A0 =A0 =A0 =A0 =A0 =A0 (1 << 0)
>> +
>> =A0#endif /* __ASM_ARCH_REGS_GPIO_H */
>> diff --git a/arch/arm/mach-s5p64x0/irq-eint.c
> b/arch/arm/mach-s5p64x0/irq-eint.c
>> index fe7380f..3b94c6c 100644
>> --- a/arch/arm/mach-s5p64x0/irq-eint.c
>> +++ b/arch/arm/mach-s5p64x0/irq-eint.c
>> @@ -19,6 +19,7 @@
>>
>> =A0#include <plat/regs-irqtype.h>
>> =A0#include <plat/gpio-cfg.h>
>> +#include <plat/pm.h>
>>
>> =A0#include <mach/regs-gpio.h>
>> =A0#include <mach/regs-clock.h>
>> @@ -133,6 +134,7 @@ static int s5p64x0_alloc_gc(void)
>> =A0 =A0 =A0 ct->chip.irq_mask =3D irq_gc_mask_set_bit;
>> =A0 =A0 =A0 ct->chip.irq_unmask =3D irq_gc_mask_clr_bit;
>> =A0 =A0 =A0 ct->chip.irq_set_type =3D s5p64x0_irq_eint_set_type;
>> + =A0 =A0 ct->chip.irq_set_wake =3D s3c_irqext_wake;
>> =A0 =A0 =A0 ct->regs.ack =3D EINT0PEND_OFFSET;
>> =A0 =A0 =A0 ct->regs.mask =3D EINT0MASK_OFFSET;
>> =A0 =A0 =A0 irq_setup_generic_chip(gc, IRQ_MSK(16), IRQ_GC_INIT_MASK=
_CACHE,
>> diff --git a/arch/arm/mach-s5p64x0/irq-pm.c
> b/arch/arm/mach-s5p64x0/irq-pm.c
>> new file mode 100644
>> index 0000000..3e6f245
>> --- /dev/null
>> +++ b/arch/arm/mach-s5p64x0/irq-pm.c
>> @@ -0,0 +1,92 @@
>> +/* linux/arch/arm/mach-s5p64x0/irq-pm.c
>> + *
>> + * Copyright (c) 2011 Samsung Electronics Co., Ltd.
>> + * =A0 =A0 =A0 =A0 =A0 http://www.samsung.com
>> + *
>> + * S5P64X0 - Interrupt handling Power Management
>> + *
>> + * Based on arch/arm/mach-s3c64xx/irq-pm.c by Ben Dooks
>> + *
>> + * This program is free software; you can redistribute it and/or mo=
dify
>> + * it under the terms of the GNU General Public License version 2 a=
s
>> + * published by the Free Software Foundation.
>> + */
>> +
>> +#include <linux/syscore_ops.h>
>> +#include <linux/serial_core.h>
>> +#include <linux/io.h>
>> +
>> +#include <plat/regs-serial.h>
>> +#include <plat/pm.h>
>> +
>> +#include <mach/regs-gpio.h>
>> +
>> +static struct sleep_save irq_save[] =3D {
>> + =A0 =A0 SAVE_ITEM(S5P64X0_EINT0CON0),
>> + =A0 =A0 SAVE_ITEM(S5P64X0_EINT0FLTCON0),
>> + =A0 =A0 SAVE_ITEM(S5P64X0_EINT0FLTCON1),
>> + =A0 =A0 SAVE_ITEM(S5P64X0_EINT0MASK),
>> +};
>> +
>> +static struct irq_grp_save {
>> + =A0 =A0 u32 =A0 =A0 con;
>> + =A0 =A0 u32 =A0 =A0 fltcon;
>> + =A0 =A0 u32 =A0 =A0 mask;
>> +} eint_grp_save[4];
>> +
>> +static u32 irq_uart_mask[CONFIG_SERIAL_SAMSUNG_UARTS];
>> +
>> +static int s5p64x0_irq_pm_suspend(void)
>> +{
>> + =A0 =A0 struct irq_grp_save *grp =3D eint_grp_save;
>> + =A0 =A0 int i;
>> +
>> + =A0 =A0 S3C_PMDBG("%s: suspending IRQs\n", __func__);
>> +
>> + =A0 =A0 s3c_pm_do_save(irq_save, ARRAY_SIZE(irq_save));
>> +
>> + =A0 =A0 for (i =3D 0; i < CONFIG_SERIAL_SAMSUNG_UARTS; i++)
>> + =A0 =A0 =A0 =A0 =A0 =A0 irq_uart_mask[i] =3D __raw_readl(S3C_VA_UA=
RTx(i) +
>> S3C64XX_UINTM);
>> +
>> + =A0 =A0 for (i =3D 0; i < ARRAY_SIZE(eint_grp_save); i++, grp++) {
>> + =A0 =A0 =A0 =A0 =A0 =A0 grp->con =3D __raw_readl(S5P64X0_EINT12CON=
 + (i * 4));
>> + =A0 =A0 =A0 =A0 =A0 =A0 grp->mask =3D __raw_readl(S5P64X0_EINT12MA=
SK + (i * 4));
>> + =A0 =A0 =A0 =A0 =A0 =A0 grp->fltcon =3D __raw_readl(S5P64X0_EINT12=
=46LTCON + (i * 4));
>> + =A0 =A0 }
>> +
>> + =A0 =A0 return 0;
>> +}
>> +
>> +static void s5p64x0_irq_pm_resume(void)
>> +{
>> + =A0 =A0 struct irq_grp_save *grp =3D eint_grp_save;
>> + =A0 =A0 int i;
>> +
>> + =A0 =A0 S3C_PMDBG("%s: resuming IRQs\n", __func__);
>> +
>> + =A0 =A0 s3c_pm_do_restore(irq_save, ARRAY_SIZE(irq_save));
>> +
>> + =A0 =A0 for (i =3D 0; i < CONFIG_SERIAL_SAMSUNG_UARTS; i++)
>> + =A0 =A0 =A0 =A0 =A0 =A0 __raw_writel(irq_uart_mask[i], S3C_VA_UART=
x(i) +
>> S3C64XX_UINTM);
>> +
>> + =A0 =A0 for (i =3D 0; i < ARRAY_SIZE(eint_grp_save); i++, grp++) {
>> + =A0 =A0 =A0 =A0 =A0 =A0 __raw_writel(grp->con, S5P64X0_EINT12CON +=
 (i * 4));
>> + =A0 =A0 =A0 =A0 =A0 =A0 __raw_writel(grp->mask, S5P64X0_EINT12MASK=
 + (i * 4));
>> + =A0 =A0 =A0 =A0 =A0 =A0 __raw_writel(grp->fltcon, S5P64X0_EINT12FL=
TCON + (i * 4));
>> + =A0 =A0 }
>> +
>> + =A0 =A0 S3C_PMDBG("%s: IRQ configuration restored\n", __func__);
>> +}
>> +
>> +static struct syscore_ops s5p64x0_irq_syscore_ops =3D {
>> + =A0 =A0 .suspend =3D s5p64x0_irq_pm_suspend,
>> + =A0 =A0 .resume =A0=3D s5p64x0_irq_pm_resume,
>> +};
>> +
>> +static int __init s5p64x0_syscore_init(void)
>> +{
>> + =A0 =A0 register_syscore_ops(&s5p64x0_irq_syscore_ops);
>> +
>> + =A0 =A0 return 0;
>> +}
>> +core_initcall(s5p64x0_syscore_init);
>> diff --git a/arch/arm/mach-s5p64x0/pm.c b/arch/arm/mach-s5p64x0/pm.c
>> new file mode 100644
>> index 0000000..cced4fb
>> --- /dev/null
>> +++ b/arch/arm/mach-s5p64x0/pm.c
>> @@ -0,0 +1,204 @@
>> +/* linux/arch/arm/mach-s5p64x0/pm.c
>> + *
>> + * Copyright (c) 2011 Samsung Electronics Co., Ltd.
>> + * =A0 =A0 =A0 =A0 =A0 http://www.samsung.com
>> + *
>> + * S5P64X0 Power Management Support
>> + *
>> + * Based on arch/arm/mach-s3c64xx/pm.c by Ben Dooks
>> + *
>> + * This program is free software; you can redistribute it and/or mo=
dify
>> + * it under the terms of the GNU General Public License version 2 a=
s
>> + * published by the Free Software Foundation.
>> +*/
>> +
>> +#include <linux/suspend.h>
>> +#include <linux/syscore_ops.h>
>> +#include <linux/io.h>
>> +
>> +#include <plat/cpu.h>
>> +#include <plat/pm.h>
>> +#include <plat/regs-timer.h>
>> +#include <plat/wakeup-mask.h>
>> +
>> +#include <mach/regs-clock.h>
>> +#include <mach/regs-gpio.h>
>> +
>> +static struct sleep_save s5p64x0_core_save[] =3D {
>> + =A0 =A0 SAVE_ITEM(S5P64X0_APLL_CON),
>> + =A0 =A0 SAVE_ITEM(S5P64X0_MPLL_CON),
>> + =A0 =A0 SAVE_ITEM(S5P64X0_EPLL_CON),
>> + =A0 =A0 SAVE_ITEM(S5P64X0_EPLL_CON_K),
>> + =A0 =A0 SAVE_ITEM(S5P64X0_CLK_SRC0),
>> + =A0 =A0 SAVE_ITEM(S5P64X0_CLK_SRC1),
>> + =A0 =A0 SAVE_ITEM(S5P64X0_CLK_DIV0),
>> + =A0 =A0 SAVE_ITEM(S5P64X0_CLK_DIV1),
>> + =A0 =A0 SAVE_ITEM(S5P64X0_CLK_DIV2),
>> + =A0 =A0 SAVE_ITEM(S5P64X0_CLK_DIV3),
>> + =A0 =A0 SAVE_ITEM(S5P64X0_CLK_GATE_MEM0),
>> + =A0 =A0 SAVE_ITEM(S5P64X0_CLK_GATE_HCLK1),
>> + =A0 =A0 SAVE_ITEM(S5P64X0_CLK_GATE_SCLK1),
>> +};
>> +
>> +static struct sleep_save s5p64x0_misc_save[] =3D {
>> + =A0 =A0 SAVE_ITEM(S5P64X0_AHB_CON0),
>> + =A0 =A0 SAVE_ITEM(S5P64X0_SPCON0),
>> + =A0 =A0 SAVE_ITEM(S5P64X0_SPCON1),
>> + =A0 =A0 SAVE_ITEM(S5P64X0_MEM0CONSLP0),
>> + =A0 =A0 SAVE_ITEM(S5P64X0_MEM0CONSLP1),
>> + =A0 =A0 SAVE_ITEM(S5P64X0_MEM0DRVCON),
>> + =A0 =A0 SAVE_ITEM(S5P64X0_MEM1DRVCON),
>> +
>> + =A0 =A0 SAVE_ITEM(S3C64XX_TINT_CSTAT),
>> +};
>> +
>> +/* DPLL is present only in S5P6450 */
>> +static struct sleep_save s5p6450_core_save[] =3D {
>> + =A0 =A0 SAVE_ITEM(S5P6450_DPLL_CON),
>> + =A0 =A0 SAVE_ITEM(S5P6450_DPLL_CON_K),
>> +};
>> +
>> +void s3c_pm_configure_extint(void)
>> +{
>> + =A0 =A0 __raw_writel(s3c_irqwake_eintmask, S5P64X0_EINT_WAKEUP_MAS=
K);
>> +}
>> +
>> +void s3c_pm_restore_core(void)
>> +{
>> + =A0 =A0 __raw_writel(0, S5P64X0_EINT_WAKEUP_MASK);
>> +
>> + =A0 =A0 s3c_pm_do_restore_core(s5p64x0_core_save,
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 ARRAY_SIZE=
(s5p64x0_core_save));
>> +
>> + =A0 =A0 if ((__raw_readl(S5P64X0_SYS_ID) & 0xFF000) =3D=3D 0x50000=
)
>> + =A0 =A0 =A0 =A0 =A0 =A0 s3c_pm_do_restore_core(s5p6450_core_save,
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 ARRAY_SIZE=
(s5p6450_core_save));
>
> You can use soc_is_xxx() here.
Yep, wasn't there when I posted the series. Will change.
>
>> +
>> + =A0 =A0 s3c_pm_do_restore(s5p64x0_misc_save,
>> ARRAY_SIZE(s5p64x0_misc_save));
>> +}
>> +
>> +void s3c_pm_save_core(void)
>> +{
>> + =A0 =A0 s3c_pm_do_save(s5p64x0_misc_save,
>> ARRAY_SIZE(s5p64x0_misc_save));
>> +
>> + =A0 =A0 if ((__raw_readl(S5P64X0_SYS_ID) & 0xFF000) =3D=3D 0x50000=
)
>> + =A0 =A0 =A0 =A0 =A0 =A0 s3c_pm_do_save(s5p6450_core_save,
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 ARRAY_SIZE=
(s5p6450_core_save));
>
> Same.
>
>> +
>> + =A0 =A0 s3c_pm_do_save(s5p64x0_core_save,
>> ARRAY_SIZE(s5p64x0_core_save));
>> +}
>> +
>> +static int s5p64x0_cpu_suspend(unsigned long arg)
>> +{
>> + =A0 =A0 unsigned long tmp =3D 0;
>> +
>> + =A0 =A0 /*
>> + =A0 =A0 =A0* Issue the standby signal into the pm unit. Note, we
>> + =A0 =A0 =A0* issue a write-buffer drain just in case.
>> + =A0 =A0 =A0*/
>> + =A0 =A0 asm("b 1f\n\t"
>> + =A0 =A0 =A0 =A0 ".align 5\n\t"
>> + =A0 =A0 =A0 =A0 "1:\n\t"
>> + =A0 =A0 =A0 =A0 "mcr p15, 0, %0, c7, c10, 5\n\t"
>> + =A0 =A0 =A0 =A0 "mcr p15, 0, %0, c7, c10, 4\n\t"
>> + =A0 =A0 =A0 =A0 "mcr p15, 0, %0, c7, c0, 4" : : "r" (tmp));
>> +
>> + =A0 =A0 /* we should never get past here */
>> + =A0 =A0 panic("sleep resumed to originator?");
>> +}
>> +
>> +/* mapping of interrupts to parts of the wakeup mask */
>> +static struct samsung_wakeup_mask s5p64x0_wake_irqs[] =3D {
>> + =A0 =A0 { .irq =3D IRQ_RTC_ALARM, .bit =3D
>> S5P64X0_PWRCFG_RTC_ALRM_DISABLE, },
>> + =A0 =A0 { .irq =3D IRQ_RTC_TIC, =A0 .bit =3D
>> S5P64X0_PWRCFG_RTC_TICK_DISABLE, },
>> + =A0 =A0 { .irq =3D IRQ_HSMMC0, =A0 =A0.bit =3D S5P64X0_PWRCFG_MMC0=
_DISABLE, },
>> + =A0 =A0 { .irq =3D IRQ_HSMMC1, =A0 =A0.bit =3D S5P64X0_PWRCFG_MMC1=
_DISABLE, },
>> +};
>> +
>> +static void s5p64x0_pm_prepare(void)
>> +{
>> + =A0 =A0 u32 tmp;
>> +
>> + =A0 =A0 samsung_sync_wakemask(S5P64X0_PWR_CFG,
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 s5p64x0_wake_irqs, ARRAY_S=
IZE(s5p64x0_wake_irqs));
>> +
>> + =A0 =A0 /* store the resume address in INFORM0 register */
>> + =A0 =A0 __raw_writel(virt_to_phys(s3c_cpu_resume), S5P64X0_INFORM0=
);
>> +
>> + =A0 =A0 /* setup clock gating for FIMGVG block */
>> + =A0 =A0 __raw_writel((__raw_readl(S5P64X0_CLK_GATE_HCLK1) | \
>> + =A0 =A0 =A0 =A0 =A0 =A0 (S5P64X0_CLKCON_HCLK1_FIMGVG)),
>> S5P64X0_CLK_GATE_HCLK1);
>> + =A0 =A0 __raw_writel((__raw_readl(S5P64X0_CLK_GATE_SCLK1) | \
>> + =A0 =A0 =A0 =A0 =A0 =A0 (S5P64X0_CLKCON_SCLK1_FIMGVG)),
>> S5P64X0_CLK_GATE_SCLK1);
>> +
>> + =A0 =A0 /* Configure the stabilization counter with wait time requ=
ired */
>> + =A0 =A0 __raw_writel(S5P64X0_PWR_STABLE_CNT_VAL_4,
>> S5P64X0_PWR_STABLE);
>> +
>> + =A0 =A0 /* set WFI to SLEEP mode configuration */
>> + =A0 =A0 tmp =3D __raw_readl(S5P64X0_SLEEP_CFG);
>> + =A0 =A0 tmp &=3D ~(S5P64X0_SLEEP_CFG_OSC_EN);
>> + =A0 =A0 __raw_writel(tmp, S5P64X0_SLEEP_CFG);
>> +
>> + =A0 =A0 tmp =3D __raw_readl(S5P64X0_PWR_CFG);
>> + =A0 =A0 tmp &=3D ~(S5P64X0_PWRCFG_CFG_WFI_MASK);
>> + =A0 =A0 tmp |=3D S5P64X0_PWRCFG_CFG_WFI_SLEEP;
>> + =A0 =A0 __raw_writel(tmp, S5P64X0_PWR_CFG);
>> +
>> + =A0 =A0 /*
>> + =A0 =A0 =A0* set OTHERS register to disable interrupt before going=
 to
>> + =A0 =A0 =A0* sleep. This bit is present only in S5P6450, it is res=
erved
>> + =A0 =A0 =A0* in S5P6440.
>> + =A0 =A0 =A0*/
>> + =A0 =A0 if ((__raw_readl(S5P64X0_SYS_ID) & 0xFF000) =3D=3D 0x50000=
) {
>> + =A0 =A0 =A0 =A0 =A0 =A0 tmp =3D __raw_readl(S5P64X0_OTHERS);
>> + =A0 =A0 =A0 =A0 =A0 =A0 tmp |=3D S5P6450_OTHERS_DISABLE_INT;
>> + =A0 =A0 =A0 =A0 =A0 =A0 __raw_writel(tmp, S5P64X0_OTHERS);
>> + =A0 =A0 }
>> +
>> + =A0 =A0 /* ensure previous wakeup state is cleared before sleeping=
 */
>> + =A0 =A0 __raw_writel(__raw_readl(S5P64X0_WAKEUP_STAT),
>> S5P64X0_WAKEUP_STAT);
>> +
>> +}
>> +
>> +static int s5p64x0_pm_add(struct sys_device *sysdev)
>> +{
>> + =A0 =A0 pm_cpu_prep =3D s5p64x0_pm_prepare;
>> + =A0 =A0 pm_cpu_sleep =3D s5p64x0_cpu_suspend;
>> + =A0 =A0 pm_uart_udivslot =3D 1;
>
> If pm_uart_udivslot has value, the UDIVSLOT3 is used...is this right =
on
> S5P64X0?
UDIVSLOT at an offset of 2C seems fine for 64X0.
>
>> +
>> + =A0 =A0 return 0;
>> +}
>> +
>> +static struct sysdev_driver s5p64x0_pm_driver =3D {
>> + =A0 =A0 .add =A0 =A0 =A0 =A0 =A0 =A0=3D s5p64x0_pm_add,
>> +};
>> +
>> +static __init int s5p64x0_pm_drvinit(void)
>> +{
>> + =A0 =A0 s3c_pm_init();
>> +
>> + =A0 =A0 return sysdev_driver_register(&s5p64x0_sysclass,
> &s5p64x0_pm_driver);
>> +}
>> +arch_initcall(s5p64x0_pm_drvinit);
>> +
>> +static void s5p64x0_pm_resume(void)
>> +{
>> + =A0 =A0 u32 tmp;
>> +
>> + =A0 =A0 tmp =3D __raw_readl(S5P64X0_OTHERS);
>> + =A0 =A0 tmp |=3D (S5P64X0_OTHERS_RET_MMC0 |
>> S5P64X0_OTHERS_RET_MMC1 | \
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 S5P64X0_OTHERS_RET_UART);
>> + =A0 =A0 __raw_writel(tmp , S5P64X0_OTHERS);
>> +}
>> +
>> +static struct syscore_ops s5p64x0_pm_syscore_ops =3D {
>> + =A0 =A0 .resume =A0 =A0 =A0 =A0 =3D s5p64x0_pm_resume,
>> +};
>> +
>> +static __init int s5p64x0_pm_syscore_init(void)
>> +{
>> + =A0 =A0 register_syscore_ops(&s5p64x0_pm_syscore_ops);
>> +
>> + =A0 =A0 return 0;
>> +}
>> +arch_initcall(s5p64x0_pm_syscore_init);
>> --
>> 1.7.4.1
>
> Basically, this codes need small fixing. I mean if this codes have be=
en
> tested on board and it works fine, it's ok to me.
>
> But as you said, s5p64x0 pm is almost same with s3c64xx, so we need t=
o clean
> them up next time :)
Has been tested for 6440 and 6450. Thanks for the review.
>
> Thanks.
>
> Best regards,
> Kgene.
Abhilash
> --
> Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
> SW Solution Development Team, Samsung Electronics Co., Ltd.
>
>
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
>
