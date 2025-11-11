Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 154D7328636
	for <linux-samsung-soc@vger.kernel.org>; Tue, 11 Nov 2025 19:26:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762889210; cv=none; b=kTjPBSyDj3a2ighHmTB8zUNpA831I1GkNvLgjiJjL7OBX22PMQC/i11o8z4kp7KMrsoL4d1Pr4lNZ1luyaeZ0AG7ug5hvwlXPcyW3qy2YD7Y1H0tsBUyGP6cHKOTe5Ztj0242NJlLPaFSdiPGJL2X5uL3khO4jSqaw7fVfnsFfk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762889210; c=relaxed/simple;
	bh=4BWqdjAI1FgYLlZRElop3889oLKIxBOOQmVA7HAKui8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LGL0VtMdG46kskWC54EblUeEBqsQxGedDjv44hvsXjfUS2hu/KrLum9ifmFgpPSy6QbZIEmphXv88An/4gZeMQNrT9vMsnHszbE+FxCJn5G5K8RCRo6zgEB2PeKLD4NMo8yM9609PZQDJX27W6Jy9Jw8K3CQN+7htBIrKebKiQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=ZV0ndG3Q; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="ZV0ndG3Q"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-297d4ac44fbso22085ad.0
        for <linux-samsung-soc@vger.kernel.org>; Tue, 11 Nov 2025 11:26:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1762889207; x=1763494007; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sXztKRQeQ42Nxjbxh6sXcYxL5dCWBbnOGAFFc70tEEc=;
        b=ZV0ndG3QSxczIaODK6znKqK974O2fdCxRLO2KhjU7zAgHpCgPmrqbTCkhOb7stHw1i
         DupOXRIqvhJMlDU744Og+VV5va5jqIh+zK+mHOroEGbtQfE6fL7/KyVSxsWjneu8f4ZL
         rpQxlcMKP15wku3LO1/G6vG4Vf3BR/EaXb/u8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762889207; x=1763494007;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=sXztKRQeQ42Nxjbxh6sXcYxL5dCWBbnOGAFFc70tEEc=;
        b=qvkNszEqxYXR9twodvwp9VaMeo23eZtDBlIIpj3z/4UZbY1pRGjgAkJDvju704J6v5
         zwQMvKtdcvFmG0pPN7TBqtcIy6ainC0vsFWiJp5IMPSBD5DuH4UvNEoR7V9ttgie7bCM
         HiNLuJS85aMnGfADxcbZy4tsGeE920spdIsVaiRvXCQlSIIV8gN9ytEGMff8aYBKVfaZ
         i9iwSdXFsgp5vLtbukxU84Eng70lX0+U73R9Ucl0/GftMjGQtqgf3p5nY0IFMQaWVm+n
         eznO+PK+luwY63g2fLBGkAyMLMDADz+8jDbuP7Eb2KmysAz6Rxt6qxbjfU+t2yWRPC3Q
         +o8g==
X-Gm-Message-State: AOJu0YxT8crFYvlzfGWQ09NITACG+J8lIUBMRB77IK4euy5Eg4WGe6YM
	tNYeHBe9h/ePeMxHj4GEoNRLuW1zAPJy5itz8NV1GWXMkZExfKCbLhEWv2ob9+xNgRFd0uxAI9o
	rzqo=
X-Gm-Gg: ASbGncsK242/UUtxd06LeyFWEULNnQhS8MwGwc2OYV5iNLy0zMbLibm/pN4c70+xb8k
	lhrPFMS9uCVVGNQlrV4KObuZsYWWsAw9qkX5OjLNmsCZtfZONpiAUJtBtMSQkBaJkRAB1PHirv6
	/hbeKIC/C83E4Unn7h/dtwTrCyv9Ca2iaRG47bLGdw/ezNbs4ju684Ue/qFgCTd1a6kcBszk6ZL
	9vbM+kalYl3RWPqLJjnOLqHifKJi+PyhhNXuKBIy2RkY8BRZLuMyWBeL4XAjtqWpJNWWyvS9QiO
	4wr7QVslOog0GaBJyvPAmUUOo0WKeA27xpmh5mlNSRhWoCufo4ARb2VgGxZBTEM5FDJrWmug/Qx
	Lp3ymDhGm0czcuGXb3IpWx53RFhV1e98P2BOWyXzosbd/r/gLw2xrlN1FdfwuO2vtOpKTlKZnG+
	UiQ0eTXe+Zc04sOgiHhNkVeRxV1K+xmuNrJo/hGNFbFrQtV552sRdILg6spQwd9YR/d70IiQ==
X-Google-Smtp-Source: AGHT+IF7ICFayTE0+EUDrZlIuO1hDzNuYdngnxM/yVhdMG/Nhpl1saN3IvjKQwNtaS6arb3eRGydPA==
X-Received: by 2002:a17:902:cf05:b0:297:e6ca:c053 with SMTP id d9443c01a7336-29840b4a6c1mr53188555ad.28.1762889207422;
        Tue, 11 Nov 2025 11:26:47 -0800 (PST)
Received: from dianders.sjc.corp.google.com ([2a00:79e0:2e7c:8:ba9f:d4c6:9323:4864])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2984dcd0974sm4861075ad.90.2025.11.11.11.26.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Nov 2025 11:26:46 -0800 (PST)
From: Douglas Anderson <dianders@chromium.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	=?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@linaro.org>,
	Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: linux-samsung-soc@vger.kernel.org,
	Roy Luo <royluo@google.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Chen-Yu Tsai <wenst@chromium.org>,
	Julius Werner <jwerner@chromium.org>,
	William McVicker <willmcvicker@google.com>,
	Douglas Anderson <dianders@chromium.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 4/4] arm64: dts: google: Add initial dts for frankel, blazer, and mustang
Date: Tue, 11 Nov 2025 11:22:07 -0800
Message-ID: <20251111112158.4.I5032910018cdd7d6be7aea78870d04c0dc381d6e@changeid>
X-Mailer: git-send-email 2.51.2.1041.gc1ab5b90ca-goog
In-Reply-To: <20251111192422.4180216-1-dianders@chromium.org>
References: <20251111192422.4180216-1-dianders@chromium.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add barebones device trees for frankel (Pixel 10), blazer (Pixel 10
Pro), and mustang (Pixel 10 Pro XL). These device trees are enough to
boot to a serial prompt using an initramfs.

Many things can be noted about these device trees:

1. They are organized as "dts" files for the main SoC and "dtso"
   overlays for the boards. There is discussion about this in the
   bindings patch ("dt-bindings: arm: google: Add bindings for
   frankel/blazer/mustang").
2. They won't boot with the currently shipping bootloader. The current
   bootloader hardcodes several paths to nodes that it wants to update
   and considers it a fatal error if it can't find these nodes.
   Interested parties will need to wait for fixes to land and a new
   bootloader to be rolled out before attempting to use these.
3. They only add one revision (MP1) of each of frankel, blazer, and
   mustang. With this simple barebones device tree, there doesn't
   appear to be any difference between the revisions. More revisions
   will be added as needed in the future. The heuristics in the
   bootloader will pick the MP1 device tree if there are not any
   better matches.
4. They only add the dts for the B0 SoC for now. The A0 SoC support
   can be added later if we find the need.
5. Even newer versions of the bootloader will still error out if they
   don't find a UFS node to add calibration data to. Until UFS is
   supported, we provide a bogus UFS node for the bootloader. While
   the bootloader could be changed, there is no long-term benefit
   since eventually the device tree will have a UFS node.
6. They purposely choose to use the full 64-bit address and size cells
   for the root node and the `soc@0` node. Although I haven't tested
   the need for this, I presume the arguments made in commit
   bede7d2dc8f3 ("arm64: dts: qcom: sdm845: Increase address and size
   cells for soc") would apply here.
7. Though it looks as if the UART is never enabled, the bootloader
   knows to enable the UART when the console is turned on. Baud rate
   is configurable in the bootloader so is never hardcoded in the
   device tree.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---
To avoid fragmenting the discussion, IMO:
* Let's have the discussion about using the "dts" for SoC and the
  "dtso" for the boards in response to the bindings (patch #1).
* If we want to have a discussion about putting "board-id" and
  "model-id" at the root of the board overlays, we can have it
  here. I'll preemptively note that the "board-id" and "model-id"
  won't show up in the final combined device tree and they are just
  used by the tool (mkdtimg). We could change mkdtimg to parse the
  "compatible" strings of the overlays files (since I've put the IDs
  there too), but official the docs [1] seem to indicate that
  top-level properties like this are OK.

In order for these device trees to pass validation without warnings,
it's assumed you have my dtc patches:
* https://lore.kernel.org/r/20251110204529.2838248-1-dianders@chromium.org
* https://lore.kernel.org/r/20251110204529.2838248-2-dianders@chromium.org

[1] https://git.kernel.org/pub/scm/utils/dtc/dtc.git/tree/Documentation/dt-object-internal.txt?h=main

 arch/arm64/boot/dts/google/Makefile           |   9 +
 arch/arm64/boot/dts/google/lga-b0.dts         | 391 ++++++++++++++++++
 .../arm64/boot/dts/google/lga-blazer-mp1.dtso |  22 +
 .../boot/dts/google/lga-frankel-mp1.dtso      |  22 +
 .../boot/dts/google/lga-mustang-mp1.dtso      |  22 +
 .../boot/dts/google/lga-muzel-common.dtsi     |  17 +
 6 files changed, 483 insertions(+)
 create mode 100644 arch/arm64/boot/dts/google/lga-b0.dts
 create mode 100644 arch/arm64/boot/dts/google/lga-blazer-mp1.dtso
 create mode 100644 arch/arm64/boot/dts/google/lga-frankel-mp1.dtso
 create mode 100644 arch/arm64/boot/dts/google/lga-mustang-mp1.dtso
 create mode 100644 arch/arm64/boot/dts/google/lga-muzel-common.dtsi

diff --git a/arch/arm64/boot/dts/google/Makefile b/arch/arm64/boot/dts/google/Makefile
index a6b187e2d631..276001e91632 100644
--- a/arch/arm64/boot/dts/google/Makefile
+++ b/arch/arm64/boot/dts/google/Makefile
@@ -1 +1,10 @@
 # SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause)
+
+dtb-$(CONFIG_ARCH_GOOGLE) += \
+	lga-blazer-mp1.dtb \
+	lga-frankel-mp1.dtb \
+	lga-mustang-mp1.dtb
+
+lga-blazer-mp1-dtbs		:= lga-b0.dtb lga-blazer-mp1.dtbo
+lga-frankel-mp1-dtbs		:= lga-b0.dtb lga-frankel-mp1.dtbo
+lga-mustang-mp1-dtbs		:= lga-b0.dtb lga-mustang-mp1.dtbo
diff --git a/arch/arm64/boot/dts/google/lga-b0.dts b/arch/arm64/boot/dts/google/lga-b0.dts
new file mode 100644
index 000000000000..83c2db4f20ef
--- /dev/null
+++ b/arch/arm64/boot/dts/google/lga-b0.dts
@@ -0,0 +1,391 @@
+// SPDX-License-Identifier: GPL-2.0 OR BSD-3-Clause
+/*
+ * Google Tensor G5 (laguna) SoC rev B0
+ *
+ * Copyright 2024-2025 Google LLC.
+ */
+
+/dts-v1/;
+
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+#include <dt-bindings/interrupt-controller/irq.h>
+
+/ {
+	model = "Google Tensor G5 rev B0";
+	compatible = "google,soc-id-0005-rev-10", "google,lga";
+	#address-cells = <2>;
+	#size-cells = <2>;
+	interrupt-parent = <&gic>;
+
+	memory: memory@80000000 {
+		device_type = "memory";
+		/* We expect the bootloader to fill in the size */
+		reg = <0x00000000 0x80000000 0x00000000 0x00000000>;
+	};
+
+	reserved_memory: reserved-memory {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+	};
+
+	cpus: cpus {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		hayes_0: cpu@0 {
+			compatible = "arm,cortex-a520";
+			reg = <0x000>;
+
+			#cooling-cells = <2>;
+			capacity-dmips-mhz = <258>;
+			device_type = "cpu";
+			enable-method = "psci";
+			power-domain-names = "psci";
+			power-domains = <&cpu_pd0>;
+		};
+
+		hayes_1: cpu@100 {
+			compatible = "arm,cortex-a520";
+			reg = <0x100>;
+
+			#cooling-cells = <2>;
+			capacity-dmips-mhz = <258>;
+			device_type = "cpu";
+			enable-method = "psci";
+			power-domain-names = "psci";
+			power-domains = <&cpu_pd1>;
+		};
+
+		hunter_0: cpu@200 {
+			compatible = "arm,cortex-a725";
+			reg = <0x200>;
+
+			#cooling-cells = <2>;
+			capacity-dmips-mhz = <891>;
+			device_type = "cpu";
+			enable-method = "psci";
+			power-domain-names = "psci";
+			power-domains = <&cpu_pd2>;
+		};
+
+		hunter_1: cpu@300 {
+			compatible = "arm,cortex-a725";
+			reg = <0x300>;
+
+			#cooling-cells = <2>;
+			capacity-dmips-mhz = <891>;
+			device_type = "cpu";
+			enable-method = "psci";
+			power-domain-names = "psci";
+			power-domains = <&cpu_pd3>;
+		};
+
+		hunter_2: cpu@400 {
+			compatible = "arm,cortex-a725";
+			reg = <0x400>;
+
+			#cooling-cells = <2>;
+			capacity-dmips-mhz = <891>;
+			device_type = "cpu";
+			enable-method = "psci";
+			power-domain-names = "psci";
+			power-domains = <&cpu_pd4>;
+		};
+
+		hunter_3: cpu@500 {
+			compatible = "arm,cortex-a725";
+			reg = <0x500>;
+
+			#cooling-cells = <2>;
+			capacity-dmips-mhz = <891>;
+			device_type = "cpu";
+			enable-method = "psci";
+			power-domain-names = "psci";
+			power-domains = <&cpu_pd5>;
+		};
+
+		hunter_4: cpu@600 {
+			compatible = "arm,cortex-a725";
+			reg = <0x600>;
+
+			#cooling-cells = <2>;
+			capacity-dmips-mhz = <891>;
+			device_type = "cpu";
+			enable-method = "psci";
+			power-domain-names = "psci";
+			power-domains = <&cpu_pd6>;
+		};
+
+		hunterelp_0: cpu@700 {
+			compatible = "arm,cortex-x4";
+			reg = <0x700>;
+
+			#cooling-cells = <2>;
+			capacity-dmips-mhz = <1024>;
+			device_type = "cpu";
+			enable-method = "psci";
+			power-domain-names = "psci";
+			power-domains = <&cpu_pd7>;
+		};
+
+		cpu-map {
+			cluster0 {
+				core0 {
+					cpu = <&hayes_0>;
+				};
+				core1 {
+					cpu = <&hayes_1>;
+				};
+				core2 {
+					cpu = <&hunter_0>;
+				};
+				core3 {
+					cpu = <&hunter_1>;
+				};
+				core4 {
+					cpu = <&hunter_2>;
+				};
+				core5 {
+					cpu = <&hunter_3>;
+				};
+				core6 {
+					cpu = <&hunter_4>;
+				};
+				core7 {
+					cpu = <&hunterelp_0>;
+				};
+			};
+		};
+
+		idle-states {
+			entry-method = "psci";
+
+			cpu_lit_c2: cpu-lit-c2 {
+				compatible = "arm,idle-state";
+
+				entry-latency-us = <132>;
+				exit-latency-us = <296>;
+				min-residency-us = <3610>;
+
+				idle-state-name = "cpu-lit-c2";
+				local-timer-stop;
+
+				arm,psci-suspend-param = <0x40000003>;
+			};
+
+			cpu_mid1_c2: cpu-mid1-c2 {
+				compatible = "arm,idle-state";
+
+				entry-latency-us = <130>;
+				exit-latency-us = <274>;
+				min-residency-us = <2720>;
+
+				idle-state-name = "cpu-mid1-c2";
+				local-timer-stop;
+
+				arm,psci-suspend-param = <0x40000003>;
+			};
+
+			cpu_mid2_c2: cpu-mid2-c2 {
+				compatible = "arm,idle-state";
+
+				entry-latency-us = <130>;
+				exit-latency-us = <274>;
+				min-residency-us = <2720>;
+
+				idle-state-name = "cpu-mid2-c2";
+				local-timer-stop;
+
+				arm,psci-suspend-param = <0x40000003>;
+			};
+
+			cpu_big_c2: cpu-big-c2 {
+				compatible = "arm,idle-state";
+
+				entry-latency-us = <110>;
+				exit-latency-us = <413>;
+				min-residency-us = <3950>;
+
+				idle-state-name = "cpu-big-c2";
+				local-timer-stop;
+
+				arm,psci-suspend-param = <0x40000003>;
+			};
+		};
+
+		domain-idle-states {
+			cluster_1_c3: cluster-1-c3 {
+				compatible = "domain-idle-state";
+
+				entry-latency-us = <325>;
+				exit-latency-us = <553>;
+				min-residency-us = <10000>;
+
+				idle-state-name = "cluster-1-c3";
+
+				arm,psci-suspend-param = <0x40010033>;
+			};
+
+			cluster_2_c3: cluster-2-c3 {
+				compatible = "domain-idle-state";
+
+				entry-latency-us = <345>;
+				exit-latency-us = <673>;
+				min-residency-us = <10000>;
+
+				idle-state-name = "cluster-2-c3";
+
+				arm,psci-suspend-param = <0x40010033>;
+			};
+
+			cluster_c4_deep: cluster-c4-deep {
+				compatible = "domain-idle-state";
+
+				entry-latency-us = <510>;
+				exit-latency-us = <1027>;
+				min-residency-us = <10000>;
+
+				idle-state-name = "cluster-c4-deep";
+
+				arm,psci-suspend-param = <0x40020333>;
+			};
+		};
+	};
+
+	psci {
+		compatible = "arm,psci-1.0";
+		method = "smc";
+
+		cpu_pd0: power-domain-cpu0 {
+			#power-domain-cells = <0>;
+			domain-idle-states = <&cpu_lit_c2>;
+			power-domains = <&cpu_top_cl>;
+		};
+
+		cpu_pd1: power-domain-cpu1 {
+			#power-domain-cells = <0>;
+			domain-idle-states =  <&cpu_lit_c2>;
+			power-domains = <&cpu_top_cl>;
+		};
+
+		cpu_pd2: power-domain-cpu2 {
+			#power-domain-cells = <0>;
+			domain-idle-states =  <&cpu_mid1_c2>;
+			power-domains = <&cpucl1>;
+		};
+
+		cpu_pd3: power-domain-cpu3 {
+			#power-domain-cells = <0>;
+			domain-idle-states =  <&cpu_mid1_c2>;
+			power-domains = <&cpucl1>;
+		};
+
+		cpu_pd4: power-domain-cpu4 {
+			#power-domain-cells = <0>;
+			domain-idle-states =  <&cpu_mid1_c2>;
+			power-domains = <&cpucl1>;
+		};
+
+		cpu_pd5: power-domain-cpu5 {
+			#power-domain-cells = <0>;
+			domain-idle-states =  <&cpu_mid2_c2>;
+			power-domains = <&cpucl2>;
+		};
+
+		cpu_pd6: power-domain-cpu6 {
+			#power-domain-cells = <0>;
+			domain-idle-states =  <&cpu_mid2_c2>;
+			power-domains = <&cpucl2>;
+		};
+
+		cpu_pd7: power-domain-cpu7 {
+			#power-domain-cells = <0>;
+			domain-idle-states =  <&cpu_big_c2>;
+			power-domains = <&cpucl2>;
+		};
+
+		cpucl1: power-domain-cluster-1 {
+			#power-domain-cells = <0>;
+			domain-idle-states = <&cluster_1_c3>;
+			power-domains = <&cpu_top_cl>;
+		};
+
+		cpucl2: power-domain-cluster-2 {
+			#power-domain-cells = <0>;
+			domain-idle-states = <&cluster_2_c3>;
+			power-domains = <&cpu_top_cl>;
+		};
+
+		cpu_top_cl: power-domain-top-cluster {
+			#power-domain-cells = <0>;
+			domain-idle-states = <&cluster_c4_deep>;
+		};
+	};
+
+	timer {
+		compatible = "arm,armv8-timer";
+		interrupts =
+			<GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(1) | IRQ_TYPE_LEVEL_LOW) 0>,
+			<GIC_PPI 14 (GIC_CPU_MASK_SIMPLE(1) | IRQ_TYPE_LEVEL_LOW) 0>,
+			<GIC_PPI 11 (GIC_CPU_MASK_SIMPLE(1) | IRQ_TYPE_LEVEL_LOW) 0>,
+			<GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(1) | IRQ_TYPE_LEVEL_LOW) 0>;
+	};
+
+	/*
+	 * The Pixel bootloader considers it a fatal error if it doesn't find
+	 * a `ufs0` alias so it can add calibration data to the node. Until
+	 * the proper UFS controller node is added under the SoC, create a
+	 * temporary node to make the bootloader happy.
+	 */
+	ufs: ufs-placeholder {
+	};
+
+	soc: soc@0 {
+		compatible = "simple-bus";
+		ranges = <0 0 0 0 0x10 0>;
+
+		dma-ranges = <0 0 0 0 0x10 0>;
+
+		#address-cells = <2>;
+		#size-cells = <2>;
+
+		gic: interrupt-controller@5880000 { /* TODO ask for CPU IPC CSR */
+			compatible = "arm,gic-v3";
+			reg = <0 0x05880000 0 0x00010000>,
+			      <0 0x05900000 0 0x00200000>;
+			ranges;
+
+			#address-cells = <2>;
+			#size-cells = <2>;
+
+			#interrupt-cells = <4>;
+			interrupt-controller;
+			interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_HIGH 0>;
+
+			ppi-partitions {
+				ppi_cluster0: interrupt-partition-0 {
+					affinity = <&hayes_0 &hayes_1
+						    &hunter_0 &hunter_1 &hunter_2
+						    &hunter_3 &hunter_4>;
+				};
+
+				ppi_cluster1: interrupt-partition-1 {
+					affinity = <&hunterelp_0>;
+				};
+			};
+		};
+
+		lsion_cli16_uart: serial@db62000 {
+			compatible = "google,lga-uart", "snps,dw-apb-uart";
+			reg = <0 0x0db62000 0 0x100>;
+
+			clock-frequency = <200000000>;
+			interrupts = <GIC_SPI 688 IRQ_TYPE_LEVEL_HIGH 0>;
+			reg-io-width = <4>;
+			reg-shift = <2>;
+
+			status = "disabled";
+		};
+	};
+};
diff --git a/arch/arm64/boot/dts/google/lga-blazer-mp1.dtso b/arch/arm64/boot/dts/google/lga-blazer-mp1.dtso
new file mode 100644
index 000000000000..1c0248b931e8
--- /dev/null
+++ b/arch/arm64/boot/dts/google/lga-blazer-mp1.dtso
@@ -0,0 +1,22 @@
+// SPDX-License-Identifier: GPL-2.0 OR BSD-3-Clause
+/*
+ * Google Pixel 10 Pro (blazer) MP 1
+ *
+ * Copyright 2024-2025 Google LLC.
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include "lga-muzel-common.dtsi"
+
+/ {
+	board-id = <0x070406>;
+	board-rev = <0x010000>;
+};
+
+&{/} {
+	model = "BLAZER MP 1 based on LGA";
+	compatible = "google,pixel-id-070406-rev-010000",
+		     "google,lga-blazer", "google,lga";
+};
diff --git a/arch/arm64/boot/dts/google/lga-frankel-mp1.dtso b/arch/arm64/boot/dts/google/lga-frankel-mp1.dtso
new file mode 100644
index 000000000000..133494de7a9b
--- /dev/null
+++ b/arch/arm64/boot/dts/google/lga-frankel-mp1.dtso
@@ -0,0 +1,22 @@
+// SPDX-License-Identifier: GPL-2.0 OR BSD-3-Clause
+/*
+ * Google Pixel 10 (frankel) MP 1
+ *
+ * Copyright 2024-2025 Google LLC.
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include "lga-muzel-common.dtsi"
+
+/ {
+	board-id = <0x070306>;
+	board-rev = <0x010000>;
+};
+
+&{/} {
+	model = "FRANKEL MP 1 based on LGA";
+	compatible = "google,pixel-id-070306-rev-010000",
+		     "google,lga-frankel", "google,lga";
+};
diff --git a/arch/arm64/boot/dts/google/lga-mustang-mp1.dtso b/arch/arm64/boot/dts/google/lga-mustang-mp1.dtso
new file mode 100644
index 000000000000..1f79bbe48056
--- /dev/null
+++ b/arch/arm64/boot/dts/google/lga-mustang-mp1.dtso
@@ -0,0 +1,22 @@
+// SPDX-License-Identifier: GPL-2.0 OR BSD-3-Clause
+/*
+ * Google Pixel 10 Pro XL (mustang) MP 1
+ *
+ * Copyright 2024-2025 Google LLC.
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include "lga-muzel-common.dtsi"
+
+/ {
+	board-id = <0x070506>;
+	board-rev = <0x010000>;
+};
+
+&{/} {
+	model = "MUSTANG MP 1 based on LGA";
+	compatible = "google,pixel-id-070506-rev-010000",
+		     "google,lga-mustang", "google,lga";
+};
diff --git a/arch/arm64/boot/dts/google/lga-muzel-common.dtsi b/arch/arm64/boot/dts/google/lga-muzel-common.dtsi
new file mode 100644
index 000000000000..3505f02f5b36
--- /dev/null
+++ b/arch/arm64/boot/dts/google/lga-muzel-common.dtsi
@@ -0,0 +1,17 @@
+// SPDX-License-Identifier: GPL-2.0 OR BSD-3-Clause
+/*
+ * Google Pixel 10 family (mustang + blazer + frankel = muzel) common dtsi.
+ *
+ * Copyright 2024-2025 Google LLC.
+ */
+
+&{/} {
+	chosen {
+		stdout-path = "serial0";
+	};
+
+	aliases {
+		serial0 = "/soc@0/serial@db62000";	/* &lsion_cli16_uart */
+		ufs0 = "/ufs-placeholder";		/* &ufs - TODO "/soc@0/ufs@3c400000" */
+	};
+};
-- 
2.51.2.1041.gc1ab5b90ca-goog

