From: Tomasz Stanislawski <t.stanislaws@samsung.com>
Subject: [PATCH] arm: dts: exynos4412-trats2: rename alias for i2c_ak8975 label
Date: Tue, 15 Apr 2014 16:25:07 +0200
Message-ID: <534D4143.3050801@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: =?UTF-8?B?6rmA6rWt7KeE?= <kgene.kim@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 'Ben Dooks' <ben-linux@fluff.org>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, linux@arm.linux.org.uk, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, j.anaszewski@samsung.com, =?UTF-8?B?J+uwleqyveuvvCc=?= <kyungmin.park@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

The i2c_ak8975 controler uses label i2c8.
This alias is already used for I2C controller 8 defined
in file arch/arm/boot/dts/exynos4.dtsi.

This patch renames a label for i2c_ak8975 to i2c9.

Signed-off-by: Tomasz Stanislawski <t.stanislaws@samsung.com>
---
 arch/arm/boot/dts/exynos4412-trats2.dts |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/exynos4412-trats2.dts b/arch/arm/boot/dts/exynos4412-trats2.dts
index c16b315..5add765 100644
--- a/arch/arm/boot/dts/exynos4412-trats2.dts
+++ b/arch/arm/boot/dts/exynos4412-trats2.dts
@@ -20,7 +20,7 @@
 	compatible = "samsung,trats2", "samsung,exynos4412", "samsung,exynos4";

 	aliases {
-		i2c8 = &i2c_ak8975;
+		i2c9 = &i2c_ak8975;
 	};

 	memory {
