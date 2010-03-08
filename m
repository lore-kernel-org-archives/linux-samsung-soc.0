From: Maurus Cuelenaere <mcuelenaere@gmail.com>
Subject: [PATCH 2/7] USB: gadget: Increase reset timeout in s3c-hsotg
Date: Mon, 8 Mar 2010 19:38:47 +0100
Message-ID: <b2e8f9f71003081038u74e256c8u355692816fbe7807@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-bw0-f209.google.com ([209.85.218.209]:43223 "EHLO
	mail-bw0-f209.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755119Ab0CHSjJ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 8 Mar 2010 13:39:09 -0500
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-usb@vger.kernel.org
Cc: Ben Dooks <ben-linux@fluff.org>

Increase the timeout when waiting for CSftRst to become deasserted.
This removes the "reset failed" message on SmartQ 5/7 machines.

Signed-off-by: Maurus Cuelenaere <mcuelenaere@gmail.com>
---
 drivers/usb/gadget/s3c-hsotg.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/usb/gadget/s3c-hsotg.c b/drivers/usb/gadget/s3c-hsotg.c
index 4b5dbd0..6c04c3c 100644
--- a/drivers/usb/gadget/s3c-hsotg.c
+++ b/drivers/usb/gadget/s3c-hsotg.c
@@ -2397,7 +2397,7 @@ static int s3c_hsotg_corereset(struct s3c_hsotg *hsotg)
 		return -EINVAL;
 	}

-	timeout = 1000;
+	timeout = 10000;

 	while (1) {
 		u32 grstctl = readl(hsotg->regs + S3C_GRSTCTL);
-- 
1.7.0.1
