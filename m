From: Kukjin Kim <kgene@kernel.org>
Subject: Re: [PATCH RESEND 1/4] ARM: dts: Add power and lid GPIO keys pinctrl
 for exynos5250-snow
Date: Thu, 15 Jan 2015 00:17:58 +0900
Message-ID: <54B688A6.9090902@kernel.org>
References: <1420212257-22443-1-git-send-email-javier.martinez@collabora.co.uk> <1420212257-22443-2-git-send-email-javier.martinez@collabora.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.136]:45057 "EHLO mail.kernel.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751004AbbANPSJ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 14 Jan 2015 10:18:09 -0500
In-Reply-To: <1420212257-22443-2-git-send-email-javier.martinez@collabora.co.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Cc: Kukjin Kim <kgene.kim@samsung.com>, linux-samsung-soc@vger.kernel.org, Doug Anderson <dianders@chromium.org>, linux-kernel@vger.kernel.org, Kevin Hilman <khilman@linaro.org>, Olof Johansson <olof@lixom.net>, linux-arm-kernel@lists.infradead.org

On 01/03/15 00:24, Javier Martinez Canillas wrote:
> The Exynos5250 Snow Chromebook has GPIO keys for power and lid
> so the SoC I/O pins have to be configured in external interrupt
> mode. Currently, this is working without setting the pinctrl
> lines but is better to set it explicitly instead of relying on
> the previous state of the I/O pins.
> 
> The DTS snippets were taken from the downstream ChromeOS tree.
> 
> Signed-off-by: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
> ---
>  arch/arm/boot/dts/exynos5250-snow.dts | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/exynos5250-snow.dts b/arch/arm/boot/dts/exynos5250-snow.dts
> index effaf2a..b9aeec4 100644
> --- a/arch/arm/boot/dts/exynos5250-snow.dts
> +++ b/arch/arm/boot/dts/exynos5250-snow.dts
> @@ -33,6 +33,8 @@
>  
>  	gpio-keys {
>  		compatible = "gpio-keys";
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&power_key_irq &lid_irq>;
>  
>  		power {
>  			label = "Power";
> @@ -540,6 +542,13 @@
>  };
>  
>  &pinctrl_0 {
> +	power_key_irq: power-key-irq {
> +		samsung,pins = "gpx1-3";
> +		samsung,pin-function = <0xf>;

I think, this setting should be same with exynos5250-spring but different.

from: arch/arm/boot/dts/exynos5250-spring.dts
491         power_key_irq: power-key-irq {
492                 samsung,pins = "gpx1-3";
493                 samsung,pin-function = <0>;
494                 samsung,pin-pud = <0>;
495                 samsung,pin-drv = <0>;
496         };

Hmm...0xf should be correct so need to fix the spring DT?

> +		samsung,pin-pud = <0>;
> +		samsung,pin-drv = <0>;
> +	};
> +
>  	ec_irq: ec-irq {
>  		samsung,pins = "gpx1-6";
>  		samsung,pin-function = <0>;
> @@ -575,6 +584,13 @@
>  		samsung,pin-drv = <0>;
>  	};
>  
> +	lid_irq: lid-irq {
> +		samsung,pins = "gpx3-5";
> +		samsung,pin-function = <0xf>;

Same as above.

> +		samsung,pin-pud = <0>;
> +		samsung,pin-drv = <0>;
> +	};
> +
>  	hdmi_hpd_irq: hdmi-hpd-irq {
>  		samsung,pins = "gpx3-7";
>  		samsung,pin-function = <0>;

Thanks,
Kukjin
