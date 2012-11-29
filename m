From: Jingoo Han <jg1.han@samsung.com>
Subject: [PATCH V2 1/2] ARM: EXYNOS: Add AUXDATA for DP controller
Date: Thu, 29 Nov 2012 18:42:02 +0900
Message-ID: <004b01cdce15$c94aa5c0$5bdff140$%han@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:51030 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751187Ab2K2JmG (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 29 Nov 2012 04:42:06 -0500
Received: from epcpsbgm2.samsung.com (epcpsbgm2 [203.254.230.27])
 by mailout2.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0ME800LI7TLXTP00@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 29 Nov 2012 18:42:03 +0900 (KST)
Received: from DOJG1HAN02 ([12.23.120.99])
 by mmp2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0ME8004UQTM3EK00@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 29 Nov 2012 18:42:03 +0900 (KST)
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Kukjin Kim' <kgene.kim@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, 'Ajay Kumar' <ajaykumar.rs@samsung.com>, 'Jingoo Han' <jg1.han@samsung.com>

Use AUXDATA to set the device names for DP controller instance
discovered from device tree.

Signed-off-by: Ajay Kumar <ajaykumar.rs@samsung.com>
Signed-off-by: Jingoo Han <jg1.han@samsung.com>
---
Changes since v1:
- replace the definition with the value

 arch/arm/mach-exynos/mach-exynos5-dt.c |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/arch/arm/mach-exynos/mach-exynos5-dt.c b/arch/arm/mach-exynos/mach-exynos5-dt.c
index 462e5ac..67fa3c2 100644
--- a/arch/arm/mach-exynos/mach-exynos5-dt.c
+++ b/arch/arm/mach-exynos/mach-exynos5-dt.c
@@ -110,6 +110,7 @@ static const struct of_dev_auxdata exynos5250_auxdata_lookup[] __initconst = {
 				"samsung-i2s.1", NULL),
 	OF_DEV_AUXDATA("samsung,samsung-i2s", 0x12D70000,
 				"samsung-i2s.2", NULL),
+	OF_DEV_AUXDATA("samsung,exynos5-dp", 0x145B0000, "exynos-dp", NULL),
 	{},
 };
 
-- 
1.7.2.5
