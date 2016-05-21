From: Andrea Gelmini <andrea.gelmini@gelma.net>
Subject: [PATCH 0118/1529] Fix typo
Date: Sat, 21 May 2016 13:51:36 +0200
Message-ID: <20160521115136.5547-1-andrea.gelmini@gelma.net>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-lf0-f66.google.com ([209.85.215.66]:35015 "EHLO
	mail-lf0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751758AbcEULvn (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 21 May 2016 07:51:43 -0400
Received: by mail-lf0-f66.google.com with SMTP id p10so3959868lfb.2
        for <linux-samsung-soc@vger.kernel.org>; Sat, 21 May 2016 04:51:43 -0700 (PDT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: andrea.gelmini@gelma.net
Cc: trivial@kernel.org, kgene@kernel.org, k.kozlowski@samsung.com, linux@armlinux.org.uk, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

Signed-off-by: Andrea Gelmini <andrea.gelmini@gelma.net>
---
 arch/arm/mach-s3c24xx/mach-n30.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/mach-s3c24xx/mach-n30.c b/arch/arm/mach-s3c24xx/mach-n30.c
index 171c1f1..070a0d0 100644
--- a/arch/arm/mach-s3c24xx/mach-n30.c
+++ b/arch/arm/mach-s3c24xx/mach-n30.c
@@ -522,7 +522,7 @@ static void __init n30_hwinit(void)
 	 *
 	 * The pull ups for H6/H7 are enabled on N30 but not on the
 	 * N35/PiN.  I suppose is useful for a budget model of the N30
-	 * with no bluetooh.  It doesn't hurt to have the pull ups
+	 * with no bluetooth.  It doesn't hurt to have the pull ups
 	 * enabled on the N35, so leave them enabled for all models.
 	 */
 	__raw_writel(0x0028aaaa, S3C2410_GPHCON);
-- 
2.8.2.534.g1f66975
