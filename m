From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: Re: [RFT v4 4/8] ARM: dts: exynos: Remove MCT subnode for interrupt
 map on Exynos4210
Date: Tue, 24 Sep 2019 08:57:54 +0200
Message-ID: <e3c08a87-2650-3df8-01a6-05dff24af913@samsung.com>
References: <20190923161411.9236-1-krzk@kernel.org>
        <CGME20190923161444epcas3p280b21cfbb4448d55eb850de2d49a72d7@epcas3p2.samsung.com>
        <20190923161411.9236-4-krzk@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190923161411.9236-4-krzk@kernel.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Krzysztof Kozlowski <krzk@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Kukjin Kim <kgene@kernel.org>, Andrzej Hajda <a.hajda@samsung.com>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: Sylwester Nawrocki <snawrocki@kernel.org>
List-Id: linux-samsung-soc@vger.kernel.org


On 23.09.2019 18:14, Krzysztof Kozlowski wrote:
> Multi Core Timer node has interrupts routed to two different parents -
> GIC and combiner.  This was modeled with a interrupt-map within a
> subnode but can be expressed in an easier and more common way, directly
> in the node itself.
>
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>

Works fine on Trats and Origen boards.

> ---
>
> Not tested.
>
> Changes since v3:
> 1. Use interrupts-extended instead of interrupts-map.
> ---
>   arch/arm/boot/dts/exynos4210.dtsi | 21 ++++++---------------
>   1 file changed, 6 insertions(+), 15 deletions(-)
>
> diff --git a/arch/arm/boot/dts/exynos4210.dtsi b/arch/arm/boot/dts/exynos4210.dtsi
> index 6d3f19562aab..5fa33d43821e 100644
> --- a/arch/arm/boot/dts/exynos4210.dtsi
> +++ b/arch/arm/boot/dts/exynos4210.dtsi
> @@ -109,23 +109,14 @@
>   		mct: timer@10050000 {
>   			compatible = "samsung,exynos4210-mct";
>   			reg = <0x10050000 0x800>;
> -			interrupt-parent = <&mct_map>;
> -			interrupts = <0>, <1>, <2>, <3>, <4>, <5>;
>   			clocks = <&clock CLK_FIN_PLL>, <&clock CLK_MCT>;
>   			clock-names = "fin_pll", "mct";
> -
> -			mct_map: mct-map {
> -				#interrupt-cells = <1>;
> -				#address-cells = <0>;
> -				#size-cells = <0>;
> -				interrupt-map =
> -					<0 &gic 0 57 IRQ_TYPE_LEVEL_HIGH>,
> -					<1 &gic 0 69 IRQ_TYPE_LEVEL_HIGH>,
> -					<2 &combiner 12 6>,
> -					<3 &combiner 12 7>,
> -					<4 &gic 0 42 IRQ_TYPE_LEVEL_HIGH>,
> -					<5 &gic 0 48 IRQ_TYPE_LEVEL_HIGH>;
> -			};
> +			interrupts-extended = <&gic 0 57 IRQ_TYPE_LEVEL_HIGH>,
> +					      <&gic 0 69 IRQ_TYPE_LEVEL_HIGH>,
> +					      <&combiner 12 6>,
> +					      <&combiner 12 7>,
> +					      <&gic 0 42 IRQ_TYPE_LEVEL_HIGH>,
> +					      <&gic 0 48 IRQ_TYPE_LEVEL_HIGH>;
>   		};
>   
>   		watchdog: watchdog@10060000 {

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland
