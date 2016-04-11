From: Pankaj Dubey <pankaj.dubey@samsung.com>
Subject: [RESPIN v2 3/6] MAINTAINERS: Add maintainers entry for
 drivers/memory/samsung
Date: Mon, 11 Apr 2016 13:12:25 +0530
Message-ID: <1460360548-32127-4-git-send-email-pankaj.dubey@samsung.com>
References: <1460360548-32127-1-git-send-email-pankaj.dubey@samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <1460360548-32127-1-git-send-email-pankaj.dubey@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: kgene.kim@samsung.com, k.kozlowski@samsung.com, p.fedin@samsung.com, olof@lixom.net, thomas.ab@samsung.com, Pankaj Dubey <pankaj.dubey@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

Add maintainers entry for new driver folder drivers/memory/samsung.

Signed-off-by: Pankaj Dubey <pankaj.dubey@samsung.com>
Signed-off-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 03e00c7..0d2a264 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1540,6 +1540,7 @@ F:	arch/arm/mach-s5p*/
 F:	arch/arm/mach-exynos*/
 F:	drivers/*/*s3c2410*
 F:	drivers/*/*/*s3c2410*
+F:	drivers/memory/samsung/*
 F:	drivers/soc/samsung/*
 F:	drivers/spi/spi-s3c*
 F:	sound/soc/samsung/*
-- 
2.4.5
