From: Javier Martinez Canillas <javier@osg.samsung.com>
Subject: [RESEND RFT PATCH 1/2] mfd: max14577: Use module_init() instead of subsys_initcall()
Date: Thu, 26 May 2016 12:32:19 -0400
Message-ID: <1464280340-13228-2-git-send-email-javier@osg.samsung.com>
References: <1464280340-13228-1-git-send-email-javier@osg.samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1464280340-13228-1-git-send-email-javier@osg.samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: linux-samsung-soc@vger.kernel.org, Chanwoo Choi <cw00.choi@samsung.com>, Javier Martinez Canillas <javier@osg.samsung.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Lee Jones <lee.jones@linaro.org>
List-Id: linux-samsung-soc@vger.kernel.org

The driver's init function is called at subsys init call level but the
dependencies provided by the driver are looked up by drivers that have
probe deferral support, so manual ordering of init calls isn't needed.

Suggested-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Signed-off-by: Javier Martinez Canillas <javier@osg.samsung.com>

---
Hello,

I checked an the only users in mainline for this driver are the Exynos3250
Monk and Rinato boards. In both, only two regulators are used (safeout_reg
and motor_reg) and these are looked up by the drivers phy-samsung-usb2 and
regulator-haptic respectively, and both support probe deferral.

Best regards,
Javier

 drivers/mfd/max14577.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mfd/max14577.c b/drivers/mfd/max14577.c
index 2280b3fdcf68..6c245128ab2e 100644
--- a/drivers/mfd/max14577.c
+++ b/drivers/mfd/max14577.c
@@ -561,7 +561,7 @@ static int __init max14577_i2c_init(void)
 
 	return i2c_add_driver(&max14577_i2c_driver);
 }
-subsys_initcall(max14577_i2c_init);
+module_init(max14577_i2c_init);
 
 static void __exit max14577_i2c_exit(void)
 {
-- 
2.5.5
