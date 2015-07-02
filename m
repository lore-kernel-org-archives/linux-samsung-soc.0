From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH v5 2/3] ARM: dts: Add CPU OPP and regulator supply property
 for Exynos3250
Date: Thu, 02 Jul 2015 09:01:41 +0900
Message-ID: <55947F65.8010404@samsung.com>
References: <1435756877-26736-1-git-send-email-cw00.choi@samsung.com>
 <1435756877-26736-3-git-send-email-cw00.choi@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:57254 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753382AbbGBABn (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 1 Jul 2015 20:01:43 -0400
In-reply-to: <1435756877-26736-3-git-send-email-cw00.choi@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Chanwoo Choi <cw00.choi@samsung.com>, s.nawrocki@samsung.com, tomasz.figa@gmail.com, mturquette@baylibre.com, sboyd@codeaurora.org, kgene@kernel.org
Cc: thomas.ab@samsung.com, b.zolnierkie@samsung.com, kyungmin.park@samsung.com, linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org

On 01.07.2015 22:21, Chanwoo Choi wrote:
> This patch add CPU operating points which include CPU frequency and regulator
> voltage to use generic cpufreq drivers.
> 
> Cc: Kukjin Kim <kgene@kernel.org>
> Cc: Krzysztof Kozlowski <k.kozlowski@samsung.com>
> Signed-off-by: Chanwoo Choi <cw00.choi@samsung.com>
> Acked-by: Kyungmin Park <kyungmin.park@samsung.com>
> ---
>  arch/arm/boot/dts/exynos3250-monk.dts   |  4 ++++
>  arch/arm/boot/dts/exynos3250-rinato.dts |  4 ++++
>  arch/arm/boot/dts/exynos3250.dtsi       | 15 +++++++++++++++
>  3 files changed, 23 insertions(+)

The patch looks good. Could you put the 'cpu' nodes in alphabetical
order? The order for Rinato board is already broken but still putting it
after 'adc' node would be better.

With the change above:
Reviewed-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>

Best regards,
Krzysztof

> 
> diff --git a/arch/arm/boot/dts/exynos3250-monk.dts b/arch/arm/boot/dts/exynos3250-monk.dts
> index a5863acc5fff..fc6604d68864 100644
> --- a/arch/arm/boot/dts/exynos3250-monk.dts
> +++ b/arch/arm/boot/dts/exynos3250-monk.dts
> @@ -118,6 +118,10 @@
>  	};
>  };
>  
> +&cpu0 {
> +	cpu0-supply = <&buck2_reg>;
> +};
> +
>  &adc {
>  	vdd-supply = <&ldo3_reg>;
>  	status = "okay";
> diff --git a/arch/arm/boot/dts/exynos3250-rinato.dts b/arch/arm/boot/dts/exynos3250-rinato.dts
> index 031853b75528..c8a083b376c9 100644
> --- a/arch/arm/boot/dts/exynos3250-rinato.dts
> +++ b/arch/arm/boot/dts/exynos3250-rinato.dts
> @@ -109,6 +109,10 @@
>  	};
>  };
>  
> +&cpu0 {
> +	cpu0-supply = <&buck2_reg>;
> +};
> +
>  &adc {
>  	vdd-supply = <&ldo3_reg>;
>  	status = "okay";
> diff --git a/arch/arm/boot/dts/exynos3250.dtsi b/arch/arm/boot/dts/exynos3250.dtsi
> index d7201333e3bc..e0f3b2ed41a3 100644
> --- a/arch/arm/boot/dts/exynos3250.dtsi
> +++ b/arch/arm/boot/dts/exynos3250.dtsi
> @@ -53,6 +53,21 @@
>  			compatible = "arm,cortex-a7";
>  			reg = <0>;
>  			clock-frequency = <1000000000>;
> +			clocks = <&cmu CLK_ARM_CLK>;
> +			clock-names = "cpu";
> +
> +			operating-points = <
> +				1000000 1150000
> +				900000  1112500
> +				800000  1075000
> +				700000  1037500
> +				600000  1000000
> +				500000  962500
> +				400000  925000
> +				300000  887500
> +				200000  850000
> +				100000  850000
> +			>;
>  		};
>  
>  		cpu1: cpu@1 {
> 
