From: Alim Akhtar <alim.akhtar@samsung.com>
Subject: Re: [v3] arm: dts: exynos: Enable DMA support for UART modules on
 Exynos5 SoCs
Date: Thu, 22 Dec 2016 16:44:01 +0530
Message-ID: <585BB579.9040403@samsung.com>
References: <1482141648-21294-1-git-send-email-m.szyprowski@samsung.com>
 <CGME20161222111557epcas4p3dd75d80c6a61b35c9477d5bd9bad75e3@epcas4p3.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:60872 "EHLO
        mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755467AbcLVLQL (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 22 Dec 2016 06:16:11 -0500
Received: from epcas2p2.samsung.com (unknown [182.195.41.54])
 by mailout3.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0OIL01D943AM1YB0@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 22 Dec 2016 20:15:58 +0900 (KST)
In-reply-to: <1482141648-21294-1-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>, linux-samsung-soc@vger.kernel.org
Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>

Hello,

On 12/19/2016 03:30 PM, Marek Szyprowski wrote:
> UART modules can use DMA for offloading data transfers and reducing
> interrupts, so enable this feature for Exynos5 boards. Tested on
> Google ChromeBook Snow (Exynos5250), Odroid XU (Exynos5410) and Odroid
> XU3 (Exynos5422) boards.
>
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
> v3:
> - added Exynos5410

make failed with this patch with below error:
   DTC     arch/arm/boot/dts/exynos5410-odroidxu.dtb
ERROR (phandle_references): Reference to non-existent node or label "pdma0"

ERROR (phandle_references): Reference to non-existent node or label "pdma0"

ERROR (phandle_references): Reference to non-existent node or label "pdma1"

ERROR (phandle_references): Reference to non-existent node or label "pdma1"

ERROR (phandle_references): Reference to non-existent node or label "pdma0"

ERROR (phandle_references): Reference to non-existent node or label "pdma0"

ERROR (phandle_references): Reference to non-existent node or label "pdma1"

ERROR (phandle_references): Reference to non-existent node or label "pdma1"

ERROR: Input tree has errors, aborting (use -f to force output)
make[1]: *** [arch/arm/boot/dts/exynos5410-odroidxu.dtb] Error 2
make: *** [dtbs] Error 2
-------------------------------------

I tried building against linux-next with tag v4.9.

69973b8 Linux 4.9
2e4333c Merge branch 'upstream' of 
git://git.linux-mips.org/pub/scm/ralf/upstream-linus
ba73515 MIPS: Lantiq: Fix mask of GPE frequency

Let me know if I am missing other patches.

> - fixed serial 1/2 again, in v2 they were incorrectly swaped as a result
>    of my hurry in patch posting
>
> v2:
> - added Exynos5250
> - fixed copy/paste typo for serial 2 and 3
> ---
>   arch/arm/boot/dts/exynos5250.dtsi | 8 ++++++++
>   arch/arm/boot/dts/exynos5410.dtsi | 8 ++++++++
>   arch/arm/boot/dts/exynos5420.dtsi | 8 ++++++++
>   3 files changed, 24 insertions(+)
>
> diff --git a/arch/arm/boot/dts/exynos5250.dtsi b/arch/arm/boot/dts/exynos5250.dtsi
> index b6d7444..0e04460 100644
> --- a/arch/arm/boot/dts/exynos5250.dtsi
> +++ b/arch/arm/boot/dts/exynos5250.dtsi
> @@ -1043,21 +1043,29 @@
>   &serial_0 {
>   	clocks = <&clock CLK_UART0>, <&clock CLK_SCLK_UART0>;
>   	clock-names = "uart", "clk_uart_baud0";
> +	dmas = <&pdma0 13>, <&pdma0 14>;
> +	dma-names = "rx", "tx";
>   };
>
>   &serial_1 {
>   	clocks = <&clock CLK_UART1>, <&clock CLK_SCLK_UART1>;
>   	clock-names = "uart", "clk_uart_baud0";
> +	dmas = <&pdma1 15>, <&pdma1 16>;
> +	dma-names = "rx", "tx";
>   };
>
>   &serial_2 {
>   	clocks = <&clock CLK_UART2>, <&clock CLK_SCLK_UART2>;
>   	clock-names = "uart", "clk_uart_baud0";
> +	dmas = <&pdma0 15>, <&pdma0 16>;
> +	dma-names = "rx", "tx";
>   };
>
>   &serial_3 {
>   	clocks = <&clock CLK_UART3>, <&clock CLK_SCLK_UART3>;
>   	clock-names = "uart", "clk_uart_baud0";
> +	dmas = <&pdma1 17>, <&pdma1 18>;
> +	dma-names = "rx", "tx";
>   };
>
>   #include "exynos5250-pinctrl.dtsi"
> diff --git a/arch/arm/boot/dts/exynos5410.dtsi b/arch/arm/boot/dts/exynos5410.dtsi
> index 2b6adaf..7eab4bc 100644
> --- a/arch/arm/boot/dts/exynos5410.dtsi
> +++ b/arch/arm/boot/dts/exynos5410.dtsi
> @@ -340,21 +340,29 @@
>   &serial_0 {
>   	clocks = <&clock CLK_UART0>, <&clock CLK_SCLK_UART0>;
>   	clock-names = "uart", "clk_uart_baud0";
> +	dmas = <&pdma0 13>, <&pdma0 14>;
> +	dma-names = "rx", "tx";
>   };
>
>   &serial_1 {
>   	clocks = <&clock CLK_UART1>, <&clock CLK_SCLK_UART1>;
>   	clock-names = "uart", "clk_uart_baud0";
> +	dmas = <&pdma1 15>, <&pdma1 16>;
> +	dma-names = "rx", "tx";
>   };
>
>   &serial_2 {
>   	clocks = <&clock CLK_UART2>, <&clock CLK_SCLK_UART2>;
>   	clock-names = "uart", "clk_uart_baud0";
> +	dmas = <&pdma0 15>, <&pdma0 16>;
> +	dma-names = "rx", "tx";
>   };
>
>   &serial_3 {
>   	clocks = <&clock CLK_UART3>, <&clock CLK_SCLK_UART3>;
>   	clock-names = "uart", "clk_uart_baud0";
> +	dmas = <&pdma1 17>, <&pdma1 18>;
> +	dma-names = "rx", "tx";
>   };
>
>   &sss {
> diff --git a/arch/arm/boot/dts/exynos5420.dtsi b/arch/arm/boot/dts/exynos5420.dtsi
> index 906a1a4..0154c2e 100644
> --- a/arch/arm/boot/dts/exynos5420.dtsi
> +++ b/arch/arm/boot/dts/exynos5420.dtsi
> @@ -1406,21 +1406,29 @@
>   &serial_0 {
>   	clocks = <&clock CLK_UART0>, <&clock CLK_SCLK_UART0>;
>   	clock-names = "uart", "clk_uart_baud0";
> +	dmas = <&pdma0 13>, <&pdma0 14>;
> +	dma-names = "rx", "tx";
>   };
>
>   &serial_1 {
>   	clocks = <&clock CLK_UART1>, <&clock CLK_SCLK_UART1>;
>   	clock-names = "uart", "clk_uart_baud0";
> +	dmas = <&pdma1 15>, <&pdma1 16>;
> +	dma-names = "rx", "tx";
>   };
>
>   &serial_2 {
>   	clocks = <&clock CLK_UART2>, <&clock CLK_SCLK_UART2>;
>   	clock-names = "uart", "clk_uart_baud0";
> +	dmas = <&pdma0 15>, <&pdma0 16>;
> +	dma-names = "rx", "tx";
>   };
>
>   &serial_3 {
>   	clocks = <&clock CLK_UART3>, <&clock CLK_SCLK_UART3>;
>   	clock-names = "uart", "clk_uart_baud0";
> +	dmas = <&pdma1 17>, <&pdma1 18>;
> +	dma-names = "rx", "tx";
>   };
>
>   &sss {
>
