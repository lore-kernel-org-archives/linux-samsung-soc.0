From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: [PATCH v3 resend] clk: s2mps11: Add support for S2MPS14 clocks
Date: Mon, 14 Apr 2014 09:55:21 +0200
Message-ID: <1397462122-24447-1-git-send-email-k.kozlowski@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:46359 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750983AbaDNHzg (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 14 Apr 2014 03:55:36 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Mike Turquette <mturquette@linaro.org>, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc: Kyungmin Park <kyungmin.park@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Tomasz Figa <t.figa@samsung.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>

Hi,

This is a resend of third version of patchset adding support for
the S2MPS14 device to the s2mps11 clock driver.

Previous discusson can be found here:
http://thread.gmane.org/gmane.linux.kernel.samsung-soc/28039

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

Krzysztof Kozlowski (1):
  clk: s2mps11: Add support for S2MPS14 clocks

 drivers/clk/Kconfig       |  8 +++----
 drivers/clk/clk-s2mps11.c | 61 +++++++++++++++++++++++++++++++++++------------
 2 files changed, 50 insertions(+), 19 deletions(-)

-- 
1.8.3.2
