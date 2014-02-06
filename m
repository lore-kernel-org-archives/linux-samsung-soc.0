From: Mike Turquette <mturquette@linaro.org>
Subject: Re: [PATCH 08/12] clk: samsung: add clock controller driver for s3c2410,
 s3c2440 and s3c2442
Date: Thu, 06 Feb 2014 06:12:42 -0800
Message-ID: <20140206141242.22158.7591@quantum>
References: <201312131356.40755.heiko@sntech.de> <201312131401.52029.heiko@sntech.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f50.google.com ([209.85.220.50]:36270 "EHLO
	mail-pa0-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751352AbaBFOMs convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 6 Feb 2014 09:12:48 -0500
Received: by mail-pa0-f50.google.com with SMTP id kp14so1726675pab.23
        for <linux-samsung-soc@vger.kernel.org>; Thu, 06 Feb 2014 06:12:48 -0800 (PST)
In-Reply-To: <201312131401.52029.heiko@sntech.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, Kukjin Kim <kgene.kim@samsung.com>
Cc: t.figa@samsung.com, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

Quoting Heiko St=C3=BCbner (2013-12-13 05:01:51)
> This driver can handle the clock controllers of the socs mentioned ab=
ove,
> as they share a common clock tree with only small differences.
>=20
> The clock structure is built according to the manuals of the included
> SoCs and might include changes in comparison to the previous clock
> structure.
>=20
> As pll-rate-tables only the 12mhz variants are currently included.
> The original code was wrongly checking for 169mhz xti values [a 0 to =
much
> at the end], so the original 16mhz pll table would have never been
> included and its values are so obscure that I have no possibility to
> at least check their sane-ness. When using the formula from the manua=
l
> the resulting frequency is near the table value but still slightly of=
f.
>=20
> Signed-off-by: Heiko Stuebner <heiko@sntech.de>

Acked-by: Mike Turquette <mturquette@linaro.org>

> ---
>  drivers/clk/samsung/Makefile                      |    1 +
>  drivers/clk/samsung/clk-s3c2410.c                 |  428 +++++++++++=
++++++++++
>  include/dt-bindings/clock/samsung,s3c2410-clock.h |   64 +++
>  3 files changed, 493 insertions(+)
>  create mode 100644 drivers/clk/samsung/clk-s3c2410.c
>  create mode 100644 include/dt-bindings/clock/samsung,s3c2410-clock.h
>=20
> diff --git a/drivers/clk/samsung/Makefile b/drivers/clk/samsung/Makef=
ile
> index 568683c..60748b2 100644
> --- a/drivers/clk/samsung/Makefile
> +++ b/drivers/clk/samsung/Makefile
> @@ -8,6 +8,7 @@ obj-$(CONFIG_SOC_EXYNOS5250)    +=3D clk-exynos5250.o
>  obj-$(CONFIG_SOC_EXYNOS5420)   +=3D clk-exynos5420.o
>  obj-$(CONFIG_SOC_EXYNOS5440)   +=3D clk-exynos5440.o
>  obj-$(CONFIG_ARCH_EXYNOS)      +=3D clk-exynos-audss.o
> +obj-$(CONFIG_S3C2410_COMMON_CLK)+=3D clk-s3c2410.o
>  obj-$(CONFIG_S3C2410_COMMON_DCLK)+=3D clk-s3c2410-dclk.o
>  obj-$(CONFIG_S3C2443_COMMON_CLK)+=3D clk-s3c2443.o
>  obj-$(CONFIG_ARCH_S3C64XX)     +=3D clk-s3c64xx.o
> diff --git a/drivers/clk/samsung/clk-s3c2410.c b/drivers/clk/samsung/=
clk-s3c2410.c
> new file mode 100644
> index 0000000..8358cad
> --- /dev/null
> +++ b/drivers/clk/samsung/clk-s3c2410.c
> @@ -0,0 +1,428 @@
> +/*
> + * Copyright (c) 2013 Heiko Stuebner <heiko@sntech.de>
> + *
> + * This program is free software; you can redistribute it and/or mod=
ify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> + *
> + * Common Clock Framework support for S3C2410 and following SoCs.
> + */
> +
> +#include <linux/clk.h>
> +#include <linux/clkdev.h>
> +#include <linux/clk-provider.h>
> +#include <linux/of.h>
> +#include <linux/of_address.h>
> +
> +#include <dt-bindings/clock/samsung,s3c2410-clock.h>
> +
> +#include "clk.h"
> +#include "clk-pll.h"
> +
> +#define LOCKTIME       0x00
> +#define MPLLCON                0x04
> +#define UPLLCON                0x08
> +#define CLKCON         0x0c
> +#define CLKSLOW                0x10
> +#define CLKDIVN                0x14
> +#define CAMDIVN                0x18
> +
> +/* the soc types */
> +enum supported_socs {
> +       S3C2410,
> +       S3C2440,
> +       S3C2442,
> +};
> +
> +/* list of PLLs to be registered */
> +enum s3c2410_plls {
> +       mpll, upll,
> +};
> +
> +/*
> + * list of controller registers to be saved and restored during a
> + * suspend/resume cycle.
> + */
> +static unsigned long s3c2410_clk_regs[] __initdata =3D {
> +       LOCKTIME,
> +       MPLLCON,
> +       UPLLCON,
> +       CLKCON,
> +       CLKSLOW,
> +       CLKDIVN,
> +       CAMDIVN,
> +};
> +
> +PNAME(fclk_p) =3D { "mpll", "div_slow" };
> +
> +struct samsung_mux_clock s3c2410_common_muxes[] __initdata =3D {
> +       MUX(FCLK, "fclk", fclk_p, CLKSLOW, 4, 1),
> +};
> +
> +static struct clk_div_table divslow_d[] =3D {
> +       { .val =3D 0, .div =3D 1 },
> +       { .val =3D 1, .div =3D 2 },
> +       { .val =3D 2, .div =3D 4 },
> +       { .val =3D 3, .div =3D 6 },
> +       { .val =3D 4, .div =3D 8 },
> +       { .val =3D 5, .div =3D 10 },
> +       { .val =3D 6, .div =3D 12 },
> +       { .val =3D 7, .div =3D 14 },
> +       { .div =3D 0 },
> +};
> +
> +struct samsung_div_clock s3c2410_common_dividers[] __initdata =3D {
> +       DIV_T(0, "div_slow", "xti", CLKSLOW, 0, 3, divslow_d),
> +       DIV(PCLK, "pclk", "hclk", CLKDIVN, 0, 1),
> +};
> +
> +struct samsung_gate_clock s3c2410_common_gates[] __initdata =3D {
> +       GATE(PCLK_SPI, "spi", "pclk", CLKCON, 18, 0, 0),
> +       GATE(PCLK_I2S, "i2s", "pclk", CLKCON, 17, 0, 0),
> +       GATE(PCLK_I2C, "i2c", "pclk", CLKCON, 16, 0, 0),
> +       GATE(PCLK_ADC, "adc", "pclk", CLKCON, 15, 0, 0),
> +       GATE(PCLK_RTC, "rtc", "pclk", CLKCON, 14, 0, 0),
> +       GATE(PCLK_GPIO, "gpio", "pclk", CLKCON, 13, CLK_IGNORE_UNUSED=
, 0),
> +       GATE(PCLK_UART2, "uart2", "pclk", CLKCON, 12, 0, 0),
> +       GATE(PCLK_UART1, "uart1", "pclk", CLKCON, 11, 0, 0),
> +       GATE(PCLK_UART0, "uart0", "pclk", CLKCON, 10, 0, 0),
> +       GATE(PCLK_SDI, "sdi", "pclk", CLKCON, 9, 0, 0),
> +       GATE(PCLK_PWM, "pwm", "pclk", CLKCON, 8, 0, 0),
> +       GATE(HCLK_USBD, "usb-device", "hclk", CLKCON, 7, 0, 0),
> +       GATE(HCLK_USBH, "usb-host", "hclk", CLKCON, 6, 0, 0),
> +       GATE(HCLK_LCD, "lcd", "hclk", CLKCON, 5, 0, 0),
> +       GATE(HCLK_NAND, "nand", "hclk", CLKCON, 4, 0, 0),
> +};
> +
> +/* should be added _after_ the soc-specific clocks are created */
> +struct samsung_clock_alias s3c2410_common_aliases[] __initdata =3D {
> +       ALIAS(PCLK_I2C, "s3c2410-i2c.0", "i2c"),
> +       ALIAS(PCLK_ADC, NULL, "adc"),
> +       ALIAS(PCLK_RTC, NULL, "rtc"),
> +       ALIAS(PCLK_PWM, NULL, "timers"),
> +       ALIAS(HCLK_LCD, NULL, "lcd"),
> +       ALIAS(HCLK_USBD, NULL, "usb-device"),
> +       ALIAS(HCLK_USBH, NULL, "usb-host"),
> +       ALIAS(UCLK, NULL, "usb-bus-host"),
> +       ALIAS(UCLK, NULL, "usb-bus-gadget"),
> +       ALIAS(ARMCLK, NULL, "armclk"),
> +       ALIAS(UCLK, NULL, "uclk"),
> +       ALIAS(HCLK, NULL, "hclk"),
> +       ALIAS(MPLL, NULL, "mpll"),
> +       ALIAS(FCLK, NULL, "fclk"),
> +};
> +
> +/* S3C2410 specific clocks */
> +
> +static struct samsung_pll_rate_table pll_s3c2410_12mhz_tbl[] __initd=
ata =3D {
> +       /* sorted in descending order */
> +       /* 2410A extras */
> +       PLL_35XX_RATE(270000000, 127, 1, 1),
> +       PLL_35XX_RATE(268000000, 126, 1, 1),
> +       PLL_35XX_RATE(266000000, 125, 1, 1),
> +       PLL_35XX_RATE(226000000, 105, 1, 1),
> +       PLL_35XX_RATE(210000000, 132, 2, 1),
> +       /* 2410 common */
> +       PLL_35XX_RATE(203000000, 161, 3, 1),
> +       PLL_35XX_RATE(192000000, 88, 1, 1),
> +       PLL_35XX_RATE(186000000, 85, 1, 1),
> +       PLL_35XX_RATE(180000000, 82, 1, 1),
> +       PLL_35XX_RATE(170000000, 77, 1, 1),
> +       PLL_35XX_RATE(158000000, 71, 1, 1),
> +       PLL_35XX_RATE(152000000, 68, 1, 1),
> +       PLL_35XX_RATE(147000000, 90, 2, 1),
> +       PLL_35XX_RATE(135000000, 82, 2, 1),
> +       PLL_35XX_RATE(124000000, 116, 1, 2),
> +       PLL_35XX_RATE(118000000, 150, 2, 2),
> +       PLL_35XX_RATE(113000000, 105, 1, 2),
> +       PLL_35XX_RATE(101000000, 127, 2, 2),
> +       PLL_35XX_RATE(90000000, 112, 2, 2),
> +       PLL_35XX_RATE(85000000, 105, 2, 2),
> +       PLL_35XX_RATE(79000000, 71, 1, 2),
> +       PLL_35XX_RATE(68000000, 82, 2, 2),
> +       PLL_35XX_RATE(56000000, 142, 2, 3),
> +       PLL_35XX_RATE(48000000, 120, 2, 3),
> +       PLL_35XX_RATE(51000000, 161, 3, 3),
> +       PLL_35XX_RATE(45000000, 82, 1, 3),
> +       PLL_35XX_RATE(34000000, 82, 2, 3),
> +       { },
> +};
> +
> +static struct samsung_pll_clock s3c2410_plls[] __initdata =3D {
> +       [mpll] =3D PLL(pll_s3c2410_mpll, MPLL, "mpll", "xti",
> +                                               LOCKTIME, MPLLCON, NU=
LL),
> +       [upll] =3D PLL(pll_s3c2410_upll, UPLL, "upll", "xti",
> +                                               LOCKTIME, UPLLCON, NU=
LL),
> +};
> +
> +struct samsung_div_clock s3c2410_dividers[] __initdata =3D {
> +       DIV(HCLK, "hclk", "mpll", CLKDIVN, 1, 1),
> +};
> +
> +struct samsung_fixed_factor_clock s3c2410_ffactor[] __initdata =3D {
> +       /*
> +        * armclk is directly supplied by the fclk, without
> +        * switching possibility like on the s3c244x below.
> +        */
> +       FFACTOR(ARMCLK, "armclk", "fclk", 1, 1, 0),
> +
> +       /* uclk is fed from the unmodified upll */
> +       FFACTOR(UCLK, "uclk", "upll", 1, 1, 0),
> +};
> +
> +struct samsung_clock_alias s3c2410_aliases[] __initdata =3D {
> +       ALIAS(PCLK_UART0, "s3c2410-uart.0", "uart"),
> +       ALIAS(PCLK_UART1, "s3c2410-uart.1", "uart"),
> +       ALIAS(PCLK_UART2, "s3c2410-uart.2", "uart"),
> +       ALIAS(PCLK_UART0, "s3c2410-uart.0", "clk_uart_baud0"),
> +       ALIAS(PCLK_UART1, "s3c2410-uart.1", "clk_uart_baud0"),
> +       ALIAS(PCLK_UART2, "s3c2410-uart.2", "clk_uart_baud0"),
> +       ALIAS(UCLK, NULL, "clk_uart_baud1"),
> +};
> +
> +/* S3C244x specific clocks */
> +
> +static struct samsung_pll_rate_table pll_s3c244x_12mhz_tbl[] __initd=
ata =3D {
> +       /* sorted in descending order */
> +       PLL_35XX_RATE(400000000, 0x5c, 1, 1),
> +       PLL_35XX_RATE(390000000, 0x7a, 2, 1),
> +       PLL_35XX_RATE(380000000, 0x57, 1, 1),
> +       PLL_35XX_RATE(370000000, 0xb1, 4, 1),
> +       PLL_35XX_RATE(360000000, 0x70, 2, 1),
> +       PLL_35XX_RATE(350000000, 0xa7, 4, 1),
> +       PLL_35XX_RATE(340000000, 0x4d, 1, 1),
> +       PLL_35XX_RATE(330000000, 0x66, 2, 1),
> +       PLL_35XX_RATE(320000000, 0x98, 4, 1),
> +       PLL_35XX_RATE(310000000, 0x93, 4, 1),
> +       PLL_35XX_RATE(300000000, 0x75, 3, 1),
> +       PLL_35XX_RATE(240000000, 0x70, 1, 2),
> +       PLL_35XX_RATE(230000000, 0x6b, 1, 2),
> +       PLL_35XX_RATE(220000000, 0x66, 1, 2),
> +       PLL_35XX_RATE(210000000, 0x84, 2, 2),
> +       PLL_35XX_RATE(200000000, 0x5c, 1, 2),
> +       PLL_35XX_RATE(190000000, 0x57, 1, 2),
> +       PLL_35XX_RATE(180000000, 0x70, 2, 2),
> +       PLL_35XX_RATE(170000000, 0x4d, 1, 2),
> +       PLL_35XX_RATE(160000000, 0x98, 4, 2),
> +       PLL_35XX_RATE(150000000, 0x75, 3, 2),
> +       PLL_35XX_RATE(120000000, 0x70, 1, 3),
> +       PLL_35XX_RATE(110000000, 0x66, 1, 3),
> +       PLL_35XX_RATE(100000000, 0x5c, 1, 3),
> +       PLL_35XX_RATE(90000000, 0x70, 2, 3),
> +       PLL_35XX_RATE(80000000, 0x98, 4, 3),
> +       PLL_35XX_RATE(75000000, 0x75, 3, 3),
> +};
> +
> +static struct samsung_pll_clock s3c244x_common_plls[] __initdata =3D=
 {
> +       [mpll] =3D PLL(pll_s3c2440_mpll, MPLL, "mpll", "xti",
> +                                               LOCKTIME, MPLLCON, NU=
LL),
> +       [upll] =3D PLL(pll_s3c2410_upll, UPLL, "upll", "xti",
> +                                               LOCKTIME, UPLLCON, NU=
LL),
> +};
> +
> +PNAME(hclk_p) =3D { "fclk", "div_hclk_2", "div_hclk_4", "div_hclk_3"=
 };
> +PNAME(armclk_p) =3D { "fclk", "hclk" };
> +
> +struct samsung_mux_clock s3c244x_common_muxes[] __initdata =3D {
> +       MUX(HCLK, "hclk", hclk_p, CLKDIVN, 1, 2),
> +       MUX(ARMCLK, "armclk", armclk_p, CAMDIVN, 12, 1),
> +};
> +
> +struct samsung_fixed_factor_clock s3c244x_common_ffactor[] __initdat=
a =3D {
> +       FFACTOR(0, "div_hclk_2", "fclk", 1, 2, 0),
> +       FFACTOR(0, "ff_cam", "div_cam", 2, 1, CLK_SET_RATE_PARENT),
> +};
> +
> +static struct clk_div_table div_hclk_4_d[] =3D {
> +       { .val =3D 0, .div =3D 4 },
> +       { .val =3D 1, .div =3D 8 },
> +};
> +
> +static struct clk_div_table div_hclk_3_d[] =3D {
> +       { .val =3D 0, .div =3D 3 },
> +       { .val =3D 1, .div =3D 6 },
> +};
> +
> +struct samsung_div_clock s3c244x_common_dividers[] __initdata =3D {
> +       DIV(UCLK, "uclk", "upll", CLKDIVN, 3, 1),
> +       DIV(0, "div_hclk", "fclk", CLKDIVN, 1, 1),
> +       DIV_T(0, "div_hclk_4", "fclk", CAMDIVN, 9, 1, div_hclk_4_d),
> +       DIV_T(0, "div_hclk_3", "fclk", CAMDIVN, 8, 1, div_hclk_3_d),
> +       DIV(0, "div_cam", "upll", CAMDIVN, 0, 3),
> +};
> +
> +struct samsung_gate_clock s3c244x_common_gates[] __initdata =3D {
> +       GATE(HCLK_CAM, "cam", "hclk", CLKCON, 19, 0, 0),
> +};
> +
> +struct samsung_clock_alias s3c244x_common_aliases[] __initdata =3D {
> +       ALIAS(PCLK_UART0, "s3c2440-uart.0", "uart"),
> +       ALIAS(PCLK_UART1, "s3c2440-uart.1", "uart"),
> +       ALIAS(PCLK_UART2, "s3c2440-uart.2", "uart"),
> +       ALIAS(PCLK_UART0, "s3c2440-uart.0", "clk_uart_baud2"),
> +       ALIAS(PCLK_UART1, "s3c2440-uart.1", "clk_uart_baud2"),
> +       ALIAS(PCLK_UART2, "s3c2440-uart.2", "clk_uart_baud2"),
> +       ALIAS(HCLK_CAM, NULL, "camif"),
> +       ALIAS(CAMIF, NULL, "camif-upll"),
> +};
> +
> +/* S3C2440 specific clocks */
> +
> +PNAME(s3c2440_camif_p) =3D { "upll", "ff_cam" };
> +
> +struct samsung_mux_clock s3c2440_muxes[] __initdata =3D {
> +       MUX(CAMIF, "camif", s3c2440_camif_p, CAMDIVN, 4, 1),
> +};
> +
> +struct samsung_gate_clock s3c2440_gates[] __initdata =3D {
> +       GATE(PCLK_AC97, "ac97", "pclk", CLKCON, 20, 0, 0),
> +};
> +
> +/* S3C2442 specific clocks */
> +
> +struct samsung_fixed_factor_clock s3c2442_ffactor[] __initdata =3D {
> +       FFACTOR(0, "upll_3", "upll", 1, 3, 0),
> +};
> +
> +PNAME(s3c2442_camif_p) =3D { "upll", "ff_cam", "upll", "upll_3" };
> +
> +struct samsung_mux_clock s3c2442_muxes[] __initdata =3D {
> +       MUX(CAMIF, "camif", s3c2442_camif_p, CAMDIVN, 4, 2),
> +};
> +
> +/*
> + * fixed rate clocks generated outside the soc
> + * Only necessary until the devicetree-move is complete
> + */
> +struct samsung_fixed_rate_clock s3c2410_common_frate_clks[] __initda=
ta =3D {
> +       FRATE(XTI, "xti", NULL, CLK_IS_ROOT, 0),
> +};
> +
> +static void __init s3c2410_common_clk_register_fixed_ext(unsigned lo=
ng xti_f)
> +{
> +       struct samsung_clock_alias xti_alias =3D ALIAS(XTI, NULL, "xt=
al");
> +
> +       s3c2410_common_frate_clks[0].fixed_rate =3D xti_f;
> +       samsung_clk_register_fixed_rate(s3c2410_common_frate_clks,
> +                               ARRAY_SIZE(s3c2410_common_frate_clks)=
);
> +
> +       samsung_clk_register_alias(&xti_alias, 1);
> +}
> +
> +void __init s3c2410_common_clk_init(struct device_node *np, unsigned=
 long xti_f,
> +                                   int current_soc,
> +                                   void __iomem *reg_base)
> +{
> +       if (np) {
> +               reg_base =3D of_iomap(np, 0);
> +               if (!reg_base)
> +                       panic("%s: failed to map registers\n", __func=
__);
> +       }
> +
> +       samsung_clk_init(np, reg_base, NR_CLKS,
> +               s3c2410_clk_regs, ARRAY_SIZE(s3c2410_clk_regs), NULL,=
 0);
> +
> +       /* Register external clocks only in non-dt cases */
> +       if (!np)
> +               s3c2410_common_clk_register_fixed_ext(xti_f);
> +
> +       if (current_soc =3D=3D 2410) {
> +               if (_get_rate("xti") =3D=3D 12 * MHZ) {
> +                       s3c2410_plls[mpll].rate_table =3D pll_s3c2410=
_12mhz_tbl;
> +                       s3c2410_plls[upll].rate_table =3D pll_s3c2410=
_12mhz_tbl;
> +               }
> +
> +               /* Register PLLs. */
> +               samsung_clk_register_pll(s3c2410_plls,
> +                               ARRAY_SIZE(s3c2410_plls), reg_base);
> +
> +       } else { /* S3C2440, S3C2442 */
> +               if (_get_rate("xti") =3D=3D 12 * MHZ) {
> +                       /*
> +                        * plls follow different calculation schemes,=
 with the
> +                        * upll following the same scheme as the s3c2=
410 plls
> +                        */
> +                       s3c244x_common_plls[mpll].rate_table =3D
> +                                                       pll_s3c244x_1=
2mhz_tbl;
> +                       s3c244x_common_plls[upll].rate_table =3D
> +                                                       pll_s3c2410_1=
2mhz_tbl;
> +               }
> +
> +               /* Register PLLs. */
> +               samsung_clk_register_pll(s3c244x_common_plls,
> +                               ARRAY_SIZE(s3c244x_common_plls), reg_=
base);
> +       }
> +
> +       /* Register common internal clocks. */
> +       samsung_clk_register_mux(s3c2410_common_muxes,
> +                       ARRAY_SIZE(s3c2410_common_muxes));
> +       samsung_clk_register_div(s3c2410_common_dividers,
> +                       ARRAY_SIZE(s3c2410_common_dividers));
> +       samsung_clk_register_gate(s3c2410_common_gates,
> +               ARRAY_SIZE(s3c2410_common_gates));
> +
> +       if (current_soc =3D=3D S3C2440 || current_soc =3D=3D S3C2442)=
 {
> +               samsung_clk_register_div(s3c244x_common_dividers,
> +                               ARRAY_SIZE(s3c244x_common_dividers));
> +               samsung_clk_register_gate(s3c244x_common_gates,
> +                               ARRAY_SIZE(s3c244x_common_gates));
> +               samsung_clk_register_mux(s3c244x_common_muxes,
> +                               ARRAY_SIZE(s3c244x_common_muxes));
> +               samsung_clk_register_fixed_factor(s3c244x_common_ffac=
tor,
> +                               ARRAY_SIZE(s3c244x_common_ffactor));
> +       }
> +
> +       /* Register SoC-specific clocks. */
> +       switch (current_soc) {
> +       case S3C2410:
> +               samsung_clk_register_div(s3c2410_dividers,
> +                               ARRAY_SIZE(s3c2410_dividers));
> +               samsung_clk_register_fixed_factor(s3c2410_ffactor,
> +                               ARRAY_SIZE(s3c2410_ffactor));
> +               samsung_clk_register_alias(s3c2410_aliases,
> +                       ARRAY_SIZE(s3c2410_common_aliases));
> +               break;
> +       case S3C2440:
> +               samsung_clk_register_mux(s3c2440_muxes,
> +                               ARRAY_SIZE(s3c2440_muxes));
> +               samsung_clk_register_gate(s3c2440_gates,
> +                               ARRAY_SIZE(s3c2440_gates));
> +               break;
> +       case S3C2442:
> +               samsung_clk_register_mux(s3c2442_muxes,
> +                               ARRAY_SIZE(s3c2442_muxes));
> +               samsung_clk_register_fixed_factor(s3c2442_ffactor,
> +                               ARRAY_SIZE(s3c2442_ffactor));
> +               break;
> +       }
> +
> +       /*
> +        * Register common aliases at the end, as some of the aliased=
 clocks
> +        * are SoC specific.
> +        */
> +       samsung_clk_register_alias(s3c2410_common_aliases,
> +               ARRAY_SIZE(s3c2410_common_aliases));
> +
> +       if (current_soc =3D=3D S3C2440 || current_soc =3D=3D S3C2442)=
 {
> +               samsung_clk_register_alias(s3c244x_common_aliases,
> +                       ARRAY_SIZE(s3c244x_common_aliases));
> +       }
> +}
> +
> +static void __init s3c2410_clk_init(struct device_node *np)
> +{
> +       s3c2410_common_clk_init(np, 0, S3C2410, 0);
> +}
> +CLK_OF_DECLARE(s3c2410_clk, "samsung,s3c2410-clock", s3c2410_clk_ini=
t);
> +
> +static void __init s3c2440_clk_init(struct device_node *np)
> +{
> +       s3c2410_common_clk_init(np, 0, S3C2440, 0);
> +}
> +CLK_OF_DECLARE(s3c2440_clk, "samsung,s3c2440-clock", s3c2440_clk_ini=
t);
> +
> +static void __init s3c2442_clk_init(struct device_node *np)
> +{
> +       s3c2410_common_clk_init(np, 0, S3C2442, 0);
> +}
> +CLK_OF_DECLARE(s3c2442_clk, "samsung,s3c2442-clock", s3c2442_clk_ini=
t);
> diff --git a/include/dt-bindings/clock/samsung,s3c2410-clock.h b/incl=
ude/dt-bindings/clock/samsung,s3c2410-clock.h
> new file mode 100644
> index 0000000..66c278f
> --- /dev/null
> +++ b/include/dt-bindings/clock/samsung,s3c2410-clock.h
> @@ -0,0 +1,64 @@
> +/*
> + * Copyright (c) 2013 Heiko Stuebner <heiko@sntech.de>
> + *
> + * This program is free software; you can redistribute it and/or mod=
ify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> + *
> + * Device Tree binding constants clock controllers of Samsung S3C241=
0 and later.
> + */
> +
> +#ifndef _DT_BINDINGS_CLOCK_SAMSUNG_S3C2410_CLOCK_H
> +#define _DT_BINDINGS_CLOCK_SAMSUNG_S3C2410_CLOCK_H
> +
> +/*
> + * Let each exported clock get a unique index, which is used on DT-e=
nabled
> + * platforms to lookup the clock from a clock specifier. These indic=
es are
> + * therefore considered an ABI and so must not be changed. This impl=
ies
> + * that new clocks should be added either in free spaces between clo=
ck groups
> + * or at the end.
> + */
> +
> +/* Core clocks. */
> +
> +
> +#define MPLL                   1
> +#define UPLL                   2
> +#define FCLK                   3
> +#define HCLK                   4
> +#define PCLK                   5
> +#define UCLK                   6
> +#define ARMCLK                 7
> +
> +#define XTI                    8
> +
> +/* pclk-gates */
> +#define PCLK_UART0             16
> +#define PCLK_UART1             17
> +#define PCLK_UART2             18
> +#define PCLK_I2C               19
> +#define PCLK_SDI               20
> +#define PCLK_SPI               21
> +#define PCLK_ADC               22
> +#define PCLK_AC97              23
> +#define PCLK_I2S               24
> +#define PCLK_PWM               25
> +#define PCLK_RTC               26
> +#define PCLK_GPIO              27
> +
> +
> +/* hclk-gates */
> +#define HCLK_LCD               32
> +#define HCLK_USBH              33
> +#define HCLK_USBD              34
> +#define HCLK_NAND              35
> +#define HCLK_CAM               36
> +
> +
> +#define CAMIF                  40
> +
> +
> +/* Total number of clocks. */
> +#define NR_CLKS                        (CAMIF + 1)
> +
> +#endif /* _DT_BINDINGS_CLOCK_SAMSUNG_S3C2443_CLOCK_H */
> --=20
> 1.7.10.4
>=20
