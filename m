From: Pavel Fedin <p.fedin@samsung.com>
Subject: [PATCH] ARM: exynos: Bring back reboot on Exynos5410
Date: Wed, 28 Oct 2015 12:36:05 +0300
Message-ID: <1446024965-8508-1-git-send-email-p.fedin@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:12036 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750968AbbJ1JhE (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 28 Oct 2015 05:37:04 -0400
Received: from eucpsbgm1.samsung.com (unknown [203.254.199.244])
 by mailout2.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0NWX004QKC1QV770@mailout2.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 28 Oct 2015 09:37:02 +0000 (GMT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>

Since 8cfc7fdd33080e30b86d21b1a8c9ad0686427ddc ("ARM: EXYNOS: move restart
code into pmu driver") PMU support is required in order for the reboot to
work. Unfortunately, there is currently no PMU support for 5410.

This patch adds exynos5410-pmu to the list of recognized devices. It is
okay for the code to have empty struct exynos_pmu_data, in this case only
minimal support is enabled. This is enough for SWRESET to work.

Signed-off-by: Pavel Fedin <p.fedin@samsung.com>
---
 arch/arm/mach-exynos/pmu.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm/mach-exynos/pmu.c b/arch/arm/mach-exynos/pmu.c
index de68938..7b9e33c 100644
--- a/arch/arm/mach-exynos/pmu.c
+++ b/arch/arm/mach-exynos/pmu.c
@@ -908,6 +908,10 @@ static const struct exynos_pmu_data exynos5250_pmu_data = {
 	.powerdown_conf	= exynos5_powerdown_conf,
 };
 
+static struct exynos_pmu_data exynos5410_pmu_data = {
+	/* Only SWRESET is currently supported on 5410 */
+};
+
 static struct exynos_pmu_data exynos5420_pmu_data = {
 	.pmu_config	= exynos5420_pmu_config,
 	.pmu_init	= exynos5420_pmu_init,
@@ -934,6 +938,9 @@ static const struct of_device_id exynos_pmu_of_device_ids[] = {
 		.compatible = "samsung,exynos5250-pmu",
 		.data = &exynos5250_pmu_data,
 	}, {
+		.compatible = "samsung,exynos5410-pmu",
+		.data = &exynos5410_pmu_data,
+	}, {
 		.compatible = "samsung,exynos5420-pmu",
 		.data = &exynos5420_pmu_data,
 	},
-- 
2.4.4
