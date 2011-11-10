From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: [PATCH 2/2] MAINTAINERS: Extend Samsung patterns to cover SPI and ASoC drivers
Date: Thu, 10 Nov 2011 11:16:16 +0000
Message-ID: <1320923776-26626-2-git-send-email-broonie@opensource.wolfsonmicro.com>
References: <1320923776-26626-1-git-send-email-broonie@opensource.wolfsonmicro.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from opensource.wolfsonmicro.com ([80.75.67.52]:43733 "EHLO
	opensource.wolfsonmicro.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S932444Ab1KJLQY (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 10 Nov 2011 06:16:24 -0500
In-Reply-To: <1320923776-26626-1-git-send-email-broonie@opensource.wolfsonmicro.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>, Ben Dooks <ben-linux@fluff.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, patches@opensource.wolfsonmicro.com, Mark Brown <broonie@opensource.wolfsonmicro.com>

Help people find the overall architecture.

Signed-off-by: Mark Brown <broonie@opensource.wolfsonmicro.com>
---
 MAINTAINERS |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index a21d4fb..9eca526 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1054,6 +1054,8 @@ F:	arch/arm/plat-s3c24xx/
 F:	arch/arm/plat-s5p/
 F:	drivers/*/*s3c2410*
 F:	drivers/*/*/*s3c2410*
+F:	drivers/spi/spi-s3c*
+F:	sound/soc/samsung/*
 
 ARM/S3C2410 ARM ARCHITECTURE
 M:	Ben Dooks <ben-linux@fluff.org>
-- 
1.7.7.2
