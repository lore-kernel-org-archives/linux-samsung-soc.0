From: Tushar Behera <tushar.b@samsung.com>
Subject: [PATCH] ARM: dts: disable MDMA1 node for exynos5420
Date: Tue,  1 Jul 2014 15:37:49 +0530
Message-ID: <1404209269-652-1-git-send-email-tushar.b@samsung.com>
Return-path: <stable-owner@vger.kernel.org>
Sender: stable-owner@vger.kernel.org
To: stable@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc: gregkh@linuxfoundation.org, khilman@linaro.org, Seungwon Jeon <tgih.jun@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

From: Seungwon Jeon <tgih.jun@samsung.com>

commit e6015c1f8a9032c2aecb78d23edf49582563bd47 upstream.

This change places MDMA1 in disabled node for Exynos5420.
If MDMA1 region is configured with secure mode, it makes
the boot failure with the following on smdk5420 board.
("Unhandled fault: imprecise external abort (0x1406) at 0x00000000")
Thus, arndale-octa board don't need to do the same thing anymore.

Signed-off-by: Seungwon Jeon <tgih.jun@samsung.com>
Tested-by: Javi Merino <javi.merino@arm.com>
Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
Signed-off-by: Tushar Behera <tushar.b@samsung.com>
---

Tested on top of v3.14.10.
Fixes issue reported at [1].
[1]
http://armcloud.us/kernel-ci/stable/v3.14.10/arm-exynos_defconfig/boot-exynos5420-arndale-octa.html

 arch/arm/boot/dts/exynos5420.dtsi |    7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm/boot/dts/exynos5420.dtsi b/arch/arm/boot/dts/exynos5420.dtsi
index 8db792b..15eb8d4 100644
--- a/arch/arm/boot/dts/exynos5420.dtsi
+++ b/arch/arm/boot/dts/exynos5420.dtsi
@@ -323,6 +323,13 @@
 			#dma-cells = <1>;
 			#dma-channels = <8>;
 			#dma-requests = <1>;
+			/*
+			 * MDMA1 can support both secure and non-secure
+			 * AXI transactions. When this is enabled in the kernel
+			 * for boards that run in secure mode, we are getting
+			 * imprecise external aborts causing the kernel to oops.
+			 */
+			status = "disabled";
 		};
 	};
 
-- 
1.7.9.5
