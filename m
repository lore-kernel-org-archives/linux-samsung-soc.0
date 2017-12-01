From: Chanwoo Choi <cw00.choi@samsung.com>
Subject: Re: [PATCH v2 5/6] arm64: dts: exynos: Add AUD power domain to
 Exynos5433 SoC
Date: Fri, 01 Dec 2017 10:20:14 +0900
Message-ID: <5A20AE4E.3020604@samsung.com>
References: <20171129112638.15813-1-m.szyprowski@samsung.com>
        <CGME20171129112651eucas1p18703aa0c427252abed987e1553ff4efe@eucas1p1.samsung.com>
        <20171129112638.15813-6-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:41224 "EHLO
        mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751303AbdLABUP (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 30 Nov 2017 20:20:15 -0500
In-reply-to: <20171129112638.15813-6-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>, linux-samsung-soc@vger.kernel.org
Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Inki Dae <inki.dae@samsung.com>

Dear Marek,

On 2017년 11월 29일 20:26, Marek Szyprowski wrote:
> This patch adds support for AUD power domain to Exynos5433 SoCs, which
> contains following devices: a clock controller, a pin controller, LPASS
> module, I2S controller, ADMA PL330 engine and UART #3 device.
> 
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
>  arch/arm64/boot/dts/exynos/exynos5433.dtsi | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/exynos/exynos5433.dtsi b/arch/arm64/boot/dts/exynos/exynos5433.dtsi
> index cfa2a0d4dc2f..2c019a0fd8e3 100644
> --- a/arch/arm64/boot/dts/exynos/exynos5433.dtsi
> +++ b/arch/arm64/boot/dts/exynos/exynos5433.dtsi
> @@ -395,6 +395,7 @@
>  			#clock-cells = <1>;
>  			clock-names = "oscclk", "fout_aud_pll";
>  			clocks = <&xxti>, <&cmu_top CLK_FOUT_AUD_PLL>;
> +			power-domains = <&pd_aud>;
>  		};
>  
>  		cmu_bus0: clock-controller@13600000 {
> @@ -568,6 +569,13 @@
>  			label = "DISP";
>  		};
>  
> +		pd_aud: power-domain@105c40c0 {
> +			compatible = "samsung,exynos5433-pd";
> +			reg = <0x105c40c0 0x20>;
> +			#power-domain-cells = <0>;
> +			label = "AUD";
> +		};
> +
>  		pd_mfc: power-domain@105c4180 {
>  			compatible = "samsung,exynos5433-pd";
>  			reg = <0x105c4180 0x20>;
> @@ -687,6 +695,7 @@
>  			compatible = "samsung,exynos5433-pinctrl";
>  			reg = <0x114b0000 0x1000>;
>  			interrupts = <GIC_SPI 68 IRQ_TYPE_LEVEL_HIGH>;
> +			power-domains = <&pd_aud>;
>  		};
>  
>  		pinctrl_cpif: pinctrl@10fe0000 {
> @@ -1566,6 +1575,7 @@
>  			clocks = <&cmu_aud CLK_PCLK_SFR0_CTRL>;
>  			clock-names = "sfr0_ctrl";
>  			samsung,pmu-syscon = <&pmu_system_controller>;
> +			power-domains = <&pd_aud>;
>  			#address-cells = <1>;
>  			#size-cells = <1>;
>  			ranges;
> @@ -1579,6 +1589,7 @@
>  				#dma-cells = <1>;
>  				#dma-channels = <8>;
>  				#dma-requests = <32>;
> +				power-domains = <&pd_aud>;
>  			};
>  
>  			i2s0: i2s0@11440000 {
> @@ -1595,6 +1606,7 @@
>  				clock-names = "iis", "i2s_opclk0", "i2s_opclk1";
>  				pinctrl-names = "default";
>  				pinctrl-0 = <&i2s0_bus>;
> +				power-domains = <&pd_aud>;
>  				status = "disabled";
>  			};
>  
> @@ -1607,6 +1619,7 @@
>  				clock-names = "uart", "clk_uart_baud0";
>  				pinctrl-names = "default";
>  				pinctrl-0 = <&uart_aud_bus>;
> +				power-domains = <&pd_aud>;
>  				status = "disabled";
>  			};
>  		};
> 

Looks good to me.
Reviewed-by: Chanwoo Choi <cw00.choi@samsung.com>

-- 
Best Regards,
Chanwoo Choi
Samsung Electronics
