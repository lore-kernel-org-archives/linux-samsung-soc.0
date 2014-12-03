From: Pankaj Dubey <pankaj.dubey@samsung.com>
Subject: [PATCH] ARM: samsung: add exynos-chipid binding information
Date: Wed, 03 Dec 2014 13:14:24 +0530
Message-ID: <1417592664-10672-1-git-send-email-pankaj.dubey@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:22469 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750815AbaLCHwF (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 3 Dec 2014 02:52:05 -0500
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, robh+dt@kernel.org, ijc+devicetree@hellion.org.uk, pawel.moll@arm.com, thomas.ab@samsung.com, Pankaj Dubey <pankaj.dubey@samsung.com>

Exynos SoC's DT files are using Chipid device nodes, but it's binding
information is missing. This patch adds exynos-chipid binding information.

Signed-off-by: Pankaj Dubey <pankaj.dubey@samsung.com>
---
 .../bindings/arm/samsung/exynos-chipid.txt         |   12 ++++++++++++
 1 file changed, 12 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/arm/samsung/exynos-chipid.txt

diff --git a/Documentation/devicetree/bindings/arm/samsung/exynos-chipid.txt b/Documentation/devicetree/bindings/arm/samsung/exynos-chipid.txt
new file mode 100644
index 0000000..85c5dfd
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/samsung/exynos-chipid.txt
@@ -0,0 +1,12 @@
+SAMSUNG Exynos SoCs Chipid driver.
+
+Required properties:
+- compatible : Should at least contain "samsung,exynos4210-chipid".
+
+- reg: offset and length of the register set
+
+Example:
+	chipid@10000000 {
+		compatible = "samsung,exynos4210-chipid";
+		reg = <0x10000000 0x100>;
+	};
-- 
1.7.9.5
