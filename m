From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCHv2 2/7] ARM: S5PC110: fb setup for Goni - remove pixel clock
Date: Mon, 20 Sep 2010 14:55:32 +0200
Message-ID: <1284987337-15365-3-git-send-email-m.szyprowski@samsung.com>
References: <1284987337-15365-1-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:43712 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753111Ab0ITMzm (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 20 Sep 2010 08:55:42 -0400
Received: from eu_spt1 (mailout1.w1.samsung.com [210.118.77.11])
 by mailout1.w1.samsung.com
 (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTP id <0L9100G9OQKS7T@mailout1.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 20 Sep 2010 13:55:40 +0100 (BST)
Received: from linux.samsung.com ([106.116.38.10])
 by spt1.w1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
 2004)) with ESMTPA id <0L9100C3WQKRVC@spt1.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 20 Sep 2010 13:55:40 +0100 (BST)
In-reply-to: <1284987337-15365-1-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: m.szyprowski@samsung.com, kyungmin.park@samsung.com, kgene.kim@samsung.com, ben-linux@fluff.org

Since commit 67a38950f0917aecfe1a3e46720d8bbb0020 there is no need
to set pixel clock for the s3c-fb driver's window information.
The correct pixel clock value can be automatically calculated from
the other screen parameters. This patch removes the redundant pixel clock
parameter.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 arch/arm/mach-s5pv210/mach-goni.c |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/arch/arm/mach-s5pv210/mach-goni.c b/arch/arm/mach-s5pv210/mach-goni.c
index 4bd5582..b0ae208 100644
--- a/arch/arm/mach-s5pv210/mach-goni.c
+++ b/arch/arm/mach-s5pv210/mach-goni.c
@@ -88,7 +88,6 @@ static struct s3c2410_uartcfg goni_uartcfgs[] __initdata = {
 /* Frame Buffer */
 static struct s3c_fb_pd_win goni_fb_win0 = {
 	.win_mode = {
-		.pixclock = 1000000000000ULL / ((16+16+2+480)*(28+3+2+800)*55),
 		.left_margin	= 16,
 		.right_margin	= 16,
 		.upper_margin	= 2,
-- 
1.7.1.569.g6f426
