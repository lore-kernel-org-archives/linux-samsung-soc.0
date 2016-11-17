From: Chanwoo Choi <cwchoi00@gmail.com>
Subject: Re: [PATCH] arm64: dts: exynos: Fix IRQ type flags for Exynos5433 SoC
Date: Thu, 17 Nov 2016 22:28:00 +0900
Message-ID: <CAGTfZH0++2LsY0u4j5dTZjp4jQ9FCrBckNC9wsF-1bOre-ABKg@mail.gmail.com>
References: <CGME20161117093532eucas1p2b719b9ea73e148e1ac9ef39978e3f1ba@eucas1p2.samsung.com>
 <1479375319-17102-1-git-send-email-m.szyprowski@samsung.com>
Reply-To: cwchoi00@gmail.com
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qk0-f195.google.com ([209.85.220.195]:34256 "EHLO
        mail-qk0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750714AbcKQO2P (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 17 Nov 2016 09:28:15 -0500
Received: by mail-qk0-f195.google.com with SMTP id 124so26387890qkh.1
        for <linux-samsung-soc@vger.kernel.org>; Thu, 17 Nov 2016 06:28:14 -0800 (PST)
In-Reply-To: <1479375319-17102-1-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>

Hi Marek,

Looks good to me. I recommend that you better to modify the
exynos5433-pinctrl.dtsi for IRQ flag with this patch.

Reviewed-by: Chanwoo Choi <cw00.choi@samsung.com>

Best Regards,
Chanwoo Choi

2016-11-17 18:35 GMT+09:00 Marek Szyprowski <m.szyprowski@samsung.com>:
> Interrupt of type IRQ_TYPE_NONE is not allowed for GIC interrupts. The
> GIC requires shared interrupts to be edge rising or level high. Platform
> declares support for both. Set all interrupts type to level high, as this
> works fine - tested on Exynos5433-based TM2 board.
>
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
>  arch/arm64/boot/dts/exynos/exynos5433.dtsi | 129 +++++++++++++++--------------
>  1 file changed, 69 insertions(+), 60 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/exynos/exynos5433.dtsi b/arch/arm64/boot/dts/exynos/exynos5433.dtsi
> index bdc32d1c83bd..95219800a79c 100644
> --- a/arch/arm64/boot/dts/exynos/exynos5433.dtsi
> +++ b/arch/arm64/boot/dts/exynos/exynos5433.dtsi
> @@ -549,7 +549,7 @@
>                 tmu_atlas0: tmu@10060000 {
>                         compatible = "samsung,exynos5433-tmu";
>                         reg = <0x10060000 0x200>;
> -                       interrupts = <GIC_SPI 95 0>;
> +                       interrupts = <GIC_SPI 95 IRQ_TYPE_LEVEL_HIGH>;
>                         clocks = <&cmu_peris CLK_PCLK_TMU0_APBIF>,
>                                 <&cmu_peris CLK_SCLK_TMU0>;
>                         clock-names = "tmu_apbif", "tmu_sclk";
> @@ -560,7 +560,7 @@
>                 tmu_atlas1: tmu@10068000 {
>                         compatible = "samsung,exynos5433-tmu";
>                         reg = <0x10068000 0x200>;
> -                       interrupts = <GIC_SPI 96 0>;
> +                       interrupts = <GIC_SPI 96 IRQ_TYPE_LEVEL_HIGH>;
>                         clocks = <&cmu_peris CLK_PCLK_TMU0_APBIF>,
>                                 <&cmu_peris CLK_SCLK_TMU0>;
>                         clock-names = "tmu_apbif", "tmu_sclk";
> @@ -571,7 +571,7 @@
>                 tmu_g3d: tmu@10070000 {
>                         compatible = "samsung,exynos5433-tmu";
>                         reg = <0x10070000 0x200>;
> -                       interrupts = <GIC_SPI 99 0>;
> +                       interrupts = <GIC_SPI 99 IRQ_TYPE_LEVEL_HIGH>;
>                         clocks = <&cmu_peris CLK_PCLK_TMU1_APBIF>,
>                                 <&cmu_peris CLK_SCLK_TMU1>;
>                         clock-names = "tmu_apbif", "tmu_sclk";
> @@ -582,7 +582,7 @@
>                 tmu_apollo: tmu@10078000 {
>                         compatible = "samsung,exynos5433-tmu";
>                         reg = <0x10078000 0x200>;
> -                       interrupts = <GIC_SPI 115 0>;
> +                       interrupts = <GIC_SPI 115 IRQ_TYPE_LEVEL_HIGH>;
>                         clocks = <&cmu_peris CLK_PCLK_TMU1_APBIF>,
>                                 <&cmu_peris CLK_SCLK_TMU1>;
>                         clock-names = "tmu_apbif", "tmu_sclk";
> @@ -593,7 +593,7 @@
>                 tmu_isp: tmu@1007c000 {
>                         compatible = "samsung,exynos5433-tmu";
>                         reg = <0x1007c000 0x200>;
> -                       interrupts = <GIC_SPI 94 0>;
> +                       interrupts = <GIC_SPI 94 IRQ_TYPE_LEVEL_HIGH>;
>                         clocks = <&cmu_peris CLK_PCLK_TMU1_APBIF>,
>                                 <&cmu_peris CLK_SCLK_TMU1>;
>                         clock-names = "tmu_apbif", "tmu_sclk";
> @@ -604,12 +604,18 @@
>                 mct@101c0000 {
>                         compatible = "samsung,exynos4210-mct";
>                         reg = <0x101c0000 0x800>;
> -                       interrupts = <GIC_SPI 102 0>, <GIC_SPI 103 0>,
> -                               <GIC_SPI 104 0>, <GIC_SPI 105 0>,
> -                               <GIC_SPI 106 0>, <GIC_SPI 107 0>,
> -                               <GIC_SPI 108 0>, <GIC_SPI 109 0>,
> -                               <GIC_SPI 110 0>, <GIC_SPI 111 0>,
> -                               <GIC_SPI 112 0>, <GIC_SPI 113 0>;
> +                       interrupts = <GIC_SPI 102 IRQ_TYPE_LEVEL_HIGH>,
> +                               <GIC_SPI 103 IRQ_TYPE_LEVEL_HIGH>,
> +                               <GIC_SPI 104 IRQ_TYPE_LEVEL_HIGH>,
> +                               <GIC_SPI 105 IRQ_TYPE_LEVEL_HIGH>,
> +                               <GIC_SPI 106 IRQ_TYPE_LEVEL_HIGH>,
> +                               <GIC_SPI 107 IRQ_TYPE_LEVEL_HIGH>,
> +                               <GIC_SPI 108 IRQ_TYPE_LEVEL_HIGH>,
> +                               <GIC_SPI 109 IRQ_TYPE_LEVEL_HIGH>,
> +                               <GIC_SPI 110 IRQ_TYPE_LEVEL_HIGH>,
> +                               <GIC_SPI 111 IRQ_TYPE_LEVEL_HIGH>,
> +                               <GIC_SPI 112 IRQ_TYPE_LEVEL_HIGH>,
> +                               <GIC_SPI 113 IRQ_TYPE_LEVEL_HIGH>;
>                         clocks = <&xxti>, <&cmu_peris CLK_PCLK_MCT>;
>                         clock-names = "fin_pll", "mct";
>                 };
> @@ -620,62 +626,62 @@
>
>                         wakeup-interrupt-controller {
>                                 compatible = "samsung,exynos7-wakeup-eint";
> -                               interrupts = <GIC_SPI 16 0>;
> +                               interrupts = <GIC_SPI 16 IRQ_TYPE_LEVEL_HIGH>;
>                         };
>                 };
>
>                 pinctrl_aud: pinctrl@114b0000 {
>                         compatible = "samsung,exynos5433-pinctrl";
>                         reg = <0x114b0000 0x1000>;
> -                       interrupts = <GIC_SPI 68 0>;
> +                       interrupts = <GIC_SPI 68 IRQ_TYPE_LEVEL_HIGH>;
>                 };
>
>                 pinctrl_cpif: pinctrl@10fe0000 {
>                         compatible = "samsung,exynos5433-pinctrl";
>                         reg = <0x10fe0000 0x1000>;
> -                       interrupts = <GIC_SPI 179 0>;
> +                       interrupts = <GIC_SPI 179 IRQ_TYPE_LEVEL_HIGH>;
>                 };
>
>                 pinctrl_ese: pinctrl@14ca0000 {
>                         compatible = "samsung,exynos5433-pinctrl";
>                         reg = <0x14ca0000 0x1000>;
> -                       interrupts = <GIC_SPI 413 0>;
> +                       interrupts = <GIC_SPI 413 IRQ_TYPE_LEVEL_HIGH>;
>                 };
>
>                 pinctrl_finger: pinctrl@14cb0000 {
>                         compatible = "samsung,exynos5433-pinctrl";
>                         reg = <0x14cb0000 0x1000>;
> -                       interrupts = <GIC_SPI 414 0>;
> +                       interrupts = <GIC_SPI 414 IRQ_TYPE_LEVEL_HIGH>;
>                 };
>
>                 pinctrl_fsys: pinctrl@15690000 {
>                         compatible = "samsung,exynos5433-pinctrl";
>                         reg = <0x15690000 0x1000>;
> -                       interrupts = <GIC_SPI 229 0>;
> +                       interrupts = <GIC_SPI 229 IRQ_TYPE_LEVEL_HIGH>;
>                 };
>
>                 pinctrl_imem: pinctrl@11090000 {
>                         compatible = "samsung,exynos5433-pinctrl";
>                         reg = <0x11090000 0x1000>;
> -                       interrupts = <GIC_SPI 325 0>;
> +                       interrupts = <GIC_SPI 325 IRQ_TYPE_LEVEL_HIGH>;
>                 };
>
>                 pinctrl_nfc: pinctrl@14cd0000 {
>                         compatible = "samsung,exynos5433-pinctrl";
>                         reg = <0x14cd0000 0x1000>;
> -                       interrupts = <GIC_SPI 441 0>;
> +                       interrupts = <GIC_SPI 441 IRQ_TYPE_LEVEL_HIGH>;
>                 };
>
>                 pinctrl_peric: pinctrl@14cc0000 {
>                         compatible = "samsung,exynos5433-pinctrl";
>                         reg = <0x14cc0000 0x1100>;
> -                       interrupts = <GIC_SPI 440 0>;
> +                       interrupts = <GIC_SPI 440 IRQ_TYPE_LEVEL_HIGH>;
>                 };
>
>                 pinctrl_touch: pinctrl@14ce0000 {
>                         compatible = "samsung,exynos5433-pinctrl";
>                         reg = <0x14ce0000 0x1100>;
> -                       interrupts = <GIC_SPI 442 0>;
> +                       interrupts = <GIC_SPI 442 IRQ_TYPE_LEVEL_HIGH>;
>                 };
>
>                 pmu_system_controller: system-controller@105c0000 {
> @@ -720,8 +726,9 @@
>                                 "aclk_xiu_decon0x", "pclk_smmu_decon0x",
>                                 "sclk_decon_vclk", "sclk_decon_eclk";
>                         interrupt-names = "fifo", "vsync", "lcd_sys";
> -                       interrupts = <GIC_SPI 201 0>, <GIC_SPI 202 0>,
> -                                  <GIC_SPI 203 0>;
> +                       interrupts = <GIC_SPI 201 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 202 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 203 IRQ_TYPE_LEVEL_HIGH>;
>                         samsung,disp-sysreg = <&syscon_disp>;
>                         status = "disabled";
>                         iommus = <&sysmmu_decon0x>, <&sysmmu_decon1x>;
> @@ -744,7 +751,7 @@
>                 dsi: dsi@13900000 {
>                         compatible = "samsung,exynos5433-mipi-dsi";
>                         reg = <0x13900000 0xC0>;
> -                       interrupts = <GIC_SPI 205 0>;
> +                       interrupts = <GIC_SPI 205 IRQ_TYPE_LEVEL_HIGH>;
>                         phys = <&mipi_phy 1>;
>                         phy-names = "dsim";
>                         clocks = <&cmu_disp CLK_PCLK_DSIM0>,
> @@ -890,7 +897,7 @@
>                 sysmmu_decon0x: sysmmu@0x13a00000 {
>                         compatible = "samsung,exynos-sysmmu";
>                         reg = <0x13a00000 0x1000>;
> -                       interrupts = <GIC_SPI 192 0>;
> +                       interrupts = <GIC_SPI 192 IRQ_TYPE_LEVEL_HIGH>;
>                         clock-names = "pclk", "aclk";
>                         clocks = <&cmu_disp CLK_PCLK_SMMU_DECON0X>,
>                                 <&cmu_disp CLK_ACLK_SMMU_DECON0X>;
> @@ -900,7 +907,7 @@
>                 sysmmu_decon1x: sysmmu@0x13a10000 {
>                         compatible = "samsung,exynos-sysmmu";
>                         reg = <0x13a10000 0x1000>;
> -                       interrupts = <GIC_SPI 194 0>;
> +                       interrupts = <GIC_SPI 194 IRQ_TYPE_LEVEL_HIGH>;
>                         clock-names = "pclk", "aclk";
>                         clocks = <&cmu_disp CLK_PCLK_SMMU_DECON1X>,
>                                 <&cmu_disp CLK_ACLK_SMMU_DECON1X>;
> @@ -976,7 +983,7 @@
>                 serial_0: serial@14c10000 {
>                         compatible = "samsung,exynos5433-uart";
>                         reg = <0x14c10000 0x100>;
> -                       interrupts = <GIC_SPI 421 0>;
> +                       interrupts = <GIC_SPI 421 IRQ_TYPE_LEVEL_HIGH>;
>                         clocks = <&cmu_peric CLK_PCLK_UART0>,
>                                 <&cmu_peric CLK_SCLK_UART0>;
>                         clock-names = "uart", "clk_uart_baud0";
> @@ -988,7 +995,7 @@
>                 serial_1: serial@14c20000 {
>                         compatible = "samsung,exynos5433-uart";
>                         reg = <0x14c20000 0x100>;
> -                       interrupts = <GIC_SPI 422 0>;
> +                       interrupts = <GIC_SPI 422 IRQ_TYPE_LEVEL_HIGH>;
>                         clocks = <&cmu_peric CLK_PCLK_UART1>,
>                                 <&cmu_peric CLK_SCLK_UART1>;
>                         clock-names = "uart", "clk_uart_baud0";
> @@ -1000,7 +1007,7 @@
>                 serial_2: serial@14c30000 {
>                         compatible = "samsung,exynos5433-uart";
>                         reg = <0x14c30000 0x100>;
> -                       interrupts = <GIC_SPI 423 0>;
> +                       interrupts = <GIC_SPI 423 IRQ_TYPE_LEVEL_HIGH>;
>                         clocks = <&cmu_peric CLK_PCLK_UART2>,
>                                 <&cmu_peric CLK_SCLK_UART2>;
>                         clock-names = "uart", "clk_uart_baud0";
> @@ -1012,7 +1019,7 @@
>                 spi_0: spi@14d20000 {
>                         compatible = "samsung,exynos5433-spi";
>                         reg = <0x14d20000 0x100>;
> -                       interrupts = <GIC_SPI 432 0>;
> +                       interrupts = <GIC_SPI 432 IRQ_TYPE_LEVEL_HIGH>;
>                         dmas = <&pdma0 9>, <&pdma0 8>;
>                         dma-names = "tx", "rx";
>                         #address-cells = <1>;
> @@ -1031,7 +1038,7 @@
>                 spi_1: spi@14d30000 {
>                         compatible = "samsung,exynos5433-spi";
>                         reg = <0x14d30000 0x100>;
> -                       interrupts = <GIC_SPI 433 0>;
> +                       interrupts = <GIC_SPI 433 IRQ_TYPE_LEVEL_HIGH>;
>                         dmas = <&pdma0 11>, <&pdma0 10>;
>                         dma-names = "tx", "rx";
>                         #address-cells = <1>;
> @@ -1050,7 +1057,7 @@
>                 spi_2: spi@14d40000 {
>                         compatible = "samsung,exynos5433-spi";
>                         reg = <0x14d40000 0x100>;
> -                       interrupts = <GIC_SPI 434 0>;
> +                       interrupts = <GIC_SPI 434 IRQ_TYPE_LEVEL_HIGH>;
>                         dmas = <&pdma0 13>, <&pdma0 12>;
>                         dma-names = "tx", "rx";
>                         #address-cells = <1>;
> @@ -1069,7 +1076,7 @@
>                 spi_3: spi@14d50000 {
>                         compatible = "samsung,exynos5433-spi";
>                         reg = <0x14d50000 0x100>;
> -                       interrupts = <GIC_SPI 447 0>;
> +                       interrupts = <GIC_SPI 447 IRQ_TYPE_LEVEL_HIGH>;
>                         dmas = <&pdma0 23>, <&pdma0 22>;
>                         dma-names = "tx", "rx";
>                         #address-cells = <1>;
> @@ -1088,7 +1095,7 @@
>                 spi_4: spi@14d00000 {
>                         compatible = "samsung,exynos5433-spi";
>                         reg = <0x14d00000 0x100>;
> -                       interrupts = <GIC_SPI 412 0>;
> +                       interrupts = <GIC_SPI 412 IRQ_TYPE_LEVEL_HIGH>;
>                         dmas = <&pdma0 25>, <&pdma0 24>;
>                         dma-names = "tx", "rx";
>                         #address-cells = <1>;
> @@ -1107,7 +1114,7 @@
>                 adc: adc@14d10000 {
>                         compatible = "samsung,exynos7-adc";
>                         reg = <0x14d10000 0x100>;
> -                       interrupts = <GIC_SPI 438 0>;
> +                       interrupts = <GIC_SPI 438 IRQ_TYPE_LEVEL_HIGH>;
>                         clock-names = "adc";
>                         clocks = <&cmu_peric CLK_PCLK_ADCIF>;
>                         #io-channel-cells = <1>;
> @@ -1118,9 +1125,11 @@
>                 pwm: pwm@14dd0000 {
>                         compatible = "samsung,exynos4210-pwm";
>                         reg = <0x14dd0000 0x100>;
> -                       interrupts = <GIC_SPI 416 0>, <GIC_SPI 417 0>,
> -                               <GIC_SPI 418 0>, <GIC_SPI 419 0>,
> -                               <GIC_SPI 420 0>;
> +                       interrupts = <GIC_SPI 416 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 417 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 418 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 419 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 420 IRQ_TYPE_LEVEL_HIGH>;
>                         samsung,pwm-outputs = <0>, <1>, <2>, <3>;
>                         clocks = <&cmu_peric CLK_PCLK_PWM>;
>                         clock-names = "timers";
> @@ -1131,7 +1140,7 @@
>                 hsi2c_0: hsi2c@14e40000 {
>                         compatible = "samsung,exynos7-hsi2c";
>                         reg = <0x14e40000 0x1000>;
> -                       interrupts = <GIC_SPI 428 0>;
> +                       interrupts = <GIC_SPI 428 IRQ_TYPE_LEVEL_HIGH>;
>                         #address-cells = <1>;
>                         #size-cells = <0>;
>                         pinctrl-names = "default";
> @@ -1144,7 +1153,7 @@
>                 hsi2c_1: hsi2c@14e50000 {
>                         compatible = "samsung,exynos7-hsi2c";
>                         reg = <0x14e50000 0x1000>;
> -                       interrupts = <GIC_SPI 429 0>;
> +                       interrupts = <GIC_SPI 429 IRQ_TYPE_LEVEL_HIGH>;
>                         #address-cells = <1>;
>                         #size-cells = <0>;
>                         pinctrl-names = "default";
> @@ -1157,7 +1166,7 @@
>                 hsi2c_2: hsi2c@14e60000 {
>                         compatible = "samsung,exynos7-hsi2c";
>                         reg = <0x14e60000 0x1000>;
> -                       interrupts = <GIC_SPI 430 0>;
> +                       interrupts = <GIC_SPI 430 IRQ_TYPE_LEVEL_HIGH>;
>                         #address-cells = <1>;
>                         #size-cells = <0>;
>                         pinctrl-names = "default";
> @@ -1170,7 +1179,7 @@
>                 hsi2c_3: hsi2c@14e70000 {
>                         compatible = "samsung,exynos7-hsi2c";
>                         reg = <0x14e70000 0x1000>;
> -                       interrupts = <GIC_SPI 431 0>;
> +                       interrupts = <GIC_SPI 431 IRQ_TYPE_LEVEL_HIGH>;
>                         #address-cells = <1>;
>                         #size-cells = <0>;
>                         pinctrl-names = "default";
> @@ -1183,7 +1192,7 @@
>                 hsi2c_4: hsi2c@14ec0000 {
>                         compatible = "samsung,exynos7-hsi2c";
>                         reg = <0x14ec0000 0x1000>;
> -                       interrupts = <GIC_SPI 424 0>;
> +                       interrupts = <GIC_SPI 424 IRQ_TYPE_LEVEL_HIGH>;
>                         #address-cells = <1>;
>                         #size-cells = <0>;
>                         pinctrl-names = "default";
> @@ -1196,7 +1205,7 @@
>                 hsi2c_5: hsi2c@14ed0000 {
>                         compatible = "samsung,exynos7-hsi2c";
>                         reg = <0x14ed0000 0x1000>;
> -                       interrupts = <GIC_SPI 425 0>;
> +                       interrupts = <GIC_SPI 425 IRQ_TYPE_LEVEL_HIGH>;
>                         #address-cells = <1>;
>                         #size-cells = <0>;
>                         pinctrl-names = "default";
> @@ -1209,7 +1218,7 @@
>                 hsi2c_6: hsi2c@14ee0000 {
>                         compatible = "samsung,exynos7-hsi2c";
>                         reg = <0x14ee0000 0x1000>;
> -                       interrupts = <GIC_SPI 426 0>;
> +                       interrupts = <GIC_SPI 426 IRQ_TYPE_LEVEL_HIGH>;
>                         #address-cells = <1>;
>                         #size-cells = <0>;
>                         pinctrl-names = "default";
> @@ -1222,7 +1231,7 @@
>                 hsi2c_7: hsi2c@14ef0000 {
>                         compatible = "samsung,exynos7-hsi2c";
>                         reg = <0x14ef0000 0x1000>;
> -                       interrupts = <GIC_SPI 427 0>;
> +                       interrupts = <GIC_SPI 427 IRQ_TYPE_LEVEL_HIGH>;
>                         #address-cells = <1>;
>                         #size-cells = <0>;
>                         pinctrl-names = "default";
> @@ -1235,7 +1244,7 @@
>                 hsi2c_8: hsi2c@14d90000 {
>                         compatible = "samsung,exynos7-hsi2c";
>                         reg = <0x14d90000 0x1000>;
> -                       interrupts = <GIC_SPI 443 0>;
> +                       interrupts = <GIC_SPI 443 IRQ_TYPE_LEVEL_HIGH>;
>                         #address-cells = <1>;
>                         #size-cells = <0>;
>                         pinctrl-names = "default";
> @@ -1248,7 +1257,7 @@
>                 hsi2c_9: hsi2c@14da0000 {
>                         compatible = "samsung,exynos7-hsi2c";
>                         reg = <0x14da0000 0x1000>;
> -                       interrupts = <GIC_SPI 444 0>;
> +                       interrupts = <GIC_SPI 444 IRQ_TYPE_LEVEL_HIGH>;
>                         #address-cells = <1>;
>                         #size-cells = <0>;
>                         pinctrl-names = "default";
> @@ -1261,7 +1270,7 @@
>                 hsi2c_10: hsi2c@14de0000 {
>                         compatible = "samsung,exynos7-hsi2c";
>                         reg = <0x14de0000 0x1000>;
> -                       interrupts = <GIC_SPI 445 0>;
> +                       interrupts = <GIC_SPI 445 IRQ_TYPE_LEVEL_HIGH>;
>                         #address-cells = <1>;
>                         #size-cells = <0>;
>                         pinctrl-names = "default";
> @@ -1274,7 +1283,7 @@
>                 hsi2c_11: hsi2c@14df0000 {
>                         compatible = "samsung,exynos7-hsi2c";
>                         reg = <0x14df0000 0x1000>;
> -                       interrupts = <GIC_SPI 446 0>;
> +                       interrupts = <GIC_SPI 446 IRQ_TYPE_LEVEL_HIGH>;
>                         #address-cells = <1>;
>                         #size-cells = <0>;
>                         pinctrl-names = "default";
> @@ -1297,7 +1306,7 @@
>                         dwc3@15400000 {
>                                 compatible = "snps,dwc3";
>                                 reg = <0x15400000 0x10000>;
> -                               interrupts = <GIC_SPI 231 0>;
> +                               interrupts = <GIC_SPI 231 IRQ_TYPE_LEVEL_HIGH>;
>                                 phys = <&usbdrd30_phy 0>, <&usbdrd30_phy 1>;
>                                 phy-names = "usb2-phy", "usb3-phy";
>                         };
> @@ -1344,7 +1353,7 @@
>                         usbdrd_dwc3_0: dwc3@15a00000 {
>                                 compatible = "snps,dwc3";
>                                 reg = <0x15a00000 0x10000>;
> -                               interrupts = <GIC_SPI 244 0>;
> +                               interrupts = <GIC_SPI 244 IRQ_TYPE_LEVEL_HIGH>;
>                                 phys = <&usbhost30_phy 0>, <&usbhost30_phy 1>;
>                                 phy-names = "usb2-phy", "usb3-phy";
>                         };
> @@ -1352,7 +1361,7 @@
>
>                 mshc_0: mshc@15540000 {
>                         compatible = "samsung,exynos7-dw-mshc-smu";
> -                       interrupts = <GIC_SPI 225 0>;
> +                       interrupts = <GIC_SPI 225 IRQ_TYPE_LEVEL_HIGH>;
>                         #address-cells = <1>;
>                         #size-cells = <0>;
>                         reg = <0x15540000 0x2000>;
> @@ -1365,7 +1374,7 @@
>
>                 mshc_1: mshc@15550000 {
>                         compatible = "samsung,exynos7-dw-mshc-smu";
> -                       interrupts = <GIC_SPI 226 0>;
> +                       interrupts = <GIC_SPI 226 IRQ_TYPE_LEVEL_HIGH>;
>                         #address-cells = <1>;
>                         #size-cells = <0>;
>                         reg = <0x15550000 0x2000>;
> @@ -1378,7 +1387,7 @@
>
>                 mshc_2: mshc@15560000 {
>                         compatible = "samsung,exynos7-dw-mshc-smu";
> -                       interrupts = <GIC_SPI 227 0>;
> +                       interrupts = <GIC_SPI 227 IRQ_TYPE_LEVEL_HIGH>;
>                         #address-cells = <1>;
>                         #size-cells = <0>;
>                         reg = <0x15560000 0x2000>;
> @@ -1398,7 +1407,7 @@
>                         pdma0: pdma@15610000 {
>                                 compatible = "arm,pl330", "arm,primecell";
>                                 reg = <0x15610000 0x1000>;
> -                               interrupts = <GIC_SPI 228 0>;
> +                               interrupts = <GIC_SPI 228 IRQ_TYPE_LEVEL_HIGH>;
>                                 clocks = <&cmu_fsys CLK_PDMA0>;
>                                 clock-names = "apb_pclk";
>                                 #dma-cells = <1>;
> @@ -1409,7 +1418,7 @@
>                         pdma1: pdma@15600000 {
>                                 compatible = "arm,pl330", "arm,primecell";
>                                 reg = <0x15600000 0x1000>;
> -                               interrupts = <GIC_SPI 246 0>;
> +                               interrupts = <GIC_SPI 246 IRQ_TYPE_LEVEL_HIGH>;
>                                 clocks = <&cmu_fsys CLK_PDMA1>;
>                                 clock-names = "apb_pclk";
>                                 #dma-cells = <1>;
> @@ -1429,7 +1438,7 @@
>                         adma: adma@11420000 {
>                                 compatible = "arm,pl330", "arm,primecell";
>                                 reg = <0x11420000 0x1000>;
> -                               interrupts = <GIC_SPI 73 0>;
> +                               interrupts = <GIC_SPI 73 IRQ_TYPE_LEVEL_HIGH>;
>                                 clocks = <&cmu_aud CLK_ACLK_DMAC>;
>                                 clock-names = "apb_pclk";
>                                 #dma-cells = <1>;
> @@ -1442,7 +1451,7 @@
>                                 reg = <0x11440000 0x100>;
>                                 dmas = <&adma 0 &adma 2>;
>                                 dma-names = "tx", "rx";
> -                               interrupts = <GIC_SPI 70 0>;
> +                               interrupts = <GIC_SPI 70 IRQ_TYPE_LEVEL_HIGH>;
>                                 #address-cells = <1>;
>                                 #size-cells = <0>;
>                                 clocks = <&cmu_aud CLK_PCLK_AUD_I2S>,
> @@ -1457,7 +1466,7 @@
>                         serial_3: serial@11460000 {
>                                 compatible = "samsung,exynos5433-uart";
>                                 reg = <0x11460000 0x100>;
> -                               interrupts = <GIC_SPI 67 0>;
> +                               interrupts = <GIC_SPI 67 IRQ_TYPE_LEVEL_HIGH>;
>                                 clocks = <&cmu_aud CLK_PCLK_AUD_UART>,
>                                         <&cmu_aud CLK_SCLK_AUD_UART>;
>                                 clock-names = "uart", "clk_uart_baud0";
> --
> 1.9.1
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsung-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
