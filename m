From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: [PATCH] ARM: SAMSUNG: Add missing variable declaration in
 s3c64xx_spi1_set_platdata()
Date: Thu, 13 Sep 2012 15:18:02 +0200
Message-ID: <1347542282-11954-1-git-send-email-s.nawrocki@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:20690 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750938Ab2IMNSS (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 13 Sep 2012 09:18:18 -0400
Received: from epcpsbgm2.samsung.com (epcpsbgm2 [203.254.230.27])
 by mailout4.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MAA00G93IAGTH00@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 13 Sep 2012 22:18:16 +0900 (KST)
Received: from amdc248.digital.local ([106.116.147.32])
 by mmp2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0MAA00MOAIA41S80@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 13 Sep 2012 22:18:16 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: kgene.kim@samsung.com
Cc: linux-samsung-soc@vger.kernel.org, sw0312.kim@samsung.com, Sylwester Nawrocki <s.nawrocki@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>

Fixes regression introduced in commit 4d0efdd5889b1c81a62aa07a
"ARM: SAMSUNG: Modify s3c64xx_spi{0|1|2}_set_platdata function"

Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 arch/arm/plat-samsung/devs.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/plat-samsung/devs.c b/arch/arm/plat-samsung/devs.c
index fc49f3d..2195209 100644
--- a/arch/arm/plat-samsung/devs.c
+++ b/arch/arm/plat-samsung/devs.c
@@ -1591,6 +1591,8 @@ struct platform_device s3c64xx_device_spi1 = {
 void __init s3c64xx_spi1_set_platdata(int (*cfg_gpio)(void), int src_clk_nr,
 						int num_cs)
 {
+	struct s3c64xx_spi_info pd;
+
 	/* Reject invalid configuration */
 	if (!num_cs || src_clk_nr < 0) {
 		pr_err("%s: Invalid SPI configuration\n", __func__);
-- 
1.7.11.3
