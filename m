From: Tomasz Figa <t.figa@samsung.com>
Subject: [PATCH v2 0/2] mmc: host: sdhci-s3c: Add support for pinctrl interface
Date: Fri, 16 Nov 2012 15:28:15 +0100
Message-ID: <1353076097-22498-1-git-send-email-t.figa@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:59093 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751642Ab2KPO2v (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 16 Nov 2012 09:28:51 -0500
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-mmc@vger.kernel.org
Cc: linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, cjb@laptop.org, ben-linux@fluff.org, kyungmin.park@samsung.com, m.szyprowski@samsung.com, t.figa@samsung.com, tomasz.figa@gmail.com

This series intends to add support for pin configuration using pin control
interface.

First patch cleans up GPIO requesting and freeing in the driver to simplify
adding pin control support.

Second patch adds pin control support to the driver.

Changes since v1:
 - fixed build error because of incorrect merge

Tomasz Figa (2):
  mmc: host: sdhci-s3c: Use devm_gpio_request to request GPIOs
  mmc: host: sdhci-s3c: Add support for pinctrl

 .../devicetree/bindings/mmc/samsung-sdhci.txt      | 20 ++++++---
 drivers/mmc/host/sdhci-s3c.c                       | 52 ++++++++--------------
 2 files changed, 32 insertions(+), 40 deletions(-)

-- 
1.8.0
