From: Christian Pellegrin <chripell@fsfe.org>
Subject: [PATCH v2] Fix GPIOs banks not being preserved during suspend
Date: Fri, 12 Mar 2010 08:28:47 +0100
Message-ID: <1268378927-7898-1-git-send-email-chripell@fsfe.org>
References: <cabda6421003112325w23628518tf12f2a7dae7b69ef@mail.gmail.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from qw-out-2122.google.com ([74.125.92.25]:37090 "EHLO
	qw-out-2122.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750945Ab0CLHa6 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 12 Mar 2010 02:30:58 -0500
Received: by qw-out-2122.google.com with SMTP id 9so148329qwb.37
        for <linux-samsung-soc@vger.kernel.org>; Thu, 11 Mar 2010 23:30:57 -0800 (PST)
In-Reply-To: <cabda6421003112325w23628518tf12f2a7dae7b69ef@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: ben-linux@fluff.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: Christian Pellegrin <chripell@fsfe.org>

This patch corrects the list of registers that must be saved/resumed
during suspend.

Signed-off-by: Christian Pellegrin <chripell@fsfe.org>
---
 arch/arm/mach-s3c2410/include/mach/gpio-core.h |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

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
-- 
1.5.6.5
