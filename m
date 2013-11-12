From: Kukjin Kim <kgene@kernel.org>
Subject: RE: [RESEND] [PATCH V3] ARM: dts: Add DMA controller node info on
 Exynos5420.
Date: Tue, 12 Nov 2013 20:13:11 +0900
Message-ID: <086601cedf98$2cb9f310$862dd930$@org>
References: <1381137944-30503-1-git-send-email-l.krishna@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:50478 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754696Ab3KLLNN (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 12 Nov 2013 06:13:13 -0500
In-reply-to: <1381137944-30503-1-git-send-email-l.krishna@samsung.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Leela Krishna Amudala' <l.krishna@samsung.com>, linux-samsung-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, broonie@kernel.org, padma.kvr@gmail.com, 'Padmavathi Venna' <padma.v@samsung.com>

Leela Krishna Amudala wrote:
> 
+ dt ml.

> From: Padmavathi Venna <padma.v@samsung.com>
> 
> This patch adds dma controller node info on Exynos5420.
> Exynos5420 has adma for audio IPs. As adma clk is dependent
> on audss clk provider that will be added later.
> 
> Signed-off-by: Padmavathi Venna <padma.v@samsung.com>
> Signed-off-by: Leela Krishna Amudala <l.krishna@samsung.com>
> ---
> Change since V2:
> 	- Removed adma node as adma clock is dependent audss clock provider.
> 
> Changes since V1:
>         - In V1, dma node common stuff was added in common exynos5.dtsi
file.
>           This was removed as per Kukjin comment and added in
> exynos5420.dtsi.
> 
>  arch/arm/boot/dts/exynos5420.dtsi |   52
> +++++++++++++++++++++++++++++++++++++
>  1 file changed, 52 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/exynos5420.dtsi
> b/arch/arm/boot/dts/exynos5420.dtsi
> index d537cd7..15465f8 100644
> --- a/arch/arm/boot/dts/exynos5420.dtsi
> +++ b/arch/arm/boot/dts/exynos5420.dtsi
> @@ -186,6 +186,58 @@
>  		status = "okay";
>  	};
> 
> +	amba {
> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +		compatible = "arm,amba-bus";
> +		interrupt-parent = <&gic>;
> +		ranges;
> +
> +		pdma0: pdma@121A0000 {
> +			compatible = "arm,pl330", "arm,primecell";
> +			reg = <0x121A0000 0x1000>;
> +			interrupts = <0 34 0>;
> +			clocks = <&clock 362>;
> +			clock-names = "apb_pclk";
> +			#dma-cells = <1>;
> +			#dma-channels = <8>;
> +			#dma-requests = <32>;
> +		};
> +
> +		pdma1: pdma@121B0000 {
> +			compatible = "arm,pl330", "arm,primecell";
> +			reg = <0x121B0000 0x1000>;
> +			interrupts = <0 35 0>;
> +			clocks = <&clock 363>;
> +			clock-names = "apb_pclk";
> +			#dma-cells = <1>;
> +			#dma-channels = <8>;
> +			#dma-requests = <32>;
> +		};
> +
> +		mdma0: mdma@10800000 {
> +			compatible = "arm,pl330", "arm,primecell";
> +			reg = <0x10800000 0x1000>;
> +			interrupts = <0 33 0>;
> +			clocks = <&clock 473>;
> +			clock-names = "apb_pclk";
> +			#dma-cells = <1>;
> +			#dma-channels = <8>;
> +			#dma-requests = <1>;
> +		};
> +
> +		mdma1: mdma@11C10000 {
> +			compatible = "arm,pl330", "arm,primecell";
> +			reg = <0x11C10000 0x1000>;
> +			interrupts = <0 124 0>;
> +			clocks = <&clock 442>;
> +			clock-names = "apb_pclk";
> +			#dma-cells = <1>;
> +			#dma-channels = <8>;
> +			#dma-requests = <1>;
> +		};
> +	};
> +
>  	serial@12C00000 {
>  		clocks = <&clock 257>, <&clock 128>;
>  		clock-names = "uart", "clk_uart_baud0";
> --
> 1.7.10.4

Sorry for late response.

Looks OK to me, many properties for dma are same with 5250 though...

Applied, thanks.
- Kukjin
