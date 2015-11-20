From: Alim Akhtar <alim.akhtar@samsung.com>
Subject: [RESEND PATCH v5 0/3] mfd: sec: add S2MPS15 PMIC support
Date: Fri, 20 Nov 2015 16:07:50 +0530
Message-ID: <1448015873-8743-1-git-send-email-alim.akhtar@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:48402 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753257AbbKTKhA (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 20 Nov 2015 05:37:00 -0500
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: lee.jones@linaro.org, broonie@kernel.org
Cc: k.kozlowski@samsung.com, alexandre.belloni@free-electrons.com, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, rtc-linux@googlegroups.com, alim.akhtar@samsung.com

Hi Lee/Mark,

This a resend of series [0] that adds s2mps15 pmic support.
These patches have no changes, just collected some Reviewed-by and Acked-by tags.
[0] -> https://lkml.org/lkml/2015/10/30/44

Mark,
Can I have you acked-by for patch# 2/3? so that these can go in via MFD tree.

Alim Akhtar (1):
  drivers/rtc/rtc-s5m.c: add support for S2MPS15 RTC

Thomas Abraham (2):
  mfd: sec: Add support for S2MPS15 PMIC
  regulator: s2mps11: add support for S2MPS15 regulators

 drivers/mfd/sec-core.c              |   31 +++++++
 drivers/mfd/sec-irq.c               |    8 ++
 drivers/regulator/Kconfig           |    4 +-
 drivers/regulator/s2mps11.c         |  135 +++++++++++++++++++++++++++++-
 drivers/rtc/rtc-s5m.c               |   37 +++++++-
 include/linux/mfd/samsung/core.h    |    1 +
 include/linux/mfd/samsung/rtc.h     |    2 +
 include/linux/mfd/samsung/s2mps15.h |  158 +++++++++++++++++++++++++++++++++++
 8 files changed, 369 insertions(+), 7 deletions(-)
 create mode 100644 include/linux/mfd/samsung/s2mps15.h

-- 
1.7.10.4
