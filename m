From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: [PATCH v3 0/3] clk: s2mps11: Add support for S2MPS14 clocks
Date: Mon, 17 Mar 2014 10:19:15 +0100
Message-ID: <1395047958-17953-1-git-send-email-k.kozlowski@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:34083 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751768AbaCQJT3 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 17 Mar 2014 05:19:29 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Mike Turquette <mturquette@linaro.org>, linux-arm-kernel@lists.infradead.org, Sangbeom Kim <sbkim73@samsung.com>, Samuel Ortiz <sameo@linux.intel.com>, Lee Jones <lee.jones@linaro.org>, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc: Tushar Behera <tushar.behera@linaro.org>, Yadwinder Singh Brar <yadi.brar@samsung.com>, Sachin Kamat <sachin.kamat@linaro.org>, Kyungmin Park <kyungmin.park@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Tomasz Figa <t.figa@samsung.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>

Hi,

This is third version of patchset adding support for the S2MPS14
device to the s2mps11 clock driver.


The patchset *depends on*:
==========================
1. Work done by Tushar Behera:
   [PATCH V2 0/2] Add support for clocks in S5M8767
   http://thread.gmane.org/gmane.linux.kernel.samsung-soc/27264
2. Support for S2MPS14 in main sec-core MFD driver (already in linux-next
   and Lee's tree).

Changes since v2:
=================
1. Patch 2/3: Remove MFD cells of_compatible which aren't used by child
   drivers and are not documented.
2. Added Tomasz's Review-by.

Changes since v1:
=================
1. Patch 1/3: Update driver description in Kconfig.
2. Patch 2/3: Add of_compatible to all MFD cells.
3. Add Yadwinder's Review-by.

Best regards,
Krzysztof


Krzysztof Kozlowski (3):
  clk: s2mps11: Add support for S2MPS14 clocks
  mfd: sec-core: Add of_compatible strings for clock MFD cells
  Documentation: mfd: s2mps11: Describe S5M8767 and S2MPS14 clocks

 Documentation/devicetree/bindings/mfd/s2mps11.txt |   24 +++++---
 drivers/clk/Kconfig                               |    8 +--
 drivers/clk/clk-s2mps11.c                         |   61 ++++++++++++++++-----
 drivers/mfd/sec-core.c                            |    3 +
 4 files changed, 68 insertions(+), 28 deletions(-)

-- 
1.7.9.5
