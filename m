From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCHv2 1/7] ARM: S5PC110: update framebuffer setup information for
 Goni
Date: Mon, 20 Sep 2010 14:55:31 +0200
Message-ID: <1284987337-15365-2-git-send-email-m.szyprowski@samsung.com>
References: <1284987337-15365-1-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:43712 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755924Ab0ITMzo (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 20 Sep 2010 08:55:44 -0400
Received: from eu_spt2 (mailout1.w1.samsung.com [210.118.77.11])
 by mailout1.w1.samsung.com
 (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTP id <0L9100H43QKSWU@mailout1.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 20 Sep 2010 13:55:40 +0100 (BST)
Received: from linux.samsung.com ([106.116.38.10])
 by spt2.w1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
 2004)) with ESMTPA id <0L910089UQKRRE@spt2.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 20 Sep 2010 13:55:40 +0100 (BST)
In-reply-to: <1284987337-15365-1-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: m.szyprowski@samsung.com, kyungmin.park@samsung.com, kgene.kim@samsung.com, ben-linux@fluff.org

Change the default upper_margin and vsync_len to get rid of repeated last
line on the display.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 arch/arm/mach-s5pv210/mach-goni.c |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/mach-s5pv210/mach-goni.c b/arch/arm/mach-s5pv210/mach-goni.c
index d9fe739..4bd5582 100644
--- a/arch/arm/mach-s5pv210/mach-goni.c
+++ b/arch/arm/mach-s5pv210/mach-goni.c
@@ -91,10 +91,10 @@ static struct s3c_fb_pd_win goni_fb_win0 = {
 		.pixclock = 1000000000000ULL / ((16+16+2+480)*(28+3+2+800)*55),
 		.left_margin	= 16,
 		.right_margin	= 16,
-		.upper_margin	= 3,
+		.upper_margin	= 2,
 		.lower_margin	= 28,
 		.hsync_len	= 2,
-		.vsync_len	= 2,
+		.vsync_len	= 1,
 		.xres		= 480,
 		.yres		= 800,
 		.refresh	= 55,
-- 
1.7.1.569.g6f426
