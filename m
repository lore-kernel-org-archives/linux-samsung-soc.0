From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH V3] ARM: DTS: exynos5250-arndale: Add initial board support
 file
Date: Mon, 04 Feb 2013 16:18:29 -0800
Message-ID: <121b01ce0336$54e2a560$fea7f020$@samsung.com>
References: <1359107054-7177-1-git-send-email-tushar.behera@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:24923 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755345Ab3BEASo (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 4 Feb 2013 19:18:44 -0500
Received: from epcpsbgm1.samsung.com (epcpsbgm1 [203.254.230.26])
 by mailout1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MHQ006A00V64V60@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 05 Feb 2013 09:18:42 +0900 (KST)
Received: from visitor4lab ([105.128.18.157])
 by mmp2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0MHQ005YZ0V3ZQ40@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 05 Feb 2013 09:18:42 +0900 (KST)
In-reply-to: <1359107054-7177-1-git-send-email-tushar.behera@linaro.org>
Content-language: en-us
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Tushar Behera' <tushar.behera@linaro.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: linux@arm.linux.org.uk, patches@linaro.org, 'Girish K S' <ks.giri@samsung.com>

Tushar Behera wrote:
> 
> From: Girish K S <ks.giri@samsung.com>
> 
> Arndale is a low cost board based on the Samsung Exynos5250 SoC. This
> patch adds initial device tree support for this board.
> 
> Reviewed-by: Alim Akhtar <alim.akhtar@samsung.com>
> Signed-off-by: Girish K S <ks.giri@samsung.com>
> Signed-off-by: Tushar Behera <tushar.behera@linaro.org>
> ---
> Changes for V3:
>   * Removed unused GPIO lines for dwmmc2.
> 
> Changes for V2:
>   * Addressed review comments from Sachin.
>   * Fixed GPIO numbers for dwmmc0 and dwmmc2.
> 
>  arch/arm/boot/dts/Makefile               |    1 +
>  arch/arm/boot/dts/exynos5250-arndale.dts |  122
> ++++++++++++++++++++++++++++++
>  2 files changed, 123 insertions(+), 0 deletions(-)
>  create mode 100644 arch/arm/boot/dts/exynos5250-arndale.dts
> 
> diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
> index 5ebb44f..e21f27c 100644
> --- a/arch/arm/boot/dts/Makefile
> +++ b/arch/arm/boot/dts/Makefile
> @@ -43,6 +43,7 @@ dtb-$(CONFIG_ARCH_EXYNOS) += exynos4210-
> origen.dtb \
>  	exynos4210-smdkv310.dtb \
>  	exynos4210-trats.dtb \
>  	exynos4412-smdk4412.dtb \
> +	exynos5250-arndale.dtb \
>  	exynos5250-smdk5250.dtb \
>  	exynos5250-snow.dtb \
>  	exynos5440-ssdk5440.dtb
> diff --git a/arch/arm/boot/dts/exynos5250-arndale.dts
> b/arch/arm/boot/dts/exynos5250-arndale.dts
> new file mode 100644
> index 0000000..63572f9
> --- /dev/null
> +++ b/arch/arm/boot/dts/exynos5250-arndale.dts
> @@ -0,0 +1,122 @@
> +/*
> + * Samsung's Exynos5250 based Arndale board device tree source
> + *
> + * Copyright (c) 2013 Samsung Electronics Co., Ltd.
> + *		http://www.samsung.com
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
> +	model = "Insignal Arndale evaluation board based on EXYNOS5250";
> +	compatible = "insignal,arndale", "samsung,exynos5250";
> +
> +	memory {
> +		reg = <0x40000000 0x80000000>;
> +	};
> +
> +	chosen {
> +		bootargs = "console=ttySAC2,115200";
> +	};
> +
> +	i2c@12C60000 {
> +		status = "disabled";
> +	};
> +
> +	i2c@12C70000 {
> +		status = "disabled";
> +	};
> +
> +	i2c@12C80000 {
> +		status = "disabled";
> +	};
> +
> +	i2c@12C90000 {
> +		status = "disabled";
> +	};
> +
> +	i2c@12CA0000 {
> +		status = "disabled";
> +	};
> +
> +	i2c@12CB0000 {
> +		status = "disabled";
> +	};
> +
> +	i2c@12CC0000 {
> +		status = "disabled";
> +	};
> +
> +	i2c@12CD0000 {
> +		status = "disabled";
> +	};
> +
> +	i2c@121D0000 {
> +		status = "disabled";
> +	};
> +
> +	dwmmc_0: dwmmc0@12200000 {
> +		num-slots = <1>;
> +		supports-highspeed;
> +		broken-cd;
> +		fifo-depth = <0x80>;
> +		card-detect-delay = <200>;
> +		samsung,dw-mshc-ciu-div = <3>;
> +		samsung,dw-mshc-sdr-timing = <2 3>;
> +		samsung,dw-mshc-ddr-timing = <1 2>;
> +
> +		slot@0 {
> +			reg = <0>;
> +			bus-width = <8>;
> +			gpios = <&gpc0 0 2 0 3>, <&gpc0 1 2 0 3>,
> +				<&gpc0 3 2 3 3>, <&gpc0 4 2 3 3>,
> +				<&gpc0 5 2 3 3>, <&gpc0 6 2 3 3>,
> +				<&gpc1 0 2 3 3>, <&gpc1 1 2 3 3>,
> +				<&gpc1 2 2 3 3>, <&gpc1 3 2 3 3>;
> +		};
> +	};
> +
> +	dwmmc_1: dwmmc1@12210000 {
> +		status = "disabled";
> +	};
> +
> +	dwmmc_2: dwmmc2@12220000 {
> +		num-slots = <1>;
> +		supports-highspeed;
> +		fifo-depth = <0x80>;
> +		card-detect-delay = <200>;
> +		samsung,dw-mshc-ciu-div = <3>;
> +		samsung,dw-mshc-sdr-timing = <2 3>;
> +		samsung,dw-mshc-ddr-timing = <1 2>;
> +
> +		slot@0 {
> +			reg = <0>;
> +			bus-width = <4>;
> +			samsung,cd-pinmux-gpio = <&gpc3 2 2 3 3>;
> +			gpios = <&gpc3 0 2 0 3>, <&gpc3 1 2 0 3>,
> +				<&gpc3 3 2 3 3>, <&gpc3 4 2 3 3>,
> +				<&gpc3 5 2 3 3>, <&gpc3 6 2 3 3>;
> +		};
> +	};
> +
> +	dwmmc_3: dwmmc3@12230000 {
> +		status = "disabled";
> +	};
> +
> +	spi_0: spi@12d20000 {
> +		status = "disabled";
> +	};
> +
> +	spi_1: spi@12d30000 {
> +		status = "disabled";
> +	};
> +
> +	spi_2: spi@12d40000 {
> +		status = "disabled";
> +	};
> +};
> --
> 1.7.4.1

Looks OK to me, applied.

Thanks.

- Kukjin
