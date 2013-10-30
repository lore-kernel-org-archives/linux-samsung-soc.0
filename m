From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: [PATCH 2/2] ARM: dts: Update Samsung sysreg binding document
Date: Wed, 30 Oct 2013 15:35:54 +0530
Message-ID: <1383127554-13854-2-git-send-email-sachin.kamat@linaro.org>
References: <1383127554-13854-1-git-send-email-sachin.kamat@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pb0-f43.google.com ([209.85.160.43]:40740 "EHLO
	mail-pb0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753763Ab3J3KHT (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 30 Oct 2013 06:07:19 -0400
Received: by mail-pb0-f43.google.com with SMTP id md4so1157475pbc.2
        for <linux-samsung-soc@vger.kernel.org>; Wed, 30 Oct 2013 03:07:19 -0700 (PDT)
In-Reply-To: <1383127554-13854-1-git-send-email-sachin.kamat@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: devicetree@vger.kernel.org, kgene.kim@samsung.com, sachin.kamat@linaro.org

Added a binding example for reference.

Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
---
 .../devicetree/bindings/arm/samsung/sysreg.txt     |    6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/samsung/sysreg.txt b/Documentation/devicetree/bindings/arm/samsung/sysreg.txt
index 5039c0a..7090178 100644
--- a/Documentation/devicetree/bindings/arm/samsung/sysreg.txt
+++ b/Documentation/devicetree/bindings/arm/samsung/sysreg.txt
@@ -5,3 +5,9 @@ Properties:
  - compatible : should contain "samsung,<chip name>-sysreg", "syscon";
    For Exynos4 SoC series it should be "samsung,exynos4-sysreg", "syscon";
  - reg : offset and length of the register set.
+
+Example:
+	sys_reg: sysreg@10010000 {
+		compatible = "samsung,exynos4-sysreg", "syscon";
+		reg = <0x10010000 0x400>;
+	};
-- 
1.7.9.5
