From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [PATCH] ARM: S5PV310: Fix on default ZRELADDR of ARCH_S5PV310
Date: Wed, 18 Aug 2010 22:58:37 +0900
Message-ID: <1282139917-10186-1-git-send-email-kgene.kim@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from ganesha.gnumonks.org ([213.95.27.120]:40767 "EHLO
	ganesha.gnumonks.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753196Ab0HROMY (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 18 Aug 2010 10:12:24 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: ben-linux@fluff.org, Kukjin Kim <kgene.kim@samsung.com>

This patch adds default zreladdr of ARCH_S5PV310.

Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
---
 arch/arm/Kconfig |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
index 9295110..a7ed21f 100644
--- a/arch/arm/Kconfig
+++ b/arch/arm/Kconfig
@@ -1622,7 +1622,8 @@ config ZRELADDR
 	default 0x40008000 if ARCH_STMP378X ||\
 		ARCH_STMP37XX ||\
 		ARCH_SH7372 ||\
-		ARCH_SH7377
+		ARCH_SH7377 ||\
+		ARCH_S5PV310
 	default 0x50008000 if ARCH_S3C64XX ||\
 		ARCH_SH7367
 	default 0x60008000 if ARCH_VEXPRESS
-- 
1.6.2.5
