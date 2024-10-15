Received: from out-02.smtp.spacemail.com (out-02.smtp.spacemail.com [63.250.43.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E29C1FF040;
	Tue, 15 Oct 2024 21:02:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=63.250.43.87
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729026158; cv=none; b=Uz8QBuvbkwdMh84Nr2OzMKFPagssPvqf0BhiqzC6BM0IagO+O//BWAg6PI+3J8Eaf4JPlNX7uH3qUpUeAytRWRpNZiIfaZcbGVARRQPyqpwfWR0wicEZAH0PWliasdQundeKOSJk+2RxZO9rmg57SrXoVQ98b/F9MjIBnA2Lc14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729026158; c=relaxed/simple;
	bh=0Qt8gNwABafYX/vJxNTD5ciOd6WwHnuIS++unVicsvQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EgmU3Z7F5ozmAIyVuDNFoOU7C44TACvWK5WXAL5HIVvUKV86eDaVXgB9ZwUQlSSEKc50xUXUv6TnP/bJiZzTpxWuEE8UtXVf16brNGiF1vCKlzGEJucpCbXnL8XEw2bSYXCt81zVKS9qmC69MDvpGa0ps2N5hVVOY6rqlVRNycA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mentallysanemainliners.org; spf=pass smtp.mailfrom=mentallysanemainliners.org; dkim=pass (2048-bit key) header.d=mentallysanemainliners.org header.i=@mentallysanemainliners.org header.b=jH1854Nd; arc=none smtp.client-ip=63.250.43.87
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mentallysanemainliners.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mentallysanemainliners.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mentallysanemainliners.org header.i=@mentallysanemainliners.org header.b="jH1854Nd"
Received: from prod-lbout-phx.jellyfish.systems (unknown [198.177.122.3])
	by smtp.spacemail.com (Postfix) with ESMTPA id 4XSmkz4Vr6z4wgv;
	Tue, 15 Oct 2024 21:02:35 +0000 (UTC)
Received: from igor-systemproductname.lan (83.8.240.202.ipv4.supernova.orange.pl [83.8.240.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.spacemail.com (Postfix) with ESMTPSA id 4XSmkr1ZySz8sWP;
	Tue, 15 Oct 2024 21:02:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=mentallysanemainliners.org; s=spacemail; t=1729026150;
	bh=0Qt8gNwABafYX/vJxNTD5ciOd6WwHnuIS++unVicsvQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=jH1854NdV9UFB0AcusjtXZpNQ0uJwGAbaaGC4E/Is+AKIUkvVUTtDjyyE70vpdQw1
	 ltpWmpq44llNXjDEI6b/yvU8S3Qgujhk0bk4BKbXLIGHpuVYo9IwHwIIYgrCmZY0Kk
	 iLs73tUTnAzGKVpmA650UcBVW7BONp4+aisqj1oSnVUzItWqEZHDe0JaCgoOkDl7wE
	 fi1507m/UcTXlb8k4TSYIS43hFGutrMH29wjGDqXeXxjU+GZZ0TJmPJs8CS6HpEH5p
	 wofVqmZiWGzB0/LSc8VYmapeJiM9XwB3FqHW+oEJjo8JyYWM2yEJC3h5RBkWY6b5Vv
	 qF0bJmjXXkd6A==
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
Subject: [PATCH v2 6/6] arm64: dts: exynos: Add initial support for Samsung Galaxy Note20 5G (c1s)
Date: Tue, 15 Oct 2024 23:02:05 +0200
Message-ID: <20241015210205.963931-7-igor.belwon@mentallysanemainliners.org>
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

Add initial support for the Samsung Galaxy Note20 5G (c1s/SM-N981B)
phone. It was launched in 2020, and it's based on the Exynos 990 SoC. It
has only one configuration with 8GB of RAM, albeit storage options may
differ.

This device tree adds support for the following:

- SimpleFB
- 8GB RAM
- Buttons

Signed-off-by: Igor Belwon <igor.belwon@mentallysanemainliners.org>
---
 arch/arm64/boot/dts/exynos/Makefile          |  1 +
 arch/arm64/boot/dts/exynos/exynos990-c1s.dts | 66 ++++++++++++++++++++
 2 files changed, 67 insertions(+)
 create mode 100644 arch/arm64/boot/dts/exynos/exynos990-c1s.dts

diff --git a/arch/arm64/boot/dts/exynos/Makefile b/arch/arm64/boot/dts/exynos/Makefile
index 18f5a3eed523..7a934499b235 100644
--- a/arch/arm64/boot/dts/exynos/Makefile
+++ b/arch/arm64/boot/dts/exynos/Makefile
@@ -8,5 +8,6 @@ dtb-$(CONFIG_ARCH_EXYNOS) += \
 	exynos7885-jackpotlte.dtb	\
 	exynos850-e850-96.dtb		\
 	exynos8895-dreamlte.dtb		\
+	exynos990-c1s.dtb		\
 	exynosautov9-sadk.dtb		\
 	exynosautov920-sadk.dtb
diff --git a/arch/arm64/boot/dts/exynos/exynos990-c1s.dts b/arch/arm64/boot/dts/exynos/exynos990-c1s.dts
new file mode 100644
index 000000000000..e57339357dc6
--- /dev/null
+++ b/arch/arm64/boot/dts/exynos/exynos990-c1s.dts
@@ -0,0 +1,66 @@
+// SPDX-License-Identifier: GPL-2.0 OR BSD-3-Clause
+/*
+ * Samsung Galaxy Note20 5G (c1s/SM-N981B) device tree source
+ *
+ * Copyright (c) 2024, Igor Belwon <igor.belwon@mentallysanemainliners.org>
+ */
+
+/dts-v1/;
+#include "exynos990.dtsi"
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/input/input.h>
+#include <dt-bindings/interrupt-controller/irq.h>
+
+/ {
+	model = "Samsung Galaxy Note20";
+	compatible = "samsung,c1s", "samsung,exynos990";
+
+	#address-cells = <2>;
+	#size-cells = <2>;
+
+	chosen {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		framebuffer0: framebuffer@f1000000 {
+			compatible = "simple-framebuffer";
+			reg = <0 0xf1000000 0 (1080 * 2400 * 4)>;
+			width = <1080>;
+			height = <2400>;
+			stride = <(1080 * 4)>;
+			format = "a8r8g8b8";
+		};
+	};
+
+	memory@80000000 {
+		device_type = "memory";
+		reg = <0x0 0x80000000 0x0 0x3ab00000>,
+		      /* Memory hole */
+		      <0x0 0xc1200000 0x0 0x1ee00000>,
+		      /* Memory hole */
+		      <0x0 0xe1900000 0x0 0x1e700000>,
+		      /* Memory hole - last block */
+		      <0x8 0x80000000 0x1 0x7ec00000>;
+	};
+
+	reserved-memory {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		cont_splash_mem: framebuffer@f1000000 {
+			reg = <0 0xf1000000 0 0x13c6800>;
+			no-map;
+		};
+
+		abox_reserved: audio@f7fb0000 {
+			reg = <0 0xf7fb0000 0 0x2a50000>;
+			no-map;
+		};
+	};
+};
+
+&oscclk {
+	clock-frequency = <26000000>;
+};
-- 
2.45.2

