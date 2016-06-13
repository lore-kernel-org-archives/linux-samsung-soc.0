From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: [PATCH RFC 2/6] ASoC: samsung: Add DT bindings documentation for LPASS
Date: Mon, 13 Jun 2016 12:52:36 +0200
Message-ID: <1465815160-28504-3-git-send-email-s.nawrocki@samsung.com>
References: <1465815160-28504-1-git-send-email-s.nawrocki@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:51041 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1161051AbcFMKyR (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 13 Jun 2016 06:54:17 -0400
In-reply-to: <1465815160-28504-1-git-send-email-s.nawrocki@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: broonie@kernel.org, alsa-devel@alsa-project.org, devicetree@vger.kernel.org
Cc: robh@kernel.org, linux-samsung-soc@vger.kernel.org, ideal.song@samsung.com, beomho.seo@samsung.com, inki.dae@samsung.com, k.kozlowski@samsung.com, b.zolnierkie@samsung.com, Sylwester Nawrocki <s.nawrocki@samsung.com>

This patch add documentation of the DT bindings for the Samsung
Exynos SoC Low Power Audio Subsystem.

Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
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
