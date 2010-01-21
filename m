From: Ben Dooks <ben-linux@fluff.org>
Subject: Re: [PATCH] ARM: S5P: Add Timer support
Date: Thu, 21 Jan 2010 08:23:20 +0000
Message-ID: <20100121082320.GA10014@trinity.fluff.org>
References: <1264060383-10107-1-git-send-email-kgene.kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from trinity.fluff.org ([89.16.178.74]:55329 "EHLO trinity.fluff.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754811Ab0AUIXW (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 21 Jan 2010 03:23:22 -0500
Content-Disposition: inline
In-Reply-To: <1264060383-10107-1-git-send-email-kgene.kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, ben-linux@fluff.org

On Thu, Jan 21, 2010 at 04:53:03PM +0900, Kukjin Kim wrote:
> This patch adds timer support common functions for S5P. Samsung S5P
> SoC uses the PWM timer for the system clock ticks and so reuses the
> s3c implementation of the timer. This patch also adds support
> definitions required by the s3c timer implementation.
> And files of same function remove in the mach-s5p6440/include/mach.

ok, will apply to next-samsung-s5p-updates
 
> Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
> ---
>  arch/arm/mach-s5p6440/include/mach/pwm-clock.h |   62 ---------------------
>  arch/arm/mach-s5p6440/include/mach/tick.h      |   24 --------
>  arch/arm/plat-s5p/include/mach/pwm-clock.h     |   69 ++++++++++++++++++++++++
>  arch/arm/plat-s5p/include/mach/tick.h          |   26 +++++++++
>  4 files changed, 95 insertions(+), 86 deletions(-)
>  delete mode 100644 arch/arm/mach-s5p6440/include/mach/pwm-clock.h
>  delete mode 100644 arch/arm/mach-s5p6440/include/mach/tick.h
>  create mode 100644 arch/arm/plat-s5p/include/mach/pwm-clock.h
>  create mode 100644 arch/arm/plat-s5p/include/mach/tick.h
> 
> diff --git a/arch/arm/mach-s5p6440/include/mach/pwm-clock.h b/arch/arm/mach-s5p6440/include/mach/pwm-clock.h
> deleted file mode 100644
> index c4bb7c5..0000000
> --- a/arch/arm/mach-s5p6440/include/mach/pwm-clock.h
> +++ /dev/null
> @@ -1,62 +0,0 @@
> -/* linux/arch/arm/mach-s5p6440/include/mach/pwm-clock.h
> - *
> - * Copyright 2008 Simtec Electronics
> - *      Ben Dooks <ben@simtec.co.uk>
> - *      http://armlinux.simtec.co.uk/
> - *
> - * Copyright 2009 Samsung Electronics Co., Ltd.
> - *		http://www.samsung.com/
> - *
> - * S5P6440 - pwm clock and timer support
> - *
> - * This program is free software; you can redistribute it and/or modify
> - * it under the terms of the GNU General Public License version 2 as
> - * published by the Free Software Foundation.
> -*/
> -
> -/**
> - * pwm_cfg_src_is_tclk() - return whether the given mux config is a tclk
> - * @cfg: The timer TCFG1 register bits shifted down to 0.
> - *
> - * Return true if the given configuration from TCFG1 is a TCLK instead
> - * any of the TDIV clocks.
> - */
> -static inline int pwm_cfg_src_is_tclk(unsigned long tcfg)
> -{
> -	return tcfg == S3C2410_TCFG1_MUX_TCLK;
> -}
> -
> -/**
> - * tcfg_to_divisor() - convert tcfg1 setting to a divisor
> - * @tcfg1: The tcfg1 setting, shifted down.
> - *
> - * Get the divisor value for the given tcfg1 setting. We assume the
> - * caller has already checked to see if this is not a TCLK source.
> - */
> -static inline unsigned long tcfg_to_divisor(unsigned long tcfg1)
> -{
> -	return 1 << (1 + tcfg1);
> -}
> -
> -/**
> - * pwm_tdiv_has_div1() - does the tdiv setting have a /1
> - *
> - * Return true if we have a /1 in the tdiv setting.
> - */
> -static inline unsigned int pwm_tdiv_has_div1(void)
> -{
> -	return 0;
> -}
> -
> -/**
> - * pwm_tdiv_div_bits() - calculate TCFG1 divisor value.
> - * @div: The divisor to calculate the bit information for.
> - *
> - * Turn a divisor into the necessary bit field for TCFG1.
> - */
> -static inline unsigned long pwm_tdiv_div_bits(unsigned int div)
> -{
> -	return ilog2(div) - 1;
> -}
> -
> -#define S3C_TCFG1_MUX_TCLK S3C2410_TCFG1_MUX_TCLK
> diff --git a/arch/arm/mach-s5p6440/include/mach/tick.h b/arch/arm/mach-s5p6440/include/mach/tick.h
> deleted file mode 100644
> index 0815aeb..0000000
> --- a/arch/arm/mach-s5p6440/include/mach/tick.h
> +++ /dev/null
> @@ -1,24 +0,0 @@
> -/* linux/arch/arm/mach-s5p6440/include/mach/tick.h
> - *
> - * Copyright (c) 2009 Samsung Electronics Co., Ltd.
> - *		http://www.samsung.com/
> - *
> - * S5P6440 - Timer tick support definitions
> - *
> - * This program is free software; you can redistribute it and/or modify
> - * it under the terms of the GNU General Public License version 2 as
> - * published by the Free Software Foundation.
> -*/
> -
> -#ifndef __ASM_ARCH_TICK_H
> -#define __ASM_ARCH_TICK_H __FILE__
> -
> -static inline u32 s3c24xx_ostimer_pending(void)
> -{
> -	u32 pend = __raw_readl(S5P_VA_VIC0 + VIC_RAW_STATUS);
> -	return pend & (1 << (IRQ_TIMER4_VIC - S5P_IRQ_VIC0(0)));
> -}
> -
> -#define TICK_MAX	(0xffffffff)
> -
> -#endif /* __ASM_ARCH_TICK_H */
> diff --git a/arch/arm/plat-s5p/include/mach/pwm-clock.h b/arch/arm/plat-s5p/include/mach/pwm-clock.h
> new file mode 100644
> index 0000000..6d35cc5
> --- /dev/null
> +++ b/arch/arm/plat-s5p/include/mach/pwm-clock.h
> @@ -0,0 +1,69 @@
> +/* linux/arch/arm/plat-s5p/include/mach/pwm-clock.h
> + *
> + * Copyright 2008 Simtec Electronics
> + *      Ben Dooks <ben@simtec.co.uk>
> + *      http://armlinux.simtec.co.uk/
> + *
> + * Copyright (c) 2009 Samsung Electronics Co., Ltd.
> + *		http://www.samsung.com/
> + *
> + * Based on arch/arm/plat-s3c24xx/include/mach/pwm-clock.h
> + *
> + * S5P pwm clock and timer support
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
> diff --git a/arch/arm/plat-s5p/include/mach/tick.h b/arch/arm/plat-s5p/include/mach/tick.h
> new file mode 100644
> index 0000000..9ab0c19
> --- /dev/null
> +++ b/arch/arm/plat-s5p/include/mach/tick.h
> @@ -0,0 +1,26 @@
> +/* linux/arch/arm/plat-s5pv210/include/mach/tick.h
> + *
> + * Copyright (c) 2009 Samsung Electronics Co., Ltd.
> + *		http://www.samsung.com/
> + *
> + * Based on arch/arm/mach-s3c6400/include/mach/tick.h
> + *
> + * S5P Timer tick support definitions
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
> -- 
> 1.6.2.5
> 

-- 
-- 
Ben

Q:      What's a light-year?
A:      One-third less calories than a regular year.
