From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH] ARM: dts: exynos5422-odroidxu3: Add ramp delay for
 regulators
Date: Fri, 19 Jun 2015 08:52:51 +0900
Message-ID: <558359D3.9060201@samsung.com>
References: <1434628563-3477-1-git-send-email-linux.amoon@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:61329 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751818AbbFRXww (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 18 Jun 2015 19:52:52 -0400
In-reply-to: <1434628563-3477-1-git-send-email-linux.amoon@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Anand Moon <linux.amoon@gmail.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Russell King <linux@arm.linux.org.uk>, Kukjin Kim <kgene@kernel.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org

On 18.06.2015 20:56, Anand Moon wrote:
> Adds ramp delay for the vdd_ldo9, vdd_ldo13,
> vdd_ldo15 and vdd_sd regulator. Changes removes
> warning "ramp_delay not set" for all the above regulator.
> 
> Signed-off-by: Anand Moon <linux.amoon@gmail.com>
> ---
> Changes based on https://github.com/krzk/linux.git branch dt-for-next
> Console message:
> [    3.756440] vdd_ldo9: ramp_delay not set
> [    3.767731] vdd_ldo13: ramp_delay not set
> [    3.775260] vdd_ldo15: ramp_delay not set
> [    3.786269] vdd_sd: ramp_delay not set
> ---
>  arch/arm/boot/dts/exynos5422-odroidxu3-common.dtsi | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/exynos5422-odroidxu3-common.dtsi b/arch/arm/boot/dts/exynos5422-odroidxu3-common.dtsi
> index 1565667..7c97740 100644
> --- a/arch/arm/boot/dts/exynos5422-odroidxu3-common.dtsi
> +++ b/arch/arm/boot/dts/exynos5422-odroidxu3-common.dtsi
> @@ -218,6 +218,8 @@
>  				regulator-name = "vdd_ldo9";
>  				regulator-min-microvolt = <3000000>;
>  				regulator-max-microvolt = <3000000>;
> +				regulator-enable-ramp-delay = <200>;
> +				regulator-ramp-delay = <8000>;

How did you get this values?

Best regards,
Krzysztof

>  				regulator-always-on;
>  			};
>  
> @@ -246,6 +248,8 @@
>  				regulator-name = "vdd_ldo13";
>  				regulator-min-microvolt = <2800000>;
>  				regulator-max-microvolt = <2800000>;
> +				regulator-enable-ramp-delay = <200>;
> +				regulator-ramp-delay = <8000>;
>  				regulator-always-on;
>  			};
>  
> @@ -253,6 +257,8 @@
>  				regulator-name = "vdd_ldo15";
>  				regulator-min-microvolt = <3100000>;
>  				regulator-max-microvolt = <3100000>;
> +				regulator-enable-ramp-delay = <200>;
> +				regulator-ramp-delay = <8000>;
>  				regulator-always-on;
>  			};
>  
> @@ -274,6 +280,8 @@
>  				regulator-name = "vdd_sd";
>  				regulator-min-microvolt = <2800000>;
>  				regulator-max-microvolt = <2800000>;
> +				regulator-enable-ramp-delay = <200>;
> +				regulator-ramp-delay = <8000>;
>  				regulator-always-on;
>  			};
>  
> 
