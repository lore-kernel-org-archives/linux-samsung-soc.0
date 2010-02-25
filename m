From: Maurus Cuelenaere <mcuelenaere@gmail.com>
Subject: [PATCH] ARM: SAMSUNG: Fix s3c hsotg driver compilation
Date: Thu, 25 Feb 2010 18:42:38 +0100
Message-ID: <b2e8f9f71002250942y7f61f12tcf3d6770b467985d@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-bw0-f212.google.com ([209.85.218.212]:35611 "EHLO
	mail-bw0-f212.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S933050Ab0BYRm7 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 25 Feb 2010 12:42:59 -0500
Received: by bwz4 with SMTP id 4so4681655bwz.28
        for <linux-samsung-soc@vger.kernel.org>; Thu, 25 Feb 2010 09:42:58 -0800 (PST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Ben Dooks <ben-linux@fluff.org>

File regs-sys.h was moved from plat to mach.

Signed-off-by: Maurus Cuelenaere <mcuelenaere@gmail.com>
---
 drivers/usb/gadget/s3c-hsotg.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/usb/gadget/s3c-hsotg.c b/drivers/usb/gadget/s3c-hsotg.c
index fec9c09..eda6a91 100644
--- a/drivers/usb/gadget/s3c-hsotg.c
+++ b/drivers/usb/gadget/s3c-hsotg.c
@@ -27,10 +27,10 @@
 #include <linux/usb/gadget.h>

 #include <mach/map.h>
+#include <mach/regs-sys.h>

 #include <plat/regs-usb-hsotg-phy.h>
 #include <plat/regs-usb-hsotg.h>
-#include <plat/regs-sys.h>
 #include <plat/udc-hs.h>

 #define DMA_ADDR_INVALID (~((dma_addr_t)0))
-- 
1.7.0
