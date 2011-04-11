From: Vladimir Zapolskiy <vzapolskiy@gmail.com>
Subject: [PATCH 2/4] ARM: S5PV210: add security subsystem clock
Date: Tue, 12 Apr 2011 01:02:55 +0300
Message-ID: <1302559377-14857-3-git-send-email-vzapolskiy@gmail.com>
References: <1302559377-14857-1-git-send-email-vzapolskiy@gmail.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ew0-f46.google.com ([209.85.215.46]:37830 "EHLO
	mail-ew0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754404Ab1DKWDX (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 11 Apr 2011 18:03:23 -0400
Received: by mail-ew0-f46.google.com with SMTP id 4so1854201ewy.19
        for <linux-samsung-soc@vger.kernel.org>; Mon, 11 Apr 2011 15:03:23 -0700 (PDT)
In-Reply-To: <1302559377-14857-1-git-send-email-vzapolskiy@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: Kukjin Kim <kgene.kim@samsung.com>, Vladimir Zapolskiy <vzapolskiy@gmail.com>

This change adds security subsystem clock to the list of disabled by
default clocks. This clock could be enabled later, if crypto engine is
supposed to be used.

Signed-off-by: Vladimir Zapolskiy <vzapolskiy@gmail.com>
---
 arch/arm/mach-s5pv210/clock.c |    6 ++++++
 1 files changed, 6 insertions(+), 0 deletions(-)

diff --git a/arch/arm/mach-s5pv210/clock.c b/arch/arm/mach-s5pv210/clock.c
index 2d59949..3fc9f68 100644
--- a/arch/arm/mach-s5pv210/clock.c
+++ b/arch/arm/mach-s5pv210/clock.c
@@ -371,6 +371,12 @@ static struct clk init_clocks_off[] = {
 		.enable		= s5pv210_clk_ip1_ctrl,
 		.ctrlbit	= (1<<25),
 	}, {
+		.name		= "secss",
+		.id		= -1,
+		.parent		= &clk_hclk_psys.clk,
+		.enable		= s5pv210_clk_ip2_ctrl,
+		.ctrlbit	= (1 << 0),
+	}, {
 		.name		= "hsmmc",
 		.id		= 0,
 		.parent		= &clk_hclk_psys.clk,
-- 
1.7.2.3
