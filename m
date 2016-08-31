From: Andrzej Hajda <a.hajda@samsung.com>
Subject: Re: [PATCH RFC] ARM: dts: samsung: add rga-lvds panel in itop elite
Date: Wed, 31 Aug 2016 14:30:39 +0200
Message-ID: <dee989f5-17b0-7445-514b-559e98d77acd@samsung.com>
References: <1472511002-9019-1-git-send-email-ayaka@soulik.info>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:37346 "EHLO
        mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932516AbcHaMap (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 31 Aug 2016 08:30:45 -0400
In-reply-to: <1472511002-9019-1-git-send-email-ayaka@soulik.info>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Randy Li <ayaka@soulik.info>, devicetree@vger.kernel.org
Cc: mark.rutland@arm.com, linux-samsung-soc@vger.kernel.org, linux@armlinux.org.uk, krzk@kernel.org, linux-kernel@vger.kernel.org, kyungmin.park@samsung.com, kgene@kernel.org, dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org

Hi,


On 08/30/2016 12:50 AM, Randy Li wrote:
> It is actually a lvds panel connected through a rga-lvds bridge.
> But I really have no idea about what does a port mean in fimd node.
>
> Also how should I configure this panel size? I think the i2c found
> on the panel schematic, but it more likely to be used a touch screen
> touth. Also the touch screen is not supported in currently driver.
>
> Signed-off-by: Randy Li <ayaka@soulik.info>
> ---
>  arch/arm/boot/dts/exynos4412-itop-elite.dts | 35 ++++++++++++++++++++++++++---
>  1 file changed, 32 insertions(+), 3 deletions(-)
>
> diff --git a/arch/arm/boot/dts/exynos4412-itop-elite.dts b/arch/arm/boot/dts/exynos4412-itop-elite.dts
> index e1cda54..2d67385 100644
> --- a/arch/arm/boot/dts/exynos4412-itop-elite.dts
> +++ b/arch/arm/boot/dts/exynos4412-itop-elite.dts
> @@ -139,6 +139,20 @@
>  		assigned-clocks = <&clock CLK_MOUT_CAM0>;
>  		assigned-clock-parents = <&clock CLK_XUSBXTI>;
>  	};
> +	
> +	vcc_sys_lcd: sys-lcd {
> +		compatible = "regulator-fixed";
> +		regulator-name = "vcc_5v";
> +		regulator-min-microvolt = <5000000>;
> +		regulator-max-microvolt = <5000000>;
> +		gpio = <&gpl0 4 GPIO_ACTIVE_HIGH>;
> +	};
> +
> +	panel: panel {
> +		ddc-i2c-bus = <&i2c_3>;
> +		power-supply = <&vcc_sys_lcd>;
> +		enable-gpios = <&gpl0 2 GPIO_ACTIVE_HIGH>;
> +	};

Panel has no compatible string, which driver will handle this node?

Regards
Andrzej

>  };
>  
>  &pinctrl_1 {
> @@ -221,9 +235,6 @@
>  };
>  
>  &pwm {
> -	pinctrl-0 = <&pwm1_out>;
> -	pinctrl-names = "default";
> -	samsung,pwm-outputs = <1>;
>  	status = "okay";
>  };
>  
> @@ -239,3 +250,21 @@
>  	assigned-clock-parents = <&clock CLK_MOUT_MPLL_USER_T>;
>  	assigned-clock-rates = <0>, <176000000>;
>  };
> +
> +&i2c_3 {
> +	status = "okay";
> +};
> +
> +&fimd {
> +	pinctrl-0 = <&lcd_clk &lcd_data24 &pwm1_out>;
> +	pinctrl-names = "default";
> +	status = "okay";
> +	#address-cells = <1>;
> +	#size-cells = <0>;
> +	port@0 {
> +		reg = <0>;
> +		rga_lvds: endpoint {
> +			remote-endpoint = <&panel>;
> +		};
> +	};
> +};
