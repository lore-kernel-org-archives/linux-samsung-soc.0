From: Alex Ling <kasimling@gmail.com>
Subject: [PATCH v2 1/1] ARM: dts: Add missing clocks for exynos4412 dwmmc node
Date: Sat, 14 Dec 2013 13:21:30 +0800
Message-ID: <1386998490-19456-1-git-send-email-kasimling@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: ben-linux@fluff.org, kgene.kim@samsung.com, rob.herring@calxeda.com, pawel.moll@arm.com, mark.rutland@arm.com, linux@arm.linux.org.uk, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Alex Ling <kasimling@gmail.com>
List-Id: linux-samsung-soc@vger.kernel.org

This patch adds "biu" and "ciu" clocks for exynos4412 dwmmc
node. Without this patch, dwmmc host driver will skip enabling the
two clocks and it will break dwmmc host function on exynos4412.
Tested on FriendlyARM TINY4412 board.

Signed-off-by: Alex Ling <kasimling@gmail.com>
---
Changes for v2:
   - Fix patch description as Mark Rutland suggested

 arch/arm/boot/dts/exynos4412.dtsi |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/boot/dts/exynos4412.dtsi b/arch/arm/boot/dts/exynos4412.dtsi
index e743e67..67bef99 100644
--- a/arch/arm/boot/dts/exynos4412.dtsi
+++ b/arch/arm/boot/dts/exynos4412.dtsi
@@ -67,5 +67,7 @@
 		interrupts = <0 77 0>;
 		#address-cells = <1>;
 		#size-cells = <0>;
+		clocks = <&clock 301>, <&clock 149>;
+		clock-names = "biu", "ciu";
 	};
 };
-- 
1.7.9.5
