From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v4 2/2] ARM: dts: exynos: Add HDMI and Sil9234 to Trats2
 board
Date: Sun, 17 Sep 2017 09:43:22 +0200
Message-ID: <20170917074322.GA27936@kozik-book>
References: <1505201648-9240-1-git-send-email-m.purski@samsung.com>
 <CGME20170912073505eucas1p2e4fb706c97e406a0f46282af66e8f90c@eucas1p2.samsung.com>
 <1505201648-9240-3-git-send-email-m.purski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wm0-f65.google.com ([74.125.82.65]:34421 "EHLO
        mail-wm0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750761AbdIQHn1 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sun, 17 Sep 2017 03:43:27 -0400
Content-Disposition: inline
In-Reply-To: <1505201648-9240-3-git-send-email-m.purski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Maciej Purski <m.purski@samsung.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, airlied@linux.ie, robh+dt@kernel.org, mark.rutland@arm.com, architt@codeaurora.org, a.hajda@samsung.com, Laurent.pinchart@ideasonboard.com, b.zolnierkie@samsung.com, m.szyprowski@samsung.com

On Tue, Sep 12, 2017 at 09:34:08AM +0200, Maciej Purski wrote:
> Add HDMI and Sil9234 MHL converter to Trats2 board.
> Following in SoC devices have been enabled:
> - HDMI (HDMI signal encoder),
> - Mixer (video buffer scanout device),
> - I2C_5 bus (used for HDMI DDC)
> - I2C_8 bus (used for HDMI_PHY control).
> 
> Based on previous work by:
> Tomasz Stanislawski <t.stanislaws@samsung.com>
> 
> Signed-off-by: Maciej Purski <m.purski@samsung.com>
> ---
>  arch/arm/boot/dts/exynos4412-trats2.dts | 112 ++++++++++++++++++++++++++++++++
>  1 file changed, 112 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/exynos4412-trats2.dts b/arch/arm/boot/dts/exynos4412-trats2.dts
> index 35e9b94..742e02a 100644
> --- a/arch/arm/boot/dts/exynos4412-trats2.dts
> +++ b/arch/arm/boot/dts/exynos4412-trats2.dts
> @@ -18,6 +18,7 @@
>  #include <dt-bindings/gpio/gpio.h>
>  #include <dt-bindings/interrupt-controller/irq.h>
>  #include <dt-bindings/clock/maxim,max77686.h>
> +#include <dt-bindings/pinctrl/samsung.h>
>  
>  / {
>  	model = "Samsung Trats 2 based on Exynos4412";
> @@ -97,6 +98,34 @@
>  			gpio = <&gpj0 5 GPIO_ACTIVE_HIGH>;
>  			enable-active-high;
>  		};
> +
> +		vsil12: voltage-regulator-6 {
> +			compatible = "regulator-fixed";
> +			regulator-name = "VSIL_1.2V";
> +			regulator-min-microvolt = <1200000>;
> +			regulator-max-microvolt = <1200000>;
> +			gpio = <&gpl0 4 GPIO_ACTIVE_HIGH>;
> +			enable-active-high;
> +			vin-supply = <&buck7_reg>;
> +		};
> +
> +		vcc33mhl: voltage-regulator-7 {
> +			compatible = "regulator-fixed";
> +			regulator-name = "VCC_3.3_MHL";
> +			regulator-min-microvolt = <3300000>;
> +			regulator-max-microvolt = <3300000>;
> +			gpio = <&gpl0 4 GPIO_ACTIVE_HIGH>;
> +			enable-active-high;
> +		};
> +
> +		vcc18mhl: voltage-regulator-8 {
> +			compatible = "regulator-fixed";
> +			regulator-name = "VCC_1.8_MHL";
> +			regulator-min-microvolt = <1800000>;
> +			regulator-max-microvolt = <1800000>;
> +			gpio = <&gpl0 4 GPIO_ACTIVE_HIGH>;
> +			enable-active-high;
> +		};
>  	};
>  
>  	gpio-keys {
> @@ -229,6 +258,36 @@
>  		};
>  	};
>  
> +	i2c-mhl {
> +		compatible = "i2c-gpio";
> +		gpios = <&gpf0 4 GPIO_ACTIVE_HIGH &gpf0 6 GPIO_ACTIVE_HIGH>;

Please split it like in other nodes:
	gpios = <...>, <...>

AFAIR they should work the same so keep it consistent.

Rest looks good but the bindings have to be accepted first.

Best regards,
Krzysztof
