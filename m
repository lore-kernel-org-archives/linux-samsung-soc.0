From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: Re: [PATCH 1/4] ARM: dts: exynos: Move pmu and timer nodes out of
 soc
Date: Tue, 23 Apr 2019 14:58:31 +0200
Message-ID: <d236bbff-4f99-d492-7591-5f5ca05f4949@samsung.com>
References: <CGME20190415180530epcas3p4ad1a7ac12f7d7ac3175735995b21d48e@epcas3p4.samsung.com>
        <20190415180510.6044-1-krzk@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190415180510.6044-1-krzk@kernel.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Kukjin Kim <kgene@kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Andrzej Hajda <a.hajda@samsung.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org


On 2019-04-15 20:05, Krzysztof Kozlowski wrote:
> The ARM PMU and ARM architected timer nodes are part of ARM CPU design
> therefore they should not be inside the soc node.  This also fixes DTC
> W=1 warnings like:
>
>      arch/arm/boot/dts/exynos3250.dtsi:106.21-135.5:
>          Warning (simple_bus_reg): /soc/fixed-rate-clocks: missing or empty reg/ranges property
>      arch/arm/boot/dts/exynos3250.dtsi:676.7-680.5:
>          Warning (simple_bus_reg): /soc/pmu: missing or empty reg/ranges property
>
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>

> ---
>   arch/arm/boot/dts/exynos3250.dtsi | 12 +++++-----
>   arch/arm/boot/dts/exynos4.dtsi    | 12 +++++-----
>   arch/arm/boot/dts/exynos5250.dtsi | 40 +++++++++++++++----------------
>   arch/arm/boot/dts/exynos54xx.dtsi | 38 ++++++++++++++---------------
>   4 files changed, 51 insertions(+), 51 deletions(-)
>
> diff --git a/arch/arm/boot/dts/exynos3250.dtsi b/arch/arm/boot/dts/exynos3250.dtsi
> index 5892a9f7622f..af54b306204b 100644
> --- a/arch/arm/boot/dts/exynos3250.dtsi
> +++ b/arch/arm/boot/dts/exynos3250.dtsi
> @@ -97,6 +97,12 @@
>   		};
>   	};
>   
> +	pmu {
> +		compatible = "arm,cortex-a7-pmu";
> +		interrupts = <GIC_SPI 18 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 19 IRQ_TYPE_LEVEL_HIGH>;
> +	};
> +
>   	soc: soc {
>   		compatible = "simple-bus";
>   		#address-cells = <1>;
> @@ -673,12 +679,6 @@
>   			status = "disabled";
>   		};
>   
> -		pmu {
> -			compatible = "arm,cortex-a7-pmu";
> -			interrupts = <GIC_SPI 18 IRQ_TYPE_LEVEL_HIGH>,
> -				     <GIC_SPI 19 IRQ_TYPE_LEVEL_HIGH>;
> -		};
> -
>   		ppmu_dmc0: ppmu_dmc0@106a0000 {
>   			compatible = "samsung,exynos-ppmu";
>   			reg = <0x106a0000 0x2000>;
> diff --git a/arch/arm/boot/dts/exynos4.dtsi b/arch/arm/boot/dts/exynos4.dtsi
> index 6085e92ac2d7..1c21627e3c3c 100644
> --- a/arch/arm/boot/dts/exynos4.dtsi
> +++ b/arch/arm/boot/dts/exynos4.dtsi
> @@ -51,6 +51,12 @@
>   		serial3 = &serial_3;
>   	};
>   
> +	pmu: pmu {
> +		compatible = "arm,cortex-a9-pmu";
> +		interrupt-parent = <&combiner>;
> +		interrupts = <2 2>, <3 2>;
> +	};
> +
>   	soc: soc {
>   		compatible = "simple-bus";
>   		#address-cells = <1>;
> @@ -169,12 +175,6 @@
>   			reg = <0x10440000 0x1000>;
>   		};
>   
> -		pmu: pmu {
> -			compatible = "arm,cortex-a9-pmu";
> -			interrupt-parent = <&combiner>;
> -			interrupts = <2 2>, <3 2>;
> -		};
> -
>   		sys_reg: syscon@10010000 {
>   			compatible = "samsung,exynos4-sysreg", "syscon";
>   			reg = <0x10010000 0x400>;
> diff --git a/arch/arm/boot/dts/exynos5250.dtsi b/arch/arm/boot/dts/exynos5250.dtsi
> index 80986b97dfe5..96ace6a5e2f9 100644
> --- a/arch/arm/boot/dts/exynos5250.dtsi
> +++ b/arch/arm/boot/dts/exynos5250.dtsi
> @@ -157,6 +157,26 @@
>   		};
>   	};
>   
> +	pmu {
> +		compatible = "arm,cortex-a15-pmu";
> +		interrupt-parent = <&combiner>;
> +		interrupts = <1 2>, <22 4>;
> +	};
> +
> +	timer {
> +		compatible = "arm,armv7-timer";
> +		interrupts = <GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
> +			     <GIC_PPI 14 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
> +			     <GIC_PPI 11 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
> +			     <GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>;
> +		/*
> +		 * Unfortunately we need this since some versions
> +		 * of U-Boot on Exynos don't set the CNTFRQ register,
> +		 * so we need the value from DT.
> +		 */
> +		clock-frequency = <24000000>;
> +	};
> +
>   	soc: soc {
>   		sysram@2020000 {
>   			compatible = "mmio-sram";
> @@ -227,20 +247,6 @@
>   			power-domains = <&pd_mau>;
>   		};
>   
> -		timer {
> -			compatible = "arm,armv7-timer";
> -			interrupts = <GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
> -				     <GIC_PPI 14 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
> -				     <GIC_PPI 11 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
> -				     <GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>;
> -			/*
> -			 * Unfortunately we need this since some versions
> -			 * of U-Boot on Exynos don't set the CNTFRQ register,
> -			 * so we need the value from DT.
> -			 */
> -			clock-frequency = <24000000>;
> -		};
> -
>   		mct@101c0000 {
>   			compatible = "samsung,exynos4210-mct";
>   			reg = <0x101C0000 0x800>;
> @@ -265,12 +271,6 @@
>   			};
>   		};
>   
> -		pmu {
> -			compatible = "arm,cortex-a15-pmu";
> -			interrupt-parent = <&combiner>;
> -			interrupts = <1 2>, <22 4>;
> -		};
> -
>   		pinctrl_0: pinctrl@11400000 {
>   			compatible = "samsung,exynos5250-pinctrl";
>   			reg = <0x11400000 0x1000>;
> diff --git a/arch/arm/boot/dts/exynos54xx.dtsi b/arch/arm/boot/dts/exynos54xx.dtsi
> index de26e5ee0d2d..ae866bcc30c4 100644
> --- a/arch/arm/boot/dts/exynos54xx.dtsi
> +++ b/arch/arm/boot/dts/exynos54xx.dtsi
> @@ -25,27 +25,27 @@
>   		usbdrdphy1 = &usbdrd_phy1;
>   	};
>   
> -	soc: soc {
> -		arm_a7_pmu: arm-a7-pmu {
> -			compatible = "arm,cortex-a7-pmu";
> -			interrupt-parent = <&gic>;
> -			interrupts = <GIC_SPI 160 IRQ_TYPE_LEVEL_HIGH>,
> -				     <GIC_SPI 161 IRQ_TYPE_LEVEL_HIGH>,
> -				     <GIC_SPI 162 IRQ_TYPE_LEVEL_HIGH>,
> -				     <GIC_SPI 163 IRQ_TYPE_LEVEL_HIGH>;
> -			status = "disabled";
> -		};
> +	arm_a7_pmu: arm-a7-pmu {
> +		compatible = "arm,cortex-a7-pmu";
> +		interrupt-parent = <&gic>;
> +		interrupts = <GIC_SPI 160 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 161 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 162 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 163 IRQ_TYPE_LEVEL_HIGH>;
> +		status = "disabled";
> +	};
>   
> -		arm_a15_pmu: arm-a15-pmu {
> -			compatible = "arm,cortex-a15-pmu";
> -			interrupt-parent = <&combiner>;
> -			interrupts = <1 2>,
> -				     <7 0>,
> -				     <16 6>,
> -				     <19 2>;
> -			status = "disabled";
> -		};
> +	arm_a15_pmu: arm-a15-pmu {
> +		compatible = "arm,cortex-a15-pmu";
> +		interrupt-parent = <&combiner>;
> +		interrupts = <1 2>,
> +			     <7 0>,
> +			     <16 6>,
> +			     <19 2>;
> +		status = "disabled";
> +	};
>   
> +	soc: soc {
>   		sysram@2020000 {
>   			compatible = "mmio-sram";
>   			reg = <0x02020000 0x54000>;

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland
