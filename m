From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [PATCH 5/6] ARM: S5PV210: Add SROM controller clock
Date: Thu,  2 Dec 2010 18:29:20 +0900
Message-ID: <1291282161-1992-6-git-send-email-kgene.kim@samsung.com>
References: <1291282161-1992-1-git-send-email-kgene.kim@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from ganesha.gnumonks.org ([213.95.27.120]:38939 "EHLO
	ganesha.gnumonks.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757359Ab0LBJnM (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 2 Dec 2010 04:43:12 -0500
In-Reply-To: <1291282161-1992-1-git-send-email-kgene.kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: ben-linux@fluff.org, Thomas Abraham <thomas.ab@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>

From: Thomas Abraham <thomas.ab@samsung.com>

This patch adds the SROM controller clock to the list of clocks to be enabled at
boot time. It is required to be enabled at boot time since the modules connected
over the SROM interface such as the Ethernet controller need an operational SROM.

Signed-off-by: Thomas Abraham <thomas.ab@samsung.com>
Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
---
 arch/arm/mach-s5pv210/clock.c |    6 ++++++
 1 files changed, 6 insertions(+), 0 deletions(-)

diff --git a/arch/arm/mach-s5pv210/clock.c b/arch/arm/mach-s5pv210/clock.c
index 019c3a6..2f9372f 100644
--- a/arch/arm/mach-s5pv210/clock.c
+++ b/arch/arm/mach-s5pv210/clock.c
@@ -525,6 +525,12 @@ static struct clk init_clocks[] = {
 		.parent		= &clk_pclk_psys.clk,
 		.enable		= s5pv210_clk_ip3_ctrl,
 		.ctrlbit	= (1 << 20),
+	}, {
+		.name		= "sromc",
+		.id		= -1,
+		.parent		= &clk_hclk_psys.clk,
+		.enable		= s5pv210_clk_ip1_ctrl,
+		.ctrlbit	= (1 << 26),
 	},
 };
 
-- 
1.6.2.5
