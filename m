From: Tomasz Figa <t.figa@samsung.com>
Subject: Re: [PATCH 1/2] ARM: dts: Enable USB 3503 hub on exynos5250-snow
Date: Thu, 08 May 2014 18:07:09 +0200
Message-ID: <536BABAD.5030605@samsung.com>
References: <1399293056-17143-1-git-send-email-gautam.vivek@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:33568 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753343AbaEHQHO (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 8 May 2014 12:07:14 -0400
In-reply-to: <1399293056-17143-1-git-send-email-gautam.vivek@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Vivek Gautam <gautam.vivek@samsung.com>, linux-usb@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kgene.kim@samsung.com, arunkk.samsung@gmail.com

Hi Vivek,

On 05.05.2014 14:30, Vivek Gautam wrote:
> The exynos5250-snow has a SMSC USB3503 connected in
> hardware only mode like a PHY. Enable support for it,
> and add necessary 'reset-gpio' for it.
> 
> This is in correspondance to similar patch by Mark Brown
> 7c1b0ec ARM: dts: Enable USB hub on Arndale
> 
> Signed-off-by: Vivek Gautam <gautam.vivek@samsung.com>
> ---
> 
> Based on 'for-next' branch of kgene's linux-samsung tree.
> 
>  arch/arm/boot/dts/exynos5250-pinctrl.dtsi |    7 +++++++
>  arch/arm/boot/dts/exynos5250-snow.dts     |   14 ++++++++++++++
>  2 files changed, 21 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/exynos5250-pinctrl.dtsi b/arch/arm/boot/dts/exynos5250-pinctrl.dtsi
> index 9a49e68..bd8c8f1 100644
> --- a/arch/arm/boot/dts/exynos5250-pinctrl.dtsi
> +++ b/arch/arm/boot/dts/exynos5250-pinctrl.dtsi
> @@ -706,6 +706,13 @@
>  			samsung,pin-pud = <0>;
>  			samsung,pin-drv = <0>;
>  		};
> +
> +		usb_hub_reset: usb-hub-reset {
> +			samsung,pins = "gpe1-0";
> +			samsung,pin-function = <1>;
> +			samsung,pin-pud = <0>;
> +			samsung,pin-drv = <0>;
> +		};

This is not a generic pin config group and should not be added to this
file. Btw. it just sets the pin to output, which is what the consumer
driver can do as well by calling gpio_direction_output. Do you really
need this?

>  	};
>  
>  	pinctrl@10d10000 {
> diff --git a/arch/arm/boot/dts/exynos5250-snow.dts b/arch/arm/boot/dts/exynos5250-snow.dts
> index 1ce1088..2e48f27 100644
> --- a/arch/arm/boot/dts/exynos5250-snow.dts
> +++ b/arch/arm/boot/dts/exynos5250-snow.dts
> @@ -200,6 +200,20 @@
>  		samsung,vbus-gpio = <&gpx1 1 0>;
>  	};
>  
> +	usb_hub_bus {
> +		compatible = "simple-bus";
> +		#address-cells = <1>;
> +		#size-cells = <0>;

Why do you need this bus?

> +
> +		// SMSC USB3503 connected in hardware only mode as a PHY

Wrong comment style. Also basically the comment says exactly the same as
could be inferred from the node below.

> +		usb_hub {
> +			compatible = "smsc,usb3503a";
> +			reset-gpios = <&gpe1 0 1>;
> +			pinctrl-0 = <&usb_hub_reset>;
> +			pinctrl-names = "default";

As above, do you really need to use pinctrl here?

I believe the same comments apply for patch 2/2 as well.

Best regards,
Tomasz
