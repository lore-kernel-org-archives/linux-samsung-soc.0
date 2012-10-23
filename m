From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH v4 5/5] ARM: EXYNOS: Add arm-pmu DT binding for exynos421x
Date: Tue, 23 Oct 2012 23:02:18 +0900
Message-ID: <020f01cdb127$0357a990$0a06fcb0$%kim@samsung.com>
References: <1349662630-11607-1-git-send-email-chanho61.park@samsung.com>
 <1349662630-11607-6-git-send-email-chanho61.park@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:25989 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756896Ab2JWOCT (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 23 Oct 2012 10:02:19 -0400
Received: from epcpsbgm1.samsung.com (epcpsbgm1 [203.254.230.26])
 by mailout4.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MCC00CO6MZIFJF0@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 23 Oct 2012 23:02:18 +0900 (KST)
Received: from DOKGENEKIM03 ([12.23.120.199])
 by mmp2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0MCC008ABMZUJH10@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 23 Oct 2012 23:02:18 +0900 (KST)
In-reply-to: <1349662630-11607-6-git-send-email-chanho61.park@samsung.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Chanho Park' <chanho61.park@samsung.com>, ben-linux@fluff.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: linux@arm.linux.org.uk, sachin.kamat@linaro.org, will.deacon@arm.com, thomas.abraham@linaro.org, kyungmin.park@samsung.com

Chanho Park wrote:
> 
> This patch adds a arm-pmu node to bind device tree for exynos4210.
> The exynos4210 and 4212 have two cpus which includes a pmu. In contrast,
> the
> exynos4412 has 4 cpus and pmus. We need to define two more pmus for this
> type
> board. However, supporting arm-pmu for the exynos4412 will handle it later
> because there is no dts support for 4412 based board.
> 
> Signed-off-by: Chanho Park <chanho61.park@samsung.com>
> Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
> ---
>  arch/arm/boot/dts/exynos4210.dtsi |    6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/exynos4210.dtsi
> b/arch/arm/boot/dts/exynos4210.dtsi
> index 214c557..90f9aed 100644
> --- a/arch/arm/boot/dts/exynos4210.dtsi
> +++ b/arch/arm/boot/dts/exynos4210.dtsi
> @@ -42,6 +42,12 @@
>  			     <0 12 0>, <0 13 0>, <0 14 0>, <0 15 0>;
>  	};
> 
> +	pmu {
> +		compatible = "arm,cortex-a9-pmu";
> +		interrupt-parent = <&combiner>;
> +		interrupts = <2 2>, <3 2>;
> +	};
> +
>  	pinctrl_0: pinctrl@11400000 {
>  		compatible = "samsung,pinctrl-exynos4210";
>  		reg = <0x11400000 0x1000>;
> --
> 1.7.9.5

Looks OK, applied.
Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
