From: Andrea Gelmini <andrea.gelmini@gelma.net>
Subject: [PATCH 0127/1529] Fix typo
Date: Sat, 21 May 2016 13:52:52 +0200
Message-ID: <20160521115252.6023-1-andrea.gelmini@gelma.net>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-lb0-f196.google.com ([209.85.217.196]:35550 "EHLO
	mail-lb0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751758AbcEULw7 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 21 May 2016 07:52:59 -0400
Received: by mail-lb0-f196.google.com with SMTP id mx9so6869902lbb.2
        for <linux-samsung-soc@vger.kernel.org>; Sat, 21 May 2016 04:52:58 -0700 (PDT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: andrea.gelmini@gelma.net
Cc: trivial@kernel.org, kgene@kernel.org, k.kozlowski@samsung.com, linux@armlinux.org.uk, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

Signed-off-by: Andrea Gelmini <andrea.gelmini@gelma.net>
---
 arch/arm/plat-samsung/watchdog-reset.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/plat-samsung/watchdog-reset.c b/arch/arm/plat-samsung/watchdog-reset.c
index 2ecb50be..307d8ad 100644
--- a/arch/arm/plat-samsung/watchdog-reset.c
+++ b/arch/arm/plat-samsung/watchdog-reset.c
@@ -3,7 +3,7 @@
  * Copyright (c) 2008 Simtec Electronics
  *	Ben Dooks <ben@simtec.co.uk>
  *
- * Coyright (c) 2013 Tomasz Figa <tomasz.figa@gmail.com>
+ * Copyright (c) 2013 Tomasz Figa <tomasz.figa@gmail.com>
  *
  * Watchdog reset support for Samsung SoCs.
  *
-- 
2.8.2.534.g1f66975
