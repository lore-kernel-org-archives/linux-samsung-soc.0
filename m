From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: [PATCH v2 1/3] ARM: S5P: Rename MIPI-CSIS driver header and update
	Copyright
Date: Thu, 03 Mar 2011 20:04:19 +0100
Message-ID: <1299179061-30959-2-git-send-email-s.nawrocki@samsung.com>
References: <01a701cbd95d$9873c160$c95b4420$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:22021 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758269Ab1CCTEk (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 3 Mar 2011 14:04:40 -0500
Received: from spt2.w1.samsung.com (mailout2.w1.samsung.com [210.118.77.12])
 by mailout2.w1.samsung.com
 (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTP id <0LHH00MTKWZQND@mailout2.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 03 Mar 2011 19:04:38 +0000 (GMT)
Received: from linux.samsung.com ([106.116.38.10])
 by spt2.w1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
 2004)) with ESMTPA id <0LHH00EF9WZO89@spt2.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 03 Mar 2011 19:04:37 +0000 (GMT)
In-reply-to: <01a701cbd95d$9873c160$c95b4420$%kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, ben-linux@fluff.org, m.szyprowski@samsung.com, kyungmin.park@samsung.com, s.nawrocki@samsung.com, inki.dae@samsung.com

Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 arch/arm/plat-s5p/dev-csis0.c                      |    2 +-
 arch/arm/plat-s5p/dev-csis1.c                      |    2 +-
 .../plat-s5p/include/plat/{csis.h => mipi_csis.h}  |   10 +++++-----
 3 files changed, 7 insertions(+), 7 deletions(-)
 rename arch/arm/plat-s5p/include/plat/{csis.h => mipi_csis.h} (68%)

diff --git a/arch/arm/plat-s5p/dev-csis0.c b/arch/arm/plat-s5p/dev-csis0.c
index dfab1c8..882843b 100644
--- a/arch/arm/plat-s5p/dev-csis0.c
+++ b/arch/arm/plat-s5p/dev-csis0.c
@@ -1,5 +1,5 @@
 /*
- * Copyright (C) 2010 Samsung Electronics
+ * Copyright (C) 2010-2011 Samsung Electronics Co., Ltd
  *
  * S5P series device definition for MIPI-CSIS channel 0
  *
diff --git a/arch/arm/plat-s5p/dev-csis1.c b/arch/arm/plat-s5p/dev-csis1.c
index e3053f2..77f5d25 100644
--- a/arch/arm/plat-s5p/dev-csis1.c
+++ b/arch/arm/plat-s5p/dev-csis1.c
@@ -1,5 +1,5 @@
 /*
- * Copyright (C) 2010 Samsung Electronics
+ * Copyright (C) 2010-2011 Samsung Electronics Co., Ltd
  *
  * S5P series device definition for MIPI-CSIS channel 1
  *
diff --git a/arch/arm/plat-s5p/include/plat/csis.h b/arch/arm/plat-s5p/include/plat/mipi_csis.h
similarity index 68%
rename from arch/arm/plat-s5p/include/plat/csis.h
rename to arch/arm/plat-s5p/include/plat/mipi_csis.h
index 51e308c..eb3beab 100644
--- a/arch/arm/plat-s5p/include/plat/csis.h
+++ b/arch/arm/plat-s5p/include/plat/mipi_csis.h
@@ -1,5 +1,5 @@
 /*
- * Copyright (C) 2010 Samsung Electronics
+ * Copyright (C) 2010-2011 Samsung Electronics, Co. Ltd
  *
  * S5P series MIPI CSI slave device support
  *
@@ -8,11 +8,11 @@
  * published by the Free Software Foundation.
  */
 
-#ifndef PLAT_S5P_CSIS_H_
-#define PLAT_S5P_CSIS_H_ __FILE__
+#ifndef PLAT_S5P_MIPI_CSIS_H_
+#define PLAT_S5P_MIPI_CSIS_H_ __FILE__
 
 /**
- * struct s5p_platform_mipi_csis - platform data for MIPI-CSIS
+ * struct s5p_platform_mipi_csis - platform data for S5P MIPI-CSIS driver
  * @clk_rate: bus clock frequency
  * @lanes: number of data lanes used
  * @alignment: data alignment in bits
@@ -25,4 +25,4 @@ struct s5p_platform_mipi_csis {
 	u8 hs_settle;
 };
 
-#endif /* PLAT_S5P_CSIS_H_ */
+#endif /* PLAT_S5P_MIPI_CSIS_H_ */
-- 
1.7.4.1
