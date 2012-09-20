From: Jingoo Han <jg1.han@samsung.com>
Subject: Re: [PATCH 1/3] ARM: EXYNOS5: Add fimd node to the exynos5250 dtsi file
Date: Thu, 20 Sep 2012 17:03:11 +0900
Message-ID: <008201cd9706$60e7e2e0$22b7a8a0$%han@samsung.com>
References: <1347992531-27279-1-git-send-email-l.krishna@samsung.com>
 <1347992531-27279-2-git-send-email-l.krishna@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:49998 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751221Ab2ITIDN (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 20 Sep 2012 04:03:13 -0400
Received: from epcpsbgm2.samsung.com (epcpsbgm2 [203.254.230.27])
 by mailout4.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MAN006LP2C5L1V0@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 20 Sep 2012 17:03:11 +0900 (KST)
Received: from DOJG1HAN02 ([12.23.119.56])
 by mmp1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0MAN009D52DBRDH0@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 20 Sep 2012 17:03:11 +0900 (KST)
In-reply-to: <1347992531-27279-2-git-send-email-l.krishna@samsung.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Leela Krishna Amudala' <l.krishna@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, inki.dae@samsung.com, 'Thomas Abraham' <thomas.abraham@linaro.org>, 'Jingoo Han' <jg1.han@samsung.com>

On Wednesday, September 19, 2012 3:22 AM Leela Krishna Amudala wrote
> 
> This patch adds the fimd node with compatibility string, hardware address,
> interrupt line numbers to the exynos5250 dtsi file.
> 
> Signed-off-by: Leela Krishna Amudala <l.krishna@samsung.com>
> ---
>  arch/arm/boot/dts/exynos5250.dtsi |    7 +++++++
>  1 files changed, 7 insertions(+), 0 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/exynos5250.dtsi b/arch/arm/boot/dts/exynos5250.dtsi
> index b55794b..6d27ca4 100644
> --- a/arch/arm/boot/dts/exynos5250.dtsi
> +++ b/arch/arm/boot/dts/exynos5250.dtsi
> @@ -488,4 +488,11 @@
>  		reg = <0x13e30000 0x1000>;
>  		interrupts = <0 88 0>;
>  	};
> +
> +	fimd {
> +		compatible = "samsung,exynos5-drm";

Should it be "samsung,exynos5-fimd"?


> +		interrupt-parent = <&combiner>;
> +		reg = <0x14400000 0x40000>;
> +		interrupts = <18 5>, <18 4>, <18 6>;
> +	};
>  };
> --
> 1.7.0.4
