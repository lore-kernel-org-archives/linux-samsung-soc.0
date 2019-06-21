From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: Re: [PATCH 6/6] ARM: dts: exynos: Add regulator suspend
 configuration to Odroid XU3/XU4/HC1 family
Date: Fri, 21 Jun 2019 13:13:28 +0200
Message-ID: <3e5320aa-ac26-3d69-7a8c-35c2c36b0f76@samsung.com>
References: <20190620183530.5386-1-krzk@kernel.org>
        <CGME20190620183612epcas2p17aa8e12a10b92891ab2228abca402e0c@epcas2p1.samsung.com>
        <20190620183530.5386-6-krzk@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190620183530.5386-6-krzk@kernel.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Krzysztof Kozlowski <krzk@kernel.org>, Kukjin Kim <kgene@kernel.org>, Sangbeom Kim <sbkim73@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Lee Jones <lee.jones@linaro.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: notify@kernel.org, Sylwester Nawrocki <snawrocki@kernel.org>
List-Id: linux-samsung-soc@vger.kernel.org

Hi,

On 2019-06-20 20:35, Krzysztof Kozlowski wrote:
> Add the PMIC regulator suspend configuration to entire Odroid
> XU3/XU4/HC1 family of boards to reduce power usage during suspend.  The
> configuration is based on vendor (Hardkernel) reference kernel.
>
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

On XU4 (booted either from eMMC or SD) this reduces power consumption in 
suspend-to-ram from 120mA to about 87mA (@5V). Suspend-to-RAM also works 
fine on XU3, XU3lite and HC1.

Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>

> ---
>
> Tested on XU3 and HC1 with SD card.
> ---
>   arch/arm/boot/dts/exynos5422-odroid-core.dtsi | 92 +++++++++++++++++++
>   1 file changed, 92 insertions(+)
>
> diff --git a/arch/arm/boot/dts/exynos5422-odroid-core.dtsi b/arch/arm/boot/dts/exynos5422-odroid-core.dtsi
> index 0f967259ad29..5a4f7dd2568b 100644
> --- a/arch/arm/boot/dts/exynos5422-odroid-core.dtsi
> +++ b/arch/arm/boot/dts/exynos5422-odroid-core.dtsi
> @@ -177,6 +177,10 @@
>   				regulator-name = "vdd_adc";
>   				regulator-min-microvolt = <1800000>;
>   				regulator-max-microvolt = <1800000>;
> +
> +				regulator-state-mem {
> +					regulator-off-in-suspend;
> +				};
>   			};
>   
>   			ldo5_reg: LDO5 {
> @@ -184,6 +188,10 @@
>   				regulator-min-microvolt = <1800000>;
>   				regulator-max-microvolt = <1800000>;
>   				regulator-always-on;
> +
> +				regulator-state-mem {
> +					regulator-off-in-suspend;
> +				};
>   			};
>   
>   			ldo6_reg: LDO6 {
> @@ -191,6 +199,10 @@
>   				regulator-min-microvolt = <1000000>;
>   				regulator-max-microvolt = <1000000>;
>   				regulator-always-on;
> +
> +				regulator-state-mem {
> +					regulator-off-in-suspend;
> +				};
>   			};
>   
>   			ldo7_reg: LDO7 {
> @@ -198,6 +210,10 @@
>   				regulator-min-microvolt = <1800000>;
>   				regulator-max-microvolt = <1800000>;
>   				regulator-always-on;
> +
> +				regulator-state-mem {
> +					regulator-off-in-suspend;
> +				};
>   			};
>   
>   			ldo8_reg: LDO8 {
> @@ -205,6 +221,10 @@
>   				regulator-min-microvolt = <1800000>;
>   				regulator-max-microvolt = <1800000>;
>   				regulator-always-on;
> +
> +				regulator-state-mem {
> +					regulator-off-in-suspend;
> +				};
>   			};
>   
>   			ldo9_reg: LDO9 {
> @@ -212,6 +232,10 @@
>   				regulator-min-microvolt = <3000000>;
>   				regulator-max-microvolt = <3000000>;
>   				regulator-always-on;
> +
> +				regulator-state-mem {
> +					regulator-off-in-suspend;
> +				};
>   			};
>   
>   			ldo10_reg: LDO10 {
> @@ -219,6 +243,10 @@
>   				regulator-min-microvolt = <1800000>;
>   				regulator-max-microvolt = <1800000>;
>   				regulator-always-on;
> +
> +				regulator-state-mem {
> +					regulator-off-in-suspend;
> +				};
>   			};
>   
>   			ldo11_reg: LDO11 {
> @@ -226,6 +254,10 @@
>   				regulator-min-microvolt = <1000000>;
>   				regulator-max-microvolt = <1000000>;
>   				regulator-always-on;
> +
> +				regulator-state-mem {
> +					regulator-off-in-suspend;
> +				};
>   			};
>   
>   			ldo12_reg: LDO12 {
> @@ -239,6 +271,10 @@
>   				regulator-name = "vddq_mmc2";
>   				regulator-min-microvolt = <1800000>;
>   				regulator-max-microvolt = <2800000>;
> +
> +				regulator-state-mem {
> +					regulator-off-in-suspend;
> +				};
>   			};
>   
>   			ldo14_reg: LDO14 {
> @@ -253,6 +289,10 @@
>   				regulator-min-microvolt = <3300000>;
>   				regulator-max-microvolt = <3300000>;
>   				regulator-always-on;
> +
> +				regulator-state-mem {
> +					regulator-off-in-suspend;
> +				};
>   			};
>   
>   			ldo16_reg: LDO16 {
> @@ -267,18 +307,30 @@
>   				regulator-min-microvolt = <3300000>;
>   				regulator-max-microvolt = <3300000>;
>   				regulator-always-on;
> +
> +				regulator-state-mem {
> +					regulator-off-in-suspend;
> +				};
>   			};
>   
>   			ldo18_reg: LDO18 {
>   				regulator-name = "vdd_emmc_1V8";
>   				regulator-min-microvolt = <1800000>;
>   				regulator-max-microvolt = <1800000>;
> +
> +				regulator-state-mem {
> +					regulator-off-in-suspend;
> +				};
>   			};
>   
>   			ldo19_reg: LDO19 {
>   				regulator-name = "vdd_sd";
>   				regulator-min-microvolt = <2800000>;
>   				regulator-max-microvolt = <2800000>;
> +
> +				regulator-state-mem {
> +					regulator-off-in-suspend;
> +				};
>   			};
>   
>   			ldo20_reg: LDO20 {
> @@ -307,6 +359,10 @@
>   				regulator-min-microvolt = <1100000>;
>   				regulator-max-microvolt = <1100000>;
>   				regulator-always-on;
> +
> +				regulator-state-mem {
> +					regulator-off-in-suspend;
> +				};
>   			};
>   
>   			ldo24_reg: LDO24 {
> @@ -328,6 +384,10 @@
>   				regulator-name = "vdd_ldo26";
>   				regulator-min-microvolt = <800000>;
>   				regulator-max-microvolt = <3950000>;
> +
> +				regulator-state-mem {
> +					regulator-off-in-suspend;
> +				};
>   			};
>   
>   			ldo27_reg: LDO27 {
> @@ -335,6 +395,10 @@
>   				regulator-min-microvolt = <1000000>;
>   				regulator-max-microvolt = <1000000>;
>   				regulator-always-on;
> +
> +				regulator-state-mem {
> +					regulator-off-in-suspend;
> +				};
>   			};
>   
>   			ldo28_reg: LDO28 {
> @@ -342,6 +406,10 @@
>   				regulator-name = "vdd_ldo28";
>   				regulator-min-microvolt = <800000>;
>   				regulator-max-microvolt = <3950000>;
> +
> +				regulator-state-mem {
> +					regulator-off-in-suspend;
> +				};
>   			};
>   
>   			ldo29_reg: LDO29 {
> @@ -420,6 +488,10 @@
>   				regulator-max-microvolt = <1300000>;
>   				regulator-always-on;
>   				regulator-boot-on;
> +
> +				regulator-state-mem {
> +					regulator-off-in-suspend;
> +				};
>   			};
>   
>   			buck2_reg: BUCK2 {
> @@ -428,6 +500,10 @@
>   				regulator-max-microvolt = <1500000>;
>   				regulator-always-on;
>   				regulator-boot-on;
> +
> +				regulator-state-mem {
> +					regulator-off-in-suspend;
> +				};
>   			};
>   
>   			buck3_reg: BUCK3 {
> @@ -436,6 +512,10 @@
>   				regulator-max-microvolt = <1400000>;
>   				regulator-always-on;
>   				regulator-boot-on;
> +
> +				regulator-state-mem {
> +					regulator-off-in-suspend;
> +				};
>   			};
>   
>   			buck4_reg: BUCK4 {
> @@ -444,6 +524,10 @@
>   				regulator-max-microvolt = <1400000>;
>   				regulator-always-on;
>   				regulator-boot-on;
> +
> +				regulator-state-mem {
> +					regulator-off-in-suspend;
> +				};
>   			};
>   
>   			buck5_reg: BUCK5 {
> @@ -460,6 +544,10 @@
>   				regulator-max-microvolt = <1500000>;
>   				regulator-always-on;
>   				regulator-boot-on;
> +
> +				regulator-state-mem {
> +					regulator-off-in-suspend;
> +				};
>   			};
>   
>   			buck7_reg: BUCK7 {
> @@ -490,6 +578,10 @@
>   				regulator-name = "vdd_vmem";
>   				regulator-min-microvolt = <2850000>;
>   				regulator-max-microvolt = <2850000>;
> +
> +				regulator-state-mem {
> +					regulator-off-in-suspend;
> +				};
>   			};
>   		};
>   	};

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland
