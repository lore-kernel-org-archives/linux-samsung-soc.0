From: Kukjin Kim <kgene@kernel.org>
Subject: Re: [RESEND] [PATCH 1/1] ARM: dts: Add LEDs on odroid XU3 board
Date: Sat, 09 May 2015 03:59:34 +0900
Message-ID: <554D0796.3010702@kernel.org>
References: <554C66F4.4070005@fivetechno.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.136]:50812 "EHLO mail.kernel.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S932081AbbEHS7k (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 8 May 2015 14:59:40 -0400
In-Reply-To: <554C66F4.4070005@fivetechno.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: m.reichl@fivetechno.de
Cc: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Anand Moon <linux.amoon@gmail.com>

On 05/08/15 16:34, Markus Reichl wrote:
> This patch adds the RGB-LED on XU3 as 3 gpio-leds.
> 
> Tested-by: Anand Moon <linux.amoon@gmail.com>
> Signed-off-by: Markus Reichl <m.reichl@fivetechno.de>
> ---
> It is derived from hardkernel's 3.10 tree.
> ---
>  arch/arm/boot/dts/exynos5422-odroidxu3.dts | 24 ++++++++++++++++++++++++
>  1 file changed, 24 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/exynos5422-odroidxu3.dts b/arch/arm/boot/dts/exynos5422-odroidxu3.dts
> index a519c86..0a32302 100644
> --- a/arch/arm/boot/dts/exynos5422-odroidxu3.dts
> +++ b/arch/arm/boot/dts/exynos5422-odroidxu3.dts
> @@ -278,6 +278,30 @@
>  	rtc@101E0000 {
>  		status = "okay";
>  	};
> +
> +	leds {
> +		compatible = "gpio-leds";
> +		heartbeat {
> +			label = "blue:heartbeart";
> +			gpios = <&gpb2 2 0>;
> +			default-state = "off";
> +			linux,default-trigger = "heartbeat";
> +		};
> +
> +		eMMC {
> +			label = "green:eMMC";
> +			gpios = <&gpb2 1 0>;
> +			default-state = "off";
> +			linux,default-trigger = "mmc0";
> +		};
> +
> +		microSD {
> +			label = "red:microSD";
> +			gpios = <&gpx2 3 0>;
> +			default-state = "off";
> +			linux,default-trigger = "mmc1";
> +		};
> +	};
>  };
>  
>  &hdmi {

Applied, thanks.

- Kukjin
