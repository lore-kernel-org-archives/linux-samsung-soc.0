From: Heiko =?iso-8859-1?q?St=FCbner?= <heiko@sntech.de>
Subject: [PATCH 4/7] s3c-hsudc: add missing otg_put_transceiver in probe
Date: Sat, 17 Dec 2011 20:27:11 +0100
Message-ID: <201112172027.11936.heiko@sntech.de>
References: <201112172023.05519.heiko@sntech.de>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from s15407518.onlinehome-server.info ([82.165.136.167]:37033 "EHLO
	s15407518.onlinehome-server.info" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1752404Ab1LQT1Q (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 17 Dec 2011 14:27:16 -0500
In-Reply-To: <201112172023.05519.heiko@sntech.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Felipe Balbi <balbi@ti.com>, Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-usb@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Thomas Abraham <thomas.abraham@linaro.org>

The number of get and put calls should always be equal.

Signed-off-by: Heiko Stuebner <heiko@sntech.de>
---
 drivers/usb/gadget/s3c-hsudc.c |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/drivers/usb/gadget/s3c-hsudc.c b/drivers/usb/gadget/s3c-hsudc.c
index 7cb0850..06ca8c4 100644
--- a/drivers/usb/gadget/s3c-hsudc.c
+++ b/drivers/usb/gadget/s3c-hsudc.c
@@ -1366,6 +1366,9 @@ err_remap:
 	kfree(hsudc->mem_rsrc);
 
 err_res:
+	if (hsudc->transceiver)
+		otg_put_transceiver(hsudc->transceiver);
+
 	kfree(hsudc);
 	return ret;
 }
-- 
1.7.2.3
