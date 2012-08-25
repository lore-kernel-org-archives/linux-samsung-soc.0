From: Sylwester Nawrocki <sylvester.nawrocki@gmail.com>
Subject: [PATCH 0/3] Removal of obsolete s3c2410_* GPIO API
Date: Sat, 25 Aug 2012 14:20:40 +0200
Message-ID: <1345897243-15619-1-git-send-email-sylvester.nawrocki@gmail.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wi0-f178.google.com ([209.85.212.178]:51774 "EHLO
	mail-wi0-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751112Ab2HYMU6 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 25 Aug 2012 08:20:58 -0400
Received: by wibhr14 with SMTP id hr14so1875491wib.1
        for <linux-samsung-soc@vger.kernel.org>; Sat, 25 Aug 2012 05:20:56 -0700 (PDT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: kgene.kim@samsung.com, linus.walleij@stericsson.com
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Sylwester Nawrocki <sylvester.nawrocki@gmail.com>

This short patch series converts remaining users of the s3c24xx SoC
specific gpiolib functions to the gpiolib API and finally removes
all s3c2410_* functions from drivers/gpio/gpio-samsung.c.

Sylwester Nawrocki (3):
  ARM: S3C24XX: Convert users of s3c2410_gpio_setpin to gpiolib API
  ARM: S3C24XX: Remove obsolete GPIO API declarations
  gpio-samsung: Remove now unused s3c2410_gpio* API

 arch/arm/mach-s3c24xx/mach-anubis.c           |    3 +-
 arch/arm/mach-s3c24xx/mach-jive.c             |   12 ++--
 arch/arm/mach-s3c24xx/mach-mini2440.c         |    4 +-
 arch/arm/mach-s3c24xx/mach-nexcoder.c         |   22 +++---
 arch/arm/mach-s3c24xx/mach-osiris.c           |    7 +-
 arch/arm/plat-samsung/include/plat/gpio-fns.h |   97 -------------------------
 drivers/gpio/gpio-samsung.c                   |   40 ----------
 7 files changed, 25 insertions(+), 160 deletions(-)

--
1.7.4.1
