From: Sangbeom Kim <sbkim73@samsung.com>
Subject: [PATCH 2/2] ARM: S3C2416: Change S3C2416 NAND platform device name
Date: Mon, 19 Jul 2010 08:31:51 +0900
Message-ID: <1279495911-17346-3-git-send-email-sbkim73@samsung.com>
References: <1279495911-17346-1-git-send-email-sbkim73@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from ganesha.gnumonks.org ([213.95.27.120]:53096 "EHLO
	ganesha.gnumonks.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757637Ab0GRXke (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 18 Jul 2010 19:40:34 -0400
In-Reply-To: <1279495911-17346-1-git-send-email-sbkim73@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: ben-linux@fluff.org, kgene.kim@samsung.com, Atul Dahiya <atul.dahiya@samsung.com>, Sangbeom Kim <sbkim73@samsung.com>

From: Atul Dahiya <atul.dahiya@samsung.com>

This patch changes the platform device name from 's3c2416-nand' to
's3c2412-nand' so that S3C2416 can reuse the nand functionality
available on S3C2412.

Signed-off-by: Atul Dahiya <atul.dahiya@samsung.com>
Signed-off-by: Sangbeom Kim <sbkim73@samsung.com>
---
 arch/arm/mach-s3c2416/s3c2416.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/arch/arm/mach-s3c2416/s3c2416.c b/arch/arm/mach-s3c2416/s3c2416.c
index bfe674f..6468b6c 100644
--- a/arch/arm/mach-s3c2416/s3c2416.c
+++ b/arch/arm/mach-s3c2416/s3c2416.c
@@ -100,7 +100,7 @@ void __init s3c2416_init_uarts(struct s3c2410_uartcfg *cfg, int no)
 {
 	s3c24xx_init_uartdevs("s3c2440-uart", s3c2410_uart_resources, cfg, no);
 
-	s3c_nand_setname("s3c2416-nand");
+	s3c_nand_setname("s3c2412-nand");
 }
 
 /* s3c2416_map_io
-- 
1.6.2.5
