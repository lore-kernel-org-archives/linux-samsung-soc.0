From: Pankaj Dubey <pankaj.dubey@samsung.com>
Subject: [PATCH 3/3] ARM: S5PV210: Removed code for setting clock rate of xusbxti
Date: Fri,  2 Dec 2011 12:08:18 +0530
Message-ID: <1322807898-14825-4-git-send-email-pankaj.dubey@samsung.com>
References: <1322807898-14825-1-git-send-email-pankaj.dubey@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-iy0-f174.google.com ([209.85.210.174]:53148 "EHLO
	mail-iy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751728Ab1LBGkk (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 2 Dec 2011 01:40:40 -0500
Received: by mail-iy0-f174.google.com with SMTP id e36so3699997iag.19
        for <linux-samsung-soc@vger.kernel.org>; Thu, 01 Dec 2011 22:40:40 -0800 (PST)
In-Reply-To: <1322807898-14825-1-git-send-email-pankaj.dubey@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, linaro-dev@lists.linaro.org
Cc: kgene.kim@samsung.com, pankaj.dubey@samsung.com

Since now xusbxti clock's default rate is set in clock.c file,
there is no need to set it again in the machine file.

Signed-off-by: Pankaj Dubey <pankaj.dubey@samsung.com>
---
 arch/arm/mach-s5pv210/mach-goni.c |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/arch/arm/mach-s5pv210/mach-goni.c b/arch/arm/mach-s5pv210/mach-goni.c
index 15edcae..02d31f4 100644
--- a/arch/arm/mach-s5pv210/mach-goni.c
+++ b/arch/arm/mach-s5pv210/mach-goni.c
@@ -947,7 +947,6 @@ static void __init goni_machine_init(void)
 	/* KEYPAD */
 	samsung_keypad_set_platdata(&keypad_data);
 
-	clk_xusbxti.rate = 24000000;
 
 	platform_add_devices(goni_devices, ARRAY_SIZE(goni_devices));
 }
-- 
1.7.4.1
