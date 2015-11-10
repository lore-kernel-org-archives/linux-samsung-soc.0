From: Pankaj Dubey <pankaj.dubey@samsung.com>
Subject: [PATCH v4 2/9] ARM: EXYNOS: Fix potential NULL pointer access in
 exynos_sys_powerdown_conf
Date: Tue, 10 Nov 2015 17:12:57 +0530
Message-ID: <1447155784-12667-3-git-send-email-pankaj.dubey@samsung.com>
References: <1447155784-12667-1-git-send-email-pankaj.dubey@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:44845 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751133AbbKJLsS (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 10 Nov 2015 06:48:18 -0500
In-reply-to: <1447155784-12667-1-git-send-email-pankaj.dubey@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: kgene.kim@samsung.com, k.kozlowski@samsung.com, thomas.ab@samsung.com, amitdanielk@gmail.com, olof@lixom.net, khilman@linaro.org, arnd@arndb.de, Pankaj Dubey <pankaj.dubey@samsung.com>

If no platform devices binded to the driver but driver itself loaded and
exynos_sys_powerdown_conf is called from
arch/arm/mach-exynos/{suspend.c, pm.c} it will result in NULL pointer access,
to prevent this added check on pmu_context for NULL.

Signed-off-by: Pankaj Dubey <pankaj.dubey@samsung.com>
---
 arch/arm/mach-exynos/pmu.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/arch/arm/mach-exynos/pmu.c b/arch/arm/mach-exynos/pmu.c
index 64ea7d6..14ec1ff 100644
--- a/arch/arm/mach-exynos/pmu.c
+++ b/arch/arm/mach-exynos/pmu.c
@@ -749,8 +749,12 @@ static void exynos5_powerdown_conf(enum sys_powerdown mode)
 void exynos_sys_powerdown_conf(enum sys_powerdown mode)
 {
 	unsigned int i;
+	const struct exynos_pmu_data *pmu_data;
+
+	if(!pmu_context)
+		return;
 
-	const struct exynos_pmu_data *pmu_data = pmu_context->pmu_data;
+	pmu_data = pmu_context->pmu_data;
 
 	if (pmu_data->powerdown_conf)
 		pmu_data->powerdown_conf(mode);
-- 
2.4.5
