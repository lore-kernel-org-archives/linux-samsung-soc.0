From: Javier Martinez Canillas <javier@osg.samsung.com>
Subject: [PATCH 1/7] ARM: dts: exynos: Add missing memory node for Exynos5440 boards
Date: Wed, 31 Aug 2016 14:14:33 +0200
Message-ID: <1472645679-5696-2-git-send-email-javier@osg.samsung.com>
References: <1472645679-5696-1-git-send-email-javier@osg.samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from ec2-52-27-115-49.us-west-2.compute.amazonaws.com ([52.27.115.49]:49085
        "EHLO s-opensource.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S933960AbcHaMO5 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 31 Aug 2016 08:14:57 -0400
In-Reply-To: <1472645679-5696-1-git-send-email-javier@osg.samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: devicetree@vger.kernel.org, Kukjin Kim <kgene@kernel.org>, linux-samsung-soc@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Krzysztof Kozlowski <krzk@kernel.org>, Javier Martinez Canillas <javier@osg.samsung.com>

The skeleton.dtsi file was removed in ARM64 for different reasons as
explained in commit ("3ebee5a2e141 arm64: dts: kill skeleton.dtsi").

These also applies to ARM and it will also allow to get rid of the
following DTC warnings in the future:

"Node /memory has a reg or ranges property, but no unit name"

But these boards don't have a memory node defined, so removing the
skeleton.dtsi inclusion in exynos4.dtsi will cause a change in the
compiled DTB. Add a dummy memory node so the compiled DTB doesn't
change if the skeleton.dtsi is removed from exynos4.dtsi.

Eventually the correct starting addresses and sizes should be used
but I didn't find that information.

Signed-off-by: Javier Martinez Canillas <javier@osg.samsung.com>
---

 arch/arm/boot/dts/exynos5440-sd5v1.dts    | 5 +++++
 arch/arm/boot/dts/exynos5440-ssdk5440.dts | 5 +++++
 2 files changed, 10 insertions(+)

diff --git a/arch/arm/boot/dts/exynos5440-sd5v1.dts b/arch/arm/boot/dts/exynos5440-sd5v1.dts
index a98501bab6fc..333db4ff373a 100644
--- a/arch/arm/boot/dts/exynos5440-sd5v1.dts
+++ b/arch/arm/boot/dts/exynos5440-sd5v1.dts
@@ -20,6 +20,11 @@
 		bootargs = "root=/dev/sda2 rw rootwait ignore_loglevel earlyprintk no_console_suspend mem=2048M@0x80000000 mem=6144M@0x100000000 console=ttySAC0,115200";
 	};
 
+	memory {
+		device_type = "memory";
+		reg = <0 0>;
+	};
+
 	fixed-rate-clocks {
 		xtal {
 			compatible = "samsung,clock-xtal";
diff --git a/arch/arm/boot/dts/exynos5440-ssdk5440.dts b/arch/arm/boot/dts/exynos5440-ssdk5440.dts
index 6a0d802e87c8..82fea6f94704 100644
--- a/arch/arm/boot/dts/exynos5440-ssdk5440.dts
+++ b/arch/arm/boot/dts/exynos5440-ssdk5440.dts
@@ -21,6 +21,11 @@
 		bootargs = "root=/dev/sda2 rw rootwait ignore_loglevel earlyprintk no_console_suspend mem=2048M@0x80000000 mem=6144M@0x100000000 console=ttySAC0,115200";
 	};
 
+	memory {
+		device_type = "memory";
+		reg = <0 0>;
+	};
+
 	fixed-rate-clocks {
 		xtal {
 			compatible = "samsung,clock-xtal";
-- 
2.7.4
