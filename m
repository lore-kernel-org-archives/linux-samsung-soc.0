From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [PATCH v4 01/13] clk: samsung: exynos5433: Add binding document
 for Exynos5433 clock domains
Date: Mon, 02 Feb 2015 14:55:42 +0100
Message-ID: <54CF81DE.3010902@samsung.com>
References: <1422882074-19758-1-git-send-email-cw00.choi@samsung.com>
 <1422882074-19758-2-git-send-email-cw00.choi@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:50173 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753098AbbBBN4D (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 2 Feb 2015 08:56:03 -0500
In-reply-to: <1422882074-19758-2-git-send-email-cw00.choi@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Chanwoo Choi <cw00.choi@samsung.com>
Cc: tomasz.figa@gmail.com, mturquette@linaro.org, kgene@kernel.org, pankaj.dubey@samsung.com, sangbae90.lee@samsung.com, inki.dae@samsung.com, chanho61.park@samsung.com, sw0312.kim@samsung.com, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org

Hi Chanwoo,

On 02/02/15 14:01, Chanwoo Choi wrote:
> This patch adds devicetree binding document for Exynos5433 SoC system clock
> controller.
> 
> Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>
> Cc: Tomasz Figa <tomasz.figa@gmail.com>
> Signed-off-by: Chanwoo Choi <cw00.choi@samsung.com>
> Acked-by: Inki Dae <inki.dae@samsung.com>
> ---
>  .../devicetree/bindings/clock/exynos5433-clock.txt | 258 +++++++++++++++++++++
>  1 file changed, 258 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/exynos5433-clock.txt
> 
> diff --git a/Documentation/devicetree/bindings/clock/exynos5433-clock.txt b/Documentation/devicetree/bindings/clock/exynos5433-clock.txt
> new file mode 100644
> index 0000000..2d7a723
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/exynos5433-clock.txt
> @@ -0,0 +1,258 @@
> +* Samsung Exynos5433 CMU (Clock Management Units)
> +
> +The Exynos5433 clock controller generates and supplies clock to various
> +controllers within the Exynos5433 SoC.
> +
> +Required Properties:
> +
> +- compatible: should be one of the following.
> +  - "samsung,exynos5433-cmu-top"   - clock controller compatible for CMU_TOP
> +    which generates clocks for IMEM/FSYS/G3D/GSCL/HEVC/MSCL/G2D/MFC/PERIC/PERIS
> +    domains and bus clocks.
> +  - "samsung,exynos5433-cmu-cpif"  - clock controller compatible for CMU_CPIF
> +    which generates clocks for LLI (Low Latency Interface) IP.
> +  - "samsung,exynos5433-cmu-mif"   - clock controller compatible for CMU_MIF
> +    which generates clocks for DRAM Memory Controller domain.
> +  - "samsung,exynos5433-cmu-peric" - clock controller compatible for CMU_PERIC
> +    which generates clocks for UART/I2C/SPI/I2S/PCM/SPDIF/PWM/SLIMBUS IPs.
> +  - "samsung,exynos5433-cmu-peris" - clock controller compatible for CMU_PERIS
> +    which generates clocks for PMU/TMU/MCT/WDT/RTC/SECKEY/TZPC IPs.
> +  - "samsung,exynos5433-cmu-fsys"  - clock controller compatible for CMU_FSYS
> +    which generates clocks for USB/UFS/SDMMC/TSI/PDMA IPs.
> +  - "samsung,exynos5433-cmu-g2d"   - clock controller compatible for CMU_G2D
> +    which generates clocks for G2D/MDMA IPs.
> +  - "samsung,exynos5433-cmu-disp"  - clock controller compatible for CMU_DISP
> +    which generates clocks for Display (DECON/HDMI/DSIM/MIXER) IPs.
> +  - "samsung,exynos5433-cmu-aud"   - clock controller compatible for CMU_AUD
> +    which generates clocks for Cortex-A5/BUS/AUDIO clocks.
> +  - "samsung,exynos5433-cmu-bus0", "samsung,exynos5433-cmu-bus1"
> +    and "samsung,exynos5433-cmu-bus2" - clock controller compatible for CMU_BUS
> +    which generates global data buses clock and global peripheral buses clock.
> +  - "samsung,exynos5433-cmu-g3d"  - clock controller compatible for CMU_G3D
> +    which generates clocks for 3D Graphics Engine IP.
> +  - "samsung,exynos5433-cmu-gscl"  - clock controller compatible for CMU_GSCL
> +    which generates clocks for GSCALER IPs.
> +
> +- reg: physical base address of the controller and length of memory mapped
> +  region.
> +
> +- #clock-cells: should be 1.

Thanks for addressing my comments! It looks almost good enough, can you
just please also add clocks, clock-names to the list of required properties ?
I guess it's sufficient to mention that these properties should contain
values as listed in the examples below per each CMU.
This also applies to you following series of 9 patches.

> +
> +Each clock is assigned an identifier and client nodes can use this identifier
> +to specify the clock which they consume.
> +
> +All available clocks are defined as preprocessor macros in
> +dt-bindings/clock/exynos5433.h header and can be used in device
> +tree sources.
> +
> +Example 1: Examples of 'oscclk' source clock node are listed below.
> +
> +	xxti: xxti {
> +		compatible = "fixed-clock";
> +		clock-output-names = "oscclk";
> +		#clock-cells = <0>;
> +	};
> +
> +Example 2: Examples of clock controller nodes are listed below.
> +
> +	cmu_top: clock-controller@0x10030000 {
> +		compatible = "samsung,exynos5433-cmu-top";
> +		reg = <0x10030000 0x0c04>;
> +		#clock-cells = <1>;
> +
> +		clock-names = "oscclk",
> +			"sclk_mphy_pll",
> +			"sclk_mfc_pll",
> +			"sclk_bus_pll";
> +		clocks = <&xxti>,
> +		       <&cmu_cpif CLK_SCLK_MPHY_PLL>,
> +		       <&cmu_mif CLK_SCLK_MFC_PLL>,
> +		       <&cmu_mif CLK_SCLK_BUS_PLL>;
> +	};

> +	cmu_gscl: clock-controller@0x13cf0000 {
> +		compatible = "samsung,exynos5433-cmu-gscl";
> +		reg = <0x13cf0000 0x0b10>;
> +		#clock-cells = <1>;
> +
> +		clock-names = "oscclk",
> +			"aclk_gscl_111",
> +			"aclk_gscl_333";
> +		clocks = <&xxti>,
> +			<&cmu_top CLK_ACLK_GSCL_111>,
> +			<&cmu_top CLK_ACLK_GSCL_333>;
> +	};
> +
> +Example 3: UART controller node that consumes the clock generated by the clock
> +	   controller.
> +
> +	serial_0: serial@14C10000 {
> +		compatible = "samsung,exynos5433-uart";
> +		reg = <0x14C10000 0x100>;
> +		interrupts = <0 421 0>;
> +		clocks = <&cmu_peric CLK_PCLK_UART0>,
> +			 <&cmu_peric CLK_SCLK_UART0>;
> +		clock-names = "uart", "clk_uart_baud0";
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&uart0_bus>;
> +		status = "disabled";
> +	};
> +
> +Example 4: SPI controller node that consumes the clock generated by the clock
> +	   controller.

This fourth example doesn't look like it adds significant value, I'd say it
can be removed.

> +	spi_0: spi@14d20000 {
> +		compatible = "samsung,exynos7-spi";
> +		reg = <0x14d20000 0x100>;
> +		interrupts = <0 432 0>;
> +		dmas = <&pdma0 9>, <&pdma0 8>;
> +		dma-names = "tx", "rx";
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +		clocks = <&cmu_peric CLK_PCLK_SPI0>,
> +			 <&cmu_top CLK_SCLK_SPI0_PERIC>;
> +		clock-names = "spi", "spi_busclk0";
> +		samsung,spi-src-clk = <0>;
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&spi0_bus>;
> +		status = "disabled";
> +	};
> 

Also please don't forget to Cc devicetree@vger.kernel.org next time.

--
Thanks,
Sylwester
