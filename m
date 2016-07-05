From: Abhilash Kesavan <a.kesavan@samsung.com>
Subject: [PATCH 1/2] soc: samsung: Change type of PMU configuration register value to u32
Date: Wed,  6 Jul 2016 01:58:26 +0530
Message-ID: <1467750507-13853-2-git-send-email-a.kesavan@samsung.com>
References: <1467750507-13853-1-git-send-email-a.kesavan@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f66.google.com ([209.85.220.66]:36711 "EHLO
	mail-pa0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755361AbcGEQVI (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 5 Jul 2016 12:21:08 -0400
In-Reply-To: <1467750507-13853-1-git-send-email-a.kesavan@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kgene.kim@samsung.com, k.kozlowski@samsung.com
Cc: linux-kernel@vger.kernel.org

Exynos7 has certain PMU registers that needs to be configured with
u32 values.

Signed-off-by: Abhilash Kesavan <a.kesavan@samsung.com>
---
 drivers/soc/samsung/exynos-pmu.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/soc/samsung/exynos-pmu.h b/drivers/soc/samsung/exynos-pmu.h
index a469e36..1bdc506 100644
--- a/drivers/soc/samsung/exynos-pmu.h
+++ b/drivers/soc/samsung/exynos-pmu.h
@@ -18,7 +18,7 @@
 
 struct exynos_pmu_conf {
 	unsigned int offset;
-	u8 val[NUM_SYS_POWERDOWN];
+	unsigned int val[NUM_SYS_POWERDOWN];
 };
 
 struct exynos_pmu_data {
-- 
1.9.1
