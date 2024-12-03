Received: from out-02.smtp.spacemail.com (out-02.smtp.spacemail.com [63.250.43.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A41F1E32DB;
	Tue,  3 Dec 2024 08:04:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=63.250.43.87
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733213042; cv=none; b=ZYtuyJTKZLhIr5rN4kBLcJGk8Xwhrwj+5y/m7YFrwVlY1hoPw6mhyd3ctoTsnLI69VPn/fM41g5y9GqtbufTDBIyYCUDh/9Uu1lCpSX2Wy9VMkRQ/owA85MzG1164sMnyfzJD8/JhX+12Tf7ba0+QYulIaz9c2JUVRb+5qvmI2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733213042; c=relaxed/simple;
	bh=qdrBNmNEyNpSWJIX4awwEwOKE6djLp4ftdjOaoqDBVs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nZ6CBXdZzCvW2dBYmnwg4G1umn3c6kD1wXWnTrYZy517BbFm8SvMPTwnOMcTN6uvAjLnnFYp7Hhb/+YNMbSXRwxroqXQWyvhqGSQ2r3WHDrmeLnTE9XPkFcpiSPfpW9yhirNLkURaVyqMTOzB51gN5TOZAEOPgZJSdWILIkrJ5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mentallysanemainliners.org; spf=pass smtp.mailfrom=mentallysanemainliners.org; dkim=pass (2048-bit key) header.d=mentallysanemainliners.org header.i=@mentallysanemainliners.org header.b=WiSfSrb0; arc=none smtp.client-ip=63.250.43.87
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mentallysanemainliners.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mentallysanemainliners.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mentallysanemainliners.org header.i=@mentallysanemainliners.org header.b="WiSfSrb0"
Received: from prod-lbout-phx.jellyfish.systems (unknown [198.177.122.3])
	by smtp.spacemail.com (Postfix) with ESMTPA id 4Y2Y7z2DHVz4w8K;
	Tue, 03 Dec 2024 08:03:59 +0000 (UTC)
Received: from umer-b550pro4.lan (host-213-78-252-153.as13285.net [213.78.252.153])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.spacemail.com (Postfix) with ESMTPSA id 4Y2Y7p6vWGz2x9B;
	Tue,  3 Dec 2024 08:03:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=mentallysanemainliners.org; s=spacemail; t=1733213034;
	bh=qdrBNmNEyNpSWJIX4awwEwOKE6djLp4ftdjOaoqDBVs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=WiSfSrb0sl/uCquNknwN3sJ6tcLXGnKAdGH+IY8e8gZ0cG89qZ99ow5y9tISdKCcB
	 gpcQU+eedFWvO80FzEBL8D2FbBO2Q2Lha29la3s55fbfSZ1oZ3psTW2uZ5vYY2FqAg
	 yBaYpwLetbwJPev7tx7kRp9YFq2E3LdT2xbh/iz7Ln+sv4a16PC602YBfLG7tMtRuj
	 JC2OFUTNEHgSJbyL35Ndlyb/SD7G6waNnkj0V2KIKsweefpf32JG9nwneYio8hsmdE
	 qaplMdqacJjip186zQ2PcdB91Zg7vGB6kFWf2utnSt9qelEXpT1ZM4wo17meH7r0n7
	 IkVCtmGnR6MBA==
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
Subject: [PATCH v4 4/4] arm64: dts: exynos: Add initial support for Samsung Galaxy S20 (x1slte)
Date: Tue,  3 Dec 2024 08:03:26 +0000
Message-ID: <20241203080327.4751-5-umer.uddin@mentallysanemainliners.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241203080327.4751-1-umer.uddin@mentallysanemainliners.org>
References: <20241203080327.4751-1-umer.uddin@mentallysanemainliners.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add initial support for the Samsung Galaxy S20 (x1slte/SM-G980F)
phone. It was launched in 2020, and it's based on the Exynos 990 SoC. It
has only one configuration with 8GB of RAM and 128GB of UFS 3.0 storage.

This device tree adds support for the following:

- SimpleFB
- 8GB RAM
- Buttons

Signed-off-by: Umer Uddin <umer.uddin@mentallysanemainliners.org>
---
 arch/arm64/boot/dts/exynos/Makefile           |  1 +
 .../boot/dts/exynos/exynos990-x1slte.dts      | 28 +++++++++++++++++++
 2 files changed, 29 insertions(+)
 create mode 100644 arch/arm64/boot/dts/exynos/exynos990-x1slte.dts

diff --git a/arch/arm64/boot/dts/exynos/Makefile b/arch/arm64/boot/dts/exynos/Makefile
index 6959acfbb..b546b883a 100644
--- a/arch/arm64/boot/dts/exynos/Makefile
+++ b/arch/arm64/boot/dts/exynos/Makefile
@@ -10,6 +10,7 @@ dtb-$(CONFIG_ARCH_EXYNOS) += \
 	exynos8895-dreamlte.dtb		\
 	exynos990-c1s.dtb		\
 	exynos990-x1s.dtb		\
+	exynos990-x1slte.dtb		\
 	exynos990-r8s.dtb               \
 	exynosautov9-sadk.dtb		\
 	exynosautov920-sadk.dtb
diff --git a/arch/arm64/boot/dts/exynos/exynos990-x1slte.dts b/arch/arm64/boot/dts/exynos/exynos990-x1slte.dts
new file mode 100644
index 000000000..d3720996b
--- /dev/null
+++ b/arch/arm64/boot/dts/exynos/exynos990-x1slte.dts
@@ -0,0 +1,28 @@
+// SPDX-License-Identifier: GPL-2.0 OR BSD-3-Clause
+/*
+ * Samsung Galaxy S20 (x1slte/SM-G980F) device tree source
+ *
+ * Copyright (c) 2024, Umer Uddin <umer.uddin@mentallysanemainliners.org>
+ */
+
+/dts-v1/;
+#include "exynos990-x1s-common.dtsi"
+
+/ {
+	#address-cells = <2>;
+	#size-cells = <2>;
+
+	model = "Samsung Galaxy S20";
+	compatible = "samsung,x1slte", "samsung,exynos990";
+
+	memory@80000000 {
+		device_type = "memory";
+		reg = <0x0 0x80000000 0x0 0x3ab00000>,
+		      /* Memory hole */
+		      <0x0 0xc1200000 0x0 0x1ee00000>,
+		      /* Memory hole */
+		      <0x0 0xe1900000 0x0 0x1e700000>,
+		      /* Memory hole */
+		      <0x8 0x80000000 0x1 0x7ec00000>;
+	};
+};
-- 
2.47.1

