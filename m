From: Ben Dooks <ben-linux@fluff.org>
Subject: [PATCH 08/23] ARM: n30: Update mach-n30 to use gpiolib API
Date: Fri,  7 May 2010 08:15:30 +0900
Message-ID: <1273187745-6566-9-git-send-email-ben-linux@fluff.org>
References: <1273187745-6566-1-git-send-email-ben-linux@fluff.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from [121.136.51.148] ([121.136.51.148]:60621 "EHLO ben-laptop"
	rhost-flags-FAIL-FAIL-OK-FAIL) by vger.kernel.org with ESMTP
	id S1753031Ab0EFXQE (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 6 May 2010 19:16:04 -0400
In-Reply-To: <1273187745-6566-1-git-send-email-ben-linux@fluff.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: Ben Dooks <ben-linux@fluff.org>

Change mach-n30.c to use gpiolib for the GPIO lines that are directly
manipulated by it.

Signed-off-by: Ben Dooks <ben-linux@fluff.org>
---
 arch/arm/mach-s3c2410/mach-n30.c |    7 +++++--
 1 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/arch/arm/mach-s3c2410/mach-n30.c b/arch/arm/mach-s3c2410/mach-n30.c
index 684710f..75a9fd3 100644
--- a/arch/arm/mach-s3c2410/mach-n30.c
+++ b/arch/arm/mach-s3c2410/mach-n30.c
@@ -86,10 +86,10 @@ static void n30_udc_pullup(enum s3c2410_udc_cmd_e cmd)
 {
 	switch (cmd) {
 	case S3C2410_UDC_P_ENABLE :
-		s3c2410_gpio_setpin(S3C2410_GPB(3), 1);
+		gpio_set_value(S3C2410_GPB(3), 1);
 		break;
 	case S3C2410_UDC_P_DISABLE :
-		s3c2410_gpio_setpin(S3C2410_GPB(3), 0);
+		gpio_set_value(S3C2410_GPB(3), 0);
 		break;
 	case S3C2410_UDC_P_RESET :
 		break;
@@ -536,6 +536,9 @@ static void __init n30_init(void)
 
 		platform_add_devices(n35_devices, ARRAY_SIZE(n35_devices));
 	}
+
+	WARN_ON(gpio_request(S3C2410_GPB(3), "udc pup"));
+	gpio_direction_output(S3C2410_GPB(3), 0);
 }
 
 MACHINE_START(N30, "Acer-N30")
-- 
1.7.0.4
