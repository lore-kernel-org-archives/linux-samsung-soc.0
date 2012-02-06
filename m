From: Anton Tikhomirov <av.tikhomirov@samsung.com>
Subject: [PATCH 2/3] USB: SET SEL request definition
Date: Mon, 06 Feb 2012 17:12:33 +0900
Message-ID: <001001cce4a7$143300e0$3c9902a0$%tikhomirov@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:64270 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752517Ab2BFIMf (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 6 Feb 2012 03:12:35 -0500
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, linux-usb@vger.kernel.org
Cc: 'Kukjin Kim' <kgene.kim@samsung.com>, 'Greg Kroah-Hartman' <gregkh@suse.de>, 'Felipe Balbi' <balbi@ti.com>, 'Anton Tikhomirov' <av.tikhomirov@samsung.com>, 'Yulgon Kim' <yulgon.kim@samsung.com>

Cc: Kukjin Kim <kgene.kim <at> samsung.com>
Cc: Greg Kroah-Hartman <gregkh <at> suse.de>
Cc: Felipe Balbi <balbi <at> ti.com>

Adds SET SEL standard request definition as defined by ch9
of the USB3.0 specification.

Signed-off-by: Anton Tikhomirov <av.tikhomirov@samsung.com>
---
 include/linux/usb/ch9.h |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/include/linux/usb/ch9.h b/include/linux/usb/ch9.h
index 61b2905..76ff771 100644
--- a/include/linux/usb/ch9.h
+++ b/include/linux/usb/ch9.h
@@ -88,6 +88,7 @@
 #define USB_REQ_GET_INTERFACE		0x0A
 #define USB_REQ_SET_INTERFACE		0x0B
 #define USB_REQ_SYNCH_FRAME		0x0C
+#define USB_REQ_SET_SEL			0x30
 
 #define USB_REQ_SET_ENCRYPTION		0x0D	/* Wireless USB */
 #define USB_REQ_GET_ENCRYPTION		0x0E
-- 
1.7.1
