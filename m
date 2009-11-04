From: jassisinghbrar@gmail.com
Subject: [PATCH 3/7] S3C64XX PCM: Define PCM Controller base registers
Date: Wed,  4 Nov 2009 17:29:05 +0900
Message-ID: <1257323349-18481-3-git-send-email-jassisinghbrar@gmail.com>
References: <1257323349-18481-1-git-send-email-jassisinghbrar@gmail.com>
 <1257323349-18481-2-git-send-email-jassisinghbrar@gmail.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from ganesha.gnumonks.org ([213.95.27.120]:37796 "EHLO
	ganesha.gnumonks.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753575AbZKDIdX (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 4 Nov 2009 03:33:23 -0500
In-Reply-To: <1257323349-18481-2-git-send-email-jassisinghbrar@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: Jassi Brar <jassi.brar@samsung.com>

From: Jassi Brar <jassi.brar@samsung.com>

Signed-off-by: Jassi Brar <jassi.brar@samsung.com>
---
 arch/arm/mach-s3c6400/include/mach/map.h |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/arch/arm/mach-s3c6400/include/mach/map.h b/arch/arm/mach-s3c6400/include/mach/map.h
index fc8b223..866be31 100644
--- a/arch/arm/mach-s3c6400/include/mach/map.h
+++ b/arch/arm/mach-s3c6400/include/mach/map.h
@@ -48,6 +48,8 @@
 #define S3C64XX_PA_IIS1		(0x7F003000)
 #define S3C64XX_PA_TIMER	(0x7F006000)
 #define S3C64XX_PA_IIC0		(0x7F004000)
+#define S3C64XX_PA_PCM0		(0x7F009000)
+#define S3C64XX_PA_PCM1		(0x7F00A000)
 #define S3C64XX_PA_IISV4	(0x7F00D000)
 #define S3C64XX_PA_IIC1		(0x7F00F000)
 
-- 
1.6.2.5
