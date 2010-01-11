From: Ben Dooks <ben-linux@fluff.org>
Subject: Re: [PATCH v3 4/7] ARM: S5P6440: Add Timer support
Date: Mon, 11 Jan 2010 06:19:11 +0000
Message-ID: <20100111061911.GF3738@trinity.fluff.org>
References: <1263182102-14490-1-git-send-email-kgene.kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from trinity.fluff.org ([89.16.178.74]:47292 "EHLO trinity.fluff.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751249Ab0AKGTM (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 11 Jan 2010 01:19:12 -0500
Content-Disposition: inline
In-Reply-To: <1263182102-14490-1-git-send-email-kgene.kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, ben-linux@fluff.org, Adityapratap Sharma <aditya.ps@samsung.com>, Thomas Abraham <thomas.ab@samsung.com>, Atul Dahiya <atul.dahiya@samsung.com>

On Mon, Jan 11, 2010 at 12:55:02PM +0900, Kukjin Kim wrote:
> This patch adds timer support for S5P6440 CPU.
> 
> Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
> Signed-off-by: Adityapratap Sharma <aditya.ps@samsung.com>
> Signed-off-by: Thomas Abraham <thomas.ab@samsung.com>
> Signed-off-by: Atul Dahiya <atul.dahiya@samsung.com>

looks ok, will merge

> ---
>  arch/arm/mach-s5p6440/include/mach/pwm-clock.h |   62 ++++++++++++++++++++++++
>  arch/arm/mach-s5p6440/include/mach/tick.h      |   24 +++++++++
>  2 files changed, 86 insertions(+), 0 deletions(-)
>  create mode 100644 arch/arm/mach-s5p6440/include/mach/pwm-clock.h
>  create mode 100644 arch/arm/mach-s5p6440/include/mach/tick.h
> 
> diff --git a/arch/arm/mach-s5p6440/include/mach/pwm-clock.h b/arch/arm/mach-s5p6440/include/mach/pwm-clock.h
> new file mode 100644
> index 0000000..c4bb7c5
> --- /dev/null
> +++ b/arch/arm/mach-s5p6440/include/mach/pwm-clock.h
> @@ -0,0 +1,62 @@
> +/* linux/arch/arm/mach-s5p6440/include/mach/pwm-clock.h
> + *
> + * Copyright 2008 Simtec Electronics
> + *      Ben Dooks <ben@simtec.co.uk>
> + *      http://armlinux.simtec.co.uk/
> + *
> + * Copyright 2009 Samsung Electronics Co., Ltd.
> + *		http://www.samsung.com/
> + *
> + * S5P6440 - pwm clock and timer support
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> +*/
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
> diff --git a/arch/arm/mach-s5p6440/include/mach/tick.h b/arch/arm/mach-s5p6440/include/mach/tick.h
> new file mode 100644
> index 0000000..0815aeb
> --- /dev/null
> +++ b/arch/arm/mach-s5p6440/include/mach/tick.h
> @@ -0,0 +1,24 @@
> +/* linux/arch/arm/mach-s5p6440/include/mach/tick.h
> + *
> + * Copyright (c) 2009 Samsung Electronics Co., Ltd.
> + *		http://www.samsung.com/
> + *
> + * S5P6440 - Timer tick support definitions
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
