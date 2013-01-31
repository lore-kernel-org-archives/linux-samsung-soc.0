From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH] ARM: dts: Add node for GMAC for exynos5440
Date: Thu, 31 Jan 2013 14:54:30 -0800
Message-ID: <0b5501ce0005$ef0df970$cd29ec50$@samsung.com>
References: <014101cdfb4b$466426a0$d32c73e0$@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:22745 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756705Ab3AaWyj (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 31 Jan 2013 17:54:39 -0500
Received: from epcpsbgm2.samsung.com (epcpsbgm2 [203.254.230.27])
 by mailout2.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MHI00M1OIB1LD20@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 01 Feb 2013 07:54:37 +0900 (KST)
Received: from visitor4lab ([105.128.18.157])
 by mmp1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0MHI005LNIAZVR30@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 01 Feb 2013 07:54:37 +0900 (KST)
In-reply-to: <014101cdfb4b$466426a0$d32c73e0$@samsung.com>
Content-language: en-us
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Byungho An' <bh74.an@samsung.com>, linux-samsung-soc@vger.kernel.org

Byungho An wrote:
> 
> 
> This patch adds node for GMAC for exynos5440
> EXYNOS5440 SoC supported by GMAC driver.
> 
> Signed-off-by: Byungho An <bh74.an@samsung.com>
> ---
>  arch/arm/boot/dts/exynos5440.dtsi |   11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/exynos5440.dtsi
> b/arch/arm/boot/dts/exynos5440.dtsi
> index 024269d..d8c215e 100644
> --- a/arch/arm/boot/dts/exynos5440.dtsi
> +++ b/arch/arm/boot/dts/exynos5440.dtsi
> @@ -131,6 +131,17 @@
>  		interrupts = <0 1 0>;
>  	};
> 
> +	gmac: ethernet@00230000 {
> +		compatible = "snps,dwmac-3.70a";
> +		reg = <0x00230000 0x8000>;
> +		interrupt-parent = <&gic>;
> +		interrupts = <0 31 4>;
> +		interrupt-names = "macirq";
> +		phy-mode = "sgmii";
> +		clocks = <&clock 12>;
> +		clock-names = "stmmaceth";
> +	};
> +
>  	amba {
>  		#address-cells = <1>;
>  		#size-cells = <1>;
> --
> 1.7.10.4

Can you put it by order of address?

Thanks.

- Kukjin
