From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH] ARM: dts: exynos: Add audio power domain support to
 Exynos542x SoCs
Date: Fri, 23 Dec 2016 04:17:29 +0200
Message-ID: <20161223021729.GA3420@kozik-lap>
References: <CGME20161222141755epcas5p4549c18c84aa823c553bb33a12eb82ee2@epcas5p4.samsung.com>
 <1482416264-12169-1-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wm0-f66.google.com ([74.125.82.66]:32894 "EHLO
        mail-wm0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751499AbcLWCRf (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 22 Dec 2016 21:17:35 -0500
Received: by mail-wm0-f66.google.com with SMTP id u144so39149495wmu.0
        for <linux-samsung-soc@vger.kernel.org>; Thu, 22 Dec 2016 18:17:34 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <1482416264-12169-1-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, Sylwester Nawrocki <s.nawrocki@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>

On Thu, Dec 22, 2016 at 03:17:44PM +0100, Marek Szyprowski wrote:
> Audio power domain includes following hardware modules: Pin controller
> for GPZ bank, AudioSS clock controller, PL330 ADMA device and Exynos I2S
> controller.
> 
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
> Currently this domain will not be turned off, because pinctrl and clock
> controller don't support runtime PM and PL330 ADMA requires irq-safe runtime
> PM. Separate patches for those devices/subsystems will be posted to get
> proper runtime PM available and finally let this power domain to be turned
> off.
> ---
>  arch/arm/boot/dts/exynos5420.dtsi | 10 ++++++++++
>  1 file changed, 10 insertions(+)


The issue discovered by me here:
http://lkml.iu.edu/hypermail/linux/kernel/1502.1/01733.html
does not happen anymore?

Best regards,
Krzysztof

> diff --git a/arch/arm/boot/dts/exynos5420.dtsi b/arch/arm/boot/dts/exynos5420.dtsi
> index 0154c2e..d9ebc33 100644
> --- a/arch/arm/boot/dts/exynos5420.dtsi
> +++ b/arch/arm/boot/dts/exynos5420.dtsi
> @@ -188,6 +188,7 @@
>  			clocks = <&clock CLK_FIN_PLL>, <&clock CLK_MAU_EPLL>,
>  				 <&clock CLK_SCLK_MAUDIO0>, <&clock CLK_SCLK_MAUPCM0>;
>  			clock-names = "pll_ref", "pll_in", "sclk_audio", "sclk_pcm_in";
> +			power-domains = <&mau_pd>;
>  		};
>  
>  		mfc: codec@11000000 {
> @@ -317,6 +318,12 @@
>  			clock-names = "oscclk", "clk0", "clk1", "clk2", "asb0", "asb1";
>  		};
>  
> +		mau_pd: power-domain@100440E0 {
> +			compatible = "samsung,exynos4210-pd";
> +			reg = <0x100440E0 0x20>;
> +			#power-domain-cells = <0>;
> +		};
> +
>  		pinctrl_0: pinctrl@13400000 {
>  			compatible = "samsung,exynos5420-pinctrl";
>  			reg = <0x13400000 0x1000>;
> @@ -351,6 +358,7 @@
>  			compatible = "samsung,exynos5420-pinctrl";
>  			reg = <0x03860000 0x1000>;
>  			interrupts = <0 47 IRQ_TYPE_LEVEL_HIGH>;
> +			power-domains = <&mau_pd>;
>  		};
>  
>  		amba {
> @@ -369,6 +377,7 @@
>  				#dma-cells = <1>;
>  				#dma-channels = <6>;
>  				#dma-requests = <16>;
> +				power-domains = <&mau_pd>;
>  			};
>  
>  			pdma0: pdma@121A0000 {
> @@ -441,6 +450,7 @@
>  			samsung,idma-addr = <0x03000000>;
>  			pinctrl-names = "default";
>  			pinctrl-0 = <&i2s0_bus>;
> +			power-domains = <&mau_pd>;
>  			status = "disabled";
>  		};
>  
> -- 
> 1.9.1
> 
