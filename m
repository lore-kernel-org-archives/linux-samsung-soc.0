From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH] phy: samsung: disable bind/unbind platform driver feature
Date: Fri, 19 Jul 2019 14:25:32 +0200
Message-ID: <20190719122532.29591-1-m.szyprowski@samsung.com>
References: <CGME20190719122541eucas1p2448ec705f84347c0a79732883daeb2b4@eucas1p2.samsung.com>
Content-Type: text/plain; charset="utf-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-usb@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Kishon Vijay Abraham I <kishon@ti.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>
List-Id: linux-samsung-soc@vger.kernel.org

Samsung PHY drivers control the power to the SoC core components needed by
their client devices (USB HCDs, SATA, camera ISP bridge, DP encoder) to
properly operate. Disabling PHYs in runtime usually causes the client
device to crash with external abort exception or similar issue due to lack
of API to notify clients about PHY removal. This patch removes the
possiblity to unbind Samsung Exynos PHY drivers in runtime.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 drivers/phy/samsung/phy-exynos-dp-video.c   | 1 +
 drivers/phy/samsung/phy-exynos-mipi-video.c | 1 +
 drivers/phy/samsung/phy-exynos-pcie.c       | 1 +
 drivers/phy/samsung/phy-exynos5-usbdrd.c    | 1 +
 drivers/phy/samsung/phy-exynos5250-sata.c   | 1 +
 drivers/phy/samsung/phy-samsung-usb2.c      | 1 +
 6 files changed, 6 insertions(+)

diff --git a/drivers/phy/samsung/phy-exynos-dp-video.c b/drivers/phy/samsung/phy-exynos-dp-video.c
index aebd216dcf2f..6c607df1dc9a 100644
--- a/drivers/phy/samsung/phy-exynos-dp-video.c
+++ b/drivers/phy/samsung/phy-exynos-dp-video.c
@@ -109,6 +109,7 @@ static struct platform_driver exynos_dp_video_phy_driver = {
 	.driver = {
 		.name	= "exynos-dp-video-phy",
 		.of_match_table	= exynos_dp_video_phy_of_match,
+		.suppress_bind_attrs = true,
 	}
 };
 module_platform_driver(exynos_dp_video_phy_driver);
diff --git a/drivers/phy/samsung/phy-exynos-mipi-video.c b/drivers/phy/samsung/phy-exynos-mipi-video.c
index 3784bf100b95..bb51195f189f 100644
--- a/drivers/phy/samsung/phy-exynos-mipi-video.c
+++ b/drivers/phy/samsung/phy-exynos-mipi-video.c
@@ -359,6 +359,7 @@ static struct platform_driver exynos_mipi_video_phy_driver = {
 	.driver = {
 		.of_match_table	= exynos_mipi_video_phy_of_match,
 		.name  = "exynos-mipi-video-phy",
+		.suppress_bind_attrs = true,
 	}
 };
 module_platform_driver(exynos_mipi_video_phy_driver);
diff --git a/drivers/phy/samsung/phy-exynos-pcie.c b/drivers/phy/samsung/phy-exynos-pcie.c
index 1b4ba8bdb43c..659e7ae0a6cf 100644
--- a/drivers/phy/samsung/phy-exynos-pcie.c
+++ b/drivers/phy/samsung/phy-exynos-pcie.c
@@ -272,6 +272,7 @@ static struct platform_driver exynos_pcie_phy_driver = {
 	.driver = {
 		.of_match_table	= exynos_pcie_phy_match,
 		.name		= "exynos_pcie_phy",
+		.suppress_bind_attrs = true,
 	}
 };
 
diff --git a/drivers/phy/samsung/phy-exynos5-usbdrd.c b/drivers/phy/samsung/phy-exynos5-usbdrd.c
index f07edd80d2f3..7f6279fb4f8f 100644
--- a/drivers/phy/samsung/phy-exynos5-usbdrd.c
+++ b/drivers/phy/samsung/phy-exynos5-usbdrd.c
@@ -955,6 +955,7 @@ static struct platform_driver exynos5_usb3drd_phy = {
 	.driver = {
 		.of_match_table	= exynos5_usbdrd_phy_of_match,
 		.name		= "exynos5_usb3drd_phy",
+		.suppress_bind_attrs = true,
 	}
 };
 
diff --git a/drivers/phy/samsung/phy-exynos5250-sata.c b/drivers/phy/samsung/phy-exynos5250-sata.c
index 9e5fc126032c..4dd7324d91b2 100644
--- a/drivers/phy/samsung/phy-exynos5250-sata.c
+++ b/drivers/phy/samsung/phy-exynos5250-sata.c
@@ -237,6 +237,7 @@ static struct platform_driver exynos_sata_phy_driver = {
 	.driver = {
 		.of_match_table	= exynos_sata_phy_of_match,
 		.name  = "samsung,sata-phy",
+		.suppress_bind_attrs = true,
 	}
 };
 module_platform_driver(exynos_sata_phy_driver);
diff --git a/drivers/phy/samsung/phy-samsung-usb2.c b/drivers/phy/samsung/phy-samsung-usb2.c
index 6c82f4fbe8a2..090aa02e02de 100644
--- a/drivers/phy/samsung/phy-samsung-usb2.c
+++ b/drivers/phy/samsung/phy-samsung-usb2.c
@@ -250,6 +250,7 @@ static struct platform_driver samsung_usb2_phy_driver = {
 	.driver = {
 		.of_match_table	= samsung_usb2_phy_of_match,
 		.name		= "samsung-usb2-phy",
+		.suppress_bind_attrs = true,
 	}
 };
 
-- 
2.17.1
