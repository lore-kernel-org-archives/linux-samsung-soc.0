From: Ben Dooks <ben-linux@fluff.org>
Subject: [PATCH] ARM: S3C64XX: Remove useless IO descriptor from S3C6410
Date: Tue, 26 Jan 2010 07:02:53 +0000
Message-ID: <1264489385-13345-3-git-send-email-ben-linux@fluff.org>
References: <1264489385-13345-1-git-send-email-ben-linux@fluff.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from trinity.fluff.org ([89.16.178.74]:46373 "EHLO trinity.fluff.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752730Ab0AZHDu (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 26 Jan 2010 02:03:50 -0500
In-Reply-To: <1264489385-13345-1-git-send-email-ben-linux@fluff.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: Ben Dooks <ben-linux@fluff.org>

The iotable in arch/arm/mach-s3c64xx/s3c6410.c is currently empty and
therefore can be removed from the build.

Signed-off-by: Ben Dooks <ben-linux@fluff.org>
---
 arch/arm/mach-s3c64xx/s3c6410.c |   12 ------------
 1 files changed, 0 insertions(+), 12 deletions(-)

diff --git a/arch/arm/mach-s3c64xx/s3c6410.c b/arch/arm/mach-s3c64xx/s3c6410.c
index dd55c6a..185f15c 100644
--- a/arch/arm/mach-s3c64xx/s3c6410.c
+++ b/arch/arm/mach-s3c64xx/s3c6410.c
@@ -41,20 +41,8 @@
 #include <plat/s3c6400.h>
 #include <plat/s3c6410.h>
 
-/* Initial IO mappings */
-
-static struct map_desc s3c6410_iodesc[] __initdata = {
-};
-
-/* s3c6410_map_io
- *
- * register the standard cpu IO areas
-*/
-
 void __init s3c6410_map_io(void)
 {
-	iotable_init(s3c6410_iodesc, ARRAY_SIZE(s3c6410_iodesc));
-
 	/* initialise device information early */
 	s3c6410_default_sdhci0();
 	s3c6410_default_sdhci1();
-- 
1.6.0.4
