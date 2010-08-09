From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [PATCH] ARM: S5P: Fix on missing S5P_DEV_FIMC in plat-s5p/Kconfig
Date: Mon,  9 Aug 2010 19:00:48 +0900
Message-ID: <1281348048-18321-1-git-send-email-kgene.kim@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from ganesha.gnumonks.org ([213.95.27.120]:46477 "EHLO
	ganesha.gnumonks.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755835Ab0HIKPU (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 9 Aug 2010 06:15:20 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: ben-linux@fluff.org, Kukjin Kim <kgene.kim@samsung.com>

This patch fixes on missing S5P_DEV_FIMC in plat-s5p/Kconfig.

Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
---
 arch/arm/plat-s5p/Kconfig |   15 +++++++++++++++
 1 files changed, 15 insertions(+), 0 deletions(-)

diff --git a/arch/arm/plat-s5p/Kconfig b/arch/arm/plat-s5p/Kconfig
index 907ac63..c6a855d 100644
--- a/arch/arm/plat-s5p/Kconfig
+++ b/arch/arm/plat-s5p/Kconfig
@@ -31,3 +31,18 @@ config S5P_EXT_INT
 	help
 	  Use the external interrupts (other than GPIO interrupts.)
 	  Note: Do not choose this for S5P6440.
+
+config S5P_DEV_FIMC0
+	bool
+	help
+	  Compile in platform device definitions for FIMC controller 0
+
+config S5P_DEV_FIMC1
+	bool
+	help
+	  Compile in platform device definitions for FIMC controller 1
+
+config S5P_DEV_FIMC2
+	bool
+	help
+	  Compile in platform device definitions for FIMC controller 2
-- 
1.6.2.5
