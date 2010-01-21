From: Ben Dooks <ben-linux@fluff.org>
Subject: Re: [PATCH v2 04/10] ARM: S5PV210: Add Timer support
Date: Thu, 21 Jan 2010 02:22:44 +0000
Message-ID: <20100121022244.GC10592@trinity.fluff.org>
References: <1264031821-2069-1-git-send-email-kgene.kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from trinity.fluff.org ([89.16.178.74]:43442 "EHLO trinity.fluff.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751439Ab0AUCWu (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 20 Jan 2010 21:22:50 -0500
Content-Disposition: inline
In-Reply-To: <1264031821-2069-1-git-send-email-kgene.kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, ben-linux@fluff.org

On Thu, Jan 21, 2010 at 08:57:01AM +0900, Kukjin Kim wrote:
> This patch adds timer support for S5PV210. S5PV210 uses the PWM timer
> for the system clock ticks and so S5PV210 reuses the s3c implementation
> of the timer. This patch also adds support definitions required by the
> s3c timer implementation.
> 
> Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
> ---
>  arch/arm/mach-s5pv210/include/mach/pwm-clock.h |   67 ++++++++++++++++++++++++
>  arch/arm/mach-s5pv210/include/mach/tick.h      |   24 +++++++++
>  2 files changed, 91 insertions(+), 0 deletions(-)
>  create mode 100644 arch/arm/mach-s5pv210/include/mach/pwm-clock.h
>  create mode 100644 arch/arm/mach-s5pv210/include/mach/tick.h
> 
> diff --git a/arch/arm/mach-s5pv210/include/mach/pwm-clock.h b/arch/arm/mach-s5pv210/include/mach/pwm-clock.h
> new file mode 100644
> index 0000000..4781f2f
> --- /dev/null
> +++ b/arch/arm/mach-s5pv210/include/mach/pwm-clock.h
> @@ -0,0 +1,67 @@
> +/* linux/arch/arm/mach-s5pv210/include/mach/pwm-clock.h
> + *
> + * Copyright 2008 Simtec Electronics
> + *      Ben Dooks <ben@simtec.co.uk>
> + *      http://armlinux.simtec.co.uk/
> + *
> + * Copyright 2010 Samsung Electronics Co., Ltd.
> + *		http://www.samsung.com/
> + *
> + * S5PV210 - pwm clock and timer support
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> +*/
> +
> +#ifndef __ASM_ARCH_PWMCLK_H
> +#define __ASM_ARCH_PWMCLK_H __FILE__
> +
> +/**
> + * pwm_cfg_src_is_tclk() - return whether the given mux config is a tclk
> + * @cfg: The timer TCFG1 register bits shifted down to 0.
> + *
> + * Return true if the given configuration from TCFG1 is a TCLK instead
> + * any of the TDIV clocks.
> + */
> +static inline int pwm_cfg_src_is_tclk(unsigned long tcfg)
> +{
> +	return tcfg == S3C2410_TCFG1_MUX_TCLK;
> +}
> +
> +/**
> + * tcfg_to_divisor() - convert tcfg1 setting to a divisor
> + * @tcfg1: The tcfg1 setting, shifted down.
> + *
> + * Get the divisor value for the given tcfg1 setting. We assume the
> + * caller has already checked to see if this is not a TCLK source.
> + */
> +static inline unsigned long tcfg_to_divisor(unsigned long tcfg1)
> +{
> +	return 1 << (1 + tcfg1);
> +}
> +
> +/**
> + * pwm_tdiv_has_div1() - does the tdiv setting have a /1
> + *
> + * Return true if we have a /1 in the tdiv setting.
> + */
> +static inline unsigned int pwm_tdiv_has_div1(void)
> +{
> +	return 0;
> +}
> +
> +/**
> + * pwm_tdiv_div_bits() - calculate TCFG1 divisor value.
> + * @div: The divisor to calculate the bit information for.
> + *
> + * Turn a divisor into the necessary bit field for TCFG1.
> + */
> +static inline unsigned long pwm_tdiv_div_bits(unsigned int div)
> +{
> +	return ilog2(div) - 1;
> +}
> +
> +#define S3C_TCFG1_MUX_TCLK S3C2410_TCFG1_MUX_TCLK
> +
> +#endif /* __ASM_ARCH_PWMCLK_H */

this looks like arch/arm/mach-s5p6440/include/mach/pwm-clock.h, even
worse it also looks like arch/arm/plat-s3c24xx/include/mach/pwm-clock.h
as well.

For the moment, it would be better to add arch/arm/plat-s5p/include/mach
and move the extant implementation here so everyone can use it before we
decided what to do next.

> diff --git a/arch/arm/mach-s5pv210/include/mach/tick.h b/arch/arm/mach-s5pv210/include/mach/tick.h
> new file mode 100644
> index 0000000..6abcb6a
> --- /dev/null
> +++ b/arch/arm/mach-s5pv210/include/mach/tick.h
> @@ -0,0 +1,24 @@
> +/* linux/arch/arm/mach-s5pv210/include/mach/tick.h
> + *
> + * Copyright (c) 2010 Samsung Electronics Co., Ltd.
> + *		http://www.samsung.com/
> + *
> + * S5PV210 - Timer tick support definitions
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> +*/
> +
> +#ifndef __ASM_ARCH_TICK_H
> +#define __ASM_ARCH_TICK_H __FILE__
> +
> +static inline u32 s3c24xx_ostimer_pending(void)
> +{
> +	u32 pend = __raw_readl(S5P_VA_VIC0 + VIC_RAW_STATUS);
> +	return pend & (1 << (IRQ_TIMER4_VIC - S5P_IRQ_VIC0(0)));
> +}
> +
> +#define TICK_MAX	(0xffffffff)
> +
> +#endif /* __ASM_ARCH_TICK_H */

Again, this looks like the S5P6440 implementation copied and named S5PV210
instead. See the previous comment about moving to plat-s5p/include/mach.

-- 
Ben

Q:      What's a light-year?
A:      One-third less calories than a regular year.
