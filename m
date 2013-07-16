From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH v2 6/6] ARM: S3C24XX: Convert s3c2416 and s3c2443 to common
 clock framework
Date: Tue, 16 Jul 2013 16:09:24 +0900
Message-ID: <02cf01ce81f3$6777e5f0$3667b1d0$%kim@samsung.com>
References: <201307100057.06061.heiko@sntech.de>
 <201307100100.28992.heiko@sntech.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:24787 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751517Ab3GPHJ1 convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 16 Jul 2013 03:09:27 -0400
Received: from epcpsbgr5.samsung.com
 (u145.gpu120.samsung.co.kr [203.254.230.145])
 by mailout1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MQ000ANLP7PAUO0@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 16 Jul 2013 16:09:26 +0900 (KST)
In-reply-to: <201307100100.28992.heiko@sntech.de>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: =?utf-8?Q?'Heiko_St=C3=BCbner'?= <heiko@sntech.de>
Cc: mturquette@linaro.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 'Thomas Abraham' <thomas.abraham@linaro.org>, t.figa@samsung.com, 'Russell King' <linux@arm.linux.org.uk>, 'Kukjin Kim' <kgene@kernel.org>

Heiko St=C3=BCbner wrote:
>=20
> This converts the mentioned platforms to use the newly introduced dri=
ver
> for the common clock framework for them.
>=20
> With this the whole legacy clock structure can go away too.
>=20
> Signed-off-by: Heiko Stuebner <heiko@sntech.de>
> ---
>  arch/arm/boot/dts/s3c2416-smdk2416.dts  |    7 +
>  arch/arm/boot/dts/s3c2416.dtsi          |   42 ++
>  arch/arm/mach-s3c24xx/Kconfig           |   14 +-
>  arch/arm/mach-s3c24xx/Makefile          |    5 +-
>  arch/arm/mach-s3c24xx/clock-s3c2416.c   |  171 --------
>  arch/arm/mach-s3c24xx/clock-s3c2443.c   |  212 ----------
>  arch/arm/mach-s3c24xx/common-s3c2443.c  |  677 ---------------------=
------
> ----

In this case, to use '-D' in format-patch would be better :-)

>  arch/arm/mach-s3c24xx/common.c          |   18 +-
>  arch/arm/mach-s3c24xx/common.h          |    8 +
>  arch/arm/mach-s3c24xx/mach-s3c2416-dt.c |   45 +-
>  arch/arm/mach-s3c24xx/mach-smdk2416.c   |    9 +-
>  arch/arm/mach-s3c24xx/mach-smdk2443.c   |    9 +-
>  12 files changed, 102 insertions(+), 1115 deletions(-)
>  delete mode 100644 arch/arm/mach-s3c24xx/clock-s3c2416.c
>  delete mode 100644 arch/arm/mach-s3c24xx/clock-s3c2443.c
>  delete mode 100644 arch/arm/mach-s3c24xx/common-s3c2443.c
>=20
> diff --git a/arch/arm/boot/dts/s3c2416-smdk2416.dts
> b/arch/arm/boot/dts/s3c2416-smdk2416.dts
> index 59594cf..9caeb89 100644
> --- a/arch/arm/boot/dts/s3c2416-smdk2416.dts
> +++ b/arch/arm/boot/dts/s3c2416-smdk2416.dts
> @@ -19,6 +19,13 @@
>  		reg =3D  <0x30000000 0x4000000>;
>  	};
>=20
> +	fixed-rate-clocks {
> +		xti {
> +			compatible =3D "samsung,clock-xti";
> +			clock-frequency =3D <12000000>;
> +		};
> +	};
> +
>  	serial@50000000 {
>  		status =3D "okay";
>  		pinctrl-names =3D "default";
> diff --git a/arch/arm/boot/dts/s3c2416.dtsi
> b/arch/arm/boot/dts/s3c2416.dtsi
> index e6555bd..c19d99c 100644
> --- a/arch/arm/boot/dts/s3c2416.dtsi
> +++ b/arch/arm/boot/dts/s3c2416.dtsi
> @@ -8,6 +8,7 @@
>   * published by the Free Software Foundation.
>   */
>=20
> +#include <dt-bindings/clock/samsung,s3c2443-clock.h>
>  #include "s3c24xx.dtsi"
>  #include "s3c2416-pinctrl.dtsi"
>=20
> @@ -28,26 +29,53 @@
>  		compatible =3D "samsung,s3c2416-irq";
>  	};
>=20
> +	clocks: clock-controller@0x4c000000 {

+	clock: clock-controller@0x4c000000 {

for keeping same format for Samsung stuff...

> +		compatible =3D "samsung,s3c2416-clock";
> +		reg =3D <0x4c000000 0x40>;
> +		#clock-cells =3D <1>;
> +	};
> +
>  	pinctrl@56000000 {
>  		compatible =3D "samsung,s3c2416-pinctrl";
>  	};
>=20
> +	timer@51000000 {
> +		clocks =3D <&clocks PCLK_PWM>;

+		clocks =3D <&clock PCLK_PWM>;

And I'm not sure using definition PCLK_PWM is better here...

> +		clock-names =3D "timers";
> +	};
> +
>  	serial@50000000 {
>  		compatible =3D "samsung,s3c2440-uart";
> +		clock-names =3D "uart", "clk_uart_baud2",
> +				"clk_uart_baud3";
> +		clocks =3D <&clocks PCLK_UART0>, <&clocks PCLK_UART0>,
> +				<&clocks SCLK_UART>;

Please use same ordering...for 'clocks' and 'clock-names'.
See above the timers...'clocks' then 'clock-names'...

>  	};
>=20
>  	serial@50004000 {
>  		compatible =3D "samsung,s3c2440-uart";
> +		clock-names =3D "uart", "clk_uart_baud2",
> +				"clk_uart_baud3";
> +		clocks =3D <&clocks PCLK_UART1>, <&clocks PCLK_UART1>,
> +				<&clocks SCLK_UART>;

Same as above.

>  	};
>=20
>  	serial@50008000 {
>  		compatible =3D "samsung,s3c2440-uart";
> +		clock-names =3D "uart", "clk_uart_baud2",
> +				"clk_uart_baud3";
> +		clocks =3D <&clocks PCLK_UART2>, <&clocks PCLK_UART2>,
> +				<&clocks SCLK_UART>;

Same as above.

>  	};
>=20
>  	serial@5000C000 {
>  		compatible =3D "samsung,s3c2440-uart";
>  		reg =3D <0x5000C000 0x4000>;
>  		interrupts =3D <1 18 24 4>, <1 18 25 4>;
> +		clock-names =3D "uart", "clk_uart_baud2",
> +				"clk_uart_baud3";
> +		clocks =3D <&clocks PCLK_UART3>, <&clocks PCLK_UART3>,
> +				<&clocks SCLK_UART>;

Same as above.

>  		status =3D "disabled";
>  	};
>=20
> @@ -55,6 +83,10 @@
>  		compatible =3D "samsung,s3c6410-sdhci";
>  		reg =3D <0x4AC00000 0x100>;
>  		interrupts =3D <0 0 21 3>;
> +		clock-names =3D "hsmmc", "mmc_busclk.0",
> +				"mmc_busclk.2";
> +		clocks =3D <&clocks HCLK_HSMMC0>, <&clocks HCLK_HSMMC0>,
> +				<&clocks MUX_HSMMC0>;

Same.

>  		status =3D "disabled";
>  	};
>=20
> @@ -62,18 +94,28 @@
>  		compatible =3D "samsung,s3c6410-sdhci";
>  		reg =3D <0x4A800000 0x100>;
>  		interrupts =3D <0 0 20 3>;
> +		clock-names =3D "hsmmc", "mmc_busclk.0",
> +				"mmc_busclk.2";
> +		clocks =3D <&clocks HCLK_HSMMC1>, <&clocks HCLK_HSMMC1>,
> +				<&clocks MUX_HSMMC1>;

Same.

>  		status =3D "disabled";
>  	};
>=20
>  	watchdog@53000000 {
>  		interrupts =3D <1 9 27 3>;
> +		clocks =3D <&clocks PCLK_WDT>;
> +		clock-names =3D "watchdog";
>  	};
>=20
>  	rtc@57000000 {
>  		compatible =3D "samsung,s3c2416-rtc";
> +		clocks =3D <&clocks PCLK_RTC>;
> +		clock-names =3D "rtc";
>  	};
>=20
>  	i2c@54000000 {
>  		compatible =3D "samsung,s3c2440-i2c";
> +		clocks =3D <&clocks PCLK_I2C0>;
> +		clock-names =3D "i2c";
>  	};
>  };
> diff --git a/arch/arm/mach-s3c24xx/Kconfig b/arch/arm/mach-s3c24xx/Kc=
onfig
> index b8ec0ec..37cbe5f 100644
> --- a/arch/arm/mach-s3c24xx/Kconfig
> +++ b/arch/arm/mach-s3c24xx/Kconfig
> @@ -49,9 +49,9 @@ config CPU_S3C2416
>  	select CPU_ARM926T
>  	select CPU_LLSERIAL_S3C2440
>  	select S3C2416_PM if PM
> -	select S3C2443_COMMON
>  	select S3C2443_DMA if S3C24XX_DMA
> -	select SAMSUNG_CLKSRC
> +	select COMMON_CLK
> +	select COMMON_CLK_S3C2443

Please put them in alphabetical ordering...

>  	help
>  	  Support for the S3C2416 SoC from the S3C24XX line
>=20
> @@ -83,9 +83,9 @@ config CPU_S3C2443
>  	bool "SAMSUNG S3C2443"
>  	select CPU_ARM920T
>  	select CPU_LLSERIAL_S3C2440
> -	select S3C2443_COMMON
>  	select S3C2443_DMA if S3C24XX_DMA
> -	select SAMSUNG_CLKSRC
> +	select COMMON_CLK
> +	select COMMON_CLK_S3C2443

Same as above.

>  	help
>  	  Support for the S3C2443 SoC from the S3C24XX line
>=20
> @@ -663,12 +663,6 @@ endif	# CPU_S3C2442
>=20
>  if CPU_S3C2443 || CPU_S3C2416
>=20
> -config S3C2443_COMMON
> -	bool
> -	help
> -	  Common code for the S3C2443 and similar processors, which
> includes
> -	  the S3C2416 and S3C2450.
> -
>  config S3C2443_DMA
>  	bool
>  	help

[...]

Thanks,
- Kukjin
