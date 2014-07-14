From: Arun Kumar K <arun.kk@samsung.com>
Subject: Re: [PATCH 1/1] ARM: exynos_defconfig: Update exynos_defconfig
Date: Mon, 14 Jul 2014 17:13:30 +0530
Message-ID: <CALt3h7-OEG_j5PpZunS=T6ZFTTmHaauUnXvoT4wryR6cinH9Kw@mail.gmail.com>
References: <1404901353-14806-1-git-send-email-sachin.kamat@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-vc0-f171.google.com ([209.85.220.171]:52484 "EHLO
	mail-vc0-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755123AbaGNLnb (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 14 Jul 2014 07:43:31 -0400
Received: by mail-vc0-f171.google.com with SMTP id id10so6874941vcb.2
        for <linux-samsung-soc@vger.kernel.org>; Mon, 14 Jul 2014 04:43:30 -0700 (PDT)
In-Reply-To: <1404901353-14806-1-git-send-email-sachin.kamat@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sachin Kamat <sachin.kamat@samsung.com>
Cc: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Kukjin Kim <kgene.kim@samsung.com>, Doug Anderson <dianders@chromium.org>, spk.linux@gmail.com

Tested-by: Arun Kumar K <arun.kk@samsung.com>

on Samsung chromebook boards : Snow, pit and pi.

Regards
Arun

On Wed, Jul 9, 2014 at 3:52 PM, Sachin Kamat <sachin.kamat@samsung.com> wrote:
> Removed outdated configs. Enabled most of the configs used on latest
> Exynos based platforms. This will provide a reference for users trying
> to verify and test various features on Exynos based platforms and also
> help in detecting breakages by widening the build coverage.
>
> Signed-off-by: Sachin Kamat <sachin.kamat@samsung.com>
> ---
>  arch/arm/configs/exynos_defconfig |   56 +++++++++++++++++++++++++++++++------
>  1 file changed, 48 insertions(+), 8 deletions(-)
>
> diff --git a/arch/arm/configs/exynos_defconfig b/arch/arm/configs/exynos_defconfig
> index e07a227ec0db..fc7d1683bf67 100644
> --- a/arch/arm/configs/exynos_defconfig
> +++ b/arch/arm/configs/exynos_defconfig
> @@ -8,15 +8,17 @@ CONFIG_MODULE_UNLOAD=y
>  # CONFIG_BLK_DEV_BSG is not set
>  CONFIG_PARTITION_ADVANCED=y
>  CONFIG_ARCH_EXYNOS=y
> -CONFIG_S3C_LOWLEVEL_UART_PORT=3
> -CONFIG_S3C24XX_PWM=y
> -CONFIG_ARCH_EXYNOS5=y
> -CONFIG_MACH_EXYNOS4_DT=y
> +CONFIG_ARCH_EXYNOS3=y
> +CONFIG_EXYNOS5420_MCPM=y
>  CONFIG_SMP=y
> +CONFIG_BIG_LITTLE=y
> +CONFIG_BL_SWITCHER=y
> +CONFIG_BL_SWITCHER_DUMMY_IF=y
>  CONFIG_NR_CPUS=8
>  CONFIG_PREEMPT=y
>  CONFIG_AEABI=y
>  CONFIG_HIGHMEM=y
> +CONFIG_CMA=y
>  CONFIG_ZBOOT_ROM_TEXT=0x0
>  CONFIG_ZBOOT_ROM_BSS=0x0
>  CONFIG_ARM_APPENDED_DTB=y
> @@ -24,6 +26,7 @@ CONFIG_ARM_ATAG_DTB_COMPAT=y
>  CONFIG_CMDLINE="root=/dev/ram0 rw ramdisk=8192 initrd=0x41000000,8M console=ttySAC1,115200 init=/linuxrc mem=256M"
>  CONFIG_VFP=y
>  CONFIG_NEON=y
> +CONFIG_PM_RUNTIME=y
>  CONFIG_NET=y
>  CONFIG_PACKET=y
>  CONFIG_UNIX=y
> @@ -34,6 +37,8 @@ CONFIG_UEVENT_HELPER_PATH="/sbin/hotplug"
>  CONFIG_DEVTMPFS=y
>  CONFIG_DEVTMPFS_MOUNT=y
>  CONFIG_PROC_DEVICETREE=y
> +CONFIG_DMA_CMA=y
> +CONFIG_CMA_SIZE_MBYTES=64
>  CONFIG_BLK_DEV_LOOP=y
>  CONFIG_BLK_DEV_CRYPTOLOOP=y
>  CONFIG_BLK_DEV_RAM=y
> @@ -66,11 +71,22 @@ CONFIG_I2C=y
>  CONFIG_I2C_MUX=y
>  CONFIG_I2C_ARB_GPIO_CHALLENGE=y
>  CONFIG_I2C_EXYNOS5=y
> +CONFIG_I2C_CROS_EC_TUNNEL=y
> +CONFIG_SPI=y
> +CONFIG_SPI_S3C64XX=y
>  CONFIG_I2C_S3C2410=y
>  CONFIG_DEBUG_GPIO=y
> +CONFIG_POWER_SUPPLY=y
> +CONFIG_CHARGER_TPS65090=y
>  # CONFIG_HWMON is not set
> +CONFIG_THERMAL=y
> +CONFIG_EXYNOS_THERMAL=y
> +CONFIG_EXYNOS_THERMAL_CORE=y
> +CONFIG_WATCHDOG=y
> +CONFIG_S3C2410_WATCHDOG=y
>  CONFIG_MFD_CROS_EC=y
>  CONFIG_MFD_CROS_EC_I2C=y
> +CONFIG_MFD_CROS_EC_SPI=y
>  CONFIG_MFD_MAX77686=y
>  CONFIG_MFD_MAX8997=y
>  CONFIG_MFD_SEC_CORE=y
> @@ -80,6 +96,7 @@ CONFIG_REGULATOR_FIXED_VOLTAGE=y
>  CONFIG_REGULATOR_GPIO=y
>  CONFIG_REGULATOR_MAX8997=y
>  CONFIG_REGULATOR_MAX77686=y
> +CONFIG_REGULATOR_S2MPA01=y
>  CONFIG_REGULATOR_S2MPS11=y
>  CONFIG_REGULATOR_S5M8767=y
>  CONFIG_REGULATOR_TPS65090=y
> @@ -88,28 +105,50 @@ CONFIG_FB_MODE_HELPERS=y
>  CONFIG_FB_SIMPLE=y
>  CONFIG_EXYNOS_VIDEO=y
>  CONFIG_EXYNOS_MIPI_DSI=y
> -CONFIG_EXYNOS_DP=y
>  CONFIG_FRAMEBUFFER_CONSOLE=y
>  CONFIG_FONTS=y
>  CONFIG_FONT_7x14=y
>  CONFIG_LOGO=y
> +CONFIG_SOUND=y
> +CONFIG_SND=y
> +CONFIG_SND_SOC=y
> +CONFIG_SND_SOC_SAMSUNG=y
> +CONFIG_SND_SOC_SNOW=y
>  CONFIG_USB=y
> +CONFIG_USB_XHCI_HCD=y
>  CONFIG_USB_EHCI_HCD=y
>  CONFIG_USB_EHCI_EXYNOS=y
> +CONFIG_USB_OHCI_HCD=y
> +CONFIG_USB_OHCI_EXYNOS=y
>  CONFIG_USB_STORAGE=y
>  CONFIG_USB_DWC3=y
> -CONFIG_USB_PHY=y
> -CONFIG_SAMSUNG_USB2PHY=y
> -CONFIG_SAMSUNG_USB3PHY=y
> +CONFIG_USB_HSIC_USB3503=y
>  CONFIG_MMC=y
>  CONFIG_MMC_SDHCI=y
>  CONFIG_MMC_SDHCI_S3C=y
> +CONFIG_MMC_SDHCI_S3C_DMA=y
>  CONFIG_MMC_DW=y
>  CONFIG_MMC_DW_IDMAC=y
>  CONFIG_MMC_DW_EXYNOS=y
>  CONFIG_RTC_CLASS=y
> +CONFIG_RTC_DRV_MAX77686=y
> +CONFIG_RTC_DRV_S5M=y
>  CONFIG_RTC_DRV_S3C=y
> +CONFIG_DMADEVICES=y
> +CONFIG_PL330_DMA=y
>  CONFIG_COMMON_CLK_MAX77686=y
> +CONFIG_COMMON_CLK_S2MPS11=y
> +CONFIG_EXYNOS_IOMMU=y
> +CONFIG_IIO=y
> +CONFIG_EXYNOS_ADC=y
> +CONFIG_PWM=y
> +CONFIG_PWM_SAMSUNG=y
> +CONFIG_PHY_EXYNOS5250_SATA=y
> +CONFIG_PHY_SAMSUNG_USB2=y
> +CONFIG_PHY_EXYNOS4210_USB2=y
> +CONFIG_PHY_EXYNOS4X12_USB2=y
> +CONFIG_PHY_EXYNOS5250_USB2=y
> +CONFIG_PHY_EXYNOS5_USBDRD=y
>  CONFIG_EXT2_FS=y
>  CONFIG_EXT3_FS=y
>  CONFIG_EXT4_FS=y
> @@ -123,6 +162,7 @@ CONFIG_NLS_CODEPAGE_437=y
>  CONFIG_NLS_ASCII=y
>  CONFIG_NLS_ISO8859_1=y
>  CONFIG_PRINTK_TIME=y
> +CONFIG_DEBUG_FS=y
>  CONFIG_MAGIC_SYSRQ=y
>  CONFIG_DEBUG_KERNEL=y
>  CONFIG_DETECT_HUNG_TASK=y
> --
> 1.7.9.5
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsung-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
