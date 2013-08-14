From: Kukjin Kim <kgene@kernel.org>
Subject: RE: [PATCH v2 2/7] ARM: dts: Update FIMD DT node for Exynos5 SoCs
Date: Wed, 14 Aug 2013 16:33:56 +0900
Message-ID: <10a901ce98c0$a25c3de0$e714b9a0$@org>
References: <1375183178-8201-1-git-send-email-vikas.sajjan@linaro.org>
 <1375183178-8201-3-git-send-email-vikas.sajjan@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:15597 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1759290Ab3HNHd5 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 14 Aug 2013 03:33:57 -0400
In-reply-to: <1375183178-8201-3-git-send-email-vikas.sajjan@linaro.org>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Vikas Sajjan' <vikas.sajjan@linaro.org>, linux-samsung-soc@vger.kernel.org
Cc: t.figa@samsung.com, devicetree@vger.kernel.org, jg1.han@samsung.com, inki.dae@samsung.com, ajaynumb@gmail.com, patches@linaro.org, linaro-kernel@lists.linaro.org

Vikas Sajjan wrote:
> 
> Moves the properties of FIMD DT node which are common across Exynos5 based
> SoCs like Exynos5250 and Exxynos5420 to exynos5.dtsi
> 
%s/Exxynos/Exynos

> Signed-off-by: Vikas Sajjan <vikas.sajjan@linaro.org>
> ---
>  arch/arm/boot/dts/exynos5.dtsi           |   10 ++++++++++
>  arch/arm/boot/dts/exynos5250-arndale.dts |    1 +
>  arch/arm/boot/dts/exynos5250.dtsi        |    7 +------
>  3 files changed, 12 insertions(+), 6 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/exynos5.dtsi
> b/arch/arm/boot/dts/exynos5.dtsi
> index f65e124..d464b6c 100644
> --- a/arch/arm/boot/dts/exynos5.dtsi
> +++ b/arch/arm/boot/dts/exynos5.dtsi
> @@ -108,4 +108,14 @@
>  		interrupts = <0 42 0>;
>  		status = "disabled";
>  	};
> +
> +	fimd@14400000 {
> +		compatible = "samsung,exynos5250-fimd";
> +		interrupt-parent = <&combiner>;
> +		reg = <0x14400000 0x40000>;
> +		interrupt-names = "fifo", "vsync", "lcd_sys";
> +		interrupts = <18 4>, <18 5>, <18 6>;
> +		status = "disabled";
> +	};
> +

No need last empty line.

>  };
> diff --git a/arch/arm/boot/dts/exynos5250-arndale.dts
> b/arch/arm/boot/dts/exynos5250-arndale.dts
> index 96d528d..76825ef 100644
> --- a/arch/arm/boot/dts/exynos5250-arndale.dts
> +++ b/arch/arm/boot/dts/exynos5250-arndale.dts
> @@ -519,6 +519,7 @@
>  	};
> 
>  	fimd: fimd@14400000 {
> +		status = "okay";
>  		display-timings {
>  			native-mode = <&timing0>;
>  			timing0: timing@0 {
> diff --git a/arch/arm/boot/dts/exynos5250.dtsi
> b/arch/arm/boot/dts/exynos5250.dtsi
> index ef57277..238bdb2 100644
> --- a/arch/arm/boot/dts/exynos5250.dtsi
> +++ b/arch/arm/boot/dts/exynos5250.dtsi
> @@ -630,12 +630,7 @@
>  		};
>  	};
> 
> -	fimd {
> -		compatible = "samsung,exynos5250-fimd";
> -		interrupt-parent = <&combiner>;
> -		reg = <0x14400000 0x40000>;
> -		interrupt-names = "fifo", "vsync", "lcd_sys";
> -		interrupts = <18 4>, <18 5>, <18 6>;
> +	fimd@14400000 {
>  		clocks = <&clock 133>, <&clock 339>;
>  		clock-names = "sclk_fimd", "fimd";
>  	};
> --
> 1.7.9.5

But you don't need to repost because let me fix when I apply.

Thanks,
Kukjin
