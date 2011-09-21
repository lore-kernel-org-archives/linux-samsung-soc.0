From: Hatim Ali <hatim.rv@samsung.com>
Subject: [RESEND PATCH 3/3] s5p-tv: Add PM_RUNTIME dependency
Date: Wed, 21 Sep 2011 11:14:20 +0530
Message-ID: <1316583860-32510-4-git-send-email-hatim.rv@samsung.com>
References: <1316583860-32510-1-git-send-email-hatim.rv@samsung.com>
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:18412 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751918Ab1IUFqQ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 21 Sep 2011 01:46:16 -0400
Received: from epcpsbgm1.samsung.com (mailout1.samsung.com [203.254.224.24])
 by mailout1.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LRU002G5YORU3M0@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 21 Sep 2011 14:46:15 +0900 (KST)
Received: from hatim-linux.sisodomain.com ([107.108.73.95])
 by mmp2.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0LRU0000KYO05M@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 21 Sep 2011 14:46:15 +0900 (KST)
In-reply-to: <1316583860-32510-1-git-send-email-hatim.rv@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com
Cc: t.stanislaws@samsung.com, mchehab@infradead.org, hverkuil@xs4all.nl, laurent.pinchart@ideasonboard.com, banajit.g@samsung.com, Hatim Ali <hatim.rv@samsung.com>

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
