From: Tomasz Figa <t.figa@samsung.com>
Subject: Re: [PATCH] ARM: dts: Add atmel trackpad node to 5250 cros
Date: Thu, 24 Apr 2014 18:57:27 +0200
Message-ID: <53594277.50401@samsung.com>
References: <1397457325-5054-1-git-send-email-arun.kk@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:55988 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754398AbaDXQ5f (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 24 Apr 2014 12:57:35 -0400
Received: from eucpsbgm1.samsung.com (unknown [203.254.199.244])
 by mailout2.w1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0N4J000SCOFOCFB0@mailout2.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 24 Apr 2014 17:57:24 +0100 (BST)
In-reply-to: <1397457325-5054-1-git-send-email-arun.kk@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Arun Kumar K <arun.kk@samsung.com>, linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org
Cc: kgene.kim@samsung.com, arunkk.samsung@gmail.com

Hi Arun,

On 14.04.2014 08:35, Arun Kumar K wrote:
> The newer versions of exynos5250 based Snow boards have
> atmel trackpad. Updating relevant nodes for the same.
>
> Signed-off-by: Arun Kumar K <arun.kk@samsung.com>
> ---
>   arch/arm/boot/dts/exynos5250-cros-common.dtsi |   24 ++++++++++++++++++++++++
>   1 file changed, 24 insertions(+)
>
> diff --git a/arch/arm/boot/dts/exynos5250-cros-common.dtsi b/arch/arm/boot/dts/exynos5250-cros-common.dtsi
> index 2c1560d..658f086 100644
> --- a/arch/arm/boot/dts/exynos5250-cros-common.dtsi
> +++ b/arch/arm/boot/dts/exynos5250-cros-common.dtsi
> @@ -28,6 +28,13 @@
>   			samsung,pin-pud = <0>;
>   		};
>
> +		trackpad_irq: trackpad-irq {
> +			samsung,pins = "gpx1-2";
> +			samsung,pin-function = <0>;
> +			samsung,pin-pud = <0>;
> +			samsung,pin-drv = <0>;
> +		};
> +
>   		max77686_irq: max77686-irq {
>   			samsung,pins = "gpx3-2";
>   			samsung,pin-function = <0>;
> @@ -191,6 +198,9 @@
>   		samsung,i2c-sda-delay = <100>;
>   		samsung,i2c-max-bus-freq = <378000>;
>
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&i2c1_bus &trackpad_irq>;

Please add &trackpad_irq to trackpad node instead. Pinctrl properties of 
i2c node should contain only i2c-related pins.

> +
>   		trackpad {
>   			reg = <0x67>;
>   			compatible = "cypress,cyapa";
> @@ -198,6 +208,20 @@
>   			interrupt-parent = <&gpx1>;
>   			wakeup-source;
>   		};
> +		trackpad-alt {

Style: Please keep one blank line between two nodes.

> +			reg = <0x4b>;
> +			compatible = "atmel,atmel_mxt_tp";
> +			interrupts = <2 0>;
> +			interrupt-parent = <&gpx1>;
> +			wakeup-source;
> +		};
> +		trackpad-bootloader {

Ditto.

> +			reg = <0x25>;
> +			compatible = "atmel,atmel_mxt_tp";
> +			interrupts = <2 0>;
> +			interrupt-parent = <&gpx1>;
> +			wakeup-source;
> +		};

Hmm, why are there 3 different nodes here? Could you explain what one by 
one for what hardware they are?

Best regards,
Tomasz
