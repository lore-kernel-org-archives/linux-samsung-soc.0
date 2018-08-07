From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH 3/4] mfd: sec-core: Fix indentation of Kconfig description
Date: Tue,  7 Aug 2018 18:11:24 +0200
Message-ID: <20180807161125.18155-3-krzk@kernel.org>
References: <20180807161125.18155-1-krzk@kernel.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180807161125.18155-1-krzk@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Lee Jones <lee.jones@linaro.org>, Chanwoo Choi <cw00.choi@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Sangbeom Kim <sbkim73@samsung.com>, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

The indentation should be a tab followed by two spaces.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 drivers/mfd/Kconfig | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
index f3fa516011ec..5810e6ff81f7 100644
--- a/drivers/mfd/Kconfig
+++ b/drivers/mfd/Kconfig
@@ -1029,10 +1029,10 @@ config MFD_SEC_CORE
 	select REGMAP_I2C
 	select REGMAP_IRQ
 	help
-	 Support for the Samsung Electronics MFD series.
-	 This driver provides common support for accessing the device,
-	 additional drivers must be enabled in order to use the functionality
-	 of the device
+	  Support for the Samsung Electronics MFD series.
+	  This driver provides common support for accessing the device,
+	  additional drivers must be enabled in order to use the functionality
+	  of the device
 
 config MFD_SI476X_CORE
 	tristate "Silicon Laboratories 4761/64/68 AM/FM radio."
-- 
2.14.1
