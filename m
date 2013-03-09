From: Paul Bolle <pebolle@tiscali.nl>
Subject: [PATCH] ARM: S3C24XX: drop "select MACH_NEO1973"
Date: Sat, 09 Mar 2013 20:08:01 +0100
Message-ID: <1362856081.3137.19.camel@x61.thuisdomein>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from cpsmtpb-ews10.kpnxchange.com ([213.75.39.15]:53536 "EHLO
	cpsmtpb-ews10.kpnxchange.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1750881Ab3CITII (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 9 Mar 2013 14:08:08 -0500
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Ben Dooks <ben-linux@fluff.org>, Kukjin Kim <kgene.kim@samsung.com>, Russell King <linux@arm.linux.org.uk>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org

The Kconfig entry for the Openmoko GTA02 / Freerunner phone selects
MACH_NEO1973. But there is no Kconfig symbol MACH_NEO1973. The select
statement for that symbol is a nop. It can safely be dropped.

Signed-off-by: Paul Bolle <pebolle@tiscali.nl>
---
0) Tested with "git grep".

1) There appear to be repositories that carry a "config MACH_NEO1973" in
their tree. I guess it is used to collect functionality common to the
GTA01 and the GTA02. But except for this select statement, MACH_NEO1973
was never used in mainline. So if the GTA01 code ever gets merged into
mainline, this select statement might be added once more (if it is
actually needed then).

 arch/arm/mach-s3c24xx/Kconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm/mach-s3c24xx/Kconfig b/arch/arm/mach-s3c24xx/Kconfig
index 7361b9d..bec43fe 100644
--- a/arch/arm/mach-s3c24xx/Kconfig
+++ b/arch/arm/mach-s3c24xx/Kconfig
@@ -641,7 +641,6 @@ comment "S3C2442 Boards"
 config MACH_NEO1973_GTA02
 	bool "Openmoko GTA02 / Freerunner phone"
 	select I2C
-	select MACH_NEO1973
 	select MFD_PCF50633
 	select PCF50633_GPIO
 	select POWER_SUPPLY
-- 
1.7.11.7
