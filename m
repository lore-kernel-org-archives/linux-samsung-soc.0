From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: [PATCH v2] spi: Add spi-s3c64xx driver dependency on ARCH_EXYNOS4
Date: Wed, 25 Jan 2012 18:34:58 +0100
Message-ID: <1327512898-2404-1-git-send-email-s.nawrocki@samsung.com>
References: <1327508459-30814-1-git-send-email-s.nawrocki@samsung.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:20994 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756429Ab2AYRfT (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 25 Jan 2012 12:35:19 -0500
Received: from euspt2 (mailout1.w1.samsung.com [210.118.77.11])
 by mailout1.w1.samsung.com
 (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTP id <0LYD00A4H7ITGV@mailout1.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 25 Jan 2012 17:35:17 +0000 (GMT)
Received: from linux.samsung.com ([106.116.38.10])
 by spt2.w1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
 2004)) with ESMTPA id <0LYD00G1F7ISM3@spt2.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 25 Jan 2012 17:35:17 +0000 (GMT)
In-reply-to: <1327508459-30814-1-git-send-email-s.nawrocki@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: grant.likely@secretlab.ca
Cc: linux-samsung-soc@vger.kernel.org, spi-devel-general@lists.sourceforge.net, kgene.kim@samsung.com, Sylwester Nawrocki <s.nawrocki@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>

The spi-s3c64xx driver is also used on Exynos4 so update the dependency
to enable build on those platforms.

Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
---
Resending with Jaswinder Singh e-mail address, which is not valid any more,
removed. My apologies for the noise.
---
 drivers/spi/Kconfig |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/spi/Kconfig b/drivers/spi/Kconfig
index 3f9a47e..a9f8faf 100644
--- a/drivers/spi/Kconfig
+++ b/drivers/spi/Kconfig
@@ -299,7 +299,7 @@ config SPI_S3C24XX_FIQ
 
 config SPI_S3C64XX
 	tristate "Samsung S3C64XX series type SPI"
-	depends on (ARCH_S3C64XX || ARCH_S5P64X0)
+	depends on (ARCH_S3C64XX || ARCH_S5P64X0 || ARCH_EXYNOS4)
 	select S3C64XX_DMA if ARCH_S3C64XX
 	help
 	  SPI driver for Samsung S3C64XX and newer SoCs.
-- 
1.7.8.3
