From: Kukjin Kim <kgene.kim@samsung.com>
Subject: Re: [PATCH 1/1] ARM: dts: Add fixed voltage regulators to Exynos5420
 SMDK board
Date: Mon, 24 Feb 2014 09:23:26 +0900
Message-ID: <530A90FE.2000503@samsung.com>
References: <1391669805-1216-1-git-send-email-sachin.kamat@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f47.google.com ([209.85.220.47]:63825 "EHLO
	mail-pa0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750976AbaBXAXc (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 23 Feb 2014 19:23:32 -0500
Received: by mail-pa0-f47.google.com with SMTP id kp14so5787950pab.20
        for <linux-samsung-soc@vger.kernel.org>; Sun, 23 Feb 2014 16:23:32 -0800 (PST)
In-Reply-To: <1391669805-1216-1-git-send-email-sachin.kamat@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sachin Kamat <sachin.kamat@linaro.org>
Cc: linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com

On 02/06/14 15:56, Sachin Kamat wrote:
> Fixed voltage regulators required by audio codec added.
>
> Signed-off-by: Sachin Kamat<sachin.kamat@linaro.org>
> ---
>   arch/arm/boot/dts/exynos5420-smdk5420.dts |   33 +++++++++++++++++++++++++++++
>   1 file changed, 33 insertions(+)
>
> diff --git a/arch/arm/boot/dts/exynos5420-smdk5420.dts b/arch/arm/boot/dts/exynos5420-smdk5420.dts
> index edb4926f17d6..ae1ee0470fca 100644
> --- a/arch/arm/boot/dts/exynos5420-smdk5420.dts
> +++ b/arch/arm/boot/dts/exynos5420-smdk5420.dts
> @@ -31,6 +31,39 @@
>   		};
>   	};
>
> +	regulators {
> +		compatible = "simple-bus";
> +		#address-cells =<1>;
> +		#size-cells =<0>;
> +
> +		vdd: fixed-regulator@0 {
> +			compatible = "regulator-fixed";
> +			reg =<0>;
> +			regulator-name = "vdd-supply";
> +			regulator-min-microvolt =<1800000>;
> +			regulator-max-microvolt =<1800000>;
> +			regulator-always-on;
> +		};
> +
> +		dbvdd: fixed-regulator@1 {
> +			compatible = "regulator-fixed";
> +			reg =<1>;
> +			regulator-name = "dbvdd-supply";
> +			regulator-min-microvolt =<3300000>;
> +			regulator-max-microvolt =<3300000>;
> +			regulator-always-on;
> +		};
> +
> +		spkvdd: fixed-regulator@2 {
> +			compatible = "regulator-fixed";
> +			reg =<2>;
> +			regulator-name = "spkvdd-supply";
> +			regulator-min-microvolt =<5000000>;
> +			regulator-max-microvolt =<5000000>;
> +			regulator-always-on;
> +		};
> +	};
> +
>   	rtc@101E0000 {
>   		status = "okay";
>   	};

Applied, thanks.

- Kukjin
