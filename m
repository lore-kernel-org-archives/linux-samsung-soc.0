Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793392454;
	b=HJptjwmjwQqD0fkkonje3zr0pMgeiV/iu7hFTbPDenqsNOd0mYI8pPL+SXm+EG00R8Ex
	 TF7HFP5bQDVXccE8CJlhrE/brDlIV6Ybnaza6Vg9XB17jJPKaDvTY+4KRaF0eaaoWlLDD
	 VciZQL4OI198PCq2vbC4bZzTHF0LTTBSWH3JcumdCrqqF3WtyzCQCVkHB7fYY3R7mZQyq
	 DjNNAxD9d4BSZeFR2dXUIkTyOCQxlq4ESQ24Ce7o0KTPC2OV4o+JDEdJXDUi9uoQyWVBf
	 mGzpNDJDYfuqrmLrFNJoDRk0u9aSX3oxdGYbuDD6gv1NaTEclT0DbLJNYKt/5F/B6Qg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793392454;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=XMPDAtMk6xp244WKC1g6JD6n3rRwtoMpWHAZQdKlsyo=;
	b=jcIX82UWL/Lvt0e6jD03puCT/M/hXwPrigOegdSyGKvaBuAiNeVzR3VhV9KLYQH2JHCf
	 Q5hZHpqbh5Si9jpbU1hSzrXC9ePNvvz+Q1DSG0HtCwuWUo0XdYd0LMCBDWs1AlHu5RN80
	 i8/9mDmYmCv1oKmaHScPPfupMJXPgG9Y1yeNaU0lh1SixSHXtze2kCg5hLSdSGSj3wgnx
	 QbFwmTTNgfsBFGtcwBybA73poz6Gg2xaIBGqGoJT2NAfsv5QQsMpu1IU2Y94b5XzWHPB5
	 cu7u+GNwl59uxr4WKCgdg/dXRphfyi5c+Cr84J8onOsA7TEbXNI1JvFiuiZmlq2VYzw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="c/4Z0tEu";
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0931606A335;
	Fri, 30 Oct 2026 20:34:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=c/4Z0tEu
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793392453;
	b=ZlfU4cHyRqzpz1oIcnKGrv/LfYThMWMiHfJA0b4GNyf0pyhyU/VBBgr3udrqcaHy/1l6
	 F5gQHhuZnNttLDqGiO/VQgWh6lSFUFzS8dxlAwn2EykYqnk8ipbgzODuB01Xs9oRMu8Uf
	 kuyV2MdwK9UK026g/MIB8Xw8g4p5/adp2LrMDEfqraE49gget+Wsv8/KSAp0ffTfo5dji
	 OPseZi4ImCbEXU57wN+gcKcWQdxaKE8fBz7p667CqX3tK1AvsRvmSpvTk+xoc57fDjXK6
	 KApDajP1BOBUanoOY3MPzDfnGKgsiov/GXlr8A4dSR4goaxXgQeIkLaP4V6jSv3STLw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793392453;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=XMPDAtMk6xp244WKC1g6JD6n3rRwtoMpWHAZQdKlsyo=;
	b=VEHTLgbuf6Ttu/CZA2mTdWoz/OuizPS2eUejeEvibzBWessO0Rpq1FmJ2QDlGkVeZqi3
	 kQhElJePrzsr39oq1rh7Fyph0VkX02uWX4zgohFUtF33akUnH+GMjjbUF9iZCnoGrN+uy
	 woqfZCUJ0r5W7fsyXLDfaVe6G4kh1LTYv9cP8TTkyxFF5t/x2/84lgYV7W7XzTkug1mkN
	 4cnOoQOVIAtZUMvYoyZSjYAbYLcv4rTcQWlOzVrxywzsDMMPxZhKpLf8SkSVU5Suo84Xa
	 1wrUe3Buz+8SP/7VyvjmdQ/mOd4nHMX3sbU6Wtxz3io2H34YFcX63hk7C2/LI/A/NuQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 482301F00A1B;
	Fri, 30 Oct 2026 20:34:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793392453;
	bh=XMPDAtMk6xp244WKC1g6JD6n3rRwtoMpWHAZQdKlsyo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=c/4Z0tEu2kjH8G2eaoWCeqhIZ3ShVnJiSM+81Cj0xBkzN814QU1j7UwbrpjEeqF5v
	 ETs9hJBiMTdLR/yY8WPQUbGpe6l5elHpvJqxd82T5UqzUfzKJ1eQPic3t1WC/c4bNu
	 XRLXWcBvm2Jgo+yMuvgLgQ7MpQwhuANuV6zoOZLDcN2qPeYgp+J0Yk8K5Ua2g9Afir
	 HLbs/rVnKzTolkYY8mnrbTm2v/CyC1sIxrhBmudXbCAMga98HmV76n1xSGQV6NbjDi
	 e1xKzeTixr7bcufBkykR6L0JYPiMF8cmONn7XKZCUbBpokIZN38HuGHrUr3Mso7Lre
	 TqrIltdgUz2yg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id C80884428B;
	Fri, 30 Oct 2026 20:34:11 +0000 (UTC)
From: Aiden Isik via B4 Relay <devnull+aidenisik.member.fsf.org@kernel.org>
Date: Fri, 30 Oct 2026 20:33:59 +0000
Subject: [PATCH v3 4/5] arm64: dts: exynos: Add initial support for
 Exynos5515 SoC
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Post: <mailto:linux-samsung-soc@vger.kernel.org>
List-Help: <mailto:linux-samsung-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-samsung-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261030-for-next-lucky7-v3-4-81e02272ce69@member.fsf.org>
References: <20261030-for-next-lucky7-v3-0-81e02272ce69@member.fsf.org>
In-Reply-To: <20261030-for-next-lucky7-v3-0-81e02272ce69@member.fsf.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Aiden Isik <aidenisik@member.fsf.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5895;
 i=aidenisik@member.fsf.org; h=from:subject:message-id;
 bh=5rMgbk9dxNqx6lMdM/XH94mp7Y6duvsbD37g7IG2HUM=;
 b=owEBiQJ2/ZANAwAIAUknAbLEetfrAcsmYgBq5P9CVxmHgN48KFQZ6fCAL93C7L18lIAFvJu5d
 38yAkTsdBiJAk8EAAEIADkWIQSDy8UkXGpc3JNbEaVJJwGyxHrX6wUCauT/QhsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDIACgkQSScBssR61+vEHRAAzM1FvsVtUBYFnbu1QqoA8TcUd6+USbr
 7Nh74IEhkA8EEUvbF0f6CqW9Z5CrpEv4jFV4/DjQvMAkrb4HgIwJV4vkm9e3srxoiq1eBuwpd5j
 6khjWj02SI7QyeivT5qeUgqUQrS0hd/WxIHtf6/K7Lhat30H16V/kDYtBfjRBTgmBs9sqDSPbMl
 KI9s438Ovys3O956Eg9Z1lKJiBBcdXE1hyK3h16eEQZ+AHxwx3sj48imMMbUBI5zf+7pPTmGaV5
 bNFJv1k+E+7udN+qNuhmgV82SJFQaSz5Yg2yN8g+mBZLT7BPxHgD9Nali5JDBaEYSyk8GQK/M+t
 FquTZYYAteg5WhlutBkCNRQK4r4INcaO/ntKabCeDhx7fegS+ICqyCxFpAOYMgvTJxIwzqE/lAl
 NJ7iCgJi+1D+IZnRy8gNZQlJLDfPs4gvX0PzmmD/yAlQyi/N2VZlEg67TuAgYFNi1ViYNshGxKl
 dCxfuP8GuFJA9kz0Qb/IjRW1eS+semSVZRbto6CoRAJWrG3zPZUHQma8d1MU2QVbCFen2VF0jSo
 kHvgpBqztNjptNPkF2mz/bOKptkg2WR+MGXtzvkKI9X5pnZuGhVzhJAdPsePzNXqeP5y8OkcJPr
 61BZXr3dUf0XX0TUsO5Z31koSAd/npFqC98cImJ3JniDHN+Wxo9E=
X-Developer-Key: i=aidenisik@member.fsf.org; a=openpgp;
 fpr=83CBC5245C6A5CDC935B11A5492701B2C47AD7EB
X-Endpoint-Received: by B4 Relay for aidenisik@member.fsf.org/default with
 auth_id=956
X-Original-From: Aiden Isik <aidenisik@member.fsf.org>
Reply-To: aidenisik@member.fsf.org
Content-Transfer-Encoding: 7bit

From: Aiden Isik <aidenisik@member.fsf.org>

The Exynos5515 is an ARMv8 wearable SoC, used in the following devices:
- Samsung Galaxy Watch 4 (SM-R860/SM-R865/SM-R870/SM-R875)
- Samsung Galaxy Watch 4 Classic (SM-R880/SM-R885/SM-R890/SM-R895)
- Samsung Galaxy Watch FE (SM-R861/SM-R866)
- Samsung Galaxy Watch 5 (SM-R900/SM-R905/SM-R910/SM-R915)
- Samsung Galaxy Watch 5 Pro (SM-R920/SM-R925)
- Samsung Galaxy Watch 6 (SM-R930/SM-R935/SM-R940/SM-R945)
- Samsung Galaxy Watch 6 Classic (SM-R950/SM-R955/SM-R960/SM-R965)

Add the following support for this SoC:
- Both Cortex-A55 cores
- ChipID
- Generic timer
- CMU_TOP, CMU_PERI, and CMU_FSYS clock management units

The devices using this SoC suffer from the same issue as many other
Samsung devices, where the stock bootloader does not configure CNTFRQ_EL0.
To mitigate this, the correct frequency is hardcoded in the timer node.

The VGIC maintenance interrupt on this SoC is also unavailable.

Signed-off-by: Aiden Isik <aidenisik@member.fsf.org>
---
 arch/arm64/boot/dts/exynos/exynos5515.dtsi | 178 +++++++++++++++++++++++++++++
 1 file changed, 178 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/exynos5515.dtsi b/arch/arm64/boot/dts/exynos/exynos5515.dtsi
new file mode 100644
index 000000000000..ea70a45bfa50
--- /dev/null
+++ b/arch/arm64/boot/dts/exynos/exynos5515.dtsi
@@ -0,0 +1,178 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Samsung Exynos 5515 SoC device tree source
+ *
+ * Copyright (c) 2026 Aiden Isik <aidenisik+git@member.fsf.org>
+ */
+
+#include <dt-bindings/clock/samsung,exynos5515-cmu.h>
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+
+/ {
+	compatible = "samsung,exynos5515";
+	#address-cells = <2>;
+	interrupt-parent = <&gic>;
+	#size-cells = <1>;
+
+	cpus {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		cpu-map {
+			cluster0 {
+				core0 {
+					cpu = <&cpu0>;
+				};
+
+				core1 {
+					cpu = <&cpu1>;
+				};
+			};
+		};
+
+		cpu0: cpu@0 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a55";
+			reg = <0x0>;
+			enable-method = "psci";
+		};
+
+		cpu1: cpu@100 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a55";
+			reg = <0x100>;
+			enable-method = "psci";
+		};
+	};
+
+	oscclk: osc-clock {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-output-names = "oscclk";
+	};
+
+	pmu {
+		compatible = "arm,cortex-a55-pmu";
+		interrupt-affinity = <&cpu0>,
+				     <&cpu1>;
+		interrupts = <GIC_SPI 99 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 100 IRQ_TYPE_LEVEL_HIGH>;
+	};
+
+	psci {
+		compatible = "arm,psci-1.0";
+		method = "smc";
+	};
+
+	soc: soc@0 {
+		compatible = "simple-bus";
+		ranges = <0x0 0x0 0x0 0x20000000>;
+
+		#address-cells = <1>;
+		#size-cells = <1>;
+
+		chipid@10000000 {
+			compatible = "samsung,exynos5515-chipid",
+				     "samsung,exynos850-chipid";
+			reg = <0x10000000 0x100>;
+		};
+
+		sysreg_peri: syscon@10020000 {
+			compatible = "samsung,exynos5515-peri-sysreg", "syscon";
+			reg = <0x10020000 0x10000>;
+			clocks = <&cmu_peri CLK_GOUT_PERI_SYSREG_PCLK>;
+		};
+
+		cmu_peri: clock-controller@10030000 {
+			compatible = "samsung,exynos5515-cmu-peri";
+			reg = <0x10030000 0x10000>;
+			#clock-cells = <1>;
+			clocks = <&oscclk>,
+				 <&cmu_top CLK_DOUT_CMU_PERI_BUS>,
+				 <&cmu_top CLK_DOUT_CMU_PERI_IP>,
+				 <&cmu_top CLK_DOUT_CMU_PERI_UART>;
+			clock-names = "oscclk",
+				      "bus",
+				      "ip",
+				      "uart";
+			samsung,sysreg = <&sysreg_peri>;
+		};
+
+		cmu_fsys: clock-controller@10400000 {
+			compatible = "samsung,exynos5515-cmu-fsys";
+			reg = <0x10400000 0x10000>;
+			#clock-cells = <1>;
+			clocks = <&oscclk>,
+				 <&cmu_top CLK_DOUT_CMU_FSYS_BUS>,
+				 <&cmu_top CLK_DOUT_CMU_FSYS_MMC_CARD>,
+				 <&cmu_top CLK_DOUT_CMU_FSYS_MMC_EMBD>,
+				 <&cmu_top CLK_DOUT_CMU_FSYS_USB20DRD>;
+			clock-names = "oscclk",
+				      "bus",
+				      "mmc_card",
+				      "mmc_embd",
+				      "usb20drd";
+			samsung,sysreg = <&sysreg_fsys>;
+		};
+
+		sysreg_fsys: syscon@10420000 {
+			compatible = "samsung,exynos5515-fsys-sysreg", "syscon";
+			reg = <0x10420000 0x10000>;
+			clocks = <&cmu_fsys CLK_GOUT_FSYS_SYSREG_PCLK>;
+		};
+
+		pmu_system_controller: system-controller@12860000 {
+			compatible = "samsung,exynos5515-pmu",
+				     "samsung,exynos7-pmu",
+				     "syscon";
+			reg = <0x12860000 0x10000>;
+		};
+
+		cmu_top: clock-controller@15410000 {
+			compatible = "samsung,exynos5515-cmu-top";
+			reg = <0x15410000 0x10000>;
+			#clock-cells = <1>;
+			clocks = <&oscclk>;
+			clock-names = "oscclk";
+			samsung,sysreg = <&sysreg_top>;
+		};
+
+		sysreg_top: syscon@15430000 {
+			compatible = "samsung,exynos5515-top-sysreg", "syscon";
+			reg = <0x15430000 0x10000>;
+		};
+
+		gic: interrupt-controller@15601000 {
+			compatible = "arm,gic-400";
+			reg = <0x15601000 0x1000>,
+			      <0x15602000 0x2000>,
+			      <0x15604000 0x2000>,
+			      <0x15606000 0x2000>;
+			#address-cells = <0>;
+			#interrupt-cells = <3>;
+			interrupt-controller;
+			/* VGIC maintenance interrupt is not available */
+		};
+	};
+
+	timer {
+		compatible = "arm,armv8-timer";
+		/*
+		 * Non-updatable, broken stock Samsung bootloader does not
+		 * configure CNTFRQ_EL0
+		 */
+		clock-frequency = <26000000>;
+		interrupts = <GIC_PPI 13
+			     (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>,
+			     <GIC_PPI 14
+			     (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>,
+			     <GIC_PPI 11
+			     (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>,
+			     <GIC_PPI 10
+			     (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>,
+			     <GIC_PPI 12
+			     (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>;
+	};
+};
+
+#include "arm/samsung/exynos-syscon-restart.dtsi"

-- 
2.54.0


