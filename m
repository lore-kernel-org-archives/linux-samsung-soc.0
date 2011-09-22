From: Hatim Ali <hatim.rv@samsung.com>
Subject: [RESEND PATCH 2/2] s5p-tv: Add PM_RUNTIME dependency
Date: Thu, 22 Sep 2011 11:24:51 +0530
Message-ID: <1316670891-1672-1-git-send-email-hatim.rv@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:25737 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750964Ab1IVFzr (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 22 Sep 2011 01:55:47 -0400
Received: from epcpsbgm2.samsung.com (mailout3.samsung.com [203.254.224.33])
 by mailout3.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LRW00931TSHGXO0@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 22 Sep 2011 14:55:40 +0900 (KST)
Received: from hatim-linux.sisodomain.com ([107.108.73.95])
 by mmp1.samsung.com (Oracle Communications Messaging Exchange Server 7u4-19.01
 64bit (built Sep  7 2010)) with ESMTPA id <0LRW00F0HTSLLLB0@mmp1.samsung.com>
 for linux-samsung-soc@vger.kernel.org; Thu, 22 Sep 2011 14:55:40 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com
Cc: s.nawrocki@samsung.com, t.stanislaws@samsung.com, mchehab@infradead.org, hverkuil@xs4all.nl, laurent.pinchart@ideasonboard.com, banajit.g@samsung.com

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
