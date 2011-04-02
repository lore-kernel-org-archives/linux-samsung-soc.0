From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [PATCH] ARM: Suspend: Fix build error on ARCH_S5PC100
Date: Sat,  2 Apr 2011 11:09:15 +0900
Message-ID: <1301710155-16373-1-git-send-email-kgene.kim@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from ganesha.gnumonks.org ([213.95.27.120]:57581 "EHLO
	ganesha.gnumonks.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751346Ab1DBCiW (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 1 Apr 2011 22:38:22 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: ben-linux@fluff.org, Kukjin Kim <kgene.kim@samsung.com>, Russell King <rmk+kernel@arm.linux.org.uk>

The current mainline codes of ARCH_S5PC100 can not support
suspend to ram. So needs this for preventing build error.

Cc: Russell King <rmk+kernel@arm.linux.org.uk>
Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
---
Oops, I missed this in my previous patch.

As I know, firstly ARCH_S5P64X0 will support suspend to ram
then ARCH_S5PC100 will do it. But right now, we need this.

 arch/arm/Kconfig |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
index 7c0effb..5c3e232 100644
--- a/arch/arm/Kconfig
+++ b/arch/arm/Kconfig
@@ -2010,7 +2010,7 @@ menu "Power management options"
 source "kernel/power/Kconfig"
 
 config ARCH_SUSPEND_POSSIBLE
-	depends on !ARCH_S5P64X0 && !ARCH_S5P6442
+	depends on !ARCH_S5P64X0 && !ARCH_S5P6442 && !ARCH_S5PC100
 	def_bool y
 
 endmenu
-- 
1.7.1
