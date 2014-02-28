From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: [PATCH 0/4] mfd: sec: Add support for S2MPS14
Date: Fri, 28 Feb 2014 11:41:40 +0100
Message-ID: <1393584104-18912-1-git-send-email-k.kozlowski@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:20302 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751263AbaB1Klx (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 28 Feb 2014 05:41:53 -0500
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sangbeom Kim <sbkim73@samsung.com>, Samuel Ortiz <sameo@linux.intel.com>, Lee Jones <lee.jones@linaro.org>, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc: Kyungmin Park <kyungmin.park@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Tomasz Figa <t.figa@samsung.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>

Hi,

Few days ago I sent patches adding support for S2MPS14 device to the
sec-core/s2mps11 drivers. These patches were rather large as they covered
multiple subsystems so I decided to split everything into smaller, separate
patches.

The original patchset (version 3) can be found here:
http://thread.gmane.org/gmane.linux.kernel.samsung-soc/27194/focus=1649217

This patchset is a small subset of the patchset related to the MFD core
driver. It adds support for the S2MPS14 device only to the MFD core driver.
I already obtained acks from Lee Jones during previous reviews.

The patchset is based on current Linus' tree *with* patch:
mfd: sec-core: Fix possible NULL pointer dereference when i2c_new_dummy error
(which is already in Lee Jones' MFD tree)

Best regards,
Krzysztof


Krzysztof Kozlowski (4):
  mfd: sec: Add maximum RTC register for regmap config
  mfd: sec: Select different RTC regmaps for devices
  mfd: sec: Use consistent S2MPS11 RTC alarm interrupt indexes
  mfd: sec: Add support for S2MPS14

 drivers/mfd/sec-core.c              |   57 ++++++++++++-
 drivers/mfd/sec-irq.c               |   97 ++++++++++++++++++++--
 include/linux/mfd/samsung/core.h    |    1 +
 include/linux/mfd/samsung/irq.h     |   31 ++++++-
 include/linux/mfd/samsung/rtc.h     |   57 +++++++++++--
 include/linux/mfd/samsung/s2mps14.h |  152 +++++++++++++++++++++++++++++++++++
 6 files changed, 378 insertions(+), 17 deletions(-)
 create mode 100644 include/linux/mfd/samsung/s2mps14.h

-- 
1.7.9.5
