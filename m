From: Axel Lin <axel.lin@ingics.com>
Subject: [PATCH] phy: samsung-usb2: Remove NULL terminating entry from phys
 array
Date: Tue, 03 Mar 2015 09:08:43 +0800
Message-ID: <1425344923.4315.3.camel@phoenix>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Kishon Vijay Abraham I <kishon@ti.com>
Cc: Kamil Debski <k.debski@samsung.com>, Kukjin Kim <kgene@kernel.org>, linux-kernel@vger.kernel.org, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>
List-Id: linux-samsung-soc@vger.kernel.org

Current code uses num_phys settings to tell the number of entries in phys.
Thus remove the NULL terminating entry from phys array which is not necessary.

Signed-off-by: Axel Lin <axel.lin@ingics.com>
---
 drivers/phy/phy-exynos4210-usb2.c | 1 -
 drivers/phy/phy-exynos4x12-usb2.c | 1 -
 drivers/phy/phy-exynos5250-usb2.c | 1 -
 3 files changed, 3 deletions(-)

diff --git a/drivers/phy/phy-exynos4210-usb2.c b/drivers/phy/phy-exynos4210-usb2.c
index 236a52a..f30bbb0 100644
--- a/drivers/phy/phy-exynos4210-usb2.c
+++ b/drivers/phy/phy-exynos4210-usb2.c
@@ -250,7 +250,6 @@ static const struct samsung_usb2_common_phy exynos4210_phys[] = {
 		.power_on	= exynos4210_power_on,
 		.power_off	= exynos4210_power_off,
 	},
-	{},
 };
 
 const struct samsung_usb2_phy_config exynos4210_usb2_phy_config = {
diff --git a/drivers/phy/phy-exynos4x12-usb2.c b/drivers/phy/phy-exynos4x12-usb2.c
index 0b9de88..765da90 100644
--- a/drivers/phy/phy-exynos4x12-usb2.c
+++ b/drivers/phy/phy-exynos4x12-usb2.c
@@ -361,7 +361,6 @@ static const struct samsung_usb2_common_phy exynos4x12_phys[] = {
 		.power_on	= exynos4x12_power_on,
 		.power_off	= exynos4x12_power_off,
 	},
-	{},
 };
 
 const struct samsung_usb2_phy_config exynos3250_usb2_phy_config = {
diff --git a/drivers/phy/phy-exynos5250-usb2.c b/drivers/phy/phy-exynos5250-usb2.c
index 1c139aa..2ed1735 100644
--- a/drivers/phy/phy-exynos5250-usb2.c
+++ b/drivers/phy/phy-exynos5250-usb2.c
@@ -391,7 +391,6 @@ static const struct samsung_usb2_common_phy exynos5250_phys[] = {
 		.power_on	= exynos5250_power_on,
 		.power_off	= exynos5250_power_off,
 	},
-	{},
 };
 
 const struct samsung_usb2_phy_config exynos5250_usb2_phy_config = {
-- 
1.9.1
