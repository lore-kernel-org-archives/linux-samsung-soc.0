From: Alim Akhtar <alim.akhtar@gmail.com>
Subject: Re: [PATCH V2] ARM: DTS: exynos5250-arndale: Add initial board
 support file
Date: Fri, 25 Jan 2013 10:59:27 +0530
Message-ID: <CAGOxZ50LiupEj0s2scMYZQiCA2V4GNT6zoUVYR7TMyEsX3sf-Q@mail.gmail.com>
References: <1359090411-26159-1-git-send-email-tushar.behera@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ob0-f177.google.com ([209.85.214.177]:57902 "EHLO
	mail-ob0-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751039Ab3AYFaH (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 25 Jan 2013 00:30:07 -0500
Received: by mail-ob0-f177.google.com with SMTP id wc20so9853594obb.22
        for <linux-samsung-soc@vger.kernel.org>; Thu, 24 Jan 2013 21:30:07 -0800 (PST)
In-Reply-To: <1359090411-26159-1-git-send-email-tushar.behera@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tushar Behera <tushar.behera@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, linux@arm.linux.org.uk, patches@linaro.org, Girish K S <ks.giri@samsung.com>

Hi Tushar,

On Fri, Jan 25, 2013 at 10:36 AM, Tushar Behera
<tushar.behera@linaro.org> wrote:
> From: Girish K S <ks.giri@samsung.com>
>
> Arndale is a low cost board based on the Samsung Exynos5250 SoC. This
> patch adds initial device tree support for this board.
>
> Signed-off-by: Girish K S <ks.giri@samsung.com>
> Signed-off-by: Tushar Behera <tushar.behera@linaro.org>
> ---
> Changes for V2:
>   * Addressed review comments from Sachin.
>   * Fixed GPIO numbers for dwmmc0 and dwmmc2.
>
>  arch/arm/boot/dts/Makefile               |    1 +
>  arch/arm/boot/dts/exynos5250-arndale.dts |  124 ++++++++++++++++++++++++++++++
>  2 files changed, 125 insertions(+), 0 deletions(-)
>  create mode 100644 arch/arm/boot/dts/exynos5250-arndale.dts
>
> diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
> index 5ebb44f..e21f27c 100644
> --- a/arch/arm/boot/dts/Makefile
> +++ b/arch/arm/boot/dts/Makefile
> @@ -43,6 +43,7 @@ dtb-$(CONFIG_ARCH_EXYNOS) += exynos4210-origen.dtb \
>         exynos4210-smdkv310.dtb \
>         exynos4210-trats.dtb \
>         exynos4412-smdk4412.dtb \
> +       exynos5250-arndale.dtb \
>         exynos5250-smdk5250.dtb \
>         exynos5250-snow.dtb \
>         exynos5440-ssdk5440.dtb
> diff --git a/arch/arm/boot/dts/exynos5250-arndale.dts b/arch/arm/boot/dts/exynos5250-arndale.dts
> new file mode 100644
> index 0000000..23ec841
> --- /dev/null
> +++ b/arch/arm/boot/dts/exynos5250-arndale.dts
> @@ -0,0 +1,124 @@
> +/*
> + * Samsung's Exynos5250 based Arndale board device tree source
> + *
> + * Copyright (c) 2013 Samsung Electronics Co., Ltd.
> + *             http://www.samsung.com
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> +*/
> +
> +/dts-v1/;
> +/include/ "exynos5250.dtsi"
> +
> +/ {
> +       model = "Insignal Arndale evaluation board based on EXYNOS5250";
> +       compatible = "insignal,arndale", "samsung,exynos5250";
> +
> +       memory {
> +               reg = <0x40000000 0x80000000>;
> +       };
> +
> +       chosen {
> +               bootargs = "console=ttySAC2,115200";
> +       };
> +
> +       i2c@12C60000 {
> +               status = "disabled";
> +       };
> +
> +       i2c@12C70000 {
> +               status = "disabled";
> +       };
> +
> +       i2c@12C80000 {
> +               status = "disabled";
> +       };
> +
> +       i2c@12C90000 {
> +               status = "disabled";
> +       };
> +
> +       i2c@12CA0000 {
> +               status = "disabled";
> +       };
> +
> +       i2c@12CB0000 {
> +               status = "disabled";
> +       };
> +
> +       i2c@12CC0000 {
> +               status = "disabled";
> +       };
> +
> +       i2c@12CD0000 {
> +               status = "disabled";
> +       };
> +
> +       i2c@121D0000 {
> +               status = "disabled";
> +       };
> +
> +       dwmmc_0: dwmmc0@12200000 {
> +               num-slots = <1>;
> +               supports-highspeed;
> +               broken-cd;
> +               fifo-depth = <0x80>;
> +               card-detect-delay = <200>;
> +               samsung,dw-mshc-ciu-div = <3>;
> +               samsung,dw-mshc-sdr-timing = <2 3>;
> +               samsung,dw-mshc-ddr-timing = <1 2>;
> +
> +               slot@0 {
> +                       reg = <0>;
> +                       bus-width = <8>;
> +                       gpios = <&gpc0 0 2 0 3>, <&gpc0 1 2 0 3>,
> +                               <&gpc0 3 2 3 3>, <&gpc0 4 2 3 3>,
> +                               <&gpc0 5 2 3 3>, <&gpc0 6 2 3 3>,
> +                               <&gpc1 0 2 3 3>, <&gpc1 1 2 3 3>,
> +                               <&gpc1 2 2 3 3>, <&gpc1 3 2 3 3>;
> +               };
> +       };
> +
> +       dwmmc_1: dwmmc1@12210000 {
> +               status = "disabled";
> +       };
> +
> +       dwmmc_2: dwmmc2@12220000 {
> +               num-slots = <1>;
> +               supports-highspeed;
> +               fifo-depth = <0x80>;
> +               card-detect-delay = <200>;
> +               samsung,dw-mshc-ciu-div = <3>;
> +               samsung,dw-mshc-sdr-timing = <2 3>;
> +               samsung,dw-mshc-ddr-timing = <1 2>;
> +
> +               slot@0 {
> +                       reg = <0>;
> +                       bus-width = <4>;
> +                       samsung,cd-pinmux-gpio = <&gpc3 2 2 3 3>;
> +                       gpios = <&gpc3 0 2 0 3>, <&gpc3 1 2 0 3>,
> +                               <&gpc3 3 2 3 3>, <&gpc3 4 2 3 3>,
> +                               <&gpc3 5 2 3 3>, <&gpc3 6 2 3 3>,
> +                               <&gpc4 3 3 3 3>, <&gpc4 4 3 3 3>,
> +                               <&gpc4 5 3 3 3>, <&gpc4 6 3 3 3>;
bus-width property is assigned as 4 (see above bus-width = <4>;) but
here you are configuring 8 __data line__ . Any reason?
I am not sure if Arndale board supports 8 bit bus-width, in any case
either change the bus-width or gpios properties accordingly.
> +               };
> +       };
> +
> +       dwmmc_3: dwmmc3@12230000 {
> +               status = "disabled";
> +       };
> +
> +       spi_0: spi@12d20000 {
> +               status = "disabled";
> +       };
> +
> +       spi_1: spi@12d30000 {
> +               status = "disabled";
> +       };
> +
> +       spi_2: spi@12d40000 {
> +               status = "disabled";
> +       };
> +};
> --
> 1.7.4.1

with the above fix fill free to add
   Reviewed-by: Alim Akhtar <alim.akhtar@samsung.com>


-- 
Regards,
Alim
