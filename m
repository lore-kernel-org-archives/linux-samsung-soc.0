From: Felipe Balbi <balbi@ti.com>
Subject: [RFC/PATCH 18/32] usb: gadget: mv_u3d_core: fix a compile warning
Date: Thu, 24 Jan 2013 17:45:56 +0200
Message-ID: <1359042370-4358-19-git-send-email-balbi@ti.com>
References: <1359042370-4358-1-git-send-email-balbi@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-omap-owner@vger.kernel.org>
In-Reply-To: <1359042370-4358-1-git-send-email-balbi@ti.com>
Sender: linux-omap-owner@vger.kernel.org
To: Linux USB Mailing List <linux-usb@vger.kernel.org>
Cc: alexander.shishkin@linux.intel.com, gregkh@linuxfoundation.org, dahlmann.thomas@arcor.de, nicolas.ferre@atmel.com, leoli@freescale.com, eric.y.miao@gmail.com, linux@arm.linux.org.uk, haojian.zhuang@gmail.com, ben-linux@fluff.org, kgene.kim@samsung.com, kuninori.morimoto.gx@renesas.com, yoshihiro.shimoda.uh@renesas.com, Linux OMAP Mailing List <linux-omap@vger.kernel.org>, linux-geode@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, linux-samsung-soc@vger.kernel.org, Felipe Balbi <balbi@ti.com>
List-Id: linux-samsung-soc@vger.kernel.org

Fix the following compile warning:

mv_u3d_core.c:1766:12: warning: 'mv_u3d_remove' \
	defined but not used [-Wunused-function]

Signed-off-by: Felipe Balbi <balbi@ti.com>
---
 drivers/usb/gadget/mv_u3d_core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/gadget/mv_u3d_core.c b/drivers/usb/gadget/mv_u3d_core.c
index 565addc..734ade1 100644
--- a/drivers/usb/gadget/mv_u3d_core.c
+++ b/drivers/usb/gadget/mv_u3d_core.c
@@ -2072,7 +2072,7 @@ static void mv_u3d_shutdown(struct platform_device *dev)
 
 static struct platform_driver mv_u3d_driver = {
 	.probe		= mv_u3d_probe,
-	.remove		= __exit_p(mv_u3d_remove),
+	.remove		= mv_u3d_remove,
 	.shutdown	= mv_u3d_shutdown,
 	.driver		= {
 		.owner	= THIS_MODULE,
-- 
1.8.1.rc1.5.g7e0651a

