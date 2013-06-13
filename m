From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH RESEND V2] ARM: dts: Correct the base address of pinctrl_3
 on Exynos5250
Date: Thu, 13 Jun 2013 21:14:59 +0900
Message-ID: <150d01ce682f$a007f230$e017d690$%kim@samsung.com>
References: <1371025425-480-1-git-send-email-padma.v@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:18179 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750938Ab3FMMPB (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 13 Jun 2013 08:15:01 -0400
Received: from epcpsbgr2.samsung.com
 (u142.gpu120.samsung.co.kr [203.254.230.142])
 by mailout2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MOB003YDZD0KH90@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 13 Jun 2013 21:15:00 +0900 (KST)
In-reply-to: <1371025425-480-1-git-send-email-padma.v@samsung.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Padmavathi Venna' <padma.v@samsung.com>, linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, alsa-devel@alsa-project.org, padma.kvr@gmail.com
Cc: sbkim73@samsung.com, broonie@kernel.org

Padmavathi Venna wrote:
> 
> This patch corrects the base address of pinctrl_3 on Exynos5250
> platform.
> 
> Signed-off-by: Padmavathi Venna <padma.v@samsung.com>
> ---
> Changes since V1:
> 	- Added platform name in the subject line.
> 
>  arch/arm/boot/dts/exynos5250-pinctrl.dtsi |    2 +-
>  arch/arm/boot/dts/exynos5250.dtsi         |    4 ++--
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/exynos5250-pinctrl.dtsi
> b/arch/arm/boot/dts/exynos5250-pinctrl.dtsi
> index d1650fb..ded558b 100644
> --- a/arch/arm/boot/dts/exynos5250-pinctrl.dtsi
> +++ b/arch/arm/boot/dts/exynos5250-pinctrl.dtsi
> @@ -763,7 +763,7 @@
>  		};
>  	};
> 
> -	pinctrl@03680000 {
> +	pinctrl@03860000 {
>  		gpz: gpz {
>  			gpio-controller;
>  			#gpio-cells = <2>;
> diff --git a/arch/arm/boot/dts/exynos5250.dtsi
> b/arch/arm/boot/dts/exynos5250.dtsi
> index 7154e3d..e9bfd13 100644
> --- a/arch/arm/boot/dts/exynos5250.dtsi
> +++ b/arch/arm/boot/dts/exynos5250.dtsi
> @@ -169,9 +169,9 @@
>  		interrupts = <0 50 0>;
>  	};
> 
> -	pinctrl_3: pinctrl@03680000 {
> +	pinctrl_3: pinctrl@03860000 {
>  		compatible = "samsung,exynos5250-pinctrl";
> -		reg = <0x0368000 0x1000>;
> +		reg = <0x03860000 0x1000>;
>  		interrupts = <0 47 0>;
>  	};
> 
> --
> 1.7.4.4

Yes, right.

Thanks, applied.

- Kukjin
