From: Tomasz Figa <t.figa@samsung.com>
Subject: [PATCH 0/6] pinctrl: samsung: Various fixes
Date: Thu, 20 Sep 2012 10:51:38 +0200
Message-ID: <1348131104-24828-1-git-send-email-t.figa@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:59574 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753538Ab2ITIwO (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 20 Sep 2012 04:52:14 -0400
Received: from epcpsbgm1.samsung.com (epcpsbgm1 [203.254.230.26])
 by mailout4.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MAN00CU64MYFC50@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 20 Sep 2012 17:52:11 +0900 (KST)
Received: from mcdsrvbld02.digital.local ([106.116.37.23])
 by mmp2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0MAN001S64MRTC90@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 20 Sep 2012 17:52:11 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, thomas.abraham@linaro.org, linus.walleij@linaro.org, kyungmin.park@samsung.com, m.szyprowski@samsung.com, t.figa@samsung.com

This patch series contains various fixes of problems and nitpicks spotted when
working on adding support for Exynos4x12. See each patch for more detailed
information.

TODO:
 - setting WEINT pins to EINT function in exynos_wkup_irq_set_type

Tomasz Figa (6):
  pinctrl: exynos: Set pin function to EINT in irq_set_type of GPIO
    EINT
  pinctrl: exynos: Fix typos in gpio/wkup _irq_mask
  pinctrl: exynos: Handle only unmasked wakeup interrupts
  pinctrl: exynos: Mark exynos_irq_demux_eint as inline
  pinctrl: exynos: Correct the detection of wakeup-eint node
  pinctrl: samsung: Uninline samsung_pinctrl_get_soc_data

 drivers/pinctrl/pinctrl-exynos.c  | 39 +++++++++++++++++++++++++++++----------
 drivers/pinctrl/pinctrl-exynos.h  |  1 +
 drivers/pinctrl/pinctrl-samsung.c |  2 +-
 3 files changed, 31 insertions(+), 11 deletions(-)

-- 
1.7.12
