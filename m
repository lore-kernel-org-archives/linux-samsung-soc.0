From: Karol Lewandowski <k.lewandowsk-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH 03/13] s5p-g2d: Make it possible to instantiate driver from DT
Date: Thu, 12 Apr 2012 20:45:22 +0200
Message-ID: <1334256332-29867-4-git-send-email-k.lewandowsk@samsung.com>
References: <1334256332-29867-1-git-send-email-k.lewandowsk@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-reply-to: <1334256332-29867-1-git-send-email-k.lewandowsk-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Kamil Debski <k.debski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, Karol Lewandowski <k.lewandowsk-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

This driver requires standard properties like (address and irq)
which are automatically marshalled for drivers by OF core.

Signed-off-by: Karol Lewandowski <k.lewandowsk-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Signed-off-by: Kyungmin Park <kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: Kamil Debski <k.debski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
---
 .../devicetree/bindings/arm/trivial-devices.txt    |    1 +
 drivers/media/video/s5p-g2d/g2d.c                  |   10 ++++++++++
 2 files changed, 11 insertions(+), 0 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/trivial-devices.txt b/Documentation/devicetree/bindings/arm/trivial-devices.txt
index 443814a..d0f6c45 100644
--- a/Documentation/devicetree/bindings/arm/trivial-devices.txt
+++ b/Documentation/devicetree/bindings/arm/trivial-devices.txt
@@ -8,3 +8,4 @@ document for it just like any other devices.
 
 Compatible                      Vendor / Chip
 ========================        =============
+samsung,s5pv210-g2d		2D graphics accelerator found on s5pv210+ SoCs
diff --git a/drivers/media/video/s5p-g2d/g2d.c b/drivers/media/video/s5p-g2d/g2d.c
index 789de74..96fd584 100644
--- a/drivers/media/video/s5p-g2d/g2d.c
+++ b/drivers/media/video/s5p-g2d/g2d.c
@@ -20,6 +20,7 @@
 #include <linux/interrupt.h>
 
 #include <linux/platform_device.h>
+#include <linux/of.h>
 #include <media/v4l2-mem2mem.h>
 #include <media/v4l2-device.h>
 #include <media/v4l2-ioctl.h>
@@ -832,12 +833,21 @@ static int g2d_remove(struct platform_device *pdev)
 	return 0;
 }
 
+#ifdef CONFIG_OF
+static struct of_device_id g2d_dt_match[] = {
+	{ .compatible = "samsung,s5pv210-g2d" },
+	{},
+};
+MODULE_DEVICE_TABLE(of, g2d_dt_match);
+#endif
+
 static struct platform_driver g2d_pdrv = {
 	.probe		= g2d_probe,
 	.remove		= g2d_remove,
 	.driver		= {
 		.name = G2D_NAME,
 		.owner = THIS_MODULE,
+		.of_match_table = of_match_ptr(g2d_dt_match),
 	},
 };
 
-- 
1.7.9.1
