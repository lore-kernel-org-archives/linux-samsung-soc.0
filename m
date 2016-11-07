From: Pankaj Dubey <pankaj.dubey@samsung.com>
Subject: [PATCH 5/6] mfd: max8997: Add max8997-clk name in mfd_cell
Date: Mon, 07 Nov 2016 15:39:35 +0530
Message-ID: <1478513376-14307-6-git-send-email-pankaj.dubey@samsung.com>
References: <1478513376-14307-1-git-send-email-pankaj.dubey@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:41223 "EHLO
        mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751134AbcKGKGr (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 7 Nov 2016 05:06:47 -0500
Received: from epcpsbgm1new.samsung.com (epcpsbgm1 [203.254.230.26])
 by mailout4.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0OG902MV7O330X00@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 07 Nov 2016 19:06:45 +0900 (KST)
In-reply-to: <1478513376-14307-1-git-send-email-pankaj.dubey@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: krzk@kernel.org, javier@osg.samsung.com, kgene@kernel.org, thomas.ab@samsung.com, myungjoo.ham@samsung.com, Pankaj Dubey <pankaj.dubey@samsung.com>, Lee Jones <lee.jones@linaro.org>

This patch add max8997-clk in mfd_cell max8997_devs in order to probe
max8997-clk device driver.

CC: Lee Jones <lee.jones@linaro.org>
Signed-off-by: Pankaj Dubey <pankaj.dubey@samsung.com>
---
 drivers/mfd/max8997.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mfd/max8997.c b/drivers/mfd/max8997.c
index bda9ec8..4b809f8 100644
--- a/drivers/mfd/max8997.c
+++ b/drivers/mfd/max8997.c
@@ -48,6 +48,7 @@ static const struct mfd_cell max8997_devs[] = {
 	{ .name = "max8997-muic", },
 	{ .name = "max8997-led", .id = 1 },
 	{ .name = "max8997-led", .id = 2 },
+	{ .name = "max8997-clk",},
 };
 
 #ifdef CONFIG_OF
-- 
2.7.4
