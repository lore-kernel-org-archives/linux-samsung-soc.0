From: Naveen Krishna Chatradhi <ch.naveen@samsung.com>
Subject: [PATCH 0/3] serial: samsung: get fifosize from DT and clean up
Date: Mon, 14 Jul 2014 17:07:15 +0530
Message-ID: <1405337838-30335-1-git-send-email-ch.naveen@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:19594 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754230AbaGNLky (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 14 Jul 2014 07:40:54 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: kgene.kim@samsung.com, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
Cc: gregkh@linuxfoundation.org, ben-linux@fluff.org, cpgs@samsung.com

This patch set does the following
1: Get fifosize from DT node. But, not mandating it.
2. Corrects the case and default order in a switch
3. Defines a variable to simply the code.

Console messages on Exynos5420 based peach pit and pi works fine.

Naveen Krishna Chatradhi (3):
  serial: samsung: get fifosize via device tree
  serial: samsung: correct the case and default order in switch
  serial: samsung: improve code clarity by defining a variable

 .../devicetree/bindings/serial/samsung_uart.txt    |    4 ++++
 drivers/tty/serial/samsung.c                       |   19 +++++++++++++------
 2 files changed, 17 insertions(+), 6 deletions(-)

-- 
1.7.9.5
