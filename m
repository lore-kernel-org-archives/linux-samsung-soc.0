From: Inderpal Singh <inderpal.s@samsung.com>
Subject: [PATCH] ARM: SAMSUNG: Enable watchdog parent clock for SMDKV310
Date: Mon, 07 Mar 2011 14:00:24 +0530
Message-ID: <1299486624-2446-1-git-send-email-inderpal.s@samsung.com>
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:50812 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751469Ab1CGImK (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 7 Mar 2011 03:42:10 -0500
Received: from epmmp1 (mailout4.samsung.com [203.254.224.34])
 by mailout4.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LHO00B5BITTOS70@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 07 Mar 2011 17:41:53 +0900 (KST)
Received: from Linaro.sisodomain.com ([107.108.215.143])
 by mmp1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0LHO00IMZISWC4@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 07 Mar 2011 17:41:53 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com

This patch adds the parent clock for watchdog timer for SMDKV310.

Signed-off-by: Inderpal Singh <inderpal.s@samsung.com>
---
 arch/arm/mach-exynos4/clock.c |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/arch/arm/mach-exynos4/clock.c b/arch/arm/mach-exynos4/clock.c
index 72d53d5..7bf3c4e 100644
--- a/arch/arm/mach-exynos4/clock.c
+++ b/arch/arm/mach-exynos4/clock.c
@@ -489,6 +489,7 @@ static struct clk init_clocks_off[] = {
 	}, {
 		.name		= "watchdog",
 		.id		= -1,
+		.parent		= &clk_aclk_100.clk,
 		.enable		= exynos4_clk_ip_perir_ctrl,
 		.ctrlbit	= (1 << 14),
 	}, {
-- 
1.7.1
