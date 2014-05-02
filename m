From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [PATCH v2 2/3] ARM: dts: add cm36651 light/proximity sensor node
Date: Fri, 02 May 2014 20:06:17 +0200
Message-ID: <5363DE99.1090602@gmail.com>
References: <53633D43.5050506@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qg0-f47.google.com ([209.85.192.47]:46038 "EHLO
	mail-qg0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750813AbaEBSGT (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 2 May 2014 14:06:19 -0400
In-Reply-To: <53633D43.5050506@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Beomho Seo <beomho.seo@samsung.com>, linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, Tomasz Figa <t.figa@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>
Cc: Myungjoo Ham <myungjoo.ham@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Jaehoon Chung <jh80.chung@samsung.com>

Hi Beomho,

On 02.05.2014 08:37, Beomho Seo wrote:
> Exynos4412-trats2 board have light/proximity sensor.
> This patch add cm36651 light/ proximity sensor node for exynos4412.
> cm36651 is required properties as below.
> - Use i2c-gpio for cm36651 sensor.
> - Use fixed regulator for the IR LED.
>    It is a part of the cm36651 for proximity detection.
> - cm36651 is i2c device driver so need to use i2c-gpio driver.
>
> Signed-off-by: Beomho Seo <beomho.seo@samsung.com>
> Signed-off-by: MyungJoo Ham <myungjoo.ham@samsung.com>
> ---
> Changes in v2:
> - Compatible is changed according to device tree binding document and driver.
> ---
>   arch/arm/boot/dts/exynos4412-trats2.dts |   26 ++++++++++++++++++++++++++
>   1 file changed, 26 insertions(+)
>
> diff --git a/arch/arm/boot/dts/exynos4412-trats2.dts b/arch/arm/boot/dts/exynos4412-trats2.dts
> index 1279a8a..d599215 100644
> --- a/arch/arm/boot/dts/exynos4412-trats2.dts
> +++ b/arch/arm/boot/dts/exynos4412-trats2.dts
> @@ -21,6 +21,7 @@
>
>   	aliases {
>   		i2c8 = &i2c_ak8975;
> +		i2c9 = &i2c_cm36651;
>   	};
>
>   	memory {
> @@ -71,6 +72,14 @@
>   			enable-active-high;
>   		};
>
> +		ps_als_reg: voltage-regulator-2 {
> +			compatible = "regulator-fixed";
> +			regulator-name = "LED_A_3.0V";
> +			regulator-min-microvolt = <3000000>;
> +			regulator-max-microvolt = <3000000>;
> +			gpio = <&gpj0 5 0>;
> +			enable-active-high;
> +		};
>   		/* More to come */
>   	};
>
> @@ -500,6 +509,23 @@
>   		};
>   	};
>
> +	i2c_cm36651: i2c-gpio-2 {
> +		compatible = "i2c-gpio";
> +		gpios = <&gpf0 0 0>, <&gpf0 1 0>;
> +		i2c-gpio,delay-us = <2>;
> +		#address-cells = <1>;
> +		#size-cells = <0>;

Shouldn't you also have pinctrl settings for both pins specified here, 
at least to disable pull-down that is active by default after SoC reset?

> +		status = "okay";
> +
> +		cm36651@18 {
> +			compatible = "capella,cm36651";
> +			reg = <0x18>;
> +			interrupt-parent = <&gpx0>;
> +			interrupts = <2 0>;

Same here. What kind of signal driver does the interrupt pin of CM36651 
chip have? The most common are normal and open-drain drivers, so I 
suspect that the default pull-down on the pin is not correct.

Also I'd say that you should specify some kind of default trigger here, 
instead of simply using 0 as the second cell in interrupt specifier. How 
does the CM36651 chip trigger an interrupt (level or edge, which polarity)?

Best regards,
Tomasz
