From: =?UTF-8?q?Pawe=C5=82=20Chmiel?= <pawel.mikolaj.chmiel@gmail.com>
Subject: [PATCH 1/1] ARM: dts: s5pv210: Add missing interrupt-controller property to gph2
Date: Sun, 10 Jun 2018 16:15:49 +0200
Message-ID: <1528640149-2195-1-git-send-email-pawel.mikolaj.chmiel@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: kgene@kernel.org, krzk@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, =?UTF-8?q?Pawe=C5=82=20Chmiel?= <pawel.mikolaj.chmiel@gmail.com>
List-Id: linux-samsung-soc@vger.kernel.org

This commit adds missing interrupt-controller property to gph2 block,
to silence following warnings during build
  /soc/pinctrl@e0200000/gph2: Missing interrupt-controller or interrupt-map property

Observed on not yet mainlined, an S5PV210 based
Samsung Galaxy S (i9000) phone.

Signed-off-by: Paweł Chmiel <pawel.mikolaj.chmiel@gmail.com>
---
 arch/arm/boot/dts/s5pv210-pinctrl.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/boot/dts/s5pv210-pinctrl.dtsi b/arch/arm/boot/dts/s5pv210-pinctrl.dtsi
index 3a79feab11c3..7f0c9d447871 100644
--- a/arch/arm/boot/dts/s5pv210-pinctrl.dtsi
+++ b/arch/arm/boot/dts/s5pv210-pinctrl.dtsi
@@ -258,6 +258,8 @@
 	gph2: gph2 {
 		gpio-controller;
 		#gpio-cells = <2>;
+
+		interrupt-controller;
 		#interrupt-cells = <2>;
 	};
 
-- 
2.7.4
