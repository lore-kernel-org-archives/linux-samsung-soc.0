From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: [PATCH 1/9] ARM: dts: exynos: Add macros for GPIO configuration
Date: Wed, 31 Aug 2016 14:13:25 +0200
Message-ID: <1472645613-5362-2-git-send-email-k.kozlowski@samsung.com>
References: <1472645613-5362-1-git-send-email-k.kozlowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-reply-to: <1472645613-5362-1-git-send-email-k.kozlowski@samsung.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Javier Martinez Canillas <javier@osg.samsung.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

Add macros for replacing hard-coded GPIO configuration: pull up/down,
drive strength and function.

Although PIN_FUNC_SPC_2 does not bring much information about the
function itself, it still is more descriptive then hard-coded
number <2>.

Signed-off-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
---
 arch/arm/boot/dts/exynos3250-pinctrl.dtsi |  5 +++++
 arch/arm/boot/dts/exynos4210-pinctrl.dtsi | 17 +++++++++++++++++
 arch/arm/boot/dts/exynos4415-pinctrl.dtsi | 17 +++++++++++++++++
 arch/arm/boot/dts/exynos4x12-pinctrl.dtsi | 13 +++++++++++++
 arch/arm/boot/dts/exynos5250-pinctrl.dtsi | 17 +++++++++++++++++
 arch/arm/boot/dts/exynos5260-pinctrl.dtsi | 17 ++++++++++++++---
 arch/arm/boot/dts/exynos5410-pinctrl.dtsi | 16 ++++++++++++++++
 arch/arm/boot/dts/exynos5420-pinctrl.dtsi | 17 +++++++++++++++++
 8 files changed, 116 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/exynos3250-pinctrl.dtsi b/arch/arm/boot/dts/exynos3250-pinctrl.dtsi
index 40ea7de44933..645bc3669554 100644
--- a/arch/arm/boot/dts/exynos3250-pinctrl.dtsi
+++ b/arch/arm/boot/dts/exynos3250-pinctrl.dtsi
@@ -26,6 +26,11 @@
 #define PIN_PDN_INPUT		2
 #define PIN_PDN_PREV		3
 
+#define PIN_FUNC_INPUT		0
+#define PIN_FUNC_SPC_2		2
+#define PIN_FUNC_SPC_3		3
+#define PIN_FUNC_SPC_4		4
+
 #define PIN_IN(_pin, _pull, _drv)			\
 	_pin {						\
 		samsung,pins = #_pin;			\
diff --git a/arch/arm/boot/dts/exynos4210-pinctrl.dtsi b/arch/arm/boot/dts/exynos4210-pinctrl.dtsi
index 9331c6252eff..21129263e4e5 100644
--- a/arch/arm/boot/dts/exynos4210-pinctrl.dtsi
+++ b/arch/arm/boot/dts/exynos4210-pinctrl.dtsi
@@ -14,6 +14,23 @@
  * published by the Free Software Foundation.
 */
 
+#define PIN_PULL_NONE		0
+#define PIN_PULL_DOWN		1
+#define PIN_PULL_UP		3
+
+#define PIN_DRV_LV1		0
+#define PIN_DRV_LV2		2
+#define PIN_DRV_LV3		1
+#define PIN_DRV_LV4		3
+
+#define PIN_FUNC_INPUT		0
+#define PIN_FUNC_OUTPUT		1
+#define PIN_FUNC_SPC_2		2
+#define PIN_FUNC_SPC_3		3
+#define PIN_FUNC_SPC_4		4
+#define PIN_FUNC_SPC_5		5
+#define PIN_FUNC_SPC_F		0xf
+
 / {
 	pinctrl@11400000 {
 		gpa0: gpa0 {
diff --git a/arch/arm/boot/dts/exynos4415-pinctrl.dtsi b/arch/arm/boot/dts/exynos4415-pinctrl.dtsi
index 75af9c56123e..ae9d140a24d1 100644
--- a/arch/arm/boot/dts/exynos4415-pinctrl.dtsi
+++ b/arch/arm/boot/dts/exynos4415-pinctrl.dtsi
@@ -11,6 +11,23 @@
  * published by the Free Software Foundation.
 */
 
+#define PIN_PULL_NONE		0
+#define PIN_PULL_DOWN		1
+#define PIN_PULL_UP		3
+
+#define PIN_DRV_LV1		0
+#define PIN_DRV_LV2		2
+#define PIN_DRV_LV3		1
+#define PIN_DRV_LV4		3
+
+#define PIN_FUNC_INPUT		0
+#define PIN_FUNC_OUTPUT		1
+#define PIN_FUNC_SPC_2		2
+#define PIN_FUNC_SPC_3		3
+#define PIN_FUNC_SPC_4		4
+#define PIN_FUNC_SPC_5		5
+#define PIN_FUNC_SPC_F		0xf
+
 &pinctrl_0 {
 	gpa0: gpa0 {
 		gpio-controller;
diff --git a/arch/arm/boot/dts/exynos4x12-pinctrl.dtsi b/arch/arm/boot/dts/exynos4x12-pinctrl.dtsi
index 856b29254374..ba5865208d3e 100644
--- a/arch/arm/boot/dts/exynos4x12-pinctrl.dtsi
+++ b/arch/arm/boot/dts/exynos4x12-pinctrl.dtsi
@@ -16,11 +16,24 @@
 #define PIN_PULL_DOWN		1
 #define PIN_PULL_UP		3
 
+#define PIN_DRV_LV1		0
+#define PIN_DRV_LV2		2
+#define PIN_DRV_LV3		1
+#define PIN_DRV_LV4		3
+
 #define PIN_PDN_OUT0		0
 #define PIN_PDN_OUT1		1
 #define PIN_PDN_INPUT		2
 #define PIN_PDN_PREV		3
 
+#define PIN_FUNC_INPUT		0
+#define PIN_FUNC_OUTPUT		1
+#define PIN_FUNC_SPC_2		2
+#define PIN_FUNC_SPC_3		3
+#define PIN_FUNC_SPC_4		4
+#define PIN_FUNC_SPC_5		5
+#define PIN_FUNC_SPC_F		0xf
+
 #define PIN_SLP(_pin, _mode, _pull)				\
 	_pin {							\
 		samsung,pins = #_pin;				\
diff --git a/arch/arm/boot/dts/exynos5250-pinctrl.dtsi b/arch/arm/boot/dts/exynos5250-pinctrl.dtsi
index 880917e508b2..5563dd80d4d0 100644
--- a/arch/arm/boot/dts/exynos5250-pinctrl.dtsi
+++ b/arch/arm/boot/dts/exynos5250-pinctrl.dtsi
@@ -12,6 +12,23 @@
  * published by the Free Software Foundation.
 */
 
+#define PIN_PULL_NONE		0
+#define PIN_PULL_DOWN		1
+#define PIN_PULL_UP		3
+
+#define PIN_DRV_LV1		0
+#define PIN_DRV_LV2		2
+#define PIN_DRV_LV3		1
+#define PIN_DRV_LV4		3
+
+#define PIN_FUNC_INPUT		0
+#define PIN_FUNC_OUTPUT		1
+#define PIN_FUNC_SPC_2		2
+#define PIN_FUNC_SPC_3		3
+#define PIN_FUNC_SPC_4		4
+#define PIN_FUNC_SPC_5		5
+#define PIN_FUNC_SPC_F		0xf
+
 &pinctrl_0 {
 	gpa0: gpa0 {
 		gpio-controller;
diff --git a/arch/arm/boot/dts/exynos5260-pinctrl.dtsi b/arch/arm/boot/dts/exynos5260-pinctrl.dtsi
index f6ee55ea0708..efd01b816538 100644
--- a/arch/arm/boot/dts/exynos5260-pinctrl.dtsi
+++ b/arch/arm/boot/dts/exynos5260-pinctrl.dtsi
@@ -12,9 +12,20 @@
  * published by the Free Software Foundation.
 */
 
-#define PIN_PULL_NONE	0
-#define PIN_PULL_DOWN	1
-#define PIN_PULL_UP	3
+#define PIN_PULL_NONE		0
+#define PIN_PULL_DOWN		1
+#define PIN_PULL_UP		3
+
+#define PIN_DRV_LV1		0
+#define PIN_DRV_LV2		1
+#define PIN_DRV_LV4		2
+#define PIN_DRV_LV6		3
+
+#define PIN_FUNC_INPUT		0
+#define PIN_FUNC_OUTPUT		1
+#define PIN_FUNC_SPC_2		2
+#define PIN_FUNC_SPC_3		3
+#define PIN_FUNC_SPC_4		4
 
 &pinctrl_0 {
 	gpa0: gpa0 {
diff --git a/arch/arm/boot/dts/exynos5410-pinctrl.dtsi b/arch/arm/boot/dts/exynos5410-pinctrl.dtsi
index b58a0f29f42c..10272fa54c37 100644
--- a/arch/arm/boot/dts/exynos5410-pinctrl.dtsi
+++ b/arch/arm/boot/dts/exynos5410-pinctrl.dtsi
@@ -9,6 +9,22 @@
  * published by the Free Software Foundation.
  */
 
+#define PIN_PULL_NONE		0
+#define PIN_PULL_DOWN		1
+#define PIN_PULL_UP		3
+
+#define PIN_DRV_LV1		0
+#define PIN_DRV_LV2		1
+#define PIN_DRV_LV3		2
+#define PIN_DRV_LV4		3
+
+#define PIN_FUNC_INPUT		0
+#define PIN_FUNC_OUTPUT		1
+#define PIN_FUNC_SPC_2		2
+#define PIN_FUNC_SPC_3		3
+#define PIN_FUNC_SPC_4		4
+#define PIN_FUNC_SPC_F		0xf
+
 &pinctrl_0 {
 	gpa0: gpa0 {
 		gpio-controller;
diff --git a/arch/arm/boot/dts/exynos5420-pinctrl.dtsi b/arch/arm/boot/dts/exynos5420-pinctrl.dtsi
index 14beb7e07323..41abc8ec474a 100644
--- a/arch/arm/boot/dts/exynos5420-pinctrl.dtsi
+++ b/arch/arm/boot/dts/exynos5420-pinctrl.dtsi
@@ -12,6 +12,23 @@
  * published by the Free Software Foundation.
 */
 
+#define PIN_PULL_NONE		0
+#define PIN_PULL_DOWN		1
+#define PIN_PULL_UP		3
+
+#define PIN_DRV_LV1		0
+#define PIN_DRV_LV2		1
+#define PIN_DRV_LV3		2
+#define PIN_DRV_LV4		3
+
+#define PIN_FUNC_INPUT		0
+#define PIN_FUNC_OUTPUT		1
+#define PIN_FUNC_SPC_2		2
+#define PIN_FUNC_SPC_3		3
+#define PIN_FUNC_SPC_4		4
+#define PIN_FUNC_SPC_5		5
+#define PIN_FUNC_SPC_F		0xf
+
 &pinctrl_0 {
 	gpy7: gpy7 {
 		gpio-controller;
-- 
1.9.1
