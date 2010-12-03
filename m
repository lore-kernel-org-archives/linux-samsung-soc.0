From: Sangbeom Kim <sbkim73@samsung.com>
Subject: [PATCH] ARM: S5P64X0: Change gpiolib initialization for S5P64X0 to core_initcall
Date: Fri,  3 Dec 2010 09:52:47 +0900
Message-ID: <1291337567-9064-1-git-send-email-sbkim73@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from ganesha.gnumonks.org ([213.95.27.120]:33884 "EHLO
	ganesha.gnumonks.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753108Ab0LCBIT (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 2 Dec 2010 20:08:19 -0500
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, ben-linux@fluff.org, Abhilash Kesavan <a.kesavan@samsung.com>, Sangbeom Kim <sbkim73@samsung.com>

From: Abhilash Kesavan <a.kesavan@samsung.com>

Changing the gpiolib initialization from arch_initcall to core_initcall
will allow us to make use of gpio functions in smdk64x0_machine_init
function.

Signed-off-by: Abhilash Kesavan <a.kesavan@samsung.com>
Signed-off-by: Sangbeom Kim <sbkim73@samsung.com>
---
 arch/arm/mach-s5p64x0/gpiolib.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/arch/arm/mach-s5p64x0/gpiolib.c b/arch/arm/mach-s5p64x0/gpiolib.c
index 072668a..e7fb3b0 100644
--- a/arch/arm/mach-s5p64x0/gpiolib.c
+++ b/arch/arm/mach-s5p64x0/gpiolib.c
@@ -508,4 +508,4 @@ static int __init s5p64x0_gpiolib_init(void)
 
 	return 0;
 }
-arch_initcall(s5p64x0_gpiolib_init);
+core_initcall(s5p64x0_gpiolib_init);
-- 
1.6.6.1
