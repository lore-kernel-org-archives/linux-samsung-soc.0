From: Jingoo Han <jg1.han@samsung.com>
Subject: [PATCH 5/5] USB: ohci-exynos: Add missing usb_put_hcd() to prevent
 memory leak
Date: Thu, 10 Oct 2013 15:32:42 +0900
Message-ID: <000b01cec582$85c73b50$9155b1f0$%han@samsung.com>
References: <000001cec582$02a6cfb0$07f46f10$%han@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:9477 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751491Ab3JJGcn (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 10 Oct 2013 02:32:43 -0400
In-reply-to: <000001cec582$02a6cfb0$07f46f10$%han@samsung.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Greg Kroah-Hartman' <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 'Kukjin Kim' <kgene.kim@samsung.com>, 'Alan Stern' <stern@rowland.harvard.edu>, 'Sylwester Nawrocki' <s.nawrocki@samsung.com>, 'Tomasz Figa' <t.figa@samsung.com>, 'Jingoo Han' <jg1.han@samsung.com>

When devm_usb_get_phy() fails, usb_put_hcd() should be called
to prevent memory leak.

Signed-off-by: Jingoo Han <jg1.han@samsung.com>
---
 drivers/usb/host/ohci-exynos.c |    1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/usb/host/ohci-exynos.c b/drivers/usb/host/ohci-exynos.c
index 5c877bf..aa50e18 100644
--- a/drivers/usb/host/ohci-exynos.c
+++ b/drivers/usb/host/ohci-exynos.c
@@ -91,6 +91,7 @@ static int exynos_ohci_probe(struct platform_device *pdev)
 
 	phy = devm_usb_get_phy(&pdev->dev, USB_PHY_TYPE_USB2);
 	if (IS_ERR(phy)) {
+		usb_put_hcd(hcd);
 		dev_warn(&pdev->dev, "no platform data or transceiver defined\n");
 		return -EPROBE_DEFER;
 	} else {
-- 
1.7.10.4
