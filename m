From: Tushar Behera <tushar.behera@linaro.org>
Subject: [PATCH] ARM: SAMSUNG: Update default rate for xusbxti clock
Date: Thu, 21 Jun 2012 08:36:59 +0530
Message-ID: <1340248019-24129-1-git-send-email-tushar.behera@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pb0-f46.google.com ([209.85.160.46]:58150 "EHLO
	mail-pb0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758176Ab2FUDSn (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 20 Jun 2012 23:18:43 -0400
Received: by pbbrp8 with SMTP id rp8so1449230pbb.19
        for <linux-samsung-soc@vger.kernel.org>; Wed, 20 Jun 2012 20:18:42 -0700 (PDT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com

The rate of xusbxti clock is set in individual machine files. The default
value should be defined at the clock definition and individual machine files
should modify it if required.

Division by zero in kernel.
[<c0011849>] (unwind_backtrace+0x1/0x9c) from [<c022c663>] (Ldiv0+0x9/0x12)
[<c022c663>] (Ldiv0+0x9/0x12) from [<c001a3c3>] (s3c_setrate_clksrc+0x33/0x78)
[<c001a3c3>] (s3c_setrate_clksrc+0x33/0x78) from [<c0019e67>] (clk_set_rate+0x2f/0x78)

Signed-off-by: Tushar Behera <tushar.behera@linaro.org>
---

Patch is rebased on v3.5-rc3.

 arch/arm/plat-samsung/s5p-clock.c |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/arch/arm/plat-samsung/s5p-clock.c b/arch/arm/plat-samsung/s5p-clock.c
index 031a618..48a1599 100644
--- a/arch/arm/plat-samsung/s5p-clock.c
+++ b/arch/arm/plat-samsung/s5p-clock.c
@@ -37,6 +37,7 @@ struct clk clk_ext_xtal_mux = {
 struct clk clk_xusbxti = {
 	.name		= "xusbxti",
 	.id		= -1,
+	.rate		= 24000000,
 };
 
 struct clk s5p_clk_27m = {
-- 
1.7.4.1
