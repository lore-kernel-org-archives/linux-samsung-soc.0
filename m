From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH 3/3] ARM: S5PV310: Add external interrupt support
Date: Fri, 15 Oct 2010 10:18:16 +0900
Message-ID: <001801cb6c06$da0252a0$8e06f7e0$%kim@samsung.com>
References: <1286450698-12029-1-git-send-email-jongsun.han@samsung.com>
 <1286450698-12029-4-git-send-email-jongsun.han@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:14174 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753276Ab0JOBR6 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 14 Oct 2010 21:17:58 -0400
Received: from epmmp1 (mailout4.samsung.com [203.254.224.34])
 by mailout4.samsung.com
 (Sun Java(tm) System Messaging Server 7u3-15.01 64bit (built Feb 12 2010))
 with ESMTP id <0LAB005504XX9840@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 15 Oct 2010 10:17:57 +0900 (KST)
Received: from kgenekim ([12.23.103.96])
 by mmp1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0LAB00LO04XWF0@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 15 Oct 2010 10:17:56 +0900 (KST)
In-reply-to: <1286450698-12029-4-git-send-email-jongsun.han@samsung.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Jongsun Han' <jongsun.han@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: ben-linux@fluff.org, 'Jongpill Lee' <boyko.lee@samsung.com>

Jongsun Han wrote:
> 
> This patch adds the external interrupt support.
> All external interrupts are transferred to GIC through interrupt combiner.
> 
> Signed-off-by: Jongsun Han <jongsun.han@samsung.com>
> Signed-off-by: Jongpill Lee <boyko.lee@samsung.com>
> ---
>  arch/arm/mach-s5pv310/Makefile   |    2 +-
>  arch/arm/mach-s5pv310/irq-eint.c |  257
> ++++++++++++++++++++++++++++++++++++++
>  2 files changed, 258 insertions(+), 1 deletions(-)
>  create mode 100644 arch/arm/mach-s5pv310/irq-eint.c
> 
> diff --git a/arch/arm/mach-s5pv310/Makefile
b/arch/arm/mach-s5pv310/Makefile
> index d17c8c7..7b91a9b 100644
> --- a/arch/arm/mach-s5pv310/Makefile
> +++ b/arch/arm/mach-s5pv310/Makefile
> @@ -13,7 +13,7 @@ obj-				:=
>  # Core support for S5PV310 system
> 
>  obj-$(CONFIG_CPU_S5PV310)	+= cpu.o init.o clock.o irq-combiner.o
> -obj-$(CONFIG_CPU_S5PV310)	+= setup-i2c0.o time.o
> +obj-$(CONFIG_CPU_S5PV310)	+= setup-i2c0.o time.o irq-eint.o
>  obj-$(CONFIG_CPU_FREQ)		+= cpufreq.o
> 
>  obj-$(CONFIG_SMP)		+= platsmp.o headsmp.o
> diff --git a/arch/arm/mach-s5pv310/irq-eint.c
b/arch/arm/mach-s5pv310/irq-eint.c
> new file mode 100644
> index 0000000..5eb464b
> --- /dev/null
> +++ b/arch/arm/mach-s5pv310/irq-eint.c
> @@ -0,0 +1,257 @@
> +/* linux/arch/arm/mach-s5pv310/irq-eint.c
> + *
> + * Copyright (c) 2010 Samsung Electronics Co., Ltd.
> + *		http://www.samsung.com
> + *
> + * S5PV310 - IRQ EINT support
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> +*/
> +
> +#include <linux/kernel.h>
> +#include <linux/interrupt.h>
> +#include <linux/irq.h>
> +#include <linux/io.h>
> +#include <linux/sysdev.h>
> +#include <linux/gpio.h>
> +
> +#include <plat/regs-irqtype.h>

We need really this?

> +#include <plat/pm.h>
> +#include <plat/cpu.h>
> +#include <plat/gpio-cfg.h>
> +
> +#include <mach/map.h>

No need...?

> +#include <mach/regs-gpio.h>
> +
> +static DEFINE_SPINLOCK(eint_lock);
> +
> +static unsigned int s5pv310_get_irq_nr(unsigned int number)
> +{
> +	u32 ret = 0;
> +
> +	switch (number) {
> +	case 0 ... 3:
> +		ret = (number + IRQ_EINT0);
> +		break;
> +	case 4 ... 7:
> +		ret = (number + (IRQ_EINT4 - 4));
> +		break;
> +	case 8 ... 15:
> +		ret = (number + (IRQ_EINT8 - 8));
> +		break;
> +	default:
> +		printk(KERN_ERR "number available : %d\n", number);
> +	}
> +
> +	return ret;
> +}
> +
> +static unsigned int s5pv310_irq_split(unsigned int number)
> +{
> +	u32 ret;
> +	u32 test = number;
> +
> +	ret = do_div(test, IRQ_EINT_BASE);
> +
> +	do_div(ret, 8);
> +
> +	return ret;
> +}

How about just use same method like other S5PC100 or S5PV210...I mean you
can use macro here instead s5pv310_irq_split()
See the plat-s5p/irq-eint.c and mach/regs-gpio.h.

> +
> +static unsigned int s5pv310_irq_to_bit(unsigned int irq)
> +{
> +	u32 ret;
> +	u32 tmp;
> +
> +	tmp = do_div(irq, IRQ_EINT_BASE);
> +
> +	ret = do_div(tmp, 8);
> +
> +	return 1 << ret;
> +}

Same...

(snip)

Hmm...
I think, we need to re-think about to use common s5p eint functions for
this.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
