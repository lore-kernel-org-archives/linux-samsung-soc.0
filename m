From: Hatim Ali <hatim.rv@samsung.com>
Subject: [PATCH] s5p-tv: Add PM_RUNTIME dependency
Date: Fri, 26 Aug 2011 12:10:34 +0530
Message-ID: <1314340834-13903-1-git-send-email-hatim.rv@samsung.com>
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:25395 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750703Ab1HZGlL (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 26 Aug 2011 02:41:11 -0400
Received: from epcpsbgm1.samsung.com (mailout3.samsung.com [203.254.224.33])
 by mailout3.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LQI00LQ0VWDE890@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 26 Aug 2011 15:41:10 +0900 (KST)
Received: from hatim-linux.sisodomain.com ([107.108.73.95])
 by mmp2.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0LQI00CPRVWCSU@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 26 Aug 2011 15:41:10 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: kgene.kim@samsung.com, m.szyprowski@samsung.com, t.stanislaws@samsung.com, banajit.g@samsung.com

The TVOUT driver requires PM_RUNTIME support for proper clock
enabling.

Signed-off-by: Hatim Ali <hatim.rv@samsung.com>
---
 drivers/media/video/s5p-tv/Kconfig |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/media/video/s5p-tv/Kconfig b/drivers/media/video/s5p-tv/Kconfig
index 9c37dee..f2a0977 100644
--- a/drivers/media/video/s5p-tv/Kconfig
+++ b/drivers/media/video/s5p-tv/Kconfig
@@ -8,7 +8,7 @@
 
 config VIDEO_SAMSUNG_S5P_TV
 	bool "Samsung TV driver for S5P platform (experimental)"
-	depends on PLAT_S5P
+	depends on PLAT_S5P && PM_RUNTIME
 	depends on EXPERIMENTAL
 	default n
 	---help---
-- 
1.7.2.3
