From: Mike Solovyev <ms@sk.2-ch.org>
Subject: [PATCH] h1940: framebuffer configuration fix
Date: Wed, 12 May 2010 15:38:00 +0400
Message-ID: <20100512153800.cdffab04.ms@sk.2-ch.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ew0-f216.google.com ([209.85.219.216]:44097 "EHLO
	mail-ew0-f216.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754650Ab0ELL1M (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 12 May 2010 07:27:12 -0400
Received: by ewy8 with SMTP id 8so1757579ewy.28
        for <linux-samsung-soc@vger.kernel.org>; Wed, 12 May 2010 04:27:10 -0700 (PDT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: Ben Dooks <ben-linux@fluff.org>, Arnaud Patard <arnaud.patard@rtp-net.org>

Seems like a typo, wrong setup leads to broken image on ipaq screen.

Signed-off-by: Mike Solovyev <ms@sk.2-ch.org>
Signed-off-by: Arnaud Patard <arnaud.patard@rtp-net.org>
---
 arch/arm/mach-s3c2410/mach-h1940.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

Index: linux-2.6/arch/arm/mach-s3c2410/mach-h1940.c
===================================================================
--- linux-2.6.orig/arch/arm/mach-s3c2410/mach-h1940.c
+++ linux-2.6/arch/arm/mach-s3c2410/mach-h1940.c
@@ -162,8 +162,8 @@ static struct s3c2410fb_display h1940_lc
 	.xres =		240,
 	.yres =		320,
 	.bpp =		16,
-	.left_margin =	20,
-	.right_margin =	8,
+	.left_margin =	8,
+	.right_margin =	20,
 	.hsync_len =	4,
 	.upper_margin =	8,
 	.lower_margin = 7,
