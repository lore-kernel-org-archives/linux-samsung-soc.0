Received: from sendmail.purelymail.com (sendmail.purelymail.com [34.202.193.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D69C1D5176
	for <linux-samsung-soc@vger.kernel.org>; Sat,  4 Jan 2025 20:54:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=34.202.193.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736024077; cv=none; b=kcaRCmNqmRppW/5fBKuBc/wqayjFQ0T3z6OqNAhrn6/H//kkkJfLMg8wuoMw9jtgiOTwNaOY2kspIvK7PIUrhi4dDMtQwF6AByYyVE1SLNpDoMgll1yfGC0GvaKDrWApre73zfEZgD1vCkbJ9PHhcfgEadBtyNHAO7v7B4GNMaA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736024077; c=relaxed/simple;
	bh=y7XGmitoB/d2FvK9oMBRHq/8yp1wqAV+TBRDnbZB5hI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=A8k0Y0JI96gMIYtc01TnqtjzoDHt01XdT3EqGC965stqwRhG7TWxYtgEED3R4czOQ8RWE2NBG/xnye+Qku/v0Rbfy/MlZzf0CD55Saab5UZNpoFdO31oSe6RoARXcG4U4uXeLP4znp+8Rm/WjSCo2VQx+2nGKgEraYx+U/OEp/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mentallysanemainliners.org; spf=pass smtp.mailfrom=mentallysanemainliners.org; dkim=pass (2048-bit key) header.d=purelymail.com header.i=@purelymail.com header.b=KCWzH/Nr; arc=none smtp.client-ip=34.202.193.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mentallysanemainliners.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mentallysanemainliners.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purelymail.com header.i=@purelymail.com header.b="KCWzH/Nr"
Authentication-Results: purelymail.com; auth=pass
DKIM-Signature: a=rsa-sha256; b=KCWzH/NrfDRl0+2n/iVUM9pAtbsVro7gQCLC6SIXHPJjvIZEHSlFkzuolfgmZnZlg7X5vUeVgP5rYh73jHH3ZdiNTZErHhLFc9GF/6FPRvNsySLgbWZLHfW7dQL4mhEOzeP90mQWc3E4sR1CCuXJiTFxNubCVS57VbkMJb9wWSbYnqLbzYZLsucESY/WiCryLYZLoxk5Fz1K3oYO4GZcl8g2jF08d4quoB06nxkng9vf6tUU5A70rNMGYTchNWBIY29UwVWfiWv09DiKpfG7NbZMkDaNWLBRnUu2cQzC4fjTW4IAyjoRVkR2aMf5sKzXFd+vPfWo0k/Vdf+p5QoICw==; s=purelymail3; d=purelymail.com; v=1; bh=y7XGmitoB/d2FvK9oMBRHq/8yp1wqAV+TBRDnbZB5hI=; h=Feedback-ID:Received:From:Date:Subject:To;
Feedback-ID: 68247:10037:null:purelymail
X-Pm-Original-To: linux-samsung-soc@vger.kernel.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 166263896;
          (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
          Sat, 04 Jan 2025 20:54:32 +0000 (UTC)
From: Igor Belwon <igor.belwon@mentallysanemainliners.org>
Date: Sat, 04 Jan 2025 21:54:17 +0100
Subject: [PATCH 2/2] arm64: dts: exynos990: Add CMU_PERIS and MCT nodes
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250104-cmu-nodes-v1-2-ae8af253bc25@mentallysanemainliners.org>
References: <20250104-cmu-nodes-v1-0-ae8af253bc25@mentallysanemainliners.org>
In-Reply-To: <20250104-cmu-nodes-v1-0-ae8af253bc25@mentallysanemainliners.org>
To: Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, 
 Igor Belwon <igor.belwon@mentallysanemainliners.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1736024066; l=2006;
 i=igor.belwon@mentallysanemainliners.org; s=20241206;
 h=from:subject:message-id; bh=y7XGmitoB/d2FvK9oMBRHq/8yp1wqAV+TBRDnbZB5hI=;
 b=wp2LiSqexkr9nlHacMJNjzsq1rbdxz2rqG+owfiMvUU9d/JnivDj75Gj+YL+MCUHbOd/T6a4R
 ISu+kItYJrcDs1YSZ0vQDqHEwKNs6b49ulHYnfWXL7UGuSX/+cCpHzK
X-Developer-Key: i=igor.belwon@mentallysanemainliners.org; a=ed25519;
 pk=qKAuSTWKTaGQM0vwBxV0p6hPKMN4vh0CwZ+bozrG5lY=

CMU_PERIS is a new clock controller that clocks the MCT. The MCT has 9
timers (1x count-up global timer, 8x count-down CPU local).
The global timer generates 4 interrupts, and each local timer
generates one interrupt. So, in total 12 interrupts.

Signed-off-by: Igor Belwon <igor.belwon@mentallysanemainliners.org>
---
 arch/arm64/boot/dts/exynos/exynos990.dtsi | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/exynos990.dtsi b/arch/arm64/boot/dts/exynos/exynos990.dtsi
index 9d017dbed9523e874891f13258d331c3e829ca03..0e18711cbdc98a65cbd2d709cdd53a7680b833f2 100644
--- a/arch/arm64/boot/dts/exynos/exynos990.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos990.dtsi
@@ -181,6 +181,36 @@ chipid@10000000 {
 			reg = <0x10000000 0x100>;
 		};
 
+		cmu_peris: clock-controller@10020000 {
+			compatible = "samsung,exynos990-cmu-peris";
+			reg = <0x10020000 0x8000>;
+			#clock-cells = <1>;
+
+			clocks = <&oscclk>,
+				 <&cmu_top CLK_DOUT_CMU_PERIS_BUS>;
+			clock-names = "oscclk", "bus";
+		};
+
+		timer@10040000 {
+			compatible = "samsung,exynos990-mct",
+				     "samsung,exynos4210-mct";
+			reg = <0x10040000 0x800>;
+			clocks = <&oscclk>, <&cmu_peris CLK_GOUT_PERIS_MCT_PCLK>;
+			clock-names = "fin_pll", "mct";
+			interrupts = <GIC_SPI 466 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 467 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 468 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 469 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 470 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 471 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 472 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 473 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 474 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 475 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 476 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 477 IRQ_TYPE_LEVEL_HIGH>;
+		};
+
 		gic: interrupt-controller@10101000 {
 			compatible = "arm,gic-400";
 			reg = <0x10101000 0x1000>,

-- 
2.45.2

