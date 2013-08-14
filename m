From: Kukjin Kim <kgene@kernel.org>
Subject: RE: [PATCH V2] ARM: dts: Add RTC DT node to Exynos5420 SoC
Date: Wed, 14 Aug 2013 14:44:33 +0900
Message-ID: <105b01ce98b1$5a716fa0$0f544ee0$@org>
References: <1376308293-7766-1-git-send-email-vikas.sajjan@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:36963 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751884Ab3HNFof (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 14 Aug 2013 01:44:35 -0400
Received: from epcpsbgr1.samsung.com
 (u141.gpu120.samsung.co.kr [203.254.230.141])
 by mailout2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MRI00HGRALUO1K0@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 14 Aug 2013 14:44:33 +0900 (KST)
In-reply-to: <1376308293-7766-1-git-send-email-vikas.sajjan@linaro.org>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Vikas Sajjan' <vikas.sajjan@linaro.org>, linux-samsung-soc@vger.kernel.org
Cc: patches@linaro.org, linaro-kernel@lists.linaro.org

Vikas Sajjan wrote:
> 
> Adds RTC DT node to Exynos5420 SoC.
> 
> Signed-off-by: Vikas Sajjan <vikas.sajjan@linaro.org>
> ---
> changes since v1:
> 	- made DT node status as "okay" in the dtsi file itself.
> ---
>  arch/arm/boot/dts/exynos5.dtsi    |    2 +-
>  arch/arm/boot/dts/exynos5250.dtsi |    3 ++-
>  arch/arm/boot/dts/exynos5420.dtsi |    7 +++++++
>  3 files changed, 10 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/exynos5.dtsi
> b/arch/arm/boot/dts/exynos5.dtsi
> index f65e124..4a8e223 100644
> --- a/arch/arm/boot/dts/exynos5.dtsi
> +++ b/arch/arm/boot/dts/exynos5.dtsi
> @@ -95,7 +95,7 @@
>  		interrupts = <0 54 0>;
>  	};
> 
> -	rtc {
> +	rtc@101E0000 {
>  		compatible = "samsung,s3c6410-rtc";
>  		reg = <0x101E0000 0x100>;
>  		interrupts = <0 43 0>, <0 44 0>;
> diff --git a/arch/arm/boot/dts/exynos5250.dtsi
> b/arch/arm/boot/dts/exynos5250.dtsi
> index 88589b7..c82137b 100644
> --- a/arch/arm/boot/dts/exynos5250.dtsi
> +++ b/arch/arm/boot/dts/exynos5250.dtsi
> @@ -178,9 +178,10 @@
>  		samsung,power-domain = <&pd_mfc>;
>  	};
> 
> -	rtc {
> +	rtc@101E0000 {
>  		clocks = <&clock 337>;
>  		clock-names = "rtc";
> +		status = "okay";

Well, according to the subject, 'add rtc dt node to exynos5420', this should
be handled separately if required.

>  	};
> 
>  	tmu@10060000 {
> diff --git a/arch/arm/boot/dts/exynos5420.dtsi
> b/arch/arm/boot/dts/exynos5420.dtsi
> index 9e90d1e..8f1bb08 100644
> --- a/arch/arm/boot/dts/exynos5420.dtsi
> +++ b/arch/arm/boot/dts/exynos5420.dtsi
> @@ -145,4 +145,11 @@
>  		clocks = <&clock 260>, <&clock 131>;
>  		clock-names = "uart", "clk_uart_baud0";
>  	};
> +
> +	rtc@101E0000 {

Please put in the address order or alphabetical.

> +		clocks = <&clock 317>;
> +		clock-names = "rtc";
> +		status = "okay";
> +       };
> +

No need last empty line.

- Kukjin
