From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH -next] arm: Select GPIO_GENERIC_PLATFORM for CRAGG_6410
Date: Tue, 12 Jan 2016 09:52:25 +0900
Message-ID: <56944E49.3040707@samsung.com>
References: <1452531649-14940-1-git-send-email-linux@roeck-us.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:30068 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S933457AbcALAwa (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 11 Jan 2016 19:52:30 -0500
In-reply-to: <1452531649-14940-1-git-send-email-linux@roeck-us.net>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Guenter Roeck <linux@roeck-us.net>, Kukjin Kim <kgene@kernel.org>
Cc: Russell King <linux@arm.linux.org.uk>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>

On 12.01.2016 02:00, Guenter Roeck wrote:
> Since commit 0f4630f3720e ("gpio: generic: factor into gpio_chip struct"),
> all users of struct bgpio_pdata depend on GPIO_GENERIC.
> 
> This results in the following build error.
> 
> arch/arm/mach-s3c64xx/mach-crag6410.c:270:3: warning:
> 	excess elements in struct initializer
> arch/arm/mach-s3c64xx/mach-crag6410.c:270:3: warning:
> 	(near initialization for '(anonymous)')
> arch/arm/mach-s3c64xx/mach-crag6410.c:271:2: error:
> 	invalid use of undefined type 'struct bgpio_pdata'
> 
> Fixes: 0f4630f3720e ("gpio: generic: factor into gpio_chip struct")
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> ---
> I don't know if this is the correct way to fix this problem.
> If not, please consider this to be a bug report.
> 
>  arch/arm/mach-s3c64xx/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
> 

Thanks for the report! I think that:

1. Other boards using the bgpio_pdata might be also affected:
mach-clps711x/board-autcpu12.c
mach-clps711x/board-p720t.c
mach-imx/mach-mx21ads.c

2. The boards does not directly depend on the GPIO_GENERIC.
If GPIO_GENERIC is not selected then it still might create
a basic-mmio-gpio device. The device of course won't be in
such case supported by any driver.


Instead to solve the error the structure should be
always visible so:


-- >8 --
From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Date: Tue, 12 Jan 2016 09:46:06 +0900
Subject: [PATCH] gpio: generic: Fix build error of missing bgpio_pdata
 declaration

Commit 0f4630f3720e ("gpio: generic: factor into gpio_chip struct")
introduced struct bgpio_pdata along with users but made the declaration
hidden by CONFIG_GPIO_GENERIC.

This results in the following build error:

arch/arm/mach-s3c64xx/mach-crag6410.c:270:3: warning: 	excess elements in struct initializer
arch/arm/mach-s3c64xx/mach-crag6410.c:270:3: warning:	(near initialization for '(anonymous)')
arch/arm/mach-s3c64xx/mach-crag6410.c:271:2: error:	invalid use of undefined type 'struct bgpio_pdata'

Fixes: 0f4630f3720e ("gpio: generic: factor into gpio_chip struct")
Reported-by: Guenter Roeck <linux@roeck-us.net>
Signed-off-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
---
 include/linux/gpio/driver.h | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/include/linux/gpio/driver.h b/include/linux/gpio/driver.h
index e2d05fd0e6e3..7b9054366e7a 100644
--- a/include/linux/gpio/driver.h
+++ b/include/linux/gpio/driver.h
@@ -220,14 +220,13 @@ static inline void *gpiochip_get_data(struct gpio_chip *chip)
 
 struct gpio_chip *gpiod_to_chip(const struct gpio_desc *desc);
 
-#if IS_ENABLED(CONFIG_GPIO_GENERIC)
-
 struct bgpio_pdata {
 	const char *label;
 	int base;
 	int ngpio;
 };
 
+#if IS_ENABLED(CONFIG_GPIO_GENERIC)
 int bgpio_init(struct gpio_chip *gc, struct device *dev,
 	       unsigned long sz, void __iomem *dat, void __iomem *set,
 	       void __iomem *clr, void __iomem *dirout, void __iomem *dirin,
-- 
1.9.1
