From: Tomasz Figa <t.figa@samsung.com>
Subject: [PATCH 0/6] Fix suspend/resume issues created by pinmux on exynos,
 part 2
Date: Fri, 17 May 2013 18:24:26 +0200
Message-ID: <1368807872-2601-1-git-send-email-t.figa@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:17618 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755763Ab3EQQZB (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 17 May 2013 12:25:01 -0400
Received: from eucpsbgm1.samsung.com (unknown [203.254.199.244])
 by mailout3.w1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MMY003AFAXG67C0@mailout3.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 17 May 2013 17:24:59 +0100 (BST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, kgene.kim@samsung.com, arnd@arndb.de, olof@lixom.net, Doug Anderson <dianders@chromium.org>, =?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>, Stephen Warren <swarren@wwwdotorg.org>, Thomas Abraham <thomas.abraham@linaro.org>, Linus Walleij <linus.walleij@linaro.org>, Prathyush K <prathyush.k@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Tomasz Figa <t.figa@samsung.com>

This series aims at fixing problems with suspend/resume on Exynos SoCs
introduced by migration of GPIO and EINT support to pin control driver
on DT-enabled platforms.

The patches fix following issues:
 - missing support for IRQ wake of pinctrl-exynos driver
 - legacy GPIO and EINT save/restore handling in platform PM code
   inappropriate on pinctrl-enabled platforms
 - several EINT-related registers must be saved as well
 
The series is based on a patch by Doug Anderson that adds suspend/restore
of pinctrl registers to pinctrl-samsung driver:
[PATCH v3] pinctrl: samsung: fix suspend/resume functionality
http://www.spinics.net/lists/kernel/msg1534119.html

On Exynos4210-based Trats board:
Tested-by: Tomasz Figa <t.figa@samsung.com>

Tomasz Figa (6):
  pinctrl: exynos: Add support for set_irq_wake of wake-up EINTs
  ARM: EXYNOS: Fix EINT wake-up mask configuration when pinctrl is used
  ARM: SAMSUNG: pm: Adjust for pinctrl- and DT-enabled platforms
  pinctrl: samsung: Add support for SoC-specific suspend/resume
    callbacks
  pinctrl: samsung: Allow per-bank SoC-specific private data
  pinctrl: exynos: Handle suspend/resume of GPIO EINT registers

 arch/arm/mach-exynos/include/mach/pm-core.h |  14 +++-
 arch/arm/plat-samsung/pm.c                  |  17 +++--
 drivers/pinctrl/pinctrl-exynos.c            | 106 ++++++++++++++++++++++++++++
 drivers/pinctrl/pinctrl-exynos.h            |   1 +
 drivers/pinctrl/pinctrl-samsung.c           |   6 ++
 drivers/pinctrl/pinctrl-samsung.h           |   4 ++
 6 files changed, 142 insertions(+), 6 deletions(-)

-- 
1.8.2.1
