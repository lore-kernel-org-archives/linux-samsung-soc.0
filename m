From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH 01/25] ARM: dts: exynos4: add rotator nodes
Date: Fri, 13 Nov 2015 11:29:22 +0900
Message-ID: <56454B02.9030502@samsung.com>
References: <1447161821-1877-1-git-send-email-m.szyprowski@samsung.com>
 <1447161821-1877-2-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:58515 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932345AbbKMC3Y (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 12 Nov 2015 21:29:24 -0500
Received: from eucpsbgm2.samsung.com (unknown [203.254.199.245])
 by mailout2.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0NXQ00BQPEWYRC20@mailout2.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 13 Nov 2015 02:29:23 +0000 (GMT)
In-reply-to: <1447161821-1877-2-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>, dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org
Cc: Inki Dae <inki.dae@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Andrzej Hajda <a.hajda@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Tobias Jakobi <tjakobi@math.uni-bielefeld.de>, Gustavo Padovan <gustavo@padovan.org>, Javier Martinez Canillas <javier@osg.samsung.com>

On 10.11.2015 22:23, Marek Szyprowski wrote:
> This patch adds device node for Rotator device to Exynos 4210 and 4x12
> device tree files.
> 
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
>  arch/arm/boot/dts/exynos4.dtsi    | 10 +++++++++-
>  arch/arm/boot/dts/exynos4210.dtsi |  8 ++++++++
>  arch/arm/boot/dts/exynos4x12.dtsi |  4 ++++
>  3 files changed, 21 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm/boot/dts/exynos4.dtsi b/arch/arm/boot/dts/exynos4.dtsi
> index 2f31f773b096..3fa575ad7693 100644
> --- a/arch/arm/boot/dts/exynos4.dtsi
> +++ b/arch/arm/boot/dts/exynos4.dtsi
> @@ -718,6 +718,15 @@
>  		iommus = <&sysmmu_jpeg>;
>  	};
>  
> +	rotator: rotator@12810000 {
> +		compatible = "samsung,exynos4210-rotator";
> +		reg = <0x12810000 0x1000>;

One more question after looking at second patch. You are mapping size of
0x1000 instead of 0x64. Any particular reason? (it does not really
matter... just wondering)

Best regards,
Krzysztof

> +		interrupts = <0 83 0>;
> +		clocks = <&clock CLK_ROTATOR>;
> +		clock-names = "rotator";
> +		iommus = <&sysmmu_rotator>;
> +	};
> +
>  	hdmi: hdmi@12D00000 {
>  		compatible = "samsung,exynos4210-hdmi";
>  		reg = <0x12D00000 0x70000>;
> @@ -945,7 +954,6 @@
>  		interrupts = <5 0>;
>  		clock-names = "sysmmu", "master";
>  		clocks = <&clock CLK_SMMU_ROTATOR>, <&clock CLK_ROTATOR>;
> -		power-domains = <&pd_lcd0>;
>  		#iommu-cells = <0>;
>  	};
>  
> diff --git a/arch/arm/boot/dts/exynos4210.dtsi b/arch/arm/boot/dts/exynos4210.dtsi
> index 3e5ba665d200..b7474cf27e82 100644
> --- a/arch/arm/boot/dts/exynos4210.dtsi
> +++ b/arch/arm/boot/dts/exynos4210.dtsi
> @@ -279,3 +279,11 @@
>  		<&clock CLK_OUT_CPU>, <&clock CLK_XXTI>, <&clock CLK_XUSBXTI>;
>  	#clock-cells = <1>;
>  };
> +
> +&rotator {
> +	power-domains = <&pd_lcd0>;
> +};
> +
> +&sysmmu_rotator {
> +	power-domains = <&pd_lcd0>;
> +};
> diff --git a/arch/arm/boot/dts/exynos4x12.dtsi b/arch/arm/boot/dts/exynos4x12.dtsi
> index b77dac61ffb5..148b47ad3120 100644
> --- a/arch/arm/boot/dts/exynos4x12.dtsi
> +++ b/arch/arm/boot/dts/exynos4x12.dtsi
> @@ -339,6 +339,10 @@
>  	compatible = "samsung,exynos4212-jpeg";
>  };
>  
> +&rotator {
> +	compatible = "samsung,exynos4212-rotator";
> +};
> +
>  &mixer {
>  	compatible = "samsung,exynos4212-mixer";
>  	clock-names = "mixer", "hdmi", "sclk_hdmi", "vp";
> 
