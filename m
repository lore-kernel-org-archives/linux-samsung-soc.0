From: Kukjin Kim <kgene@kernel.org>
Subject: RE: [PATCH 2/2] ARM: dts: Add DMA controller node info on Exynos5420.
Date: Wed, 14 Aug 2013 18:45:28 +0900
Message-ID: <110501ce98d3$0288bc40$079a34c0$@org>
References: <1373458449-19039-1-git-send-email-padma.v@samsung.com>
 <1373458449-19039-3-git-send-email-padma.v@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:47135 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752324Ab3HNJpa (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 14 Aug 2013 05:45:30 -0400
Received: from epcpsbgr5.samsung.com
 (u145.gpu120.samsung.co.kr [203.254.230.145])
 by mailout4.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MRI00LL6LRE7IW0@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 14 Aug 2013 18:45:29 +0900 (KST)
In-reply-to: <1373458449-19039-3-git-send-email-padma.v@samsung.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Padmavathi Venna' <padma.v@samsung.com>, linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, padma.kvr@gmail.com
Cc: sbkim73@samsung.com, broonie@kernel.org, dianders@chromium.org, abrestic@chromium.org, vinod.koul@intel.com

Padmavathi Venna wrote:
> 
> Exynos5420 has one separate DMA controller for I2S0 and PCM0. This patch
> adds the same node on exynos5420 dtsi and adds the DMA clk info for the
> remaining DMA controllers.
> 
> Signed-off-by: Padmavathi Venna <padma.v@samsung.com>
> ---
>  arch/arm/boot/dts/exynos5420.dtsi |   33
+++++++++++++++++++++++++++++++++
>  1 files changed, 33 insertions(+), 0 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/exynos5420.dtsi
> b/arch/arm/boot/dts/exynos5420.dtsi
> index a84f5f1..7035a4b 100644
> --- a/arch/arm/boot/dts/exynos5420.dtsi
> +++ b/arch/arm/boot/dts/exynos5420.dtsi
> @@ -137,6 +137,39 @@
>  		interrupts = <0 47 0>;
>  	};
> 
> +	amba {
> +		pdma0: pdma@121A0000 {
> +			clocks = <&clock 362>;
> +			clock-names = "apb_pclk";
> +		};
> +
> +		pdma1: pdma@121B0000 {
> +			clocks = <&clock 363>;
> +			clock-names = "apb_pclk";
> +		};
> +
> +		mdma0: mdma@10800000 {
> +			clocks = <&clock 473>;
> +			clock-names = "apb_pclk";
> +		};
> +
> +		mdma1: mdma@11C10000 {
> +			clocks = <&clock 442>;
> +			clock-names = "apb_pclk";
> +		};
> +
> +		adma: adma@03880000 {
> +			compatible = "arm,pl330", "arm,primecell";
> +			reg = <0x03880000 0x1000>;
> +			interrupts = <0 110 0>;
> +			clocks = <&clock_audss EXYNOS_ADMA>;
> +			clock-names = "apb_pclk";
> +			#dma-cells = <1>;
> +			#dma-channels = <6>;
> +			#dma-requests = <16>;
> +		};
> +	};
> +
>  	serial@12C00000 {
>  		clocks = <&clock 257>, <&clock 128>;
>  		clock-names = "uart", "clk_uart_baud0";
> --
> 1.7.4.4

See my comments on 1st patch and you need to re-spin for dmac on exynos5420.

Thanks,
Kukjin
