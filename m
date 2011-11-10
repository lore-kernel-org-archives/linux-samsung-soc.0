From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: [PATCH 1/2] MAINTAINERS: Add linux-samsung-soc mailing list for Samsung
Date: Thu, 10 Nov 2011 11:16:15 +0000
Message-ID: <1320923776-26626-1-git-send-email-broonie@opensource.wolfsonmicro.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from opensource.wolfsonmicro.com ([80.75.67.52]:43732 "EHLO
	opensource.wolfsonmicro.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S932495Ab1KJLQY (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 10 Nov 2011 06:16:24 -0500
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>, Ben Dooks <ben-linux@fluff.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, patches@opensource.wolfsonmicro.com, Mark Brown <broonie@opensource.wolfsonmicro.com>

There's a Samsung-specific mailing list but it's not advertised in
MAINTAINERS - add it to the overall architecture to make it more
discoverable.

Signed-off-by: Mark Brown <broonie@opensource.wolfsonmicro.com>
---
 MAINTAINERS |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index c18b278..a21d4fb 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1046,6 +1046,7 @@ ARM/SAMSUNG ARM ARCHITECTURES
 M:	Ben Dooks <ben-linux@fluff.org>
 M:	Kukjin Kim <kgene.kim@samsung.com>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
+L:	linux-samsung-soc@vger.kernel.org
 W:	http://www.fluff.org/ben/linux/
 S:	Maintained
 F:	arch/arm/plat-samsung/
-- 
1.7.7.2
