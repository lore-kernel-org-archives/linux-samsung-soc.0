From: Tomasz Figa <t.figa@samsung.com>
Subject: [PATCH 0/6] Various improvements for samsung-pinctrl driver
Date: Wed, 02 Jul 2014 17:40:58 +0200
Message-ID: <1404315664-3174-1-git-send-email-t.figa@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:62987 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752249AbaGBPli (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 2 Jul 2014 11:41:38 -0400
Received: from eucpsbgm2.samsung.com (unknown [203.254.199.245])
 by mailout3.w1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0N830062PCXBQ750@mailout3.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 02 Jul 2014 16:41:35 +0100 (BST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, Kukjin Kim <kgene.kim@samsung.com>, Linus Walleij <linus.walleij@linaro.org>, Doug Anderson <dianders@chromium.org>, Tomasz Figa <t.figa@samsung.com>

This series fixes various shortcommings of the Samsung pin control driver
that have been spotted while using it on various platforms with multiple
use cases and requirements.

Most of the patches are independent of each other, with the exception of
patch 4/6 which depends on patch 3/6, due to consolidation of IRQ chips.

Please see individual patches for more details.

Tested on Exynos4412-based Trats2 board with display, camera and GPIO keys
enabled.

Tomasz Figa (6):
  pinctrl: samsung: Decouple direction setting from pinctrl
  pinctrl: samsung: Handle GPIO request and free using pinctrl helpers
  pinctrl: exynos: Consolidate irq_chips of GPIO and WKUP EINTs
  pinctrl: exynos: Lock GPIOs as interrupts when used as EINTs
  pinctrl: samsung: Allow grouping multiple pinmux/pinconf nodes
  pinctrl: samsung: Allow pin value to be initialized using pinfunc

 .../bindings/pinctrl/samsung-pinctrl.txt           |  24 +-
 drivers/pinctrl/pinctrl-exynos.c                   | 376 ++++-------
 drivers/pinctrl/pinctrl-samsung.c                  | 728 ++++++++++++---------
 drivers/pinctrl/pinctrl-samsung.h                  |  19 +-
 4 files changed, 568 insertions(+), 579 deletions(-)

-- 
1.9.3
