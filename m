From: Markus Reichl <m.reichl@fivetechno.de>
Subject: Re: [PATCH 1/3] ARM: dts: exynos: Add CPU performance counters to
 Exynos4 boards
Date: Fri, 1 Dec 2017 12:12:07 +0100
Message-ID: <5d262ced-6f3b-75a7-53b3-01c64eecebad@fivetechno.de>
References: <20171123143431.12434-1-m.szyprowski@samsung.com>
 <CGME20171123143445eucas1p211f591cae7ad5121f5b5e19ede898db7@eucas1p2.samsung.com>
 <20171123143431.12434-2-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from wp126.webpack.hosteurope.de ([80.237.132.133]:41810 "EHLO
        wp126.webpack.hosteurope.de" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1751989AbdLALwm (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 1 Dec 2017 06:52:42 -0500
In-Reply-To: <20171123143431.12434-2-m.szyprowski@samsung.com>
Content-Language: de-DE
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>, linux-samsung-soc@vger.kernel.org
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Marian Mihailescu <mihailescu2m@gmail.com>

Hi Marek,

with this patch (linux-next-20171201) I get on odroid-X2

[    0.671862] hw perfevents: no interrupt-affinity property for /pmu, guessing.
[    0.672242] hw perfevents: enabled with armv7_cortex_a9 PMU driver, 7 counters available
[    0.672618] hw perfevents: no interrupt-affinity property for /arm_pmu, guessing.
[    0.672696] genirq: Flags mismatch irq 38. 00010c00 (arm-pmu) vs. 00010c00 (arm-pmu)
[    0.672716] hw perfevents: unable to request IRQ38 for ARM PMU counters
[    0.672733] hw perfevents: /arm_pmu: failed to register PMU devices!
[    0.672761] armv7-pmu: probe of arm_pmu failed with error -16

without it 

[    0.686817] hw perfevents: no interrupt-affinity property for /pmu, guessing.
[    0.687194] hw perfevents: enabled with armv7_cortex_a9 PMU driver, 7 counters available

Looks like arm_pmu in exynos4412.dtsi doubles pmu from exynos4.dtsi.

Gruß,
-- 
Markus Reichl

Am 23.11.2017 um 15:34 schrieb Marek Szyprowski:
> Enable support for ARM Performance Monitoring Units available in
> Cortex-A9 CPU cores for Exynos4 SoCs (4210 and 4412).
> 
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
>  arch/arm/boot/dts/exynos4210.dtsi | 6 ++++++
>  arch/arm/boot/dts/exynos4412.dtsi | 6 ++++++
>  2 files changed, 12 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/exynos4210.dtsi b/arch/arm/boot/dts/exynos4210.dtsi
> index 03dd61f64809..522f3a7ed07f 100644
> --- a/arch/arm/boot/dts/exynos4210.dtsi
> +++ b/arch/arm/boot/dts/exynos4210.dtsi
> @@ -64,6 +64,12 @@
>  		};
>  	};
>  
> +	arm_pmu {
> +		compatible = "arm,cortex-a9-pmu";
> +		interrupt-parent = <&combiner>;
> +		interrupts = <2 2>, <3 2>;
> +	};
> +
>  	sysram: sysram@2020000 {
>  		compatible = "mmio-sram";
>  		reg = <0x02020000 0x20000>;
> diff --git a/arch/arm/boot/dts/exynos4412.dtsi b/arch/arm/boot/dts/exynos4412.dtsi
> index b255ac55b1c1..468c2795481c 100644
> --- a/arch/arm/boot/dts/exynos4412.dtsi
> +++ b/arch/arm/boot/dts/exynos4412.dtsi
> @@ -150,6 +150,12 @@
>  		};
>  	};
>  
> +	arm_pmu {
> +		compatible = "arm,cortex-a9-pmu";
> +		interrupt-parent = <&combiner>;
> +		interrupts = <2 2>, <3 2>, <18 2>, <19 2>;
> +	};
> +
>  	sysram@2020000 {
>  		compatible = "mmio-sram";
>  		reg = <0x02020000 0x40000>;
> 
