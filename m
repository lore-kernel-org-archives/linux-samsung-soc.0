From: Amit Daniel Kachhap <amit.daniel@samsung.com>
Subject: [PATCH v2 5/6] driver: soc: exynos-pmu: Add an API to be called after
 wakeup
Date: Sat, 08 Nov 2014 18:46:40 +0530
Message-ID: <1415452601-13078-6-git-send-email-amit.daniel@samsung.com>
References: <1415452601-13078-1-git-send-email-amit.daniel@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:41180 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753812AbaKHNWq (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 8 Nov 2014 08:22:46 -0500
In-reply-to: <1415452601-13078-1-git-send-email-amit.daniel@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, linux-kernel@vger.kernel.org, s.nawrocki@samsung.com, lee.jones@linaro.org, Amit Daniel Kachhap <amit.daniel@samsung.com>

This patch adds an API exynos_sys_powerup_conf to be called
after system sleep wakeup. This is similar to currently existing API
exynos_sys_powerdown_conf.

Reviewed-by: Pankaj Dubey <pankaj.dubey@samsung.com>
Signed-off-by: Amit Daniel Kachhap <amit.daniel@samsung.com>
---
 drivers/soc/samsung/exynos-pmu.c       |    9 +++++++++
 include/linux/soc/samsung/exynos-pmu.h |    1 +
 2 files changed, 10 insertions(+)

diff --git a/drivers/soc/samsung/exynos-pmu.c b/drivers/soc/samsung/exynos-pmu.c
index 4a5eb50..a73c1ea 100644
--- a/drivers/soc/samsung/exynos-pmu.c
+++ b/drivers/soc/samsung/exynos-pmu.c
@@ -34,6 +34,7 @@ struct exynos_pmu_data {
 
 	void (*pmu_init)(void);
 	void (*powerdown_conf)(enum sys_powerdown);
+	void (*powerup_conf)(enum sys_powerdown);
 };
 
 struct exynos_pmu_context {
@@ -430,6 +431,14 @@ void exynos_sys_powerdown_conf(enum sys_powerdown mode)
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
index d2f4083..9a4b833 100644
--- a/include/linux/soc/samsung/exynos-pmu.h
+++ b/include/linux/soc/samsung/exynos-pmu.h
@@ -25,5 +25,6 @@ struct pmu_dev_client_data {
 };
 
 extern void exynos_sys_powerdown_conf(enum sys_powerdown mode);
+extern void exynos_sys_powerup_conf(enum sys_powerdown mode);
 
 #endif /* __EXYNOS_PMU_H */
-- 
1.7.9.5
