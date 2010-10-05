From: Maurus Cuelenaere <mcuelenaere@gmail.com>
Subject: [PATCH] ARM: SAMSUNG: Fix warning 's3c_pm_show_resume_irqs' defined but not used
Date: Wed,  6 Oct 2010 01:30:50 +0200
Message-ID: <4cabb531.cf7d0e0a.19d7.08b2@mx.google.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ey0-f174.google.com ([209.85.215.174]:52795 "EHLO
	mail-ey0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756451Ab0JEXa7 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 5 Oct 2010 19:30:59 -0400
Received: by eyb6 with SMTP id 6so2667540eyb.19
        for <linux-samsung-soc@vger.kernel.org>; Tue, 05 Oct 2010 16:30:57 -0700 (PDT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: ben-linux@fluff.org

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
