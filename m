From: YueHaibing <yuehaibing@huawei.com>
Subject: [PATCH -next] usb: ohci-s3c2410: Remove set but not used variable 'hcd'
Date: Tue, 28 May 2019 21:43:05 +0800
Message-ID: <20190528134305.10184-1-yuehaibing@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: stern@rowland.harvard.edu, kgene@kernel.org, krzk@kernel.org, gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, YueHaibing <yuehaibing@huawei.com>
List-Id: linux-samsung-soc@vger.kernel.org

Fixes gcc '-Wunused-but-set-variable' warning:

drivers/usb/host/ohci-s3c2410.c: In function s3c2410_hcd_oc:
drivers/usb/host/ohci-s3c2410.c:296:18: warning: variable hcd set but not used [-Wunused-but-set-variable]

It is never used, so can be removed.

Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 drivers/usb/host/ohci-s3c2410.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/usb/host/ohci-s3c2410.c b/drivers/usb/host/ohci-s3c2410.c
index 4511e27e9da8..d961097c90f0 100644
--- a/drivers/usb/host/ohci-s3c2410.c
+++ b/drivers/usb/host/ohci-s3c2410.c
@@ -293,7 +293,6 @@ static int ohci_s3c2410_hub_control(
 static void s3c2410_hcd_oc(struct s3c2410_hcd_info *info, int port_oc)
 {
 	struct s3c2410_hcd_port *port;
-	struct usb_hcd *hcd;
 	unsigned long flags;
 	int portno;
 
@@ -301,7 +300,6 @@ static void s3c2410_hcd_oc(struct s3c2410_hcd_info *info, int port_oc)
 		return;
 
 	port = &info->port[0];
-	hcd = info->hcd;
 
 	local_irq_save(flags);
 
-- 
2.17.1
