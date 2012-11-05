From: Rahul Sharma <rahul.sharma@samsung.com>
Subject: [PATCH 2/5] arm: exynos5: add clock information for tv iommu device
Date: Mon, 05 Nov 2012 13:01:22 +0530
Message-ID: <1352100685-7695-3-git-send-email-rahul.sharma@samsung.com>
References: <1352100685-7695-1-git-send-email-rahul.sharma@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:11444 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751027Ab2KEHQy (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 5 Nov 2012 02:16:54 -0500
Received: from epcpsbgm1.samsung.com (epcpsbgm1 [203.254.230.26])
 by mailout3.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MD000H6L6UXXZ90@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 05 Nov 2012 16:16:53 +0900 (KST)
Received: from localhost.localdomain ([107.108.73.106])
 by mmp2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0MD0000R36MFH8E0@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 05 Nov 2012 16:16:53 +0900 (KST)
In-reply-to: <1352100685-7695-1-git-send-email-rahul.sharma@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org
Cc: tomasz.figa@gmail.com, kgene.kim@samsung.com, t.stanislaws@samsung.com, sw0312.kim@samsung.com, inki.dae@samsung.com, jy0922.shim@samsung.com, kyungmin.park@samsung.com, thomas.ab@samsung.com, prashanth.g@samsung.com, joshi@samsung.com, s.shirish@samsung.com, r.sh.open@gmail.com, rahul.sharma@samsung.com

This patch correct the clock information for tv iommu device.
It was mentioned as iommu sub device id as 2 instead of 28.

Signed-off-by: Rahul Sharma <rahul.sharma@samsung.com>
---
 arch/arm/mach-exynos/clock-exynos5.c |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/mach-exynos/clock-exynos5.c b/arch/arm/mach-exynos/clock-exynos5.c
index a88e0d9..69c8501 100644
--- a/arch/arm/mach-exynos/clock-exynos5.c
+++ b/arch/arm/mach-exynos/clock-exynos5.c
@@ -863,9 +863,9 @@ static struct clk exynos5_init_clocks_off[] = {
 		.ctrlbit	= (1 << 2),
 	}, {
 		.name		= SYSMMU_CLOCK_NAME,
-		.devname	= SYSMMU_CLOCK_DEVNAME(tv, 2),
+		.devname	= SYSMMU_CLOCK_DEVNAME(tv, 28),
 		.enable		= &exynos5_clk_ip_disp1_ctrl,
-		.ctrlbit	= (1 << 9)
+		.ctrlbit	= (1 << 9),
 	}, {
 		.name		= SYSMMU_CLOCK_NAME,
 		.devname	= SYSMMU_CLOCK_DEVNAME(jpeg, 3),
-- 
1.7.0.4
