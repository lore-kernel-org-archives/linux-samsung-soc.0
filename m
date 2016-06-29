From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: [PATCH v3 1/6] ASoC: samsung: Add DT bindings documentation for LPASS
Date: Wed, 29 Jun 2016 13:26:34 +0200
Message-ID: <1467199599-6892-2-git-send-email-s.nawrocki@samsung.com>
References: <1467199599-6892-1-git-send-email-s.nawrocki@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:54808 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751407AbcF2L2K (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 29 Jun 2016 07:28:10 -0400
In-reply-to: <1467199599-6892-1-git-send-email-s.nawrocki@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: broonie@kernel.org
Cc: robh@kernel.org, alsa-devel@alsa-project.org, devicetree@vger.kernel.org, ideal.song@samsung.com, inki.dae@samsung.com, b.zolnierkie@samsung.com, linux-samsung-soc@vger.kernel.org, Sylwester Nawrocki <s.nawrocki@samsung.com>

This patch add documentation of the DT bindings for the Samsung
Exynos SoC Low Power Audio Subsystem.

Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
Acked-by: Rob Herring <robh@kernel.org>
Acked-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
---
Changes since v2:
 - none.
---
 .../devicetree/bindings/sound/samsung,exynos5433-lpass.txt        | 8 ++++++++
 1 file changed, 8 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/samsung,exynos5433-lpass.txt

diff --git a/Documentation/devicetree/bindings/sound/samsung,exynos5433-lpass.txt b/Documentation/devicetree/bindings/sound/samsung,exynos5433-lpass.txt
new file mode 100644
index 0000000..4beef25
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/samsung,exynos5433-lpass.txt
@@ -0,0 +1,8 @@
+
+Samsung Exynos SoC Low Power Audio Subsystem (LPASS)
+
+Required properties:
+
+ - compatible : "samsung,exynos5433-lpass"
+ - reg : should contain the LPASS SFR region location and size
+ - samsung,pmu-syscon : the phandle to the Power Management Unit node
-- 
1.9.1
