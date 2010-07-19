From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH 1/3] USB: s3c-hsotg: fix compilation problem
Date: Mon, 19 Jul 2010 16:01:40 +0200
Message-ID: <1279548102-32390-2-git-send-email-m.szyprowski@samsung.com>
References: <1279548102-32390-1-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:20122 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S933239Ab0GSOBv (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 19 Jul 2010 10:01:51 -0400
In-reply-to: <1279548102-32390-1-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-usb@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc: m.szyprowski@samsung.com, kyungmin.park@samsung.com, ben-linux@fluff.org, greg@kroah.com

drivers/usb/gadget/s3c-hsotg.c: In function =E2=80=98s3c_hsotg_otgreset=
=E2=80=99:
drivers/usb/gadget/s3c-hsotg.c:2816: error: =E2=80=98MHZ=E2=80=99 undec=
lared (first use in this function)
drivers/usb/gadget/s3c-hsotg.c:2816: error: (Each undeclared identifier=
 is reported only once
drivers/usb/gadget/s3c-hsotg.c:2816: error: for each function it appear=
s in.)

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 drivers/usb/gadget/s3c-hsotg.c |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/drivers/usb/gadget/s3c-hsotg.c b/drivers/usb/gadget/s3c-hs=
otg.c
index a4e0b0f..ce272b4 100644
--- a/drivers/usb/gadget/s3c-hsotg.c
+++ b/drivers/usb/gadget/s3c-hsotg.c
@@ -36,6 +36,7 @@
 #include <plat/regs-usb-hsotg.h>
 #include <mach/regs-sys.h>
 #include <plat/udc-hs.h>
+#include <plat/cpu.h>
=20
 #define DMA_ADDR_INVALID (~((dma_addr_t)0))
=20
--=20
1.7.1.569.g6f426
