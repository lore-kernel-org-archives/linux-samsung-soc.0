From: Seung-Woo Kim <sw0312.kim@samsung.com>
Subject: [PATCH] memory: samsung: exynos-srom: fix wrong count of registers
Date: Tue, 05 Jul 2016 20:40:17 +0900
Message-ID: <1467718817-19239-1-git-send-email-sw0312.kim@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:54220 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754779AbcGELkS (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 5 Jul 2016 07:40:18 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, k.kozlowski@samsung.com, kgene@kernel.org
Cc: cw00.choi@samsung.com, sw0312.kim@samsung.com

This patch fixes wrong count of array for srom registers from probe
function.

Signed-off-by: Seung-Woo Kim <sw0312.kim@samsung.com>
---
 drivers/memory/samsung/exynos-srom.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/memory/samsung/exynos-srom.c b/drivers/memory/samsung/exynos-srom.c
index 96756fb..c66d2bd 100644
--- a/drivers/memory/samsung/exynos-srom.c
+++ b/drivers/memory/samsung/exynos-srom.c
@@ -134,7 +134,7 @@ static int exynos_srom_probe(struct platform_device *pdev)
 	platform_set_drvdata(pdev, srom);
 
 	srom->reg_offset = exynos_srom_alloc_reg_dump(exynos_srom_offsets,
-			sizeof(exynos_srom_offsets));
+			ARRAY_SIZE(exynos_srom_offsets));
 	if (!srom->reg_offset) {
 		iounmap(srom->reg_base);
 		return -ENOMEM;
-- 
1.7.9.5
