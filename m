From: Kyungmin Park <kmpark@infradead.org>
Subject: Re: [PATCH] ARM: S5PV210: Add Power Management Support
Date: Tue, 4 May 2010 15:23:06 +0900
Message-ID: <w2y9c9fda241005032323ob2d781e4h2b5aefc540f602a7@mail.gmail.com>
References: <1272949341-23264-1-git-send-email-kgene.kim@samsung.com>
	 <20100504052643.GP2589@trinity.fluff.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-vw0-f46.google.com ([209.85.212.46]:39790 "EHLO
	mail-vw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755499Ab0EDGXJ convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 4 May 2010 02:23:09 -0400
Received: by vws19 with SMTP id 19so2534244vws.19
        for <linux-samsung-soc@vger.kernel.org>; Mon, 03 May 2010 23:23:07 -0700 (PDT)
In-Reply-To: <20100504052643.GP2589@trinity.fluff.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Ben Dooks <ben-linux@fluff.org>
Cc: Kukjin Kim <kgene.kim@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Jongpill Lee <boyko.lee@samsung.com>

On Tue, May 4, 2010 at 2:26 PM, Ben Dooks <ben-linux@fluff.org> wrote:
> On Tue, May 04, 2010 at 02:02:21PM +0900, Kukjin Kim wrote:
>> From: Jongpill Lee <boyko.lee@samsung.com>
>>
>> This patch adds suspend-to-ram support for S5PV210.
>>
>> Signed-off-by: Jongpill Lee <boyko.lee@samsung.com>
>> Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
>> ---
>> =A0arch/arm/mach-s5pv210/Kconfig =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0| =A0=
 =A06 +
>> =A0arch/arm/mach-s5pv210/Makefile =A0 =A0 =A0 =A0 =A0 =A0 =A0 | =A0 =
=A01 +
>> =A0arch/arm/mach-s5pv210/include/mach/pm-core.h | =A0 43 ++++++
>> =A0arch/arm/mach-s5pv210/include/mach/pm.h =A0 =A0 =A0| =A0 19 +++
>> =A0arch/arm/mach-s5pv210/mach-smdkc110.c =A0 =A0 =A0 =A0| =A0 =A08 +=
+
>> =A0arch/arm/mach-s5pv210/mach-smdkv210.c =A0 =A0 =A0 =A0| =A0 =A08 +=
+
>> =A0arch/arm/mach-s5pv210/pm.c =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 | =
=A0116 +++++++++++++++++
>> =A0arch/arm/plat-s5p/Makefile =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 | =
=A0 =A04 +
>> =A0arch/arm/plat-s5p/include/plat/pm-s5p.h =A0 =A0 =A0| =A0 23 +++
>> =A0arch/arm/plat-s5p/irq-pm.c =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 | =
=A0113 +++++++++++++++
>> =A0arch/arm/plat-s5p/pm.c =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 | =A0149 +++++++++++++++++++++
>> =A0arch/arm/plat-s5p/sleep.S =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
| =A0188 ++++++++++++++++++++++++++
>> =A0arch/arm/plat-samsung/pm-gpio.c =A0 =A0 =A0 =A0 =A0 =A0 =A0| =A0 =
=A04 +-
>> =A013 files changed, 680 insertions(+), 2 deletions(-)
>> =A0create mode 100644 arch/arm/mach-s5pv210/include/mach/pm-core.h
>> =A0create mode 100644 arch/arm/mach-s5pv210/include/mach/pm.h
>> =A0create mode 100644 arch/arm/mach-s5pv210/pm.c
>> =A0create mode 100644 arch/arm/plat-s5p/include/plat/pm-s5p.h
>> =A0create mode 100644 arch/arm/plat-s5p/irq-pm.c
>> =A0create mode 100644 arch/arm/plat-s5p/pm.c
>> =A0create mode 100644 arch/arm/plat-s5p/sleep.S
>>
>> diff --git a/arch/arm/mach-s5pv210/Kconfig b/arch/arm/mach-s5pv210/K=
config
>> index f636113..be0a013 100644
>> --- a/arch/arm/mach-s5pv210/Kconfig
>> +++ b/arch/arm/mach-s5pv210/Kconfig
>> @@ -12,6 +12,7 @@ if ARCH_S5PV210
>> =A0config CPU_S5PV210
>> =A0 =A0 =A0 bool
>> =A0 =A0 =A0 select PLAT_S5P
>> + =A0 =A0 select S5PV210_PM if PM
>> =A0 =A0 =A0 help
>> =A0 =A0 =A0 =A0 Enable S5PV210 CPU support
>>
>> @@ -43,4 +44,9 @@ config MACH_VOGUEV210
>>
>> =A0endchoice
>>
>> +config S5PV210_PM
>> + =A0 =A0 bool
>> + =A0 =A0 help
>> + =A0 =A0 =A0 Power Management code common to S5PV210
>> +
>> =A0endif
>> diff --git a/arch/arm/mach-s5pv210/Makefile b/arch/arm/mach-s5pv210/=
Makefile
>> index f1772ed..f31d6a4 100644
>> --- a/arch/arm/mach-s5pv210/Makefile
>> +++ b/arch/arm/mach-s5pv210/Makefile
>> @@ -13,6 +13,7 @@ obj- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0:=3D
>> =A0# Core support for S5PV210 system
>>
>> =A0obj-$(CONFIG_CPU_S5PV210) =A0 =A0+=3D cpu.o init.o clock.o gpio.o=
 irq-eint-group.o
>> +obj-$(CONFIG_S5PV210_PM) =A0 =A0 +=3D pm.o
>>
>> =A0# machine support
>>
>> diff --git a/arch/arm/mach-s5pv210/include/mach/pm-core.h b/arch/arm=
/mach-s5pv210/include/mach/pm-core.h
>> new file mode 100644
>> index 0000000..52050e4
>> --- /dev/null
>> +++ b/arch/arm/mach-s5pv210/include/mach/pm-core.h
>> @@ -0,0 +1,43 @@
>> +/* linux/arch/arm/mach-s5pv210/include/mach/pm-core.h
>> + *
>> + * Copyright (c) 2010 Samsung Electronics Co., Ltd.
>> + * =A0 =A0 =A0 =A0 =A0 http://www.samsung.com/
>> + *
>> + * Based on arch/arm/mach-s3c2410/include/mach/pm-core.h,
>> + * Copyright 2008 Simtec Electronics
>> + * =A0 =A0 =A0Ben Dooks <ben@simtec.co.uk>
>> + * =A0 =A0 =A0http://armlinux.simtec.co.uk/
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
>> + =A0 =A0 /* nothing here yet */
>> +}
>> +
>> +static inline void s3c_pm_arch_prepare_irqs(void)
>> +{
>> + =A0 =A0 __raw_writel(s3c_irqwake_intmask, S5P_WAKEUP_MASK);
>> + =A0 =A0 __raw_writel(s3c_irqwake_eintmask, S5P_EINT_WAKEUP_MASK);
>> +}
>> +
>> +static inline void s3c_pm_arch_stop_clocks(void)
>> +{
>> + =A0 =A0 /* nothing here yet */
>> +}
>> +
>> +static inline void s3c_pm_arch_show_resume_irqs(void)
>> +{
>> + =A0 =A0 /* nothing here yet */
>> +}
>> +
>> +static inline void s3c_pm_arch_update_uart(void __iomem *regs,
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0struct pm_uart_save *save)
>> +{
>> + =A0 =A0 /* nothing here yet */
>> +}
>> diff --git a/arch/arm/mach-s5pv210/include/mach/pm.h b/arch/arm/mach=
-s5pv210/include/mach/pm.h
>> new file mode 100644
>> index 0000000..897444b
>> --- /dev/null
>> +++ b/arch/arm/mach-s5pv210/include/mach/pm.h
>> @@ -0,0 +1,19 @@
>> +/* linux/arch/arm/mach-s5pv210/include/mach/pm.h
>> + *
>> + * Copyright (c) 2010 Samsung Electronics Co., Ltd.
>> + * =A0 =A0 =A0 =A0 =A0 http://www.samsung.com/
>> + *
>> + * S5PV210 - Headers for Power Management
>> + *
>> + * This program is free software; you can redistribute it and/or mo=
dify
>> + * it under the terms of the GNU General Public License version 2 a=
s
>> + * published by the Free Software Foundation.
>> +*/
>> +
>> +#ifndef __ASM_ARCH_PM_H
>> +#define __ASM_ARCH_PM_H __FILE__
>> +
>> +#include <plat/pm.h>
>> +#include <plat/pm-s5p.h>
>> +
>> +#endif /* __ASM_ARCH_PM_H */
>> diff --git a/arch/arm/mach-s5pv210/mach-smdkc110.c b/arch/arm/mach-s=
5pv210/mach-smdkc110.c
>> index 9c9829c..7c54ba3 100644
>> --- a/arch/arm/mach-s5pv210/mach-smdkc110.c
>> +++ b/arch/arm/mach-s5pv210/mach-smdkc110.c
>> @@ -26,6 +26,10 @@
>> =A0#include <plat/devs.h>
>> =A0#include <plat/cpu.h>
>>
>> +#if defined(CONFIG_PM)
>> +#include <mach/pm.h>
>> +#endif
>> +
>> =A0/* Following are default values for UCON, ULCON and UFCON UART re=
gisters */
>> =A0#define S5PV210_UCON_DEFAULT (S3C2410_UCON_TXILEVEL | =A0 =A0 =A0=
 =A0\
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0S3C24=
10_UCON_RXILEVEL | =A0 =A0 =A0 =A0\
>> @@ -83,6 +83,10 @@ static void __init smdkc110_map_io(void)
>>
>> =A0static void __init smdkc110_machine_init(void)
>> =A0{
>> +#if defined(CONFIG_PM)
>> + =A0 =A0 s3c_pm_init();
>> +#endif
>> +
>
> I think we should make s3c_pm_init() a null inline call if !CONFIG_PM=
=2E..
> and if you look, it is.
>
>> =A0 =A0 =A0 platform_add_devices(smdkc110_devices, ARRAY_SIZE(smdkc1=
10_devices));
>> =A0}
>>
>> diff --git a/arch/arm/mach-s5pv210/mach-smdkv210.c b/arch/arm/mach-s=
5pv210/mach-smdkv210.c
>> index 9c9829c..7c54ba3 100644
>> --- a/arch/arm/mach-s5pv210/mach-smdkv210.c
>> +++ b/arch/arm/mach-s5pv210/mach-smdkv210.c
>> @@ -26,6 +26,10 @@
>> =A0#include <plat/devs.h>
>> =A0#include <plat/cpu.h>
>>
>> +#if defined(CONFIG_PM)
>> +#include <mach/pm.h>
>> +#endif
>
> IIRC, just include without checking CONFIG_PM
>
>> =A0/* Following are default values for UCON, ULCON and UFCON UART re=
gisters */
>> =A0#define S5PV210_UCON_DEFAULT (S3C2410_UCON_TXILEVEL | =A0 =A0 =A0=
 =A0\
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0S3C24=
10_UCON_RXILEVEL | =A0 =A0 =A0 =A0\
>> @@ -83,6 +83,10 @@ static void __init smdkv210_map_io(void)
>>
>> =A0static void __init smdkv210_machine_init(void)
>> =A0{
>> +#if defined(CONFIG_PM)
>> + =A0 =A0 s3c_pm_init();
>> +#endif
>> +
>> =A0 =A0 =A0 platform_add_devices(smdkv210_devices, ARRAY_SIZE(smdkv2=
10_devices));
>> =A0}
>>
>> diff --git a/arch/arm/mach-s5pv210/pm.c b/arch/arm/mach-s5pv210/pm.c
>> new file mode 100644
>> index 0000000..b446e87
>> --- /dev/null
>> +++ b/arch/arm/mach-s5pv210/pm.c
>> @@ -0,0 +1,116 @@
>> +/* linux/arch/arm/mach-s5pv210/pm.c
>> + *
>> + * Copyright (c) 2010 Samsung Electronics Co., Ltd.
>> + * =A0 =A0 =A0 =A0 =A0 http://www.samsung.com/
>> + *
>> + * S5PV210 - Power Management support
>> + *
>> + * Based on arch/arm/mach-s3c2410/pm.c
>> + * Copyright (c) 2006 Simtec Electronics
>> + * =A0 Ben Dooks <ben@simtec.co.uk>
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
>> +#include <linux/errno.h>
>> +#include <linux/time.h>
>> +#include <linux/sysdev.h>
>> +#include <linux/io.h>
>> +
>> +#include <mach/hardware.h>
>> +
>> +#include <asm/mach-types.h>
>> +
>> +#include <mach/regs-gpio.h>
>> +#include <plat/cpu.h>
>> +#include <mach/pm.h>
>> +
>> +#include <mach/regs-irq.h>
>> +#include <mach/regs-clock.h>
>> +
>> +void s5pv210_cpu_suspend(void)
>> +{
>> + =A0 =A0 unsigned long tmp;
>> +
>> + =A0 =A0 /* issue the standby signal into the pm unit. Note, we
>> + =A0 =A0 =A0* issue a write-buffer drain just in case */
>> +
>> + =A0 =A0 tmp =3D 0;
>> +
>> + =A0 =A0 asm("b 1f\n\t"
>> + =A0 =A0 =A0 =A0 ".align 5\n\t"
>> + =A0 =A0 =A0 =A0 "1:\n\t"
>> + =A0 =A0 =A0 =A0 "mcr p15, 0, %0, c7, c10, 5\n\t"
>> + =A0 =A0 =A0 =A0 "mcr p15, 0, %0, c7, c10, 4\n\t"
>> + =A0 =A0 =A0 =A0 ".word 0xe320f003" : : "r" (tmp));
>> +
>> + =A0 =A0 /* we should never get past here */
>> + =A0 =A0 panic("sleep resumed to originator?");
>> +}
>> +
>> +static void s5pv210_pm_prepare(void)
>> +{
>> + =A0 =A0 unsigned int tmp;
>> +
>> + =A0 =A0 /* ensure at least INFORM0 has the resume address */
>> + =A0 =A0 __raw_writel(virt_to_phys(s3c_cpu_resume), S5P_INFORM0);
>> +
>> + =A0 =A0 tmp =3D __raw_readl(S5P_SLEEP_CFG);
>> + =A0 =A0 tmp &=3D ~(S5P_SLEEP_CFG_OSC_EN | S5P_SLEEP_CFG_USBOSC_EN)=
;
>> + =A0 =A0 __raw_writel(tmp, S5P_SLEEP_CFG);
>> +
>> + =A0 =A0 /* WFI for SLEEP mode configuration by SYSCON */
>> + =A0 =A0 tmp =3D __raw_readl(S5P_PWR_CFG);
>> + =A0 =A0 tmp &=3D S5P_CFG_WFI_CLEAN;
>> + =A0 =A0 tmp |=3D S5P_CFG_WFI_SLEEP;
>> + =A0 =A0 __raw_writel(tmp, S5P_PWR_CFG);
>> +
>> + =A0 =A0 /* SYSCON interrupt handling disable */
>> + =A0 =A0 tmp =3D __raw_readl(S5P_OTHERS);
>> + =A0 =A0 tmp |=3D S5P_OTHER_SYSC_INTOFF;
>> + =A0 =A0 __raw_writel(tmp, S5P_OTHERS);
>> +
>> + =A0 =A0 __raw_writel(0xffffffff, (VA_VIC0 + VIC_INT_ENABLE_CLEAR))=
;
>> + =A0 =A0 __raw_writel(0xffffffff, (VA_VIC1 + VIC_INT_ENABLE_CLEAR))=
;
>> + =A0 =A0 __raw_writel(0xffffffff, (VA_VIC2 + VIC_INT_ENABLE_CLEAR))=
;
>> + =A0 =A0 __raw_writel(0xffffffff, (VA_VIC3 + VIC_INT_ENABLE_CLEAR))=
;
>> +}
>> +
>> +static int s5pv210_pm_add(struct sys_device *sysdev)
>> +{
>> + =A0 =A0 pm_cpu_prep =3D s5pv210_pm_prepare;
>> + =A0 =A0 pm_cpu_sleep =3D s5pv210_cpu_suspend;
>> +
>> + =A0 =A0 return 0;
>> +}
>> +
>> +static struct sleep_save s5pv210_sleep[] =3D {
>> + =A0 =A0 /* nothing here yet */
>> +};
>> +
>> +static int s5pv210_pm_resume(struct sys_device *dev)
>> +{
>> + =A0 =A0 u32 tmp;
>> +
>> + =A0 =A0 tmp =3D __raw_readl(S5P_OTHERS);
>> + =A0 =A0 tmp |=3D (S5P_OTHERS_RET_IO | S5P_OTHERS_RET_MMC | S5P_OTH=
ERS_RET_UART);
>> + =A0 =A0 __raw_writel(tmp , S5P_OTHERS);

Don't you 'or'ing the RET_CF? I think it's missing.
RELEASE_RET_CF_IO [30] RELEASE_RET_CF_IO_IO is retention control signal=
=2E

>> +
>> + =A0 =A0 s3c_pm_do_restore(s5pv210_sleep, ARRAY_SIZE(s5pv210_sleep)=
);
>> + =A0 =A0 return 0;
>> +}
>> +
>> +static struct sysdev_driver s5pv210_pm_driver =3D {
>> + =A0 =A0 .add =A0 =A0 =A0 =A0 =A0 =A0=3D s5pv210_pm_add,
>> + =A0 =A0 .resume =A0 =A0 =A0 =A0 =3D s5pv210_pm_resume,
>> +};
>> +
>> +static __init int s5pv210_pm_drvinit(void)
>> +{
>> + =A0 =A0 return sysdev_driver_register(&s5pv210_sysclass, &s5pv210_=
pm_driver);
>> +}
>> +arch_initcall(s5pv210_pm_drvinit);
>> diff --git a/arch/arm/plat-s5p/Makefile b/arch/arm/plat-s5p/Makefile
>> index 00a7966..ac73bb1 100644
>> --- a/arch/arm/plat-s5p/Makefile
>> +++ b/arch/arm/plat-s5p/Makefile
>> @@ -19,3 +19,7 @@ obj-y =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 +=3D cpu.o
>> =A0obj-y =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0+=3D clock.o
>> =A0obj-y =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0+=3D irq.o irq-eint.o
>> =A0obj-y =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0+=3D setup-i2c0.o
>> +
>> +obj-$(CONFIG_PM) =A0 =A0 =A0 =A0 =A0 =A0 +=3D pm.o
>> +obj-$(CONFIG_PM) =A0 =A0 =A0 =A0 =A0 =A0 +=3D irq-pm.o
>> +obj-$(CONFIG_PM) =A0 =A0 =A0 =A0 =A0 =A0 +=3D sleep.o

Just one line?

>> diff --git a/arch/arm/plat-s5p/include/plat/pm-s5p.h b/arch/arm/plat=
-s5p/include/plat/pm-s5p.h
>> new file mode 100644
>> index 0000000..6bba23f
>> --- /dev/null
>> +++ b/arch/arm/plat-s5p/include/plat/pm-s5p.h
>> @@ -0,0 +1,23 @@
>> +/* linux/arch/arm/plat-s5p/include/plat/pm-s5p.h
>> + *
>> + * Copyright (c) 2010 Samsung Electronics Co., Ltd.
>> + * =A0 =A0 =A0 =A0 =A0 http://www.samsung.com/
>> + *
>> + * S5P - Definitions for Power Management
>> + *
>> + * This program is free software; you can redistribute it and/or mo=
dify
>> + * it under the terms of the GNU General Public License version 2 a=
s
>> + * published by the Free Software Foundation.
>> +*/
>> +
>> +/* helper functions to save/restore lists of registers. */
>> +
>> +#ifdef CONFIG_PM
>> +extern int s3c_irq_wake(unsigned int irqno, unsigned int state);
>> +extern int s5p_irq_suspend(struct sys_device *dev, pm_message_t sta=
te);
>> +extern int s5p_irq_resume(struct sys_device *dev);
>> +#else
>> +#define s3c_irq_wake NULL
>> +#define s5p_irq_suspend NULL
>> +#define s5p_irq_resume NULL
>> +#endif
>> diff --git a/arch/arm/plat-s5p/irq-pm.c b/arch/arm/plat-s5p/irq-pm.c
>> new file mode 100644
>> index 0000000..b6839d1
>> --- /dev/null
>> +++ b/arch/arm/plat-s5p/irq-pm.c
>> @@ -0,0 +1,113 @@
>> +/* linux/arch/arm/plat-s5p/irq-pm.c
>> + *
>> + * Copyright (c) 2010 Samsung Electronics Co., Ltd.
>> + * =A0 =A0 =A0 =A0 =A0 http://www.samsung.com/
>> + *
>> + * Based on arch/arm/plat-s3c24xx/irq-pm.c,
>> + * Copyright (c) 2003,2004 Simtec Electronics
>> + * =A0 Ben Dooks <ben@simtec.co.uk>
>> + * =A0 http://armlinux.simtec.co.uk/
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
>> +#include <mach/pm.h>
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
>> +unsigned long s3c_irqwake_intallow =A0 =3D 0x00000006L;
>> +unsigned long s3c_irqwake_eintallow =A0=3D 0xffffffffL;
>> +
>> +int s3c_irq_wake(unsigned int irqno, unsigned int state)
>> +{
>> + =A0 =A0 unsigned long irqbit;
>> +
>> + =A0 =A0 switch (irqno) {
>> + =A0 =A0 case IRQ_RTC_TIC:
>> + =A0 =A0 case IRQ_RTC_ALARM:
>> + =A0 =A0 =A0 =A0 =A0 =A0 irqbit =3D 1 << (irqno + 1 - IRQ_RTC_ALARM=
);
>> + =A0 =A0 =A0 =A0 =A0 =A0 if (!state)
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 s3c_irqwake_intmask |=3D i=
rqbit;
>> + =A0 =A0 =A0 =A0 =A0 =A0 else
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 s3c_irqwake_intmask &=3D ~=
irqbit;
>> + =A0 =A0 =A0 =A0 =A0 =A0 break;
>> + =A0 =A0 default:
>> + =A0 =A0 =A0 =A0 =A0 =A0 return -ENOENT;
>> + =A0 =A0 }
>> + =A0 =A0 return 0;
>> +}
>> +
>> +/* this lot should be really saved by the IRQ code */
>> +/* VICXADDRESSXX initilaization to be needed */
>> +static struct sleep_save irq_save[] =3D {
>> + =A0 =A0 SAVE_ITEM(VA_VIC0 + VIC_INT_SELECT),
>> + =A0 =A0 SAVE_ITEM(VA_VIC1 + VIC_INT_SELECT),
>> + =A0 =A0 SAVE_ITEM(VA_VIC2 + VIC_INT_SELECT),
>> + =A0 =A0 SAVE_ITEM(VA_VIC3 + VIC_INT_SELECT),
>> +
>> + =A0 =A0 SAVE_ITEM(VA_VIC0 + VIC_INT_ENABLE),
>> + =A0 =A0 SAVE_ITEM(VA_VIC1 + VIC_INT_ENABLE),
>> + =A0 =A0 SAVE_ITEM(VA_VIC2 + VIC_INT_ENABLE),
>> + =A0 =A0 SAVE_ITEM(VA_VIC3 + VIC_INT_ENABLE),
>> +
>> + =A0 =A0 SAVE_ITEM(VA_VIC0 + VIC_INT_SOFT),
>> + =A0 =A0 SAVE_ITEM(VA_VIC1 + VIC_INT_SOFT),
>> + =A0 =A0 SAVE_ITEM(VA_VIC2 + VIC_INT_SOFT),
>> + =A0 =A0 SAVE_ITEM(VA_VIC3 + VIC_INT_SOFT),
>> +};
>> +
>> +static struct sleep_save eint_save[] =3D {
>> + =A0 =A0 SAVE_ITEM(S5P_EINT30CON),
>> + =A0 =A0 SAVE_ITEM(S5P_EINT31CON),
>> + =A0 =A0 SAVE_ITEM(S5P_EINT32CON),
>> + =A0 =A0 SAVE_ITEM(S5P_EINT33CON),
>> +
>> + =A0 =A0 SAVE_ITEM(S5P_EINT30FLTCON0),
>> + =A0 =A0 SAVE_ITEM(S5P_EINT30FLTCON1),
>> + =A0 =A0 SAVE_ITEM(S5P_EINT31FLTCON0),
>> + =A0 =A0 SAVE_ITEM(S5P_EINT31FLTCON1),
>> + =A0 =A0 SAVE_ITEM(S5P_EINT32FLTCON0),
>> + =A0 =A0 SAVE_ITEM(S5P_EINT32FLTCON1),
>> + =A0 =A0 SAVE_ITEM(S5P_EINT33FLTCON0),
>> + =A0 =A0 SAVE_ITEM(S5P_EINT33FLTCON1),
>> +
>> + =A0 =A0 SAVE_ITEM(S5P_EINT30MASK),
>> + =A0 =A0 SAVE_ITEM(S5P_EINT31MASK),
>> + =A0 =A0 SAVE_ITEM(S5P_EINT32MASK),
>> + =A0 =A0 SAVE_ITEM(S5P_EINT33MASK),
>> +};
>> +
>> +int s5p_irq_suspend(struct sys_device *dev, pm_message_t state)
>> +{
>> + =A0 =A0 s3c_pm_do_save(eint_save, ARRAY_SIZE(eint_save));
>> + =A0 =A0 s3c_pm_do_save(irq_save, ARRAY_SIZE(irq_save));
>> +
>> + =A0 =A0 return 0;
>> +}
>> +
>> +int s5p_irq_resume(struct sys_device *dev)
>> +{
>> + =A0 =A0 s3c_pm_do_restore(irq_save, ARRAY_SIZE(irq_save));
>> + =A0 =A0 s3c_pm_do_restore(eint_save, ARRAY_SIZE(eint_save));
>> +
>> + =A0 =A0 return 0;
>> +}
>> diff --git a/arch/arm/plat-s5p/pm.c b/arch/arm/plat-s5p/pm.c
>> new file mode 100644
>> index 0000000..397b60a
>> --- /dev/null
>> +++ b/arch/arm/plat-s5p/pm.c
>> @@ -0,0 +1,149 @@
>> +/* linux/arch/arm/plat-s5p/pm.c
>> + *
>> + * Copyright (c) 2010 Samsung Electronics Co., Ltd.
>> + * =A0 =A0 =A0 =A0 =A0 =A0 =A0http://www.samsung.com/
>> + *
>> + * S5P Power Manager (Suspend-To-RAM) support
>> + *
>> + * Based on arch/arm/plat-s3c24xx/pm.c
>> + * Copyright (c) 2004,2006 Simtec Electronics
>> + * =A0 Ben Dooks <ben@simtec.co.uk>
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
>> +#include <linux/errno.h>
>> +#include <linux/time.h>
>> +#include <linux/gpio.h>
>> +#include <linux/interrupt.h>
>> +#include <linux/irq.h>
>> +#include <linux/ioport.h>
>> +#include <linux/delay.h>
>> +#include <linux/serial_core.h>
>> +#include <linux/io.h>
>> +#include <linux/platform_device.h>
>> +
>> +#include <asm/cacheflush.h>
>> +#include <mach/hardware.h>
>> +
>> +#include <mach/map.h>
>> +#include <plat/gpio-cfg.h>
>> +#include <plat/regs-serial.h>
>> +#include <plat/regs-timer.h>
>> +#include <mach/regs-clock.h>
>> +#include <mach/regs-mem.h>
>> +#include <mach/regs-irq.h>
>> +
>> +#include <asm/mach/time.h>
>> +
>> +#include <mach/pm.h>
>> +
>> +#define PFX "s5p pm: "
>> +
>> +static struct sleep_save core_save[] =3D {
>> + =A0 =A0 /* Clock source */
>> + =A0 =A0 SAVE_ITEM(S5P_CLK_SRC0),
>> + =A0 =A0 SAVE_ITEM(S5P_CLK_SRC1),
>> + =A0 =A0 SAVE_ITEM(S5P_CLK_SRC2),
>> + =A0 =A0 SAVE_ITEM(S5P_CLK_SRC3),
>> + =A0 =A0 SAVE_ITEM(S5P_CLK_SRC4),
>> + =A0 =A0 SAVE_ITEM(S5P_CLK_SRC5),
>> + =A0 =A0 SAVE_ITEM(S5P_CLK_SRC6),
>> +
>> + =A0 =A0 /* Clock source Mask */
>> + =A0 =A0 SAVE_ITEM(S5P_CLK_SRC_MASK0),
>> + =A0 =A0 SAVE_ITEM(S5P_CLK_SRC_MASK1),
>> +
>> + =A0 =A0 /* Clock Divider */
>> + =A0 =A0 SAVE_ITEM(S5P_CLK_DIV0),
>> + =A0 =A0 SAVE_ITEM(S5P_CLK_DIV1),
>> + =A0 =A0 SAVE_ITEM(S5P_CLK_DIV2),
>> + =A0 =A0 SAVE_ITEM(S5P_CLK_DIV3),
>> + =A0 =A0 SAVE_ITEM(S5P_CLK_DIV4),
>> + =A0 =A0 SAVE_ITEM(S5P_CLK_DIV5),
>> + =A0 =A0 SAVE_ITEM(S5P_CLK_DIV6),
>> + =A0 =A0 SAVE_ITEM(S5P_CLK_DIV7),
>> +
>> + =A0 =A0 /* Clock Main Gate */
>> + =A0 =A0 SAVE_ITEM(S5P_CLKGATE_MAIN0),
>> + =A0 =A0 SAVE_ITEM(S5P_CLKGATE_MAIN1),
>> + =A0 =A0 SAVE_ITEM(S5P_CLKGATE_MAIN2),
>> +
>> + =A0 =A0 /* Clock source Peri Gate */
>> + =A0 =A0 SAVE_ITEM(S5P_CLKGATE_PERI0),
>> + =A0 =A0 SAVE_ITEM(S5P_CLKGATE_PERI1),
>> +
>> + =A0 =A0 /* Clock source SCLK Gate */
>> + =A0 =A0 SAVE_ITEM(S5P_CLKGATE_SCLK0),
>> + =A0 =A0 SAVE_ITEM(S5P_CLKGATE_SCLK1),
>> +
>> + =A0 =A0 /* Clock IP Clock gate */
>> + =A0 =A0 SAVE_ITEM(S5P_CLKGATE_IP0),
>> + =A0 =A0 SAVE_ITEM(S5P_CLKGATE_IP1),
>> + =A0 =A0 SAVE_ITEM(S5P_CLKGATE_IP2),
>> + =A0 =A0 SAVE_ITEM(S5P_CLKGATE_IP3),
>> + =A0 =A0 SAVE_ITEM(S5P_CLKGATE_IP4),
>> +
>> + =A0 =A0 /* Clock Blcok and Bus gate */
>> + =A0 =A0 SAVE_ITEM(S5P_CLKGATE_BLOCK),
>> + =A0 =A0 SAVE_ITEM(S5P_CLKGATE_BUS0),
>> +
>> + =A0 =A0 /* Clock ETC */
>> + =A0 =A0 SAVE_ITEM(S5P_CLK_OUT),
>> +
>> + =A0 =A0 /* PWM Register */
>> + =A0 =A0 SAVE_ITEM(S3C2410_TCFG0),
>> + =A0 =A0 SAVE_ITEM(S3C2410_TCFG1),
>> + =A0 =A0 SAVE_ITEM(S3C64XX_TINT_CSTAT),
>> + =A0 =A0 SAVE_ITEM(S3C2410_TCON),
>> + =A0 =A0 SAVE_ITEM(S3C2410_TCNTB(0)),
>> + =A0 =A0 SAVE_ITEM(S3C2410_TCMPB(0)),
>> + =A0 =A0 SAVE_ITEM(S3C2410_TCNTO(0)),
>> +};
>> +
>> +static struct sleep_save sromc_save[] =3D {
>> + =A0 =A0 SAVE_ITEM(S5P_SROM_BW),
>> + =A0 =A0 SAVE_ITEM(S5P_SROM_BC0),
>> + =A0 =A0 SAVE_ITEM(S5P_SROM_BC1),
>> + =A0 =A0 SAVE_ITEM(S5P_SROM_BC2),
>> + =A0 =A0 SAVE_ITEM(S5P_SROM_BC3),
>> + =A0 =A0 SAVE_ITEM(S5P_SROM_BC4),
>> + =A0 =A0 SAVE_ITEM(S5P_SROM_BC5),
>> +};
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
>> + =A0 =A0 /* nothing here yet */
>> +}
>> +
>> +/* s3c_pm_configure_extint
>> + *
>> + * configure all external interrupt pins
>> +*/
>> +
>> +void s3c_pm_configure_extint(void)
>> +{
>> + =A0 =A0 /* nothing here yet */
>> +}
>> +
>> +void s3c_pm_restore_core(void)
>> +{
>> + =A0 =A0 s3c_pm_do_restore_core(core_save, ARRAY_SIZE(core_save));
>> + =A0 =A0 s3c_pm_do_restore(sromc_save, ARRAY_SIZE(sromc_save));
>> +}
>> +
>> +void s3c_pm_save_core(void)
>> +{
>> + =A0 =A0 s3c_pm_do_save(sromc_save, ARRAY_SIZE(sromc_save));
>> + =A0 =A0 s3c_pm_do_save(core_save, ARRAY_SIZE(core_save));
>> +}
>> diff --git a/arch/arm/plat-s5p/sleep.S b/arch/arm/plat-s5p/sleep.S
>> new file mode 100644
>> index 0000000..ca9f08e
>> --- /dev/null
>> +++ b/arch/arm/plat-s5p/sleep.S
>> @@ -0,0 +1,188 @@
>> +/* linux/arch/arm/plat-s5p/sleep.S
>> + *
>> + * Copyright (c) 2010 Samsung Electronics Co., Ltd.
>> + * =A0 =A0 =A0 =A0 =A0 http://www.samsung.com/
>> + *
>> + * S5PV210 power Manager (Suspend-To-RAM) support
>> + * Based on S3C2410 sleep code by:
>> + * =A0 Ben Dooks, (c) 2004 Simtec Electronics
>> + *
>> + * Based on PXA/SA1100 sleep code by:
>> + * =A0 Nicolas Pitre, (c) 2002 Monta Vista Software Inc
>> + * =A0 Cliff Brake, (c) 2001
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
>> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. =A0See the
>> + * GNU General Public License for more details.
>> + *
>> + * You should have received a copy of the GNU General Public Licens=
e
>> + * along with this program; if not, write to the Free Software
>> + * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA =A00211=
1-1307 =A0USA
>> +*/
>> +
>> +#include <linux/linkage.h>
>> +#include <asm/assembler.h>
>> +#include <mach/hardware.h>
>> +#include <mach/map.h>
>> +#include <asm/asm-offsets.h>
>> +#include <asm/memory.h>
>> +#include <asm/system.h>
>> +
>> +#include <mach/regs-gpio.h>
>> +#include <mach/regs-clock.h>
>> +#include <mach/regs-mem.h>
>> +#include <plat/regs-serial.h>
>> +
>> +/* CONFIG_DEBUG_RESUME is dangerous if your bootloader does not
>> + * reset the UART configuration, only enable if you really need thi=
s!
>> +*/
>> + =A0 =A0 .text
>> +
>> + =A0 =A0 /* s3c_cpu_save
>> + =A0 =A0 =A0*
>> + =A0 =A0 =A0* entry:
>> + =A0 =A0 =A0* =A0 =A0 =A0r0 =3D save address (virtual addr of s3c_s=
leep_save_phys)
>> + =A0 =A0 */
>> +
>> +ENTRY(s3c_cpu_save)
>> +
>> + =A0 =A0 stmfd =A0 sp!, { r3 - r12, lr }
>> +
>> + =A0 =A0 mrc =A0 =A0 p15, 0, r4, c13, c0, 0 =A0@ FCSE/PID
>> + =A0 =A0 mrc =A0 =A0 p15, 0, r5, c3, c0, 0 =A0 @ Domain ID
>> + =A0 =A0 mrc =A0 =A0 p15, 0, r6, c2, c0, 0 =A0 @ Translation Table =
BASE0
>> + =A0 =A0 mrc =A0 =A0 p15, 0, r7, c2, c0, 1 =A0 @ Translation Table =
BASE1
>> + =A0 =A0 mrc =A0 =A0 p15, 0, r8, c2, c0, 2 =A0 @ Translation Table =
Control
>> + =A0 =A0 mrc =A0 =A0 p15, 0, r9, c1, c0, 0 =A0 @ Control register
>> + =A0 =A0 mrc =A0 =A0 p15, 0, r10, c1, c0, 1 =A0@ Auxiliary control =
register
>> + =A0 =A0 mrc =A0 =A0 p15, 0, r11, c1, c0, 2 =A0@ Co-processor acces=
s controls
>> + =A0 =A0 mrc =A0 =A0 p15, 0, r12, c10, c2, 0 @ Read PRRR
>> + =A0 =A0 mrc =A0 =A0 p15, 0, r3, c10, c2, 1 =A0@ READ NMRR
>> +
>> + =A0 =A0 stmia =A0 r0, { r3 - r13 }
>> +
>> + =A0 =A0 @@ write our state back to RAM
>> + =A0 =A0 bl =A0 =A0 =A0s3c_pm_cb_flushcache
>> +
>> + =A0 =A0 @@ jump to final code to send system to sleep
>> + =A0 =A0 ldr =A0 =A0 r0, =3Dpm_cpu_sleep
>> + =A0 =A0 @@ldr =A0 pc, [ r0 ]
>> + =A0 =A0 ldr =A0 =A0 r0, [ r0 ]
>> + =A0 =A0 mov =A0 =A0 pc, r0
>> +
>> + =A0 =A0 @@ return to the caller, after having the MMU
>> + =A0 =A0 @@ turned on, this restores the last bits from the
>> + =A0 =A0 @@ stack
>> +resume_with_mmu:
>> + =A0 =A0 /* delete added mmu table list */
>> + =A0 =A0 ldr =A0 =A0 r9 , =3D(PAGE_OFFSET - PHYS_OFFSET)
>
> this looks like an utter hack...
>
> please see comments abotu explaining why this is needed so we can thi=
nk
> if there is a better way to get this done.
>
>> + =A0 =A0 add =A0 =A0 r4, r4, r9
>> + =A0 =A0 str =A0 =A0 r12, [r4]
>> +
>> + =A0 =A0 ldmfd =A0 sp!, { r3 - r12, pc }
>> +
>> + =A0 =A0 .ltorg
>> +
>> + =A0 =A0 @@ the next bits sit in the .data segment, even though the=
y
>> + =A0 =A0 @@ happen to be code... the s5pv210_sleep_save_phys needs =
to be
>
> s5pv210_sleep_save_phys and then s3c_sleep_save_phys? do not match...
>
>> + =A0 =A0 @@ accessed by the resume code before it can restore the M=
MU.
>> + =A0 =A0 @@ This means that the variable has to be close enough for=
 the
>> + =A0 =A0 @@ code to read it... since the .text segment needs to be =
RO,
>> + =A0 =A0 @@ the data segment can be the only place to put this code=
=2E
>> +
>> + =A0 =A0 .data
>> +
>> + =A0 =A0 .global s3c_sleep_save_phys
>> +s3c_sleep_save_phys:
>> + =A0 =A0 .word =A0 0
>> +
>> +
>> + =A0 =A0 /* sleep magic, to allow the bootloader to check for an va=
lid
>> + =A0 =A0 =A0* image to resume to. Must be the first word before the
>> + =A0 =A0 =A0* s5pv210_cpu_resume entry.
>> + =A0 =A0 */
>> +
>> + =A0 =A0 .word =A0 0x2bedf00d
>> +
>> + =A0 =A0 /* s3c_cpu_resume
>> + =A0 =A0 =A0*
>> + =A0 =A0 =A0* resume code entry for bootloader to call
>> + =A0 =A0 =A0*
>> + =A0 =A0 =A0* we must put this code here in the data segment as we =
have no
>> + =A0 =A0 =A0* other way of restoring the stack pointer after sleep,=
 and we
>> + =A0 =A0 =A0* must not write to the code segment (code is read-only=
)
>> + =A0 =A0 */
>> +
>> +ENTRY(s3c_cpu_resume)
>> + =A0 =A0 mov =A0 =A0 r0, #PSR_I_BIT | PSR_F_BIT | SVC_MODE
>> + =A0 =A0 msr =A0 =A0 cpsr_c, r0
>> +
>> + =A0 =A0 @@ load UART to allow us to print the two characters for
>> + =A0 =A0 @@ resume debug
>> +
>> + =A0 =A0 mov =A0 =A0 r1, #0
>> + =A0 =A0 mcr =A0 =A0 p15, 0, r1, c8, c7, 0 =A0 =A0 =A0 =A0 =A0 @@ i=
nvalidate TLBs
>> + =A0 =A0 mcr =A0 =A0 p15, 0, r1, c7, c5, 0 =A0 =A0 =A0 =A0 =A0 @@ i=
nvalidate I Cache
>> +
>> + =A0 =A0 ldr =A0 =A0 r0, s3c_sleep_save_phys @ address of restore b=
lock
>> + =A0 =A0 ldmia =A0 r0, { r3 - r13 }
>> +
>> + =A0 =A0 mcr =A0 =A0 p15, 0, r4, c13, c0, 0 =A0@ FCSE/PID
>> + =A0 =A0 mcr =A0 =A0 p15, 0, r5, c3, c0, 0 =A0 @ Domain ID
>> +
>> + =A0 =A0 mcr =A0 =A0 p15, 0, r8, c2, c0, 2 =A0 @ Translation Table =
Control
>> + =A0 =A0 mcr =A0 =A0 p15, 0, r7, c2, c0, 1 =A0 @ Translation Table =
BASE1
>> + =A0 =A0 mcr =A0 =A0 p15, 0, r6, c2, c0, 0 =A0 @ Translation Table =
BASE0
>> +
>> + =A0 =A0 mcr =A0 =A0 p15, 0, r10, c1, c0, 1 =A0@ Auxiliary control =
register
>> +
>> + =A0 =A0 mov =A0 =A0 r0, #0
>> + =A0 =A0 mcr =A0 =A0 p15, 0, r0, c8, c7, 0 =A0 @ Invalidate I & D T=
LB
>> +
>> + =A0 =A0 mov =A0 =A0 r0, #0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0@ re=
store copro access controls
>> + =A0 =A0 mcr =A0 =A0 p15, 0, r11, c1, c0, 2 =A0@ Co-processor acces=
s controls
>> + =A0 =A0 mcr =A0 =A0 p15, 0, r0, c7, c5, 4
>> +
>> + =A0 =A0 mcr =A0 =A0 p15, 0, r12, c10, c2, 0 @ write PRRR
>> + =A0 =A0 mcr =A0 =A0 p15, 0, r3, c10, c2, 1 =A0@ write NMRR
>> +
>> + =A0 =A0 /* calculate first section address into r8 */
>
> please add an explantation of why you feel the need to play about wit=
h
> the MMU here, it is something I'm sure that other people would like t=
o
> find out about.

and modify correct register number instead of 'r8'.
>
>> + =A0 =A0 mov =A0 =A0 r4, r6
>> + =A0 =A0 ldr =A0 =A0 r5, =3D0x3fff
>> + =A0 =A0 bic =A0 =A0 r4, r4, r5
>
> two shifts would have got this done more efficiently.
>
>> + =A0 =A0 ldr =A0 =A0 r11, =3D0xe010f000
>> + =A0 =A0 ldr =A0 =A0 r10, [r11, #0]
>> + =A0 =A0 mov =A0 =A0 r10, r10 ,LSR #18
>> + =A0 =A0 bic =A0 =A0 r10, r10, #0x3
>> + =A0 =A0 orr =A0 =A0 r4, r4, r10
>> +
>> + =A0 =A0 /* calculate mmu list value into r9 */
>> + =A0 =A0 mov =A0 =A0 r10, r10, LSL #18
>> + =A0 =A0 ldr =A0 =A0 r5, =3D0x40e
>> + =A0 =A0 orr =A0 =A0 r10, r10, r5

Not matched the used register and commented register.
>> +
>> + =A0 =A0 /* back up originally data */
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 original
>
>> +
>> + =A0 =A0 ldr =A0 =A0 r12, [r4]
>> +
>> + =A0 =A0 /* Added list about mmu */
>> + =A0 =A0 str =A0 =A0 r10, [r4]
>> +
>> + =A0 =A0 ldr =A0 =A0 r2, =3Dresume_with_mmu
>> + =A0 =A0 mcr =A0 =A0 p15, 0, r9, c1, c0, 0 =A0 =A0 =A0 =A0 =A0 @ tu=
rn on MMU, etc
>> +
>> + =A0 =A0 =A0 =A0nop
>> + =A0 =A0 =A0 =A0nop
>> + =A0 =A0 =A0 =A0nop
>> + =A0 =A0 =A0 =A0nop
>> + =A0 =A0 =A0 =A0nop =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0@ second-to-last before mmu
>> +
>> + =A0 =A0 mov =A0 =A0 pc, r2 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0@ go back to virtual address
>> +
>> + =A0 =A0 .ltorg
>> diff --git a/arch/arm/plat-samsung/pm-gpio.c b/arch/arm/plat-samsung=
/pm-gpio.c
>> index 69a4c7f..88ab73c 100644
>> --- a/arch/arm/plat-samsung/pm-gpio.c
>> +++ b/arch/arm/plat-samsung/pm-gpio.c
>> @@ -192,7 +192,7 @@ struct s3c_gpio_pm s3c_gpio_pm_2bit =3D {
>> =A0 =A0 =A0 .resume =3D s3c_gpio_pm_2bit_resume,
>> =A0};
>>
>> -#ifdef CONFIG_ARCH_S3C64XX
>> +#if defined(CONFIG_ARCH_S3C64XX) || defined(CONFIG_PLAT_S5P)
>
> looks like this probably wants its own kconfig variable. however not
> going to get you to change that now.
>
>> =A0static void s3c_gpio_pm_4bit_save(struct s3c_gpio_chip *chip)
>> =A0{
>> =A0 =A0 =A0 chip->pm_save[1] =3D __raw_readl(chip->base + OFFS_CON);
>> @@ -302,7 +302,7 @@ struct s3c_gpio_pm s3c_gpio_pm_4bit =3D {
>> =A0 =A0 =A0 .save =A0 =3D s3c_gpio_pm_4bit_save,
>> =A0 =A0 =A0 .resume =3D s3c_gpio_pm_4bit_resume,
>> =A0};
>> -#endif /* CONFIG_ARCH_S3C64XX */
>> +#endif /* CONFIG_ARCH_S3C64XX || CONFIG_PLAT_S5P */
>>
>> =A0/**
>> =A0 * s3c_pm_save_gpio() - save gpio chip data for suspend
>> --
>
Thank you,
Kyungmin Park
