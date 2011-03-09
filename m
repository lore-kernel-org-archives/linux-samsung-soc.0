From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: [PATCH v2] ARM: S5P: Extend MIPI-CSIS platform_data with the PHY
	control callback
Date: Wed, 09 Mar 2011 16:44:48 +0100
Message-ID: <1299685488-15258-1-git-send-email-s.nawrocki@samsung.com>
References: <1299179061-30959-3-git-send-email-s.nawrocki@samsung.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:46765 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756900Ab1CIPpA (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 9 Mar 2011 10:45:00 -0500
Received: from spt2.w1.samsung.com (mailout2.w1.samsung.com [210.118.77.12])
 by mailout2.w1.samsung.com
 (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTP id <0LHS00KM5RQZR2@mailout2.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 09 Mar 2011 15:44:59 +0000 (GMT)
Received: from linux.samsung.com ([106.116.38.10])
 by spt2.w1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
 2004)) with ESMTPA id <0LHS005Y1RQX7S@spt2.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 09 Mar 2011 15:44:58 +0000 (GMT)
In-reply-to: <1299179061-30959-3-git-send-email-s.nawrocki@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, ben-linux@fluff.org, m.szyprowski@samsung.com, kyungmin.park@samsung.com, s.nawrocki@samsung.com

Extend MIPI-CSIS driver's platform data structure with a callback
for D-PHY enable and reset control. Also add a flag indicating
whether the external MIPI-CSI (VDD18_MIPI) power supply should
be managed in the driver through the "vdd" power supply. On some
boards this regulator may be a fixed voltage regulator without
an inhibit function.

Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
---
Hello,

in this version I have updated the platform data structure with
an additional flag indicating whether the driver should attempt to
control the external mipi-csis (VDD18_MIPI) voltage regulator or not.
This might be needed on systems where MIPI VDD power supply cannot be 
separately switched on/off.

SN

---
 arch/arm/plat-s5p/include/plat/mipi_csis.h |   15 +++++++++++++++
 1 files changed, 15 insertions(+), 0 deletions(-)

diff --git a/arch/arm/plat-s5p/include/plat/mipi_csis.h b/arch/arm/plat-s5p/include/plat/mipi_csis.h
index eb3beab..bb4f396 100644
--- a/arch/arm/plat-s5p/include/plat/mipi_csis.h
+++ b/arch/arm/plat-s5p/include/plat/mipi_csis.h
@@ -11,18 +11,33 @@
 #ifndef PLAT_S5P_MIPI_CSIS_H_
 #define PLAT_S5P_MIPI_CSIS_H_ __FILE__
 
+struct platform_device;
+
 /**
  * struct s5p_platform_mipi_csis - platform data for S5P MIPI-CSIS driver
  * @clk_rate: bus clock frequency
  * @lanes: number of data lanes used
  * @alignment: data alignment in bits
  * @hs_settle: HS-RX settle time
+ * @fixed_phy_vdd: set to 0 if the driver should be managing external
+ *		   D-PHY power supply through the "vdd" regulator supply
+ * @phy_enable: pointer to a callback controlling D-PHY enable/reset
  */
 struct s5p_platform_mipi_csis {
 	unsigned long clk_rate;
 	u8 lanes;
 	u8 alignment;
 	u8 hs_settle;
+	unsigned fixed_phy_vdd:1;
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
