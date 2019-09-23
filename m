From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: Re: [RFT v3 4/8] ARM: dts: exynos: Remove MCT subnode for interrupt
 map on Exynos4210
Date: Mon, 23 Sep 2019 08:56:46 +0200
Message-ID: <c1d02aa3-b5f2-1c5b-0b7b-8749e7c0ce9a@samsung.com>
References: <20190921170152.5033-1-krzk@kernel.org>
        <CGME20190921203810epcas3p39f3d9e3224d2c5ef61c1e18df2ab403d@epcas3p3.samsung.com>
        <20190921170152.5033-4-krzk@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190921170152.5033-4-krzk@kernel.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Krzysztof Kozlowski <krzk@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Kukjin Kim <kgene@kernel.org>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Sylwester Nawrocki <snawrocki@kernel.org>
List-Id: linux-samsung-soc@vger.kernel.org

Hi Krzysztof,

On 21.09.2019 19:01, Krzysztof Kozlowski wrote:
> Multi Core Timer node has interrupts routed to two different parents -
> GIC and combiner.  This was modeled with a interrupt-map within a
> subnode but can be expressed in an easier and more common way, directly
> in the node itself.

Maybe we should simply use 'interrupts-extended' based approach and 
simplify mct node even more (get rid of interrupt-parent, interrupts, 
size/address cells)?

> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
>
> ---
>
> Not tested.
> ---
>   arch/arm/boot/dts/exynos4210.dtsi | 16 ++++++----------
>   1 file changed, 6 insertions(+), 10 deletions(-)
>
> diff --git a/arch/arm/boot/dts/exynos4210.dtsi b/arch/arm/boot/dts/exynos4210.dtsi
> index 6d3f19562aab..38c49ab8c733 100644
> --- a/arch/arm/boot/dts/exynos4210.dtsi
> +++ b/arch/arm/boot/dts/exynos4210.dtsi
> @@ -109,23 +109,19 @@
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
> +			#address-cells = <0>;
> +			#size-cells = <0>;
> +			#interrupt-cells = <1>;
> +			interrupt-parent = <&mct>;
> +			interrupts = <0>, <1>, <2>, <3>, <4>, <5>;
> +			interrupt-map = <0 &gic 0 57 IRQ_TYPE_LEVEL_HIGH>,
>   					<1 &gic 0 69 IRQ_TYPE_LEVEL_HIGH>,
>   					<2 &combiner 12 6>,
>   					<3 &combiner 12 7>,
>   					<4 &gic 0 42 IRQ_TYPE_LEVEL_HIGH>,
>   					<5 &gic 0 48 IRQ_TYPE_LEVEL_HIGH>;
> -			};
>   		};
>   
>   		watchdog: watchdog@10060000 {

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland
