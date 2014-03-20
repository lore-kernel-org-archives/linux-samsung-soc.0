From: Chanwoo Choi <cw00.choi@samsung.com>
Subject: [PATCHv4 5/5] devfreq: exynos5: Add CONFIG_PM_OPP dependency to fix
 probe fail
Date: Thu, 20 Mar 2014 11:59:13 +0900
Message-ID: <1395284353-22458-6-git-send-email-cw00.choi@samsung.com>
References: <1395284353-22458-1-git-send-email-cw00.choi@samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <1395284353-22458-1-git-send-email-cw00.choi@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: myungjoo.ham@samsung.com, kyungmin.park@samsung.com
Cc: rafael.j.wysocki@intel.com, t.figa@samsaung.com, b.zolnierkie@samsaung.com, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Chanwoo Choi <cw00.choi@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

This patch add CONFIG_PM_OPP dependecy to exynos5_bus driver
to fix probe fail. If CONFIG_PM_OPP is disabled, dev_pm_opp_find_freq_floor()
will always return ERR_PTR(-EINVAL) error.

Signed-off-by: Chanwoo Choi <cw00.choi@samsung.com>
---
 drivers/devfreq/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/devfreq/Kconfig b/drivers/devfreq/Kconfig
index b2de2a1..c023c57 100644
--- a/drivers/devfreq/Kconfig
+++ b/drivers/devfreq/Kconfig
@@ -84,6 +84,7 @@ config ARM_EXYNOS5_BUS_DEVFREQ
 	depends on SOC_EXYNOS5250
 	select ARCH_HAS_OPP
 	select DEVFREQ_GOV_SIMPLE_ONDEMAND
+	select PM_OPP
 	help
 	  This adds the DEVFREQ driver for Exynos5250 bus interface (vdd_int).
 	  It reads PPMU counters of memory controllers and adjusts the
-- 
1.8.0
