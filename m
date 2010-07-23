From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: [PATCH v3 8/8] ARM: s5pv210: Override FIMC driver name on Aquila board
Date: Fri, 23 Jul 2010 18:21:23 +0200
Message-ID: <1279902083-21250-9-git-send-email-s.nawrocki@samsung.com>
References: <1279902083-21250-1-git-send-email-s.nawrocki@samsung.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:31055 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1759936Ab0GWQVz (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 23 Jul 2010 12:21:55 -0400
Received: from eu_spt1 (mailout2.w1.samsung.com [210.118.77.12])
 by mailout2.w1.samsung.com
 (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTP id <0L6000LIVQRZEZ@mailout2.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 23 Jul 2010 17:21:37 +0100 (BST)
Received: from linux.samsung.com ([106.116.38.10])
 by spt1.w1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
 2004)) with ESMTPA id <0L60002KKQRZKK@spt1.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 23 Jul 2010 17:21:36 +0100 (BST)
In-reply-to: <1279902083-21250-1-git-send-email-s.nawrocki@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: p.osciak@samsung.com, m.szyprowski@samsung.com, kyungmin.park@samsung.com, kgene.kim@samsung.com, Sylwester Nawrocki <s.nawrocki@samsung.com>

Change variant of the FIMC driver for compatibility with older
SoC version (EVT0) used on Aquila board.

Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 arch/arm/mach-s5pv210/mach-aquila.c |    5 +++++
 1 files changed, 5 insertions(+), 0 deletions(-)

diff --git a/arch/arm/mach-s5pv210/mach-aquila.c b/arch/arm/mach-s5pv210/mach-aquila.c
index 7528514..c6cc3f5 100644
--- a/arch/arm/mach-s5pv210/mach-aquila.c
+++ b/arch/arm/mach-s5pv210/mach-aquila.c
@@ -36,6 +36,7 @@
 #include <plat/cpu.h>
 #include <plat/fb.h>
 #include <plat/fimc.h>
+#include <plat/fimc-core.h>
 
 #include "common-aquila-goni.h"
 
@@ -467,6 +468,10 @@ static void __init aquila_machine_init(void)
 	i2c_register_board_info(AP_I2C_GPIO_PMIC_BUS_4, i2c_gpio_pmic_devs,
 			ARRAY_SIZE(i2c_gpio_pmic_devs));
 
+	s3c_fimc_setname(0, "s5p-fimc");
+	s3c_fimc_setname(1, "s5p-fimc");
+	s3c_fimc_setname(2, "s5p-fimc");
+
 	/* FB */
 	s3c_fb_set_platdata(&aquila_lcd_pdata);
 
-- 
1.7.2
