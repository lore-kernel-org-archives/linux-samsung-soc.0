From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [PATCH] ARM: dts: Add audio subsystem nodes to exynos4.dtsi
Date: Wed, 21 May 2014 16:26:46 +0200
Message-ID: <537CB7A6.3050202@samsung.com>
References: <1400239733-11782-1-git-send-email-s.nawrocki@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:30786 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751425AbaEUO0v (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 21 May 2014 10:26:51 -0400
Received: from eucpsbgm1.samsung.com (unknown [203.254.199.244])
 by mailout1.w1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0N5X00705HGM7C00@mailout1.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 21 May 2014 15:26:46 +0100 (BST)
In-reply-to: <1400239733-11782-1-git-send-email-s.nawrocki@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: kgene.kim@samsung.com
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, kyungmin.park@samsung.com

On 16/05/14 13:28, Sylwester Nawrocki wrote:
> This patch adds the audio subsystem clock controller and the I2S
> IP block nodes for Exynos4 SoC series.
> 
> Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>

Can this still be applied in the coming merge window ?

Thanks,
Sylwester
> ---
>  arch/arm/boot/dts/exynos4.dtsi |   38 ++++++++++++++++++++++++++++++++++++++
>  1 file changed, 38 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/exynos4.dtsi b/arch/arm/boot/dts/exynos4.dtsi
> index 58ff8e2..0eb768c 100644
> --- a/arch/arm/boot/dts/exynos4.dtsi
> +++ b/arch/arm/boot/dts/exynos4.dtsi
> @@ -20,6 +20,7 @@
>   */
> 
>  #include <dt-bindings/clock/exynos4.h>
> +#include <dt-bindings/clock/exynos-audss-clk.h>
>  #include "skeleton.dtsi"
> 
>  / {
> @@ -45,6 +46,23 @@
>  		fimc3 = &fimc_3;
>  	};
> 
> +	clock_audss: clock-controller@03810000 {
> +		compatible = "samsung,exynos4210-audss-clock";
> +		reg = <0x03810000 0x0C>;
> +		#clock-cells = <1>;
> +	};
> +
> +	i2s0: i2s@03830000 {
> +		compatible = "samsung,s5pv210-i2s";
> +		reg = <0x03830000 0x100>;
> +		clocks = <&clock_audss EXYNOS_I2S_BUS>;
> +		clock-names = "iis";
> +		dmas = <&pdma0 12>, <&pdma0 11>, <&pdma0 10>;
> +		dma-names = "tx", "rx", "tx-sec";
> +		samsung,idma-addr = <0x03000000>;
> +		status = "disabled";
> +	};
> +
>  	chipid@10000000 {
>  		compatible = "samsung,exynos4210-chipid";
>  		reg = <0x10000000 0x100>;
> @@ -289,6 +307,26 @@
>  		status = "disabled";
>  	};
> 
> +	i2s1: i2s@13960000 {
> +		compatible = "samsung,s5pv210-i2s";
> +		reg = <0x13960000 0x100>;
> +		clocks = <&clock CLK_I2S1>;
> +		clock-names = "iis";
> +		dmas = <&pdma1 12>, <&pdma1 11>;
> +		dma-names = "tx", "rx";
> +		status = "disabled";
> +	};
> +
> +	i2s2: i2s@13970000 {
> +		compatible = "samsung,s5pv210-i2s";
> +		reg = <0x13970000 0x100>;
> +		clocks = <&clock CLK_I2S2>;
> +		clock-names = "iis";
> +		dmas = <&pdma0 14>, <&pdma0 13>;
> +		dma-names = "tx", "rx";
> +		status = "disabled";
> +	};
> +
>  	mfc: codec@13400000 {
>  		compatible = "samsung,mfc-v5";
>  		reg = <0x13400000 0x10000>;
> --
> 1.7.9.5
