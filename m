From: Maurus Cuelenaere <mcuelenaere@gmail.com>
Subject: [PATCH 1/2] ARM: S3C64XX: Add suspend support
Date: Wed,  6 Oct 2010 01:09:58 +0200
Message-ID: <1fa4a7a39d9fd48b8329e1a1077a65adb96475b5.1286319272.git.mcuelenaere@gmail.com>
References: <cover.1286319272.git.mcuelenaere@gmail.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ew0-f46.google.com ([209.85.215.46]:63194 "EHLO
	mail-ew0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756417Ab0JEXKH (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 5 Oct 2010 19:10:07 -0400
Received: by ewy23 with SMTP id 23so2668925ewy.19
        for <linux-samsung-soc@vger.kernel.org>; Tue, 05 Oct 2010 16:10:06 -0700 (PDT)
In-Reply-To: <cover.1286319272.git.mcuelenaere@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: ben-linux@fluff.org

The only missing thing for SoC-wide suspend support, is a call to s3c_pm_init,
so add that. This was tested on a S3C6410 SmartQ 7.

Signed-off-by: Maurus Cuelenaere <mcuelenaere@gmail.com>
---
 arch/arm/mach-s3c64xx/pm.c |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/arch/arm/mach-s3c64xx/pm.c b/arch/arm/mach-s3c64xx/pm.c
index 79412f7..db292c9 100644
--- a/arch/arm/mach-s3c64xx/pm.c
+++ b/arch/arm/mach-s3c64xx/pm.c
@@ -187,6 +187,9 @@ static int s3c64xx_pm_init(void)
 	pm_cpu_prep = s3c64xx_pm_prepare;
 	pm_cpu_sleep = s3c64xx_cpu_suspend;
 	pm_uart_udivslot = 1;
+
+	s3c_pm_init();
+
 	return 0;
 }
 
-- 
1.7.2.3
