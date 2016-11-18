From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: Re: [PATCH] ARM: dts: exynos: Add ADCs on 4412 and 5422 based odroid
 boards.
Date: Fri, 18 Nov 2016 08:01:48 +0100
Message-ID: <7d1ec37a-a693-7a4d-9f61-4c2c543a0096@samsung.com>
References: <CGME20161117184159epcas3p14fa4fc3d41c34083fce11a70f560b6f8@epcas3p1.samsung.com>
 <1cb894be-469a-714f-cfb8-6a1feac47e87@fivetechno.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:32364 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751058AbcKRHBz (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 18 Nov 2016 02:01:55 -0500
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout2.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0OGT00D6MSV3UL40@mailout2.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 18 Nov 2016 07:01:51 +0000 (GMT)
In-reply-to: <1cb894be-469a-714f-cfb8-6a1feac47e87@fivetechno.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Markus Reichl <m.reichl@fivetechno.de>, Kukjin Kim <kgene@kernel.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, Javier Martinez Canillas <javier@osg.samsung.com>, Tobias Jakobi <tjakobi@math.uni-bielefeld.de>

Hi Markus,


On 2016-11-17 16:09, Markus Reichl wrote:
> Odroid-X, -X2, -XU3 and -XU4 have SOC-ADC routed to an external connector.
> Enable the ADC for use as iio-device.
>
> Signed-off-by: Markus Reichl <m.reichl@fivetechno.de>
> ---
> Tested on X, XU3 and XU4.
> ---
>   arch/arm/boot/dts/exynos4412-odroid-common.dtsi    |  5 +++++
>   arch/arm/boot/dts/exynos5422-odroidxu3-common.dtsi | 11 +++++++++++

exynos4412-odroid-common.dtsi is also used on Odroid U3, which doesn't have
ADC pins on the external connector, so please move ADC node to
exynos4412-odroidx.dts, which is used on X and X2.

>   2 files changed, 16 insertions(+)
>
> diff --git a/arch/arm/boot/dts/exynos4412-odroid-common.dtsi b/arch/arm/boot/dts/exynos4412-odroid-common.dtsi
> index 8aa19ba..6f26b3d 100644
> --- a/arch/arm/boot/dts/exynos4412-odroid-common.dtsi
> +++ b/arch/arm/boot/dts/exynos4412-odroid-common.dtsi
> @@ -478,6 +478,11 @@
>   	};
>   };
>   
> +&adc {
> +	vdd-supply = <&ldo10_reg>;
> +	status = "okay";
> +};
> +
>   &i2c_1 {
>   	status = "okay";
>   	max98090: max98090@10 {
> diff --git a/arch/arm/boot/dts/exynos5422-odroidxu3-common.dtsi b/arch/arm/boot/dts/exynos5422-odroidxu3-common.dtsi
> index 246d298..a8e1986 100644
> --- a/arch/arm/boot/dts/exynos5422-odroidxu3-common.dtsi
> +++ b/arch/arm/boot/dts/exynos5422-odroidxu3-common.dtsi
> @@ -147,6 +147,11 @@
>   	};
>   };
>   
> +&adc {
> +	vdd-supply = <&ldo4_reg>;
> +	status = "okay";
> +};
> +
>   &bus_wcore {
>   	devfreq-events = <&nocp_mem0_0>, <&nocp_mem0_1>,
>   			<&nocp_mem1_0>, <&nocp_mem1_1>;
> @@ -293,6 +298,12 @@
>   				regulator-max-microvolt = <1800000>;
>   			};
>   
> +			ldo4_reg: LDO4 {
> +				regulator-name = "vdd_adc";
> +				regulator-min-microvolt = <1800000>;
> +				regulator-max-microvolt = <1800000>;
> +			};
> +
>   			ldo5_reg: LDO5 {
>   				regulator-name = "vdd_ldo5";
>   				regulator-min-microvolt = <1800000>;

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland
