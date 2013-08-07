From: Tomasz Figa <t.figa@samsung.com>
Subject: Re: [PATCH V3 4/7] ARM: dts: exynos5250: move common i2s properties to
 exynos5 dtsi
Date: Wed, 07 Aug 2013 17:14:10 +0200
Message-ID: <1524793.q6RAF3Nan6@amdc1227>
References: <1375866616-5541-1-git-send-email-padma.v@samsung.com>
 <1375866616-5541-5-git-send-email-padma.v@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:41496 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932295Ab3HGPOO (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 7 Aug 2013 11:14:14 -0400
In-reply-to: <1375866616-5541-5-git-send-email-padma.v@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Padmavathi Venna <padma.v@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, padma.kvr@gmail.com, broonie@kernel.org, kgene.kim@samsung.com, tomasz.figa@gmail.com, abrestic@chromium.org

On Wednesday 07 of August 2013 14:40:13 Padmavathi Venna wrote:
> I2S nodes shares some properties across exynos5 SoCs (exynos5250
> and exyno5420). Common code is moved to exynos5.dtsi which is
> included in exyno5250 and exynos5420 SoC files.

Shouldn't this patch be ordered before patch 1/7, which already uses the 
i2s1 and i2s2 nodes inherited from exynos5.dtsi, even though they get moved 
to it later in this series.

Best regards,
Tomasz

> Signed-off-by: Padmavathi Venna <padma.v@samsung.com>
> ---
>  arch/arm/boot/dts/exynos5.dtsi    |   21 +++++++++++++++++++++
>  arch/arm/boot/dts/exynos5250.dtsi |   12 ------------
>  2 files changed, 21 insertions(+), 12 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/exynos5.dtsi
> b/arch/arm/boot/dts/exynos5.dtsi index ec384c9..c37b57d 100644
> --- a/arch/arm/boot/dts/exynos5.dtsi
> +++ b/arch/arm/boot/dts/exynos5.dtsi
> @@ -191,4 +191,25 @@
>  		#size-cells = <0>;
>  		status = "disabled";
>  	};
> +
> +	i2s0: i2s@03830000 {
> +		reg = <0x03830000 0x100>;
> +		samsung,idma-addr = <0x03000000>;
> +	};
> +
> +	i2s1: i2s@12D60000 {
> +		compatible = "samsung,s3c6410-i2s";
> +		reg = <0x12D60000 0x100>;
> +		dmas = <&pdma1 12
> +			&pdma1 11>;
> +		dma-names = "tx", "rx";
> +	};
> +
> +	i2s2: i2s@12D70000 {
> +		compatible = "samsung,s3c6410-i2s";
> +		reg = <0x12D70000 0x100>;
> +		dmas = <&pdma0 12
> +			&pdma0 11>;
> +		dma-names = "tx", "rx";
> +	};
>  };
> diff --git a/arch/arm/boot/dts/exynos5250.dtsi
> b/arch/arm/boot/dts/exynos5250.dtsi index 5b36121..3873ff7 100644
> --- a/arch/arm/boot/dts/exynos5250.dtsi
> +++ b/arch/arm/boot/dts/exynos5250.dtsi
> @@ -394,7 +394,6 @@
> 
>  	i2s0: i2s@03830000 {
>  		compatible = "samsung,s5pv210-i2s";
> -		reg = <0x03830000 0x100>;
>  		dmas = <&pdma0 10
>  			&pdma0 9
>  			&pdma0 8>;
> @@ -403,17 +402,11 @@
>  			<&clock_audss EXYNOS_I2S_BUS>,
>  			<&clock_audss EXYNOS_SCLK_I2S>;
>  		clock-names = "iis", "i2s_opclk0", "i2s_opclk1";
> -		samsung,idma-addr = <0x03000000>;
>  		pinctrl-names = "default";
>  		pinctrl-0 = <&i2s0_bus>;
>  	};
> 
>  	i2s1: i2s@12D60000 {
> -		compatible = "samsung,s3c6410-i2s";
> -		reg = <0x12D60000 0x100>;
> -		dmas = <&pdma1 12
> -			&pdma1 11>;
> -		dma-names = "tx", "rx";
>  		clocks = <&clock 307>, <&clock 157>;
>  		clock-names = "iis", "i2s_opclk0";
>  		pinctrl-names = "default";
> @@ -421,11 +414,6 @@
>  	};
> 
>  	i2s2: i2s@12D70000 {
> -		compatible = "samsung,s3c6410-i2s";
> -		reg = <0x12D70000 0x100>;
> -		dmas = <&pdma0 12
> -			&pdma0 11>;
> -		dma-names = "tx", "rx";
>  		clocks = <&clock 308>, <&clock 158>;
>  		clock-names = "iis", "i2s_opclk0";
>  		pinctrl-names = "default";
