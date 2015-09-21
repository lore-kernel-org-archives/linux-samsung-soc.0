From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH v3 0/4] Exynos4412-based Trats2 USB gadget (DWC2) fixes
Date: Mon, 21 Sep 2015 12:16:08 +0200
Message-ID: <1442830572-6765-1-git-send-email-m.szyprowski@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:30132 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753525AbbIUKQY (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 21 Sep 2015 06:16:24 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Robert Baldyga <r.baldyga@samsung.com>, John Youn <johnyoun@synopsys.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>

Hello,

This is an updated DWC2 related part of initial patchset posted here:
https://lkml.org/lkml/2015/8/21/306 
Only DWC2 related patches have been modified since the initial
submission.

Changelog:
v3:
- rebased onto latest 'testing/next' from Felipe Balbi (includes
  s3c_hsotg -> dwc2 rename)

v2:
- moved setting of ll_hw_enabled flag to enable/disable functions,
  as suggested by John Youn
- moved setting of phy width to dwc2_lowlevel_init function


Marek Szyprowski (4):
  usb: dwc2: remove double call to dwc2_hsotg_of_probe
  usb: dwc2: remove non-functional clock gating
  usb: dwc2: fix unbalanced phy control
  usb: dwc2: refactor common low-level hw code to platform.c

 drivers/usb/dwc2/core.h     |   4 +-
 drivers/usb/dwc2/gadget.c   | 201 ++++---------------------------------
 drivers/usb/dwc2/platform.c | 236 ++++++++++++++++++++++++++++++++++++--------
 3 files changed, 217 insertions(+), 224 deletions(-)

-- 
1.9.2
