From: Heiko =?iso-8859-1?q?St=FCbner?= <heiko@sntech.de>
Subject: [PATCH 7/8] s3c-hsudc: use release_mem_region instead of release_resource
Date: Mon, 19 Dec 2011 19:42:52 +0100
Message-ID: <201112191942.52629.heiko@sntech.de>
References: <201112191938.22254.heiko@sntech.de>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from s15407518.onlinehome-server.info ([82.165.136.167]:49338 "EHLO
	s15407518.onlinehome-server.info" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1752062Ab1LSSnA (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 19 Dec 2011 13:43:00 -0500
In-Reply-To: <201112191938.22254.heiko@sntech.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Felipe Balbi <balbi@ti.com>, Kukjin Kim <kgene.kim@samsung.com>, 'Ben Dooks' <ben-linux@fluff.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Linux USB Mailing List <linux-usb@vger.kernel.org>

As the memory region is requested through request_mem_region
use the correct paired method to release it in the error path
and don't go "beneath the API" as pointed out by Russel King.

Signed-off-by: Heiko Stuebner <heiko@sntech.de>
---
 drivers/usb/gadget/s3c-hsudc.c |    4 +---
 1 files changed, 1 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/gadget/s3c-hsudc.c b/drivers/usb/gadget/s3c-hsudc.c
index c8ac13a..8e69758 100644
--- a/drivers/usb/gadget/s3c-hsudc.c
+++ b/drivers/usb/gadget/s3c-hsudc.c
@@ -1376,9 +1376,7 @@ err_irq:
 	iounmap(hsudc->regs);
 
 err_remap:
-	release_resource(hsudc->mem_rsrc);
-	kfree(hsudc->mem_rsrc);
-
+	release_mem_region(res->start, resource_size(res));
 err_res:
 	if (hsudc->transceiver)
 		otg_put_transceiver(hsudc->transceiver);
-- 
1.7.2.3
