From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: Re: [PATCH] ARM: dts: exynos: Add pin configuration for read strobe
 for Odroid XU3/XU4 eMMC
Date: Fri, 22 Feb 2019 11:29:13 +0100
Message-ID: <d4f36ce1-ddef-5756-05dc-74e8dd08417c@samsung.com>
References: <CGME20190222102034epcas3p373245ed6e3e83e297bcaff48aec37992@epcas3p3.samsung.com>
        <20190222101948.848-1-linux.amoon@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190222101948.848-1-linux.amoon@gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Anand Moon <linux.amoon@gmail.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, linux-kernel@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

Hi Anand,

On 2019-02-22 11:19, Anand Moon wrote:
> Add Read Strobe RDQS pin configuration for eMMC to support higher data rate read/write.
>
> Signed-off-by: Anand Moon <linux.amoon@gmail.com>
> ---
>  arch/arm/boot/dts/exynos5420-pinctrl.dtsi          | 6 ++++++
>  arch/arm/boot/dts/exynos5422-odroidxu3-common.dtsi | 2 +-
>  2 files changed, 7 insertions(+), 1 deletion(-)
>
> diff --git a/arch/arm/boot/dts/exynos5420-pinctrl.dtsi b/arch/arm/boot/dts/exynos5420-pinctrl.dtsi
> index b82af7c89654..4fb3865e082a 100644
> --- a/arch/arm/boot/dts/exynos5420-pinctrl.dtsi
> +++ b/arch/arm/boot/dts/exynos5420-pinctrl.dtsi
> @@ -206,6 +206,12 @@
>  		samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV4>;
>  	};
>  
> +	sd0_rdqs: sd0-rdqs {
> +		samsung,pins = "gpc0-7";
> +		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
> +		samsung,pin-pud = <EXYNOS_PIN_PULL_DOWN>;
> +	};
> +

The above lines are not needed. There is already a sd0_rclk node with
exactly the same configuration just above your change.

>  	sd1_clk: sd1-clk {
>  		samsung,pins = "gpc1-0";
>  		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
> diff --git a/arch/arm/boot/dts/exynos5422-odroidxu3-common.dtsi b/arch/arm/boot/dts/exynos5422-odroidxu3-common.dtsi
> index b299e541cac0..d41397748ed2 100644
> --- a/arch/arm/boot/dts/exynos5422-odroidxu3-common.dtsi
> +++ b/arch/arm/boot/dts/exynos5422-odroidxu3-common.dtsi
> @@ -411,7 +411,7 @@
>  	samsung,dw-mshc-hs400-timing = <0 2>;
>  	samsung,read-strobe-delay = <90>;
>  	pinctrl-names = "default";
> -	pinctrl-0 = <&sd0_clk &sd0_cmd &sd0_bus1 &sd0_bus4 &sd0_bus8 &sd0_cd &sd0_rclk>;
> +	pinctrl-0 = <&sd0_clk &sd0_cmd &sd0_rdqs &sd0_bus1 &sd0_bus4 &sd0_bus8 &sd0_cd &sd0_rclk>;
>  	bus-width = <8>;
>  	cap-mmc-highspeed;
>  	mmc-hs200-1_8v;

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland
