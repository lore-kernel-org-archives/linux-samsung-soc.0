From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: [PATCH/RFC 1/3] ARM: S5P: Add a platform callback for MIPI CSIS PHY
 control
Date: Tue, 04 Jan 2011 16:09:22 +0100
Message-ID: <1294153764-25006-2-git-send-email-s.nawrocki@samsung.com>
References: <1294153764-25006-1-git-send-email-s.nawrocki@samsung.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:52706 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752085Ab1ADPJb (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 4 Jan 2011 10:09:31 -0500
Received: from spt2.w1.samsung.com ([210.118.77.13]) by mailout3.w1.samsung.com
 (Sun Java(tm) System Messaging Server 6.3-8.04 (built Jul 29 2009; 32bit))
 with ESMTP id <0LEI00H1L7FS1P80@mailout3.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 04 Jan 2011 15:09:29 +0000 (GMT)
Received: from linux.samsung.com ([106.116.38.10])
 by spt2.w1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
 2004)) with ESMTPA id <0LEI003JA7FSLA@spt2.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 04 Jan 2011 15:09:28 +0000 (GMT)
In-reply-to: <1294153764-25006-1-git-send-email-s.nawrocki@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, ben-linux@fluff.org, m.szyprowski@samsung.com, kyungmin.park@samsung.com, s.nawrocki@samsung.com, inki.dae@samsung.com

The phy_enable callback in struct s5p_platform_mipi_csis is added
to allow the CSIS driver to control its PHY enable and reset signals.
This allows to use same MIPI CSIS driver across various SoCs.

Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 arch/arm/plat-s5p/dev-csis0.c              |    2 +-
 arch/arm/plat-s5p/dev-csis1.c              |    2 +-
 arch/arm/plat-s5p/include/plat/csis.h      |   28 --------------------
 arch/arm/plat-s5p/include/plat/mipi_csis.h |   39 ++++++++++++++++++++++++++++
 4 files changed, 41 insertions(+), 30 deletions(-)
 delete mode 100644 arch/arm/plat-s5p/include/plat/csis.h
 create mode 100644 arch/arm/plat-s5p/include/plat/mipi_csis.h

diff --git a/arch/arm/plat-s5p/dev-csis0.c b/arch/arm/plat-s5p/dev-csis0.c
index dfab1c8..57efe9c 100644
--- a/arch/arm/plat-s5p/dev-csis0.c
+++ b/arch/arm/plat-s5p/dev-csis0.c
@@ -1,5 +1,5 @@
 /*
- * Copyright (C) 2010 Samsung Electronics
+ * Copyright (C) 2010 Samsung Electronics Co., Ltd
  *
  * S5P series device definition for MIPI-CSIS channel 0
  *
diff --git a/arch/arm/plat-s5p/dev-csis1.c b/arch/arm/plat-s5p/dev-csis1.c
index e3053f2..c61b46b 100644
--- a/arch/arm/plat-s5p/dev-csis1.c
+++ b/arch/arm/plat-s5p/dev-csis1.c
@@ -1,5 +1,5 @@
 /*
- * Copyright (C) 2010 Samsung Electronics
+ * Copyright (C) 2010 Samsung Electronics Co., Ltd
  *
  * S5P series device definition for MIPI-CSIS channel 1
  *
diff --git a/arch/arm/plat-s5p/include/plat/csis.h b/arch/arm/plat-s5p/include/plat/csis.h
deleted file mode 100644
index 51e308c..0000000
--- a/arch/arm/plat-s5p/include/plat/csis.h
+++ /dev/null
@@ -1,28 +0,0 @@
-/*
- * Copyright (C) 2010 Samsung Electronics
- *
- * S5P series MIPI CSI slave device support
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License version 2 as
- * published by the Free Software Foundation.
- */
-
-#ifndef PLAT_S5P_CSIS_H_
-#define PLAT_S5P_CSIS_H_ __FILE__
-
-/**
- * struct s5p_platform_mipi_csis - platform data for MIPI-CSIS
- * @clk_rate: bus clock frequency
- * @lanes: number of data lanes used
- * @alignment: data alignment in bits
- * @hs_settle: HS-RX settle time
- */
-struct s5p_platform_mipi_csis {
-	unsigned long clk_rate;
-	u8 lanes;
-	u8 alignment;
-	u8 hs_settle;
-};
-
-#endif /* PLAT_S5P_CSIS_H_ */
diff --git a/arch/arm/plat-s5p/include/plat/mipi_csis.h b/arch/arm/plat-s5p/include/plat/mipi_csis.h
new file mode 100644
index 0000000..0b22065
--- /dev/null
+++ b/arch/arm/plat-s5p/include/plat/mipi_csis.h
@@ -0,0 +1,39 @@
+/*
+ * Copyright (C) 2010 Samsung Electronics, Co. Ltd
+ *
+ * S5P series MIPI CSI slave device support
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ */
+
+#ifndef PLAT_S5P_MIPI_CSIS_H_
+#define PLAT_S5P_MIPI_CSIS_H_ __FILE__
+
+struct platform_device;
+
+/**
+ * struct s5p_platform_mipi_csis - platform data for MIPI-CSIS
+ * @clk_rate: bus clock frequency
+ * @lanes: number of data lanes used
+ * @alignment: data alignment in bits
+ * @hs_settle: HS-RX settle time
+ */
+struct s5p_platform_mipi_csis {
+	unsigned long clk_rate;
+	u8 lanes;
+	u8 alignment;
+	u8 hs_settle;
+	int (*phy_enable)(struct platform_device *pdev, bool on);
+};
+
+/**
+ * struct s5p_csis_phy_control - global MIPI-CSIS PHY control
+ * @pdev: platform device the mipi phy state is to be changed for
+ * @on: true to enable CSIS PHY and assert its reset,
+ *	false will disable the PHY and put into reset state
+ */
+int s5p_csis_phy_enable(struct platform_device *pdev, bool on);
+
+#endif /* PLAT_S5P_MIPI_CSIS_H_ */
-- 
1.7.3.4
