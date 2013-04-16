From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: [PATCH 1/2] pinctrl: s3c64xx: Fix build error caused by undefined chained_irq_enter
Date: Wed, 17 Apr 2013 00:23:59 +0200
Message-ID: <30362001.FF4K7WsZvh@flatron>
References: <1366060483-20342-1-git-send-email-tomasz.figa@gmail.com> <20130416163331.GP26958@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ee0-f49.google.com ([74.125.83.49]:34278 "EHLO
	mail-ee0-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S965353Ab3DPWX7 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 16 Apr 2013 18:23:59 -0400
Received: by mail-ee0-f49.google.com with SMTP id l10so454147eei.36
        for <linux-samsung-soc@vger.kernel.org>; Tue, 16 Apr 2013 15:23:58 -0700 (PDT)
In-Reply-To: <20130416163331.GP26958@opensource.wolfsonmicro.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree-discuss@lists.ozlabs.org, kgene.kim@samsung.com, kwangwoo.lee@gmail.com, jacmet@sunsite.dk, augulis.darius@gmail.com, mcuelenaere@gmail.com, linux@arm.linux.org.uk, Rob Herring <robherring2@gmail.com>, Mark Rutland <mark.rutland@arm.com>, linus.walleij@linaro.org, thomas.abraham@linaro.org

Commit de88cbb7 moved definitions of chained_irq_enter and
chained_irq_exit to a generic header, which must be now included instead
of the legacy arch-specific one.

This patch fixes build error caused by including the legacy header
leading to undefined chained_irq_enter and chained_irq_exit symbols.

Signed-off-by: Tomasz Figa <tomasz.figa@gmail.com>
---
 drivers/pinctrl/pinctrl-s3c64xx.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-s3c64xx.c b/drivers/pinctrl/pinctrl-s3c64xx.c
index b5d1c4a..89143c9 100644
--- a/drivers/pinctrl/pinctrl-s3c64xx.c
+++ b/drivers/pinctrl/pinctrl-s3c64xx.c
@@ -22,11 +22,10 @@
 #include <linux/irq.h>
 #include <linux/of_irq.h>
 #include <linux/io.h>
+#include <linux/irqchip/chained_irq.h>
 #include <linux/slab.h>
 #include <linux/err.h>
 
-#include <asm/mach/irq.h>
-
 #include "pinctrl-samsung.h"
 
 #define NUM_EINT0		28
-- 
1.8.1.5
