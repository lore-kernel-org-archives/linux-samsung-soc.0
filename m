From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [PATCH 2/6] ARM: S5P: Add SROM control register shift macros for other banks.
Date: Thu,  2 Dec 2010 18:29:17 +0900
Message-ID: <1291282161-1992-3-git-send-email-kgene.kim@samsung.com>
References: <1291282161-1992-1-git-send-email-kgene.kim@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from ganesha.gnumonks.org ([213.95.27.120]:38940 "EHLO
	ganesha.gnumonks.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757361Ab0LBJnM (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 2 Dec 2010 04:43:12 -0500
In-Reply-To: <1291282161-1992-1-git-send-email-kgene.kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: ben-linux@fluff.org, Thomas Abraham <thomas.ab@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>

From: Thomas Abraham <thomas.ab@samsung.com>

This patch adds shift macros for the SROM Bus width and control
register to represent the shift count for the 5th and 6th SROM
banks.  Some of the S5P SOCs have them.

Signed-off-by: Thomas Abraham <thomas.ab@samsung.com>
Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
---
 arch/arm/plat-s5p/include/plat/regs-srom.h |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/arch/arm/plat-s5p/include/plat/regs-srom.h b/arch/arm/plat-s5p/include/plat/regs-srom.h
index 0fdac48..06189da 100644
--- a/arch/arm/plat-s5p/include/plat/regs-srom.h
+++ b/arch/arm/plat-s5p/include/plat/regs-srom.h
@@ -36,6 +36,8 @@
 #define S5P_SROM_BW__NCS1__SHIFT		4
 #define S5P_SROM_BW__NCS2__SHIFT		8
 #define S5P_SROM_BW__NCS3__SHIFT		12
+#define S5P_SROM_BW__NCS4__SHIFT		16
+#define S5P_SROM_BW__NCS5__SHIFT		20
 
 /* applies to same to BCS0 - BCS3 */
 
-- 
1.6.2.5
