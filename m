From: Naveen Krishna Ch <ch.naveen@samsung.com>
Subject: [PATCH 3/4] ARM: EXYNOS4: Update clocks for keypad
Date: Sat,  5 Mar 2011 10:08:58 +0900
Message-ID: <1299287339-9696-4-git-send-email-ch.naveen@samsung.com>
References: <1299287339-9696-1-git-send-email-ch.naveen@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from ganesha.gnumonks.org ([213.95.27.120]:38496 "EHLO
	ganesha.gnumonks.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1760067Ab1CEBim (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 4 Mar 2011 20:38:42 -0500
In-Reply-To: <1299287339-9696-1-git-send-email-ch.naveen@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: ben-linux@fluff.org, Naveen Krishna Ch <ch.naveen@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>

The keypad IF on EXYNOS4 uses 100MHz from PERIR functional
block for clocks, this patch updates the same.

Signed-off-by: Naveen Krishna Ch <ch.naveen@samsung.com>
Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
---
 arch/arm/mach-exynos4/clock.c |    5 +++++
 1 files changed, 5 insertions(+), 0 deletions(-)

diff --git a/arch/arm/mach-exynos4/clock.c b/arch/arm/mach-exynos4/clock.c
index 72d53d5..fa844fc 100644
--- a/arch/arm/mach-exynos4/clock.c
+++ b/arch/arm/mach-exynos4/clock.c
@@ -482,6 +482,11 @@ static struct clk init_clocks_off[] = {
 		.enable		= exynos4_clk_ip_peril_ctrl,
 		.ctrlbit	= (1 << 15),
 	}, {
+		.name		= "keypad",
+		.id		= -1,
+		.enable		= exynos4_clk_ip_perir_ctrl,
+		.ctrlbit	= (1 << 16),
+	}, {
 		.name		= "rtc",
 		.id		= -1,
 		.enable		= exynos4_clk_ip_perir_ctrl,
-- 
1.7.1
