From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [PATCH] ARM: S5P: Add USB External Crystal clock definition
Date: Mon, 19 Apr 2010 20:05:08 +0900
Message-ID: <1271675108-32082-1-git-send-email-kgene.kim@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from ganesha.gnumonks.org ([213.95.27.120]:47205 "EHLO
	ganesha.gnumonks.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754359Ab0DSLH7 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 19 Apr 2010 07:07:59 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: ben-linux@fluff.org, Thomas Abraham <thomas.ab@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>

From: Thomas Abraham <thomas.ab@samsung.com>

Add USB external crystal clock definition Xusbxti to common S5P clock code.

Signed-off-by: Thomas Abraham <thomas.ab@samsung.com>
Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
---
 arch/arm/plat-s5p/clock.c                  |    5 +++++
 arch/arm/plat-s5p/include/plat/s5p-clock.h |    1 +
 2 files changed, 6 insertions(+), 0 deletions(-)

diff --git a/arch/arm/plat-s5p/clock.c b/arch/arm/plat-s5p/clock.c
index 7ceb1c9..e550ce1 100644
--- a/arch/arm/plat-s5p/clock.c
+++ b/arch/arm/plat-s5p/clock.c
@@ -33,6 +33,11 @@ struct clk clk_ext_xtal_mux = {
 	.id		= -1,
 };
 
+struct clk clk_xusbxti = {
+	.name		= "xusbxti",
+	.id		= -1,
+};
+
 static struct clk s5p_clk_27m = {
 	.name		= "clk_27m",
 	.id		= -1,
diff --git a/arch/arm/plat-s5p/include/plat/s5p-clock.h b/arch/arm/plat-s5p/include/plat/s5p-clock.h
index 56fb8b4..a476a9f 100644
--- a/arch/arm/plat-s5p/include/plat/s5p-clock.h
+++ b/arch/arm/plat-s5p/include/plat/s5p-clock.h
@@ -23,6 +23,7 @@
 #define clk_fin_vpll clk_ext_xtal_mux
 
 extern struct clk clk_ext_xtal_mux;
+extern struct clk clk_xusbxti;
 extern struct clk clk_48m;
 extern struct clk clk_fout_apll;
 extern struct clk clk_fout_mpll;
-- 
1.6.3.3
