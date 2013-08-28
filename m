From: Tomasz Figa <t.figa@samsung.com>
Subject: Re: [PATCH] ARM: DT: Exynos5250: fix number of interrupt-cells in mct
 node
Date: Wed, 28 Aug 2013 13:18:33 +0200
Message-ID: <6294395.8UjbZM2KH4@amdc1227>
References: <1377687641-15376-1-git-send-email-chander.kashyap@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:57583 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751936Ab3H1LSj (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 28 Aug 2013 07:18:39 -0400
Received: from eucpsbgm2.samsung.com (unknown [203.254.199.245])
 by mailout3.w1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MS8008YTNE7IVA0@mailout3.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 28 Aug 2013 12:18:37 +0100 (BST)
In-reply-to: <1377687641-15376-1-git-send-email-chander.kashyap@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Chander Kashyap <chander.kashyap@linaro.org>
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kgene.kim@samsung.com, thomas.ab@samsung.com

Hi Chander,

On Wednesday 28 of August 2013 16:30:41 Chander Kashyap wrote:
> Two cells were used to specify interrupts in mct node, while second cell
> always remains unused. Hence use only one cell.
> Suggested by Tomasz Figa.
> 
> Signed-off-by: Chander Kashyap <chander.kashyap@linaro.org>
> ---
> changes in v2:
> 	- Drop Changes for Exynos4 as done in separate patch by Tomasz
> 
>  arch/arm/boot/dts/exynos5250.dtsi |   19 +++++++++----------
>  1 file changed, 9 insertions(+), 10 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/exynos5250.dtsi
> b/arch/arm/boot/dts/exynos5250.dtsi index ef57277..f2f178a 100644
> --- a/arch/arm/boot/dts/exynos5250.dtsi
> +++ b/arch/arm/boot/dts/exynos5250.dtsi
> @@ -102,23 +102,22 @@
>  		compatible = "samsung,exynos4210-mct";
>  		reg = <0x101C0000 0x800>;
>  		interrupt-controller;
> -		#interrups-cells = <2>;
> +		#interrups-cells = <1>;

Those two properties above are unused and in fact incorrect, because MCT is 
not an interrupt controller, so they could be removed in a follow-up patch.

You can also check out the clean-up series I mentioned for other things 
that could be cleaned up in Exynos 5 dtsi files.

>  		interrupt-parent = <&mct_map>;
> -		interrupts = <0 0>, <1 0>, <2 0>, <3 0>,
> -			     <4 0>, <5 0>;
> +		interrupts = <0>, <1>, <2>, <3>, <4>, <5>;
>  		clocks = <&clock 1>, <&clock 335>;
>  		clock-names = "fin_pll", "mct";
> 
>  		mct_map: mct-map {
> -			#interrupt-cells = <2>;
> +			#interrupt-cells = <1>;
>  			#address-cells = <0>;
>  			#size-cells = <0>;
> -			interrupt-map = <0x0 0 &combiner 23 3>,
> -					<0x1 0 &combiner 23 4>,
> -					<0x2 0 &combiner 25 2>,
> -					<0x3 0 &combiner 25 3>,
> -					<0x4 0 &gic 0 120 0>,
> -					<0x5 0 &gic 0 121 0>;
> +			interrupt-map = <0 &combiner 23 3>,
> +					<1 &combiner 23 4>,
> +					<2 &combiner 25 2>,
> +					<3 &combiner 25 3>,
> +					<4 &gic 0 120 0>,
> +					<5 &gic 0 121 0>;
>  		};
>  	};

Otherwise, looks fine. Thanks.

Best regards,
Tomasz
