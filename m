From: Kevin Hilman <khilman@kernel.org>
Subject: DTS for exynos5422 odroid-xu3: anyone working on it?
Date: Thu, 11 Sep 2014 16:58:02 -0700
Message-ID: <7hd2b1lng5.fsf@deeprootsystems.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.19.201]:45231 "EHLO mail.kernel.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754499AbaIKX6H (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 11 Sep 2014 19:58:07 -0400
Received: from mail.kernel.org (localhost [127.0.0.1])
	by mail.kernel.org (Postfix) with ESMTP id CCB0920263
	for <linux-samsung-soc@vger.kernel.org>; Thu, 11 Sep 2014 23:58:05 +0000 (UTC)
Received: from localhost (c-67-183-17-239.hsd1.wa.comcast.net [67.183.17.239])
	(using TLSv1.2 with cipher DHE-RSA-AES128-SHA (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 306A72022A
	for <linux-samsung-soc@vger.kernel.org>; Thu, 11 Sep 2014 23:58:04 +0000 (UTC)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org

Just curious if anyone is working on upstream DTS for the odroid-xu3?

It's booting fine with mainline using exynos5420-smdk5420.dts, but would
like to see more devices added.

I found the DTS files in the hardkernel v3.10.y branch which can be used
as a starting point, but wanted to know if anyone else is working on it
before duplicating effort.

In particular, one of the first bits I'm trying to add are the nodes for
the on-board INA231 voltage/current sensors that are hanging of i2c_0.
I just stole the driver and DTS snippet[1] from the hardkernel tree and
tried it with mainline, and can get the driver to probe, but it fails
the first I2C write, suggesting that I'm missing something else in the
DTS, which leads me to this posting.

Kevin


[1]
diff --git a/arch/arm/boot/dts/exynos5420-smdk5420.dts b/arch/arm/boot/dts/exynos5420-smdk5420.dts
index d789a2361612..9d629377869e 100644
--- a/arch/arm/boot/dts/exynos5420-smdk5420.dts
+++ b/arch/arm/boot/dts/exynos5420-smdk5420.dts
@@ -31,6 +31,62 @@
 		};
 	};
 
+    /* i2c0 INA231 Sensors */
+    /*
+        - include/linux/platform_data/ina231.h
+        
+        config         = INA231_CONFIG(VSH_CT(eVSH_CT_8244uS)      | \
+                                        VBUS_CT(eVBUS_CT_8244uS)   | \
+                                        AVG_BIT(eAVG_16)           | \
+                                        eSHUNT_BUS_VOLT_CONTINUOUS),
+        update_period  = CONVERSION_DELAY(eVSH_CON_8244uS, eVBUS_CON_8244uS, eAVG_CON_16),   // unit = usec
+    */
+
+	i2c@12C60000 {
+		status = "okay";
+        clock-frequency = <400000>;
+        ina231@40  {
+			compatible = "hardkernel,INA231";
+			reg = <0x40>;
+    		sensor-name = "sensor_arm";
+    		enable = <1>;
+    		max_A = <9>;
+    		shunt_R_mohm = <10>;
+    		config = <0x45FF>;
+    		update_period = <263808>;
+        };
+        ina231@41  {
+			compatible = "hardkernel,INA231";
+			reg = <0x41>;
+    		sensor-name = "sensor_mem";
+    		enable = <0>;
+    		max_A = <3>;
+    		shunt_R_mohm = <10>;
+    		config = <0x45FF>;
+    		update_period = <263808>;
+        };
+        ina231@44  {
+			compatible = "hardkernel,INA231";
+			reg = <0x44>;
+    		sensor-name = "sensor_g3d";
+    		enable = <0>;
+    		max_A = <5>;
+    		shunt_R_mohm = <10>;
+    		config = <0x45FF>;
+    		update_period = <263808>;
+        };
+        ina231@45  {
+			compatible = "hardkernel,INA231";
+			reg = <0x45>;
+    		sensor-name = "sensor_kfc";
+    		enable = <0>;
+    		max_A = <2>;
+    		shunt_R_mohm = <10>;
+    		config = <0x45FF>;
+    		update_period = <263808>;
+        };
+	};
+
 	regulators {
 		compatible = "simple-bus";
 		#address-cells = <1>;
