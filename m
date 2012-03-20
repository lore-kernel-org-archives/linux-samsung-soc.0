From: Heiko =?iso-8859-1?q?St=FCbner?= <heiko@sntech.de>
Subject: [PATCH][RESEND] ARM: SAMSUNG: make SAMSUNG_PM_DEBUG select DEBUG_LL
Date: Tue, 20 Mar 2012 21:20:45 +0100
Message-ID: <201203202120.45806.heiko@sntech.de>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from s15407518.onlinehome-server.info ([82.165.136.167]:40445 "EHLO
	s15407518.onlinehome-server.info" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1753952Ab2CTUVD (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 20 Mar 2012 16:21:03 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: kgene.kim@samsung.com, ben-linux@fluff.org
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Maurus Cuelenaere <mcuelenaere@gmail.com>

From: Maurus Cuelenaere <mcuelenaere@gmail.com>

When selecting SAMSUNG_PM_DEBUG, it complains about a missing printascii()
function if you do not select DEBUG_LL, so make the former select the latter.

Signed-off-by: Maurus Cuelenaere <mcuelenaere@gmail.com>
Acked-by: Heiko Stuebner <heiko@sntech.de>
---
This was originally sent in september 2010, but seems to have been forgotten.
As this problem has bitten me today, here it is again.

 arch/arm/plat-samsung/Kconfig |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/arch/arm/plat-samsung/Kconfig b/arch/arm/plat-samsung/Kconfig
index 6a2abe6..ec84c1a 100644
--- a/arch/arm/plat-samsung/Kconfig
+++ b/arch/arm/plat-samsung/Kconfig
@@ -302,6 +302,7 @@ comment "Power management"
 config SAMSUNG_PM_DEBUG
 	bool "S3C2410 PM Suspend debug"
 	depends on PM
+	select DEBUG_LL
 	help
 	  Say Y here if you want verbose debugging from the PM Suspend and
 	  Resume code. See <file:Documentation/arm/Samsung-S3C24XX/Suspend.txt>
-- 
1.7.2.3
