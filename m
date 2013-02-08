From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH RESEND v2] ARM: EXYNOS: dts: Set up power domain for MFC
 and G-scaler
Date: Fri, 08 Feb 2013 14:44:05 -0800
Message-ID: <1a5801ce064d$cddb41b0$6991c510$@samsung.com>
References: <06e301cdfe51$f11b59c0$d3520d40$@samsung.com>
 <1359521344-17189-1-git-send-email-prasanna.ps@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:53363 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1760366Ab3BHWoW (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 8 Feb 2013 17:44:22 -0500
Received: from epcpsbgm2.samsung.com (epcpsbgm2 [203.254.230.27])
 by mailout4.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MHX00CKTB5XAC30@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Sat, 09 Feb 2013 07:44:21 +0900 (KST)
Received: from visitor4lab ([105.128.18.157])
 by mmp1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0MHX00GETB5V7V60@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Sat, 09 Feb 2013 07:44:21 +0900 (KST)
In-reply-to: <1359521344-17189-1-git-send-email-prasanna.ps@samsung.com>
Content-language: en-us
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Prasanna Kumar' <prasanna.ps@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

Prasanna Kumar wrote:
> 
> This patch adds device tree nodes for MFC and G-scaler power
> domains of exynos5250.It binds these power-domain nodes to repsective
> device tree nodes
> 
> It also adds support to enable PM generic domains for exynos5250.
> 
> Signed-off-by: Prasanna Kumar <prasanna.ps@samsung.com>
> ---
>  arch/arm/boot/dts/exynos5250.dtsi |   16 ++++++++++++++++
>  arch/arm/mach-exynos/Kconfig      |    1 +
>  2 files changed, 17 insertions(+), 0 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/exynos5250.dtsi
> b/arch/arm/boot/dts/exynos5250.dtsi
> index 30485de..e282fde 100644
> --- a/arch/arm/boot/dts/exynos5250.dtsi
> +++ b/arch/arm/boot/dts/exynos5250.dtsi
> @@ -46,6 +46,16 @@
>  		i2c8 = &i2c_8;
>  	};
> 
> +	pd_gsc: gsc-power-domain@0x10044000 {
> +		compatible = "samsung,exynos4210-pd";
> +		reg = <0x10044000 0x20>;
> +	};
> +
> +	pd_mfc: mfc-power-domain@0x10044040 {
> +		compatible = "samsung,exynos4210-pd";
> +		reg = <0x10044040 0x20>;
> +	};
> +
>  	gic:interrupt-controller@10481000 {
>  		compatible = "arm,cortex-a9-gic";
>  		#interrupt-cells = <3>;
> @@ -85,6 +95,7 @@
>  		compatible = "samsung,mfc-v6";
>  		reg = <0x11000000 0x10000>;
>  		interrupts = <0 96 0>;
> +		samsung,power-domain = <&pd_mfc>;
>  	};
> 
>  	rtc {
> @@ -554,28 +565,33 @@
>  		};
>  	};
> 
> +
>  	gsc_0:  gsc@0x13e00000 {
>  		compatible = "samsung,exynos5-gsc";
>  		reg = <0x13e00000 0x1000>;
>  		interrupts = <0 85 0>;
> +		samsung,power-domain = <&pd_gsc>;
>  	};
> 
>  	gsc_1:  gsc@0x13e10000 {
>  		compatible = "samsung,exynos5-gsc";
>  		reg = <0x13e10000 0x1000>;
>  		interrupts = <0 86 0>;
> +		samsung,power-domain = <&pd_gsc>;
>  	};
> 
>  	gsc_2:  gsc@0x13e20000 {
>  		compatible = "samsung,exynos5-gsc";
>  		reg = <0x13e20000 0x1000>;
>  		interrupts = <0 87 0>;
> +		samsung,power-domain = <&pd_gsc>;
>  	};
> 
>  	gsc_3:  gsc@0x13e30000 {
>  		compatible = "samsung,exynos5-gsc";
>  		reg = <0x13e30000 0x1000>;
>  		interrupts = <0 88 0>;
> +		samsung,power-domain = <&pd_gsc>;
>  	};
> 
>  	hdmi {
> diff --git a/arch/arm/mach-exynos/Kconfig b/arch/arm/mach-
> exynos/Kconfig
> index e103c29..96f4a9f 100644
> --- a/arch/arm/mach-exynos/Kconfig
> +++ b/arch/arm/mach-exynos/Kconfig
> @@ -61,6 +61,7 @@ config SOC_EXYNOS5250
>  	bool "SAMSUNG EXYNOS5250"
>  	default y
>  	depends on ARCH_EXYNOS5
> +	select PM_GENERIC_DOMAINS if PM
>  	select S5P_PM if PM
>  	select S5P_SLEEP if PM
>  	select S5P_DEV_MFC
> --
> 1.7.5.4

Looks OK to me, applied.

Thanks.

- Kukjin
