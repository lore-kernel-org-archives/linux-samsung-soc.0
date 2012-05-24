From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH 1/2] ARM: EXYNOS: Update HSOTG PHY clock setting for
 Exynos4x12
Date: Thu, 24 May 2012 16:19:26 +0900
Message-ID: <005b01cd397d$8d21cbf0$a76563d0$%kim@samsung.com>
References: <1337677529-7325-1-git-send-email-sachin.kamat@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:59965 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751346Ab2EXHT2 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 24 May 2012 03:19:28 -0400
Received: from epcpsbgm2.samsung.com (mailout2.samsung.com [203.254.224.25])
 by mailout2.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0M4I00FPRMZXS300@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 24 May 2012 16:19:26 +0900 (KST)
Received: from DOKGENEKIM03 ([12.23.119.152])
 by mmp2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0M4I00522N0E64P0@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 24 May 2012 16:19:26 +0900 (KST)
In-reply-to: <1337677529-7325-1-git-send-email-sachin.kamat@linaro.org>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Sachin Kamat' <sachin.kamat@linaro.org>, linux-samsung-soc@vger.kernel.org
Cc: patches@linaro.org

Sachin Kamat wrote:
> 
> Adds clock setting entries for Exynos4212 and Exynos4412 platforms.
> 
> Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
> ---
> Based on Kukjin Kim's v3.5-for-usb-2 branch.
> ---
>  arch/arm/mach-exynos/include/mach/regs-usb-phy.h |    5 ++
>  arch/arm/mach-exynos/setup-usb-phy.c             |   47
++++++++++++++++-----
>  arch/arm/plat-samsung/include/plat/cpu.h         |    4 ++
>  3 files changed, 45 insertions(+), 11 deletions(-)
> 
> diff --git a/arch/arm/mach-exynos/include/mach/regs-usb-phy.h
> b/arch/arm/mach-exynos/include/mach/regs-usb-phy.h
> index c337cf3..bab28d9 100644
> --- a/arch/arm/mach-exynos/include/mach/regs-usb-phy.h
> +++ b/arch/arm/mach-exynos/include/mach/regs-usb-phy.h
> @@ -38,8 +38,13 @@
>  #define CLKSEL_MASK			(0x3 << 0)
>  #define CLKSEL_SHIFT			(0)
>  #define CLKSEL_48M			(0x0 << 0)
> +#define CLKSEL_9600K			(0x0 << 0)
> +#define CLKSEL_10M			(0x1 << 0)
>  #define CLKSEL_12M			(0x2 << 0)
> +#define CLKSEL_19200K			(0x3 << 0)
>  #define CLKSEL_24M			(0x3 << 0)
> +#define CLKSEL_20M			(0x4 << 0)
> +#define EXYNOS4X12_CLKSEL_24M		(0x5 << 0)
> 

I would preferred following to avoid confusion. Of course, need to update
regarding file accordingly.

@@ -35,11 +35,21 @@
 #define PHY1_COMMON_ON_N		(1 << 7)
 #define PHY0_COMMON_ON_N		(1 << 4)
 #define PHY0_ID_PULLUP			(1 << 2)
-#define CLKSEL_MASK			(0x3 << 0)
-#define CLKSEL_SHIFT			(0)
-#define CLKSEL_48M			(0x0 << 0)
-#define CLKSEL_12M			(0x2 << 0)
-#define CLKSEL_24M			(0x3 << 0)
+
+#define EXYNOS4_CLKSEL_SHIFT		(0)
+
+#define EXYNOS4210_CLKSEL_MASK		(0x3 << 0)
+#define EXYNOS4210_CLKSEL_48M		(0x0 << 0)
+#define EXYNOS4210_CLKSEL_12M		(0x2 << 0)
+#define EXYNOS4210_CLKSEL_24M		(0x3 << 0)
+
+#define EXYNOS4X12_CLKSEL_MASK		(0x7 << 0)
+#define EXYNOS4X12_CLKSEL_9600K		(0x0 << 0)
+#define EXYNOS4X12_CLKSEL_10M		(0x1 << 0)
+#define EXYNOS4X12_CLKSEL_12M		(0x2 << 0)
+#define EXYNOS4X12_CLKSEL_19200K	(0x3 << 0)
+#define EXYNOS4X12_CLKSEL_20M		(0x4 << 0)
+#define EXYNOS4X12_CLKSEL_24M		(0x5 << 0)
 
 #define EXYNOS4_RSTCON			EXYNOS4_HSOTG_PHYREG(0x08)
 #define HOST_LINK_PORT_SWRST_MASK	(0xf << 6)

[...]

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
