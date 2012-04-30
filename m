From: Thomas Abraham <thomas.abraham@linaro.org>
Subject: [PATCH 03/20] ARM: EXYNOS: fix ctrlbit for exynos5_clk_pdma1
Date: Mon, 30 Apr 2012 12:14:13 -0700
Message-ID: <1335813270-13083-4-git-send-email-thomas.abraham@linaro.org>
References: <1335813270-13083-1-git-send-email-thomas.abraham@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pb0-f46.google.com ([209.85.160.46]:42437 "EHLO
	mail-pb0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756515Ab2D3TQz (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 30 Apr 2012 15:16:55 -0400
Received: by mail-pb0-f46.google.com with SMTP id rp8so3589582pbb.19
        for <linux-samsung-soc@vger.kernel.org>; Mon, 30 Apr 2012 12:16:54 -0700 (PDT)
In-Reply-To: <1335813270-13083-1-git-send-email-thomas.abraham@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: kgene.kim@samsung.com, linux-samsung-soc@vger.kernel.org

From: Kukjin Kim <kgene.kim@samsung.com>

It should be (1 << 2) for ctrlbit of exynos5_clk_pdma1.

Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
---
 arch/arm/mach-exynos/clock-exynos5.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/arch/arm/mach-exynos/clock-exynos5.c b/arch/arm/mach-exynos/clock-exynos5.c
index 3dc3c50..846741e 100644
--- a/arch/arm/mach-exynos/clock-exynos5.c
+++ b/arch/arm/mach-exynos/clock-exynos5.c
@@ -683,7 +683,7 @@ static struct clk exynos5_clk_pdma1 = {
 	.name		= "dma",
 	.devname	= "dma-pl330.1",
 	.enable		= exynos5_clk_ip_fsys_ctrl,
-	.ctrlbit	= (1 << 1),
+	.ctrlbit	= (1 << 2),
 };
 
 static struct clk exynos5_clk_mdma1 = {
-- 
1.7.5.4
