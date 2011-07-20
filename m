From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH 1/8] ARM: Samsung: add i2c8 controller definitions
Date: Thu, 21 Jul 2011 03:05:53 +0900
Message-ID: <000001cc4707$aecebfb0$0c6c3f10$%kim@samsung.com>
References: <1311065067-20324-1-git-send-email-m.szyprowski@samsung.com>
 <1311065067-20324-2-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:15829 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751671Ab1GTSGE (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 20 Jul 2011 14:06:04 -0400
Received: from epcpsbgm1.samsung.com (mailout1.samsung.com [203.254.224.24])
 by mailout1.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LON00M8N8XXNUC0@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 21 Jul 2011 03:06:02 +0900 (KST)
Received: from kgenekim ([12.23.119.139])
 by mmp2.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0LON006NZ8Y235@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 21 Jul 2011 03:06:02 +0900 (KST)
In-reply-to: <1311065067-20324-2-git-send-email-m.szyprowski@samsung.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Marek Szyprowski' <m.szyprowski@samsung.com>, linux-samsung-soc@vger.kernel.org
Cc: 'Kyungmin Park' <kyungmin.park@samsung.com>, 'Tomasz Stanislawski' <t.stanislaws@samsung.com>

Marek Szyprowski wrote:
> 
> From: Tomasz Stanislawski <t.stanislaws@samsung.com>
> 
> This patch adds generic i2c8 controller definitions.
> 
> Signed-off-by: Tomasz Stanislawski <t.stanislaws@samsung.com>
> Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
>  arch/arm/plat-samsung/Kconfig                 |    5 ++
>  arch/arm/plat-samsung/Makefile                |    1 +
>  arch/arm/plat-samsung/dev-i2c8.c              |   58
> +++++++++++++++++++++++++
>  arch/arm/plat-samsung/include/plat/devs.h     |    1 +
>  arch/arm/plat-samsung/include/plat/iic-core.h |    7 +++
>  arch/arm/plat-samsung/include/plat/iic.h      |    1 +
>  6 files changed, 73 insertions(+), 0 deletions(-)
>  create mode 100644 arch/arm/plat-samsung/dev-i2c8.c
> 
> diff --git a/arch/arm/plat-samsung/Kconfig b/arch/arm/plat-samsung/Kconfig
> index 4d79519..c0fd858 100644
> --- a/arch/arm/plat-samsung/Kconfig
> +++ b/arch/arm/plat-samsung/Kconfig
> @@ -212,6 +212,11 @@ config S3C_DEV_I2C7
>  	help
>  	  Compile in platform device definition for I2C controller 7
> 
> +config S3C_DEV_I2C8
> +	bool
> +	help
> +	  Compile in platform device definitions for I2C channel 8 (HDMIPHY)
> +
>  config S3C_DEV_FB
>  	bool
>  	help
> diff --git a/arch/arm/plat-samsung/Makefile
b/arch/arm/plat-samsung/Makefile
> index 53eb15b..7f0e660 100644
> --- a/arch/arm/plat-samsung/Makefile
> +++ b/arch/arm/plat-samsung/Makefile
> @@ -45,6 +45,7 @@ obj-$(CONFIG_S3C_DEV_I2C4)	+= dev-i2c4.o
>  obj-$(CONFIG_S3C_DEV_I2C5)	+= dev-i2c5.o
>  obj-$(CONFIG_S3C_DEV_I2C6)	+= dev-i2c6.o
>  obj-$(CONFIG_S3C_DEV_I2C7)	+= dev-i2c7.o
> +obj-$(CONFIG_S3C_DEV_I2C8)	+= dev-i2c8.o
>  obj-$(CONFIG_S3C_DEV_FB)	+= dev-fb.o
>  obj-y				+= dev-uart.o
>  obj-$(CONFIG_S3C_DEV_USB_HOST)	+= dev-usb.o
> diff --git a/arch/arm/plat-samsung/dev-i2c8.c
b/arch/arm/plat-samsung/dev-i2c8.c
> new file mode 100644
> index 0000000..23e8ccf
> --- /dev/null
> +++ b/arch/arm/plat-samsung/dev-i2c8.c
> @@ -0,0 +1,58 @@
> +/*
> + * Copyright (c) 2010 Samsung Electronics Co., Ltd.
> + *		http://www.samsung.com/
> + *
> + * S3C series device definition for i2c device 8
> + *
> + * Based on plat-samsung/dev-i2c7.c
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> +*/
> +
> +#include <linux/gfp.h>
> +#include <linux/kernel.h>
> +#include <linux/string.h>
> +#include <linux/platform_device.h>
> +
> +#include <mach/irqs.h>
> +#include <mach/map.h>
> +
> +#include <plat/regs-iic.h>
> +#include <plat/iic.h>
> +#include <plat/devs.h>
> +#include <plat/cpu.h>
> +
> +static struct resource s3c_i2c_resource[] = {
> +	[0] = {
> +		.start = S3C_PA_IIC8,
> +		.end   = S3C_PA_IIC8 + SZ_4K - 1,
> +		.flags = IORESOURCE_MEM,
> +	},
> +	[1] = {
> +		.start = IRQ_IIC8,
> +		.end   = IRQ_IIC8,
> +		.flags = IORESOURCE_IRQ,
> +	},
> +};
> +
> +struct platform_device s3c_device_i2c8 = {
> +	.name		  = "s3c2440-i2c",
> +	.id		  = 8,
> +	.num_resources	  = ARRAY_SIZE(s3c_i2c_resource),
> +	.resource	  = s3c_i2c_resource,
> +};
> +
> +void __init s3c_i2c8_set_platdata(struct s3c2410_platform_i2c *pd)
> +{
> +	struct s3c2410_platform_i2c *npd;
> +
> +	if (!pd) {
> +		pd = &default_i2c_data;
> +		pd->bus_num = 8;
> +	}
> +
> +	npd = s3c_set_platdata(pd, sizeof(struct s3c2410_platform_i2c),
> +			       &s3c_device_i2c8);
> +}
> diff --git a/arch/arm/plat-samsung/include/plat/devs.h b/arch/arm/plat-
> samsung/include/plat/devs.h
> index d5f700d..62ee543 100644
> --- a/arch/arm/plat-samsung/include/plat/devs.h
> +++ b/arch/arm/plat-samsung/include/plat/devs.h
> @@ -60,6 +60,7 @@ extern struct platform_device s3c_device_i2c4;
>  extern struct platform_device s3c_device_i2c5;
>  extern struct platform_device s3c_device_i2c6;
>  extern struct platform_device s3c_device_i2c7;
> +extern struct platform_device s3c_device_i2c8;
>  extern struct platform_device s3c_device_rtc;
>  extern struct platform_device s3c_device_adc;
>  extern struct platform_device s3c_device_sdi;
> diff --git a/arch/arm/plat-samsung/include/plat/iic-core.h
b/arch/arm/plat-
> samsung/include/plat/iic-core.h
> index f182669..97ecc44 100644
> --- a/arch/arm/plat-samsung/include/plat/iic-core.h
> +++ b/arch/arm/plat-samsung/include/plat/iic-core.h
> @@ -39,4 +39,11 @@ static inline void s3c_i2c2_setname(char *name)
>  #endif
>  }
> 
> +static inline void s3c_i2c8_setname(char *name)
> +{
> +#ifdef CONFIG_S3C_DEV_I2C8
> +	s3c_device_i2c8.name = name;
> +#endif
> +}
> +
>  #endif /* __ASM_ARCH_IIC_H */
> diff --git a/arch/arm/plat-samsung/include/plat/iic.h b/arch/arm/plat-
> samsung/include/plat/iic.h
> index 56b0059..535524a 100644
> --- a/arch/arm/plat-samsung/include/plat/iic.h
> +++ b/arch/arm/plat-samsung/include/plat/iic.h
> @@ -60,6 +60,7 @@ extern void s3c_i2c4_set_platdata(struct
> s3c2410_platform_i2c *i2c);
>  extern void s3c_i2c5_set_platdata(struct s3c2410_platform_i2c *i2c);
>  extern void s3c_i2c6_set_platdata(struct s3c2410_platform_i2c *i2c);
>  extern void s3c_i2c7_set_platdata(struct s3c2410_platform_i2c *i2c);
> +extern void s3c_i2c8_set_platdata(struct s3c2410_platform_i2c *i2c);
> 
>  /* defined by architecture to configure gpio */
>  extern void s3c_i2c0_cfg_gpio(struct platform_device *dev);
> --
> 1.7.1.569.g6f426

As I remember, please don't use dev-i2c8 as a dedicated HDMIPHY on EXYNOS4.
It can be used for other general i2c.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
