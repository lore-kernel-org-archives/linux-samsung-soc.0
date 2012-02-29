From: Sangwook Lee <sangwook.lee@linaro.org>
Subject: [PATCH 2/2] USB: ehci-s5p: add function for burst
Date: Wed, 29 Feb 2012 12:41:23 +0000
Message-ID: <1330519283-4722-3-git-send-email-sangwook.lee@linaro.org>
References: <1330519283-4722-1-git-send-email-sangwook.lee@linaro.org>
Mime-Version: 1.0
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wi0-f174.google.com ([209.85.212.174]:49528 "EHLO
	mail-wi0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752272Ab2B2Mnc (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 29 Feb 2012 07:43:32 -0500
Received: by wibhm11 with SMTP id hm11so2657193wib.19
        for <linux-samsung-soc@vger.kernel.org>; Wed, 29 Feb 2012 04:43:31 -0800 (PST)
In-Reply-To: <1330519283-4722-1-git-send-email-sangwook.lee@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: ben-linux@fluff.org, gregkh@suse.de, kgene.kim@samsung.com, stern@rowland.harvard.edu, jg1.han@samsung.com, jy0922.shim@samsung.com, patches@linaro.org, linaro-dev@lists.linaro.org, linux@arm.linux.org.uk, Sangwook Lee <sangwook.lee@linaro.org>

Add platform specific function for EHCI burst function

Signed-off-by: Sangwook Lee <sangwook.lee@linaro.org>
---
 drivers/usb/host/ehci-s5p.c |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/drivers/usb/host/ehci-s5p.c b/drivers/usb/host/ehci-s5p.c
index 293f741..c5eb0ce 100644
--- a/drivers/usb/host/ehci-s5p.c
+++ b/drivers/usb/host/ehci-s5p.c
@@ -134,6 +134,9 @@ static int __devinit s5p_ehci_probe(struct platform_device *pdev)
 	/* cache this readonly data; minimize chip reads */
 	ehci->hcs_params = readl(&ehci->caps->hcs_params);
 
+	if (pdata->burst_enable)
+		pdata->burst_enable(pdev, hcd->regs);
+
 	ehci_reset(ehci);
 
 	err = usb_add_hcd(hcd, irq, IRQF_SHARED);
-- 
1.7.4.1
