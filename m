From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: [PATCH v2 2/3] ARM: EXYNOS: Constify exynos_pm_data and of_device_id
 array
Date: Tue, 03 Feb 2015 12:06:40 +0100
Message-ID: <1422961601-7087-2-git-send-email-k.kozlowski@samsung.com>
References: <1422961601-7087-1-git-send-email-k.kozlowski@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:31905 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S933269AbbBCLGz (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 3 Feb 2015 06:06:55 -0500
In-reply-to: <1422961601-7087-1-git-send-email-k.kozlowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Russell King <linux@arm.linux.org.uk>, Kukjin Kim <kgene@kernel.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <k.kozlowski@samsung.com>

The 'exynos5420_pm_data' and of_device_id array are not modified and can
be made const.

Signed-off-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>

---
Changes since v1:
1. New patch.
---
 arch/arm/mach-exynos/suspend.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/mach-exynos/suspend.c b/arch/arm/mach-exynos/suspend.c
index 77cc39bdad47..e6c961126087 100644
--- a/arch/arm/mach-exynos/suspend.c
+++ b/arch/arm/mach-exynos/suspend.c
@@ -572,7 +572,7 @@ static const struct exynos_pm_data exynos5250_pm_data = {
 	.cpu_suspend	= exynos_cpu_suspend,
 };
 
-static struct exynos_pm_data exynos5420_pm_data = {
+static const struct exynos_pm_data exynos5420_pm_data = {
 	.wkup_irq	= exynos5250_wkup_irq,
 	.wake_disable_mask = (0x7F << 7) | (0x1F << 1),
 	.release_ret_regs = exynos5420_release_ret_regs,
@@ -583,7 +583,7 @@ static struct exynos_pm_data exynos5420_pm_data = {
 	.cpu_suspend	= exynos5420_cpu_suspend,
 };
 
-static struct of_device_id exynos_pmu_of_device_ids[] = {
+static const struct of_device_id exynos_pmu_of_device_ids[] = {
 	{
 		.compatible = "samsung,exynos3250-pmu",
 		.data = &exynos3250_pm_data,
-- 
1.9.1
