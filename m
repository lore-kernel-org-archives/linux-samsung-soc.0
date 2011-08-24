From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [PATCH] ARM: EXYNOS4: Fix return type of local_timer_setup()
Date: Wed, 24 Aug 2011 16:19:10 +0900
Message-ID: <1314170350-1667-1-git-send-email-kgene.kim@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from ganesha.gnumonks.org ([213.95.27.120]:40462 "EHLO
	ganesha.gnumonks.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751407Ab1HXHco (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 24 Aug 2011 03:32:44 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: ben-linux@fluff.org, Kukjin Kim <kgene.kim@samsung.com>

According to commmit af90f10d ("ARM: 6759/1: smp: Select
local timers vs broadcast timer support"), the return type
of local_timer_setup() should be int instead of void.

Reported-by: Changhwan Youn <chaos.youn@samsung.com>
Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
---
 arch/arm/mach-exynos4/mct.c |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/arch/arm/mach-exynos4/mct.c b/arch/arm/mach-exynos4/mct.c
index 1ae059b..f3638fa 100644
--- a/arch/arm/mach-exynos4/mct.c
+++ b/arch/arm/mach-exynos4/mct.c
@@ -389,9 +389,11 @@ static void exynos4_mct_tick_init(struct clock_event_device *evt)
 }
 
 /* Setup the local clock events for a CPU */
-void __cpuinit local_timer_setup(struct clock_event_device *evt)
+int __cpuinit local_timer_setup(struct clock_event_device *evt)
 {
 	exynos4_mct_tick_init(evt);
+
+	return 0;
 }
 
 int local_timer_ack(void)
-- 
1.7.1
