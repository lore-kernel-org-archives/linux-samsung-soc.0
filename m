From: Maurus Cuelenaere <mcuelenaere@gmail.com>
Subject: [PATCH 2/5] ARM: S3C64XX: Set wifi and iNAND as permanently connected SD devices on SmartQ boards
Date: Fri, 13 Aug 2010 21:17:54 +0200
Message-ID: <4c659a64.097b0e0a.5759.ffffcf48@mx.google.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ey0-f174.google.com ([209.85.215.174]:42912 "EHLO
	mail-ey0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755515Ab0HMTR5 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 13 Aug 2010 15:17:57 -0400
Received: by mail-ey0-f174.google.com with SMTP id 5so443699eyg.19
        for <linux-samsung-soc@vger.kernel.org>; Fri, 13 Aug 2010 12:17:56 -0700 (PDT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: ben-linux@fluff.org, akpm@linux-foundation.org

This patch changes the platform data definitions of the wifi and iNAND chip on
the SmartQ 5 and 7 to indicate that they don't have a CD line available and are
thus hard-wired to the SDHCI data lines.

Signed-off-by: Maurus Cuelenaere <mcuelenaere@gmail.com>
---
 arch/arm/mach-s3c64xx/mach-smartq.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/arch/arm/mach-s3c64xx/mach-smartq.c b/arch/arm/mach-s3c64xx/mach-smartq.c
index 54309da..20ddce6 100644
--- a/arch/arm/mach-s3c64xx/mach-smartq.c
+++ b/arch/arm/mach-s3c64xx/mach-smartq.c
@@ -167,7 +167,7 @@ static struct s3c2410_ts_mach_info smartq_touchscreen_pdata __initdata = {
 
 static struct s3c_sdhci_platdata smartq_internal_hsmmc_pdata = {
 	.max_width		= 4,
-	/*.broken_card_detection	= true,*/
+	.cd_type		= S3C_SDHCI_CD_PERMANENT,
 };
 
 static struct s3c_hwmon_pdata smartq_hwmon_pdata __initdata = {
-- 
1.7.0.4
