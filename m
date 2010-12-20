From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH 2/4] ARM: S5P64X0: Add support for SDHCI configuration
Date: Mon, 20 Dec 2010 15:03:43 +0900
Message-ID: <010701cba00b$aacdce90$00696bb0$%kim@samsung.com>
References: <1292219185-3911-1-git-send-email-sbkim73@samsung.com>
 <1292219185-3911-3-git-send-email-sbkim73@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:52598 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753142Ab0LTGDu (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 20 Dec 2010 01:03:50 -0500
Received: from epmmp2 (mailout1.samsung.com [203.254.224.24])
 by mailout1.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LDP005LFQ6CWN80@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 20 Dec 2010 15:03:48 +0900 (KST)
Received: from DOKGENEKIM02 ([12.23.103.104])
 by mmp2.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0LDP009IHQ6C1O@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 20 Dec 2010 15:03:48 +0900 (KST)
In-reply-to: <1292219185-3911-3-git-send-email-sbkim73@samsung.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Sangbeom Kim' <sbkim73@samsung.com>, linux-samsung-soc@vger.kernel.org
Cc: ben-linux@fluff.org, 'Abhilash Kesavan' <a.kesavan@samsung.com>

Sangbeom Kim wrote:
> 
> From: Abhilash Kesavan <a.kesavan@samsung.com>
> 
> Adds support for HSMMC for S5P6440 and S5P6450, performs
> setup for host controller and related GPIO.
> 
> Signed-off-by: Abhilash Kesavan <a.kesavan@samsung.com>
> Signed-off-by: Sangbeom Kim <sbkim73@samsung.com>
> ---
>  arch/arm/mach-s5p64x0/Kconfig            |   19 ++++++++
>  arch/arm/mach-s5p64x0/Makefile           |    2 +
>  arch/arm/mach-s5p64x0/setup-sdhci-gpio.c |   67
> ++++++++++++++++++++++++++++++
>  arch/arm/mach-s5p64x0/setup-sdhci.c      |   58
++++++++++++++++++++++++++
>  4 files changed, 146 insertions(+), 0 deletions(-)
>  create mode 100644 arch/arm/mach-s5p64x0/setup-sdhci-gpio.c
>  create mode 100644 arch/arm/mach-s5p64x0/setup-sdhci.c
> 
> diff --git a/arch/arm/mach-s5p64x0/Kconfig b/arch/arm/mach-s5p64x0/Kconfig
> index 164d278..3946728 100644
> --- a/arch/arm/mach-s5p64x0/Kconfig
> +++ b/arch/arm/mach-s5p64x0/Kconfig
> @@ -24,6 +24,17 @@ config S5P64X0_SETUP_I2C1
>  	help
>  	  Common setup code for i2c bus 1.
> 
> +config S5P64X0_SETUP_SDHCI
> +        bool
   ^^^^^^^^
> +        select S5P64X0_SETUP_SDHCI_GPIO
   ^^^^^^^^
> +        help
   ^^^^^^^^
> +          Internal helper functions for S5P64X0 based SDHCI systems
   ^^^^^^^^

Should be used tab instead of white space

> +
> +config S5P64X0_SETUP_SDHCI_GPIO
> +	bool
> +	help
> +	  Common setup code for SDHCI gpio.
> +
>  # machine support
> 
>  config MACH_SMDK6440
> @@ -35,7 +46,11 @@ config MACH_SMDK6440
>  	select S3C64XX_DEV_SPI
>  	select SAMSUNG_DEV_ADC
>  	select SAMSUNG_DEV_TS
> +	select S3C_DEV_HSMMC
> +	select S3C_DEV_HSMMC1
> +	select S3C_DEV_HSMMC2
>  	select S5P64X0_SETUP_I2C1
> +	select S5P64X0_SETUP_SDHCI
>  	help
>  	  Machine support for the Samsung SMDK6440
> 
> @@ -48,7 +63,11 @@ config MACH_SMDK6450
>  	select S3C64XX_DEV_SPI
>  	select SAMSUNG_DEV_ADC
>  	select SAMSUNG_DEV_TS
> +	select S3C_DEV_HSMMC
> +	select S3C_DEV_HSMMC1
> +	select S3C_DEV_HSMMC2
>  	select S5P64X0_SETUP_I2C1
> +	select S5P64X0_SETUP_SDHCI
>  	help
>  	  Machine support for the Samsung SMDK6450
> 
> diff --git a/arch/arm/mach-s5p64x0/Makefile
b/arch/arm/mach-s5p64x0/Makefile
> index 669f470..cbc9d1c 100644
> --- a/arch/arm/mach-s5p64x0/Makefile
> +++ b/arch/arm/mach-s5p64x0/Makefile
> @@ -29,3 +29,5 @@ obj-y				+= dev-audio.o
>  obj-$(CONFIG_S3C64XX_DEV_SPI)	+= dev-spi.o
> 
>  obj-$(CONFIG_S5P64X0_SETUP_I2C1)	+= setup-i2c1.o
> +obj-$(CONFIG_S5P64X0_SETUP_SDHCI)       += setup-sdhci.o

Tab or White space?

> +obj-$(CONFIG_S5P64X0_SETUP_SDHCI_GPIO)	+= setup-sdhci-gpio.o
> diff --git a/arch/arm/mach-s5p64x0/setup-sdhci-gpio.c b/arch/arm/mach-
> s5p64x0/setup-sdhci-gpio.c
> new file mode 100644
> index 0000000..3266c68
> --- /dev/null
> +++ b/arch/arm/mach-s5p64x0/setup-sdhci-gpio.c
> @@ -0,0 +1,67 @@
> +/* linux/arch/arm/plat-s5p64x0/setup-sdhci-gpio.c
> + *
> + * Copyright (c) 2010-2011 Samsung Electronics Co., Ltd.
> + *		http://www.samsung.com/
> + *
> + * S5P64X0 - Helper functions for setting up SDHCI device(s) GPIO (HSMMC)
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> +*/
> +
> +#include <linux/platform_device.h>
> +#include <linux/io.h>
> +
> +#include <mach/gpio.h>

Should be <linux/gpio.h>

> +#include <mach/regs-gpio.h>
> +
> +#include <plat/gpio-cfg.h>
> +#include <plat/sdhci.h>
> +
> +void s5p64x0_setup_sdhci0_cfg_gpio(struct platform_device *dev, int
width)
> +{
> +	struct s3c_sdhci_platdata *pdata = dev->dev.platform_data;
> +
> +	/* Set all the necessary GPG pins to special-function 2 */
> +	s3c_gpio_cfgrange_nopull(S5P6450_GPG(0), 2 + width,
S3C_GPIO_SFN(2));

Is it available on SMDK6440?

> +
> +	/* Set GPG[6] pin to special-funtion 2 - MMC0 CDn */
> +	if (pdata->cd_type == S3C_SDHCI_CD_INTERNAL) {
> +		s3c_gpio_setpull(S5P6450_GPG(6), S3C_GPIO_PULL_UP);
> +		s3c_gpio_cfgpin(S5P6450_GPG(6), S3C_GPIO_SFN(2));

Same.

> +	}
> +}
> +
> +void s5p64x0_setup_sdhci1_cfg_gpio(struct platform_device *dev, int
width)
> +{
> +	struct s3c_sdhci_platdata *pdata = dev->dev.platform_data;
> +
> +	/* Set all the necessary GPH pins to special-function 2 */
> +	s3c_gpio_cfgrange_nopull(S5P6450_GPH(0), 2 + width,
S3C_GPIO_SFN(2));
> +
> +	/* Set GPG[6] pin to special-funtion 3 - MMC1 CDn */
> +	if (pdata->cd_type == S3C_SDHCI_CD_INTERNAL) {
> +		s3c_gpio_setpull(S5P6450_GPG(6), S3C_GPIO_PULL_UP);
> +		s3c_gpio_cfgpin(S5P6450_GPG(6), S3C_GPIO_SFN(3));
> +	}
> +}
> +
> +void s5p6440_setup_sdhci2_cfg_gpio(struct platform_device *dev, int
width)
> +{
> +	/* Set GPC[4:5] pins to special-function 3 - CLK and CMD */
> +	s3c_gpio_cfgrange_nopull(S5P6440_GPC(4), 2, S3C_GPIO_SFN(3));
> +
> +	/* Set GPH[6:9] pins to special-function 3 - Data[0:3] */
> +	s3c_gpio_cfgrange_nopull(S5P6440_GPH(6), 4, S3C_GPIO_SFN(3));
> +
> +	/* No MMC2 CDn available */
> +}
> +
> +void s5p6450_setup_sdhci2_cfg_gpio(struct platform_device *dev, int
width)
> +{
> +	/* Set all the necessary GPG pins to special-function 2 */
> +	s3c_gpio_cfgrange_nopull(S5P6450_GPG(7), 2 + width,
S3C_GPIO_SFN(3));
> +
> +	/* No MMC2 CDn available */
> +}
> diff --git a/arch/arm/mach-s5p64x0/setup-sdhci.c b/arch/arm/mach-
> s5p64x0/setup-sdhci.c
> new file mode 100644
> index 0000000..7ea4c0d
> --- /dev/null
> +++ b/arch/arm/mach-s5p64x0/setup-sdhci.c
> @@ -0,0 +1,58 @@
> +/* linux/arch/arm/mach-s5p64x0/setup-sdhci.c
> + *
> + * Copyright (c) 2010-2011 Samsung Electronics Co., Ltd.
> + *		http://www.samsung.com/
> + *
> + * S5P64X0 - Helper functions for setting up SDHCI device(s) (HSMMC)
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> +*/
> +
> +#include <linux/platform_device.h>
> +#include <linux/io.h>
> +#include <linux/mmc/host.h>
> +
> +#include <plat/regs-sdhci.h>
> +
> +/* clock sources for the mmc bus clock, order as for the ctrl2[5..4] */
> +
> +char *s5p64x0_hsmmc_clksrcs[4] = {
> +	/* [0] = NULL,		- reserved */
> +	/* [1] = NULL,		- reserved */
> +	[2] = "sclk_mmc",	/* mmc_bus */
> +	/* [3] = NULL,		- reserved */
> +};
> +
> +void s5p64x0_setup_sdhci_cfg_card(struct platform_device *dev,
> +				  void __iomem *r,
> +				  struct mmc_ios *ios,
> +				  struct mmc_card *card)
> +{
> +	u32 ctrl2, ctrl3;
> +
> +	/* don't need to alter anything acording to card-type */
> +
> +	writel(S3C64XX_SDHCI_CONTROL4_DRIVE_9mA, r +
S3C64XX_SDHCI_CONTROL4);

__raw_writel, because of no need memory barrier between memory operations
here.

> +
> +	ctrl2 = readl(r + S3C_SDHCI_CONTROL2);

__raw_readl

> +	ctrl2 &= S3C_SDHCI_CTRL2_SELBASECLK_MASK;
> +
> +	/*
> +	 * clear async mode, enable conflict mask, rx feedback ctrl, SD
clock
> +	 * hold and no use debounce count
> +	 */
> +	ctrl2 |= (S3C64XX_SDHCI_CTRL2_ENSTAASYNCCLR |
> +		  S3C64XX_SDHCI_CTRL2_ENCMDCNFMSK |
> +		  S3C_SDHCI_CTRL2_DFCNT_NONE |
> +		  S3C_SDHCI_CTRL2_ENCLKOUTHOLD);
> +
> +	if (ios)
> +		if (ios->clock > 400000)
> +			ctrl2 |= S3C_SDHCI_CTRL2_ENFBCLKRX;
> +	ctrl3 = 0;

If we want to write 0 into SDHCI_CONTROL3, why do we need above instead of
just writing 0?

> +
> +	writel(ctrl2, r + S3C_SDHCI_CONTROL2);
> +	writel(ctrl3, r + S3C_SDHCI_CONTROL3);
> +}
> --


Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
