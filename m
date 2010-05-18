From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH 1/2] ARM: SMDKC100: fix frame buffer definitions
Date: Tue, 18 May 2010 11:30:48 +0200
Message-ID: <1274175049-21847-2-git-send-email-m.szyprowski@samsung.com>
References: <1274175049-21847-1-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:49185 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753930Ab0ERJ5y (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 18 May 2010 05:57:54 -0400
Received: from eu_spt1 ([210.118.77.13]) by mailout3.w1.samsung.com
 (Sun Java(tm) System Messaging Server 6.3-8.04 (built Jul 29 2009; 32bit))
 with ESMTP id <0L2M00CNA10FJ730@mailout3.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 18 May 2010 10:57:51 +0100 (BST)
Received: from linux.samsung.com ([106.116.38.10])
 by spt1.w1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
 2004)) with ESMTPA id <0L2M004RK10ECR@spt1.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 18 May 2010 10:57:51 +0100 (BST)
In-reply-to: <1274175049-21847-1-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: m.szyprowski@samsung.com, kyungmin.park@samsung.com, ben-linux@fluff.org, kgene.kim@samsung.com

The definition of the framebuffer parameters was created when s3c-fb.c
driver was patched to support setting the refresh rate directly (commit
600ce1a0faafeed1ce6bcfd421bc040b941cbbc1). That patch was completely wrong
and was reverted in commit eb29a5cc0b601c458bae9df2f what breaked the
framebuffer on s5pc100. This patch updates framebuffer definitions to
correct values.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 arch/arm/mach-s5pc100/mach-smdkc100.c |    3 +--
 1 files changed, 1 insertions(+), 2 deletions(-)

diff --git a/arch/arm/mach-s5pc100/mach-smdkc100.c b/arch/arm/mach-s5pc100/mach-smdkc100.c
index ae3c52c..dd8c154 100644
--- a/arch/arm/mach-s5pc100/mach-smdkc100.c
+++ b/arch/arm/mach-s5pc100/mach-smdkc100.c
@@ -119,8 +119,7 @@ static struct platform_device smdkc100_lcd_powerdev = {
 static struct s3c_fb_pd_win smdkc100_fb_win0 = {
 	/* this is to ensure we use win0 */
 	.win_mode	= {
-		.refresh	= 70,
-		.pixclock	= (8+13+3+800)*(7+5+1+480),
+		.pixclock = 1000000000000ULL / ((8+13+3+800)*(7+5+1+480)*80),
 		.left_margin	= 8,
 		.right_margin	= 13,
 		.upper_margin	= 7,
-- 
1.6.4
