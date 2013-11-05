From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: [PATCH v3 2/2] ARM: dts: Update Samsung sysreg binding document
Date: Tue,  5 Nov 2013 11:48:22 +0530
Message-ID: <1383632302-23535-2-git-send-email-sachin.kamat@linaro.org>
References: <1383632302-23535-1-git-send-email-sachin.kamat@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pd0-f175.google.com ([209.85.192.175]:48410 "EHLO
	mail-pd0-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751013Ab3KEGT7 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 5 Nov 2013 01:19:59 -0500
Received: by mail-pd0-f175.google.com with SMTP id g10so7792591pdj.34
        for <linux-samsung-soc@vger.kernel.org>; Mon, 04 Nov 2013 22:19:59 -0800 (PST)
In-Reply-To: <1383632302-23535-1-git-send-email-sachin.kamat@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: devicetree@vger.kernel.org, kgene.kim@samsung.com, sachin.kamat@linaro.org, t.figa@samsung.com

Added a binding example for reference and updated the
node name. While at it also removed the name description
as it is not necessary.

Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
---
Changes since v2:
* Removed node name description as suggested by Tomasz Figa.
---
 .../devicetree/bindings/arm/samsung/sysreg.txt     |    7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/arm/samsung/sysreg.txt b/Documentation/devicetree/bindings/arm/samsung/sysreg.txt
index 5039c0a12f55..0ab3251a6ec2 100644
--- a/Documentation/devicetree/bindings/arm/samsung/sysreg.txt
+++ b/Documentation/devicetree/bindings/arm/samsung/sysreg.txt
@@ -1,7 +1,12 @@
 SAMSUNG S5P/Exynos SoC series System Registers (SYSREG)
 
 Properties:
- - name : should be 'sysreg';
  - compatible : should contain "samsung,<chip name>-sysreg", "syscon";
    For Exynos4 SoC series it should be "samsung,exynos4-sysreg", "syscon";
  - reg : offset and length of the register set.
+
+Example:
+	syscon@10010000 {
+		compatible = "samsung,exynos4-sysreg", "syscon";
+		reg = <0x10010000 0x400>;
+	};
-- 
1.7.9.5
