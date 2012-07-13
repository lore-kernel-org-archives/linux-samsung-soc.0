From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH v2] ARM: Exynos: Add device tree node for Exynos4 interrupt
 combiner controller
Date: Fri, 13 Jul 2012 20:27:58 +0900
Message-ID: <117b01cd60ea$8dcdc920$a9695b60$%kim@samsung.com>
References: <1342158999-3924-1-git-send-email-thomas.abraham@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:60792 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754938Ab2GML2A (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 13 Jul 2012 07:28:00 -0400
Received: from epcpsbgm1.samsung.com (mailout1.samsung.com [203.254.224.24])
 by mailout1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0M7300F7ZJTEO9Q0@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 13 Jul 2012 20:27:58 +0900 (KST)
Received: from DOKGENEKIM03 ([12.23.119.152])
 by mmp2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0M730047EJUMHG60@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 13 Jul 2012 20:27:58 +0900 (KST)
In-reply-to: <1342158999-3924-1-git-send-email-thomas.abraham@linaro.org>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Thomas Abraham' <thomas.abraham@linaro.org>
Cc: linux-samsung-soc@vger.kernel.org

Thomas Abraham wrote:
> 
> Add node for Exynos4 interrupt combiner controller.
> 
> Signed-off-by: Thomas Abraham <thomas.abraham@linaro.org>
> ---
>  arch/arm/boot/dts/exynos4210.dtsi |   11 +++++++++++
>  1 files changed, 11 insertions(+), 0 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/exynos4210.dtsi
> b/arch/arm/boot/dts/exynos4210.dtsi
> index a1dd2ee..0e4f659 100644
> --- a/arch/arm/boot/dts/exynos4210.dtsi
> +++ b/arch/arm/boot/dts/exynos4210.dtsi
> @@ -33,6 +33,17 @@
>  		reg = <0x10490000 0x1000>, <0x10480000 0x100>;
>  	};
> 
> +	combiner:interrupt-controller@10440000 {
> +		compatible = "samsung,exynos4210-combiner";
> +		#interrupt-cells = <2>;
> +		interrupt-controller;
> +		reg = <0x10440000 0x1000>;
> +		interrupts = <0 0 0>, <0 1 0>, <0 2 0>, <0 3 0>,
> +			     <0 4 0>, <0 5 0>, <0 6 0>, <0 7 0>,
> +			     <0 8 0>, <0 9 0>, <0 10 0>, <0 11 0>,
> +			     <0 12 0>, <0 13 0>, <0 14 0>, <0 15 0>;
> +	};
> +
>  	watchdog@10060000 {
>  		compatible = "samsung,s3c2410-wdt";
>  		reg = <0x10060000 0x100>;
> --
> 1.6.6.rc2

Looks ok to me, applied.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
