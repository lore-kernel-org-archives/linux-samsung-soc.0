From: Chanwoo Choi <cw00.choi@samsung.com>
Subject: Re: [PATCH v2 3/4] ARM: dts: exynos: add initial data for coupled
 regulators for Exynos5422/5800
Date: Tue, 16 Jul 2019 18:00:54 +0900
Message-ID: <27db3883-2d84-3585-6122-e861576ffadb@samsung.com>
References: <20190715120416.3561-1-k.konieczny@partner.samsung.com>
        <CGME20190715120432eucas1p1b32d72d239420b861bf8596d4e8a053d@eucas1p1.samsung.com>
        <20190715120416.3561-4-k.konieczny@partner.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190715120416.3561-4-k.konieczny@partner.samsung.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Kamil Konieczny <k.konieczny@partner.samsung.com>
Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, Kukjin Kim <kgene@kernel.org>, Kyungmin Park <kyungmin.park@samsung.com>, Mark Rutland <mark.rutland@arm.com>, MyungJoo Ham <myungjoo.ham@samsung.com>, Nishanth Menon <nm@ti.com>, Rob Herring <robh+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>, Viresh Kumar <vireshk@kernel.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, linux-samsung-soc@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

Hi,

On 19. 7. 15. 오후 9:04, Kamil Konieczny wrote:
> Declare Exynos5422/5800 voltage ranges for opp points for big cpu core and
> bus wcore and couple their voltage supllies as vdd_arm and vdd_int should
> be in 300mV range.
> 
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> Signed-off-by: Kamil Konieczny <k.konieczny@partner.samsung.com>
> ---
>  arch/arm/boot/dts/exynos5420.dtsi             | 34 +++++++++----------
>  arch/arm/boot/dts/exynos5422-odroid-core.dtsi |  4 +++
>  arch/arm/boot/dts/exynos5800-peach-pi.dts     |  4 +++
>  arch/arm/boot/dts/exynos5800.dtsi             | 32 ++++++++---------
>  4 files changed, 41 insertions(+), 33 deletions(-)

Reviewed-by: Chanwoo Choi <cw00.choi@samsung.com>

> 
> diff --git a/arch/arm/boot/dts/exynos5420.dtsi b/arch/arm/boot/dts/exynos5420.dtsi
> index 5fb2326875dc..0cbf74750553 100644
> --- a/arch/arm/boot/dts/exynos5420.dtsi
> +++ b/arch/arm/boot/dts/exynos5420.dtsi
> @@ -48,62 +48,62 @@
>  			opp-shared;
>  			opp-1800000000 {
>  				opp-hz = /bits/ 64 <1800000000>;
> -				opp-microvolt = <1250000>;
> +				opp-microvolt = <1250000 1250000 1500000>;
>  				clock-latency-ns = <140000>;
>  			};
>  			opp-1700000000 {
>  				opp-hz = /bits/ 64 <1700000000>;
> -				opp-microvolt = <1212500>;
> +				opp-microvolt = <1212500 1212500 1500000>;
>  				clock-latency-ns = <140000>;
>  			};
>  			opp-1600000000 {
>  				opp-hz = /bits/ 64 <1600000000>;
> -				opp-microvolt = <1175000>;
> +				opp-microvolt = <1175000 1175000 1500000>;
>  				clock-latency-ns = <140000>;
>  			};
>  			opp-1500000000 {
>  				opp-hz = /bits/ 64 <1500000000>;
> -				opp-microvolt = <1137500>;
> +				opp-microvolt = <1137500 1137500 1500000>;
>  				clock-latency-ns = <140000>;
>  			};
>  			opp-1400000000 {
>  				opp-hz = /bits/ 64 <1400000000>;
> -				opp-microvolt = <1112500>;
> +				opp-microvolt = <1112500 1112500 1500000>;
>  				clock-latency-ns = <140000>;
>  			};
>  			opp-1300000000 {
>  				opp-hz = /bits/ 64 <1300000000>;
> -				opp-microvolt = <1062500>;
> +				opp-microvolt = <1062500 1062500 1500000>;
>  				clock-latency-ns = <140000>;
>  			};
>  			opp-1200000000 {
>  				opp-hz = /bits/ 64 <1200000000>;
> -				opp-microvolt = <1037500>;
> +				opp-microvolt = <1037500 1037500 1500000>;
>  				clock-latency-ns = <140000>;
>  			};
>  			opp-1100000000 {
>  				opp-hz = /bits/ 64 <1100000000>;
> -				opp-microvolt = <1012500>;
> +				opp-microvolt = <1012500 1012500 1500000>;
>  				clock-latency-ns = <140000>;
>  			};
>  			opp-1000000000 {
>  				opp-hz = /bits/ 64 <1000000000>;
> -				opp-microvolt = < 987500>;
> +				opp-microvolt = < 987500 987500 1500000>;
>  				clock-latency-ns = <140000>;
>  			};
>  			opp-900000000 {
>  				opp-hz = /bits/ 64 <900000000>;
> -				opp-microvolt = < 962500>;
> +				opp-microvolt = < 962500 962500 1500000>;
>  				clock-latency-ns = <140000>;
>  			};
>  			opp-800000000 {
>  				opp-hz = /bits/ 64 <800000000>;
> -				opp-microvolt = < 937500>;
> +				opp-microvolt = < 937500 937500 1500000>;
>  				clock-latency-ns = <140000>;
>  			};
>  			opp-700000000 {
>  				opp-hz = /bits/ 64 <700000000>;
> -				opp-microvolt = < 912500>;
> +				opp-microvolt = < 912500 912500 1500000>;
>  				clock-latency-ns = <140000>;
>  			};
>  		};
> @@ -1100,23 +1100,23 @@
>  
>  			opp00 {
>  				opp-hz = /bits/ 64 <84000000>;
> -				opp-microvolt = <925000>;
> +				opp-microvolt = <925000 925000 1400000>;
>  			};
>  			opp01 {
>  				opp-hz = /bits/ 64 <111000000>;
> -				opp-microvolt = <950000>;
> +				opp-microvolt = <950000 950000 1400000>;
>  			};
>  			opp02 {
>  				opp-hz = /bits/ 64 <222000000>;
> -				opp-microvolt = <950000>;
> +				opp-microvolt = <950000 950000 1400000>;
>  			};
>  			opp03 {
>  				opp-hz = /bits/ 64 <333000000>;
> -				opp-microvolt = <950000>;
> +				opp-microvolt = <950000 950000 1400000>;
>  			};
>  			opp04 {
>  				opp-hz = /bits/ 64 <400000000>;
> -				opp-microvolt = <987500>;
> +				opp-microvolt = <987500 987500 1400000>;
>  			};
>  		};
>  
> diff --git a/arch/arm/boot/dts/exynos5422-odroid-core.dtsi b/arch/arm/boot/dts/exynos5422-odroid-core.dtsi
> index 25d95de15c9b..65d094256b54 100644
> --- a/arch/arm/boot/dts/exynos5422-odroid-core.dtsi
> +++ b/arch/arm/boot/dts/exynos5422-odroid-core.dtsi
> @@ -428,6 +428,8 @@
>  				regulator-max-microvolt = <1500000>;
>  				regulator-always-on;
>  				regulator-boot-on;
> +				regulator-coupled-with = <&buck3_reg>;
> +				regulator-coupled-max-spread = <300000>;
>  			};
>  
>  			buck3_reg: BUCK3 {
> @@ -436,6 +438,8 @@
>  				regulator-max-microvolt = <1400000>;
>  				regulator-always-on;
>  				regulator-boot-on;
> +				regulator-coupled-with = <&buck2_reg>;
> +				regulator-coupled-max-spread = <300000>;
>  			};
>  
>  			buck4_reg: BUCK4 {
> diff --git a/arch/arm/boot/dts/exynos5800-peach-pi.dts b/arch/arm/boot/dts/exynos5800-peach-pi.dts
> index e0f470fe54c8..5c1e965ed7e9 100644
> --- a/arch/arm/boot/dts/exynos5800-peach-pi.dts
> +++ b/arch/arm/boot/dts/exynos5800-peach-pi.dts
> @@ -257,6 +257,8 @@
>  				regulator-always-on;
>  				regulator-boot-on;
>  				regulator-ramp-delay = <12500>;
> +				regulator-coupled-with = <&buck3_reg>;
> +				regulator-coupled-max-spread = <300000>;
>  				regulator-state-mem {
>  					regulator-off-in-suspend;
>  				};
> @@ -269,6 +271,8 @@
>  				regulator-always-on;
>  				regulator-boot-on;
>  				regulator-ramp-delay = <12500>;
> +				regulator-coupled-with = <&buck2_reg>;
> +				regulator-coupled-max-spread = <300000>;
>  				regulator-state-mem {
>  					regulator-off-in-suspend;
>  				};
> diff --git a/arch/arm/boot/dts/exynos5800.dtsi b/arch/arm/boot/dts/exynos5800.dtsi
> index 57d3b319fd65..2a74735d161c 100644
> --- a/arch/arm/boot/dts/exynos5800.dtsi
> +++ b/arch/arm/boot/dts/exynos5800.dtsi
> @@ -22,61 +22,61 @@
>  
>  &cluster_a15_opp_table {
>  	opp-1700000000 {
> -		opp-microvolt = <1250000>;
> +		opp-microvolt = <1250000 1250000 1500000>;
>  	};
>  	opp-1600000000 {
> -		opp-microvolt = <1250000>;
> +		opp-microvolt = <1250000 1250000 1500000>;
>  	};
>  	opp-1500000000 {
> -		opp-microvolt = <1100000>;
> +		opp-microvolt = <1100000 1100000 1500000>;
>  	};
>  	opp-1400000000 {
> -		opp-microvolt = <1100000>;
> +		opp-microvolt = <1100000 1100000 1500000>;
>  	};
>  	opp-1300000000 {
> -		opp-microvolt = <1100000>;
> +		opp-microvolt = <1100000 1100000 1500000>;
>  	};
>  	opp-1200000000 {
> -		opp-microvolt = <1000000>;
> +		opp-microvolt = <1000000 1000000 1500000>;
>  	};
>  	opp-1100000000 {
> -		opp-microvolt = <1000000>;
> +		opp-microvolt = <1000000 1000000 1500000>;
>  	};
>  	opp-1000000000 {
> -		opp-microvolt = <1000000>;
> +		opp-microvolt = <1000000 1000000 1500000>;
>  	};
>  	opp-900000000 {
> -		opp-microvolt = <1000000>;
> +		opp-microvolt = <1000000 1000000 1500000>;
>  	};
>  	opp-800000000 {
> -		opp-microvolt = <900000>;
> +		opp-microvolt = <900000 900000 1500000>;
>  	};
>  	opp-700000000 {
> -		opp-microvolt = <900000>;
> +		opp-microvolt = <900000 900000 1500000>;
>  	};
>  	opp-600000000 {
>  		opp-hz = /bits/ 64 <600000000>;
> -		opp-microvolt = <900000>;
> +		opp-microvolt = <900000 900000 1500000>;
>  		clock-latency-ns = <140000>;
>  	};
>  	opp-500000000 {
>  		opp-hz = /bits/ 64 <500000000>;
> -		opp-microvolt = <900000>;
> +		opp-microvolt = <900000 900000 1500000>;
>  		clock-latency-ns = <140000>;
>  	};
>  	opp-400000000 {
>  		opp-hz = /bits/ 64 <400000000>;
> -		opp-microvolt = <900000>;
> +		opp-microvolt = <900000 900000 1500000>;
>  		clock-latency-ns = <140000>;
>  	};
>  	opp-300000000 {
>  		opp-hz = /bits/ 64 <300000000>;
> -		opp-microvolt = <900000>;
> +		opp-microvolt = <900000 900000 1500000>;
>  		clock-latency-ns = <140000>;
>  	};
>  	opp-200000000 {
>  		opp-hz = /bits/ 64 <200000000>;
> -		opp-microvolt = <900000>;
> +		opp-microvolt = <900000 900000 1500000>;
>  		clock-latency-ns = <140000>;
>  	};
>  };
> 


-- 
Best Regards,
Chanwoo Choi
Samsung Electronics
