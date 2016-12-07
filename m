From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH] MAINTAINERS: Add Patchwork URL to Samsung Exynos entry
Date: Wed,  7 Dec 2016 19:18:35 +0200
Message-ID: <1481131115-11143-1-git-send-email-krzk@kernel.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.136]:36360 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752207AbcLGRSt (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 7 Dec 2016 12:18:49 -0500
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, Javier Martinez Canillas <javier@osg.samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org

I use Patchwork for handling incoming patches. Put its address here so
submitters could know what is in the queue.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 191887bdc49b..ec5137c39572 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1689,6 +1689,7 @@ M:	Krzysztof Kozlowski <krzk@kernel.org>
 R:	Javier Martinez Canillas <javier@osg.samsung.com>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 L:	linux-samsung-soc@vger.kernel.org (moderated for non-subscribers)
+Q:	https://patchwork.kernel.org/project/linux-samsung-soc/list/
 S:	Maintained
 F:	arch/arm/boot/dts/s3c*
 F:	arch/arm/boot/dts/s5p*
-- 
2.7.4
