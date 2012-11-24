From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH 2/2] ARM: dts: Add device tree node for DP controller for
 Samsung Exynos5250 platforms
Date: Sat, 24 Nov 2012 12:30:03 +0900
Message-ID: <123001cdc9f3$fe1d6e70$fa584b50$%kim@samsung.com>
References: <004901cdbb3a$dec6cc00$9c546400$%han@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:24340 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755591Ab2KXDaG (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 23 Nov 2012 22:30:06 -0500
Received: from epcpsbgm2.samsung.com (epcpsbgm2 [203.254.230.27])
 by mailout4.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MDZ007P1324XBB0@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Sat, 24 Nov 2012 12:30:04 +0900 (KST)
Received: from DOKGENEKIM03 ([12.23.120.199])
 by mmp1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0MDZ00C03323Z580@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Sat, 24 Nov 2012 12:30:04 +0900 (KST)
In-reply-to: <004901cdbb3a$dec6cc00$9c546400$%han@samsung.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Jingoo Han' <jg1.han@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, 'Ajay Kumar' <ajaykumar.rs@samsung.com>

Jingoo Han wrote:
> 
> Add device tree node for DP controller in Exynos5250 and enable
> the instance for the smdk5250 board.
> 
> Signed-off-by: Ajay Kumar <ajaykumar.rs@samsung.com>
> Signed-off-by: Jingoo Han <jg1.han@samsung.com>
> ---
>  arch/arm/boot/dts/exynos5250-smdk5250.dts |    9 +++++++++
>  arch/arm/boot/dts/exynos5250.dtsi         |   14 ++++++++++++++
>  2 files changed, 23 insertions(+), 0 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/exynos5250-smdk5250.dts
> b/arch/arm/boot/dts/exynos5250-smdk5250.dts
> index 405009c..a4ee49e 100644
> --- a/arch/arm/boot/dts/exynos5250-smdk5250.dts
> +++ b/arch/arm/boot/dts/exynos5250-smdk5250.dts
> @@ -193,4 +193,13 @@
>  	hdmi {
>  		hpd-gpio = <&gpx3 7 0xf 1 3>;
>  	};
> +
> +	display-port-controller {

how about just 'dp-controller'?

> +		samsung,color-space = <0>;
> +		samsung,dynamic-range = <0>;
> +		samsung,ycbcr-coeff = <0>;
> +		samsung,color-depth = <1>;
> +		samsung,link-rate = <0x0a>;
> +		samsung,lane-count = <4>;
> +	};
>  };
> diff --git a/arch/arm/boot/dts/exynos5250.dtsi
> b/arch/arm/boot/dts/exynos5250.dtsi
> index cf6a02d..4603b72 100644
> --- a/arch/arm/boot/dts/exynos5250.dtsi
> +++ b/arch/arm/boot/dts/exynos5250.dtsi
> @@ -552,4 +552,18 @@
>  		reg = <0x14450000 0x10000>;
>  		interrupts = <0 94 0>;
>  	};
> +
> +	display-port-controller {

Same here.

> +		compatible = "samsung,exynos5-dp";
> +		reg = <0x145b0000 0x1000>;
> +		interrupts = <10 3>;
> +		interrupt-parent = <&combiner>;
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		dptx-phy {
> +			reg = <0x10040720>;
> +			samsung,enable-mask = <1>;
> +		};
> +	};
>  };
> --
> 1.7.1

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
