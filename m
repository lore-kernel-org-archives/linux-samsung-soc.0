From: Vivek Gautam <gautam.vivek@samsung.com>
Subject: [PATCH v2] usb: ehci-s5p: fix: Fix null pointer dereferencing
Date: Tue, 09 Apr 2013 18:42:11 +0530
Message-ID: <1365513131-27691-1-git-send-email-gautam.vivek@samsung.com>
References: <CAFp+6iE1Ei=B7+XfZghVivwQ5zdbCnuG+F=qdLX3P19Xo9QdYg@mail.gmail.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:10080 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1759517Ab3DINOv (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 9 Apr 2013 09:14:51 -0400
In-reply-to: <CAFp+6iE1Ei=B7+XfZghVivwQ5zdbCnuG+F=qdLX3P19Xo9QdYg@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-usb@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, gregkh@linuxfoundation.org, stern@rowland.harvard.edu, kgene.kim@samsung.com, Manjunath Goudar <manjunath.goudar@linaro.org>, Arnd Bergmann <arnd@arndb.de>, Jingoo Han <jg1.han@samsung.com>

7edb3da: (USB: EHCI: make ehci-s5p a separate driver)
raised an issue with ehci-s5p's driver data.
Now that 's5p_ehci_hcd' doesn't maintain pointer to 'usb_hcd'
and s5p_ehci is nothing but a pointer to hcd->priv;
add hcd to the driver data rather than s5p_ehci.

This fixes issues with null pointer dereferencing in
s5p_ehci_shutdown(), s5p_ehci_suspend(), s5p_ehci_resume().

Signed-off-by: Vivek Gautam <gautam.vivek@samsung.com>
CC: Manjunath Goudar <manjunath.goudar@linaro.org>
CC: Arnd Bergmann <arnd@arndb.de>
CC: Jingoo Han <jg1.han@samsung.com>
---

Based on 'usb-next'

 drivers/usb/host/ehci-s5p.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/usb/host/ehci-s5p.c b/drivers/usb/host/ehci-s5p.c
index d8cb0ca..580548a 100644
--- a/drivers/usb/host/ehci-s5p.c
+++ b/drivers/usb/host/ehci-s5p.c
@@ -173,7 +173,7 @@ static int s5p_ehci_probe(struct platform_device *pdev)
 		goto fail_add_hcd;
 	}
 
-	platform_set_drvdata(pdev, s5p_ehci);
+	platform_set_drvdata(pdev, hcd);
 
 	return 0;
 
-- 
1.7.6.5
