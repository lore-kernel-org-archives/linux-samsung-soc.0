From: Vivek Gautam <gautam.vivek@samsung.com>
Subject: [PATCH v2] Adding USB 3.0 DRD-phy support for exynos5250
Date: Tue, 18 Dec 2012 20:40:25 +0530
Message-ID: <1355843426-13613-1-git-send-email-gautam.vivek@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:48576 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755180Ab2LRPD6 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 18 Dec 2012 10:03:58 -0500
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-usb@vger.kernel.org
Cc: devicetree-discuss@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, gregkh@linuxfoundation.org, balbi@ti.com, kgene.kim@samsung.com, thomas.abraham@linaro.org, rob.herring@calxeda.com, grant.likely@secretlab.ca, sylvester.nawrocki@gmail.com, av.tikhomirov@samsung.com, yulgon.kim@samsung.com, kishon@ti.com, p.paneri@samsung.com

Changes form v1:
 - Moved architecture related patch out of this patch-set.
 - Replaced unnecessary multi-line macro definitions by
   single line definitions.
 - Creating new data structure for USB 3.0 phy type and embedding
   it in 'samsung_usbphy' structure.
 - Adding a flag in 'samsung_usbphy' structure to check if device
   has usb 3.0 type phy or not.
 - Restructuring probe sequence for USB 3.0 phy, such that we are
   initializing only when device has usb3.0 type phy.

This patchset is based on the following patch-sets:
 - https://lkml.org/lkml/2012/12/18/201
 - http://lists.infradead.org/pipermail/linux-arm-kernel/2012-November/134476.html
 - https://lkml.org/lkml/2012/12/18/187

Vivek Gautam (1):
  usb: phy: samsung: Add support for USB 3.0 phy for exynos5250

 drivers/usb/phy/samsung-usbphy.c |  339 +++++++++++++++++++++++++++++++++++++-
 1 files changed, 337 insertions(+), 2 deletions(-)

-- 
1.7.6.5
