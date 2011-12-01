From: MyungJoo Ham <myungjoo.ham@samsung.com>
Subject: [PATCH 3/4] ARM Exynos4210-Nuri: remove compiler errors
Date: Thu, 01 Dec 2011 18:05:16 +0900
Message-ID: <1322730317-8171-4-git-send-email-myungjoo.ham@samsung.com>
References: <1322730317-8171-1-git-send-email-myungjoo.ham@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:46540 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751796Ab1LAJFY (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 1 Dec 2011 04:05:24 -0500
In-reply-to: <1322730317-8171-1-git-send-email-myungjoo.ham@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: "Rafael J. Wysocki" <rjw@sisk.pl>, Kevin Hilman <khilman@ti.com>, Kukjin Kim <kgene.kim@samsung.com>, Russell King <linux@arm.linux.org.uk>, Kyungmin Park <kyungmin.park@samsung.com>, myungjoo.ham@gmail.com

Signed-off-by: MyungJoo Ham <myungjoo.ham@samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 arch/arm/mach-exynos/mach-nuri.c |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/arch/arm/mach-exynos/mach-nuri.c b/arch/arm/mach-exynos/mach-nuri.c
index 236bbe1..4cef1fb 100644
--- a/arch/arm/mach-exynos/mach-nuri.c
+++ b/arch/arm/mach-exynos/mach-nuri.c
@@ -11,6 +11,8 @@
 #include <linux/platform_device.h>
 #include <linux/serial_core.h>
 #include <linux/input.h>
+#include <linux/irq.h>
+#include <linux/export.h>
 #include <linux/i2c.h>
 #include <linux/i2c/atmel_mxt_ts.h>
 #include <linux/i2c-gpio.h>
-- 
1.7.4.1
