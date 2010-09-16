From: Maurus Cuelenaere <mcuelenaere@gmail.com>
Subject: [PATCH] ARM: SAMSUNG: make SAMSUNG_PM_DEBUG select DEBUG_LL
Date: Thu, 16 Sep 2010 14:16:38 +0200
Message-ID: <4c920aa8.d37b0e0a.4ee4.ffffc4bc@mx.google.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ew0-f46.google.com ([209.85.215.46]:48473 "EHLO
	mail-ew0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753856Ab0IPMQm (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 16 Sep 2010 08:16:42 -0400
Received: by ewy23 with SMTP id 23so506285ewy.19
        for <linux-samsung-soc@vger.kernel.org>; Thu, 16 Sep 2010 05:16:41 -0700 (PDT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: ben-linux@fluff.org, kgene.kim@samsung.com

When selecting SAMSUNG_PM_DEBUG, it complains about a missing printascii()
function if you do not select DEBUG_LL, so make the former select the latter.

Signed-off-by: Maurus Cuelenaere <mcuelenaere@gmail.com>
---
 arch/arm/plat-samsung/Kconfig |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/arch/arm/plat-samsung/Kconfig b/arch/arm/plat-samsung/Kconfig
index 7c0bde7..d5816e7 100644
--- a/arch/arm/plat-samsung/Kconfig
+++ b/arch/arm/plat-samsung/Kconfig
@@ -260,6 +260,7 @@ comment "Power management"
 config SAMSUNG_PM_DEBUG
 	bool "S3C2410 PM Suspend debug"
 	depends on PM
+	select DEBUG_LL
 	help
 	  Say Y here if you want verbose debugging from the PM Suspend and
 	  Resume code. See <file:Documentation/arm/Samsung-S3C24XX/Suspend.txt>
-- 
1.7.0.4
