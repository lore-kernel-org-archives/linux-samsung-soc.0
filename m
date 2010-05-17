From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH 2/3] ARM: Samsung: move common I2C0 device helpers to
 machine	directories
Date: Mon, 17 May 2010 22:14:19 +0900
Message-ID: <004701caf5c2$ddfdf8b0$99f9ea10$%kim@samsung.com>
References: <1274077795-30873-1-git-send-email-m.szyprowski@samsung.com>
 <1274077795-30873-3-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:51856 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755147Ab0EQNOX (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 17 May 2010 09:14:23 -0400
Received: from epmmp1 (mailout2.samsung.com [203.254.224.25])
 by mailout1.samsung.com
 (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTP id <0L2K00J2RFFWW4@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 17 May 2010 22:14:21 +0900 (KST)
Received: from kgenekim ([12.23.103.96])
 by mmp1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0L2K001Z4FFWKK@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 17 May 2010 22:14:21 +0900 (KST)
In-reply-to: <1274077795-30873-3-git-send-email-m.szyprowski@samsung.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Marek Szyprowski' <m.szyprowski@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: kyungmin.park@samsung.com, ben-linux@fluff.org

Marek Szyprowski wrote:
> 
> I2C0 device helper depend on GPIO pin defines that are SoC specific.
> This patch copies the dummy i2c0 setup code to the respective mach-s5p*
> directories, so each SoC will be able to implement using its own
> defines.

Yes, right.

Looks good except header of mach-s5pv210/setup-i2c0.c

And as I reviewed, how about re-submitting this patch with c100 i2c moving?

> 
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
> ---
>  arch/arm/mach-s5p6440/Makefile     |    1 +
>  arch/arm/mach-s5p6440/setup-i2c0.c |   25 +++++++++++++++++++++++++
>  arch/arm/mach-s5p6442/Makefile     |    1 +
>  arch/arm/mach-s5p6442/setup-i2c0.c |   25 +++++++++++++++++++++++++
>  arch/arm/mach-s5pv210/Makefile     |    1 +
>  arch/arm/mach-s5pv210/setup-i2c0.c |   25 +++++++++++++++++++++++++
>  arch/arm/plat-s5p/Makefile         |    1 -
>  arch/arm/plat-s5p/setup-i2c0.c     |   25 -------------------------
>  8 files changed, 78 insertions(+), 26 deletions(-)
>  create mode 100644 arch/arm/mach-s5p6440/setup-i2c0.c
>  create mode 100644 arch/arm/mach-s5p6442/setup-i2c0.c
>  create mode 100644 arch/arm/mach-s5pv210/setup-i2c0.c
>  delete mode 100644 arch/arm/plat-s5p/setup-i2c0.c
> 
> diff --git a/arch/arm/mach-s5p6440/Makefile
b/arch/arm/mach-s5p6440/Makefile
> index 1ad894b..9646cdf 100644
> --- a/arch/arm/mach-s5p6440/Makefile
> +++ b/arch/arm/mach-s5p6440/Makefile
> @@ -13,6 +13,7 @@ obj-				:=
>  # Core support for S5P6440 system
> 
>  obj-$(CONFIG_CPU_S5P6440)	+= cpu.o init.o clock.o gpio.o
> +obj-$(CONFIG_CPU_S5P6440)	+= setup-i2c0.o
> 
>  # machine support
> 
> diff --git a/arch/arm/mach-s5p6440/setup-i2c0.c
b/arch/arm/mach-s5p6440/setup-
> i2c0.c
> new file mode 100644
> index 0000000..69e8a66
> --- /dev/null
> +++ b/arch/arm/mach-s5p6440/setup-i2c0.c
> @@ -0,0 +1,25 @@
> +/* linux/arch/arm/mach-s5p6440/setup-i2c0.c
> + *
> + * Copyright (c) 2009 Samsung Electronics Co., Ltd.
> + *		http://www.samsung.com/
> + *
> + * I2C0 GPIO configuration.
> + *
> + * Based on plat-s3c64xx/setup-i2c0.c
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> +*/
> +
> +#include <linux/kernel.h>
> +#include <linux/types.h>
> +
> +struct platform_device; /* don't need the contents */
> +
> +#include <plat/iic.h>
> +
> +void s3c_i2c0_cfg_gpio(struct platform_device *dev)
> +{
> +	/* Will be populated later */
> +}
> diff --git a/arch/arm/mach-s5p6442/Makefile
b/arch/arm/mach-s5p6442/Makefile
> index dde39a6..4942c14 100644
> --- a/arch/arm/mach-s5p6442/Makefile
> +++ b/arch/arm/mach-s5p6442/Makefile
> @@ -13,6 +13,7 @@ obj-				:=
>  # Core support for S5P6442 system
> 
>  obj-$(CONFIG_CPU_S5P6442)	+= cpu.o init.o clock.o
> +obj-$(CONFIG_CPU_S5P6442)	+= setup-i2c0.o
> 
>  # machine support
> 
> diff --git a/arch/arm/mach-s5p6442/setup-i2c0.c
b/arch/arm/mach-s5p6442/setup-
> i2c0.c
> new file mode 100644
> index 0000000..662695d
> --- /dev/null
> +++ b/arch/arm/mach-s5p6442/setup-i2c0.c
> @@ -0,0 +1,25 @@
> +/* linux/arch/arm/mach-s5p6442/setup-i2c0.c
> + *
> + * Copyright (c) 2009 Samsung Electronics Co., Ltd.
> + *		http://www.samsung.com/
> + *
> + * I2C0 GPIO configuration.
> + *
> + * Based on plat-s3c64xx/setup-i2c0.c
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> +*/
> +
> +#include <linux/kernel.h>
> +#include <linux/types.h>
> +
> +struct platform_device; /* don't need the contents */
> +
> +#include <plat/iic.h>
> +
> +void s3c_i2c0_cfg_gpio(struct platform_device *dev)
> +{
> +	/* Will be populated later */
> +}
> diff --git a/arch/arm/mach-s5pv210/Makefile
b/arch/arm/mach-s5pv210/Makefile
> index 8ebf51c..1a972a5 100644
> --- a/arch/arm/mach-s5pv210/Makefile
> +++ b/arch/arm/mach-s5pv210/Makefile
> @@ -13,6 +13,7 @@ obj-				:=
>  # Core support for S5PV210 system
> 
>  obj-$(CONFIG_CPU_S5PV210)	+= cpu.o init.o clock.o
> +obj-$(CONFIG_CPU_S5PV210)	+= setup-i2c0.o
> 
>  # machine support
> 
> diff --git a/arch/arm/mach-s5pv210/setup-i2c0.c
b/arch/arm/mach-s5pv210/setup-
> i2c0.c
> new file mode 100644
> index 0000000..27de0c1
> --- /dev/null
> +++ b/arch/arm/mach-s5pv210/setup-i2c0.c
> @@ -0,0 +1,25 @@
> +/*
> + * linux/arch/arm/mach-s5pv210/setup-i2c2.c
> + *
> + * Copyright 2009 Samsung Electronics Co.
> + *
> + * Base S5PV210 I2C bus 0 gpio configuration
> + *
> + * Based on mach-s3c64xx/setup-i2c0.c

Pleae keep the original header from plat-s5p/setup-i2c

> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> +*/
> +
> +#include <linux/kernel.h>
> +#include <linux/types.h>
> +
> +struct platform_device; /* don't need the contents */
> +
> +#include <plat/iic.h>
> +
> +void s3c_i2c0_cfg_gpio(struct platform_device *dev)
> +{
> +	/* Will be populated later */
> +}
> diff --git a/arch/arm/plat-s5p/Makefile b/arch/arm/plat-s5p/Makefile
> index a7c54b3..0ec09a9 100644
> --- a/arch/arm/plat-s5p/Makefile
> +++ b/arch/arm/plat-s5p/Makefile
> @@ -16,4 +16,3 @@ obj-y				+= dev-uart.o
>  obj-y				+= cpu.o
>  obj-y				+= clock.o
>  obj-y				+= irq.o
> -obj-y				+= setup-i2c0.o
> diff --git a/arch/arm/plat-s5p/setup-i2c0.c
b/arch/arm/plat-s5p/setup-i2c0.c
> deleted file mode 100644
> index 67a66e0..0000000
> --- a/arch/arm/plat-s5p/setup-i2c0.c
> +++ /dev/null
> @@ -1,25 +0,0 @@
> -/* linux/arch/arm/plat-s5p/setup-i2c0.c
> - *
> - * Copyright (c) 2009 Samsung Electronics Co., Ltd.
> - *		http://www.samsung.com/
> - *
> - * I2C0 GPIO configuration.
> - *
> - * Based on plat-s3c64xx/setup-i2c0.c
> - *
> - * This program is free software; you can redistribute it and/or modify
> - * it under the terms of the GNU General Public License version 2 as
> - * published by the Free Software Foundation.
> -*/
> -
> -#include <linux/kernel.h>
> -#include <linux/types.h>
> -
> -struct platform_device; /* don't need the contents */
> -
> -#include <plat/iic.h>
> -
> -void s3c_i2c0_cfg_gpio(struct platform_device *dev)
> -{
> -	/* Will be populated later */
> -}
> --


Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
