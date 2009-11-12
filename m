From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH 12/18] drivers: fb: enable S3C FrameBuffer on S5PC1XX platform
Date: Thu, 12 Nov 2009 09:21:56 +0100
Message-ID: <1258014122-18185-13-git-send-email-m.szyprowski@samsung.com>
References: <1258014122-18185-1-git-send-email-m.szyprowski@samsung.com>
 <1258014122-18185-2-git-send-email-m.szyprowski@samsung.com>
 <1258014122-18185-3-git-send-email-m.szyprowski@samsung.com>
 <1258014122-18185-4-git-send-email-m.szyprowski@samsung.com>
 <1258014122-18185-5-git-send-email-m.szyprowski@samsung.com>
 <1258014122-18185-6-git-send-email-m.szyprowski@samsung.com>
 <1258014122-18185-7-git-send-email-m.szyprowski@samsung.com>
 <1258014122-18185-8-git-send-email-m.szyprowski@samsung.com>
 <1258014122-18185-9-git-send-email-m.szyprowski@samsung.com>
 <1258014122-18185-10-git-send-email-m.szyprowski@samsung.com>
 <1258014122-18185-11-git-send-email-m.szyprowski@samsung.com>
 <1258014122-18185-12-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:46063 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752524AbZKLIXA (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 12 Nov 2009 03:23:00 -0500
Received: from eu_spt2 (mailout1.w1.samsung.com [210.118.77.11])
 by mailout1.w1.samsung.com
 (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTP id <0KSZ001N4LYH8P@mailout1.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 12 Nov 2009 08:23:05 +0000 (GMT)
Received: from linux.samsung.com ([106.116.38.10])
 by spt2.w1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
 2004)) with ESMTPA id <0KSZ00L1ULYG4K@spt2.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 12 Nov 2009 08:23:05 +0000 (GMT)
In-reply-to: <1258014122-18185-12-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: m.szyprowski@samsung.com, kyungmin.park@samsung.com, ben-linux@fluff.org, bhmin@samsung.com, laforge@gnumonks.org

From: Kyungmin Park <kyungmin.park@samsung.com>

From: Kyungmin Park <kyungmin.park@samsung.com>

Samsung S5PC100 SoC has LCD display controller compatible to the one
known from S3C6410 SoCs. Enable support for s3c-fb driver also on S5PC1xx
platform.

Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 drivers/video/Kconfig |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/video/Kconfig b/drivers/video/Kconfig
index 9bbb285..bb2c7b6 100644
--- a/drivers/video/Kconfig
+++ b/drivers/video/Kconfig
@@ -1882,7 +1882,7 @@ config FB_TMIO_ACCELL
 
 config FB_S3C
 	tristate "Samsung S3C framebuffer support"
-	depends on FB && ARCH_S3C64XX
+	depends on FB && (ARCH_S3C64XX || ARCH_S5PC1XX)
 	select FB_CFB_FILLRECT
 	select FB_CFB_COPYAREA
 	select FB_CFB_IMAGEBLIT
-- 
1.6.5
