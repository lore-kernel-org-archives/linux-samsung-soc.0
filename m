From: Javier Martinez Canillas <javier@osg.samsung.com>
Subject: [RESEND RFT PATCH 2/2] mfd: max14577: Allow driver to be built as a module
Date: Thu, 26 May 2016 12:32:20 -0400
Message-ID: <1464280340-13228-3-git-send-email-javier@osg.samsung.com>
References: <1464280340-13228-1-git-send-email-javier@osg.samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1464280340-13228-1-git-send-email-javier@osg.samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: linux-samsung-soc@vger.kernel.org, Chanwoo Choi <cw00.choi@samsung.com>, Javier Martinez Canillas <javier@osg.samsung.com>, Lee Jones <lee.jones@linaro.org>
List-Id: linux-samsung-soc@vger.kernel.org

The driver's Kconfig symbol is a boolean but nothing prevents the driver
to be built as a module instead of built-in. It is true that most system
integrators will choose the latter but the config should not restrict it.

Suggested-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Signed-off-by: Javier Martinez Canillas <javier@osg.samsung.com>

---

 drivers/mfd/Kconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
index a49565cc1a6b..33d112f390fe 100644
--- a/drivers/mfd/Kconfig
+++ b/drivers/mfd/Kconfig
@@ -514,8 +514,8 @@ config MFD_88PM860X
 	  battery-charger under the corresponding menus.
 
 config MFD_MAX14577
-	bool "Maxim Semiconductor MAX14577/77836 MUIC + Charger Support"
-	depends on I2C=y
+	tristate "Maxim Semiconductor MAX14577/77836 MUIC + Charger Support"
+	depends on I2C
 	select MFD_CORE
 	select REGMAP_I2C
 	select REGMAP_IRQ
-- 
2.5.5
