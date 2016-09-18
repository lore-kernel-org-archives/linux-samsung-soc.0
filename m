From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [RFC PATCH v2 1/2] ARM: dts: samsung: add rga-lvds panel in itop
 elite
Date: Sun, 18 Sep 2016 21:03:48 +0200
Message-ID: <20160918190348.GA5556@kozik-book>
References: <1474208859-10045-1-git-send-email-ayaka@soulik.info>
 <1474208859-10045-2-git-send-email-ayaka@soulik.info>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-lf0-f65.google.com ([209.85.215.65]:33128 "EHLO
        mail-lf0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755551AbcIRTDy (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sun, 18 Sep 2016 15:03:54 -0400
Content-Disposition: inline
In-Reply-To: <1474208859-10045-2-git-send-email-ayaka@soulik.info>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Randy Li <ayaka@soulik.info>
Cc: dri-devel@lists.freedesktop.org, linux@armlinux.org.uk, kgene@kernel.org, krzk@kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, thierry.reding@gmail.com, airlied@linux.ie, a.hajda@samsung.com, devicetree@vger.kernel.org

On Sun, Sep 18, 2016 at 10:27:38PM +0800, Randy Li wrote:
> It is actually a lvds panel connected through a rga-lvds bridge.
> The touchscreen is communicated with i2c bus but the driver is not
> support now.
> 
> Signed-off-by: Randy Li <ayaka@soulik.info>

Subject: ARM: dts: exynos

> ---
>  arch/arm/boot/dts/exynos4412-itop-elite.dts | 54 +++++++++++++++++++++++++++--
>  1 file changed, 52 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/exynos4412-itop-elite.dts b/arch/arm/boot/dts/exynos4412-itop-elite.dts
> index b08705e..9ef0505 100644
> --- a/arch/arm/boot/dts/exynos4412-itop-elite.dts
> +++ b/arch/arm/boot/dts/exynos4412-itop-elite.dts
> @@ -138,6 +138,36 @@
>  		assigned-clocks = <&clock CLK_MOUT_CAM0>;
>  		assigned-clock-parents = <&clock CLK_XUSBXTI>;
>  	};
> +
> +	vcc_sys_lcd: sys-lcd {

No underscores, use hyphens.

> +		compatible = "regulator-fixed";
> +		regulator-name = "vcc_5v";
> +		regulator-min-microvolt = <5000000>;
> +		regulator-max-microvolt = <5000000>;
> +		gpio = <&gpl0 4 GPIO_ACTIVE_HIGH>;

Isn't this one of S5M8767 PMIC regulators? If so, then it should be
defined there... On the other hand, the PMIC supports GPIO enable
control only for buck9...

> +	};
> +
> +	panel: panel@0 {
> +		compatible = "chunghwa,claa070wp03xg";
> +
> +		power-supply = <&vcc_sys_lcd>;
> +		enable-gpios = <&gpl0 2 GPIO_ACTIVE_HIGH>;
> +		backlight = <&bl>;
> +
> +		port {
> +			lcd_ep: endpoint {

lcd-ep

> +				remote-endpoint = <&rga_lvds>;
> +			};
> +		};
> +	};
> +
> +	bl: backlight {
> +		compatible = "pwm-backlight";
> +		pwms = <&pwm 1 5000000 PWM_POLARITY_INVERTED>;
> +		brightness-levels = <0 5 12 16 32 64 128 255>;
> +		default-brightness-level = <5>;
> +		power-supply = <&vcc_sys_lcd>;
> +	};
>  };
>  
>  &adc {
> @@ -215,9 +245,9 @@
>  
>  &pwm {
>  	status = "okay";
> -	pinctrl-0 = <&pwm0_out>;
> +	pinctrl-0 = <&pwm0_out &pwm1_out>;
>  	pinctrl-names = "default";
> -	samsung,pwm-outputs = <0>;
> +	samsung,pwm-outputs = <0>, <1>;
>  };
>  
>  &sdhci_2 {
> @@ -238,3 +268,23 @@
>  &serial_2 {
>  	status = "okay";
>  };
> +
> +&i2c_3 {
> +	status = "okay";
> +};
> +
> +&fimd {

Please put these nodes in alphabetical order. I asked about it for
initial DTS and it applies still.

> +	pinctrl-0 = <&lcd_clk &lcd_data24>;
> +	pinctrl-names = "default";
> +	status = "okay";
> +	ports {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +		port@3 {
> +			reg = <3>;
> +			rga_lvds: endpoint {

rga-lvds

Best regards,
Krzysztof

> +				remote-endpoint = <&lcd_ep>;
> +			};
> +		};
> +	};
> +};
> -- 
> 2.7.4
> 
