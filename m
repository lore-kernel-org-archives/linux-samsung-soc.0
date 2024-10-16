Received: from out-02.smtp.spacemail.com (out-02.smtp.spacemail.com [63.250.43.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF442216A1D;
	Wed, 16 Oct 2024 19:35:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=63.250.43.87
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729107322; cv=none; b=npNnFr1kLLHHP8uGepFT6yZHjawjmcRdIMyXwGiM/fQ7h4aVYvWLnfYwlgw8GpKPtXUdHZVqFpHu3ESD86xEIIFx6VXSMT/6T1FYSOKR1wvTanti8jRXRZ3Bs6TRm0xqjRdPQwTYj5vsLARrMZ/NYH2h5bMTe3b5Fd6/bQGA8Bc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729107322; c=relaxed/simple;
	bh=vEV5MrcZqqP+/2M7VPWQb86a7NQ1R7xOy5iwcfrbp3s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EQLOxSGwVacc3wQ2d52A2UVmglQUPGRHO8EdJKWUYmM0cRAeaYKowkGvPJAZpeDwEiq//qsAU6F99JuaN0An2U8yLOQSPHqCRQCGkMhbI446YIRF8kuhcvMtY/5jCS3v1YfEbNjZ1X+SmZFPI4ihrcvfBe3sfD+21eGzkyEsFXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mentallysanemainliners.org; spf=pass smtp.mailfrom=mentallysanemainliners.org; dkim=pass (2048-bit key) header.d=mentallysanemainliners.org header.i=@mentallysanemainliners.org header.b=hFuQPkp1; arc=none smtp.client-ip=63.250.43.87
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mentallysanemainliners.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mentallysanemainliners.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mentallysanemainliners.org header.i=@mentallysanemainliners.org header.b="hFuQPkp1"
Received: from prod-lbout-phx.jellyfish.systems (unknown [198.177.122.3])
	by smtp.spacemail.com (Postfix) with ESMTPA id 4XTLlq4d3kz4wL9;
	Wed, 16 Oct 2024 19:35:19 +0000 (UTC)
Received: from l-latitude7390.lan (host-80-41-166-50.as13285.net [80.41.166.50])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.spacemail.com (Postfix) with ESMTPSA id 4XTLlh1dvNz2x99;
	Wed, 16 Oct 2024 19:35:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=mentallysanemainliners.org; s=spacemail; t=1729107314;
	bh=vEV5MrcZqqP+/2M7VPWQb86a7NQ1R7xOy5iwcfrbp3s=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=hFuQPkp1MbYdRxphIxV7Rx3HLXLGzpWmP41nrUq86tMnJiS7chn4/x0A/F29RpwB/
	 LftFEVA6tNRXJqoYnvW/3A8M+HLq1SAjNmKYSQ/WzWxtl9hCFAaU7FPxY41IJDosAO
	 1xmAS0NbHo9udmpJRgKZG4Neasv1hqWtZmRhojFrwMYeTKeyNceF6RjPeBcZtw1h2e
	 ZpPGmXHUaYfSJLs6WRvAZPqZEaBuePysaKLrVQvsJ/h8upDPCWmxtYp15b6Nnamhxe
	 jkm5i4g7U5GVAzReYWgJ9nC+vBw+uwA/rL39OSMd5Dmr+JvTtuwSyT9JBD4YQOCVaf
	 t2Xb0ihENEsaA==
From: Umer Uddin <umer.uddin@mentallysanemainliners.org>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	igor.belwon@mentallysanemainliners.org
Subject: [PATCH v1 3/3] arm64: dts: exynos: Add initial support for Samsung Galaxy S20 5G (x1s)
Date: Wed, 16 Oct 2024 20:34:51 +0100
Message-ID: <20241016193451.28897-4-umer.uddin@mentallysanemainliners.org>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241016193451.28897-1-umer.uddin@mentallysanemainliners.org>
References: <20241016193451.28897-1-umer.uddin@mentallysanemainliners.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add initial support for the Samsung Galaxy S20 5G (x1s/SM-G981B)
phone. It was launched in 2020, and it's based on the Exynos 990 SoC. It
has only one configuration with 12GB of RAM and 128GB of UFS 3.0 storage.

This device tree adds support for the following:

- SimpleFB
- 12GB RAM
- Buttons

Signed-off-by: Umer Uddin <umer.uddin@mentallysanemainliners.org>
---
 arch/arm64/boot/dts/exynos/Makefile          |  1 +
 arch/arm64/boot/dts/exynos/exynos990-x1s.dts | 23 ++++++++++++++++++++
 2 files changed, 24 insertions(+)
 create mode 100644 arch/arm64/boot/dts/exynos/exynos990-x1s.dts

diff --git a/arch/arm64/boot/dts/exynos/Makefile b/arch/arm64/boot/dts/exynos/Makefile
index 7a934499b..deb8dc509 100644
--- a/arch/arm64/boot/dts/exynos/Makefile
+++ b/arch/arm64/boot/dts/exynos/Makefile
@@ -9,5 +9,6 @@ dtb-$(CONFIG_ARCH_EXYNOS) += \
 	exynos850-e850-96.dtb		\
 	exynos8895-dreamlte.dtb		\
 	exynos990-c1s.dtb		\
+	exynos990-x1s.dtb		\
 	exynosautov9-sadk.dtb		\
 	exynosautov920-sadk.dtb
diff --git a/arch/arm64/boot/dts/exynos/exynos990-x1s.dts b/arch/arm64/boot/dts/exynos/exynos990-x1s.dts
new file mode 100644
index 000000000..f7b1afd0e
--- /dev/null
+++ b/arch/arm64/boot/dts/exynos/exynos990-x1s.dts
@@ -0,0 +1,23 @@
+// SPDX-License-Identifier: GPL-2.0 OR BSD-3-Clause
+/*
+ * Samsung Galaxy S20 5G (x1s/SM-G981B) device tree source
+ *
+ * Copyright (c) 2024, Umer Uddin <umer.uddin@mentallysanemainliners.org>
+ */
+
+/dts-v1/;
+#include "exynos990-hubble-common.dtsi"
+
+/ {
+	#address-cells = <2>;
+	#size-cells = <2>;
+
+	model = "Samsung Galaxy S20 5G";
+	compatible = "samsung,x1s", "samsung,exynos990";
+
+	memory@9fec00000 {
+		device_type = "memory";
+		reg = <0x9 0xfec00000 0x0 0x01400000>,
+		      <0xa 0x0 0x0 0xfe800000>;
+	};
+};
-- 
2.46.2

