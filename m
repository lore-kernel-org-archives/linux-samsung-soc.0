From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH] ARM: EXYNOS4: Adds Samsung NURI board support
Date: Mon, 28 Feb 2011 16:42:31 +0900
Message-ID: <002301cbd71b$1969bd00$4c3d3700$%kim@samsung.com>
References: <4D676BB8.9040803@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:46586 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752545Ab1B1HxT (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 28 Feb 2011 02:53:19 -0500
Received: from epmmp1 (mailout2.samsung.com [203.254.224.25])
 by mailout2.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LHB00A2MHFEOP60@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 28 Feb 2011 16:42:50 +0900 (KST)
Received: from DOKGENEKIM02 ([12.23.103.104])
 by mmp1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0LHB0008VHFDX4@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 28 Feb 2011 16:42:50 +0900 (KST)
In-reply-to: <4D676BB8.9040803@samsung.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Minkyu Kang' <mk7.kang@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: ben-linux@fluff.org, kyungmin.park@samsung.com

Minkyu Kang wrote:
> 
> This patch adds Samsung NURI board support.
> 
> Signed-off-by: Minkyu Kang <mk7.kang@samsung.com>
> Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
> ---
> This patch is base on next-exynos4 branch at kgene tree.
> 
>  arch/arm/configs/exynos4_defconfig |    1 +
>  arch/arm/mach-exynos4/Kconfig      |   15 +++
>  arch/arm/mach-exynos4/Makefile     |    1 +
>  arch/arm/mach-exynos4/mach-nuri.c  |  233
> ++++++++++++++++++++++++++++++++++++
>  4 files changed, 250 insertions(+), 0 deletions(-)
>  create mode 100644 arch/arm/mach-exynos4/mach-nuri.c
> 

(snip)

> +config MACH_NURI
> +	bool "Mobile NURI Board"
> +	select CPU_EXYNOS4210
> +	select S3C_DEV_WDT
> +	select S3C_DEV_HSMMC
> +	select S3C_DEV_HSMMC2
> +	select S3C_DEV_HSMMC3
> +	select S3C_DEV_I2C1
> +	select S3C_DEV_I2C5
> +	select EXYNOS4_SETUP_I2C1
> +	select EXYNOS4_SETUP_I2C5
> +	select EXYNOS4_SETUP_SDHCI
> +	help
> +	  Machine support for Samsung Mobile NURI Board.
> +

(snip)

> +enum fixed_regulator_id {
> +	FIXED_REG_ID_MMC = 0,

	FIXED_REG_ID_MMC,

(snip)

> +static struct platform_device emmc_fixed_voltage = {
> +	.name			= "reg-fixed-voltage",
> +	.id			= FIXED_REG_ID_MMC,

Is there any reason to use FIXED_REG_ID_MMC instead directly id 0?

(snip)

> +static struct platform_device *nuri_devices[] __initdata = {
> +	/* Samsung Platform Devices */
> +	&emmc_fixed_voltage,
> +	&s3c_device_hsmmc0,
> +	&s3c_device_hsmmc2,
> +	&s3c_device_hsmmc3,
> +#ifdef CONFIG_S3C2410_WATCHDOG
> +	&s3c_device_wdt,
> +#endif

Basically no need to add #ifdef here.
Because "s3c_device_wdt" depends on CONFIG_S3C_DEV_WDT and you already
selected it in Kconfig.

Of course, CONFIG_S3C2410_WATCHDOG is another selection for watchdog driver.

I'm sorting it out like the relation of platform device and regarding device
driver.

(snip)

Others, looks ok to me.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
