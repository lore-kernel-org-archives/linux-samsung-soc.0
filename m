From: Vikas Sajjan <vikas.sajjan@samsung.com>
Subject: [PATCH 2/3] arm: exynos: Add exynos5800-pmu compatible entry
Date: Wed, 09 Jul 2014 16:55:46 +0530
Message-ID: <1404905147-30319-3-git-send-email-vikas.sajjan@samsung.com>
References: <1404905147-30319-1-git-send-email-vikas.sajjan@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:62418 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754057AbaGIL2p (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 9 Jul 2014 07:28:45 -0400
Received: from epcpsbgr4.samsung.com
 (u144.gpu120.samsung.co.kr [203.254.230.144])
 by mailout4.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0N8F0062TZVVS490@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 09 Jul 2014 20:28:44 +0900 (KST)
In-reply-to: <1404905147-30319-1-git-send-email-vikas.sajjan@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, tomasz.figa@gmail.com, joshi@samsung.com, sajjan.linux@gmail.com, dianders@chromium.org, Vikas Sajjan <vikas.sajjan@samsung.com>

Adds exynos5800-pmu compatible string entry in the pmu table.

Signed-off-by: Vikas Sajjan <vikas.sajjan@samsung.com>
---
 arch/arm/mach-exynos/exynos.c |    1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/mach-exynos/exynos.c b/arch/arm/mach-exynos/exynos.c
index d75d3e8..d5853b1 100644
--- a/arch/arm/mach-exynos/exynos.c
+++ b/arch/arm/mach-exynos/exynos.c
@@ -253,6 +253,7 @@ static const struct of_device_id exynos_dt_pmu_match[] = {
 	{ .compatible = "samsung,exynos4412-pmu" },
 	{ .compatible = "samsung,exynos5250-pmu" },
 	{ .compatible = "samsung,exynos5420-pmu" },
+	{ .compatible = "samsung,exynos5800-pmu" },
 	{ /*sentinel*/ },
 };
 
-- 
1.7.9.5
