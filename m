From: Amit Daniel Kachhap <amit.daniel@samsung.com>
Subject: [PATCH v3 3/5] driver: soc: exynos-pmu: Add an API to be called after
 wakeup
Date: Thu, 20 Nov 2014 11:09:26 +0530
Message-ID: <1416461968-2057-4-git-send-email-amit.daniel@samsung.com>
References: <1416461968-2057-1-git-send-email-amit.daniel@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:53587 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754735AbaKTFsD (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 20 Nov 2014 00:48:03 -0500
In-reply-to: <1416461968-2057-1-git-send-email-amit.daniel@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, linux-kernel@vger.kernel.org, pankaj.dubey@samsung.com, Amit Daniel Kachhap <amit.daniel@samsung.com>

This patch adds an API exynos_sys_powerup_conf to be called after system sleep
wakeup. This will useful for exynos7 SoC to perform resume related
initialisations. This is similar to currently existing API
exynos_sys_powerdown_conf.

Reviewed-by: Pankaj Dubey <pankaj.dubey@samsung.com>
Signed-off-by: Amit Daniel Kachhap <amit.daniel@samsung.com>
---
 drivers/soc/samsung/exynos-pmu.c       |    9 +++++++++
 include/linux/soc/samsung/exynos-pmu.h |    1 +
 2 files changed, 10 insertions(+)

diff --git a/drivers/soc/samsung/exynos-pmu.c b/drivers/soc/samsung/exynos-pmu.c
index aa43e04..f8896bc 100644
--- a/drivers/soc/samsung/exynos-pmu.c
+++ b/drivers/soc/samsung/exynos-pmu.c
@@ -29,6 +29,7 @@ struct exynos_pmu_data {
 
 	void (*pmu_init)(void);
 	void (*powerdown_conf)(enum sys_powerdown);
+	void (*powerup_conf)(enum sys_powerdown);
 };
 
 struct exynos_pmu_context {
@@ -637,6 +638,14 @@ void exynos_sys_powerdown_conf(enum sys_powerdown mode)
 	}
 }
 
+void exynos_sys_powerup_conf(enum sys_powerdown mode)
+{
+	const struct exynos_pmu_data *pmu_data = pmu_context->pmu_data;
+
+	if (pmu_data->powerup_conf)
+		pmu_data->powerup_conf(mode);
+}
+
 static void exynos5250_pmu_init(void)
 {
 	unsigned int value;
diff --git a/include/linux/soc/samsung/exynos-pmu.h b/include/linux/soc/samsung/exynos-pmu.h
index a2ab0d5..b497712 100644
--- a/include/linux/soc/samsung/exynos-pmu.h
+++ b/include/linux/soc/samsung/exynos-pmu.h
@@ -20,5 +20,6 @@ enum sys_powerdown {
 };
 
 extern void exynos_sys_powerdown_conf(enum sys_powerdown mode);
+extern void exynos_sys_powerup_conf(enum sys_powerdown mode);
 
 #endif /* __EXYNOS_PMU_H */
-- 
1.7.9.5
