From: Rahul Sharma <rahul.sharma@samsung.com>
Subject: [PATCH 4/4] ARM: EXYNOS: remove parent device for hdmiphy clock
Date: Mon, 29 Apr 2013 20:20:53 +0530
Message-ID: <1367247053-17105-5-git-send-email-rahul.sharma@samsung.com>
References: <1367247053-17105-1-git-send-email-rahul.sharma@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:35515 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757830Ab3D2O1z (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 29 Apr 2013 10:27:55 -0400
Received: from epcpsbgr2.samsung.com
 (u142.gpu120.samsung.co.kr [203.254.230.142])
 by mailout4.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MM000K56TIIK840@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 29 Apr 2013 23:27:54 +0900 (KST)
In-reply-to: <1367247053-17105-1-git-send-email-rahul.sharma@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org
Cc: inki.dae@samsung.com, seanpaul@google.com, r.sh.open@gmail.com, sw0312.kim@samsung.com, joshi@samsung.com, Rahul Sharma <rahul.sharma@samsung.com>

Hdmiphy clock flows from hdmiphy hw to hdmi ip and mixer. It is commonly
accessed among hdmi and hdmiphy driver. During power cycle, each of these
driver decrements the ref-count and ensures that last user disables the
clock. Setting parrent device to none ensure that both the drivers gets
access to the clock.

Signed-off-by: Rahul Sharma <rahul.sharma@samsung.com>
---
 arch/arm/mach-exynos/clock-exynos4.c |    1 -
 arch/arm/mach-exynos/clock-exynos5.c |    1 -
 2 files changed, 2 deletions(-)

diff --git a/arch/arm/mach-exynos/clock-exynos4.c b/arch/arm/mach-exynos/clock-exynos4.c
index 8a8468d..a43afcd 100644
--- a/arch/arm/mach-exynos/clock-exynos4.c
+++ b/arch/arm/mach-exynos/clock-exynos4.c
@@ -562,7 +562,6 @@ static struct clk exynos4_init_clocks_off[] = {
 		.ctrlbit	= (1 << 3),
 	}, {
 		.name		= "hdmiphy",
-		.devname	= "exynos4-hdmi",
 		.enable		= exynos4_clk_hdmiphy_ctrl,
 		.ctrlbit	= (1 << 0),
 	}, {
diff --git a/arch/arm/mach-exynos/clock-exynos5.c b/arch/arm/mach-exynos/clock-exynos5.c
index b0ea31f..4f39027 100644
--- a/arch/arm/mach-exynos/clock-exynos5.c
+++ b/arch/arm/mach-exynos/clock-exynos5.c
@@ -690,7 +690,6 @@ static struct clk exynos5_init_clocks_off[] = {
 		.ctrlbit	= (1 << 6),
 	}, {
 		.name		= "hdmiphy",
-		.devname	= "exynos5-hdmi",
 		.enable		= exynos5_clk_hdmiphy_ctrl,
 		.ctrlbit	= (1 << 0),
 	}, {
-- 
1.7.10.4
