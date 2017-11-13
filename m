From: Arvind Yadav <arvind.yadav.cs@gmail.com>
Subject: [PATCH 0/3] irqchip:  pr_err() strings should end with newlines
Date: Mon, 13 Nov 2017 19:23:46 +0530
Message-ID: <cover.1510580710.git.arvind.yadav.cs@gmail.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pg0-f67.google.com ([74.125.83.67]:49713 "EHLO
        mail-pg0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751355AbdKMNyq (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 13 Nov 2017 08:54:46 -0500
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: tglx@linutronix.de, jason@lakedaemon.net, marc.zyngier@arm.com, kgene@kernel.org, krzk@kernel.org
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

pr_err() messages should end with a new-line to avoid other messages
being concatenated.

Arvind Yadav (3):
  [PATCH 1/3] irqchip/mips-gic:  pr_err() strings should end with newlines
  [PATCH 2/3] irqchip/s3c24xx:  pr_err() strings should end with newlines
  [PATCH 3/3] irqchip/gic-v3:  pr_err() strings should end with newlines

 drivers/irqchip/irq-gic-v3.c   | 2 +-
 drivers/irqchip/irq-mips-gic.c | 4 ++--
 drivers/irqchip/irq-s3c24xx.c  | 4 ++--
 3 files changed, 5 insertions(+), 5 deletions(-)

-- 
1.9.1
