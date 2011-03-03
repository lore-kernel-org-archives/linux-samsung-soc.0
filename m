From: Kyungmin Park <kmpark@infradead.org>
Subject: Re: [PATCH] ARM: EXYNOS4: Add ARMLEX4210 Board support file
Date: Thu, 3 Mar 2011 18:06:46 +0900
Message-ID: <AANLkTimd0frTRpmwf+0OQ2HjYTOqD3NMEEZQovqGVYH1@mail.gmail.com>
References: <10012655.143611299137229715.JavaMail.weblogic@epml15>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wy0-f174.google.com ([74.125.82.174]:45188 "EHLO
	mail-wy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754690Ab1CCJGs convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 3 Mar 2011 04:06:48 -0500
Received: by wyg36 with SMTP id 36so834517wyg.19
        for <linux-samsung-soc@vger.kernel.org>; Thu, 03 Mar 2011 01:06:46 -0800 (PST)
In-Reply-To: <10012655.143611299137229715.JavaMail.weblogic@epml15>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: alim.akhtar@samsung.com
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, ben-linux@fluff.org

On Thu, Mar 3, 2011 at 4:27 PM, ALIM AKHTAR <alim.akhtar@samsung.com> w=
rote:
> This patch is based on 'for-next' =A0branch of kgene tree.
>
> This patch adds Samsung ARMLEX4210 =A0board support file
> which is based on Exynos4210.
>
> Signed-off-by: Alim Akhtar <alim.akhtar@samsung.com>
> ---
> =A0arch/arm/mach-exynos4/Kconfig =A0 =A0 =A0 =A0 =A0 | =A0 13 ++
> =A0arch/arm/mach-exynos4/Makefile =A0 =A0 =A0 =A0 =A0| =A0 =A01 +
> =A0arch/arm/mach-exynos4/mach-armlex4210.c | =A0213 +++++++++++++++++=
++++++++++++++
> =A03 files changed, 227 insertions(+), 0 deletions(-)
> =A0create mode 100644 arch/arm/mach-exynos4/mach-armlex4210.c
>
> diff --git a/arch/arm/mach-exynos4/Kconfig b/arch/arm/mach-exynos4/Kc=
onfig
> index ad03840..a12bddf 100644
> --- a/arch/arm/mach-exynos4/Kconfig
> +++ b/arch/arm/mach-exynos4/Kconfig
> @@ -109,6 +109,19 @@ config MACH_SMDKV310
> =A0 =A0 =A0 =A0help
> =A0 =A0 =A0 =A0 =A0Machine support for Samsung SMDKV310
>
> +config MACH_ARMLEX4210
> + =A0 =A0 =A0 bool "ARMLEX4210"
> + =A0 =A0 =A0 select CPU_EXYNOS4210
> + =A0 =A0 =A0 select S3C_DEV_RTC
> + =A0 =A0 =A0 select S3C_DEV_WDT
> + =A0 =A0 =A0 select S3C_DEV_HSMMC
> + =A0 =A0 =A0 select S3C_DEV_HSMMC2
> + =A0 =A0 =A0 select S3C_DEV_HSMMC3
> + =A0 =A0 =A0 select EXYNOS4_DEV_SYSMMU
> + =A0 =A0 =A0 select EXYNOS4_SETUP_SDHCI
> + =A0 =A0 =A0 help
> + =A0 =A0 =A0 =A0 Machine support for Samsung ARMLEX4210 based on EXY=
NOS4210
> +
> =A0config MACH_UNIVERSAL_C210
> =A0 =A0 =A0 =A0bool "Mobile UNIVERSAL_C210 Board"
> =A0 =A0 =A0 =A0select CPU_EXYNOS4210
> diff --git a/arch/arm/mach-exynos4/Makefile b/arch/arm/mach-exynos4/M=
akefile
> index 0558235..2860af8 100644
> --- a/arch/arm/mach-exynos4/Makefile
> +++ b/arch/arm/mach-exynos4/Makefile
> @@ -24,6 +24,7 @@ obj-$(CONFIG_HOTPLUG_CPU) =A0 =A0 +=3D hotplug.o
>
> =A0obj-$(CONFIG_MACH_SMDKC210) =A0 =A0 =A0 =A0 =A0 =A0+=3D mach-smdkc=
210.o
> =A0obj-$(CONFIG_MACH_SMDKV310) =A0 =A0 =A0 =A0 =A0 =A0+=3D mach-smdkv=
310.o
> +obj-$(CONFIG_MACH_ARMLEX4210) =A0 =A0 =A0 =A0 =A0+=3D mach-armlex421=
0.o
> =A0obj-$(CONFIG_MACH_UNIVERSAL_C210) =A0 =A0 =A0+=3D mach-universal_c=
210.o
>
> =A0# device support
> diff --git a/arch/arm/mach-exynos4/mach-armlex4210.c b/arch/arm/mach-=
exynos4/mach-armlex4210.c
> new file mode 100644
> index 0000000..856ab6e
> --- /dev/null
> +++ b/arch/arm/mach-exynos4/mach-armlex4210.c
> @@ -0,0 +1,213 @@
> +/* linux/arch/arm/mach-exynos4/mach-armlex4210.c
> + *
> + * Copyright (c) 2011 Samsung Electronics Co., Ltd.
> + * =A0 =A0 =A0 =A0 =A0 =A0 http://www.samsung.com
> + *
> + * This program is free software; you can redistribute it and/or mod=
ify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> +*/
> +
> +#include <linux/gpio.h>
> +#include <linux/io.h>
> +#include <linux/mmc/host.h>
> +#include <linux/platform_device.h>
> +#include <linux/serial_core.h>
> +#include <linux/smsc911x.h>
> +
> +#include <asm/mach/arch.h>
> +#include <asm/mach-types.h>
> +
> +#include <plat/cpu.h>
> +#include <plat/devs.h>
> +#include <plat/exynos4.h>
> +#include <plat/gpio-cfg.h>
> +#include <plat/regs-serial.h>
> +#include <plat/regs-srom.h>
> +#include <plat/sdhci.h>
> +
> +#include <mach/map.h>
> +
> +/* Following are default values for UCON, ULCON and UFCON UART regis=
ters */
> +#define ARMLEX4210_UCON_DEFAULT =A0 =A0 =A0 =A0(S3C2410_UCON_TXILEVE=
L | =A0 =A0 =A0 =A0\
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0S3C2=
410_UCON_RXILEVEL | =A0 =A0 =A0 =A0\
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0S3C2=
410_UCON_TXIRQMODE | =A0 =A0 =A0 \
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0S3C2=
410_UCON_RXIRQMODE | =A0 =A0 =A0 \
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0S3C2=
410_UCON_RXFIFO_TOI | =A0 =A0 =A0\
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0S3C2=
443_UCON_RXERR_IRQEN)
> +
> +#define ARMLEX4210_ULCON_DEFAULT =A0 =A0 =A0 S3C2410_LCON_CS8
> +
> +#define ARMLEX4210_UFCON_DEFAULT =A0 =A0 =A0 (S3C2410_UFCON_FIFOMODE=
 | =A0 =A0 =A0 \
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0S5PV=
210_UFCON_TXTRIG4 | =A0 =A0 =A0 =A0\
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0S5PV=
210_UFCON_RXTRIG4)
> +
> +static struct s3c2410_uartcfg armlex4210_uartcfgs[] __initdata =3D {
> + =A0 =A0 =A0 [0] =3D {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .hwport =A0 =A0 =A0 =A0 =3D 0,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .flags =A0 =A0 =A0 =A0 =A0=3D 0,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .ucon =A0 =A0 =A0 =A0 =A0 =3D ARMLEX421=
0_UCON_DEFAULT,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .ulcon =A0 =A0 =A0 =A0 =A0=3D ARMLEX421=
0_ULCON_DEFAULT,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .ufcon =A0 =A0 =A0 =A0 =A0=3D ARMLEX421=
0_UFCON_DEFAULT,
> + =A0 =A0 =A0 },
> + =A0 =A0 =A0 [1] =3D {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .hwport =A0 =A0 =A0 =A0 =3D 1,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .flags =A0 =A0 =A0 =A0 =A0=3D 0,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .ucon =A0 =A0 =A0 =A0 =A0 =3D ARMLEX421=
0_UCON_DEFAULT,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .ulcon =A0 =A0 =A0 =A0 =A0=3D ARMLEX421=
0_ULCON_DEFAULT,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .ufcon =A0 =A0 =A0 =A0 =A0=3D ARMLEX421=
0_UFCON_DEFAULT,
> + =A0 =A0 =A0 },
> + =A0 =A0 =A0 [2] =3D {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .hwport =A0 =A0 =A0 =A0 =3D 2,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .flags =A0 =A0 =A0 =A0 =A0=3D 0,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .ucon =A0 =A0 =A0 =A0 =A0 =3D ARMLEX421=
0_UCON_DEFAULT,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .ulcon =A0 =A0 =A0 =A0 =A0=3D ARMLEX421=
0_ULCON_DEFAULT,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .ufcon =A0 =A0 =A0 =A0 =A0=3D ARMLEX421=
0_UFCON_DEFAULT,
> + =A0 =A0 =A0 },
> + =A0 =A0 =A0 [3] =3D {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .hwport =A0 =A0 =A0 =A0 =3D 3,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .flags =A0 =A0 =A0 =A0 =A0=3D 0,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .ucon =A0 =A0 =A0 =A0 =A0 =3D ARMLEX421=
0_UCON_DEFAULT,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .ulcon =A0 =A0 =A0 =A0 =A0=3D ARMLEX421=
0_ULCON_DEFAULT,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .ufcon =A0 =A0 =A0 =A0 =A0=3D ARMLEX421=
0_UFCON_DEFAULT,
> + =A0 =A0 =A0 },
> +};
> +
> +static struct s3c_sdhci_platdata armlex4210_hsmmc0_pdata __initdata =
=3D {
> + =A0 =A0 =A0 .cd_type =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=3D S3C_SDHCI_C=
D_PERMANENT,
> + =A0 =A0 =A0 .clk_type =A0 =A0 =A0 =A0 =A0 =A0 =A0 =3D S3C_SDHCI_CLK=
_DIV_EXTERNAL,
> +#ifdef CONFIG_EXYNOS4_SDHCI_CH0_8BIT
> + =A0 =A0 =A0 .max_width =A0 =A0 =A0 =A0 =A0 =A0 =A0=3D 8,
> + =A0 =A0 =A0 .host_caps =A0 =A0 =A0 =A0 =A0 =A0 =A0=3D MMC_CAP_8_BIT=
_DATA,
> +#endif
> +};
> +
> +static struct s3c_sdhci_platdata armlex4210_hsmmc2_pdata __initdata =
=3D {
> + =A0 =A0 =A0 .cd_type =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=3D S3C_SDHCI_C=
D_GPIO,
> + =A0 =A0 =A0 .ext_cd_gpio =A0 =A0 =A0 =A0 =A0 =A0=3D EXYNOS4_GPX2(5)=
,
> + =A0 =A0 =A0 .ext_cd_gpio_invert =A0 =A0 =3D 1,
> + =A0 =A0 =A0 .clk_type =A0 =A0 =A0 =A0 =A0 =A0 =A0 =3D S3C_SDHCI_CLK=
_DIV_EXTERNAL,
> + =A0 =A0 =A0 .max_width =A0 =A0 =A0 =A0 =A0 =A0 =A0=3D 4,
> +};
> +
> +static struct s3c_sdhci_platdata armlex4210_hsmmc3_pdata __initdata =
=3D {
> + =A0 =A0 =A0 .cd_type =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=3D S3C_SDHCI_C=
D_PERMANENT,
> + =A0 =A0 =A0 .max_width =A0 =A0 =A0 =A0 =A0 =A0 =A0=3D 4,
maybe you missed the clk_type. It's required for exynos4 series.
clk_type =A0 =A0 =A0 =A0 =A0 =A0 =A0 =3D S3C_SDHCI_CLK_DIV_EXTERNAL,
> +};
> +
> +static void __init armlex4210_sdhci_init(void)
> +{
> + =A0 =A0 =A0 s3c_sdhci0_set_platdata(&armlex4210_hsmmc0_pdata);
> + =A0 =A0 =A0 s3c_sdhci2_set_platdata(&armlex4210_hsmmc2_pdata);
> + =A0 =A0 =A0 s3c_sdhci3_set_platdata(&armlex4210_hsmmc3_pdata);
> +}
> +
> +static void __init armlex4210_wlan_init(void)
> +{
> + =A0 =A0 =A0 /* enable */
> + =A0 =A0 =A0 s3c_gpio_cfgpin(EXYNOS4_GPX2(0), S3C_GPIO_SFN(0xf));
> + =A0 =A0 =A0 s3c_gpio_setpull(EXYNOS4_GPX2(0), S3C_GPIO_PULL_UP);
> +
> + =A0 =A0 =A0 /* reset */
> + =A0 =A0 =A0 s3c_gpio_cfgpin(EXYNOS4_GPX1(6), S3C_GPIO_SFN(0xf));
> + =A0 =A0 =A0 s3c_gpio_setpull(EXYNOS4_GPX1(6), S3C_GPIO_PULL_UP);
> +
> + =A0 =A0 =A0 /* wakeup */
> + =A0 =A0 =A0 s3c_gpio_cfgpin(EXYNOS4_GPX1(5), S3C_GPIO_SFN(0xf));
> + =A0 =A0 =A0 s3c_gpio_setpull(EXYNOS4_GPX1(5), S3C_GPIO_PULL_UP);
> +}
> +
> +static struct resource armlex4210_smsc911x_resources[] =3D {
> + =A0 =A0 =A0 [0] =3D {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .start =A0=3D EXYNOS4_PA_SROM_BANK(3),
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .end =A0 =A0=3D EXYNOS4_PA_SROM_BANK(3)=
 + SZ_64K - 1,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .flags =A0=3D IORESOURCE_MEM,
> + =A0 =A0 =A0 },
> + =A0 =A0 =A0 [1] =3D {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .start =A0=3D IRQ_EINT(27),
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .end =A0 =A0=3D IRQ_EINT(27),
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .flags =A0=3D IORESOURCE_IRQ | IRQF_TRI=
GGER_HIGH,
> + =A0 =A0 =A0 },
> +};
> +
> +static struct smsc911x_platform_config smsc9215_config =3D {
> + =A0 =A0 =A0 .irq_polarity =A0 =3D SMSC911X_IRQ_POLARITY_ACTIVE_HIGH=
,
> + =A0 =A0 =A0 .irq_type =A0 =A0 =A0 =3D SMSC911X_IRQ_TYPE_PUSH_PULL,
> + =A0 =A0 =A0 .flags =A0 =A0 =A0 =A0 =A0=3D SMSC911X_USE_16BIT | SMSC=
911X_FORCE_INTERNAL_PHY,
> + =A0 =A0 =A0 .phy_interface =A0=3D PHY_INTERFACE_MODE_MII,
> + =A0 =A0 =A0 .mac =A0 =A0 =A0 =A0 =A0 =A0=3D {0x00, 0x80, 0x00, 0x23=
, 0x45, 0x67},
> +};
> +
> +static struct platform_device armlex4210_smsc911x =3D {
> + =A0 =A0 =A0 .name =A0 =A0 =A0 =A0 =A0 =3D "smsc911x",
> + =A0 =A0 =A0 .id =A0 =A0 =A0 =A0 =A0 =A0 =3D -1,
> + =A0 =A0 =A0 .num_resources =A0=3D ARRAY_SIZE(armlex4210_smsc911x_re=
sources),
> + =A0 =A0 =A0 .resource =A0 =A0 =A0 =3D armlex4210_smsc911x_resources=
,
> + =A0 =A0 =A0 .dev =A0 =A0 =A0 =A0 =A0 =A0=3D {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .platform_data =A0=3D &smsc9215_config,
> + =A0 =A0 =A0 },
> +};
> +
> +static struct platform_device *armlex4210_devices[] __initdata =3D {
> + =A0 =A0 =A0 &s3c_device_hsmmc0,
> + =A0 =A0 =A0 &s3c_device_hsmmc2,
> + =A0 =A0 =A0 &s3c_device_hsmmc3,
> + =A0 =A0 =A0 &s3c_device_rtc,
> + =A0 =A0 =A0 &s3c_device_wdt,
> + =A0 =A0 =A0 &exynos4_device_sysmmu,
> + =A0 =A0 =A0 &samsung_asoc_dma,
> + =A0 =A0 =A0 &armlex4210_smsc911x,
> +};
> +
> +static void __init armlex4210_smsc911x_init(void)
> +{
> + =A0 =A0 =A0 u32 cs1;
> +
> + =A0 =A0 =A0 /* configure nCS1 width to 16 bits */
> + =A0 =A0 =A0 cs1 =3D __raw_readl(S5P_SROM_BW) &
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 ~(S5P_SROM_BW__CS_MASK << S5P_SROM_BW__=
NCS1__SHIFT);
> + =A0 =A0 =A0 cs1 |=3D ((1 << S5P_SROM_BW__DATAWIDTH__SHIFT) |
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 (0 << S5P_SROM_BW__WAITENABLE__SHIFT) |
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 (1 << S5P_SROM_BW__ADDRMODE__SHIFT) |
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 (1 << S5P_SROM_BW__BYTEENABLE__SHIFT)) =
<<
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 S5P_SROM_BW__NCS1__SHIFT;
> + =A0 =A0 =A0 __raw_writel(cs1, S5P_SROM_BW);
> +
> + =A0 =A0 =A0 /* set timing for nCS1 suitable for ethernet chip */
> + =A0 =A0 =A0 __raw_writel((0x1 << S5P_SROM_BCX__PMC__SHIFT) |
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0(0x9 << S5P_SROM_BCX__TACP__=
SHIFT) |
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0(0xc << S5P_SROM_BCX__TCAH__=
SHIFT) |
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0(0x1 << S5P_SROM_BCX__TCOH__=
SHIFT) |
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0(0x6 << S5P_SROM_BCX__TACC__=
SHIFT) |
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0(0x1 << S5P_SROM_BCX__TCOS__=
SHIFT) |
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0(0x1 << S5P_SROM_BCX__TACS__=
SHIFT), S5P_SROM_BC1);
> +}
> +
> +static void __init armlex4210_map_io(void)
> +{
> + =A0 =A0 =A0 s5p_init_io(NULL, 0, S5P_VA_CHIPID);
> + =A0 =A0 =A0 s3c24xx_init_clocks(24000000);
> + =A0 =A0 =A0 s3c24xx_init_uarts(armlex4210_uartcfgs,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0ARRAY_SIZE(armle=
x4210_uartcfgs));
> +}
> +
> +static void __init armlex4210_machine_init(void)
> +{
> + =A0 =A0 =A0 armlex4210_smsc911x_init();
> +
> + =A0 =A0 =A0 armlex4210_sdhci_init();
> +
> + =A0 =A0 =A0 armlex4210_wlan_init();
> +
> + =A0 =A0 =A0 platform_add_devices(armlex4210_devices,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0ARRAY_SIZE(a=
rmlex4210_devices));
> +}
> +
> +MACHINE_START(ARMLEX4210, "ARMLEX4210")
> + =A0 =A0 =A0 /* Maintainer: Alim Akhtar <alim.akhtar@samsung.com> */
> + =A0 =A0 =A0 .boot_params =A0 =A0=3D S5P_PA_SDRAM + 0x100,
> + =A0 =A0 =A0 .init_irq =A0 =A0 =A0 =3D exynos4_init_irq,
> + =A0 =A0 =A0 .map_io =A0 =A0 =A0 =A0 =3D armlex4210_map_io,
> + =A0 =A0 =A0 .init_machine =A0 =3D armlex4210_machine_init,
> + =A0 =A0 =A0 .timer =A0 =A0 =A0 =A0 =A0=3D &exynos4_timer,
> +MACHINE_END
> --
> 1.7.0.4
>
