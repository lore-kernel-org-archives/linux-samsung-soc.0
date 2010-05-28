From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [PATCH 2/4] ARM: S5PV210: Assign clock rate for clk_xusbxti clock.
Date: Fri, 28 May 2010 11:41:15 +0900
Message-ID: <1275014477-23133-3-git-send-email-kgene.kim@samsung.com>
References: <1275014477-23133-1-git-send-email-kgene.kim@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from ganesha.gnumonks.org ([213.95.27.120]:35348 "EHLO
	ganesha.gnumonks.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756961Ab0E1CpZ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 27 May 2010 22:45:25 -0400
In-Reply-To: <1275014477-23133-1-git-send-email-kgene.kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: ben-linux@fluff.org, Thomas Abraham <thomas.ab@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>

From: Thomas Abraham <thomas.ab@samsung.com>

The input clock frequency for USB Phy is 24 Mhz on the S5PV210
platform. This patch initializes the clk_xusbxti clock rate to 24Mhz.

Signed-off-by: Thomas Abraham <thomas.ab@samsung.com>
Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
---
 arch/arm/mach-s5pv210/clock.c |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/arch/arm/mach-s5pv210/clock.c b/arch/arm/mach-s5pv210/clock.c
index 154bca4..4ef09d4 100644
--- a/arch/arm/mach-s5pv210/clock.c
+++ b/arch/arm/mach-s5pv210/clock.c
@@ -954,6 +954,8 @@ void __init_or_cpufreq s5pv210_setup_clocks(void)
 
 	printk(KERN_DEBUG "%s: registering clocks\n", __func__);
 
+	clk_xusbxti.rate = 24 * MHZ;
+
 	clkdiv0 = __raw_readl(S5P_CLK_DIV0);
 	clkdiv1 = __raw_readl(S5P_CLK_DIV1);
 
-- 
1.6.3.3
