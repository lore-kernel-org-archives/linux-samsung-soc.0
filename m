From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH 07/10] ARM: dts: Add thermal zone and cpufreq node for
 exynos3250-artik5 module
Date: Mon, 14 Mar 2016 16:06:30 +0900
Message-ID: <56E662F6.4070200@samsung.com>
References: <1457921056-21257-1-git-send-email-cw00.choi@samsung.com>
 <1457921056-21257-9-git-send-email-cw00.choi@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:21388 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751185AbcCNHGl (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 14 Mar 2016 03:06:41 -0400
In-reply-to: <1457921056-21257-9-git-send-email-cw00.choi@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Chanwoo Choi <cw00.choi@samsung.com>, kgene@kernel.org, s.nawrocki@samsung.com, tomasz.figa@gmail.com
Cc: jh80.chung@samsung.com, andi.shyti@samsung.com, inki.dae@samsung.com, sw0312.kim@samsung.com, pankaj.dubey@samsung.com, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org

On 14.03.2016 11:04, Chanwoo Choi wrote:
> This patch enables the CPU frequency scaling for exynos3250-artik5 module
> and adds the thernal zones with cpu cooling device to prevent the overheat
> temperature.
> 
> Signed-off-by: Chanwoo Choi <cw00.choi@samsung.com>
> ---
>  arch/arm/boot/dts/exynos3250-artik5.dtsi | 23 +++++++++++++++++++++++
>  1 file changed, 23 insertions(+)

The patch looks good but just squash it with 5/10 unless there is some
benefit by splitting the features for many patches. The benefit would be
for example submitting the work partially, in steps, following principle
release-early-release-often... but this is not the case. You have
everything ready and tested.

BR,
Krzysztof

> 
> diff --git a/arch/arm/boot/dts/exynos3250-artik5.dtsi b/arch/arm/boot/dts/exynos3250-artik5.dtsi
> index 75b291c10cdc..877e4827df83 100644
> --- a/arch/arm/boot/dts/exynos3250-artik5.dtsi
> +++ b/arch/arm/boot/dts/exynos3250-artik5.dtsi
> @@ -31,6 +31,25 @@
>  		compatible = "samsung,secure-firmware";
>  		reg = <0x0205F000 0x1000>;
>  	};
> +
> +	thermal-zones {
> +		cpu_thermal: cpu-thermal {
> +			cooling-maps {
> +				map0 {
> +					/* Corresponds to 500MHz */
> +					cooling-device = <&cpu0 5 5>;
> +				};
> +				map1 {
> +					/* Corresponds to 200MHz */
> +					cooling-device = <&cpu0 8 8>;
> +				};
> +			};
> +		};
> +	};
> +};
> +
> +&cpu0 {
> +	cpu0-supply = <&buck2_reg>;
>  };
>  
>  &i2c_0 {
> @@ -296,6 +315,10 @@
>  	status = "okay";
>  };
>  
> +&tmu {
> +	status = "okay";
> +};
> +
>  &xusbxti {
>  	clock-frequency = <24000000>;
>  };
> 
