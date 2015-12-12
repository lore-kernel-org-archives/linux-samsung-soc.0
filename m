From: Pankaj Dubey <pankaj.dubey@samsung.com>
Subject: [RESEND PATCH v5 7/8] MAINTAINERS: add maintainers entry for
 drivers/soc/samsung
Date: Sat, 12 Dec 2015 13:14:01 +0530
Message-ID: <1449906242-20843-8-git-send-email-pankaj.dubey@samsung.com>
References: <1449906242-20843-1-git-send-email-pankaj.dubey@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:49420 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751537AbbLLHry (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 12 Dec 2015 02:47:54 -0500
In-reply-to: <1449906242-20843-1-git-send-email-pankaj.dubey@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: kgene.kim@samsung.com, k.kozlowski@samsung.com, thomas.ab@samsung.com, p.fedin@samsung.com, andi.shyti@samsung.com, Pankaj Dubey <pankaj.dubey@samsung.com>, Kukjin Kim <kgene@kernel.org>

This patch adds maintainers entry for new driver folder
drivers/soc/samsung

Signed-off-by: Pankaj Dubey <pankaj.dubey@samsung.com>
Acked-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Signed-off-by: Kukjin Kim <kgene@kernel.org>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index e9caa4b..2c4b21f 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1465,6 +1465,7 @@ F:	arch/arm/mach-s5p*/
 F:	arch/arm/mach-exynos*/
 F:	drivers/*/*s3c2410*
 F:	drivers/*/*/*s3c2410*
+F:	drivers/soc/samsung/*
 F:	drivers/spi/spi-s3c*
 F:	sound/soc/samsung/*
 F:	Documentation/arm/Samsung/
-- 
1.9.1
