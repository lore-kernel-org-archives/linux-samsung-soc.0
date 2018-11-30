From: =?UTF-8?q?Pawe=C5=82=20Chmiel?= <pawel.mikolaj.chmiel@gmail.com>
Subject: [PATCH] ARM: dts: s5pv210: Add s5p-jpeg codec node.
Date: Fri, 30 Nov 2018 19:04:23 +0100
Message-ID: <20181130180423.9421-1-pawel.mikolaj.chmiel@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: kgene@kernel.org, krzk@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, =?UTF-8?q?Pawe=C5=82=20Chmiel?= <pawel.mikolaj.chmiel@gmail.com>
List-Id: linux-samsung-soc@vger.kernel.org

This commit adds node for s5p-jpeg codec,
which is present in S5PV210 SOC.

Signed-off-by: Paweł Chmiel <pawel.mikolaj.chmiel@gmail.com>
---
 arch/arm/boot/dts/s5pv210.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm/boot/dts/s5pv210.dtsi b/arch/arm/boot/dts/s5pv210.dtsi
index 75f454a210d6..12eac8930eac 100644
--- a/arch/arm/boot/dts/s5pv210.dtsi
+++ b/arch/arm/boot/dts/s5pv210.dtsi
@@ -627,6 +627,15 @@
 				samsung,lcd-wb;
 			};
 		};
+
+		jpeg_codec: jpeg-codec@fb600000 {
+			compatible = "samsung,s5pv210-jpeg";
+			reg = <0xfb600000 0x1000>;
+			interrupt-parent = <&vic2>;
+			interrupts = <8>;
+			clocks = <&clocks CLK_JPEG>;
+			clock-names = "jpeg";
+		};
 	};
 };
 
-- 
2.17.1
