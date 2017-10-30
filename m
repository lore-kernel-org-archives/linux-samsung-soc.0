From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v2] ARM: dts: exynos: add cpu perf counters to Exynos54xx
 boards
Date: Mon, 30 Oct 2017 21:50:58 +0100
Message-ID: <20171030205058.xvonrcy4sliltu5c@kozik-lap>
References: <1508812196-14478-1-git-send-email-mihailescu2m@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wm0-f68.google.com ([74.125.82.68]:50436 "EHLO
        mail-wm0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932153AbdJ3UvB (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 30 Oct 2017 16:51:01 -0400
Content-Disposition: inline
In-Reply-To: <1508812196-14478-1-git-send-email-mihailescu2m@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: memeka <mihailescu2m@gmail.com>
Cc: robh+dt@kernel.org, mark.rutland@arm.com, linux@armlinux.org.uk, kgene@kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, Willy Wolff <willy.mh.wolff@gmail.com>

On Tue, Oct 24, 2017 at 12:59:56PM +1030, memeka wrote:
> Enable support for ARM Performance Monitoring Units available in Cortex-A7
> and Cortex-A15 CPU cores for Exynos54xx SoCs (5410, 5420 and 5422/5800).
> 
> The PMUs interrupts are defined in the common exynos54xx.dtsi device tree,
> but the PMUs are enabled and have their interrupt CPU affinity defined
> next to each SoC's cpus node.
> 
> Tested with perf on Odroid XU4 (Exynos5422):
> armv7_cortex_a7 PMU driver: 5 counters available
> armv7_cortex_a15 PMU driver: 7 counters available
> 
> Suggested-by: Marek Szyprowski <m.szyprowski@samsung.com>
> Signed-off-by: Marian Mihailescu <mihailescu2m@gmail.com>
> Signed-off-by: Willy Wolff <willy.mh.wolff@gmail.com>
> 
> ---
> Changes since v1:
>  - both Cortex-A7 and Cortex-A15 PMUs are now defined in exynos54xx.dtsi
>  - CPU affinity is defined for each SoC *after* the cpus node entry
>  - PMUs are disabled in exynos54xx.dtsi and enabled for each SoC
>  - cpus labels have been fixed in the interrupt-affinity property for
>    Exynos5410 and Exynos5420 SoCs
> 
> ---
>  arch/arm/boot/dts/exynos5410.dtsi      |  8 ++++++++
>  arch/arm/boot/dts/exynos5420-cpus.dtsi | 16 ++++++++++++++++
>  arch/arm/boot/dts/exynos5422-cpus.dtsi | 16 ++++++++++++++++
>  arch/arm/boot/dts/exynos54xx.dtsi      | 20 ++++++++++++++++++++
>  4 files changed, 60 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/exynos5410.dtsi b/arch/arm/boot/dts/exynos5410.dtsi
> index 7eab4bc..f42b04b 100644
> --- a/arch/arm/boot/dts/exynos5410.dtsi
> +++ b/arch/arm/boot/dts/exynos5410.dtsi
> @@ -428,4 +428,12 @@
>  	samsung,syscon-phandle = <&pmu_system_controller>;
>  };
>  
> +&arm_a15_pmu {

Please put it in alphabetical order (against existing overridings by
labels).

> +	interrupt-affinity = <&cpu0>,
> +		<&cpu1>,

Please align with <&cpiu0> before. Makes code easier to read.

> +		<&cpu2>,
> +		<&cpu3>;
> +	status = "okay";
> +};

> +
>  #include "exynos5410-pinctrl.dtsi"
> diff --git a/arch/arm/boot/dts/exynos5420-cpus.dtsi b/arch/arm/boot/dts/exynos5420-cpus.dtsi
> index 5c052d7..518b7d8 100644
> --- a/arch/arm/boot/dts/exynos5420-cpus.dtsi
> +++ b/arch/arm/boot/dts/exynos5420-cpus.dtsi
> @@ -124,3 +124,19 @@
>  		};
>  	};
>  };
> +
> +&arm_a7_pmu {

Ditto - order and alignment of continuation of lines.

> +	interrupt-affinity = <&cpu4>,
> +		<&cpu5>,
> +		<&cpu4>,
> +		<&cpu5>;

cpu6 and cpu7?

> +	status = "okay";
> +};
> +
> +&arm_a15_pmu {
> +	interrupt-affinity = <&cpu0>,
> +		<&cpu1>,
> +		<&cpu2>,
> +		<&cpu3>;
> +	status = "okay";
> +};
> diff --git a/arch/arm/boot/dts/exynos5422-cpus.dtsi b/arch/arm/boot/dts/exynos5422-cpus.dtsi
> index ab4c718..92676be 100644
> --- a/arch/arm/boot/dts/exynos5422-cpus.dtsi
> +++ b/arch/arm/boot/dts/exynos5422-cpus.dtsi
> @@ -131,3 +131,19 @@
>  		};
>  	};
>  };
> +
> +&arm_a7_pmu {
> +	interrupt-affinity = <&cpu0>,
> +		<&cpu1>,
> +		<&cpu2>,
> +		<&cpu3>;
> +	status = "okay";
> +};
> +
> +&arm_a15_pmu {
> +	interrupt-affinity = <&cpu4>,
> +		<&cpu5>,
> +		<&cpu6>,
> +		<&cpu7>;
> +	status = "okay";
> +};
> diff --git a/arch/arm/boot/dts/exynos54xx.dtsi b/arch/arm/boot/dts/exynos54xx.dtsi
> index 8ca4fef..f0bd27d 100644
> --- a/arch/arm/boot/dts/exynos54xx.dtsi
> +++ b/arch/arm/boot/dts/exynos54xx.dtsi
> @@ -79,6 +79,26 @@
>  			interrupts = <GIC_SPI 42 IRQ_TYPE_LEVEL_HIGH>;
>  		};
>  
> +		arm_a7_pmu: arm-a7-pmu {
> +			compatible = "arm,cortex-a7-pmu";
> +			interrupt-parent = <&gic>;
> +			interrupts = <GIC_SPI 160 IRQ_TYPE_LEVEL_HIGH>,
> +				<GIC_SPI 161 IRQ_TYPE_LEVEL_HIGH>,
> +				<GIC_SPI 162 IRQ_TYPE_LEVEL_HIGH>,
> +				<GIC_SPI 163 IRQ_TYPE_LEVEL_HIGH>;

Lines alignment.

Best regards,
Krzysztof


> +			status = "disabled";
> +		};
> +
> +		arm_a15_pmu: arm-a15-pmu {
> +			compatible = "arm,cortex-a15-pmu";
> +			interrupt-parent = <&combiner>;
> +			interrupts = <1 2>,
> +				<7 0>,
> +				<16 6>,
> +				<19 2>;
> +			status = "disabled";
> +		};
> +
>  		sss: sss@10830000 {
>  			compatible = "samsung,exynos4210-secss";
>  			reg = <0x10830000 0x300>;
> -- 
> 2.7.4
> 
