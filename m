From: Tomasz Figa <t.figa@samsung.com>
Subject: Re: [PATCH] ARM: dts: Correct typo in use of samsung,pin-drv for
 exynos5250
Date: Mon, 09 Sep 2013 11:00:30 +0200
Message-ID: <6027618.yAIjZoXqyG@amdc1227>
References: <1378498192-5163-1-git-send-email-al.stone@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:10725 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751646Ab3IIJAf (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 9 Sep 2013 05:00:35 -0400
Received: from eucpsbgm1.samsung.com (unknown [203.254.199.244])
 by mailout1.w1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MSU005PJOZCX240@mailout1.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 09 Sep 2013 10:00:34 +0100 (BST)
In-reply-to: <1378498192-5163-1-git-send-email-al.stone@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: al.stone@linaro.org
Cc: linux-samsung-soc@vger.kernel.org, linaro-kernel@lists.linaro.org, linaro-acpi@lists.linaro.org, Al Stone <ahs3@redhat.com>

Hi Al,

On Friday 06 of September 2013 14:09:52 al.stone@linaro.org wrote:
> From: Al Stone <ahs3@redhat.com>
> 
>    Corrects an obvious typo in the Arndale pinctrl descriptions in DT.
>    The samsung-pinctrl driver uses the correct name.

Thanks for spotting this. The patch looks good to me, but is it tested on 
some Exynos 5250 based board?

With this typo activating configuration of these pinctrl groups just kept 
pin-drv at default value, as set up by bootloader, while after this patch 
it will be reconfigured with new values.

I'll try to test this patch on an Arndale later today.

Best regards,
Tomasz

> Signed-off-by: Al Stone <al.stone@linaro.org>
> ---
>  arch/arm/boot/dts/exynos5250-pinctrl.dtsi | 44
> +++++++++++++++---------------- 1 file changed, 22 insertions(+), 22
> deletions(-)
> 
> diff --git a/arch/arm/boot/dts/exynos5250-pinctrl.dtsi
> b/arch/arm/boot/dts/exynos5250-pinctrl.dtsi index 656e381..031e198
> 100644
> --- a/arch/arm/boot/dts/exynos5250-pinctrl.dtsi
> +++ b/arch/arm/boot/dts/exynos5250-pinctrl.dtsi
> @@ -210,21 +210,21 @@
>  			samsung,pins = "gpa0-2", "gpa0-3";
>  			samsung,pin-function = <2>;
>  			samsung,pin-pud = <0>;
> -			samaung,pin-drv = <0>;
> +			samsung,pin-drv = <0>;
>  		};
> 
>  		i2c2_bus: i2c2-bus {
>  			samsung,pins = "gpa0-6", "gpa0-7";
>  			samsung,pin-function = <3>;
>  			samsung,pin-pud = <3>;
> -			samaung,pin-drv = <0>;
> +			samsung,pin-drv = <0>;
>  		};
> 
>  		i2c2_hs_bus: i2c2-hs-bus {
>  			samsung,pins = "gpa0-6", "gpa0-7";
>  			samsung,pin-function = <4>;
>  			samsung,pin-pud = <3>;
> -			samaung,pin-drv = <0>;
> +			samsung,pin-drv = <0>;
>  		};
> 
>  		uart2_data: uart2-data {
> @@ -238,21 +238,21 @@
>  			samsung,pins = "gpa1-2", "gpa1-3";
>  			samsung,pin-function = <2>;
>  			samsung,pin-pud = <0>;
> -			samaung,pin-drv = <0>;
> +			samsung,pin-drv = <0>;
>  		};
> 
>  		i2c3_bus: i2c3-bus {
>  			samsung,pins = "gpa1-2", "gpa1-3";
>  			samsung,pin-function = <3>;
>  			samsung,pin-pud = <3>;
> -			samaung,pin-drv = <0>;
> +			samsung,pin-drv = <0>;
>  		};
> 
>  		i2c3_hs_bus: i2c3-hs-bus {
>  			samsung,pins = "gpa1-2", "gpa1-3";
>  			samsung,pin-function = <4>;
>  			samsung,pin-pud = <3>;
> -			samaung,pin-drv = <0>;
> +			samsung,pin-drv = <0>;
>  		};
> 
>  		uart3_data: uart3-data {
> @@ -273,14 +273,14 @@
>  			samsung,pins = "gpa2-0", "gpa2-1";
>  			samsung,pin-function = <3>;
>  			samsung,pin-pud = <3>;
> -			samaung,pin-drv = <0>;
> +			samsung,pin-drv = <0>;
>  		};
> 
>  		i2c5_bus: i2c5-bus {
>  			samsung,pins = "gpa2-2", "gpa2-3";
>  			samsung,pin-function = <3>;
>  			samsung,pin-pud = <3>;
> -			samaung,pin-drv = <0>;
> +			samsung,pin-drv = <0>;
>  		};
> 
>  		spi1_bus: spi1-bus {
> @@ -376,14 +376,14 @@
>  			samsung,pins = "gpb3-0", "gpb3-1";
>  			samsung,pin-function = <4>;
>  			samsung,pin-pud = <3>;
> -			samaung,pin-drv = <0>;
> +			samsung,pin-drv = <0>;
>  		};
> 
>  		i2c1_hs_bus: i2c1-hs-bus {
>  			samsung,pins = "gpb3-2", "gpb3-3";
>  			samsung,pin-function = <4>;
>  			samsung,pin-pud = <3>;
> -			samaung,pin-drv = <0>;
> +			samsung,pin-drv = <0>;
>  		};
> 
>  		sd0_clk: sd0-clk {
> @@ -551,14 +551,14 @@
>  			samsung,pins = "gpd0-2", "gpd0-3";
>  			samsung,pin-function = <2>;
>  			samsung,pin-pud = <0>;
> -			samaung,pin-drv = <0>;
> +			samsung,pin-drv = <0>;
>  		};
> 
>  		dp_hpd: dp_hpd {
>  			samsung,pins = "gpx0-7";
>  			samsung,pin-function = <3>;
>  			samsung,pin-pud = <0>;
> -			samaung,pin-drv = <0>;
> +			samsung,pin-drv = <0>;
>  		};
>  	};
> 
> @@ -650,42 +650,42 @@
>  				       "gpf1-0", "gpf1-1", "gpf1-2", "gpf1-3";
>  			samsung,pin-function = <3>;
>  			samsung,pin-pud = <0>;
> -			samaung,pin-drv = <0>;
> +			samsung,pin-drv = <0>;
>  		};
> 
>  		cam_i2c2_bus: cam-i2c2-bus {
>  			samsung,pins = "gpe0-6", "gpe1-0";
>  			samsung,pin-function = <4>;
>  			samsung,pin-pud = <3>;
> -			samaung,pin-drv = <0>;
> +			samsung,pin-drv = <0>;
>  		};
> 
>  		cam_spi1_bus: cam-spi1-bus {
>  			samsung,pins = "gpe0-4", "gpe0-5", "gpf0-2", "gpf0-3";
>  			samsung,pin-function = <4>;
>  			samsung,pin-pud = <0>;
> -			samaung,pin-drv = <0>;
> +			samsung,pin-drv = <0>;
>  		};
> 
>  		cam_i2c1_bus: cam-i2c1-bus {
>  			samsung,pins = "gpf0-2", "gpf0-3";
>  			samsung,pin-function = <2>;
>  			samsung,pin-pud = <3>;
> -			samaung,pin-drv = <0>;
> +			samsung,pin-drv = <0>;
>  		};
> 
>  		cam_i2c0_bus: cam-i2c0-bus {
>  			samsung,pins = "gpf0-0", "gpf0-1";
>  			samsung,pin-function = <2>;
>  			samsung,pin-pud = <3>;
> -			samaung,pin-drv = <0>;
> +			samsung,pin-drv = <0>;
>  		};
> 
>  		cam_spi0_bus: cam-spi0-bus {
>  			samsung,pins = "gpf1-0", "gpf1-1", "gpf1-2", "gpf1-3";
>  			samsung,pin-function = <2>;
>  			samsung,pin-pud = <0>;
> -			samaung,pin-drv = <0>;
> +			samsung,pin-drv = <0>;
>  		};
> 
>  		cam_bayrgb_bus: cam-bayrgb-bus {
> @@ -696,7 +696,7 @@
>  				       "gpg2-0", "gpg2-1";
>  			samsung,pin-function = <2>;
>  			samsung,pin-pud = <0>;
> -			samaung,pin-drv = <0>;
> +			samsung,pin-drv = <0>;
>  		};
> 
>  		cam_port_a: cam-port-a {
> @@ -705,7 +705,7 @@
>  				       "gph1-4", "gph1-5", "gph1-6", "gph1-7";
>  			samsung,pin-function = <2>;
>  			samsung,pin-pud = <0>;
> -			samaung,pin-drv = <0>;
> +			samsung,pin-drv = <0>;
>  		};
>  	};
> 
> @@ -757,7 +757,7 @@
>  				       "gpv1-4", "gpv1-5", "gpv1-6", "gpv1-7";
>  			samsung,pin-function = <2>;
>  			samsung,pin-pud = <0>;
> -			samaung,pin-drv = <0>;
> +			samsung,pin-drv = <0>;
>  		};
> 
>  		c2c_txd: c2c-txd {
> @@ -767,7 +767,7 @@
>  				       "gpv3-4", "gpv3-5", "gpv3-6", "gpv3-7";
>  			samsung,pin-function = <2>;
>  			samsung,pin-pud = <0>;
> -			samaung,pin-drv = <0>;
> +			samsung,pin-drv = <0>;
>  		};
>  	};
