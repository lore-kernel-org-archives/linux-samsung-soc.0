Received: from out-02.smtp.spacemail.com (out-02.smtp.spacemail.com [63.250.43.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BE0E21764B;
	Wed, 30 Oct 2024 23:23:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=63.250.43.87
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730330632; cv=none; b=nF4xbCRKlPFzxtqTNKvR+cttUdf48iolL6Si/gbe8/jZL/PJ8iHZq/t2FEco/PDCQvmvwE7epSWm1Q1bpcnLujYp1wVG2a+L+57nrmguXhRimfZlU1E2Rwmirr2yCH/Ny9SEDgsDabKGY1RTo49Fxhzgs5JHNzzejrUI3qQW5k0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730330632; c=relaxed/simple;
	bh=rrcxWMsdAW6NMlC1f4N45bAtmggSlI8lhfcgoRDdRok=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fj9qkVMEWpzPupR/2P40/TBbEvy08IrQqiBWVdm8GFP+zqWCNzFRG/8Ihnx69ARXwUTosxjmP9UEr9Z2M+rZFEZdde+mC1hIRmsiVTgeQAv4iItbJcsg0rzQeluzsCkxQcoOeHANOPMS/CSIwcXIFSNpkVXuuxGJMx5EIFir9sM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mentallysanemainliners.org; spf=pass smtp.mailfrom=mentallysanemainliners.org; dkim=pass (2048-bit key) header.d=mentallysanemainliners.org header.i=@mentallysanemainliners.org header.b=HmC1ZMEr; arc=none smtp.client-ip=63.250.43.87
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mentallysanemainliners.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mentallysanemainliners.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mentallysanemainliners.org header.i=@mentallysanemainliners.org header.b="HmC1ZMEr"
Received: from prod-lbout-phx.jellyfish.systems (unknown [198.177.122.3])
	by smtp.spacemail.com (Postfix) with ESMTPA id 4Xf38z5GC0z4wLY;
	Wed, 30 Oct 2024 23:23:47 +0000 (UTC)
Received: from umer-b550pro4.lan (host-92-8-254-228.as13285.net [92.8.254.228])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.spacemail.com (Postfix) with ESMTPSA id 4Xf38r0vnvz8sWQ;
	Wed, 30 Oct 2024 23:23:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=mentallysanemainliners.org; s=spacemail; t=1730330622;
	bh=rrcxWMsdAW6NMlC1f4N45bAtmggSlI8lhfcgoRDdRok=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=HmC1ZMErsViEEu2EXu4cIxcumkp4pIFY61z3AWX1qVaJDzjOXSop4QEi0DKZDAS+9
	 JB+6XbmqWgUX2iO+PSezTTJ/6NCvrYiTinmeE6Yf3pY4ZH+KyiRj3Uq6FBTivAZ2qB
	 jGjJpAJSHnlCvaA7ufuxMRBSnn/ELhtie0rcyjGXeIdxdGkcVvPGJNO5ZGMeHTDRUW
	 oZhqyXBWZU1ybIvtNXofBCziv2XmBznbwg2tII1kjrN1KRQyVeRrDxNotjY4pgiP1c
	 UD1trLHG5+aXShk8XJ/OAG8Cs66gCldTZdpERaug0d5k2kRb2uGZAByw5vHLMPUOwT
	 L7sOeKBjmQyhw==
From: Umer Uddin <umer.uddin@mentallysanemainliners.org>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	igor.belwon@mentallysanemainliners.org
Subject: [PATCH v3 4/4] arm64: dts: exynos: Add initial support for Samsung Galaxy S20 (x1slte)
Date: Wed, 30 Oct 2024 23:23:08 +0000
Message-ID: <20241030232308.72210-5-umer.uddin@mentallysanemainliners.org>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241030232308.72210-1-umer.uddin@mentallysanemainliners.org>
References: <20241030232308.72210-1-umer.uddin@mentallysanemainliners.org>
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
index deb8dc509..783807249 100644
--- a/arch/arm64/boot/dts/exynos/Makefile
+++ b/arch/arm64/boot/dts/exynos/Makefile
@@ -10,5 +10,6 @@ dtb-$(CONFIG_ARCH_EXYNOS) += \
 	exynos8895-dreamlte.dtb		\
 	exynos990-c1s.dtb		\
 	exynos990-x1s.dtb		\
+	exynos990-x1slte.dtb		\
 	exynosautov9-sadk.dtb		\
 	exynosautov920-sadk.dtb
diff --git a/arch/arm64/boot/dts/exynos/exynos990-x1slte.dts b/arch/arm64/boot/dts/exynos/exynos990-x1slte.dts
new file mode 100644
index 000000000..7bca641e5
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
+#include "exynos990-hubble-common.dtsi"
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
2.47.0

