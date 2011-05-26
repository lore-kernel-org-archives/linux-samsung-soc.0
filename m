From: MyungJoo Ham <myungjoo.ham@samsung.com>
Subject: [PATCH] arm: exynos4: address a section mismatch w/ suspend issue.
Date: Thu, 26 May 2011 13:40:22 +0900
Message-ID: <1306384822-17651-1-git-send-email-myungjoo.ham@samsung.com>
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:23079 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750947Ab1EZEk0 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 26 May 2011 00:40:26 -0400
Received: from epcpsbgm2.samsung.com (mailout4.samsung.com [203.254.224.34])
 by mailout4.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LLS00IOTCZ2GNH0@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 26 May 2011 13:40:24 +0900 (KST)
Received: from TNRNDGASPAPP1.tn.corp.samsungelectronics.net ([165.213.149.150])
 by mmp1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0LLS00HAYCZC6U@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 26 May 2011 13:40:24 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: linux-samsung-soc@vger.kernel.org, Kukjin Kim <kgene.kim@samsung.com>, Russell King <linux@arm.linux.org.uk>, kyungmin.park@samsung.com, myungjoo.ham@gmail.com

The section mismatch in headsmp.S made hotplug stop working after the
first instance of suspend-to-RAM and its wakeup.

Signed-off-by: MyungJoo Ham <myungjoo.ham@samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 arch/arm/mach-exynos4/headsmp.S |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/arch/arm/mach-exynos4/headsmp.S b/arch/arm/mach-exynos4/headsmp.S
index 6c6cfc5..3cdeb36 100644
--- a/arch/arm/mach-exynos4/headsmp.S
+++ b/arch/arm/mach-exynos4/headsmp.S
@@ -13,7 +13,7 @@
 #include <linux/linkage.h>
 #include <linux/init.h>
 
-	__INIT
+	__CPUINIT
 
 /*
  * exynos4 specific entry point for secondary CPUs.  This provides
-- 
1.7.4.1
