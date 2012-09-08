From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH Resend 1/2] ARM: dts: Use active low flag for gpio-keys on
 Origen
Date: Sat, 08 Sep 2012 11:30:48 +0900
Message-ID: <24d601cd8d69$f4f3e700$dedbb500$%kim@samsung.com>
References: <1347008770-11421-1-git-send-email-sachin.kamat@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:14414 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751825Ab2IHCav (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 7 Sep 2012 22:30:51 -0400
Received: from epcpsbgm2.samsung.com (epcpsbgm2 [203.254.230.27])
 by mailout2.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MA0009I9EZDA6C0@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Sat, 08 Sep 2012 11:30:49 +0900 (KST)
Received: from DOKGENEKIM03 ([12.23.119.152])
 by mmp2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0MA0001YLEZDL930@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Sat, 08 Sep 2012 11:30:49 +0900 (KST)
In-reply-to: <1347008770-11421-1-git-send-email-sachin.kamat@linaro.org>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Sachin Kamat' <sachin.kamat@linaro.org>, linux-samsung-soc@vger.kernel.org
Cc: devicetree-discuss@lists.ozlabs.org

Sachin Kamat wrote:
> 
> Commit: f447ed8b31d (gpio: samsung: add flags specifier to
> device-tree binding) adds a flag to represent active low state
> for gpio line. Since gpio-keys on Origen board are active low,
> using this flag to represent the same.
> 
> Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
> Reviewed-by: Thomas Abraham <thomas.abraham@linaro.org>
> ---
>  arch/arm/boot/dts/exynos4210-origen.dts |   10 +++++-----
>  1 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/exynos4210-origen.dts
> b/arch/arm/boot/dts/exynos4210-origen.dts
> index 0c49caa..c37edf0 100644
> --- a/arch/arm/boot/dts/exynos4210-origen.dts
> +++ b/arch/arm/boot/dts/exynos4210-origen.dts
> @@ -62,31 +62,31 @@
> 
>  		up {
>  			label = "Up";
> -			gpios = <&gpx2 0 0 0 2>;
> +			gpios = <&gpx2 0 0 0x10000 2>;
>  			linux,code = <103>;
>  		};
> 
>  		down {
>  			label = "Down";
> -			gpios = <&gpx2 1 0 0 2>;
> +			gpios = <&gpx2 1 0 0x10000 2>;
>  			linux,code = <108>;
>  		};
> 
>  		back {
>  			label = "Back";
> -			gpios = <&gpx1 7 0 0 2>;
> +			gpios = <&gpx1 7 0 0x10000 2>;
>  			linux,code = <158>;
>  		};
> 
>  		home {
>  			label = "Home";
> -			gpios = <&gpx1 6 0 0 2>;
> +			gpios = <&gpx1 6 0 0x10000 2>;
>  			linux,code = <102>;
>  		};
> 
>  		menu {
>  			label = "Menu";
> -			gpios = <&gpx1 5 0 0 2>;
> +			gpios = <&gpx1 5 0 0x10000 2>;
>  			linux,code = <139>;
>  		};
>  	};
> --
> 1.7.4.1

Applied, thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
