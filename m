From: Padmavathi Venna <padma.v@samsung.com>
Subject: [PATCH V6 1/6] ARM: samsung: use #include for all device trees
Date: Wed, 12 Jun 2013 13:37:38 +0530
Message-ID: <1371024463-303-2-git-send-email-padma.v@samsung.com>
References: <1371024463-303-1-git-send-email-padma.v@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:51269 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751659Ab3FLIEE (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 12 Jun 2013 04:04:04 -0400
Received: from epcpsbgr1.samsung.com
 (u141.gpu120.samsung.co.kr [203.254.230.141])
 by mailout3.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MO900AGFT2PNZS0@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 12 Jun 2013 17:04:01 +0900 (KST)
In-reply-to: <1371024463-303-1-git-send-email-padma.v@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, alsa-devel@alsa-project.org, padma.v@samsung.com, padma.kvr@gmail.com
Cc: sbkim73@samsung.com, broonie@kernel.org, kgene.kim@samsung.com, mturquette@linaro.org

Replace /include/ (dtc) with #include (C pre-processor) for all
Samsung DT files

Signed-off-by: Padmavathi Venna <padma.v@samsung.com>
Reviewed-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
Reviewed-by: Doug Anderson <dianders@chromium.org>
---
 arch/arm/boot/dts/exynos4.dtsi                  |    2 +-
 arch/arm/boot/dts/exynos4210-origen.dts         |    2 +-
 arch/arm/boot/dts/exynos4210-smdkv310.dts       |    2 +-
 arch/arm/boot/dts/exynos4210-trats.dts          |    2 +-
 arch/arm/boot/dts/exynos4210-universal_c210.dts |    2 +-
 arch/arm/boot/dts/exynos4210.dtsi               |    4 ++--
 arch/arm/boot/dts/exynos4212.dtsi               |    2 +-
 arch/arm/boot/dts/exynos4412-odroidx.dts        |    2 +-
 arch/arm/boot/dts/exynos4412-origen.dts         |    2 +-
 arch/arm/boot/dts/exynos4412-smdk4412.dts       |    2 +-
 arch/arm/boot/dts/exynos4412.dtsi               |    2 +-
 arch/arm/boot/dts/exynos4x12.dtsi               |    4 ++--
 arch/arm/boot/dts/exynos5250-arndale.dts        |    2 +-
 arch/arm/boot/dts/exynos5250-smdk5250.dts       |    2 +-
 arch/arm/boot/dts/exynos5250-snow.dts           |    4 ++--
 arch/arm/boot/dts/exynos5250.dtsi               |    4 ++--
 arch/arm/boot/dts/exynos5440-sd5v1.dts          |    2 +-
 arch/arm/boot/dts/exynos5440-ssdk5440.dts       |    2 +-
 arch/arm/boot/dts/exynos5440.dtsi               |    2 +-
 arch/arm/boot/dts/s3c2416-smdk2416.dts          |    2 +-
 arch/arm/boot/dts/s3c2416.dtsi                  |    4 ++--
 arch/arm/boot/dts/s3c24xx.dtsi                  |    2 +-
 22 files changed, 27 insertions(+), 27 deletions(-)

diff --git a/arch/arm/boot/dts/exynos4.dtsi b/arch/arm/boot/dts/exynos4.dtsi
index bed40ee..3f94fe8 100644
--- a/arch/arm/boot/dts/exynos4.dtsi
+++ b/arch/arm/boot/dts/exynos4.dtsi
@@ -19,7 +19,7 @@
  * published by the Free Software Foundation.
  */
 
-/include/ "skeleton.dtsi"
+#include "skeleton.dtsi"
 
 / {
 	interrupt-parent = <&gic>;
diff --git a/arch/arm/boot/dts/exynos4210-origen.dts b/arch/arm/boot/dts/exynos4210-origen.dts
index bcf8079..5f851d7 100644
--- a/arch/arm/boot/dts/exynos4210-origen.dts
+++ b/arch/arm/boot/dts/exynos4210-origen.dts
@@ -15,7 +15,7 @@
 */
 
 /dts-v1/;
-/include/ "exynos4210.dtsi"
+#include "exynos4210.dtsi"
 
 / {
 	model = "Insignal Origen evaluation board based on Exynos4210";
diff --git a/arch/arm/boot/dts/exynos4210-smdkv310.dts b/arch/arm/boot/dts/exynos4210-smdkv310.dts
index 91332b7..9c01b71 100644
--- a/arch/arm/boot/dts/exynos4210-smdkv310.dts
+++ b/arch/arm/boot/dts/exynos4210-smdkv310.dts
@@ -15,7 +15,7 @@
 */
 
 /dts-v1/;
-/include/ "exynos4210.dtsi"
+#include "exynos4210.dtsi"
 
 / {
 	model = "Samsung smdkv310 evaluation board based on Exynos4210";
diff --git a/arch/arm/boot/dts/exynos4210-trats.dts b/arch/arm/boot/dts/exynos4210-trats.dts
index 9a14484..94eebff 100644
--- a/arch/arm/boot/dts/exynos4210-trats.dts
+++ b/arch/arm/boot/dts/exynos4210-trats.dts
@@ -13,7 +13,7 @@
 */
 
 /dts-v1/;
-/include/ "exynos4210.dtsi"
+#include "exynos4210.dtsi"
 
 / {
 	model = "Samsung Trats based on Exynos4210";
diff --git a/arch/arm/boot/dts/exynos4210-universal_c210.dts b/arch/arm/boot/dts/exynos4210-universal_c210.dts
index 345cdb5..889cdad 100644
--- a/arch/arm/boot/dts/exynos4210-universal_c210.dts
+++ b/arch/arm/boot/dts/exynos4210-universal_c210.dts
@@ -13,7 +13,7 @@
 */
 
 /dts-v1/;
-/include/ "exynos4210.dtsi"
+#include "exynos4210.dtsi"
 
 / {
 	model = "Samsung Universal C210 based on Exynos4210 rev0";
diff --git a/arch/arm/boot/dts/exynos4210.dtsi b/arch/arm/boot/dts/exynos4210.dtsi
index d4f8067..b7f358a 100644
--- a/arch/arm/boot/dts/exynos4210.dtsi
+++ b/arch/arm/boot/dts/exynos4210.dtsi
@@ -19,8 +19,8 @@
  * published by the Free Software Foundation.
 */
 
-/include/ "exynos4.dtsi"
-/include/ "exynos4210-pinctrl.dtsi"
+#include "exynos4.dtsi"
+#include "exynos4210-pinctrl.dtsi"
 
 / {
 	compatible = "samsung,exynos4210";
diff --git a/arch/arm/boot/dts/exynos4212.dtsi b/arch/arm/boot/dts/exynos4212.dtsi
index c0f60f4..6f34d7f 100644
--- a/arch/arm/boot/dts/exynos4212.dtsi
+++ b/arch/arm/boot/dts/exynos4212.dtsi
@@ -17,7 +17,7 @@
  * published by the Free Software Foundation.
 */
 
-/include/ "exynos4x12.dtsi"
+#include "exynos4x12.dtsi"
 
 / {
 	compatible = "samsung,exynos4212";
diff --git a/arch/arm/boot/dts/exynos4412-odroidx.dts b/arch/arm/boot/dts/exynos4412-odroidx.dts
index 867d945..46c678e 100644
--- a/arch/arm/boot/dts/exynos4412-odroidx.dts
+++ b/arch/arm/boot/dts/exynos4412-odroidx.dts
@@ -12,7 +12,7 @@
 */
 
 /dts-v1/;
-/include/ "exynos4412.dtsi"
+#include "exynos4412.dtsi"
 
 / {
 	model = "Hardkernel ODROID-X board based on Exynos4412";
diff --git a/arch/arm/boot/dts/exynos4412-origen.dts b/arch/arm/boot/dts/exynos4412-origen.dts
index ca73c42..7993641 100644
--- a/arch/arm/boot/dts/exynos4412-origen.dts
+++ b/arch/arm/boot/dts/exynos4412-origen.dts
@@ -13,7 +13,7 @@
 */
 
 /dts-v1/;
-/include/ "exynos4412.dtsi"
+#include "exynos4412.dtsi"
 
 / {
 	model = "Insignal Origen evaluation board based on Exynos4412";
diff --git a/arch/arm/boot/dts/exynos4412-smdk4412.dts b/arch/arm/boot/dts/exynos4412-smdk4412.dts
index a8ba195..ad316a1 100644
--- a/arch/arm/boot/dts/exynos4412-smdk4412.dts
+++ b/arch/arm/boot/dts/exynos4412-smdk4412.dts
@@ -13,7 +13,7 @@
 */
 
 /dts-v1/;
-/include/ "exynos4412.dtsi"
+#include "exynos4412.dtsi"
 
 / {
 	model = "Samsung SMDK evaluation board based on Exynos4412";
diff --git a/arch/arm/boot/dts/exynos4412.dtsi b/arch/arm/boot/dts/exynos4412.dtsi
index 270b389..e743e67 100644
--- a/arch/arm/boot/dts/exynos4412.dtsi
+++ b/arch/arm/boot/dts/exynos4412.dtsi
@@ -17,7 +17,7 @@
  * published by the Free Software Foundation.
 */
 
-/include/ "exynos4x12.dtsi"
+#include "exynos4x12.dtsi"
 
 / {
 	compatible = "samsung,exynos4412";
diff --git a/arch/arm/boot/dts/exynos4x12.dtsi b/arch/arm/boot/dts/exynos4x12.dtsi
index 35cb209..01da194 100644
--- a/arch/arm/boot/dts/exynos4x12.dtsi
+++ b/arch/arm/boot/dts/exynos4x12.dtsi
@@ -17,8 +17,8 @@
  * published by the Free Software Foundation.
 */
 
-/include/ "exynos4.dtsi"
-/include/ "exynos4x12-pinctrl.dtsi"
+#include "exynos4.dtsi"
+#include "exynos4x12-pinctrl.dtsi"
 
 / {
 	aliases {
diff --git a/arch/arm/boot/dts/exynos5250-arndale.dts b/arch/arm/boot/dts/exynos5250-arndale.dts
index c371f7c..5618131 100644
--- a/arch/arm/boot/dts/exynos5250-arndale.dts
+++ b/arch/arm/boot/dts/exynos5250-arndale.dts
@@ -10,7 +10,7 @@
 */
 
 /dts-v1/;
-/include/ "exynos5250.dtsi"
+#include "exynos5250.dtsi"
 
 / {
 	model = "Insignal Arndale evaluation board based on EXYNOS5250";
diff --git a/arch/arm/boot/dts/exynos5250-smdk5250.dts b/arch/arm/boot/dts/exynos5250-smdk5250.dts
index d53ea34..da7adbf 100644
--- a/arch/arm/boot/dts/exynos5250-smdk5250.dts
+++ b/arch/arm/boot/dts/exynos5250-smdk5250.dts
@@ -10,7 +10,7 @@
 */
 
 /dts-v1/;
-/include/ "exynos5250.dtsi"
+#include "exynos5250.dtsi"
 
 / {
 	model = "SAMSUNG SMDK5250 board based on EXYNOS5250";
diff --git a/arch/arm/boot/dts/exynos5250-snow.dts b/arch/arm/boot/dts/exynos5250-snow.dts
index d449feb..fd711e2 100644
--- a/arch/arm/boot/dts/exynos5250-snow.dts
+++ b/arch/arm/boot/dts/exynos5250-snow.dts
@@ -9,8 +9,8 @@
 */
 
 /dts-v1/;
-/include/ "exynos5250.dtsi"
-/include/ "cros5250-common.dtsi"
+#include "exynos5250.dtsi"
+#include "cros5250-common.dtsi"
 
 / {
 	model = "Google Snow";
diff --git a/arch/arm/boot/dts/exynos5250.dtsi b/arch/arm/boot/dts/exynos5250.dtsi
index 8b1f9b6..5cfc5b7 100644
--- a/arch/arm/boot/dts/exynos5250.dtsi
+++ b/arch/arm/boot/dts/exynos5250.dtsi
@@ -17,8 +17,8 @@
  * published by the Free Software Foundation.
 */
 
-/include/ "skeleton.dtsi"
-/include/ "exynos5250-pinctrl.dtsi"
+#include "skeleton.dtsi"
+#include "exynos5250-pinctrl.dtsi"
 
 / {
 	compatible = "samsung,exynos5250";
diff --git a/arch/arm/boot/dts/exynos5440-sd5v1.dts b/arch/arm/boot/dts/exynos5440-sd5v1.dts
index ef747b5..5e84c5f 100644
--- a/arch/arm/boot/dts/exynos5440-sd5v1.dts
+++ b/arch/arm/boot/dts/exynos5440-sd5v1.dts
@@ -10,7 +10,7 @@
 */
 
 /dts-v1/;
-/include/ "exynos5440.dtsi"
+#include "exynos5440.dtsi"
 
 / {
 	model = "SAMSUNG SD5v1 board based on EXYNOS5440";
diff --git a/arch/arm/boot/dts/exynos5440-ssdk5440.dts b/arch/arm/boot/dts/exynos5440-ssdk5440.dts
index d55042b..2fd6646 100644
--- a/arch/arm/boot/dts/exynos5440-ssdk5440.dts
+++ b/arch/arm/boot/dts/exynos5440-ssdk5440.dts
@@ -10,7 +10,7 @@
 */
 
 /dts-v1/;
-/include/ "exynos5440.dtsi"
+#include "exynos5440.dtsi"
 
 / {
 	model = "SAMSUNG SSDK5440 board based on EXYNOS5440";
diff --git a/arch/arm/boot/dts/exynos5440.dtsi b/arch/arm/boot/dts/exynos5440.dtsi
index 9fd7884..b41ad45 100644
--- a/arch/arm/boot/dts/exynos5440.dtsi
+++ b/arch/arm/boot/dts/exynos5440.dtsi
@@ -9,7 +9,7 @@
  * published by the Free Software Foundation.
 */
 
-/include/ "skeleton.dtsi"
+#include "skeleton.dtsi"
 
 / {
 	compatible = "samsung,exynos5440";
diff --git a/arch/arm/boot/dts/s3c2416-smdk2416.dts b/arch/arm/boot/dts/s3c2416-smdk2416.dts
index ad1dd09..59594cf 100644
--- a/arch/arm/boot/dts/s3c2416-smdk2416.dts
+++ b/arch/arm/boot/dts/s3c2416-smdk2416.dts
@@ -9,7 +9,7 @@
  */
 
 /dts-v1/;
-/include/ "s3c2416.dtsi"
+#include "s3c2416.dtsi"
 
 / {
 	model = "SMDK2416";
diff --git a/arch/arm/boot/dts/s3c2416.dtsi b/arch/arm/boot/dts/s3c2416.dtsi
index 6809324..e6555bd 100644
--- a/arch/arm/boot/dts/s3c2416.dtsi
+++ b/arch/arm/boot/dts/s3c2416.dtsi
@@ -8,8 +8,8 @@
  * published by the Free Software Foundation.
  */
 
-/include/ "s3c24xx.dtsi"
-/include/ "s3c2416-pinctrl.dtsi"
+#include "s3c24xx.dtsi"
+#include "s3c2416-pinctrl.dtsi"
 
 / {
 	model = "Samsung S3C2416 SoC";
diff --git a/arch/arm/boot/dts/s3c24xx.dtsi b/arch/arm/boot/dts/s3c24xx.dtsi
index cab46ff..2d1d7dc 100644
--- a/arch/arm/boot/dts/s3c24xx.dtsi
+++ b/arch/arm/boot/dts/s3c24xx.dtsi
@@ -8,7 +8,7 @@
  * published by the Free Software Foundation.
  */
 
-/include/ "skeleton.dtsi"
+#include "skeleton.dtsi"
 
 / {
 	compatible = "samsung,s3c24xx";
-- 
1.7.4.4
