From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [PATCH 3/6] ARM: S5P: Add SROM bank 4 and 5 register offsets
Date: Thu,  2 Dec 2010 18:29:18 +0900
Message-ID: <1291282161-1992-4-git-send-email-kgene.kim@samsung.com>
References: <1291282161-1992-1-git-send-email-kgene.kim@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from ganesha.gnumonks.org ([213.95.27.120]:38935 "EHLO
	ganesha.gnumonks.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757358Ab0LBJnM (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 2 Dec 2010 04:43:12 -0500
In-Reply-To: <1291282161-1992-1-git-send-email-kgene.kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: ben-linux@fluff.org, Thomas Abraham <thomas.ab@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>

From: Thomas Abraham <thomas.ab@samsung.com>

Some of the S5P platforms like S5PC100 and S5PV210 include SROM banks
4 and 5 in addition to SROM banks 0 to 3. This patch adds register
offsets for SROM bank 4 and 5.

Signed-off-by: Thomas Abraham <thomas.ab@samsung.com>
Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
---
 arch/arm/plat-s5p/include/plat/regs-srom.h |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/arch/arm/plat-s5p/include/plat/regs-srom.h b/arch/arm/plat-s5p/include/plat/regs-srom.h
index 06189da..f121ab5 100644
--- a/arch/arm/plat-s5p/include/plat/regs-srom.h
+++ b/arch/arm/plat-s5p/include/plat/regs-srom.h
@@ -22,6 +22,8 @@
 #define S5P_SROM_BC1		S5P_SROMREG(0x8)
 #define S5P_SROM_BC2		S5P_SROMREG(0xc)
 #define S5P_SROM_BC3		S5P_SROMREG(0x10)
+#define S5P_SROM_BC4		S5P_SROMREG(0x14)
+#define S5P_SROM_BC5		S5P_SROMREG(0x18)
 
 /* one register BW holds 4 x 4-bit packed settings for NCS0 - NCS3 */
 
-- 
1.6.2.5
