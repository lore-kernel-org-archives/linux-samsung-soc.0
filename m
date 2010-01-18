From: Ben Dooks <ben-linux@fluff.org>
Subject: [PATCH] ARM: S3C64XX: SPI: Add SPI controller register base
Date: Mon, 18 Jan 2010 09:32:19 +0000
Message-ID: <1263807142-13186-2-git-send-email-ben-linux@fluff.org>
References: <1263807142-13186-1-git-send-email-ben-linux@fluff.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from trinity.fluff.org ([89.16.178.74]:55707 "EHLO trinity.fluff.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753607Ab0ARJcf (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 18 Jan 2010 04:32:35 -0500
In-Reply-To: <1263807142-13186-1-git-send-email-ben-linux@fluff.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Jassi Brar <jassi.brar@samsung.com>, Ben Dooks <ben-linux@fluff.org>

From: Jassi Brar <jassi.brar@samsung.com>

Added SPI controller register base.

Signed-off-by: Jassi Brar <jassi.brar@samsung.com>
Signed-off-by: Ben Dooks <ben-linux@fluff.org>
---
 arch/arm/mach-s3c6400/include/mach/map.h |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/arch/arm/mach-s3c6400/include/mach/map.h b/arch/arm/mach-s3c6400/include/mach/map.h
index 3e17adf..801c1c0 100644
--- a/arch/arm/mach-s3c6400/include/mach/map.h
+++ b/arch/arm/mach-s3c6400/include/mach/map.h
@@ -64,6 +64,8 @@
 #define S3C64XX_PA_IIS1		(0x7F003000)
 #define S3C64XX_PA_TIMER	(0x7F006000)
 #define S3C64XX_PA_IIC0		(0x7F004000)
+#define S3C64XX_PA_SPI0		(0x7F00B000)
+#define S3C64XX_PA_SPI1		(0x7F00C000)
 #define S3C64XX_PA_PCM0		(0x7F009000)
 #define S3C64XX_PA_PCM1		(0x7F00A000)
 #define S3C64XX_PA_IISV4	(0x7F00D000)
-- 
1.6.0.4
