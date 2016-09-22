From: Wolfgang Wiedmeyer <wolfgit-CMKNnOTVkIZM7kwft8N7nw@public.gmane.org>
Subject: [PATCH] ARM: dts: exynos: Add reboot reason support for Trats2
Date: Thu, 22 Sep 2016 18:48:35 +0200
Message-ID: <1474562915-4319-1-git-send-email-wolfgit@wiedmeyer.de>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, javier-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Wolfgang Wiedmeyer <wolfgit-CMKNnOTVkIZM7kwft8N7nw@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

This allows to reboot the device into recovery mode and into the download
mode of the bootloader.

Signed-off-by: Wolfgang Wiedmeyer <wolfgit-CMKNnOTVkIZM7kwft8N7nw@public.gmane.org>
---
 arch/arm/boot/dts/exynos4412-trats2.dts | 14 ++++++++++++++
 arch/arm/boot/dts/exynos4x12.dtsi       |  2 +-
 2 files changed, 15 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/exynos4412-trats2.dts b/arch/arm/boot/dts/exynos4412-trats2.dts
index 129e973..a38d1e3 100644
--- a/arch/arm/boot/dts/exynos4412-trats2.dts
+++ b/arch/arm/boot/dts/exynos4412-trats2.dts
@@ -1294,3 +1294,17 @@
 	vtmu-supply = <&ldo10_reg>;
 	status = "okay";
 };
+
+&pmu {
+	compatible = "syscon", "simple-mfd";
+
+	reboot-mode {
+		compatible = "syscon-reboot-mode";
+		offset = <0x80c>;
+
+		mode-normal	= <0x12345670>;
+		mode-bootloader	= <0x12345671>;
+		mode-download	= <0x12345671>;
+		mode-recovery	= <0x12345674>;
+	};
+};
diff --git a/arch/arm/boot/dts/exynos4x12.dtsi b/arch/arm/boot/dts/exynos4x12.dtsi
index c452499..b58c14e 100644
--- a/arch/arm/boot/dts/exynos4x12.dtsi
+++ b/arch/arm/boot/dts/exynos4x12.dtsi
@@ -179,7 +179,7 @@
 			ranges;
 			status = "disabled";
 
-			pmu@10020000 {
+			pmu: pmu@10020000 {
 				reg = <0x10020000 0x3000>;
 			};
 
-- 
Website: https://fossencdi.org
OpenPGP: 0F30 D1A0 2F73 F70A 6FEE  048E 5816 A24C 1075 7FC4
Key download: https://wiedmeyer.de/keys/ww.asc

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
