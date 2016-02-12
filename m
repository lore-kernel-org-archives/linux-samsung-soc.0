From: Javier Martinez Canillas <javier@osg.samsung.com>
Subject: [PATCH 3/4] mfd: max77686: Allow driver to be built as a module
Date: Fri, 12 Feb 2016 01:30:18 -0300
Message-ID: <1455251419-8919-4-git-send-email-javier@osg.samsung.com>
References: <1455251419-8919-1-git-send-email-javier@osg.samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1455251419-8919-1-git-send-email-javier@osg.samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Andi Shyti <andi.shyti@samsung.com>, linux-samsung-soc@vger.kernel.org, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Lee Jones <lee.jones@linaro.org>, Laxman Dewangan <ldewangan@nvidia.com>, Javier Martinez Canillas <javier@osg.samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

The driver's Kconfig symbol is a boolean but nothing prevents the driver
to be built as a module instead of built-in. It is true that most system
integrators will choose the latter but the config should not restrict it.

Signed-off-by: Javier Martinez Canillas <javier@osg.samsung.com>
---

 drivers/mfd/Kconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
index 6c4ebd9f4cb6..005ace26230e 100644
--- a/drivers/mfd/Kconfig
+++ b/drivers/mfd/Kconfig
@@ -493,8 +493,8 @@ config MFD_MAX14577
 	  of the device.
 
 config MFD_MAX77686
-	bool "Maxim Semiconductor MAX77686/802 PMIC Support"
-	depends on I2C=y
+	tristate "Maxim Semiconductor MAX77686/802 PMIC Support"
+	depends on I2C
 	depends on OF
 	select MFD_CORE
 	select REGMAP_I2C
-- 
2.5.0
