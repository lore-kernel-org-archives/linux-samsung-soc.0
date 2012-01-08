From: jhbird.choi@samsung.com
Subject: [PATCH] ARM: EXYNOS: Fix "warning: initialization from incompatible pointer type"
Date: Sun,  8 Jan 2012 09:58:52 +0900
Message-ID: <1325984332-32146-1-git-send-email-jhbird.choi@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from ganesha.gnumonks.org ([213.95.27.120]:54311 "EHLO
	ganesha.gnumonks.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754398Ab2AJMJ1 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 10 Jan 2012 07:09:27 -0500
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: Kukjin Kim <kgene.kim@samsung.com>, Russell King <linux@arm.linux.org.uk>, Jonghwan Choi <jhbird.choi@samsung.com>

From: Jonghwan Choi <jhbird.choi@samsung.com>

Fix the wrong function prototype.

Signed-off-by: Jonghwan Choi <jhbird.choi@samsung.com>
---
 arch/arm/mach-exynos/pm.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/arch/arm/mach-exynos/pm.c b/arch/arm/mach-exynos/pm.c
index c4f792d..db33f47 100644
--- a/arch/arm/mach-exynos/pm.c
+++ b/arch/arm/mach-exynos/pm.c
@@ -205,7 +205,7 @@ static void exynos4_pm_prepare(void)
 
 }
 
-static int exynos4_pm_add(struct device *dev)
+static int exynos4_pm_add(struct device *dev, struct subsys_interface *sif)
 {
 	pm_cpu_prep = exynos4_pm_prepare;
 	pm_cpu_sleep = exynos4_cpu_suspend;
-- 
1.7.1
