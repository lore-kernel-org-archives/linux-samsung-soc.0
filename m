Received: from smtp.forwardemail.net (smtp.forwardemail.net [149.28.215.223])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DB1B3C1D52
	for <linux-samsung-soc@vger.kernel.org>; Wed,  9 Sep 2026 19:45:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=149.28.215.223
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788983112; cv=none; b=scsCqBl7RyjlWDOIvOi6mfEyAxr6yoi2NJ0qv8hcOPDpokzZ8FovSRYsNL9J+PuC1qsF3uS5ehodcdYEF2e6y6jT0tN63JCHnqyf98i6Fmfz/CdOQ4vvWoXcEhzyOGiAGFmdkrkcUi8PFK+Ly7MzM5CD9GXV4l7hfDHDfTas1Yg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788983112; c=relaxed/simple;
	bh=+zidjm/GgvZOef60CcqN2ppYMZskzz16lLAHAPOZFUM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IPsV5XW+WHcj/2mb7g2zMpPHN73m0NHYcmZKBNk/u4wDUGd6jKpAsDRxiqnNobamyfcBXOhD1m/5fC6Zq4gHtQeLJ2wGV7SNjQZgYX6hlz+tbMsGfTRgPcCy0jKTULG2KPH/PdHndm0Scj7/PXt4t5wjB9dKwMXKHF4MrdM1XNg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lineageos.org; spf=pass smtp.mailfrom=fe-bounces.lineageos.org; dkim=pass (1024-bit key) header.d=lineageos.org header.i=@lineageos.org header.b=lclx5fW7; arc=none smtp.client-ip=149.28.215.223
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lineageos.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fe-bounces.lineageos.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lineageos.org header.i=@lineageos.org header.b="lclx5fW7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lineageos.org;
 h=Content-Transfer-Encoding: MIME-Version: References: In-Reply-To:
 Message-ID: Date: Subject: Cc: To: From; q=dns/txt; s=fe-2eefaa527c;
 t=1788983104; bh=GZ5x1+ZvIH2YXlOI+QiIyvpUOZD/W9C7B5rQxNBaN24=;
 b=lclx5fW7HYIwuzEfFw4LOsPjWZDaW+qlZ3fJGeOAiYLMcQ+dMrV7QxlIYdsrfR+yCQ10TU6if
 1zCp4rdE7SFW9ZcXJk0OqRjyuNa9ffr4c4K2aSx/BL5VWyykOImdb6WMbmHdp6L+P6h8KgA1fgY
 HfI1b9AQCmLEGA7PSmEiDds=
X-Forward-Email-ID: 6aa1b73b5382f19eb5d6c807
X-Forward-Email-Sender: rfc822; tturner@lineageos.org,
 smtp.forwardemail.net, 149.28.215.223
X-Forward-Email-Version: 2.14.2
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
From: Thomas Turner <tturner@lineageos.org>
To: semen.protsenko@linaro.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	peter.griffin@linaro.org
Cc: alim.akhtar@samsung.com,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	thomas_turner@talktalk.net
Subject: [PATCH v4 2/2] arm64: dts: exynos: Add GPU/Mali Bifrost node to Exynos850
Date: Wed,  9 Sep 2026 20:44:50 +0100
Message-ID: <20260909194450.183693-3-tturner@lineageos.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260909194450.183693-1-tturner@lineageos.org>
References: <20260909194450.183693-1-tturner@lineageos.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add nodes for GPU (Mali Bifrost) to Exynos850. Does not provide support
for temperature throttling, DVFS, power domains, governor support,
boosting and voltage control. Once PMIC is properly implemented, support
will hopefully increase. However, the panfrost driver probes, the
Mali-G52 GPU initializes and the core clock is set-up.

Testing for this patch was done on a device not currently supported by
linux, the Galaxy A21s. After enabling this node for that device
locally, I was able to test and confirm basic GPU functionality. As of
now, this patch has no users which have tested GPU capabilities and so
the node has been set to "disabled".

Here are some logs I pulled:

panfrost 11500000.gpu: clock rate = 377000000
panfrost 11500000.gpu: mali-g52 id 0x7212 major 0x0 minor 0x0 status 0x0
panfrost 11500000.gpu: features: 00000000,00000df7, issues: 00000000,00000400
panfrost 11500000.gpu: Features: L2:0x07100206 Shader:0x00000000 Tiler:0x00000809 Mem:0x1 MMU:0x00002830 AS:0xff JS:0x7
panfrost 11500000.gpu: shader_present=0x1 l2_present=0x1
panfrost 11500000.gpu: [drm] Using Transparent Hugepage
[drm] Initialized panfrost 1.6.0 for 11500000.gpu on minor 0

OpenGL core profile vendor: Mesa
OpenGL core profile renderer: Mali-G52 MC1 (Panfrost)
OpenGL core profile version: 3.1 (Core Profile) Mesa 26.1.6
OpenGL core profile shading language version: 1.40
OpenGL compatibility profile vendor: Mesa
OpenGL compatibility profile renderer: Mali-G52 MC1 (Panfrost)
OpenGL compatibility profile version: 3.1 (Core Profile) Mesa 26.1.6
OpenGL compatibility profile shading language version: 1.40
OpenGL ES profile vendor: Mesa
OpenGL ES profile renderer: Mali-G52 MC1 (Panfrost)
OpenGL ES profile version: OpenGL ES 3.1 Mesa 26.1.6
OpenGL ES profile shading language version: OpenGL ES GLSL ES 3.10

Signed-off-by: Thomas Turner <tturner@lineageos.org>
Reviewed-and-tested-by: Alexey Klimov <alexey.klimov@linaro.org>
---
Changes in v4:
  - Add Reviewed-and-tested-by tag

Changes in v3:
  - Re-word commit message to be less ambiguous
  - Provide some logs in the commit message
  - Add a blank line before status property

Changes in v2:
  - Add a patch addressing the samsung,exynos850-mali compatible string

 arch/arm64/boot/dts/exynos/exynos850.dtsi | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/exynos850.dtsi b/arch/arm64/boot/dts/exynos/exynos850.dtsi
index 911643008b9f..721b2b2c4ffb 100644
--- a/arch/arm64/boot/dts/exynos/exynos850.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos850.dtsi
@@ -310,6 +310,19 @@ cmu_g3d: clock-controller@11400000 {
 			clock-names = "oscclk", "dout_g3d_switch";
 		};
 
+		gpu: gpu@11500000 {
+			compatible = "samsung,exynos850-mali", "arm,mali-bifrost";
+			reg = <0x11500000 0x5000>;
+			interrupts = <GIC_SPI 126 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 127 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 125 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "job", "mmu", "gpu";
+			clocks = <&cmu_g3d CLK_GOUT_G3D_GPU_CLK>;
+			clock-names = "core";
+
+			status = "disabled";
+		};
+
 		cmu_apm: clock-controller@11800000 {
 			compatible = "samsung,exynos850-cmu-apm";
 			reg = <0x11800000 0x8000>;
-- 
2.47.3

