From: Tomasz Figa <t.figa@samsung.com>
Subject: Re: [PATCH v3 5/5] ARM: S3C24XX: Convert s3c2416 and s3c2443 to common
 clock framework
Date: Mon, 09 Dec 2013 18:19:16 +0100
Message-ID: <4563504.qD7ztRvaeD@amdc1227>
References: <201312031619.58062.heiko@sntech.de>
 <201312031624.11442.heiko@sntech.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:31672 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752856Ab3LIRT3 convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 9 Dec 2013 12:19:29 -0500
Received: from eucpsbgm2.samsung.com (unknown [203.254.199.245])
 by mailout3.w1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MXJ005NJUSEMT50@mailout3.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 09 Dec 2013 17:19:27 +0000 (GMT)
In-reply-to: <201312031624.11442.heiko@sntech.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
Cc: Kukjin Kim <kgene.kim@samsung.com>, mturquette@linaro.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Thomas Abraham <thomas.abraham@linaro.org>

Hi Heiko,

On Tuesday 03 of December 2013 16:24:11 Heiko St=FCbner wrote:
> This converts the mentioned platforms to use the newly introduced dri=
ver
> for the common clock framework for them.
>=20
> With this the whole legacy clock structure can go away too.
>=20
> Signed-off-by: Heiko Stuebner <heiko@sntech.de>
> ---
>  arch/arm/boot/dts/s3c2416-smdk2416.dts  |    9 +
>  arch/arm/boot/dts/s3c2416.dtsi          |   48 +++
>  arch/arm/mach-s3c24xx/Kconfig           |   14 +-
>  arch/arm/mach-s3c24xx/Makefile          |    5 +-
>  arch/arm/mach-s3c24xx/clock-s3c2416.c   |  171 --------
>  arch/arm/mach-s3c24xx/clock-s3c2443.c   |  212 ----------
>  arch/arm/mach-s3c24xx/common-s3c2443.c  |  675 ---------------------=
----------
>  arch/arm/mach-s3c24xx/common.c          |   16 +-
>  arch/arm/mach-s3c24xx/common.h          |    6 +
>  arch/arm/mach-s3c24xx/mach-s3c2416-dt.c |   39 +-
>  arch/arm/mach-s3c24xx/mach-smdk2416.c   |    9 +-
>  arch/arm/mach-s3c24xx/mach-smdk2443.c   |    9 +-
>  12 files changed, 98 insertions(+), 1115 deletions(-)
>  delete mode 100644 arch/arm/mach-s3c24xx/clock-s3c2416.c
>  delete mode 100644 arch/arm/mach-s3c24xx/clock-s3c2443.c
>  delete mode 100644 arch/arm/mach-s3c24xx/common-s3c2443.c

I would split this patch into one adding necessary definitions to DTS
files, then one migrating the platform to CCF. Until the driver gets
selected by respective Kconfig options, the entries in device tree shou=
ld
not have any impact on the system, but you get rid of one patch doing
changes across two different trees.

Ideally this should be also done in one more step, allowing both clock
frameworks to coexist first and then removing the legacy code as the la=
st
step to allow the new code to get more testing. However for this platfo=
rm,
which isn't really very active nowadays, it might be fine to skip this.

> diff --git a/arch/arm/boot/dts/s3c2416-smdk2416.dts b/arch/arm/boot/d=
ts/s3c2416-smdk2416.dts
> index 59594cf..fefb699 100644
> --- a/arch/arm/boot/dts/s3c2416-smdk2416.dts
> +++ b/arch/arm/boot/dts/s3c2416-smdk2416.dts
> @@ -19,6 +19,15 @@
>  		reg =3D  <0x30000000 0x4000000>;
>  	};
> =20
> +	clocks {
> +		xti: xti {
> +			compatible =3D "fixed-clock";
> +			clock-frequency =3D <12000000>;
> +			clock-output-names =3D "xti";
> +			#clock-cells =3D <0>;
> +		};
> +	};
> +
>  	serial@50000000 {
>  		status =3D "okay";
>  		pinctrl-names =3D "default";
> diff --git a/arch/arm/boot/dts/s3c2416.dtsi b/arch/arm/boot/dts/s3c24=
16.dtsi
> index e6555bd..4bde5a2 100644
> --- a/arch/arm/boot/dts/s3c2416.dtsi
> +++ b/arch/arm/boot/dts/s3c2416.dtsi
> @@ -8,6 +8,7 @@
>   * published by the Free Software Foundation.
>   */
> =20
> +#include <dt-bindings/clock/samsung,s3c2443-clock.h>
>  #include "s3c24xx.dtsi"
>  #include "s3c2416-pinctrl.dtsi"
> =20
> @@ -28,26 +29,59 @@
>  		compatible =3D "samsung,s3c2416-irq";
>  	};
> =20
> +	clocks {

Don't you need compatible =3D "simple-bus" here for the subnodes to be
instantiated?

> +		#address-cells =3D <1>;
> +		#size-cells =3D <1>;
> +		ranges;
> +
> +		clocks: clock-controller@0x4c000000 {

Why is this in a subnode? Clock controller is a part of the SoC, so IMH=
O
it should be on the same level as other peripherals.

> +			compatible =3D "samsung,s3c2416-clock";
> +			reg =3D <0x4c000000 0x40>;
> +			#clock-cells =3D <1>;
> +		};
> +	};
> +
[snip]
> diff --git a/arch/arm/mach-s3c24xx/Kconfig b/arch/arm/mach-s3c24xx/Kc=
onfig
> index 2eeeb55..f2fe2ad 100644
> --- a/arch/arm/mach-s3c24xx/Kconfig
> +++ b/arch/arm/mach-s3c24xx/Kconfig
> @@ -50,9 +50,9 @@ config CPU_S3C2416
>  	select CPU_ARM926T
>  	select CPU_LLSERIAL_S3C2440
>  	select S3C2416_PM if PM
> -	select S3C2443_COMMON
>  	select S3C2443_DMA if S3C24XX_DMA
> -	select SAMSUNG_CLKSRC
> +	select COMMON_CLK
> +	select S3C2443_COMMON_CLK

Please keep selected symbols sorted alphabetically.

>  	help
>  	  Support for the S3C2416 SoC from the S3C24XX line
> =20
> @@ -85,9 +85,9 @@ config CPU_S3C2443
>  	bool "SAMSUNG S3C2443"
>  	select CPU_ARM920T
>  	select CPU_LLSERIAL_S3C2440
> -	select S3C2443_COMMON
>  	select S3C2443_DMA if S3C24XX_DMA
> -	select SAMSUNG_CLKSRC
> +	select COMMON_CLK
> +	select S3C2443_COMMON_CLK

Ditto.

>  	help
>  	  Support for the S3C2443 SoC from the S3C24XX line
> =20
> @@ -664,12 +664,6 @@ endif	# CPU_S3C2442
> =20
>  if CPU_S3C2443 || CPU_S3C2416
> =20
> -config S3C2443_COMMON
> -	bool
> -	help
> -	  Common code for the S3C2443 and similar processors, which include=
s
> -	  the S3C2416 and S3C2450.
> -
>  config S3C2443_COMMON_CLK
>  	bool
>  	help
[snip]
> diff --git a/arch/arm/mach-s3c24xx/common.c b/arch/arm/mach-s3c24xx/c=
ommon.c
> index 4adaa4b..d87e432 100644
> --- a/arch/arm/mach-s3c24xx/common.c
> +++ b/arch/arm/mach-s3c24xx/common.c
> @@ -145,7 +145,6 @@ static struct cpu_table cpu_ids[] __initdata =3D =
{
>  		.idcode		=3D 0x32450003,
>  		.idmask		=3D 0xffffffff,
>  		.map_io		=3D s3c2416_map_io,
> -		.init_clocks	=3D s3c2416_init_clocks,
>  		.init_uarts	=3D s3c2416_init_uarts,
>  		.init		=3D s3c2416_init,
>  		.name		=3D name_s3c2416,
> @@ -154,7 +153,6 @@ static struct cpu_table cpu_ids[] __initdata =3D =
{
>  		.idcode		=3D 0x32443001,
>  		.idmask		=3D 0xffffffff,
>  		.map_io		=3D s3c2443_map_io,
> -		.init_clocks	=3D s3c2443_init_clocks,
>  		.init_uarts	=3D s3c2443_init_uarts,
>  		.init		=3D s3c2443_init,
>  		.name		=3D name_s3c2443,
> @@ -535,3 +533,17 @@ struct platform_device s3c2443_device_dma =3D {
>  	},
>  };
>  #endif
> +
> +#if defined(CONFIG_COMMON_CLK) && defined(CONFIG_CPU_S3C2416)

Isn't CONFIG_COMMON_CLK be selected by CPU_S3C2416?

> +void __init s3c2416_init_clocks(int xtal)
> +{
> +	s3c2443_common_clk_init(NULL, xtal, 0, S3C24XX_VA_CLKPWR);
> +}
> +#endif
> +
> +#if defined(CONFIG_COMMON_CLK) && defined(CONFIG_CPU_S3C2443)

Ditto.

> +void __init s3c2443_init_clocks(int xtal)
> +{
> +	s3c2443_common_clk_init(NULL, xtal, 1, S3C24XX_VA_CLKPWR);
> +}
> +#endif
> diff --git a/arch/arm/mach-s3c24xx/common.h b/arch/arm/mach-s3c24xx/c=
ommon.h
> index e46c104..d7323f1 100644
> --- a/arch/arm/mach-s3c24xx/common.h
> +++ b/arch/arm/mach-s3c24xx/common.h
> @@ -114,4 +114,10 @@ extern struct platform_device s3c2412_device_dma=
;
>  extern struct platform_device s3c2440_device_dma;
>  extern struct platform_device s3c2443_device_dma;
> =20
> +#ifdef CONFIG_S3C2443_COMMON_CLK
> +void __init s3c2443_common_clk_init(struct device_node *np, unsigned=
 long xti_f,
> +				    int current_soc,
> +				    void __iomem *reg_base);
> +#endif
> +
>  #endif /* __ARCH_ARM_MACH_S3C24XX_COMMON_H */
> diff --git a/arch/arm/mach-s3c24xx/mach-s3c2416-dt.c b/arch/arm/mach-=
s3c24xx/mach-s3c2416-dt.c
> index f50454a..0a86953 100644
> --- a/arch/arm/mach-s3c24xx/mach-s3c2416-dt.c
> +++ b/arch/arm/mach-s3c24xx/mach-s3c2416-dt.c
> @@ -18,59 +18,23 @@
>  #include <linux/clocksource.h>
>  #include <linux/irqchip.h>
>  #include <linux/of_platform.h>
> -#include <linux/serial_core.h>
> =20
>  #include <asm/mach/arch.h>
>  #include <mach/map.h>
> =20
>  #include <plat/cpu.h>
>  #include <plat/pm.h>
> -#include <plat/regs-serial.h>
> =20
>  #include "common.h"
> =20
> -/*
> - * The following lookup table is used to override device names when =
devices
> - * are registered from device tree. This is temporarily added to ena=
ble
> - * device tree support addition for the S3C2416 architecture.
> - *
> - * For drivers that require platform data to be provided from the ma=
chine
> - * file, a platform data pointer can also be supplied along with the
> - * devices names. Usually, the platform data elements that cannot be=
 parsed
> - * from the device tree by the drivers (example: function pointers) =
are
> - * supplied. But it should be noted that this is a temporary mechani=
sm and
> - * at some point, the drivers should be capable of parsing all the p=
latform
> - * data from the device tree.
> - */
> -static const struct of_dev_auxdata s3c2416_auxdata_lookup[] __initco=
nst =3D {
> -	OF_DEV_AUXDATA("samsung,s3c2440-uart", S3C24XX_PA_UART,
> -				"s3c2440-uart.0", NULL),
> -	OF_DEV_AUXDATA("samsung,s3c2440-uart", S3C24XX_PA_UART + 0x4000,
> -				"s3c2440-uart.1", NULL),
> -	OF_DEV_AUXDATA("samsung,s3c2440-uart", S3C24XX_PA_UART + 0x8000,
> -				"s3c2440-uart.2", NULL),
> -	OF_DEV_AUXDATA("samsung,s3c2440-uart", S3C24XX_PA_UART + 0xC000,
> -				"s3c2440-uart.3", NULL),
> -	OF_DEV_AUXDATA("samsung,s3c6410-sdhci", S3C_PA_HSMMC0,
> -				"s3c-sdhci.0", NULL),
> -	OF_DEV_AUXDATA("samsung,s3c6410-sdhci", S3C_PA_HSMMC1,
> -				"s3c-sdhci.1", NULL),
> -	OF_DEV_AUXDATA("samsung,s3c2440-i2c", S3C_PA_IIC,
> -				"s3c2440-i2c.0", NULL),
> -	{},
> -};
> -
>  static void __init s3c2416_dt_map_io(void)
>  {
>  	s3c24xx_init_io(NULL, 0);
> -	s3c24xx_init_clocks(12000000);
>  }
> =20
>  static void __init s3c2416_dt_machine_init(void)
>  {
> -	of_platform_populate(NULL, of_default_bus_match_table,
> -				s3c2416_auxdata_lookup, NULL);
> -
> +	of_platform_populate(NULL, of_default_bus_match_table, NULL, NULL);
>  	s3c_pm_init();
>  }
> =20
> @@ -86,6 +50,5 @@ DT_MACHINE_START(S3C2416_DT, "Samsung S3C2416 (Flat=
tened Device Tree)")
>  	.map_io		=3D s3c2416_dt_map_io,
>  	.init_irq	=3D irqchip_init,
>  	.init_machine	=3D s3c2416_dt_machine_init,
> -	 .init_time	=3D clocksource_of_init,

Should it really be a part of this patch?

Otherwise the patch looks fine.

Best regards,
Tomasz
