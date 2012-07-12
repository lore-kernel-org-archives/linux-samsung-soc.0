From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH] ARM: Exynos: Add device tree node for Exynos4 interrupt
 combiner controller
Date: Thu, 12 Jul 2012 18:10:17 +0900
Message-ID: <0fab01cd600e$27d56ec0$77804c40$%kim@samsung.com>
References: <1342068948-20755-1-git-send-email-thomas.abraham@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:28642 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S933255Ab2GLJKS (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 12 Jul 2012 05:10:18 -0400
Received: from epcpsbgm2.samsung.com (mailout1.samsung.com [203.254.224.24])
 by mailout1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0M7100HKOIPU6IW0@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 12 Jul 2012 18:10:18 +0900 (KST)
Received: from DOKGENEKIM03 ([12.23.119.152])
 by mmp2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0M71004WNIT5QM30@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 12 Jul 2012 18:10:17 +0900 (KST)
In-reply-to: <1342068948-20755-1-git-send-email-thomas.abraham@linaro.org>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Thomas Abraham' <thomas.abraham@linaro.org>
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org

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
> +		interrupt-controller;
> +		#interrupt-cells = <2>;

How about changing above ordering like interrupt gic controller?

+		#interrupt-cells = <2>;
+		interrupt-controller;

And, don't we need combiner-nr?
+		samsung,combiner-nr = <16>;

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

Others, looks good to me.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
