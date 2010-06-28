From: Pawel Osciak <p.osciak@samsung.com>
Subject: [PATCH v3 02/12] s3c-fb: Correct FRAMESEL1 bitfield defines for
 VIDINTCON0 register
Date: Mon, 28 Jun 2010 10:08:48 +0200
Message-ID: <1277712538-23188-3-git-send-email-p.osciak@samsung.com>
References: <1277712538-23188-1-git-send-email-p.osciak@samsung.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:15756 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754602Ab0F1IJI (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 28 Jun 2010 04:09:08 -0400
In-reply-to: <1277712538-23188-1-git-send-email-p.osciak@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-fbdev@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: p.osciak@samsung.com, kyungmin.park@samsung.com, ben-linux@fluff.org, m.szyprowski@samsung.com

FRAMESEL1 bitfield starts on 13th bit, not on 14th.

Signed-off-by: Pawel Osciak <p.osciak@samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 arch/arm/plat-samsung/include/plat/regs-fb.h |   10 +++++-----
 1 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/arm/plat-samsung/include/plat/regs-fb.h b/arch/arm/plat-samsung/include/plat/regs-fb.h
index f4259e5..ac10013 100644
--- a/arch/arm/plat-samsung/include/plat/regs-fb.h
+++ b/arch/arm/plat-samsung/include/plat/regs-fb.h
@@ -292,11 +292,11 @@
 #define VIDINTCON0_FRAMESEL0_ACTIVE		(0x2 << 15)
 #define VIDINTCON0_FRAMESEL0_FRONTPORCH		(0x3 << 15)
 
-#define VIDINTCON0_FRAMESEL1			(1 << 14)
-#define VIDINTCON0_FRAMESEL1_NONE		(0x0 << 14)
-#define VIDINTCON0_FRAMESEL1_BACKPORCH		(0x1 << 14)
-#define VIDINTCON0_FRAMESEL1_VSYNC		(0x2 << 14)
-#define VIDINTCON0_FRAMESEL1_FRONTPORCH		(0x3 << 14)
+#define VIDINTCON0_FRAMESEL1			(1 << 13)
+#define VIDINTCON0_FRAMESEL1_NONE		(0x0 << 13)
+#define VIDINTCON0_FRAMESEL1_BACKPORCH		(0x1 << 13)
+#define VIDINTCON0_FRAMESEL1_VSYNC		(0x2 << 13)
+#define VIDINTCON0_FRAMESEL1_FRONTPORCH		(0x3 << 13)
 
 #define VIDINTCON0_INT_FRAME			(1 << 12)
 #define VIDINTCON0_FIFIOSEL_MASK		(0x7f << 5)
-- 
1.7.1.569.g6f426
