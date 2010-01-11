From: Ben Dooks <ben-linux@fluff.org>
Subject: Re: [PATCH 3/3] ARM: SAMSUNG: Add idle support
Date: Mon, 11 Jan 2010 08:40:17 +0000
Message-ID: <20100111084017.GQ3738@trinity.fluff.org>
References: <1263180113-31605-1-git-send-email-kgene.kim@samsung.com> <1263180113-31605-2-git-send-email-kgene.kim@samsung.com> <1263180113-31605-3-git-send-email-kgene.kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from trinity.fluff.org ([89.16.178.74]:59262 "EHLO trinity.fluff.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752432Ab0AKIkT (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 11 Jan 2010 03:40:19 -0500
Content-Disposition: inline
In-Reply-To: <1263180113-31605-3-git-send-email-kgene.kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, ben-linux@fluff.org, Adityapratap Sharma <aditya.ps@samsung.com>, Thomas Abraham <thomas.ab@samsung.com>, Atul Dahiya <atul.dahiya@samsung.com>

On Mon, Jan 11, 2010 at 12:21:53PM +0900, Kukjin Kim wrote:
> This patch adds common idle functionality for all Samsung SoC's.

ok, merged.
 
> Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
> Signed-off-by: Adityapratap Sharma <aditya.ps@samsung.com>
> Signed-off-by: Thomas Abraham <thomas.ab@samsung.com>
> Signed-off-by: Atul Dahiya <atul.dahiya@samsung.com>
> ---
>  arch/arm/plat-samsung/include/mach/idle.h   |   18 +++++++++++++
>  arch/arm/plat-samsung/include/mach/system.h |   36 +++++++++++++++++++++++++++
>  2 files changed, 54 insertions(+), 0 deletions(-)
>  create mode 100644 arch/arm/plat-samsung/include/mach/idle.h
>  create mode 100644 arch/arm/plat-samsung/include/mach/system.h
> 
> diff --git a/arch/arm/plat-samsung/include/mach/idle.h b/arch/arm/plat-samsung/include/mach/idle.h
> new file mode 100644
> index 0000000..f3b5034
> --- /dev/null
> +++ b/arch/arm/plat-samsung/include/mach/idle.h
> @@ -0,0 +1,18 @@
> +/* linux/arch/arm/plat-samsung/include/mach/idle.h
> + *
> + * Copyright (c) 2009 Samsung Electronics Co., Ltd.
> + *		http://www.samsung.com/
> + *
> + * Idle support
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> +*/
> +
> +#ifndef __ASM_PLAT_IDLE_H
> +#define __ASM_PLAT_IDLE_H __FILE__
> +
> +extern void (*s3c_idle_fn)(void);
> +
> +#endif /* __ASM_PLAT_IDLE_H */
> diff --git a/arch/arm/plat-samsung/include/mach/system.h b/arch/arm/plat-samsung/include/mach/system.h
> new file mode 100644
> index 0000000..5377792
> --- /dev/null
> +++ b/arch/arm/plat-samsung/include/mach/system.h
> @@ -0,0 +1,36 @@
> +/* linux/arch/arm/plat-samsung/include/mach/idle.h
> + *
> + * Copyright (c) 2009 Samsung Electronics Co., Ltd.
> + *		http://www.samsung.com/
> + *
> + * Idle support
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> +*/
> +
> +#ifndef __ASM_PLAT_SYSTEM_H
> +#define __ASM_PLAT_SYSTEM_H __FILE__
> +
> +void (*s3c_idle_fn)(void);
> +
> +static void s3c_default_idle(void)
> +{
> +	/* nothing here yet */
> +}
> +
> +static void arch_idle(void)
> +{
> +	if (s3c_idle_fn != NULL)
> +		(s3c_idle_fn)();
> +	else
> +		s3c_default_idle();
> +}
> +
> +static void arch_reset(char mode, const char *cmd)
> +{
> +	/* nothing here yet */
> +}
> +
> +#endif /* __ASM_PLAT_SYSTEM_H */
> -- 
> 1.6.2.5
> 

-- 
-- 
Ben

Q:      What's a light-year?
A:      One-third less calories than a regular year.
