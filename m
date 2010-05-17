From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH 08/15] ARM: S5PC100: Move frame buffer helpers from
	plat-s5pc1xx to mach-s5pc100
Date: Mon, 17 May 2010 22:45:24 +0900
Message-ID: <004d01caf5c7$369f3160$a3dd9420$%kim@samsung.com>
References: <1273817946-29404-1-git-send-email-m.szyprowski@samsung.com>
 <1273817946-29404-9-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:51049 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752365Ab0EQNp3 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 17 May 2010 09:45:29 -0400
Received: from epmmp2 (mailout1.samsung.com [203.254.224.24])
 by mailout1.samsung.com
 (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTP id <0L2K001AFGVRBT@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 17 May 2010 22:45:27 +0900 (KST)
Received: from kgenekim ([12.23.103.96])
 by mmp2.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0L2K00EQAGVR9R@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 17 May 2010 22:45:27 +0900 (KST)
In-reply-to: <1273817946-29404-9-git-send-email-m.szyprowski@samsung.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Marek Szyprowski' <m.szyprowski@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: kyungmin.park@samsung.com, ben-linux@fluff.org

Marek Szyprowski wrote:
> 
> Move frame buffer helpers from plat-s5pc1xx to mach-s5pc100.
> 
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
> ---
>  arch/arm/mach-s5pc100/Kconfig                      |    7 ++++++-
>  arch/arm/mach-s5pc100/Makefile                     |    1 +
>  .../setup-fb-24bpp.c                               |    4 ++--
>  arch/arm/plat-s5pc1xx/Kconfig                      |    5 -----
>  arch/arm/plat-s5pc1xx/Makefile                     |    1 -
>  5 files changed, 9 insertions(+), 9 deletions(-)
>  rename arch/arm/{plat-s5pc1xx => mach-s5pc100}/setup-fb-24bpp.c (91%)
> 
> diff --git a/arch/arm/mach-s5pc100/Kconfig b/arch/arm/mach-s5pc100/Kconfig
> index 27ec167..b24c66d 100644
> --- a/arch/arm/mach-s5pc100/Kconfig
> +++ b/arch/arm/mach-s5pc100/Kconfig
> @@ -12,6 +12,11 @@ config CPU_S5PC100
>  	help
>  	  Enable S5PC100 CPU support
> 
> +config S5PC100_SETUP_FB_24BPP
> +	bool
> +	help
> +          Common setup code for S5PC1XX with an 24bpp RGB display helper.

Double tab and 2 white spaces.

> +
>  config S5PC100_SETUP_SDHCI
>          bool
>          select S5PC1XX_SETUP_SDHCI_GPIO
> @@ -28,7 +33,7 @@ config MACH_SMDKC100
>  	select S3C_DEV_HSMMC2
>  	select S5PC1XX_SETUP_I2C0
>  	select S5PC1XX_SETUP_I2C1
> -	select S5PC1XX_SETUP_FB_24BPP
> +	select S5PC100_SETUP_FB_24BPP
>  	select S5PC100_SETUP_SDHCI
>  	help
>  	  Machine support for the Samsung SMDKC100
> diff --git a/arch/arm/mach-s5pc100/Makefile
b/arch/arm/mach-s5pc100/Makefile
> index e1afdbf..ccf0dca 100644
> --- a/arch/arm/mach-s5pc100/Makefile
> +++ b/arch/arm/mach-s5pc100/Makefile
> @@ -15,6 +15,7 @@ obj-$(CONFIG_CPU_S5PC100)	+= cpu.o gpio.o
> 
>  # Helper and device support
> 
> +obj-$(CONFIG_S5PC100_SETUP_FB_24BPP)	+= setup-fb-24bpp.o
>  obj-$(CONFIG_S5PC100_SETUP_SDHCI)       += setup-sdhci.o
> 
>  # machine support
> diff --git a/arch/arm/plat-s5pc1xx/setup-fb-24bpp.c
b/arch/arm/mach-s5pc100/setup-
> fb-24bpp.c
> similarity index 91%
> rename from arch/arm/plat-s5pc1xx/setup-fb-24bpp.c
> rename to arch/arm/mach-s5pc100/setup-fb-24bpp.c
> index b02c36f..6eba6cb 100644
> --- a/arch/arm/plat-s5pc1xx/setup-fb-24bpp.c
> +++ b/arch/arm/mach-s5pc100/setup-fb-24bpp.c
> @@ -1,9 +1,9 @@
>  /*
> - * linux/arch/arm/plat-s5pc100/setup-fb-24bpp.c
> + * linux/arch/arm/mach-s5pc100/setup-fb-24bpp.c
>   *
>   * Copyright 2009 Samsung Electronics
>   *
> - * Base S5PC1XX setup information for 24bpp LCD framebuffer
> + * Base S5PC100 setup information for 24bpp LCD framebuffer
>   *
>   * This program is free software; you can redistribute it and/or modify
>   * it under the terms of the GNU General Public License version 2 as
> diff --git a/arch/arm/plat-s5pc1xx/Kconfig b/arch/arm/plat-s5pc1xx/Kconfig
> index 98bbaf9..708f7a0 100644
> --- a/arch/arm/plat-s5pc1xx/Kconfig
> +++ b/arch/arm/plat-s5pc1xx/Kconfig
> @@ -39,11 +39,6 @@ config CPU_S5PC100_CLOCK
> 
>  # platform specific device setup
> 
> -config S5PC1XX_SETUP_FB_24BPP
> -	bool
> -	help
> -          Common setup code for S5PC1XX with an 24bpp RGB display helper.
> -
>  config S5PC1XX_SETUP_I2C0
>  	bool
>  	default y
> diff --git a/arch/arm/plat-s5pc1xx/Makefile
b/arch/arm/plat-s5pc1xx/Makefile
> index 540fca5..a5b90c0 100644
> --- a/arch/arm/plat-s5pc1xx/Makefile
> +++ b/arch/arm/plat-s5pc1xx/Makefile
> @@ -23,7 +23,6 @@ obj-$(CONFIG_CPU_S5PC100_CLOCK)	+= s5pc100-clock.o
> 
>  # Device setup
> 
> -obj-$(CONFIG_S5PC1XX_SETUP_FB_24BPP) += setup-fb-24bpp.o
>  obj-$(CONFIG_S5PC1XX_SETUP_I2C0) += setup-i2c0.o
>  obj-$(CONFIG_S5PC1XX_SETUP_I2C1) += setup-i2c1.o
>  obj-$(CONFIG_S5PC1XX_SETUP_SDHCI_GPIO)	+= setup-sdhci-gpio.o
> --


Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
