From: Vivek Gautam <gautam.vivek@samsung.com>
Subject: [PATCH v2 1/2] usb: ehci-exynos: Return immediately from suspend if ehci_suspend fails
Date: Thu, 10 Apr 2014 15:58:01 +0530
Message-ID: <1397125682-4955-1-git-send-email-gautam.vivek@samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-usb@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: gregkh@linuxfoundation.org, kgene.kim@samsung.com, jg1.han@samsung.com, Alan Stern <stern@rowland.harvard.edu>
List-Id: linux-samsung-soc@vger.kernel.org

Patch 'b8efdaf USB: EHCI: add check for wakeup/suspend race'
adds a check for possible race between suspend and wakeup interrupt,
and thereby it returns -EBUSY as error code if there's a wakeup
interrupt.
So the platform host controller should not proceed further with
its suspend callback, rather should return immediately to avoid
powering down the essential things, like phy.

Signed-off-by: Vivek Gautam <gautam.vivek@samsung.com>
Acked-by: Jingoo Han <jg1.han@samsung.com>
Cc: Alan Stern <stern@rowland.harvard.edu>
---

Changes from v1:
-- Removed unnecessary change 'return 0'

 drivers/usb/host/ehci-exynos.c |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/usb/host/ehci-exynos.c b/drivers/usb/host/ehci-exynos.c
index d1d8c47..7f425ac 100644
--- a/drivers/usb/host/ehci-exynos.c
+++ b/drivers/usb/host/ehci-exynos.c
@@ -212,6 +212,8 @@ static int exynos_ehci_suspend(struct device *dev)
 	int rc;
 
 	rc = ehci_suspend(hcd, do_wakeup);
+	if (rc)
+		return rc;
 
 	if (exynos_ehci->otg)
 		exynos_ehci->otg->set_host(exynos_ehci->otg, &hcd->self);
-- 
1.7.10.4
