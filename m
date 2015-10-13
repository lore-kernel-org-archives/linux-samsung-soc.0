From: Pankaj Dubey <pankaj.dubey@samsung.com>
Subject: [PATCH v3 7/8] MAINTAINERS: add maintainers entry for
 drivers/soc/samsung
Date: Tue, 13 Oct 2015 18:43:49 +0530
Message-ID: <1444742030-31892-8-git-send-email-pankaj.dubey@samsung.com>
References: <1444742030-31892-1-git-send-email-pankaj.dubey@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:60447 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752242AbbJMNWU (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 13 Oct 2015 09:22:20 -0400
In-reply-to: <1444742030-31892-1-git-send-email-pankaj.dubey@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: kgene.kim@samsung.com, k.kozlowski@samsung.com, p.fedin@samsung.com, thomas.ab@samsung.com, Pankaj Dubey <pankaj.dubey@samsung.com>

This patch adds maintainers entry for new driver folder
drivers/soc/samsung

Signed-off-by: Pankaj Dubey <pankaj.dubey@samsung.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 7ba7ab7..262bba6 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1438,6 +1438,7 @@ F:	arch/arm/mach-exynos*/
 F:	drivers/*/*s3c2410*
 F:	drivers/*/*/*s3c2410*
 F:	drivers/spi/spi-s3c*
+F:	drivers/soc/samsung/*
 F:	sound/soc/samsung/*
 N:	exynos
 
-- 
2.4.5
