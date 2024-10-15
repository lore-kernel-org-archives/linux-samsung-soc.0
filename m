Received: from out-02.smtp.spacemail.com (out-02.smtp.spacemail.com [63.250.43.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDE561FE105;
	Tue, 15 Oct 2024 21:02:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=63.250.43.87
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729026155; cv=none; b=gRd9obOAal/1GTkmm+QD51kEHr9xK2vy/pMh8bofvZhtP6wqilVNVOyf9HdLkdQssK5xf05UkRssUZQOnd5lKOGFWYbIM4KNOtgpiw6hCFXtSRZcGr+ysHnGT+jTe5iepXd/zGIARp0so4Yj3Qtea6YIopjWaIeyZCPhyyk/0SA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729026155; c=relaxed/simple;
	bh=6jq72hVNwLzr/2NapVqA51w6jpOXYCGl9aLMLQa9Nf0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=T2+ry/ItZTL2w4PbaN15D5niC05FPcfA82W+Iu98Gn7r/Mk32KWNo+sdk1FidE+Rl4t1daO3vUxN8XvYLs7x6wvm1VQW+0WJ4la+sjhk842yQF7hxDub21bi1oGqWxewOUyXPbsQ/h+AikJc8h3UBy1rW4K1TKHTnR2sdEU9qFE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mentallysanemainliners.org; spf=pass smtp.mailfrom=mentallysanemainliners.org; dkim=pass (2048-bit key) header.d=mentallysanemainliners.org header.i=@mentallysanemainliners.org header.b=B9ojBWkr; arc=none smtp.client-ip=63.250.43.87
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mentallysanemainliners.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mentallysanemainliners.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mentallysanemainliners.org header.i=@mentallysanemainliners.org header.b="B9ojBWkr"
Received: from prod-lbout-phx.jellyfish.systems (unknown [198.177.122.3])
	by smtp.spacemail.com (Postfix) with ESMTPA id 4XSmkw6wDfz4wgK;
	Tue, 15 Oct 2024 21:02:32 +0000 (UTC)
Received: from igor-systemproductname.lan (83.8.240.202.ipv4.supernova.orange.pl [83.8.240.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.spacemail.com (Postfix) with ESMTPSA id 4XSmkn4HbCz8sWT;
	Tue, 15 Oct 2024 21:02:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=mentallysanemainliners.org; s=spacemail; t=1729026147;
	bh=6jq72hVNwLzr/2NapVqA51w6jpOXYCGl9aLMLQa9Nf0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=B9ojBWkrkhBdHnLuGrxEjS8ugf3EPERNZXuQzN/ueBsMWSuKVQ2TtMG4XumTgTuPR
	 zUq/jQ/uKECPRz8y0SCNeYr1QKlFeHtwbIiXMBUKaszXUoEF6+ZA1l5ne/PtOe8KGL
	 FMfsBscp15SslmO8zSj+DnxbpMQW8VAsDZJbcLjzhOcqHExKSIea3QlvcSmz6Og8Ja
	 hKqOztMp4pU4hGYrFcAi5ec4C4MiNZ/zQ8KoaP2XHVVss2Z7iUY30c1Wr35SqHf1u7
	 yWclG8krCsPIZYtFwtAhesr1oqK6/dyFqLxU50qXv4+SyyswMN/m5nvJBls7Pkjg4K
	 LZ8E5JW3WldTQ==
From: Igor Belwon <igor.belwon@mentallysanemainliners.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	David Wronek <davidwronek@gmail.com>,
	Sibi Sankar <quic_sibis@quicinc.com>,
	Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 5/6] arm64: dts: exynos: Add initial support for the Exynos 990 SoC
Date: Tue, 15 Oct 2024 23:02:04 +0200
Message-ID: <20241015210205.963931-6-igor.belwon@mentallysanemainliners.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241015210205.963931-1-igor.belwon@mentallysanemainliners.org>
References: <20241015210205.963931-1-igor.belwon@mentallysanemainliners.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Exynos 990 SoC is an ARMv8 mobile SoC found in Samsung Galaxy N/S20
series phones (x1sxxx, c1sxxx). Add minimal support for this SoC,
including:

- All 8 cores via PSCI
- ChipID
- Generic timer.

The devices using this SoC suffer from the same issue as Exynos 8895
caused by the stock Samsung bootloader, as it doesn't configure
CNTFRQ_EL0. Hence it's needed to hardcode the adequate frequency in the
timer node, otherwise the kernel panics.

Signed-off-by: Igor Belwon <igor.belwon@mentallysanemainliners.org>
---
 arch/arm64/boot/dts/exynos/exynos990.dtsi | 194 ++++++++++++++++++++++
 1 file changed, 194 insertions(+)
 create mode 100644 arch/arm64/boot/dts/exynos/exynos990.dtsi

diff --git a/arch/arm64/boot/dts/exynos/exynos990.dtsi b/arch/arm64/boot/dts/exynos/exynos990.dtsi
new file mode 100644
index 000000000000..16fda5fe8163
--- /dev/null
+++ b/arch/arm64/boot/dts/exynos/exynos990.dtsi
@@ -0,0 +1,194 @@
+// SPDX-License-Identifier: GPL-2.0 OR BSD-3-Clause
+/*
+ * Samsung Exynos 990 SoC device tree source
+ *
+ * Copyright (c) 2024, Igor Belwon <igor.belwon@mentallysanemainliners.org>
+ */
+
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+
+/ {
+	compatible = "samsung,exynos990";
+	#address-cells = <2>;
+	#size-cells = <1>;
+
+	interrupt-parent = <&gic>;
+
+	arm-a55-pmu {
+		compatible = "arm,cortex-a55-pmu";
+		interrupts = <GIC_SPI 163 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 164 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 165 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 166 IRQ_TYPE_LEVEL_HIGH>;
+
+		interrupt-affinity = <&cpu0>,
+				     <&cpu1>,
+				     <&cpu2>,
+				     <&cpu3>;
+	};
+
+	arm-a76-pmu {
+		compatible = "arm,cortex-a76-pmu";
+		interrupts = <GIC_SPI 167 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 168 IRQ_TYPE_LEVEL_HIGH>;
+
+		interrupt-affinity = <&cpu4>,
+				     <&cpu5>;
+	};
+
+	/* There's no PMU model for cluster2, which are the Mongoose cores. */
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
+
+				core2 {
+					cpu = <&cpu2>;
+				};
+
+				core3 {
+					cpu = <&cpu3>;
+				};
+			};
+
+			cluster1 {
+				core0 {
+					cpu = <&cpu4>;
+				};
+
+				core1 {
+					cpu = <&cpu5>;
+				};
+			};
+
+			cluster2 {
+				core0 {
+					cpu = <&cpu6>;
+				};
+
+				core1 {
+					cpu = <&cpu7>;
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
+		cpu1: cpu@1 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a55";
+			reg = <0x1>;
+			enable-method = "psci";
+		};
+
+		cpu2: cpu@2 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a55";
+			reg = <0x2>;
+			enable-method = "psci";
+		};
+
+		cpu3: cpu@3 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a55";
+			reg = <0x3>;
+			enable-method = "psci";
+		};
+
+		cpu4: cpu@100 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a76";
+			reg = <0x4>;
+			enable-method = "psci";
+		};
+
+		cpu5: cpu@101 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a76";
+			reg = <0x5>;
+			enable-method = "psci";
+		};
+
+		cpu6: cpu@200 {
+			device_type = "cpu";
+			compatible = "samsung,mongoose-m5";
+			reg = <0x6>;
+			enable-method = "psci";
+		};
+
+		cpu7: cpu@201 {
+			device_type = "cpu";
+			compatible = "samsung,mongoose-m5";
+			reg = <0x7>;
+			enable-method = "psci";
+		};
+	};
+
+	oscclk: clock-osc {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-output-names = "oscclk";
+	};
+
+	psci {
+		compatible = "arm,psci-0.2";
+		method = "hvc";
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
+			compatible = "samsung,exynos990-chipid",
+				     "samsung,exynos850-chipid";
+			reg = <0x10000000 0x100>;
+		};
+
+		gic: interrupt-controller@10101000 {
+			compatible = "arm,gic-400";
+			reg = <0x10101000 0x1000>,
+			      <0x10102000 0x1000>,
+			      <0x10104000 0x2000>,
+			      <0x10106000 0x2000>;
+			#interrupt-cells = <3>;
+			interrupt-controller;
+			interrupts = <GIC_PPI 9 (GIC_CPU_MASK_SIMPLE(8) |
+						 IRQ_TYPE_LEVEL_HIGH)>;
+			#address-cells = <0>;
+			#size-cells = <1>;
+		};
+	};
+
+	timer {
+		compatible = "arm,armv8-timer";
+		interrupts = <GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>,
+			     <GIC_PPI 14 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>,
+			     <GIC_PPI 11 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>,
+			     <GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>;
+
+		/*
+		 * Non-updatable, broken stock Samsung bootloader does not
+		 * configure CNTFRQ_EL0
+		 */
+		clock-frequency = <26000000>;
+	};
+};
-- 
2.45.2

