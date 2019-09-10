From: Lihua Yao <ylhuajnu@outlook.com>
Subject: [PATCH] ARM: dts: s3c64xx: Fix init order of clock providers
Date: Tue, 10 Sep 2019 13:22:28 +0000
Message-ID: <BY5PR12MB3699A88381A84820B8263810C4B60@BY5PR12MB3699.namprd12.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: "krzk@kernel.org" <krzk@kernel.org>, "kgene@kernel.org" <kgene@kernel.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>
Cc: Lihua Yao <ylhuajnu@outlook.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: linux-samsung-soc@vger.kernel.org

From: Lihua Yao <ylhuajnu@outlook.com>

fin_pll is the parent of clock-controller@7e00f000, specify
the dependency to ensure proper initialization order of clock
providers.

without this patch:
[    0.000000] S3C6410 clocks: apll = 0, mpll = 0
[    0.000000]  epll = 0, arm_clk = 0

with this patch:
[    0.000000] S3C6410 clocks: apll = 532000000, mpll = 532000000
[    0.000000]  epll = 24000000, arm_clk = 532000000

Fixes: 3f6d439f2022 ("clk: reverse default clk provider initialization order in of_clk_init()")
Signed-off-by: Lihua Yao <ylhuajnu@outlook.com>
---
 arch/arm/boot/dts/s3c6410-mini6410.dts | 4 ++++
 arch/arm/boot/dts/s3c6410-smdk6410.dts | 4 ++++
 2 files changed, 8 insertions(+)

diff --git a/arch/arm/boot/dts/s3c6410-mini6410.dts b/arch/arm/boot/dts/s3c6410-mini6410.dts
index 5201512054c4..524b96f5e568 100644
--- a/arch/arm/boot/dts/s3c6410-mini6410.dts
+++ b/arch/arm/boot/dts/s3c6410-mini6410.dts
@@ -165,6 +165,10 @@
 	};
 };
 
+&clocks {
+	clocks = <&fin_pll>;
+};
+
 &sdhci0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&sd0_clk>, <&sd0_cmd>, <&sd0_cd>, <&sd0_bus4>;
diff --git a/arch/arm/boot/dts/s3c6410-smdk6410.dts b/arch/arm/boot/dts/s3c6410-smdk6410.dts
index a9a5689dc462..3bf6c450a26e 100644
--- a/arch/arm/boot/dts/s3c6410-smdk6410.dts
+++ b/arch/arm/boot/dts/s3c6410-smdk6410.dts
@@ -69,6 +69,10 @@
 	};
 };
 
+&clocks {
+	clocks = <&fin_pll>;
+};
+
 &sdhci0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&sd0_clk>, <&sd0_cmd>, <&sd0_cd>, <&sd0_bus4>;
-- 
2.17.1
