Received: from out-03.smtp.spacemail.com (out-03.smtp.spacemail.com [63.250.43.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 098B2226EFC;
	Thu,  5 Dec 2024 19:41:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=63.250.43.88
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733427708; cv=none; b=Zhg5HJaMfgfiEKNW4ayY5BGFYi4qjoNH5eb7VQ2VYzCnnPdsCbWk9QsTOpy+95VnOK8tB+C/XnE3JcYNog6bK3Gwqb2OLgQbazW/JihsD7j9+/in+LPCokl7jmE2vq+HJB0sX9GCjHkXWsTSJuU4fUuEKsmcMoRRIlsMrUOzMEQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733427708; c=relaxed/simple;
	bh=S+XF9CEtJz8Nknm8jOTFbwkWG8Xo+OeWyx4ohG4VJhQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NPVENIw2upQYdC6kvZAoJXm0q5VMGGxrgCFnwVVoUtEkp51vUntbNMaUIe4JfZTmmFSbFB/g9kJDxgJXkCyZTIpj98Y+ULvav19Np/wVUH0icFLRHmaVX7eTPWwTHgy6v101iHUKfQadHdqIs8XqPxMcMzzILGHYc3W1BdMuHA8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mentallysanemainliners.org; spf=pass smtp.mailfrom=mentallysanemainliners.org; dkim=pass (2048-bit key) header.d=mentallysanemainliners.org header.i=@mentallysanemainliners.org header.b=ktJxCgsh; arc=none smtp.client-ip=63.250.43.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mentallysanemainliners.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mentallysanemainliners.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mentallysanemainliners.org header.i=@mentallysanemainliners.org header.b="ktJxCgsh"
Received: from prod-lbout-phx.jellyfish.systems (unknown [198.177.122.3])
	by smtp.spacemail.com (Postfix) with ESMTPA id 4Y44X80FnmzGpLp;
	Thu, 05 Dec 2024 19:41:44 +0000 (UTC)
Received: from localhost.localdomain (83.21.102.241.ipv4.supernova.orange.pl [83.21.102.241])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.spacemail.com (Postfix) with ESMTPSA id 4Y44X06TdHz2x99;
	Thu,  5 Dec 2024 19:41:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=mentallysanemainliners.org; s=spacemail; t=1733427698;
	bh=S+XF9CEtJz8Nknm8jOTFbwkWG8Xo+OeWyx4ohG4VJhQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ktJxCgshI1qHvAXUjlPolw2LWmbwqb2qL06M1JwVkK9B2XKQwLWgnsXAWwKZbqPoh
	 WscCMMwOmJPzWrr8jpXENKYpszaNtyfpcHWwfjK0M7A6yjpY9cjmTJgM0+MTCz8Typ
	 OJyf4v5+KB/WFhG24V61+vfHbRnPBdgkAhNbim1awWPgBv2vWv20cjduFdLrgBm3T/
	 gtq/IrFPDeez0QEu2F1Z0JDXirxSoONYp7ak8uPBtxijiGzEbw3+sKz9ynrSNk6NmG
	 46YKJZLNTAB3kyTjuiC9Tj2mIJj+v1BhLCccrY1Cj3cwTiIQlrad21rUvhw5kQAg/I
	 X/W4QvtYjp2oA==
From: Igor Belwon <igor.belwon@mentallysanemainliners.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 1/1] arm64: dts: exynos990: Add clock management unit nodes
Date: Thu,  5 Dec 2024 20:40:20 +0100
Message-ID: <20241205194020.785846-2-igor.belwon@mentallysanemainliners.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241205194020.785846-1-igor.belwon@mentallysanemainliners.org>
References: <20241205194020.785846-1-igor.belwon@mentallysanemainliners.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add CMU nodes for:
- cmu_top: provides clocks for other blocks
- cmu_hsi0: provides clocks for usb31

Signed-off-by: Igor Belwon <igor.belwon@mentallysanemainliners.org>
---
 arch/arm64/boot/dts/exynos/exynos990.dtsi | 27 +++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/exynos990.dtsi b/arch/arm64/boot/dts/exynos/exynos990.dtsi
index c1986f00e443..49bb1e156843 100644
--- a/arch/arm64/boot/dts/exynos/exynos990.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos990.dtsi
@@ -5,6 +5,7 @@
  * Copyright (c) 2024, Igor Belwon <igor.belwon@mentallysanemainliners.org>
  */
 
+#include <dt-bindings/clock/samsung,exynos990.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 
 / {
@@ -199,6 +200,23 @@ pinctrl_peric1: pinctrl@10730000 {
 			interrupts = <GIC_SPI 417 IRQ_TYPE_LEVEL_HIGH>;
 		};
 
+		cmu_hsi0: clock-controller@10a00000 {
+			compatible = "samsung,exynos990-cmu-hsi0";
+			reg = <0x10a00000 0x8000>;
+			#clock-cells = <1>;
+
+			clocks = <&oscclk>,
+				 <&cmu_top CLK_DOUT_CMU_HSI0_BUS>,
+				 <&cmu_top CLK_DOUT_CMU_HSI0_USB31DRD>,
+				 <&cmu_top CLK_DOUT_CMU_HSI0_USBDP_DEBUG>,
+				 <&cmu_top CLK_DOUT_CMU_HSI0_DPGTC>;
+			clock-names = "oscclk", "dout_cmu_hsi0_bus",
+						"dout_cmu_hsi0_usb31drd",
+						"dout_cmu_hsi0_usbdp_debug",
+						"dout_cmu_hsi0_dpgtc";
+
+		};
+
 		pinctrl_hsi1: pinctrl@13040000 {
 			compatible = "samsung,exynos990-pinctrl";
 			reg = <0x13040000 0x1000>;
@@ -231,6 +249,15 @@ pinctrl_cmgp: pinctrl@15c30000 {
 			compatible = "samsung,exynos990-pinctrl";
 			reg = <0x15c30000 0x1000>;
 		};
+
+		cmu_top: clock-controller@1a330000 {
+			compatible = "samsung,exynos990-cmu-top";
+			reg = <0x1a330000 0x8000>;
+			#clock-cells = <1>;
+
+			clocks = <&oscclk>;
+			clock-names = "oscclk";
+		};
 	};
 
 	timer {
-- 
2.45.2

