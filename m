From: Heiko =?iso-8859-1?q?St=FCbner?= <heiko@sntech.de>
Subject: [PATCH 1/3] Fix missing struct for s3c2410_dma_chan in s3c2410_dma_suspend_chan
Date: Wed, 1 Jun 2011 13:50:40 +0200
Message-ID: <201106011350.44375.heiko@sntech.de>
References: <201106011348.47145.heiko@sntech.de>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from s15407518.onlinehome-server.info ([82.165.136.167]:45099 "EHLO
	s15407518.onlinehome-server.info" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1752600Ab1FALu6 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 1 Jun 2011 07:50:58 -0400
In-Reply-To: <201106011348.47145.heiko@sntech.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>, rjw@sisk.pl
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Heiko =?iso-8859-1?q?St=FCbner?= <heiko@sntech.de>

s3c2410_dma_chan is not a type itself, so struct is required.
---
 arch/arm/plat-s3c24xx/dma.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/arch/arm/plat-s3c24xx/dma.c b/arch/arm/plat-s3c24xx/dma.c
index c10d10c..2abf966 100644
--- a/arch/arm/plat-s3c24xx/dma.c
+++ b/arch/arm/plat-s3c24xx/dma.c
@@ -1199,7 +1199,7 @@ EXPORT_SYMBOL(s3c2410_dma_getposition);
 
 #ifdef CONFIG_PM
 
-static void s3c2410_dma_suspend_chan(s3c2410_dma_chan *cp)
+static void s3c2410_dma_suspend_chan(struct s3c2410_dma_chan *cp)
 {
 	printk(KERN_DEBUG "suspending dma channel %d\n", cp->number);
 
-- 
1.7.1
