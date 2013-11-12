From: Kukjin Kim <kgene@kernel.org>
Subject: RE: [PATCH] ARM: dts: Add SPI nodes to the exynos5420 device tree file
Date: Tue, 12 Nov 2013 20:16:44 +0900
Message-ID: <086701cedf98$ab9d9f60$02d8de20$@org>
References: <1377856637-7595-1-git-send-email-l.krishna@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:50900 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752016Ab3KLLQp (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 12 Nov 2013 06:16:45 -0500
In-reply-to: <1377856637-7595-1-git-send-email-l.krishna@samsung.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Leela Krishna Amudala' <l.krishna@samsung.com>, linux-samsung-soc@vger.kernel.org
Cc: devicetree@vger.kernel.org, dianders@chromium.org, abrestic@chromium.org, t.figa@samsung.com

Leela Krishna Amudala  wrote:
> 
> Add SPI device tree nodes to Exynos5420 SoC
> 
> Signed-off-by: Doug Anderson <dianders@chromium.org>
> Signed-off-by: Leela Krishna Amudala <l.krishna@samsung.com>
> Reviewed-by: Andrew Bresticker <abrestic@chromium.org>
> ---
> Note: This patch is rebased on Kgene's for-next branch and is dependent on
> [V3] ARM: dts: Add DMA controller node info on Exynos5420.
> https://patchwork.kernel.org/patch/2851790/
> 
>  arch/arm/boot/dts/exynos5420.dtsi |   51
> +++++++++++++++++++++++++++++++++++++
>  1 file changed, 51 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/exynos5420.dtsi
> b/arch/arm/boot/dts/exynos5420.dtsi
> index 15465f8..8d9e980 100644
> --- a/arch/arm/boot/dts/exynos5420.dtsi
> +++ b/arch/arm/boot/dts/exynos5420.dtsi
> @@ -27,6 +27,9 @@
>  		pinctrl2 = &pinctrl_2;
>  		pinctrl3 = &pinctrl_3;
>  		pinctrl4 = &pinctrl_4;
> +		spi0 = &spi_0;
> +		spi1 = &spi_1;
> +		spi2 = &spi_2;
>  	};
> 
>  	cpus {
> @@ -238,6 +241,54 @@
>  		};
>  	};
> 
> +	spi_0: spi@12d20000 {
> +		compatible = "samsung,exynos4210-spi";
> +		reg = <0x12d20000 0x100>;
> +		interrupts = <0 66 0>;
> +		dmas = <&pdma0 5
> +			&pdma0 4>;
> +		dma-names = "tx", "rx";
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&spi0_bus>;
> +		clocks = <&clock 271>, <&clock 135>;
> +		clock-names = "spi", "spi_busclk0";
> +		status = "disabled";
> +	};
> +
> +	spi_1: spi@12d30000 {
> +		compatible = "samsung,exynos4210-spi";
> +		reg = <0x12d30000 0x100>;
> +		interrupts = <0 67 0>;
> +		dmas = <&pdma1 5
> +			&pdma1 4>;
> +		dma-names = "tx", "rx";
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&spi1_bus>;
> +		clocks = <&clock 272>, <&clock 136>;
> +		clock-names = "spi", "spi_busclk0";
> +		status = "disabled";
> +	};
> +
> +	spi_2: spi@12d40000 {
> +		compatible = "samsung,exynos4210-spi";
> +		reg = <0x12d40000 0x100>;
> +		interrupts = <0 68 0>;
> +		dmas = <&pdma0 7
> +			&pdma0 6>;
> +		dma-names = "tx", "rx";
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&spi2_bus>;
> +		clocks = <&clock 273>, <&clock 137>;
> +		clock-names = "spi", "spi_busclk0";
> +		status = "disabled";
> +	};
> +
>  	serial@12C00000 {
>  		clocks = <&clock 257>, <&clock 128>;
>  		clock-names = "uart", "clk_uart_baud0";
> --
> 1.7.10.4

Leela, do you still want to keep the status 'disabled' for SPIs?

Others look good to me.

Thanks,
Kukjin
