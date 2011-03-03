From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: [PATCH v2 2/3] ARM: S5P: Extend MIPI-CSIS platform_data with the PHY
	control callback
Date: Thu, 03 Mar 2011 20:04:20 +0100
Message-ID: <1299179061-30959-3-git-send-email-s.nawrocki@samsung.com>
References: <01a701cbd95d$9873c160$c95b4420$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:22021 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758207Ab1CCTEl (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 3 Mar 2011 14:04:41 -0500
Received: from spt2.w1.samsung.com (mailout2.w1.samsung.com [210.118.77.12])
 by mailout2.w1.samsung.com
 (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTP id <0LHH00MTKWZQND@mailout2.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 03 Mar 2011 19:04:38 +0000 (GMT)
Received: from linux.samsung.com ([106.116.38.10])
 by spt2.w1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
 2004)) with ESMTPA id <0LHH00EFAWZO89@spt2.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 03 Mar 2011 19:04:37 +0000 (GMT)
In-reply-to: <01a701cbd95d$9873c160$c95b4420$%kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, ben-linux@fluff.org, m.szyprowski@samsung.com, kyungmin.park@samsung.com, s.nawrocki@samsung.com, inki.dae@samsung.com

Extend MIPI-CSIS driver's platform data structure with a callback
for D-PHY enable and reset control.

Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 arch/arm/plat-s5p/include/plat/mipi_csis.h |   11 +++++++++++
 1 files changed, 11 insertions(+), 0 deletions(-)

diff --git a/arch/arm/plat-s5p/include/plat/mipi_csis.h b/arch/arm/plat-s5p/include/plat/mipi_csis.h
index eb3beab..8a9e88a 100644
--- a/arch/arm/plat-s5p/include/plat/mipi_csis.h
+++ b/arch/arm/plat-s5p/include/plat/mipi_csis.h
@@ -11,6 +11,8 @@
 #ifndef PLAT_S5P_MIPI_CSIS_H_
 #define PLAT_S5P_MIPI_CSIS_H_ __FILE__
 
+struct platform_device;
+
 /**
  * struct s5p_platform_mipi_csis - platform data for S5P MIPI-CSIS driver
  * @clk_rate: bus clock frequency
@@ -23,6 +25,15 @@ struct s5p_platform_mipi_csis {
 	u8 lanes;
 	u8 alignment;
 	u8 hs_settle;
+	int (*phy_enable)(struct platform_device *pdev, bool on);
 };
 
+/**
+ * s5p_csis_phy_enable - global MIPI-CSI receiver D-PHY control
+ * @pdev: MIPI-CSIS platform device
+ * @on: true to enable D-PHY and deassert its reset
+ *	false to disable D-PHY
+ */
+int s5p_csis_phy_enable(struct platform_device *pdev, bool on);
+
 #endif /* PLAT_S5P_MIPI_CSIS_H_ */
-- 
1.7.4.1
