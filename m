From: Christian Pellegrin <chripell@fsfe.org>
Subject: [PATCH v2] Fix GPIOs bank H and J not being preserved during suspend
Date: Mon,  8 Mar 2010 12:21:28 +0100
Message-ID: <1268047288-11166-1-git-send-email-chripell@fsfe.org>
References: <cabda6421003080317t37124990v72ac56906719c091@mail.gmail.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from qw-out-2122.google.com ([74.125.92.27]:8591 "EHLO
	qw-out-2122.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754154Ab0CHLXp (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 8 Mar 2010 06:23:45 -0500
Received: by qw-out-2122.google.com with SMTP id 5so1036530qwd.37
        for <linux-samsung-soc@vger.kernel.org>; Mon, 08 Mar 2010 03:23:45 -0800 (PST)
In-Reply-To: <cabda6421003080317t37124990v72ac56906719c091@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: ben-linux@fluff.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: Christian Pellegrin <chripell@fsfe.org>

This patch adds bank H and J GPIOs (present on S3C244X CPUs) to the list
of registers that must be saved/resumed during suspend.

Signed-off-by: Christian Pellegrin <chripell@fsfe.org>
---
 arch/arm/mach-s3c2410/include/mach/gpio-core.h |    2 +-
 arch/arm/plat-s3c/pm-gpio.c                    |    4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm/mach-s3c2410/include/mach/gpio-core.h b/arch/arm/mach-s3c2410/include/mach/gpio-core.h
index f8b879a..7c33ecf 100644
--- a/arch/arm/mach-s3c2410/include/mach/gpio-core.h
+++ b/arch/arm/mach-s3c2410/include/mach/gpio-core.h
@@ -24,7 +24,7 @@ static inline struct s3c_gpio_chip *s3c_gpiolib_getchip(unsigned int pin)
 {
 	struct s3c_gpio_chip *chip;
 
-	if (pin > S3C2410_GPG(10))
+	if (pin > S3C_GPIO_END)
 		return NULL;
 
 	chip = &s3c24xx_gpios[pin/32];
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
