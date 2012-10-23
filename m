From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH v4 4/5] ARM: EXYNOS: Add arm-pmu DT binding for exynos5250
Date: Tue, 23 Oct 2012 23:01:42 +0900
Message-ID: <020e01cdb126$ee4b0560$cae11020$%kim@samsung.com>
References: <1349662630-11607-1-git-send-email-chanho61.park@samsung.com>
 <1349662630-11607-5-git-send-email-chanho61.park@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:56494 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756339Ab2JWOBp (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 23 Oct 2012 10:01:45 -0400
Received: from epcpsbgm2.samsung.com (epcpsbgm2 [203.254.230.27])
 by mailout2.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MCC00K9HMYQ0EO0@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 23 Oct 2012 23:01:44 +0900 (KST)
Received: from DOKGENEKIM03 ([12.23.120.199])
 by mmp1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0MCC007O8MYUY590@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 23 Oct 2012 23:01:42 +0900 (KST)
In-reply-to: <1349662630-11607-5-git-send-email-chanho61.park@samsung.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Chanho Park' <chanho61.park@samsung.com>, ben-linux@fluff.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: linux@arm.linux.org.uk, sachin.kamat@linaro.org, will.deacon@arm.com, thomas.abraham@linaro.org, kyungmin.park@samsung.com

Chanho Park wrote:
> 
> This patch enables arm-pmu to bind device tree for exynos5250. The
> exynos5250
> has two pmus which have combiner irq type.
> 
> Reviewed-by: Thomas Abraham <thomas.abraham@linaro.org>
> Signed-off-by: Chanho Park <chanho61.park@samsung.com>
> Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
> ---
>  arch/arm/boot/dts/exynos5250.dtsi |    6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/exynos5250.dtsi
> b/arch/arm/boot/dts/exynos5250.dtsi
> index dddfd6e..fab3eae 100644
> --- a/arch/arm/boot/dts/exynos5250.dtsi
> +++ b/arch/arm/boot/dts/exynos5250.dtsi
> @@ -56,6 +56,12 @@
>  			     <0 28 0>, <0 29 0>, <0 30 0>, <0 31 0>;
>  	};
> 
> +	pmu {
> +		compatible = "arm,cortex-a15-pmu";
> +		interrupt-parent = <&combiner>;
> +		interrupts = <1 2>, <22 4>;
> +	};
> +
>  	watchdog {
>  		compatible = "samsung,s3c2410-wdt";
>  		reg = <0x101D0000 0x100>;
> --
> 1.7.9.5

OK, applied.
Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
