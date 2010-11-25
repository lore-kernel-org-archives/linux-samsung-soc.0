From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [PATCH 2/4] ARM: SAMSUNG: Cleanup GPIOlib adding 2bit chips
Date: Thu, 25 Nov 2010 14:30:15 +0900
Message-ID: <1290663017-9350-3-git-send-email-kgene.kim@samsung.com>
References: <1290663017-9350-1-git-send-email-kgene.kim@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from ganesha.gnumonks.org ([213.95.27.120]:58857 "EHLO
	ganesha.gnumonks.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750903Ab0KYFlf (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 25 Nov 2010 00:41:35 -0500
In-Reply-To: <1290663017-9350-1-git-send-email-kgene.kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: ben-linux@fluff.org, Kukjin Kim <kgene.kim@samsung.com>

This patch adds samsung_gpiolib_add_2bit_chips() for cleanup regarding
GPIOlib adding 2bit chips.

Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
---
 arch/arm/plat-samsung/gpiolib.c                |    7 +++++++
 arch/arm/plat-samsung/include/plat/gpio-core.h |    2 ++
 2 files changed, 9 insertions(+), 0 deletions(-)

diff --git a/arch/arm/plat-samsung/gpiolib.c b/arch/arm/plat-samsung/gpiolib.c
index c354089..ea37c04 100644
--- a/arch/arm/plat-samsung/gpiolib.c
+++ b/arch/arm/plat-samsung/gpiolib.c
@@ -197,3 +197,10 @@ void __init samsung_gpiolib_add_4bit2_chips(struct s3c_gpio_chip *chip,
 		s3c_gpiolib_add(chip);
 	}
 }
+
+void __init samsung_gpiolib_add_2bit_chips(struct s3c_gpio_chip *chip,
+					   int nr_chips)
+{
+	for (; nr_chips > 0; nr_chips--, chip++)
+		s3c_gpiolib_add(chip);
+}
diff --git a/arch/arm/plat-samsung/include/plat/gpio-core.h b/arch/arm/plat-samsung/include/plat/gpio-core.h
index 13a22b8..dac35d0 100644
--- a/arch/arm/plat-samsung/include/plat/gpio-core.h
+++ b/arch/arm/plat-samsung/include/plat/gpio-core.h
@@ -118,6 +118,8 @@ extern void samsung_gpiolib_add_4bit_chips(struct s3c_gpio_chip *chip,
 					   int nr_chips);
 extern void samsung_gpiolib_add_4bit2_chips(struct s3c_gpio_chip *chip,
 					    int nr_chips);
+extern void samsung_gpiolib_add_2bit_chips(struct s3c_gpio_chip *chip,
+					   int nr_chips);
 
 extern void samsung_gpiolib_add_4bit(struct s3c_gpio_chip *chip);
 extern void samsung_gpiolib_add_4bit2(struct s3c_gpio_chip *chip);
-- 
1.6.2.5
