From: Heiko =?utf-8?q?St=C3=BCbner?= <heiko@sntech.de>
Subject: [PATCH 2/3] pinctrl: s3c24xx: use correct header for chained_irq functions
Date: Fri, 14 Jun 2013 00:45:50 +0200
Message-ID: <201306140045.51206.heiko@sntech.de>
References: <201306140044.15568.heiko@sntech.de>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from gloria.sntech.de ([95.129.55.99]:54468 "EHLO gloria.sntech.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1757435Ab3FMWp5 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 13 Jun 2013 18:45:57 -0400
In-Reply-To: <201306140044.15568.heiko@sntech.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Grant Likely <grant.likely@linaro.org>, linus.walleij@linaro.org

chained_irq_enter and chained_irq_exit moved to a real header under
linux/pinctrl instead of asm/.

Update the pinctrl driver to use the correct header and fix the build
error.

Signed-off-by: Heiko Stuebner <heiko@sntech.de>
---
 drivers/pinctrl/pinctrl-s3c24xx.c |    3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-s3c24xx.c b/drivers/pinctrl/pinctrl-s3c24xx.c
index c8b0399..24446da 100644
--- a/drivers/pinctrl/pinctrl-s3c24xx.c
+++ b/drivers/pinctrl/pinctrl-s3c24xx.c
@@ -19,12 +19,11 @@
 #include <linux/irqdomain.h>
 #include <linux/irq.h>
 #include <linux/of_irq.h>
+#include <linux/irqchip/chained_irq.h>
 #include <linux/io.h>
 #include <linux/slab.h>
 #include <linux/err.h>
 
-#include <asm/mach/irq.h>
-
 #include "pinctrl-samsung.h"
 
 #define NUM_EINT	24
-- 
1.7.10.4
