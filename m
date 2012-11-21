From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [PATCH v8 3/3] ARM: EXYNOS: Enabling samsung-usbphy driver for EXYNOS4210
Date: Wed, 21 Nov 2012 20:46:30 +0100
Message-ID: <27075802.CQr6a3IPJm@flatron>
References: <1352889938-17311-1-git-send-email-p.paneri@samsung.com> <1352889938-17311-4-git-send-email-p.paneri@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ea0-f174.google.com ([209.85.215.174]:45910 "EHLO
	mail-ea0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755818Ab2KUTqe (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 21 Nov 2012 14:46:34 -0500
Received: by mail-ea0-f174.google.com with SMTP id e13so2928844eaa.19
        for <linux-samsung-soc@vger.kernel.org>; Wed, 21 Nov 2012 11:46:32 -0800 (PST)
In-Reply-To: <1352889938-17311-4-git-send-email-p.paneri@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Praveen Paneri <p.paneri@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, kgene.kim@samsung.com, balbi@ti.com, gregkh@linuxfoundation.org, thomas.abraham@linaro.org, ben-linux@fluff.org, broonie@opensource.wolfsonmicro.com, l.majewski@samsung.com, kyungmin.park@samsung.com, grant.likely@secretlab.ca, heiko@sntech.de, t.figa@samsung.com, gautam.vivek@samsung.com

Hi Praveen,

On Wednesday 14 of November 2012 16:15:38 Praveen Paneri wrote:
> Adding usbphy node for Exynos4210 along with the platform data.
> 
> Signed-off-by: Praveen Paneri <p.paneri@samsung.com>
> ---
>  arch/arm/boot/dts/exynos4210-smdkv310.dts |    5 +++++
>  arch/arm/mach-exynos/Kconfig              |    1 +
>  arch/arm/mach-exynos/include/mach/map.h   |    1 +
>  arch/arm/mach-exynos/mach-exynos4-dt.c    |    8 ++++++++
>  arch/arm/mach-exynos/setup-usb-phy.c      |   13 +++++++++++++
>  5 files changed, 28 insertions(+), 0 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/exynos4210-smdkv310.dts
> b/arch/arm/boot/dts/exynos4210-smdkv310.dts index 9b23a82..550903a
> 100644
> --- a/arch/arm/boot/dts/exynos4210-smdkv310.dts
> +++ b/arch/arm/boot/dts/exynos4210-smdkv310.dts
> @@ -59,6 +59,11 @@
>  		status = "okay";
>  	};
> 
> +	usbphy@125B0000 {
> +		compatible = "samsung,exynos4210-usbphy";
> +		reg = <0x125B0000 0x100>;
> +	};
> +
>  	keypad@100A0000 {
>  		samsung,keypad-num-rows = <2>;
>  		samsung,keypad-num-columns = <8>;
> diff --git a/arch/arm/mach-exynos/Kconfig b/arch/arm/mach-exynos/Kconfig
> index bb3b09a..315308c 100644
> --- a/arch/arm/mach-exynos/Kconfig
> +++ b/arch/arm/mach-exynos/Kconfig
> @@ -410,6 +410,7 @@ config MACH_EXYNOS4_DT
>  	select PINCTRL
>  	select PINCTRL_EXYNOS4
>  	select USE_OF
> +	select EXYNOS4_SETUP_USB_PHY
>  	help
>  	  Machine support for Samsung Exynos4 machine with device tree
> enabled. Select this if a fdt blob is available for the Exynos4 SoC
> based board. diff --git a/arch/arm/mach-exynos/include/mach/map.h
> b/arch/arm/mach-exynos/include/mach/map.h index ef4958b..e64fe1c 100644
> --- a/arch/arm/mach-exynos/include/mach/map.h
> +++ b/arch/arm/mach-exynos/include/mach/map.h
> @@ -244,6 +244,7 @@
>  #define S3C_PA_SPI1			EXYNOS4_PA_SPI1
>  #define S3C_PA_SPI2			EXYNOS4_PA_SPI2
>  #define S3C_PA_USB_HSOTG		EXYNOS4_PA_HSOTG
> +#define S3C_PA_USB_PHY			EXYNOS4_PA_HSPHY
> 
>  #define S5P_PA_EHCI			EXYNOS4_PA_EHCI
>  #define S5P_PA_FIMC0			EXYNOS4_PA_FIMC0
> diff --git a/arch/arm/mach-exynos/mach-exynos4-dt.c
> b/arch/arm/mach-exynos/mach-exynos4-dt.c index 8858068..f7887e5 100644
> --- a/arch/arm/mach-exynos/mach-exynos4-dt.c
> +++ b/arch/arm/mach-exynos/mach-exynos4-dt.c
> @@ -13,6 +13,7 @@
> 
>  #include <linux/of_platform.h>
>  #include <linux/serial_core.h>
> +#include <linux/platform_data/samsung-usbphy.h>
> 
>  #include <asm/mach/arch.h>
>  #include <asm/hardware/gic.h>
> @@ -20,9 +21,14 @@
> 
>  #include <plat/cpu.h>
>  #include <plat/regs-serial.h>
> +#include <plat/usb-phy.h>
> 
>  #include "common.h"
> 
> +static struct samsung_usbphy_data exynos4_usbphy_pdata = {
> +	.pmu_isolation = s5p_usb_phy_pmu_isolation,
> +};
> +
>  /*
>   * The following lookup table is used to override device names when
> devices * are registered from device tree. This is temporarily added to
> enable @@ -79,6 +85,8 @@ static const struct of_dev_auxdata
> exynos4_auxdata_lookup[] __initconst = { OF_DEV_AUXDATA("arm,pl330",
> EXYNOS4_PA_PDMA1, "dma-pl330.1", NULL),
> OF_DEV_AUXDATA("samsung,exynos4210-tmu", EXYNOS4_PA_TMU,
>  				"exynos-tmu", NULL),
> +	OF_DEV_AUXDATA("samsung,exynos4210-usbphy", EXYNOS4_PA_HSPHY,
> +			"s3c-usbphy", &exynos4_usbphy_pdata),

You should consider reworking the usb phy driver to avoid the need to 
specify platform data through of auxdata, because auxdata array in mach-
exynos4-dt is going to be removed after including common clock framework 
support for Exynos4.

Best regards,
Tomasz Figa
