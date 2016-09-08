From: Javier Martinez Canillas <javier@osg.samsung.com>
Subject: [PATCH 2/2] ARM: dts: s5p: Add missing unit name to memory nodes for S5PV210 boards
Date: Thu,  8 Sep 2016 11:26:01 -0400
Message-ID: <1473348361-15784-3-git-send-email-javier@osg.samsung.com>
References: <1473348361-15784-1-git-send-email-javier@osg.samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from ec2-52-27-115-49.us-west-2.compute.amazonaws.com ([52.27.115.49]:48873
        "EHLO s-opensource.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S966667AbcIHP01 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 8 Sep 2016 11:26:27 -0400
In-Reply-To: <1473348361-15784-1-git-send-email-javier@osg.samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Javier Martinez Canillas <javier@osg.samsung.com>, devicetree@vger.kernel.org, Kukjin Kim <kgene@kernel.org>, Russell King <linux@armlinux.org.uk>, linux-samsung-soc@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-kernel@lists.infradead.org

This patch fixes the following DTC warnings:

"Node /memory has a reg or ranges property, but no unit name"

Signed-off-by: Javier Martinez Canillas <javier@osg.samsung.com>

---

 arch/arm/boot/dts/s5pv210-aquila.dts   | 2 +-
 arch/arm/boot/dts/s5pv210-goni.dts     | 2 +-
 arch/arm/boot/dts/s5pv210-smdkc110.dts | 2 +-
 arch/arm/boot/dts/s5pv210-smdkv210.dts | 2 +-
 arch/arm/boot/dts/s5pv210-torbreck.dts | 2 +-
 5 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/arm/boot/dts/s5pv210-aquila.dts b/arch/arm/boot/dts/s5pv210-aquila.dts
index da24ab570b0e..d763c5b4c65d 100644
--- a/arch/arm/boot/dts/s5pv210-aquila.dts
+++ b/arch/arm/boot/dts/s5pv210-aquila.dts
@@ -29,7 +29,7 @@
 		bootargs = "console=ttySAC2,115200n8 root=/dev/mmcblk1p5 rw rootwait ignore_loglevel earlyprintk";
 	};
 
-	memory {
+	memory@30000000 {
 		device_type = "memory";
 		reg = <0x30000000 0x05000000
 			0x40000000 0x18000000>;
diff --git a/arch/arm/boot/dts/s5pv210-goni.dts b/arch/arm/boot/dts/s5pv210-goni.dts
index 0a33d402138e..c56f51ee7897 100644
--- a/arch/arm/boot/dts/s5pv210-goni.dts
+++ b/arch/arm/boot/dts/s5pv210-goni.dts
@@ -29,7 +29,7 @@
 		bootargs = "console=ttySAC0,115200n8 root=/dev/mmcblk0p5 rw rootwait ignore_loglevel earlyprintk";
 	};
 
-	memory {
+	memory@30000000 {
 		device_type = "memory";
 		reg = <0x30000000 0x05000000
 			0x40000000 0x10000000
diff --git a/arch/arm/boot/dts/s5pv210-smdkc110.dts b/arch/arm/boot/dts/s5pv210-smdkc110.dts
index 1eedab7ffe94..5d14da911aa5 100644
--- a/arch/arm/boot/dts/s5pv210-smdkc110.dts
+++ b/arch/arm/boot/dts/s5pv210-smdkc110.dts
@@ -29,7 +29,7 @@
 		bootargs = "console=ttySAC0,115200n8 root=/dev/mmcblk0p1 rw rootwait ignore_loglevel earlyprintk";
 	};
 
-	memory {
+	memory@20000000 {
 		device_type = "memory";
 		reg = <0x20000000 0x20000000>;
 	};
diff --git a/arch/arm/boot/dts/s5pv210-smdkv210.dts b/arch/arm/boot/dts/s5pv210-smdkv210.dts
index 9eb6aff3e38f..75398318ed57 100644
--- a/arch/arm/boot/dts/s5pv210-smdkv210.dts
+++ b/arch/arm/boot/dts/s5pv210-smdkv210.dts
@@ -29,7 +29,7 @@
 		bootargs = "console=ttySAC0,115200n8 root=/dev/mmcblk0p1 rw rootwait ignore_loglevel earlyprintk";
 	};
 
-	memory {
+	memory@20000000 {
 		device_type = "memory";
 		reg = <0x20000000 0x40000000>;
 	};
diff --git a/arch/arm/boot/dts/s5pv210-torbreck.dts b/arch/arm/boot/dts/s5pv210-torbreck.dts
index 622599fd2cfa..7cb50bcee888 100644
--- a/arch/arm/boot/dts/s5pv210-torbreck.dts
+++ b/arch/arm/boot/dts/s5pv210-torbreck.dts
@@ -29,7 +29,7 @@
 		bootargs = "console=ttySAC0,115200n8 root=/dev/mmcblk0p1 rw rootwait ignore_loglevel earlyprintk";
 	};
 
-	memory {
+	memory@20000000 {
 		device_type = "memory";
 		reg = <0x20000000 0x20000000>;
 	};
-- 
2.7.4
