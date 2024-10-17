Received: from out-02.smtp.spacemail.com (out-02.smtp.spacemail.com [63.250.43.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EDBF1DFE16;
	Thu, 17 Oct 2024 16:43:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=63.250.43.87
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729183437; cv=none; b=i88pzD8nCA1BmnPJMQ1Wl2p0d4SKZ1klfW1uDQQb44HKbqi9yB4ElWVok0QKT9T/w7SY/O49nbzR7G79xrMWSItpeZ48bX1Ia439QUjYi50dXhhtmvqpf4ggsMxe+wWt5Aj8COc8Vi3on43NFt4K7Rl8euUpusn6bbsv2hhfW9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729183437; c=relaxed/simple;
	bh=6pRsPnkD7QklEmezrrAWGGBF9feai6FOCBnf7MplZ+4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ow0S9RJPxpiG/weXrBa6h7lEtNPHGOyJpGkzaB8N+IK3mOn0xbxZlZcF6bIiCKor4WF0KscIQ7l/JkNWVpapkXSTdnpwKeNL8WgvTE1VDaM1wfpJBehKoj3aE2O6zABLblMsYuGYtEHxb4aPsicPOcHMjFjx6WcC1+zhB/cuXus=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mentallysanemainliners.org; spf=pass smtp.mailfrom=mentallysanemainliners.org; dkim=pass (2048-bit key) header.d=mentallysanemainliners.org header.i=@mentallysanemainliners.org header.b=JA+f8Nhi; arc=none smtp.client-ip=63.250.43.87
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mentallysanemainliners.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mentallysanemainliners.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mentallysanemainliners.org header.i=@mentallysanemainliners.org header.b="JA+f8Nhi"
Received: from prod-lbout-phx.jellyfish.systems (unknown [198.177.122.3])
	by smtp.spacemail.com (Postfix) with ESMTPA id 4XTtvT20h7z4wfk;
	Thu, 17 Oct 2024 16:43:49 +0000 (UTC)
Received: from l-latitude7390.lan (host-80-41-166-50.as13285.net [80.41.166.50])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.spacemail.com (Postfix) with ESMTPSA id 4XTtvK5rvqz6tkR;
	Thu, 17 Oct 2024 16:43:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=mentallysanemainliners.org; s=spacemail; t=1729183424;
	bh=6pRsPnkD7QklEmezrrAWGGBF9feai6FOCBnf7MplZ+4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=JA+f8Nhi57zIlsmzrqHxs91BODV10lRZWOJ1Z24FKO6xHPeKVNH2/3sBOBu/mJPPn
	 iIOqboeM5p2bJLnuOzB/9MXodXHRrHmmNSqJZJyc8ZyqOPsCqQCIFko/T7ipiUNQy/
	 dbpDFA2KZoNVbjTiC8jLaeXiIUGi6zWCDOpfYHnkt6E68gH9f8rmachWzn/dxHx57S
	 8alJj0oMUEpAAnfxMktd+UtArtuuL3WXJ3lakgpGW1rVVYfD3Wc71BCAk/hrLmmD1Y
	 Vci8eCfn0ZSOKyt03tvZZV/Rr3w3ILs0n3ZOSA6MA2962gaCBp0QOihgFp/aO08f9g
	 /LzAkO31gxibQ==
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
Subject: [PATCH v2 4/4] arm64: dts: exynos: Add initial support for Samsung Galaxy S20 (x1slte)
Date: Thu, 17 Oct 2024 17:43:27 +0100
Message-ID: <20241017164328.17077-5-umer.uddin@mentallysanemainliners.org>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241017164328.17077-1-umer.uddin@mentallysanemainliners.org>
References: <20241017164328.17077-1-umer.uddin@mentallysanemainliners.org>
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
 arch/arm64/boot/dts/exynos/Makefile             |  1 +
 arch/arm64/boot/dts/exynos/exynos990-x1slte.dts | 17 +++++++++++++++++
 2 files changed, 18 insertions(+)
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
index 000000000..9e6a1a060
--- /dev/null
+++ b/arch/arm64/boot/dts/exynos/exynos990-x1slte.dts
@@ -0,0 +1,17 @@
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
+};
-- 
2.47.0

