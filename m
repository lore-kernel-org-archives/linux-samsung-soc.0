From: Heiko =?iso-8859-1?q?St=FCbner?= <heiko@sntech.de>
Subject: [PATCH 2/7] s3c-hsudc: add __devinit to probe function
Date: Mon, 19 Dec 2011 14:24:57 +0100
Message-ID: <201112191424.58081.heiko@sntech.de>
References: <201112191423.21461.heiko@sntech.de>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from h1778886.stratoserver.net ([85.214.133.74]:53154 "EHLO
	h1778886.stratoserver.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752513Ab1LSNZJ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 19 Dec 2011 08:25:09 -0500
In-Reply-To: <201112191423.21461.heiko@sntech.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Felipe Balbi <balbi@ti.com>, Kukjin Kim <kgene.kim@samsung.com>, 'Ben Dooks' <ben-linux@fluff.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Linux USB Mailing List <linux-usb@vger.kernel.org>

Signed-off-by: Heiko Stuebner <heiko@sntech.de>
---
 drivers/usb/gadget/s3c-hsudc.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/usb/gadget/s3c-hsudc.c b/drivers/usb/gadget/s3c-hsudc.c
index 4c1abb1..3e5673d 100644
--- a/drivers/usb/gadget/s3c-hsudc.c
+++ b/drivers/usb/gadget/s3c-hsudc.c
@@ -1260,7 +1260,7 @@ static struct usb_gadget_ops s3c_hsudc_gadget_ops = {
 	.vbus_draw	= s3c_hsudc_vbus_draw,
 };
 
-static int s3c_hsudc_probe(struct platform_device *pdev)
+static int __devinit s3c_hsudc_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct resource *res;
-- 
1.7.5.4
