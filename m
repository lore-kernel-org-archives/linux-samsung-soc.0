From: Yao Lihua <ylhuajnu@outlook.com>
Subject: [PATCH 1/2] ARM: dts: s3c64xx: factor out external fixed clocks
Date: Sat, 7 Sep 2019 02:48:08 +0000
Message-ID: <BY5PR12MB36996A79D9B1EEC5162B00F4C4B50@BY5PR12MB3699.namprd12.prod.outlook.com>
References: <20190907024719.16974-1-ylhuajnu@outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190907024719.16974-1-ylhuajnu@outlook.com>
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
Cc: Yao Lihua <ylhuajnu@outlook.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: linux-samsung-soc@vger.kernel.org

From: Lihua Yao <ylhuajnu@outlook.com>

As per arch/arm/mach-s3c64xx/common.c, the external oscillators
of S3C6400 and S3C6410 are identical. Move them to s3c64xx.dtsi
and place under root node directly.

This introduces side effect of changing the initialization order of
fin_pll and clock-controller@7e00f000. As of commit 3f6d439f2022
("clk: reverse default clk provider initialization order in of_clk_init()"),
clock providers are initialized in the orders they are present in the
device tree unless the clocks' dependencies are specified explicitly.

without this patch:
  [    0.000000] S3C6410 clocks: apll = 0, mpll = 0
  [    0.000000]  epll = 0, arm_clk = 0

with this patch:
  [    0.000000] S3C6410 clocks: apll = 532000000, mpll = 532000000
  [    0.000000]  epll = 24000000, arm_clk = 532000000

Fixes: 3f6d439f2022 ("clk: reverse default clk provider initialization order in of_clk_init()")
Signed-off-by: Lihua Yao <ylhuajnu@outlook.com>
---
 arch/arm/boot/dts/s3c6410-mini6410.dts | 22 ----------------------
 arch/arm/boot/dts/s3c6410-smdk6410.dts | 22 ----------------------
 arch/arm/boot/dts/s3c64xx.dtsi         | 14 ++++++++++++++
 3 files changed, 14 insertions(+), 44 deletions(-)

diff --git a/arch/arm/boot/dts/s3c6410-mini6410.dts b/arch/arm/boot/dts/s3c6410-mini6410.dts
index 5201512054c4..7028507b7076 100644
--- a/arch/arm/boot/dts/s3c6410-mini6410.dts
+++ b/arch/arm/boot/dts/s3c6410-mini6410.dts
@@ -28,28 +28,6 @@
 		bootargs = "console=ttySAC0,115200n8 earlyprintk root=/dev/nfs rw nfsroot=192.168.31.2:/srv/nfs/tiny6410,nfsvers=3 ip=dhcp";
 	};
 
-	clocks {
-		compatible = "simple-bus";
-		#address-cells = <1>;
-		#size-cells = <0>;
-
-		fin_pll: oscillator@0 {
-			compatible = "fixed-clock";
-			reg = <0>;
-			clock-frequency = <12000000>;
-			clock-output-names = "fin_pll";
-			#clock-cells = <0>;
-		};
-
-		xusbxti: oscillator@1 {
-			compatible = "fixed-clock";
-			reg = <1>;
-			clock-output-names = "xusbxti";
-			clock-frequency = <48000000>;
-			#clock-cells = <0>;
-		};
-	};
-
 	srom-cs1@18000000 {
 		compatible = "simple-bus";
 		#address-cells = <1>;
diff --git a/arch/arm/boot/dts/s3c6410-smdk6410.dts b/arch/arm/boot/dts/s3c6410-smdk6410.dts
index a9a5689dc462..10a854b488a8 100644
--- a/arch/arm/boot/dts/s3c6410-smdk6410.dts
+++ b/arch/arm/boot/dts/s3c6410-smdk6410.dts
@@ -28,28 +28,6 @@
 		bootargs = "console=ttySAC0,115200n8 earlyprintk rootwait root=/dev/mmcblk0p1";
 	};
 
-	clocks {
-		compatible = "simple-bus";
-		#address-cells = <1>;
-		#size-cells = <0>;
-
-		fin_pll: oscillator@0 {
-			compatible = "fixed-clock";
-			reg = <0>;
-			clock-frequency = <12000000>;
-			clock-output-names = "fin_pll";
-			#clock-cells = <0>;
-		};
-
-		xusbxti: oscillator@1 {
-			compatible = "fixed-clock";
-			reg = <1>;
-			clock-output-names = "xusbxti";
-			clock-frequency = <48000000>;
-			#clock-cells = <0>;
-		};
-	};
-
 	srom-cs1@18000000 {
 		compatible = "simple-bus";
 		#address-cells = <1>;
diff --git a/arch/arm/boot/dts/s3c64xx.dtsi b/arch/arm/boot/dts/s3c64xx.dtsi
index 2e611df37911..672764133cea 100644
--- a/arch/arm/boot/dts/s3c64xx.dtsi
+++ b/arch/arm/boot/dts/s3c64xx.dtsi
@@ -39,6 +39,20 @@
 		};
 	};
 
+	fin_pll: oscillator-0 {
+		compatible = "fixed-clock";
+		clock-frequency = <12000000>;
+		clock-output-names = "fin_pll";
+		#clock-cells = <0>;
+	};
+
+	xusbxti: oscillator-1 {
+		compatible = "fixed-clock";
+		clock-frequency = <48000000>;
+		clock-output-names = "xusbxti";
+		#clock-cells = <0>;
+	};
+
 	soc: soc {
 		compatible = "simple-bus";
 		#address-cells = <1>;
-- 
2.17.1
