From: Andrea Gelmini <andrea.gelmini@gelma.net>
Subject: [PATCH 0126/1529] Fix typo
Date: Sat, 21 May 2016 13:52:45 +0200
Message-ID: <20160521115245.5966-1-andrea.gelmini@gelma.net>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-lb0-f195.google.com ([209.85.217.195]:33788 "EHLO
	mail-lb0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751758AbcEULww (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 21 May 2016 07:52:52 -0400
Received: by mail-lb0-f195.google.com with SMTP id u2so687059lbo.0
        for <linux-samsung-soc@vger.kernel.org>; Sat, 21 May 2016 04:52:51 -0700 (PDT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: andrea.gelmini@gelma.net
Cc: trivial@kernel.org, kgene@kernel.org, k.kozlowski@samsung.com, linux@armlinux.org.uk, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

Signed-off-by: Andrea Gelmini <andrea.gelmini@gelma.net>
---
 arch/arm/plat-samsung/pm-check.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/plat-samsung/pm-check.c b/arch/arm/plat-samsung/pm-check.c
index 70f2f69..d635163 100644
--- a/arch/arm/plat-samsung/pm-check.c
+++ b/arch/arm/plat-samsung/pm-check.c
@@ -5,7 +5,7 @@
  *	http://armlinux.simtec.co.uk
  *	Ben Dooks <ben@simtec.co.uk>
  *
- * S3C Power Mangament - suspend/resume memory corruptiuon check.
+ * S3C Power Mangament - suspend/resume memory corruption check.
  *
  * This program is free software; you can redistribute it and/or modify
  * it under the terms of the GNU General Public License version 2 as
-- 
2.8.2.534.g1f66975
