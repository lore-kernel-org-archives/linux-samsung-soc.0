From: Pankaj Dubey <pankaj.dubey@samsung.com>
Subject: [RESPIN 3/6] MAINTAINERS: Add maintainers entry for
 drivers/memory/samsung
Date: Thu, 25 Feb 2016 14:03:39 +0530
Message-ID: <1456389222-12738-4-git-send-email-pankaj.dubey@samsung.com>
References: <1456389222-12738-1-git-send-email-pankaj.dubey@samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <1456389222-12738-1-git-send-email-pankaj.dubey@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: kgene.kim@samsung.com, k.kozlowski@samsung.com, thomas.ab@samsung.com, olof@lixom.net, p.fedin@samsung.com, Pankaj Dubey <pankaj.dubey@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

This patch adds maintainers entry for new driver folder
drivers/memory/samsung

Signed-off-by: Pankaj Dubey <pankaj.dubey@samsung.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index a6f927c..3a05c6b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1493,6 +1493,7 @@ F:	arch/arm/mach-s5p*/
 F:	arch/arm/mach-exynos*/
 F:	drivers/*/*s3c2410*
 F:	drivers/*/*/*s3c2410*
+F:	drivers/memory/samsung/*
 F:	drivers/soc/samsung/*
 F:	drivers/spi/spi-s3c*
 F:	sound/soc/samsung/*
-- 
2.4.5
