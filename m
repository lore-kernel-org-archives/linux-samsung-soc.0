From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: Re: [RFT v4 6/8] ARM: dts: exynos: Remove MCT subnode for interrupt
 map on Exynos5250
Date: Tue, 24 Sep 2019 08:58:02 +0200
Message-ID: <7ad1898d-3aa7-db49-78c1-c42b34568c60@samsung.com>
References: <20190923161411.9236-1-krzk@kernel.org>
 <CGME20190923161450epcas4p32dfa1273d244c1392c7bfb4c352f2d3e@epcas4p3.samsung.com>
 <20190923161411.9236-6-krzk@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190923161411.9236-6-krzk@kernel.org>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
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

Works fine on Arndale and Snow boards.

>
> ---
>
> Not tested.
>
> Changes since v3:
> 1. Use interrupts-extended instead of interrupts-map.
> ---
>   arch/arm/boot/dts/exynos5250.dtsi | 23 ++++++-----------------
>   1 file changed, 6 insertions(+), 17 deletions(-)
>
> diff --git a/arch/arm/boot/dts/exynos5250.dtsi b/arch/arm/boot/dts/exynos5250.dtsi
> index 7a01349317a3..a549eafd2c64 100644
> --- a/arch/arm/boot/dts/exynos5250.dtsi
> +++ b/arch/arm/boot/dts/exynos5250.dtsi
> @@ -236,25 +236,14 @@
>   		timer@101c0000 {
>   			compatible = "samsung,exynos4210-mct";
>   			reg = <0x101C0000 0x800>;
> -			interrupt-controller;
> -			#interrupt-cells = <2>;
> -			interrupt-parent = <&mct_map>;
> -			interrupts = <0 0>, <1 0>, <2 0>, <3 0>,
> -				     <4 0>, <5 0>;
>   			clocks = <&clock CLK_FIN_PLL>, <&clock CLK_MCT>;
>   			clock-names = "fin_pll", "mct";
> -
> -			mct_map: mct-map {
> -				#interrupt-cells = <2>;
> -				#address-cells = <0>;
> -				#size-cells = <0>;
> -				interrupt-map = <0x0 0 &combiner 23 3>,
> -						<0x1 0 &combiner 23 4>,
> -						<0x2 0 &combiner 25 2>,
> -						<0x3 0 &combiner 25 3>,
> -						<0x4 0 &gic 0 120 IRQ_TYPE_LEVEL_HIGH>,
> -						<0x5 0 &gic 0 121 IRQ_TYPE_LEVEL_HIGH>;
> -			};
> +			interrupts-extended = <&combiner 23 3>,
> +					      <&combiner 23 4>,
> +					      <&combiner 25 2>,
> +					      <&combiner 25 3>,
> +					      <&gic 0 120 IRQ_TYPE_LEVEL_HIGH>,
> +					      <&gic 0 121 IRQ_TYPE_LEVEL_HIGH>;
>   		};
>   
>   		pinctrl_0: pinctrl@11400000 {

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland
