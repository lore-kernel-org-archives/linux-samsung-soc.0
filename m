From: Christian Pellegrin <chripell@fsfe.org>
Subject: [PATCH v2.6.33] Fix GPIOs bank H and J not being preserved during suspend
Date: Wed,  3 Mar 2010 08:44:14 +0100
Message-ID: <1267602254-9860-1-git-send-email-chripell@fsfe.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from qw-out-2122.google.com ([74.125.92.26]:5843 "EHLO
	qw-out-2122.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751486Ab0CCHqQ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 3 Mar 2010 02:46:16 -0500
Received: by qw-out-2122.google.com with SMTP id 8so134135qwh.37
        for <linux-samsung-soc@vger.kernel.org>; Tue, 02 Mar 2010 23:46:16 -0800 (PST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: Christian Pellegrin <chripell@fsfe.org>

This patch adds bank H and J GPIOs (present on S3C244X CPUs) to the list
of registers that must be saved/resumed during suspend.

Signed-off-by: Christian Pellegrin <chripell@fsfe.org>
---
 arch/arm/mach-s3c2410/include/mach/gpio-core.h |    5 +++++
 arch/arm/plat-s3c/pm-gpio.c                    |    4 ++--
 2 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/arch/arm/mach-s3c2410/include/mach/gpio-core.h b/arch/arm/mach-s3c2410/include/mach/gpio-core.h
index f8b879a..de9697c 100644
--- a/arch/arm/mach-s3c2410/include/mach/gpio-core.h
+++ b/arch/arm/mach-s3c2410/include/mach/gpio-core.h
@@ -24,8 +24,13 @@ static inline struct s3c_gpio_chip *s3c_gpiolib_getchip(unsigned int pin)
 {
 	struct s3c_gpio_chip *chip;
 
+#ifdef CONFIG_CPU_S3C244X
+	if (pin > S3C2410_GPJ(15))
+		return NULL;
+#else
 	if (pin > S3C2410_GPG(10))
 		return NULL;
+#endif
 
 	chip = &s3c24xx_gpios[pin/32];
 	return (S3C2410_GPIO_OFFSET(pin) < chip->chip.ngpio) ? chip : NULL;
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
