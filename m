From: Chanwoo Choi <cw00.choi@samsung.com>
Subject: [PATCH v6 3/3] ARM: exynos: Add exynos3250 compatible to use generic
 cpufreq driver
Date: Thu, 02 Jul 2015 09:42:41 +0900
Message-ID: <1435797761-3339-4-git-send-email-cw00.choi@samsung.com>
References: <1435797761-3339-1-git-send-email-cw00.choi@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:57533 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752072AbbGBAmp (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 1 Jul 2015 20:42:45 -0400
In-reply-to: <1435797761-3339-1-git-send-email-cw00.choi@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: s.nawrocki@samsung.com, tomasz.figa@gmail.com, mturquette@baylibre.com, sboyd@codeaurora.org, kgene@kernel.org, k.kozlowski@samsung.com
Cc: thomas.ab@samsung.com, b.zolnierkie@samsung.com, kyungmin.park@samsung.com, cw00.choi@samsung.com, linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org

This patch add exynos3250 compatible string to exynos_cpufreq_matches
for supporting generic cpufreq driver on Exynos3250.

Cc: Kukjin Kim <kgene@kernel.org>
Cc: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Signed-off-by: Chanwoo Choi <cw00.choi@samsung.com>
Acked-by: Kyungmin Park <kyungmin.park@samsung.com>
Reviewed-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
---
 arch/arm/mach-exynos/exynos.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/mach-exynos/exynos.c b/arch/arm/mach-exynos/exynos.c
index 4015ec369ae5..77ac0216ddc4 100644
--- a/arch/arm/mach-exynos/exynos.c
+++ b/arch/arm/mach-exynos/exynos.c
@@ -225,6 +225,7 @@ static void __init exynos_init_irq(void)
 }
 
 static const struct of_device_id exynos_cpufreq_matches[] = {
+	{ .compatible = "samsung,exynos3250", .data = "cpufreq-dt" },
 	{ .compatible = "samsung,exynos4210", .data = "cpufreq-dt" },
 	{ .compatible = "samsung,exynos5250", .data = "cpufreq-dt" },
 	{ /* sentinel */ }
-- 
1.8.5.5
