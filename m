From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: [PATCH 0/6] pinctrl: Add support for pin control on S3C64xx
Date: Mon, 18 Mar 2013 22:31:49 +0100
Message-ID: <1363642315-10331-1-git-send-email-tomasz.figa@gmail.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ea0-f175.google.com ([209.85.215.175]:36802 "EHLO
	mail-ea0-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755733Ab3CRVcJ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 18 Mar 2013 17:32:09 -0400
Received: by mail-ea0-f175.google.com with SMTP id o10so2713313eaj.20
        for <linux-samsung-soc@vger.kernel.org>; Mon, 18 Mar 2013 14:32:07 -0700 (PDT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, thomas.abraham@linaro.org, linus.walleij@linaro.org, Tomasz Figa <tomasz.figa@gmail.com>

This series makes necessary preparations to add support for pin controller
available on Samsung S3C64xx using pinctrl-samsung driver and then adds
pinctrl-s3c64xx driver which implements SoC-specific part of the code.

It has been tested on a tiny6410 (mini6410-compatible) board with my patches
for samsung-time cleanup and S3C64xx Device Tree support:
 - http://thread.gmane.org/gmane.linux.kernel.samsung-soc/16664
 - http://www.mail-archive.com/linux-samsung-soc@vger.kernel.org/msg16325.html

Just the driver is added for now, as this is the part that can safely go
through Linus' pinctrl tree. I will post appropriate enablement patches
after all the dependencies get merged to Kgene's tree.

See particular patches for more detailed description of all changes.

Tomasz Figa (6):
  pinctrl: samsung: Protect bank registers with a spinlock
  pinctrl: samsung: Include pinctrl-exynos driver data conditionally
  pinctrl: samsung: Split pin bank description into two structures
  pinctrl: samsung: Remove hardcoded register offsets
  pinctrl: samsung: Handle banks with two configuration registers
  pinctrl: Add pinctrl-s3c64xx driver

 .../bindings/pinctrl/samsung-pinctrl.txt           |   3 +
 drivers/pinctrl/Kconfig                            |   5 +
 drivers/pinctrl/Makefile                           |   1 +
 drivers/pinctrl/pinctrl-exynos.c                   |  36 +-
 drivers/pinctrl/pinctrl-exynos.h                   |  16 +-
 drivers/pinctrl/pinctrl-s3c64xx.c                  | 817 +++++++++++++++++++++
 drivers/pinctrl/pinctrl-samsung.c                  |  99 ++-
 drivers/pinctrl/pinctrl-samsung.h                  |  42 +-
 8 files changed, 947 insertions(+), 72 deletions(-)
 create mode 100644 drivers/pinctrl/pinctrl-s3c64xx.c

-- 
1.8.1.5
