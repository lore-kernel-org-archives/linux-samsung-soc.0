From: Ajay Kumar <ajaykumar.rs@samsung.com>
Subject: [PATCH 2/3] ARM: EXYNOS: Add AUXDATA for G2D controller
Date: Wed, 28 Nov 2012 19:59:48 +0530
Message-ID: <1354112989-3161-2-git-send-email-ajaykumar.rs@samsung.com>
References: <1354112989-3161-1-git-send-email-ajaykumar.rs@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:51884 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755057Ab2K1OIL (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 28 Nov 2012 09:08:11 -0500
Received: from epcpsbgm1.samsung.com (epcpsbgm1 [203.254.230.26])
 by mailout4.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0ME700A9MB9F9S10@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 28 Nov 2012 23:08:09 +0900 (KST)
Received: from localhost.localdomain ([107.108.73.106])
 by mmp2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0ME700GC9B6YQ860@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 28 Nov 2012 23:08:09 +0900 (KST)
In-reply-to: <1354112989-3161-1-git-send-email-ajaykumar.rs@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: kgene.kim@samsung.com, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: thomas.abraham@linaro.org

Use AUXDATA to set the device names for G2D controller instance
discovered from device tree.

Signed-off-by: Ajay Kumar <ajaykumar.rs@samsung.com>
---
 arch/arm/mach-exynos/mach-exynos5-dt.c |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/arch/arm/mach-exynos/mach-exynos5-dt.c b/arch/arm/mach-exynos/mach-exynos5-dt.c
index 462e5ac..9eae2ce 100644
--- a/arch/arm/mach-exynos/mach-exynos5-dt.c
+++ b/arch/arm/mach-exynos/mach-exynos5-dt.c
@@ -110,6 +110,8 @@ static const struct of_dev_auxdata exynos5250_auxdata_lookup[] __initconst = {
 				"samsung-i2s.1", NULL),
 	OF_DEV_AUXDATA("samsung,samsung-i2s", 0x12D70000,
 				"samsung-i2s.2", NULL),
+	OF_DEV_AUXDATA("samsung,exynos-g2d-41", 0x10850000,
+				"s5p-g2d", NULL),
 	{},
 };
 
-- 
1.7.1
