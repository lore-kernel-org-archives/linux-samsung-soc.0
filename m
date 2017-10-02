From: SF Markus Elfring <elfring@users.sourceforge.net>
Subject: [PATCH 1/2] ARM: s3c64xx: Delete two error messages for a failed
 memory allocation in samsung_bl_set()
Date: Mon, 2 Oct 2017 22:39:56 +0200
Message-ID: <7f06d074-231b-85b9-3649-304edce6bc2c@users.sourceforge.net>
References: <0b695686-2e07-910d-6278-91d54a1b0b2f@users.sourceforge.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <0b695686-2e07-910d-6278-91d54a1b0b2f@users.sourceforge.net>
Content-Language: en-GB
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, Kukjin Kim <kgene@kernel.org>, Russell King <linux@armlinux.org.uk>
Cc: kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
List-Id: linux-samsung-soc@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 2 Oct 2017 22:20:39 +0200

Omit extra messages for a memory allocation failure in this function.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 arch/arm/mach-s3c64xx/dev-backlight.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/arch/arm/mach-s3c64xx/dev-backlight.c b/arch/arm/mach-s3c64xx/dev-backlight.c
index e62e789f9aee..7e2db762c442 100644
--- a/arch/arm/mach-s3c64xx/dev-backlight.c
+++ b/arch/arm/mach-s3c64xx/dev-backlight.c
@@ -94,17 +94,14 @@ void __init samsung_bl_set(struct samsung_bl_gpio_info *gpio_info,
 
 	samsung_bl_device = kmemdup(&samsung_dfl_bl_device,
 			sizeof(struct platform_device), GFP_KERNEL);
-	if (!samsung_bl_device) {
-		printk(KERN_ERR "%s: no memory for platform dev\n", __func__);
+	if (!samsung_bl_device)
 		return;
-	}
 
 	samsung_bl_drvdata = kmemdup(&samsung_dfl_bl_data,
 				sizeof(samsung_dfl_bl_data), GFP_KERNEL);
-	if (!samsung_bl_drvdata) {
-		printk(KERN_ERR "%s: no memory for platform dev\n", __func__);
+	if (!samsung_bl_drvdata)
 		goto err_data;
-	}
+
 	samsung_bl_device->dev.platform_data = &samsung_bl_drvdata->plat_data;
 	samsung_bl_drvdata->gpio_info = gpio_info;
 	samsung_bl_data = &samsung_bl_drvdata->plat_data;
-- 
2.14.2
