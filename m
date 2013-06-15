From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH 20/28] ARM: EXYNOS: Remove setup-i2c0.c
Date: Sat, 15 Jun 2013 10:54:25 +0900
Message-ID: <171f01ce696b$43b38a20$cb1a9e60$%kim@samsung.com>
References: <1371238384-1504-1-git-send-email-t.figa@samsung.com>
 <1371238384-1504-21-git-send-email-t.figa@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:65490 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753285Ab3FOBy1 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 14 Jun 2013 21:54:27 -0400
Received: from epcpsbgr4.samsung.com
 (u144.gpu120.samsung.co.kr [203.254.230.144])
 by mailout3.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MOE00GVUVYQMJB0@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Sat, 15 Jun 2013 10:54:26 +0900 (KST)
In-reply-to: <1371238384-1504-21-git-send-email-t.figa@samsung.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Tomasz Figa' <t.figa@samsung.com>, linux-samsung-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, 'Arnd Bergmann' <arnd@arndb.de>, 'Olof Johansson' <olof@lixom.net>, 'Marek Szyprowski' <m.szyprowski@samsung.com>, 'Sylwester Nawrocki' <s.nawrocki@samsung.com>, 'Thomas Abraham' <thomas.abraham@linaro.org>, 'Kyungmin Park' <kyungmin.park@samsung.com>

Tomasz Figa wrote:
> 
> Now since SAMSUNG_ATAGS is no longer selected for ARCH_EXYNOS, we can
> safely remove the remaining setup code.
> 
> Signed-off-by: Tomasz Figa <t.figa@samsung.com>
> Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
> ---
>  arch/arm/mach-exynos/Makefile     |  3 ---
>  arch/arm/mach-exynos/setup-i2c0.c | 19 -------------------
>  2 files changed, 22 deletions(-)
>  delete mode 100644 arch/arm/mach-exynos/setup-i2c0.c
> 
> diff --git a/arch/arm/mach-exynos/Makefile b/arch/arm/mach-exynos/Makefile
> index 5fc6cfd..66c9788 100644
> --- a/arch/arm/mach-exynos/Makefile
> +++ b/arch/arm/mach-exynos/Makefile
> @@ -35,6 +35,3 @@ AFLAGS_exynos-smc.o		:=-Wa,-march=armv7-
> a$(plus_sec)
>  obj-$(CONFIG_MACH_EXYNOS4_DT)		+= mach-exynos4-dt.o
>  obj-$(CONFIG_MACH_EXYNOS5_DT)		+= mach-exynos5-dt.o
> 

No need last empty line with removing below, But you don't need re-posting,
because let me fix.

- Kukjin

> -# device support
> -
> -obj-$(CONFIG_ARCH_EXYNOS)		+= setup-i2c0.o
> diff --git a/arch/arm/mach-exynos/setup-i2c0.c b/arch/arm/mach-
> exynos/setup-i2c0.c
> deleted file mode 100644
> index ede6ceb..0000000
> --- a/arch/arm/mach-exynos/setup-i2c0.c
> +++ /dev/null
> @@ -1,19 +0,0 @@
> -/*
> - * Copyright (c) 2009-2012 Samsung Electronics Co., Ltd.
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
> -struct platform_device; /* don't need the contents */
> -
> -void s3c_i2c0_cfg_gpio(struct platform_device *dev)
> -{
> -
> -}
> --
> 1.8.2.1
