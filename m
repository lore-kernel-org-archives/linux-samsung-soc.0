From: Kyungmin Park <kmpark@infradead.org>
Subject: Re: [PATCH 3/3] ARM: S5PV310: Add support HSMMC on SMDKC210 and SMDKV310
Date: Sun, 22 Aug 2010 11:04:26 +0900
Message-ID: <AANLkTikmL_mLpmQsmCo0N_fb9hUQR0sE1DFwwEPYr9_R@mail.gmail.com>
References: <1282307628-5254-1-git-send-email-kgene.kim@samsung.com>
	<1282307628-5254-4-git-send-email-kgene.kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wy0-f174.google.com ([74.125.82.174]:61082 "EHLO
	mail-wy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751796Ab0HVCE2 convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 21 Aug 2010 22:04:28 -0400
Received: by wyb32 with SMTP id 32so5377150wyb.19
        for <linux-samsung-soc@vger.kernel.org>; Sat, 21 Aug 2010 19:04:26 -0700 (PDT)
In-Reply-To: <1282307628-5254-4-git-send-email-kgene.kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, ben-linux@fluff.org, Hyuk Lee <hyuk1.lee@samsung.com>, Andrew Morton <akpm@linux-foundation.org>

On Fri, Aug 20, 2010 at 9:33 PM, Kukjin Kim <kgene.kim@samsung.com> wro=
te:
> From: Hyuk Lee <hyuk1.lee@samsung.com>
>
> This patch adds support HSMMC on SMDKC210 and SMDKV310, and adds
> setup functions for it. S5PV310/S5PC210 can support 4 hsmmc such
> as hsmmc0, hsmmc1, hsmmc2 and hsmmc3.
>
> Signed-off-by: Hyuk Lee <hyuk1.lee@samsung.com>
> Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
> ---
> =A0arch/arm/mach-s5pv310/Kconfig =A0 =A0 =A0 =A0 =A0 =A0 =A0| =A0 21 =
++++
> =A0arch/arm/mach-s5pv310/Makefile =A0 =A0 =A0 =A0 =A0 =A0 | =A0 =A02 =
+
> =A0arch/arm/mach-s5pv310/cpu.c =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0| =A0 =A0=
8 ++
> =A0arch/arm/mach-s5pv310/mach-smdkc210.c =A0 =A0 =A0| =A0 50 ++++++++=
++
> =A0arch/arm/mach-s5pv310/mach-smdkv310.c =A0 =A0 =A0| =A0 50 ++++++++=
++
> =A0arch/arm/mach-s5pv310/setup-sdhci-gpio.c =A0 | =A0141 ++++++++++++=
++++++++++++++++
> =A0arch/arm/mach-s5pv310/setup-sdhci.c =A0 =A0 =A0 =A0| =A0 56 ++++++=
+++++
> =A0arch/arm/plat-samsung/include/plat/sdhci.h | =A0 58 +++++++++++
> =A08 files changed, 386 insertions(+), 0 deletions(-)
> =A0create mode 100644 arch/arm/mach-s5pv310/setup-sdhci-gpio.c
> =A0create mode 100644 arch/arm/mach-s5pv310/setup-sdhci.c
>
> diff --git a/arch/arm/mach-s5pv310/Kconfig b/arch/arm/mach-s5pv310/Kc=
onfig
> index 9ac29fe..bebad32 100644
> --- a/arch/arm/mach-s5pv310/Kconfig
> +++ b/arch/arm/mach-s5pv310/Kconfig
> @@ -25,6 +25,17 @@ config S5PV310_SETUP_I2C2
> =A0 =A0 =A0 =A0help
> =A0 =A0 =A0 =A0 =A0Common setup code for i2c bus 2.
>
> +config S5PV310_SETUP_SDHCI
> + =A0 =A0 =A0 bool
> + =A0 =A0 =A0 select S5PV310_SETUP_SDHCI_GPIO
> + =A0 =A0 =A0 help
> + =A0 =A0 =A0 =A0 Internal helper functions for S5PV310 based SDHCI s=
ystems.
> +
> +config S5PV310_SETUP_SDHCI_GPIO
> + =A0 =A0 =A0 bool
> + =A0 =A0 =A0 help
> + =A0 =A0 =A0 =A0 Common setup code for SDHCI GPIO.
> +
> =A0# machine support
>
> =A0menu "S5PC210 Machines"
> @@ -33,6 +44,11 @@ config MACH_SMDKC210
> =A0 =A0 =A0 =A0bool "SMDKC210"
> =A0 =A0 =A0 =A0select CPU_S5PV310
> =A0 =A0 =A0 =A0select ARCH_SPARSEMEM_ENABLE
> + =A0 =A0 =A0 select S3C_DEV_HSMMC
> + =A0 =A0 =A0 select S3C_DEV_HSMMC1
> + =A0 =A0 =A0 select S3C_DEV_HSMMC2
> + =A0 =A0 =A0 select S3C_DEV_HSMMC3
> + =A0 =A0 =A0 select S5PV310_SETUP_SDHCI
> =A0 =A0 =A0 =A0help
> =A0 =A0 =A0 =A0 =A0Machine support for Samsung SMDKC210
> =A0 =A0 =A0 =A0 =A0S5PC210(MCP) is one of package option of S5PV310
> @@ -53,6 +69,11 @@ config MACH_SMDKV310
> =A0 =A0 =A0 =A0bool "SMDKV310"
> =A0 =A0 =A0 =A0select CPU_S5PV310
> =A0 =A0 =A0 =A0select ARCH_SPARSEMEM_ENABLE
> + =A0 =A0 =A0 select S3C_DEV_HSMMC
> + =A0 =A0 =A0 select S3C_DEV_HSMMC1
> + =A0 =A0 =A0 select S3C_DEV_HSMMC2
> + =A0 =A0 =A0 select S3C_DEV_HSMMC3
> + =A0 =A0 =A0 select S5PV310_SETUP_SDHCI
> =A0 =A0 =A0 =A0help
> =A0 =A0 =A0 =A0 =A0Machine support for Samsung SMDKV310
>
> diff --git a/arch/arm/mach-s5pv310/Makefile b/arch/arm/mach-s5pv310/M=
akefile
> index aefb14f..c89b6b0 100644
> --- a/arch/arm/mach-s5pv310/Makefile
> +++ b/arch/arm/mach-s5pv310/Makefile
> @@ -29,3 +29,5 @@ obj-$(CONFIG_MACH_UNIVERSAL_C210) =A0 =A0 +=3D mach=
-universal_c210.o
>
> =A0obj-$(CONFIG_S5PV310_SETUP_I2C1) =A0 =A0 =A0 +=3D setup-i2c1.o
> =A0obj-$(CONFIG_S5PV310_SETUP_I2C2) =A0 =A0 =A0 +=3D setup-i2c2.o
> +obj-$(CONFIG_S5PV310_SETUP_SDHCI) =A0 =A0 =A0+=3D setup-sdhci.o
> +obj-$(CONFIG_S5PV310_SETUP_SDHCI_GPIO) +=3D setup-sdhci-gpio.o
> diff --git a/arch/arm/mach-s5pv310/cpu.c b/arch/arm/mach-s5pv310/cpu.=
c
> index db4f55a..3514e87 100644
> --- a/arch/arm/mach-s5pv310/cpu.c
> +++ b/arch/arm/mach-s5pv310/cpu.c
> @@ -19,6 +19,7 @@
> =A0#include <plat/cpu.h>
> =A0#include <plat/clock.h>
> =A0#include <plat/s5pv310.h>
> +#include <plat/sdhci.h>
>
> =A0#include <mach/regs-irq.h>
>
> @@ -73,6 +74,13 @@ static void s5pv310_idle(void)
> =A0void __init s5pv310_map_io(void)
> =A0{
> =A0 =A0 =A0 =A0iotable_init(s5pv310_iodesc, ARRAY_SIZE(s5pv310_iodesc=
));
> +
> + =A0 =A0 =A0 /* initialize device information early */
> +
> + =A0 =A0 =A0 s5pv310_default_sdhci0();
> + =A0 =A0 =A0 s5pv310_default_sdhci1();
> + =A0 =A0 =A0 s5pv310_default_sdhci2();
> + =A0 =A0 =A0 s5pv310_default_sdhci3();
> =A0}
>
> =A0void __init s5pv310_init_clocks(int xtal)
> diff --git a/arch/arm/mach-s5pv310/mach-smdkc210.c b/arch/arm/mach-s5=
pv310/mach-smdkc210.c
> index 71a3bec..52c85de 100644
> --- a/arch/arm/mach-s5pv310/mach-smdkc210.c
> +++ b/arch/arm/mach-s5pv310/mach-smdkc210.c
> @@ -9,6 +9,7 @@
> =A0*/
>
> =A0#include <linux/serial_core.h>
> +#include <linux/gpio.h>
>
> =A0#include <asm/mach/arch.h>
> =A0#include <asm/mach-types.h>
> @@ -16,7 +17,9 @@
>
> =A0#include <plat/regs-serial.h>
> =A0#include <plat/s5pv310.h>
> +#include <plat/devs.h>
> =A0#include <plat/cpu.h>
> +#include <plat/sdhci.h>
>
> =A0#include <mach/map.h>
>
> @@ -65,6 +68,49 @@ static struct s3c2410_uartcfg smdkc210_uartcfgs[] =
__initdata =3D {
> =A0 =A0 =A0 =A0},
> =A0};
>
> +static struct s3c_sdhci_platdata smdkc210_hsmmc0_pdata __initdata =3D=
 {
> + =A0 =A0 =A0 .max_width =A0 =A0 =A0 =A0 =A0 =A0 =A0=3D 4,
> + =A0 =A0 =A0 .cd_type =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=3D S3C_SDHCI_C=
D_GPIO,
> + =A0 =A0 =A0 .ext_cd_gpio =A0 =A0 =A0 =A0 =A0 =A0=3D S5PV310_GPK0(2)=
,
> + =A0 =A0 =A0 .ext_cd_gpio_invert =A0 =A0 =3D 1,
> +};
> +
> +static struct s3c_sdhci_platdata smdkc210_hsmmc1_pdata __initdata =3D=
 {
> + =A0 =A0 =A0 .max_width =A0 =A0 =A0 =A0 =A0 =A0 =A0=3D 4,
> + =A0 =A0 =A0 .cd_type =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=3D S3C_SDHCI_C=
D_GPIO,
> + =A0 =A0 =A0 .ext_cd_gpio =A0 =A0 =A0 =A0 =A0 =A0=3D S5PV310_GPK0(2)=
,
> + =A0 =A0 =A0 .ext_cd_gpio_invert =A0 =A0 =3D 1,
> +};
> +
> +static struct s3c_sdhci_platdata smdkc210_hsmmc2_pdata __initdata =3D=
 {
> + =A0 =A0 =A0 .max_width =A0 =A0 =A0 =A0 =A0 =A0 =A0=3D 4,
> + =A0 =A0 =A0 .cd_type =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=3D S3C_SDHCI_C=
D_GPIO,
> + =A0 =A0 =A0 .ext_cd_gpio =A0 =A0 =A0 =A0 =A0 =A0=3D S5PV310_GPK2(2)=
,
> + =A0 =A0 =A0 .ext_cd_gpio_invert =A0 =A0 =3D 1,
> +};
> +
> +static struct s3c_sdhci_platdata smdkc210_hsmmc3_pdata __initdata =3D=
 {
> + =A0 =A0 =A0 .max_width =A0 =A0 =A0 =A0 =A0 =A0 =A0=3D 4,
> + =A0 =A0 =A0 .cd_type =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=3D S3C_SDHCI_C=
D_GPIO,
> + =A0 =A0 =A0 .ext_cd_gpio =A0 =A0 =A0 =A0 =A0 =A0=3D S5PV310_GPK2(2)=
,
> + =A0 =A0 =A0 .ext_cd_gpio_invert =A0 =A0 =3D 1,
> +};
> +
> +static void smdkc210_setup_sdhci(void)
> +{
> + =A0 =A0 =A0 s3c_sdhci0_set_platdata(&smdkc210_hsmmc0_pdata);
> + =A0 =A0 =A0 s3c_sdhci1_set_platdata(&smdkc210_hsmmc1_pdata);
> + =A0 =A0 =A0 s3c_sdhci2_set_platdata(&smdkc210_hsmmc2_pdata);
> + =A0 =A0 =A0 s3c_sdhci3_set_platdata(&smdkc210_hsmmc3_pdata);
> +}
> +
> +static struct platform_device *smdkc210_devices[] __initdata =3D {
> + =A0 =A0 =A0 &s3c_device_hsmmc0,
> + =A0 =A0 =A0 &s3c_device_hsmmc1,
> + =A0 =A0 =A0 &s3c_device_hsmmc2,
> + =A0 =A0 =A0 &s3c_device_hsmmc3,
> +};
> +
> =A0static void __init smdkc210_map_io(void)
> =A0{
> =A0 =A0 =A0 =A0s5p_init_io(NULL, 0, S5P_VA_CHIPID);
> @@ -77,6 +123,10 @@ static void __init smdkc210_machine_init(void)
> =A0#ifdef CONFIG_CACHE_L2X0
> =A0 =A0 =A0 =A0l2x0_init(S5P_VA_L2CC, 1 << 28, 0xffffffff);
> =A0#endif
> +
> + =A0 =A0 =A0 smdkc210_setup_sdhci();
> +
> + =A0 =A0 =A0 platform_add_devices(smdkc210_devices, ARRAY_SIZE(smdkc=
210_devices));
> =A0}
>
> =A0MACHINE_START(SMDKC210, "SMDKC210")
> diff --git a/arch/arm/mach-s5pv310/mach-smdkv310.c b/arch/arm/mach-s5=
pv310/mach-smdkv310.c
> index 0d6ab77..72f03ae 100644
> --- a/arch/arm/mach-s5pv310/mach-smdkv310.c
> +++ b/arch/arm/mach-s5pv310/mach-smdkv310.c
> @@ -9,6 +9,7 @@
> =A0*/
>
> =A0#include <linux/serial_core.h>
> +#include <linux/gpio.h>
>
> =A0#include <asm/mach/arch.h>
> =A0#include <asm/mach-types.h>
> @@ -16,7 +17,9 @@
>
> =A0#include <plat/regs-serial.h>
> =A0#include <plat/s5pv310.h>
> +#include <plat/devs.h>
> =A0#include <plat/cpu.h>
> +#include <plat/sdhci.h>
>
> =A0#include <mach/map.h>
>
> @@ -65,6 +68,49 @@ static struct s3c2410_uartcfg smdkv310_uartcfgs[] =
__initdata =3D {
> =A0 =A0 =A0 =A0},
> =A0};
>
> +static struct s3c_sdhci_platdata smdkv310_hsmmc0_pdata __initdata =3D=
 {
> + =A0 =A0 =A0 .max_width =A0 =A0 =A0 =A0 =A0 =A0 =A0=3D 4,
> + =A0 =A0 =A0 .cd_type =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=3D S3C_SDHCI_C=
D_GPIO,
> + =A0 =A0 =A0 .ext_cd_gpio =A0 =A0 =A0 =A0 =A0 =A0=3D S5PV310_GPK0(2)=
,
> + =A0 =A0 =A0 .ext_cd_gpio_invert =A0 =A0 =3D 1,
> +};
> +
> +static struct s3c_sdhci_platdata smdkv310_hsmmc1_pdata __initdata =3D=
 {
> + =A0 =A0 =A0 .max_width =A0 =A0 =A0 =A0 =A0 =A0 =A0=3D 4,
> + =A0 =A0 =A0 .cd_type =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=3D S3C_SDHCI_C=
D_GPIO,
> + =A0 =A0 =A0 .ext_cd_gpio =A0 =A0 =A0 =A0 =A0 =A0=3D S5PV310_GPK0(2)=
,
> + =A0 =A0 =A0 .ext_cd_gpio_invert =A0 =A0 =3D 1,
> +};
> +
> +static struct s3c_sdhci_platdata smdkv310_hsmmc2_pdata __initdata =3D=
 {
> + =A0 =A0 =A0 .max_width =A0 =A0 =A0 =A0 =A0 =A0 =A0=3D 4,
> + =A0 =A0 =A0 .cd_type =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=3D S3C_SDHCI_C=
D_GPIO,
> + =A0 =A0 =A0 .ext_cd_gpio =A0 =A0 =A0 =A0 =A0 =A0=3D S5PV310_GPK2(2)=
,
> + =A0 =A0 =A0 .ext_cd_gpio_invert =A0 =A0 =3D 1,
> +};
> +
> +static struct s3c_sdhci_platdata smdkv310_hsmmc3_pdata __initdata =3D=
 {
> + =A0 =A0 =A0 .max_width =A0 =A0 =A0 =A0 =A0 =A0 =A0=3D 4,
> + =A0 =A0 =A0 .cd_type =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=3D S3C_SDHCI_C=
D_GPIO,
> + =A0 =A0 =A0 .ext_cd_gpio =A0 =A0 =A0 =A0 =A0 =A0=3D S5PV310_GPK2(2)=
,
> + =A0 =A0 =A0 .ext_cd_gpio_invert =A0 =A0 =3D 1,
> +};
> +
> +static void smdkv310_setup_sdhci(void)
> +{
> + =A0 =A0 =A0 s3c_sdhci0_set_platdata(&smdkv310_hsmmc0_pdata);
> + =A0 =A0 =A0 s3c_sdhci1_set_platdata(&smdkv310_hsmmc1_pdata);
> + =A0 =A0 =A0 s3c_sdhci2_set_platdata(&smdkv310_hsmmc2_pdata);
> + =A0 =A0 =A0 s3c_sdhci3_set_platdata(&smdkv310_hsmmc3_pdata);
> +}
> +
> +static struct platform_device *smdkv310_devices[] __initdata =3D {
> + =A0 =A0 =A0 &s3c_device_hsmmc0,
> + =A0 =A0 =A0 &s3c_device_hsmmc1,
> + =A0 =A0 =A0 &s3c_device_hsmmc2,
> + =A0 =A0 =A0 &s3c_device_hsmmc3,
> +};
> +
> =A0static void __init smdkv310_map_io(void)
> =A0{
> =A0 =A0 =A0 =A0s5p_init_io(NULL, 0, S5P_VA_CHIPID);
> @@ -77,6 +123,10 @@ static void __init smdkv310_machine_init(void)
> =A0#ifdef CONFIG_CACHE_L2X0
> =A0 =A0 =A0 =A0l2x0_init(S5P_VA_L2CC, 1 << 28, 0xffffffff);
> =A0#endif
> +
> + =A0 =A0 =A0 smdkv310_setup_sdhci();
> +
> + =A0 =A0 =A0 platform_add_devices(smdkv310_devices, ARRAY_SIZE(smdkv=
310_devices));
> =A0}
>
> =A0MACHINE_START(SMDKV310, "SMDKV310")
> diff --git a/arch/arm/mach-s5pv310/setup-sdhci-gpio.c b/arch/arm/mach=
-s5pv310/setup-sdhci-gpio.c
> new file mode 100644
> index 0000000..96332d9
> --- /dev/null
> +++ b/arch/arm/mach-s5pv310/setup-sdhci-gpio.c
> @@ -0,0 +1,141 @@
> +/* linux/arch/arm/plat-s5pc1xx/setup-sdhci-gpio.c
> + *
> + * Copyright (c) 2009-2010 Samsung Electronics Co., Ltd.
> + * =A0 =A0 =A0 =A0 =A0 =A0 http://www.samsung.com
> + *
> + * S5PV310 - Helper functions for setting up SDHCI device(s) GPIO (H=
SMMC)
> + *
> + * This program is free software; you can redistribute it and/or mod=
ify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> +*/
> +
> +#include <linux/kernel.h>
> +#include <linux/types.h>
> +#include <linux/interrupt.h>
> +#include <linux/platform_device.h>
> +#include <linux/io.h>
> +#include <linux/gpio.h>
> +#include <linux/mmc/host.h>
> +#include <linux/mmc/card.h>
> +
> +#include <mach/map.h>
> +
> +#include <plat/gpio-cfg.h>
> +#include <plat/regs-sdhci.h>
> +#include <plat/sdhci.h>
> +
> +#define S5PV310_GPK0DRV =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0(S5P_VA_GPIO2=
 + 0x4C)
> +#define S5PV310_GPK1DRV =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0(S5P_VA_GPIO2=
 + 0x6C)
> +#define S5PV310_GPK2DRV =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0(S5P_VA_GPIO2=
 + 0x8C)
> +#define S5PV310_GPK3DRV =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0(S5P_VA_GPIO2=
 + 0xAC)

As I know there are the driver strength function. please use it.
Related with VA_GPIOx I will comment it at different patch.
> +
> +void s5pv310_setup_sdhci0_cfg_gpio(struct platform_device *dev, int =
width)
> +{
> + =A0 =A0 =A0 unsigned int gpio;
> +
> + =A0 =A0 =A0 /* Set all the necessary GPK0[0:1] pins to special-func=
tion 2 */
> + =A0 =A0 =A0 for (gpio =3D S5PV310_GPK0(0); gpio < S5PV310_GPK0(2); =
gpio++) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 s3c_gpio_cfgpin(gpio, S3C_GPIO_SFN(2));
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 s3c_gpio_setpull(gpio, S3C_GPIO_PULL_NO=
NE);
> + =A0 =A0 =A0 }
> +
> + =A0 =A0 =A0 switch (width) {
> + =A0 =A0 =A0 case 8:
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 /* GPK1[3:6] special-funtion 3 */
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 for (gpio =3D S5PV310_GPK1(3); gpio <=3D=
 S5PV310_GPK1(6); gpio++) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 s3c_gpio_cfgpin(gpio, S=
3C_GPIO_SFN(3));
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 s3c_gpio_setpull(gpio, =
S3C_GPIO_PULL_NONE);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 s3c_gpio_setpull(gpio, =
S3C_GPIO_PULL_UP);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 }
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 __raw_writel(0x3FC0, S5PV310_GPK1DRV);

Related with HSMMC, Anndrew and Ben want to know which functionality
support exactly at s5p series.
E.g., Why SDCLK is required. you can find these at mmc mailing list. I
also want to know why these driver strength is required.

> + =A0 =A0 =A0 case 4:
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 /* GPK0[3:6] special-funtion 2 */
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 for (gpio =3D S5PV310_GPK0(3); gpio <=3D=
 S5PV310_GPK0(6); gpio++) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 s3c_gpio_cfgpin(gpio, S=
3C_GPIO_SFN(2));
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 s3c_gpio_setpull(gpio, =
S3C_GPIO_PULL_UP);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 }
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 __raw_writel(0x3FFF, S5PV310_GPK0DRV);
> + =A0 =A0 =A0 default:
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 break;
> + =A0 =A0 =A0 }
> +

Only set the CDn when internal only used
> + =A0 =A0 =A0 s3c_gpio_setpull(S5PV310_GPK0(2), S3C_GPIO_PULL_UP);
> + =A0 =A0 =A0 s3c_gpio_cfgpin(S5PV310_GPK0(2), S3C_GPIO_SFN(2));
> +}
> +
> +void s5pv310_setup_sdhci1_cfg_gpio(struct platform_device *dev, int =
width)
> +{
> + =A0 =A0 =A0 unsigned int gpio;
> +
> + =A0 =A0 =A0 /* Set all the necessary GPK1[0:1] pins to special-func=
tion 2 */
> + =A0 =A0 =A0 for (gpio =3D S5PV310_GPK1(0); gpio < S5PV310_GPK1(2); =
gpio++) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 s3c_gpio_cfgpin(gpio, S3C_GPIO_SFN(2));
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 s3c_gpio_setpull(gpio, S3C_GPIO_PULL_NO=
NE);
> + =A0 =A0 =A0 }
> +
> + =A0 =A0 =A0 /* Data pin GPK1[3:6] to special-function 2 */
> + =A0 =A0 =A0 for (gpio =3D S5PV310_GPK1(3); gpio <=3D S5PV310_GPK1(6=
); gpio++) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 s3c_gpio_cfgpin(gpio, S3C_GPIO_SFN(2));
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 s3c_gpio_setpull(gpio, S3C_GPIO_PULL_NO=
NE);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 s3c_gpio_setpull(gpio, S3C_GPIO_PULL_UP=
);
> + =A0 =A0 =A0 }
> + =A0 =A0 =A0 __raw_writel(0x3FFF, S5PV310_GPK1DRV);
> +
> + =A0 =A0 =A0 s3c_gpio_setpull(S5PV310_GPK1(2), S3C_GPIO_PULL_UP);
> + =A0 =A0 =A0 s3c_gpio_cfgpin(S5PV310_GPK1(2), S3C_GPIO_SFN(2));
ditto
> +}
> +
> +void s5pv310_setup_sdhci2_cfg_gpio(struct platform_device *dev, int =
width)
> +{
> + =A0 =A0 =A0 unsigned int gpio;
> +
> + =A0 =A0 =A0 /* Set all the necessary GPK2[0:1] pins to special-func=
tion 2 */
> + =A0 =A0 =A0 for (gpio =3D S5PV310_GPK2(0); gpio < S5PV310_GPK2(2); =
gpio++) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 s3c_gpio_cfgpin(gpio, S3C_GPIO_SFN(2));
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 s3c_gpio_setpull(gpio, S3C_GPIO_PULL_NO=
NE);
> + =A0 =A0 =A0 }
> +
> + =A0 =A0 =A0 switch (width) {
> + =A0 =A0 =A0 case 8:
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 /* Data pin GPK3[3:6] to special-functi=
on 3 */
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 for (gpio =3D S5PV310_GPK3(3); gpio <=3D=
 S5PV310_GPK3(6); gpio++) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 s3c_gpio_cfgpin(gpio, S=
3C_GPIO_SFN(3));
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 s3c_gpio_setpull(gpio, =
S3C_GPIO_PULL_UP);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 }
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 __raw_writel(0x3FC0, S5PV310_GPK3DRV);
> + =A0 =A0 =A0 case 4:
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 /* Data pin GPK2[3:6] to special-functi=
on 2 */
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 for (gpio =3D S5PV310_GPK2(3); gpio <=3D=
 S5PV310_GPK2(6); gpio++) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 s3c_gpio_cfgpin(gpio, S=
3C_GPIO_SFN(2));
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 s3c_gpio_setpull(gpio, =
S3C_GPIO_PULL_UP);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 }
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 __raw_writel(0x3FFF, S5PV310_GPK2DRV);
> + =A0 =A0 =A0 default:
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 break;
> + =A0 =A0 =A0 }
> +
> + =A0 =A0 =A0 s3c_gpio_setpull(S5PV310_GPK2(2), S3C_GPIO_PULL_UP);
> + =A0 =A0 =A0 s3c_gpio_cfgpin(S5PV310_GPK2(2), S3C_GPIO_SFN(2));
ditto
> +}
> +
> +void s5pv310_setup_sdhci3_cfg_gpio(struct platform_device *dev, int =
width)
> +{
> + =A0 =A0 =A0 unsigned int gpio;
> +
> + =A0 =A0 =A0 /* Set all the necessary GPK3[0:1] pins to special-func=
tion 2 */
> + =A0 =A0 =A0 for (gpio =3D S5PV310_GPK3(0); gpio < S5PV310_GPK3(2); =
gpio++) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 s3c_gpio_cfgpin(gpio, S3C_GPIO_SFN(2));
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 s3c_gpio_setpull(gpio, S3C_GPIO_PULL_NO=
NE);
> + =A0 =A0 =A0 }
> +
> + =A0 =A0 =A0 /* Data pin GPK3[3:6] to special-function 2 */
> + =A0 =A0 =A0 for (gpio =3D S5PV310_GPK3(3); gpio <=3D S5PV310_GPK3(6=
); gpio++) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 s3c_gpio_cfgpin(gpio, S3C_GPIO_SFN(2));
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 s3c_gpio_setpull(gpio, S3C_GPIO_PULL_UP=
);
> + =A0 =A0 =A0 }
> + =A0 =A0 =A0 __raw_writel(0x3FFF, S5PV310_GPK3DRV);
> +
> + =A0 =A0 =A0 s3c_gpio_setpull(S5PV310_GPK3(2), S3C_GPIO_PULL_UP);
> + =A0 =A0 =A0 s3c_gpio_cfgpin(S5PV310_GPK3(2), S3C_GPIO_SFN(2));
ditto
> +}
> diff --git a/arch/arm/mach-s5pv310/setup-sdhci.c b/arch/arm/mach-s5pv=
310/setup-sdhci.c
> new file mode 100644
> index 0000000..f7750ca
> --- /dev/null
> +++ b/arch/arm/mach-s5pv310/setup-sdhci.c
> @@ -0,0 +1,56 @@
> +/* linux/arch/arm/mach-s5pv310/setup-sdhci.c
> + *
> + * Copyright (c) 2009-2010 Samsung Electronics Co., Ltd.
> + * =A0 =A0 =A0 =A0 =A0 =A0 http://www.samsung.com
> + *
> + * S5PV310 - Helper functions for settign up SDHCI device(s) (HSMMC)
> + *
> + * This program is free software; you can redistribute it and/or mod=
ify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> +*/
> +
> +#include <linux/kernel.h>
> +#include <linux/types.h>
> +#include <linux/interrupt.h>
> +#include <linux/platform_device.h>
> +#include <linux/io.h>
> +
> +#include <linux/mmc/card.h>
> +#include <linux/mmc/host.h>
> +
> +#include <plat/regs-sdhci.h>
> +#include <plat/sdhci.h>
> +
> +/* clock sources for the mmc bus clock, order as for the ctrl2[5..4]=
 */
> +
> +char *s5pv310_hsmmc_clksrcs[4] =3D {
> + =A0 =A0 =A0 [2] =3D "sclk_mmc", =A0 =A0 =A0 /* mmc_bus */
> +};
> +
> +void s5pv310_setup_sdhci_cfg_card(struct platform_device *dev, void =
__iomem *r,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 str=
uct mmc_ios *ios, struct mmc_card *card)
> +{
> + =A0 =A0 =A0 u32 ctrl2, ctrl3;
> +
> + =A0 =A0 =A0 /* don't need to alter anything acording to card-type *=
/
> +
> + =A0 =A0 =A0 ctrl2 =3D __raw_readl(r + S3C_SDHCI_CONTROL2);
> + =A0 =A0 =A0 ctrl2 &=3D S3C_SDHCI_CTRL2_SELBASECLK_MASK;
> + =A0 =A0 =A0 ctrl2 |=3D (S3C64XX_SDHCI_CTRL2_ENSTAASYNCCLR |
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 S3C64XX_SDHCI_CTRL2_ENCMDCNFMSK |
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 S3C_SDHCI_CTRL2_ENFBCLKRX |
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 S3C_SDHCI_CTRL2_DFCNT_NONE |
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 S3C_SDHCI_CTRL2_ENCLKOUTHOLD);
> +
> + =A0 =A0 =A0 if (ios->clock < 25 * 1000000)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 ctrl3 =3D (S3C_SDHCI_CTRL3_FCSEL3 |
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0S3C_SDHCI_CTRL3_FCSE=
L2 |
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0S3C_SDHCI_CTRL3_FCSE=
L1 |
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0S3C_SDHCI_CTRL3_FCSE=
L0);
> + =A0 =A0 =A0 else
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 ctrl3 =3D (S3C_SDHCI_CTRL3_FCSEL1 | S3C=
_SDHCI_CTRL3_FCSEL0);
It's from s3c64xx code. Can you explain why these set is needed?
> +
> + =A0 =A0 =A0 __raw_writel(ctrl2, r + S3C_SDHCI_CONTROL2);
> + =A0 =A0 =A0 __raw_writel(ctrl3, r + S3C_SDHCI_CONTROL3);
> +}
> diff --git a/arch/arm/plat-samsung/include/plat/sdhci.h b/arch/arm/pl=
at-samsung/include/plat/sdhci.h
> index 30844c2..a804733 100644
> --- a/arch/arm/plat-samsung/include/plat/sdhci.h
> +++ b/arch/arm/plat-samsung/include/plat/sdhci.h
> @@ -110,6 +110,10 @@ extern void s5pv210_setup_sdhci0_cfg_gpio(struct=
 platform_device *, int w);
> =A0extern void s5pv210_setup_sdhci1_cfg_gpio(struct platform_device *=
, int w);
> =A0extern void s5pv210_setup_sdhci2_cfg_gpio(struct platform_device *=
, int w);
> =A0extern void s5pv210_setup_sdhci3_cfg_gpio(struct platform_device *=
, int w);
> +extern void s5pv310_setup_sdhci0_cfg_gpio(struct platform_device *, =
int w);
> +extern void s5pv310_setup_sdhci1_cfg_gpio(struct platform_device *, =
int w);
> +extern void s5pv310_setup_sdhci2_cfg_gpio(struct platform_device *, =
int w);
> +extern void s5pv310_setup_sdhci3_cfg_gpio(struct platform_device *, =
int w);
>
> =A0/* S3C64XX SDHCI setup */
>
> @@ -288,4 +292,58 @@ static inline void s5pv210_default_sdhci3(void) =
{ }
>
> =A0#endif /* CONFIG_S5PV210_SETUP_SDHCI */
>
> +/* S5PV310 SDHCI setup */
> +
> +#ifdef CONFIG_S5PV310_SETUP_SDHCI
> +extern char *s5pv310_hsmmc_clksrcs[4];
> +
> +extern void s5pv310_setup_sdhci_cfg_card(struct platform_device *dev=
,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0void __iomem *r,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0struct mmc_ios *ios,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0struct mmc_card *card);
> +
> +static inline void s5pv310_default_sdhci0(void)
> +{
> +#ifdef CONFIG_S3C_DEV_HSMMC
> + =A0 =A0 =A0 s3c_hsmmc0_def_platdata.clocks =3D s5pv310_hsmmc_clksrc=
s;
> + =A0 =A0 =A0 s3c_hsmmc0_def_platdata.cfg_gpio =3D s5pv310_setup_sdhc=
i0_cfg_gpio;
> + =A0 =A0 =A0 s3c_hsmmc0_def_platdata.cfg_card =3D s5pv310_setup_sdhc=
i_cfg_card;
> +#endif
> +}
> +
> +static inline void s5pv310_default_sdhci1(void)
> +{
> +#ifdef CONFIG_S3C_DEV_HSMMC1
> + =A0 =A0 =A0 s3c_hsmmc1_def_platdata.clocks =3D s5pv310_hsmmc_clksrc=
s;
> + =A0 =A0 =A0 s3c_hsmmc1_def_platdata.cfg_gpio =3D s5pv310_setup_sdhc=
i1_cfg_gpio;
> + =A0 =A0 =A0 s3c_hsmmc1_def_platdata.cfg_card =3D s5pv310_setup_sdhc=
i_cfg_card;
> +#endif
> +}
> +
> +static inline void s5pv310_default_sdhci2(void)
> +{
> +#ifdef CONFIG_S3C_DEV_HSMMC2
> + =A0 =A0 =A0 s3c_hsmmc2_def_platdata.clocks =3D s5pv310_hsmmc_clksrc=
s;
> + =A0 =A0 =A0 s3c_hsmmc2_def_platdata.cfg_gpio =3D s5pv310_setup_sdhc=
i2_cfg_gpio;
> + =A0 =A0 =A0 s3c_hsmmc2_def_platdata.cfg_card =3D s5pv310_setup_sdhc=
i_cfg_card;
> +#endif
> +}
> +
> +static inline void s5pv310_default_sdhci3(void)
> +{
> +#ifdef CONFIG_S3C_DEV_HSMMC3
> + =A0 =A0 =A0 s3c_hsmmc3_def_platdata.clocks =3D s5pv310_hsmmc_clksrc=
s;
> + =A0 =A0 =A0 s3c_hsmmc3_def_platdata.cfg_gpio =3D s5pv310_setup_sdhc=
i3_cfg_gpio;
> + =A0 =A0 =A0 s3c_hsmmc3_def_platdata.cfg_card =3D s5pv310_setup_sdhc=
i_cfg_card;
> +#endif
> +}
> +
> +#else
> +static inline void s5pv310_default_sdhci0(void) { }
> +static inline void s5pv310_default_sdhci1(void) { }
> +static inline void s5pv310_default_sdhci2(void) { }
> +static inline void s5pv310_default_sdhci3(void) { }
> +
> +#endif /* CONFIG_S5PV310_SETUP_SDHCI */
> +
> =A0#endif /* __PLAT_S3C_SDHCI_H */
> --
> 1.6.2.5
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsu=
ng-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
>
