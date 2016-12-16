From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v2] arm: dts: exynos: Enable DMA support for UART modules
 on Exynos5 SoCs
Date: Fri, 16 Dec 2016 18:50:59 +0200
Message-ID: <20161216165059.GA3428@kozik-lap>
References: <1481891254-7992-1-git-send-email-m.szyprowski@samsung.com>
 <1481891940-10385-1-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wm0-f67.google.com ([74.125.82.67]:34477 "EHLO
        mail-wm0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S938609AbcLPQvQ (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 16 Dec 2016 11:51:16 -0500
Received: by mail-wm0-f67.google.com with SMTP id g23so6545110wme.1
        for <linux-samsung-soc@vger.kernel.org>; Fri, 16 Dec 2016 08:51:10 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <1481891940-10385-1-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, Sylwester Nawrocki <s.nawrocki@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>

On Fri, Dec 16, 2016 at 01:39:00PM +0100, Marek Szyprowski wrote:
> UART modules can use DMA for offloading data transfers and reducing
> interrupts, so enable this feature for Exynos5 boards. Tested on
> Google ChromeBook Snow (Exynos5250) and Odroid XU3 (Exynos5422) boards.
> 
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
> v2:
> - added Exynos5250
> - fixed copy/paste typo for serial 2 and 3
> ---
>  arch/arm/boot/dts/exynos5250.dtsi | 8 ++++++++
>  arch/arm/boot/dts/exynos5420.dtsi | 8 ++++++++
>  2 files changed, 16 insertions(+)
> 

On Exynos4412 enabling DMA for serial exposed some interesting bugs so I
assume here the fun will start after applying? :)

Looks good, what about Exynos5410?

Best regards,
Krzysztof

> diff --git a/arch/arm/boot/dts/exynos5250.dtsi b/arch/arm/boot/dts/exynos5250.dtsi
> index 255b7c891d59..fc7ae8e557cc 100644
> --- a/arch/arm/boot/dts/exynos5250.dtsi
> +++ b/arch/arm/boot/dts/exynos5250.dtsi
> @@ -1047,21 +1047,29 @@
>  &serial_0 {
>  	clocks = <&clock CLK_UART0>, <&clock CLK_SCLK_UART0>;
>  	clock-names = "uart", "clk_uart_baud0";
> +	dmas = <&pdma0 13>, <&pdma0 14>;
> +	dma-names = "rx", "tx";
>  };
>  
>  &serial_1 {
>  	clocks = <&clock CLK_UART1>, <&clock CLK_SCLK_UART1>;
>  	clock-names = "uart", "clk_uart_baud0";
> +	dmas = <&pdma0 15>, <&pdma0 16>;
> +	dma-names = "rx", "tx";
>  };
>  
>  &serial_2 {
>  	clocks = <&clock CLK_UART2>, <&clock CLK_SCLK_UART2>;
>  	clock-names = "uart", "clk_uart_baud0";
> +	dmas = <&pdma1 15>, <&pdma1 16>;
> +	dma-names = "rx", "tx";
>  };
>  
>  &serial_3 {
>  	clocks = <&clock CLK_UART3>, <&clock CLK_SCLK_UART3>;
>  	clock-names = "uart", "clk_uart_baud0";
> +	dmas = <&pdma1 17>, <&pdma1 18>;
> +	dma-names = "rx", "tx";
>  };
>  
>  #include "exynos5250-pinctrl.dtsi"
> diff --git a/arch/arm/boot/dts/exynos5420.dtsi b/arch/arm/boot/dts/exynos5420.dtsi
> index bb90326e53d2..f5468bbe8f13 100644
> --- a/arch/arm/boot/dts/exynos5420.dtsi
> +++ b/arch/arm/boot/dts/exynos5420.dtsi
> @@ -1422,21 +1422,29 @@
>  &serial_0 {
>  	clocks = <&clock CLK_UART0>, <&clock CLK_SCLK_UART0>;
>  	clock-names = "uart", "clk_uart_baud0";
> +	dmas = <&pdma0 13>, <&pdma0 14>;
> +	dma-names = "rx", "tx";
>  };
>  
>  &serial_1 {
>  	clocks = <&clock CLK_UART1>, <&clock CLK_SCLK_UART1>;
>  	clock-names = "uart", "clk_uart_baud0";
> +	dmas = <&pdma0 15>, <&pdma0 16>;
> +	dma-names = "rx", "tx";
>  };
>  
>  &serial_2 {
>  	clocks = <&clock CLK_UART2>, <&clock CLK_SCLK_UART2>;
>  	clock-names = "uart", "clk_uart_baud0";
> +	dmas = <&pdma1 15>, <&pdma1 16>;
> +	dma-names = "rx", "tx";
>  };
>  
>  &serial_3 {
>  	clocks = <&clock CLK_UART3>, <&clock CLK_SCLK_UART3>;
>  	clock-names = "uart", "clk_uart_baud0";
> +	dmas = <&pdma1 17>, <&pdma1 18>;
> +	dma-names = "rx", "tx";
>  };
>  
>  &sss {
> -- 
> 1.9.1
> 
