From: Pavel Fedin <p.fedin@samsung.com>
Subject: [PATCH v2 RESEND] ARM: exynos: Bring back reboot on Exynos5410
Date: Thu, 29 Oct 2015 10:46:11 +0300
Message-ID: <008101d1121d$e1b9b250$a52d16f0$@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:15529 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751879AbbJ2HqP (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 29 Oct 2015 03:46:15 -0400
Content-language: ru
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: 'Kukjin Kim' <kgene@kernel.org>, 'Krzysztof Kozlowski' <k.kozlowski@samsung.com>, stable@vger.kernel.org

Since 8cfc7fdd33080e30b86d21b1a8c9ad0686427ddc
("ARM: EXYNOS: move restart code into pmu driver") PMU support is required
in order for the reboot to work. Unfortunately, there is currently no PMU
support for 5410.

This patch adds exynos5410-pmu to the list of recognized devices. It is
okay for the code to have empty struct exynos_pmu_data, in this case only
minimal support is enabled. This is enough for SWRESET to work.

Signed-off-by: Pavel Fedin <p.fedin@samsung.com>
Reviewed-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Cc: <stable@vger.kernel.org>
Fixes: 8cfc7fdd3308 ("ARM: EXYNOS: move restart code into pmu driver")
---
v1 => v2:
- Added 'const'
- Resend: added missing Cc: tag
---
 arch/arm/mach-exynos/pmu.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm/mach-exynos/pmu.c b/arch/arm/mach-exynos/pmu.c
index de68938..ecbe980 100644
--- a/arch/arm/mach-exynos/pmu.c
+++ b/arch/arm/mach-exynos/pmu.c
@@ -908,6 +908,10 @@ static const struct exynos_pmu_data exynos5250_pmu_data = {
 	.powerdown_conf	= exynos5_powerdown_conf,
 };
 
+static const struct exynos_pmu_data exynos5410_pmu_data = {
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

