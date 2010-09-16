From: Maurus Cuelenaere <mcuelenaere@gmail.com>
Subject: [PATCH 2/4] ARM: SAMSUNG: Fix warning 's3c_pm_show_resume_irqs' defined but not used
Date: Fri, 17 Sep 2010 00:18:07 +0200
Message-ID: <f4d162aad052ed332cceb63be6f2d32dc3dfbdd7.1287681256.git.mcuelenaere@gmail.com>
References: <cover.1287681256.git.mcuelenaere@gmail.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ey0-f174.google.com ([209.85.215.174]:34789 "EHLO
	mail-ey0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753977Ab0JURQA (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 21 Oct 2010 13:16:00 -0400
Received: by eye27 with SMTP id 27so377472eye.19
        for <linux-samsung-soc@vger.kernel.org>; Thu, 21 Oct 2010 10:15:59 -0700 (PDT)
In-Reply-To: <cover.1287681256.git.mcuelenaere@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Ben Dooks <ben-linux@fluff.org>, Kukjin Kim <kgene.kim@samsung.com>

s3c_pm_show_resume_irqs() is used by some s3c_pm_arch_show_resume_irqs()
implementations, which get included through mach/pm-core.h. Add __maybe_unused
to silence warnings when it isn't used (e.g. on S3C64XX platforms).

Signed-off-by: Maurus Cuelenaere <mcuelenaere@gmail.com>
---
 arch/arm/plat-samsung/pm.c |    5 +++--
 1 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/arm/plat-samsung/pm.c b/arch/arm/plat-samsung/pm.c
index 27cfca5..ad6dd63 100644
--- a/arch/arm/plat-samsung/pm.c
+++ b/arch/arm/plat-samsung/pm.c
@@ -214,8 +214,9 @@ void s3c_pm_do_restore_core(struct sleep_save *ptr, int count)
  *
  * print any IRQs asserted at resume time (ie, we woke from)
 */
-static void s3c_pm_show_resume_irqs(int start, unsigned long which,
-				    unsigned long mask)
+static void __maybe_unused s3c_pm_show_resume_irqs(int start,
+						   unsigned long which,
+						   unsigned long mask)
 {
 	int i;
 
-- 
1.7.2.3
