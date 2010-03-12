From: Christian Pellegrin <chripell@fsfe.org>
Subject: [PATCH v2] Fix one-too-much bug when building list of regs to be preserved on PM
Date: Fri, 12 Mar 2010 08:29:03 +0100
Message-ID: <1268378943-7924-1-git-send-email-chripell@fsfe.org>
References: <cabda6421003112325w23628518tf12f2a7dae7b69ef@mail.gmail.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qy0-f172.google.com ([209.85.221.172]:61859 "EHLO
	mail-qy0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750766Ab0CLHbO (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 12 Mar 2010 02:31:14 -0500
Received: by qyk2 with SMTP id 2so1016378qyk.1
        for <linux-samsung-soc@vger.kernel.org>; Thu, 11 Mar 2010 23:31:13 -0800 (PST)
In-Reply-To: <cabda6421003112325w23628518tf12f2a7dae7b69ef@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: ben-linux@fluff.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: Christian Pellegrin <chripell@fsfe.org>

gpio_nr is already incremented in the for loop, so if we will have 32
banks of GPIOs someday the 33rd won't be saved/restored during PM

Signed-off-by: Christian Pellegrin <chripell@fsfe.org>
---
 arch/arm/plat-s3c/pm-gpio.c |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/plat-s3c/pm-gpio.c b/arch/arm/plat-s3c/pm-gpio.c
index cfd326a..b3cc8db 100644
--- a/arch/arm/plat-s3c/pm-gpio.c
+++ b/arch/arm/plat-s3c/pm-gpio.c
@@ -343,7 +343,7 @@ void s3c_pm_save_gpios(void)
 			  ourchip->pm_save[2],
 			  ourchip->pm_save[3]);
 
-		gpio_nr += ourchip->chip.ngpio;
+		gpio_nr += ourchip->chip.ngpio - 1;
 		gpio_nr += CONFIG_S3C_GPIO_SPACE;
 	}
 }
@@ -374,7 +374,7 @@ void s3c_pm_restore_gpios(void)
 
 		s3c_pm_resume_gpio(ourchip);
 
-		gpio_nr += ourchip->chip.ngpio;
+		gpio_nr += ourchip->chip.ngpio - 1;
 		gpio_nr += CONFIG_S3C_GPIO_SPACE;
 	}
 }
-- 
1.5.6.5
