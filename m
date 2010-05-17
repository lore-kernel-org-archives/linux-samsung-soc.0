From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH 02/15] ARM: Samsung: move common I2C0 device helpers to
 machine	directories
Date: Mon, 17 May 2010 22:23:50 +0900
Message-ID: <004901caf5c4$343341d0$9c99c570$%kim@samsung.com>
References: <1273817946-29404-1-git-send-email-m.szyprowski@samsung.com>
 <1273817946-29404-3-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:52649 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751533Ab0EQNX4 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 17 May 2010 09:23:56 -0400
Received: from epmmp2 (mailout2.samsung.com [203.254.224.25])
 by mailout1.samsung.com
 (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTP id <0L2K00J8PFVVW4@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 17 May 2010 22:23:55 +0900 (KST)
Received: from kgenekim ([12.23.103.96])
 by mmp2.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0L2K00EJGFVV9R@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 17 May 2010 22:23:55 +0900 (KST)
In-reply-to: <1273817946-29404-3-git-send-email-m.szyprowski@samsung.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Marek Szyprowski' <m.szyprowski@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: kyungmin.park@samsung.com, ben-linux@fluff.org

Marek Szyprowski wrote:
> 
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
> ---

See your new 2nd patch of 'Common plat-s5p fixes patch set'.

>  arch/arm/mach-s5p6440/Makefile                   |    1 +
>  arch/arm/{plat-s5p => mach-s5p6440}/setup-i2c0.c |    2 +-
>  arch/arm/mach-s5p6442/Makefile                   |    1 +
>  arch/arm/{plat-s5p => mach-s5p6442}/setup-i2c0.c |    2 +-
>  arch/arm/mach-s5pv210/Makefile                   |    1 +
>  arch/arm/{plat-s5p => mach-s5pv210}/setup-i2c0.c |   10 +++++-----
>  arch/arm/plat-s5p/Makefile                       |    1 -
>  7 files changed, 10 insertions(+), 8 deletions(-)
>  copy arch/arm/{plat-s5p => mach-s5p6440}/setup-i2c0.c (92%)
>  copy arch/arm/{plat-s5p => mach-s5p6442}/setup-i2c0.c (92%)
>  rename arch/arm/{plat-s5p => mach-s5pv210}/setup-i2c0.c (69%)
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
> diff --git a/arch/arm/plat-s5p/setup-i2c0.c
b/arch/arm/mach-s5p6440/setup-i2c0.c
> similarity index 92%
> copy from arch/arm/plat-s5p/setup-i2c0.c
> copy to arch/arm/mach-s5p6440/setup-i2c0.c
> index 67a66e0..69e8a66 100644
> --- a/arch/arm/plat-s5p/setup-i2c0.c
> +++ b/arch/arm/mach-s5p6440/setup-i2c0.c
> @@ -1,4 +1,4 @@
> -/* linux/arch/arm/plat-s5p/setup-i2c0.c
> +/* linux/arch/arm/mach-s5p6440/setup-i2c0.c
>   *
>   * Copyright (c) 2009 Samsung Electronics Co., Ltd.
>   *		http://www.samsung.com/
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
> diff --git a/arch/arm/plat-s5p/setup-i2c0.c
b/arch/arm/mach-s5p6442/setup-i2c0.c
> similarity index 92%
> copy from arch/arm/plat-s5p/setup-i2c0.c
> copy to arch/arm/mach-s5p6442/setup-i2c0.c
> index 67a66e0..662695d 100644
> --- a/arch/arm/plat-s5p/setup-i2c0.c
> +++ b/arch/arm/mach-s5p6442/setup-i2c0.c
> @@ -1,4 +1,4 @@
> -/* linux/arch/arm/plat-s5p/setup-i2c0.c
> +/* linux/arch/arm/mach-s5p6442/setup-i2c0.c
>   *
>   * Copyright (c) 2009 Samsung Electronics Co., Ltd.
>   *		http://www.samsung.com/
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
> diff --git a/arch/arm/plat-s5p/setup-i2c0.c
b/arch/arm/mach-s5pv210/setup-i2c0.c
> similarity index 69%
> rename from arch/arm/plat-s5p/setup-i2c0.c
> rename to arch/arm/mach-s5pv210/setup-i2c0.c
> index 67a66e0..27de0c1 100644
> --- a/arch/arm/plat-s5p/setup-i2c0.c
> +++ b/arch/arm/mach-s5pv210/setup-i2c0.c
> @@ -1,11 +1,11 @@
> -/* linux/arch/arm/plat-s5p/setup-i2c0.c
> +/*
> + * linux/arch/arm/mach-s5pv210/setup-i2c2.c
>   *
> - * Copyright (c) 2009 Samsung Electronics Co., Ltd.
> - *		http://www.samsung.com/
> + * Copyright 2009 Samsung Electronics Co.
>   *
> - * I2C0 GPIO configuration.
> + * Base S5PV210 I2C bus 0 gpio configuration
>   *
> - * Based on plat-s3c64xx/setup-i2c0.c
> + * Based on mach-s3c64xx/setup-i2c0.c
>   *
>   * This program is free software; you can redistribute it and/or modify
>   * it under the terms of the GNU General Public License version 2 as
> diff --git a/arch/arm/plat-s5p/Makefile b/arch/arm/plat-s5p/Makefile
> index a7c54b3..0ec09a9 100644
> --- a/arch/arm/plat-s5p/Makefile
> +++ b/arch/arm/plat-s5p/Makefile
> @@ -16,4 +16,3 @@ obj-y				+= dev-uart.o
>  obj-y				+= cpu.o
>  obj-y				+= clock.o
>  obj-y				+= irq.o
> -obj-y				+= setup-i2c0.o
> --


Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
