From: Yao Lihua <ylhuajnu@outlook.com>
Subject: [PATCH 2/2] ARM: dts: s3c64xx: specify dependency of clock providers
Date: Sat, 7 Sep 2019 02:48:12 +0000
Message-ID: <BY5PR12MB36991E62DD57AA6962C05420C4B50@BY5PR12MB3699.namprd12.prod.outlook.com>
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

fin_pll is the parent of clock-controller@7e00f000, specify
the dependency to ensure proper initialization order of clock
providers.

Fixes: 3f6d439f2022 ("clk: reverse default clk provider initialization order in of_clk_init()")
Signed-off-by: Lihua Yao <ylhuajnu@outlook.com>
---
 arch/arm/boot/dts/s3c6400.dtsi | 1 +
 arch/arm/boot/dts/s3c6410.dtsi | 1 +
 2 files changed, 2 insertions(+)

diff --git a/arch/arm/boot/dts/s3c6400.dtsi b/arch/arm/boot/dts/s3c6400.dtsi
index 8c28e8a0c824..ef5a8fa3555c 100644
--- a/arch/arm/boot/dts/s3c6400.dtsi
+++ b/arch/arm/boot/dts/s3c6400.dtsi
@@ -34,5 +34,6 @@
 		compatible = "samsung,s3c6400-clock";
 		reg = <0x7e00f000 0x1000>;
 		#clock-cells = <1>;
+		clocks = <&fin_pll>;
 	};
 };
diff --git a/arch/arm/boot/dts/s3c6410.dtsi b/arch/arm/boot/dts/s3c6410.dtsi
index a766d6de696c..b201b71d45b5 100644
--- a/arch/arm/boot/dts/s3c6410.dtsi
+++ b/arch/arm/boot/dts/s3c6410.dtsi
@@ -38,6 +38,7 @@
 		compatible = "samsung,s3c6410-clock";
 		reg = <0x7e00f000 0x1000>;
 		#clock-cells = <1>;
+		clocks = <&fin_pll>;
 	};
 
 	i2c1: i2c@7f00f000 {
-- 
2.17.1
