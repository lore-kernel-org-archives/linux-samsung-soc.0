From: MyungJoo Ham <myungjoo.ham@samsung.com>
Subject: [PATCH] ARM: S5PV210: Update I2C-1 Clock Register Property.
Date: Thu, 19 Aug 2010 15:38:39 +0900
Message-ID: <1282199919-32523-1-git-send-email-myungjoo.ham@samsung.com>
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:42003 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751066Ab0HSGje (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 19 Aug 2010 02:39:34 -0400
Received: from epmmp2 (mailout3.samsung.com [203.254.224.33])
 by mailout3.samsung.com
 (Sun Java(tm) System Messaging Server 7u3-15.01 64bit (built Feb 12 2010))
 with ESMTP id <0L7D005V5ZSGLV50@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 19 Aug 2010 15:38:40 +0900 (KST)
Received: from TNRNDGASPAPP1.tn.corp.samsungelectronics.net ([165.213.149.150])
 by mmp2.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0L7D00A8EZSGB3@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 19 Aug 2010 15:38:40 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: kyungmin.park@samsung.com, kgene.kim@samsung.com, myungjoo.ham@gmail.com, ben-linux@fluff.org, linux-samsung-soc@vger.kernel.org, jy0922.shim@samsung.com

CLK_GATE_IP3[8] is RESERVED. The port "I2C_HDMI_DDY" of
CLK_GATE_IP3[10] is used as another I2C port (but not dedicated to HDMI
as if it is a general I2C port)

Therefore, we define the unused I2C-1 (IP3[8] is not used) as another
I2C there was left undefined but used.

Signed-off-by: MyungJoo Ham <myungjoo.ham@samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 arch/arm/mach-s5pv210/clock.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/arch/arm/mach-s5pv210/clock.c b/arch/arm/mach-s5pv210/clock.c
index af91fef..825b868 100644
--- a/arch/arm/mach-s5pv210/clock.c
+++ b/arch/arm/mach-s5pv210/clock.c
@@ -357,7 +357,7 @@ static struct clk init_clocks_disable[] = {
 		.id		= 1,
 		.parent		= &clk_pclk_psys.clk,
 		.enable		= s5pv210_clk_ip3_ctrl,
-		.ctrlbit	= (1<<8),
+		.ctrlbit	= (1 << 10),
 	}, {
 		.name		= "i2c",
 		.id		= 2,
-- 
1.6.3.3
