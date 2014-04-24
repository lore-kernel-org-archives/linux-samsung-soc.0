From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
Subject: [PATCH 1/4] ARM: compressed/head.S: remove s3c24xx special case
Date: Thu, 24 Apr 2014 12:24:03 +0200
Message-ID: <3212063.TCv3gzNlr5@phil>
References: <1544889.hRy2JpKRQe@phil>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from gloria.sntech.de ([95.129.55.99]:51021 "EHLO gloria.sntech.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754230AbaDXKV7 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 24 Apr 2014 06:21:59 -0400
In-Reply-To: <1544889.hRy2JpKRQe@phil>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: t.figa@samsung.com, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, arm@kernel.org, Russell King <linux@arm.linux.org.uk>

addruart from the generic debug macro is doing exactly the same using
the common lowlevel uart definition, so there is no cause for this
special casing for s3c24xx.

Signed-off-by: Heiko Stuebner <heiko@sntech.de>
---
 arch/arm/boot/compressed/head.S | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/arch/arm/boot/compressed/head.S b/arch/arm/boot/compressed/head.S
index 066b034..3a8b32d 100644
--- a/arch/arm/boot/compressed/head.S
+++ b/arch/arm/boot/compressed/head.S
@@ -60,11 +60,6 @@
 		add	\rb, \rb, #0x00010000	@ Ser1
 #endif
 		.endm
-#elif defined(CONFIG_ARCH_S3C24XX)
-		.macro loadsp, rb, tmp
-		mov	\rb, #0x50000000
-		add	\rb, \rb, #0x4000 * CONFIG_S3C_LOWLEVEL_UART_PORT
-		.endm
 #else
 		.macro	loadsp,	rb, tmp
 		addruart \rb, \tmp
-- 
1.9.0
