From: Andrea Gelmini <andrea.gelmini@gelma.net>
Subject: [PATCH 0124/1529] Fix typo
Date: Sat, 21 May 2016 13:52:29 +0200
Message-ID: <20160521115229.5862-1-andrea.gelmini@gelma.net>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-lf0-f67.google.com ([209.85.215.67]:34012 "EHLO
	mail-lf0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751758AbcEULwh (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 21 May 2016 07:52:37 -0400
Received: by mail-lf0-f67.google.com with SMTP id 65so16942lfq.1
        for <linux-samsung-soc@vger.kernel.org>; Sat, 21 May 2016 04:52:36 -0700 (PDT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: andrea.gelmini@gelma.net
Cc: trivial@kernel.org, kgene@kernel.org, k.kozlowski@samsung.com, linux@armlinux.org.uk, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

Signed-off-by: Andrea Gelmini <andrea.gelmini@gelma.net>
---
 arch/arm/plat-samsung/include/plat/fb-s3c2410.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/plat-samsung/include/plat/fb-s3c2410.h b/arch/arm/plat-samsung/include/plat/fb-s3c2410.h
index 4e5d958..1f2972a 100644
--- a/arch/arm/plat-samsung/include/plat/fb-s3c2410.h
+++ b/arch/arm/plat-samsung/include/plat/fb-s3c2410.h
@@ -48,7 +48,7 @@ struct s3c2410fb_display {
 
 struct s3c2410fb_mach_info {
 
-	struct s3c2410fb_display *displays;	/* attached diplays info */
+	struct s3c2410fb_display *displays;	/* attached displays info */
 	unsigned num_displays;			/* number of defined displays */
 	unsigned default_display;
 
-- 
2.8.2.534.g1f66975
