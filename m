From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: [PATCH] ARM: Samsung: Export MIPI CSIS/DSIM PHY control functions
Date: Thu, 03 Jan 2013 16:21:37 +0100
Message-ID: <1357226497-25166-1-git-send-email-s.nawrocki@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:15831 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753133Ab3ACPVt (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 3 Jan 2013 10:21:49 -0500
Received: from epcpsbgm2.samsung.com (epcpsbgm2 [203.254.230.27])
 by mailout4.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MG2008LN2OAGY30@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 04 Jan 2013 00:21:48 +0900 (KST)
Received: from amdc1344.digital.local ([106.116.147.32])
 by mmp1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0MG2005OS2O2L440@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 04 Jan 2013 00:21:46 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: kgene.kim@samsung.com
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Sylwester Nawrocki <s.nawrocki@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>

The s5p_csis_phy_enable/s5p_dsim_phy_enable functions are now used
directly by corresponding drivers and thus need to be exported so
the drivers can be built as modules.

Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 arch/arm/plat-samsung/setup-mipiphy.c |    3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm/plat-samsung/setup-mipiphy.c b/arch/arm/plat-samsung/setup-mipiphy.c
index 1474593..66df315 100644
--- a/arch/arm/plat-samsung/setup-mipiphy.c
+++ b/arch/arm/plat-samsung/setup-mipiphy.c
@@ -8,6 +8,7 @@
  * published by the Free Software Foundation.
  */

+#include <linux/export.h>
 #include <linux/kernel.h>
 #include <linux/platform_device.h>
 #include <linux/io.h>
@@ -50,8 +51,10 @@ int s5p_csis_phy_enable(int id, bool on)
 {
 	return __s5p_mipi_phy_control(id, on, S5P_MIPI_DPHY_SRESETN);
 }
+EXPORT_SYMBOL(s5p_csis_phy_enable);

 int s5p_dsim_phy_enable(struct platform_device *pdev, bool on)
 {
 	return __s5p_mipi_phy_control(pdev->id, on, S5P_MIPI_DPHY_MRESETN);
 }
+EXPORT_SYMBOL(s5p_dsim_phy_enable);
--
1.7.9.5
