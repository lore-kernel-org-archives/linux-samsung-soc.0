From: Hoegeun Kwon <hoegeun.kwon@samsung.com>
Subject: [PATCH] arm64: dts: exynos: Remove the te-gpios property in the TM2
 boards
Date: Tue, 25 Apr 2017 10:54:21 +0900
Message-ID: <1493085261-3488-1-git-send-email-hoegeun.kwon@samsung.com>
References: <CGME20170425015437epcas5p43549d47e69519f43d89ba2de496ba451@epcas5p4.samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:58314 "EHLO
        mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S979854AbdDYByl (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 24 Apr 2017 21:54:41 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: robh+dt@kernel.org, mark.rutland@arm.com, catalin.marinas@arm.com, will.deacon@arm.com, kgene@kernel.org, krzk@kernel.org
Cc: javier@osg.samsung.com, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, a.hajda@samsung.com, Hoegeun Kwon <hoegeun.kwon@samsung.com>

The decon uses HW-TRIGGER, so TE interrupt is not necessary.
Therefore, remove the te-gpios property in the TM2 dts.

Signed-off-by: Hoegeun Kwon <hoegeun.kwon@samsung.com>
---
 arch/arm64/boot/dts/exynos/exynos5433-tm2.dts | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/boot/dts/exynos/exynos5433-tm2.dts b/arch/arm64/boot/dts/exynos/exynos5433-tm2.dts
index 3ff9527..23191eb 100644
--- a/arch/arm64/boot/dts/exynos/exynos5433-tm2.dts
+++ b/arch/arm64/boot/dts/exynos/exynos5433-tm2.dts
@@ -60,7 +60,6 @@
 		vci-supply = <&ldo28_reg>;
 		reset-gpios = <&gpg0 0 GPIO_ACTIVE_LOW>;
 		enable-gpios = <&gpf1 5 GPIO_ACTIVE_HIGH>;
-		te-gpios = <&gpf1 3 GPIO_ACTIVE_HIGH>;
 	};
 };
 
-- 
1.9.1
