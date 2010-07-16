From: Kyungmin Park <kmpark@infradead.org>
Subject: Re: [PATCH 2/3] ARM: S5PV210: Add support for I2C devices on SMDKV210
	and SMDKC110
Date: Fri, 16 Jul 2010 22:43:15 +0900
Message-ID: <AANLkTikK6qjh4yG5OX8g8Ih22SCg-2m3nUIfMDABHChf@mail.gmail.com>
References: <1279285999-27555-1-git-send-email-kgene.kim@samsung.com>
	<1279285999-27555-3-git-send-email-kgene.kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pv0-f174.google.com ([74.125.83.174]:54562 "EHLO
	mail-pv0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S965397Ab0GPNnR convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 16 Jul 2010 09:43:17 -0400
In-Reply-To: <1279285999-27555-3-git-send-email-kgene.kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-i2c@vger.kernel.org, ben-linux@fluff.org, Naveen Krishna Ch <ch.naveen@samsung.com>

On Fri, Jul 16, 2010 at 10:13 PM, Kukjin Kim <kgene.kim@samsung.com> wr=
ote:
> From: Naveen Krishna Ch <ch.naveen@samsung.com>
>
> This patch adds support I2C-0/1/2 devices to the SMDKV210/SMDKC110.
>
> Signed-off-by: Naveen Krishna Ch <ch.naveen@samsung.com>
> Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
> ---
> =A0arch/arm/mach-s5pv210/Kconfig =A0 =A0 =A0 =A0 | =A0 =A08 ++++++++
> =A0arch/arm/mach-s5pv210/mach-smdkc110.c | =A0 28 +++++++++++++++++++=
+++++++++
> =A0arch/arm/mach-s5pv210/mach-smdkv210.c | =A0 29 +++++++++++++++++++=
++++++++++
> =A03 files changed, 65 insertions(+), 0 deletions(-)
>
> diff --git a/arch/arm/mach-s5pv210/Kconfig b/arch/arm/mach-s5pv210/Kc=
onfig
> index 0761eac..2a996d9 100644
> --- a/arch/arm/mach-s5pv210/Kconfig
> +++ b/arch/arm/mach-s5pv210/Kconfig
> @@ -72,9 +72,13 @@ config MACH_SMDKV210
> =A0 =A0 =A0 =A0select CPU_S5PV210
> =A0 =A0 =A0 =A0select ARCH_SPARSEMEM_ENABLE
> =A0 =A0 =A0 =A0select SAMSUNG_DEV_ADC
> + =A0 =A0 =A0 select S3C_DEV_I2C1
> + =A0 =A0 =A0 select S3C_DEV_I2C2
> =A0 =A0 =A0 =A0select SAMSUNG_DEV_TS
> =A0 =A0 =A0 =A0select S3C_DEV_WDT
> =A0 =A0 =A0 =A0select HAVE_S3C2410_WATCHDOG
> + =A0 =A0 =A0 select S5PV210_SETUP_I2C1
> + =A0 =A0 =A0 select S5PV210_SETUP_I2C2
> =A0 =A0 =A0 =A0help
> =A0 =A0 =A0 =A0 =A0Machine support for Samsung SMDKV210
>
> @@ -82,8 +86,12 @@ config MACH_SMDKC110
> =A0 =A0 =A0 =A0bool "SMDKC110"
> =A0 =A0 =A0 =A0select CPU_S5PV210
> =A0 =A0 =A0 =A0select ARCH_SPARSEMEM_ENABLE
> + =A0 =A0 =A0 select S3C_DEV_I2C1
> + =A0 =A0 =A0 select S3C_DEV_I2C2
> =A0 =A0 =A0 =A0select S3C_DEV_WDT
> =A0 =A0 =A0 =A0select HAVE_S3C2410_WATCHDOG
> + =A0 =A0 =A0 select S5PV210_SETUP_I2C1
> + =A0 =A0 =A0 select S5PV210_SETUP_I2C2
> =A0 =A0 =A0 =A0help
> =A0 =A0 =A0 =A0 =A0Machine support for Samsung SMDKC110
> =A0 =A0 =A0 =A0 =A0S5PC110(MCP) is one of package option of S5PV210
> diff --git a/arch/arm/mach-s5pv210/mach-smdkc110.c b/arch/arm/mach-s5=
pv210/mach-smdkc110.c
> index 4c8903c..420f9a0 100644
> --- a/arch/arm/mach-s5pv210/mach-smdkc110.c
> +++ b/arch/arm/mach-s5pv210/mach-smdkc110.c
> @@ -12,6 +12,7 @@
> =A0#include <linux/types.h>
> =A0#include <linux/init.h>
> =A0#include <linux/serial_core.h>
> +#include <linux/i2c.h>
>
> =A0#include <asm/mach/arch.h>
> =A0#include <asm/mach/map.h>
> @@ -25,6 +26,7 @@
> =A0#include <plat/s5pv210.h>
> =A0#include <plat/devs.h>
> =A0#include <plat/cpu.h>
> +#include <plat/iic.h>
>
> =A0/* Following are default values for UCON, ULCON and UFCON UART reg=
isters */
> =A0#define S5PV210_UCON_DEFAULT =A0 (S3C2410_UCON_TXILEVEL | =A0 =A0 =
=A0 =A0\
> @@ -74,9 +76,24 @@ static struct s3c2410_uartcfg smdkv210_uartcfgs[] =
__initdata =3D {
> =A0static struct platform_device *smdkc110_devices[] __initdata =3D {
> =A0 =A0 =A0 =A0&s5pv210_device_iis0,
> =A0 =A0 =A0 =A0&s5pv210_device_ac97,
> + =A0 =A0 =A0 &s3c_device_i2c0,
> + =A0 =A0 =A0 &s3c_device_i2c1,
> + =A0 =A0 =A0 &s3c_device_i2c2,
> =A0 =A0 =A0 =A0&s3c_device_wdt,
> =A0};
>
> +static struct i2c_board_info smdkc100_i2c_devs0[] __initdata =3D {
> + =A0 =A0 =A0 { I2C_BOARD_INFO("24c08", 0x50), }, =A0 =A0 /* Samsung =
S524AD0XD1 */
> +};
> +

why smdkc100?

> +static struct i2c_board_info smdkc100_i2c_devs1[] __initdata =3D {
> + =A0 =A0 =A0 /* To Be Updated */
> +};
> +
Ditto

> +static struct i2c_board_info smdkc100_i2c_devs2[] __initdata =3D {
> + =A0 =A0 =A0 /* To Be Updated */
> +};
Ditto

Thank you,
Kyungmin Park
> +
> =A0static void __init smdkc110_map_io(void)
> =A0{
> =A0 =A0 =A0 =A0s5p_init_io(NULL, 0, S5P_VA_CHIPID);
> @@ -86,6 +103,17 @@ static void __init smdkc110_map_io(void)
>
> =A0static void __init smdkc110_machine_init(void)
> =A0{
> + =A0 =A0 =A0 /* I2C */
> + =A0 =A0 =A0 s3c_i2c0_set_platdata(NULL);
> + =A0 =A0 =A0 s3c_i2c1_set_platdata(NULL);
> + =A0 =A0 =A0 s3c_i2c2_set_platdata(NULL);
> + =A0 =A0 =A0 i2c_register_board_info(0, smdkc100_i2c_devs0,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 ARRAY_SIZE(smdkc100_i2c=
_devs0));
> + =A0 =A0 =A0 i2c_register_board_info(1, smdkc100_i2c_devs1,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 ARRAY_SIZE(smdkc100_i2c=
_devs1));
> + =A0 =A0 =A0 i2c_register_board_info(2, smdkc100_i2c_devs2,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 ARRAY_SIZE(smdkc100_i2c=
_devs2));
> +
> =A0 =A0 =A0 =A0platform_add_devices(smdkc110_devices, ARRAY_SIZE(smdk=
c110_devices));
> =A0}
>
> diff --git a/arch/arm/mach-s5pv210/mach-smdkv210.c b/arch/arm/mach-s5=
pv210/mach-smdkv210.c
> index 0d46279..765f47e 100644
> --- a/arch/arm/mach-s5pv210/mach-smdkv210.c
> +++ b/arch/arm/mach-s5pv210/mach-smdkv210.c
> @@ -10,6 +10,7 @@
>
> =A0#include <linux/kernel.h>
> =A0#include <linux/types.h>
> +#include <linux/i2c.h>
> =A0#include <linux/init.h>
> =A0#include <linux/serial_core.h>
>
> @@ -27,6 +28,7 @@
> =A0#include <plat/cpu.h>
> =A0#include <plat/adc.h>
> =A0#include <plat/ts.h>
> +#include <plat/iic.h>
>
> =A0/* Following are default values for UCON, ULCON and UFCON UART reg=
isters */
> =A0#define S5PV210_UCON_DEFAULT =A0 (S3C2410_UCON_TXILEVEL | =A0 =A0 =
=A0 =A0\
> @@ -77,10 +79,25 @@ static struct platform_device *smdkv210_devices[]=
 __initdata =3D {
> =A0 =A0 =A0 =A0&s5pv210_device_iis0,
> =A0 =A0 =A0 =A0&s5pv210_device_ac97,
> =A0 =A0 =A0 =A0&s3c_device_adc,
> + =A0 =A0 =A0 &s3c_device_i2c0,
> + =A0 =A0 =A0 &s3c_device_i2c1,
> + =A0 =A0 =A0 &s3c_device_i2c2,
> =A0 =A0 =A0 =A0&s3c_device_ts,
> =A0 =A0 =A0 =A0&s3c_device_wdt,
> =A0};
>
> +static struct i2c_board_info smdkv210_i2c_devs0[] __initdata =3D {
> + =A0 =A0 =A0 { I2C_BOARD_INFO("24c08", 0x50), }, =A0 =A0 /* Samsung =
S524AD0XD1 */
> +};
> +
> +static struct i2c_board_info smdkv210_i2c_devs1[] __initdata =3D {
> + =A0 =A0 =A0 /* To Be Updated */
> +};
> +
> +static struct i2c_board_info smdkv210_i2c_devs2[] __initdata =3D {
> + =A0 =A0 =A0 /* To Be Updated */
> +};
> +
> =A0static struct s3c2410_ts_mach_info s3c_ts_platform __initdata =3D =
{
> =A0 =A0 =A0 =A0.delay =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=3D 10000,
> =A0 =A0 =A0 =A0.presc =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=3D 49,
> @@ -97,6 +114,18 @@ static void __init smdkv210_map_io(void)
> =A0static void __init smdkv210_machine_init(void)
> =A0{
> =A0 =A0 =A0 =A0s3c24xx_ts_set_platdata(&s3c_ts_platform);
> +
> + =A0 =A0 =A0 /* I2C */
> + =A0 =A0 =A0 s3c_i2c0_set_platdata(NULL);
> + =A0 =A0 =A0 s3c_i2c1_set_platdata(NULL);
> + =A0 =A0 =A0 s3c_i2c2_set_platdata(NULL);
> + =A0 =A0 =A0 i2c_register_board_info(0, smdkv210_i2c_devs0,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 ARRAY_SIZE(smdkv210_i2c=
_devs0));
> + =A0 =A0 =A0 i2c_register_board_info(1, smdkv210_i2c_devs1,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 ARRAY_SIZE(smdkv210_i2c=
_devs1));
> + =A0 =A0 =A0 i2c_register_board_info(2, smdkv210_i2c_devs2,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 ARRAY_SIZE(smdkv210_i2c=
_devs2));
> +
> =A0 =A0 =A0 =A0platform_add_devices(smdkv210_devices, ARRAY_SIZE(smdk=
v210_devices));
> =A0}
>
> --
> 1.6.2.5
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsu=
ng-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
>
