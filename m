From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH] ARM: S3C24XX: remove unused gpio codes
Date: Wed, 31 Aug 2011 15:13:09 +0900
Message-ID: <001c01cc67a5$0e2ee1c0$2a8ca540$%kim@samsung.com>
References: <1309172936-10729-1-git-send-email-kgene.kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:41128 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753518Ab1HaGNK (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 31 Aug 2011 02:13:10 -0400
Received: from epcpsbgm1.samsung.com (mailout3.samsung.com [203.254.224.33])
 by mailout3.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LQS00GGL3X9ZL70@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 31 Aug 2011 15:13:09 +0900 (KST)
Received: from kgenekim (12-23-120-114.csky.net [12.23.120.114])
 by mmp1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0LQS00LIQ3XX0E@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 31 Aug 2011 15:13:09 +0900 (KST)
In-reply-to: <1309172936-10729-1-git-send-email-kgene.kim@samsung.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Kukjin Kim' <kgene.kim@samsung.com>, linux-samsung-soc@vger.kernel.org
Cc: ben-linux@fluff.org

Kukjin Kim wrote:
> 
> Cc: Ben Dooks <ben-linux@fluff.org>
> Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
> ---
>  arch/arm/mach-s3c2400/gpio.c |   42 ------------------------
>  arch/arm/mach-s3c2410/gpio.c |   72
------------------------------------------
>  arch/arm/mach-s3c2412/gpio.c |   62 ------------------------------------
>  3 files changed, 0 insertions(+), 176 deletions(-)
>  delete mode 100644 arch/arm/mach-s3c2400/gpio.c
>  delete mode 100644 arch/arm/mach-s3c2410/gpio.c
>  delete mode 100644 arch/arm/mach-s3c2412/gpio.c
> 
As a note, I applied this into my -cleanup branch except s3c2400 stuff
because it has been already removed before.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.

> diff --git a/arch/arm/mach-s3c2400/gpio.c b/arch/arm/mach-s3c2400/gpio.c
> deleted file mode 100644
> index 6c68e78..0000000
> --- a/arch/arm/mach-s3c2400/gpio.c
> +++ /dev/null
> @@ -1,42 +0,0 @@
> -/* linux/arch/arm/mach-s3c2400/gpio.c
> - *
> - * Copyright (c) 2006 Lucas Correia Villa Real <lucasvr@gobolinux.org>
> - *
> - * S3C2400 GPIO support
> - *
> - * This program is free software; you can redistribute it and/or modify
> - * it under the terms of the GNU General Public License as published by
> - * the Free Software Foundation; either version 2 of the License, or
> - * (at your option) any later version.
> - *
> - * This program is distributed in the hope that it will be useful,
> - * but WITHOUT ANY WARRANTY; without even the implied warranty of
> - * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> - * GNU General Public License for more details.
> - *
> - * You should have received a copy of the GNU General Public License
> - * along with this program; if not, write to the Free Software
> - * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307
USA
> -*/
> -
> -#include <linux/kernel.h>
> -#include <linux/init.h>
> -#include <linux/module.h>
> -#include <linux/interrupt.h>
> -#include <linux/ioport.h>
> -#include <linux/io.h>
> -
> -#include <mach/hardware.h>
> -#include <asm/irq.h>
> -
> -#include <mach/regs-gpio.h>
> -
> -int s3c2400_gpio_getirq(unsigned int pin)
> -{
> -	if (pin < S3C2410_GPE(0) || pin > S3C2400_GPE(7))
> -		return -EINVAL;  /* not valid interrupts */
> -
> -	return (pin - S3C2410_GPE(0)) + IRQ_EINT0;
> -}
> -
> -EXPORT_SYMBOL(s3c2400_gpio_getirq);
> diff --git a/arch/arm/mach-s3c2410/gpio.c b/arch/arm/mach-s3c2410/gpio.c
> deleted file mode 100644
> index 9664e01..0000000
> --- a/arch/arm/mach-s3c2410/gpio.c
> +++ /dev/null
> @@ -1,72 +0,0 @@
> -/* linux/arch/arm/mach-s3c2410/gpio.c
> - *
> - * Copyright (c) 2004-2006 Simtec Electronics
> - *	Ben Dooks <ben@simtec.co.uk>
> - *
> - * S3C2410 GPIO support
> - *
> - * This program is free software; you can redistribute it and/or modify
> - * it under the terms of the GNU General Public License as published by
> - * the Free Software Foundation; either version 2 of the License, or
> - * (at your option) any later version.
> - *
> - * This program is distributed in the hope that it will be useful,
> - * but WITHOUT ANY WARRANTY; without even the implied warranty of
> - * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> - * GNU General Public License for more details.
> - *
> - * You should have received a copy of the GNU General Public License
> - * along with this program; if not, write to the Free Software
> - * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307
USA
> - */
> -
> -#include <linux/kernel.h>
> -#include <linux/init.h>
> -#include <linux/module.h>
> -#include <linux/interrupt.h>
> -#include <linux/ioport.h>
> -#include <linux/io.h>
> -
> -#include <mach/hardware.h>
> -#include <mach/gpio-fns.h>
> -#include <asm/irq.h>
> -
> -#include <mach/regs-gpio.h>
> -
> -int s3c2410_gpio_irqfilter(unsigned int pin, unsigned int on,
> -			   unsigned int config)
> -{
> -	void __iomem *reg = S3C24XX_EINFLT0;
> -	unsigned long flags;
> -	unsigned long val;
> -
> -	if (pin < S3C2410_GPG(8) || pin > S3C2410_GPG(15))
> -		return -EINVAL;
> -
> -	config &= 0xff;
> -
> -	pin -= S3C2410_GPG(8);
> -	reg += pin & ~3;
> -
> -	local_irq_save(flags);
> -
> -	/* update filter width and clock source */
> -
> -	val = __raw_readl(reg);
> -	val &= ~(0xff << ((pin & 3) * 8));
> -	val |= config << ((pin & 3) * 8);
> -	__raw_writel(val, reg);
> -
> -	/* update filter enable */
> -
> -	val = __raw_readl(S3C24XX_EXTINT2);
> -	val &= ~(1 << ((pin * 4) + 3));
> -	val |= on << ((pin * 4) + 3);
> -	__raw_writel(val, S3C24XX_EXTINT2);
> -
> -	local_irq_restore(flags);
> -
> -	return 0;
> -}
> -
> -EXPORT_SYMBOL(s3c2410_gpio_irqfilter);
> diff --git a/arch/arm/mach-s3c2412/gpio.c b/arch/arm/mach-s3c2412/gpio.c
> deleted file mode 100644
> index 3404a87..0000000
> --- a/arch/arm/mach-s3c2412/gpio.c
> +++ /dev/null
> @@ -1,62 +0,0 @@
> -/* linux/arch/arm/mach-s3c2412/gpio.c
> - *
> - * Copyright (c) 2007 Simtec Electronics
> - *	Ben Dooks <ben@simtec.co.uk>
> - *
> - * http://armlinux.simtec.co.uk/.
> - *
> - * S3C2412/S3C2413 specific GPIO support
> - *
> - * This program is free software; you can redistribute it and/or modify
> - * it under the terms of the GNU General Public License version 2 as
> - * published by the Free Software Foundation.
> -*/
> -
> -#include <linux/kernel.h>
> -#include <linux/types.h>
> -#include <linux/module.h>
> -#include <linux/interrupt.h>
> -#include <linux/gpio.h>
> -
> -#include <asm/mach/arch.h>
> -#include <asm/mach/map.h>
> -
> -#include <mach/regs-gpio.h>
> -#include <mach/hardware.h>
> -
> -#include <plat/gpio-core.h>
> -
> -int s3c2412_gpio_set_sleepcfg(unsigned int pin, unsigned int state)
> -{
> -	struct s3c_gpio_chip *chip = s3c_gpiolib_getchip(pin);
> -	unsigned long offs = pin - chip->chip.base;
> -	unsigned long flags;
> -	unsigned long slpcon;
> -
> -	offs *= 2;
> -
> -	if (pin < S3C2410_GPB(0))
> -		return -EINVAL;
> -
> -	if (pin >= S3C2410_GPF(0) &&
> -	    pin <= S3C2410_GPG(16))
> -		return -EINVAL;
> -
> -	if (pin > S3C2410_GPH(16))
> -		return -EINVAL;
> -
> -	local_irq_save(flags);
> -
> -	slpcon = __raw_readl(chip->base + 0x0C);
> -
> -	slpcon &= ~(3 << offs);
> -	slpcon |= state << offs;
> -
> -	__raw_writel(slpcon, chip->base + 0x0C);
> -
> -	local_irq_restore(flags);
> -
> -	return 0;
> -}
> -
> -EXPORT_SYMBOL(s3c2412_gpio_set_sleepcfg);
> --
> 1.7.1
