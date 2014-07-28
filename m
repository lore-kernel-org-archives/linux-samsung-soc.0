From: Vikas Sajjan <vikas.sajjan@samsung.com>
Subject: [PATCH 2/2] ARM: EXYNOS: Add exynos5260 PMU compatible string to DT
 match table
Date: Mon, 28 Jul 2014 17:45:26 +0530
Message-ID: <1406549726-10452-3-git-send-email-vikas.sajjan@samsung.com>
References: <1406549726-10452-1-git-send-email-vikas.sajjan@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:19788 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752774AbaG1MTM (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 28 Jul 2014 08:19:12 -0400
Received: from epcpsbgr3.samsung.com
 (u143.gpu120.samsung.co.kr [203.254.230.143])
 by mailout1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0N9F00COV8VZA390@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 28 Jul 2014 21:19:11 +0900 (KST)
In-reply-to: <1406549726-10452-1-git-send-email-vikas.sajjan@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, tomasz.figa@gmail.com, joshi@samsung.com, sajjan.linux@gmail.com, dianders@chromium.org, Vikas Sajjan <vikas.sajjan@samsung.com>

Exynos initialisation code now relies on obtaining the PMU address via
DT node, so add the exynos5260 PMU compatible string to DT match table.

Signed-off-by: Vikas Sajjan <vikas.sajjan@samsung.com>
---
 arch/arm/mach-exynos/exynos.c |    1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/mach-exynos/exynos.c b/arch/arm/mach-exynos/exynos.c
index df41bd1..e4f7270 100644
--- a/arch/arm/mach-exynos/exynos.c
+++ b/arch/arm/mach-exynos/exynos.c
@@ -253,6 +253,7 @@ static const struct of_device_id exynos_dt_pmu_match[] = {
 	{ .compatible = "samsung,exynos4412-pmu" },
 	{ .compatible = "samsung,exynos5250-pmu" },
 	{ .compatible = "samsung,exynos5420-pmu" },
+	{ .compatible = "samsung,exynos5260-pmu" },
 	{ /*sentinel*/ },
 };
 
-- 
1.7.9.5
