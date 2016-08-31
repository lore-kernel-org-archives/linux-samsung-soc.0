From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v6 1/2] mfd: Add DT bindings documentation for Samsung
 Exynos LPASS
Date: Wed, 31 Aug 2016 12:31:23 +0100
Message-ID: <20160831113123.GL27357@dell>
References: <1470840500-2428-1-git-send-email-s.nawrocki@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wm0-f48.google.com ([74.125.82.48]:38247 "EHLO
        mail-wm0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1759408AbcHaL3h (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 31 Aug 2016 07:29:37 -0400
Received: by mail-wm0-f48.google.com with SMTP id 1so34966137wmz.1
        for <linux-samsung-soc@vger.kernel.org>; Wed, 31 Aug 2016 04:29:36 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <1470840500-2428-1-git-send-email-s.nawrocki@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: broonie@kernel.org, alsa-devel@alsa-project.org, robh@kernel.org, devicetree@vger.kernel.org, b.zolnierkie@samsung.com, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org

On Wed, 10 Aug 2016, Sylwester Nawrocki wrote:

> This patch adds documentation of the DT bindings for the Samsung
> Exynos SoC Low Power Audio Subsystem.
> 
> Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
> Acked-by: Rob Herring <robh@kernel.org>
> ---
> 
> Changes since v5:
>  - none.
> 
> Changes since v4:
>  - text reformatting, added VIC to the list of sub-devices, relative
>    paths used for the reference DT binding documentation files, added
>    example dts.
> 
> Changes since v3:
>  - moved to Documentation/devicetree/bindings/mfd,
>  - added #address-cells, #size-cells, ranges as required
>    properties,
>  - added description of the IP block subnodes and links
>    to their binding's documentation.
> 
> Changes since v2:
>  - none.
> ---
>  .../bindings/mfd/samsung,exynos5433-lpass.txt      | 70 ++++++++++++++++++++++
>  1 file changed, 70 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mfd/samsung,exynos5433-lpass.txt

Applied, thanks.

> diff --git a/Documentation/devicetree/bindings/mfd/samsung,exynos5433-lpass.txt b/Documentation/devicetree/bindings/mfd/samsung,exynos5433-lpass.txt
> new file mode 100644
> index 0000000..c110e11
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mfd/samsung,exynos5433-lpass.txt
> @@ -0,0 +1,70 @@
> +Samsung Exynos SoC Low Power Audio Subsystem (LPASS)
> +
> +Required properties:
> +
> + - compatible		: "samsung,exynos5433-lpass"
> + - reg			: should contain the LPASS top SFR region location
> +			  and size
> + - samsung,pmu-syscon	: the phandle to the Power Management Unit node
> + - #address-cells	: should be 1
> + - #size-cells		: should be 1
> + - ranges		: must be present
> +
> +Each IP block of the Low Power Audio Subsystem should be specified as
> +an optional sub-node. For "samsung,exynos5433-lpass" compatible this includes:
> +UART, SLIMBUS, PCM, I2S, DMAC, Timers 0...4, VIC, WDT 0...1 devices.
> +
> +Bindings of the sub-nodes are described in:
> +  ../serial/samsung_uart.txt
> +  ../sound/samsung-i2s.txt
> +  ../dma/arm-pl330.txt
> +
> +
> +Example:
> +
> +audio-subsystem {
> +	compatible = "samsung,exynos5433-lpass";
> +	reg = <0x11400000 0x100>, <0x11500000 0x08>;
> +	samsung,pmu-syscon = <&pmu_system_controller>;
> +	#address-cells = <1>;
> +	#size-cells = <1>;
> +	ranges;
> +
> +	adma: adma@11420000 {
> +		compatible = "arm,pl330", "arm,primecell";
> +		reg = <0x11420000 0x1000>;
> +		interrupts = <0 73 0>;
> +		clocks = <&cmu_aud CLK_ACLK_DMAC>;
> +		clock-names = "apb_pclk";
> +		#dma-cells = <1>;
> +		#dma-channels = <8>;
> +		#dma-requests = <32>;
> +	};
> +
> +	i2s0: i2s0@11440000 {
> +		compatible = "samsung,exynos7-i2s";
> +		reg = <0x11440000 0x100>;
> +		dmas = <&adma 0 &adma 2>;
> +		dma-names = "tx", "rx";
> +		interrupts = <0 70 0>;
> +		clocks = <&cmu_aud CLK_PCLK_AUD_I2S>,
> +			 <&cmu_aud CLK_SCLK_AUD_I2S>,
> +			 <&cmu_aud CLK_SCLK_I2S_BCLK>;
> +		clock-names = "iis", "i2s_opclk0", "i2s_opclk1";
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&i2s0_bus>;
> +		status = "disabled";
> +	};
> +
> +	serial_3: serial@11460000 {
> +		compatible = "samsung,exynos5433-uart";
> +		reg = <0x11460000 0x100>;
> +		interrupts = <0 67 0>;
> +		clocks = <&cmu_aud CLK_PCLK_AUD_UART>,
> +			 <&cmu_aud CLK_SCLK_AUD_UART>;
> +		clock-names = "uart", "clk_uart_baud0";
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&uart_aud_bus>;
> +		status = "disabled";
> +	};
> + };

-- 
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
