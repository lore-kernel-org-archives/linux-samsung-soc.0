From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH 5/9] usb: dwc2/gadget: move setting last reset time to
 s3c_hsotg_core_init
Date: Thu, 16 Oct 2014 14:58:01 +0200
Message-ID: <1413464285-24172-6-git-send-email-m.szyprowski@samsung.com>
References: <1413464285-24172-1-git-send-email-m.szyprowski@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:54147 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751704AbaJPM6f (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 16 Oct 2014 08:58:35 -0400
In-reply-to: <1413464285-24172-1-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-usb@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Robert Baldyga <r.baldyga@samsung.com>, Paul Zimmerman <paulz@synopsys.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>

This patch removes duplicated code and sets last_rst variable in the
function which does the hardware reset.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 drivers/usb/dwc2/gadget.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/dwc2/gadget.c b/drivers/usb/dwc2/gadget.c
index 178a6ea5eef8..1ba0682fb252 100644
--- a/drivers/usb/dwc2/gadget.c
+++ b/drivers/usb/dwc2/gadget.c
@@ -2247,6 +2247,8 @@ static void s3c_hsotg_core_init(struct s3c_hsotg *hsotg)
 	/* must be at-least 3ms to allow bus to see disconnect */
 	mdelay(3);
 
+	hsotg->last_rst = jiffies;
+
 	/* remove the soft-disconnect and let's go */
 	__bic32(hsotg->regs + DCTL, DCTL_SFTDISCON);
 }
@@ -2347,7 +2349,6 @@ irq_retry:
 							  -ECONNRESET, true);
 
 				s3c_hsotg_core_init(hsotg);
-				hsotg->last_rst = jiffies;
 			}
 		}
 	}
@@ -2908,7 +2909,6 @@ static int s3c_hsotg_udc_start(struct usb_gadget *gadget,
 		goto err;
 	}
 
-	hsotg->last_rst = jiffies;
 	dev_info(hsotg->dev, "bound driver %s\n", driver->driver.name);
 	return 0;
 
@@ -3669,7 +3669,6 @@ static int s3c_hsotg_resume(struct platform_device *pdev)
 	}
 
 	spin_lock_irqsave(&hsotg->lock, flags);
-	hsotg->last_rst = jiffies;
 	s3c_hsotg_phy_enable(hsotg);
 	s3c_hsotg_core_init(hsotg);
 	spin_unlock_irqrestore(&hsotg->lock, flags);
-- 
1.9.2
