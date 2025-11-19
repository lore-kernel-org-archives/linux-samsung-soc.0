Received: from mailout3.samsung.com (mailout3.samsung.com [203.254.224.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F66235B120
	for <linux-samsung-soc@vger.kernel.org>; Wed, 19 Nov 2025 13:15:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763558116; cv=none; b=WYfGlm51edU9KjPgJIAFVVKppqDh1iltpqwveEpPLF/T+yKVD3ErDRhrZcVO+R4EDdGd4bV/oeC2+KHwCL0bXgeZSqEtsRnU6diozoAvsvbh8B/q+3KsfllsQqIyuiP63NWcMOIGWBDJ2wydtppm3a076doJggpTpkVlmm9yXH4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763558116; c=relaxed/simple;
	bh=v5mdKVNA2fXREnhbIPNmxtZMo2leiCFd4QyPhWq6K+8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:Content-Type:
	 References; b=REd7O+Z4TXC3RdJ2blbeelyts8NUWmbrwnSVhNUT0IafB1Lj1hT/q/ioypsSyw3UNMRR9jrUFkbMp8Pubc+nXRvzjZaYQr/+4u5bNRhupWnLNfukWnTulp/DP60rCnGUmxBgxE7ur6mcV4VkeTPgXoM1oops4bNkEcMAnThKf9U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=r3Hw4bGq; arc=none smtp.client-ip=203.254.224.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="r3Hw4bGq"
Received: from epcas5p3.samsung.com (unknown [182.195.41.41])
	by mailout3.samsung.com (KnoxPortal) with ESMTP id 20251119131508epoutp037861d2bdf65ab44b65c726e429bd6400~5asGg1DJX0106701067epoutp03o
	for <linux-samsung-soc@vger.kernel.org>; Wed, 19 Nov 2025 13:15:08 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20251119131508epoutp037861d2bdf65ab44b65c726e429bd6400~5asGg1DJX0106701067epoutp03o
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1763558108;
	bh=ZxOhlbK8ICcydhIlDZVWYfe0fihW305v0TiO0t+kvAc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=r3Hw4bGq9rVeDGpHMr542TFeirVFdxVG4lxEmlrZnGGo9XlCJEpVzKm6DVCzBzfR3
	 u690njtj8TsrSs2h8pjK6jctrHkW7kqIn7xx1xRKi95ykLCqzMzkKMb+Ojy95I0csV
	 a+w9DjjNG1uHo0mPcCzHI/iApix/aIs0qat6lDzU=
Received: from epsnrtp03.localdomain (unknown [182.195.42.155]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPS id
	20251119131507epcas5p3c6b5559066088f2a7140c81731e54c20~5asFG0li-1587715877epcas5p3I;
	Wed, 19 Nov 2025 13:15:07 +0000 (GMT)
Received: from epcas5p1.samsung.com (unknown [182.195.38.88]) by
	epsnrtp03.localdomain (Postfix) with ESMTP id 4dBMQy3G0yz3hhT4; Wed, 19 Nov
	2025 13:15:06 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPA id
	20251119131505epcas5p1c998a8c6bd202a1b29b9187b58da641b~5asDdDK5a0455404554epcas5p1z;
	Wed, 19 Nov 2025 13:15:05 +0000 (GMT)
Received: from Jaguar.samsungds.net (unknown [107.109.115.6]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20251119131454epsmtip1154975f2597c285eb9b1ea0740a54ce5~5ar5RjSq92736627366epsmtip1_;
	Wed, 19 Nov 2025 13:14:54 +0000 (GMT)
From: Ravi Patel <ravi.patel@samsung.com>
To: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	jesper.nilsson@axis.com, lars.persson@axis.com, alim.akhtar@samsung.com
Cc: ravi.patel@samsung.com, ksk4725@coasia.com, smn1196@coasia.com,
	linux-arm-kernel@axis.com, krzk@kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, pjsin865@coasia.com, gwk1013@coasia.com,
	bread@coasia.com, jspark@coasia.com, limjh0823@coasia.com,
	lightwise@coasia.com, hgkim05@coasia.com, mingyoungbo@coasia.com,
	shradha.t@samsung.com, swathi.ks@samsung.com, kenkim@coasia.com,
	kitak81.kim@samsung.com
Subject: [PATCH v2 3/3] arm64: dts: axis: Add ARTPEC-9 Alfred board support
Date: Wed, 19 Nov 2025 18:43:02 +0530
Message-Id: <20251119131302.79088-4-ravi.patel@samsung.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20251119131302.79088-1-ravi.patel@samsung.com>
X-CMS-MailID: 20251119131505epcas5p1c998a8c6bd202a1b29b9187b58da641b
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-541,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20251119131505epcas5p1c998a8c6bd202a1b29b9187b58da641b
References: <20251119131302.79088-1-ravi.patel@samsung.com>
	<CGME20251119131505epcas5p1c998a8c6bd202a1b29b9187b58da641b@epcas5p1.samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>

Add initial devcie tree for the ARTPEC-9 Alfred board.
The ARTPEC-9 Alfred is a board developed by Axis,
based on the Axis ARTPEC-9 SoC.

Signed-off-by: SungMin Park <smn1196@coasia.com>
Signed-off-by: Ravi Patel <ravi.patel@samsung.com>
---
 arch/arm64/boot/dts/exynos/axis/Makefile      |  3 +-
 .../boot/dts/exynos/axis/artpec9-alfred.dts   | 36 +++++++++++++++++++
 2 files changed, 38 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm64/boot/dts/exynos/axis/artpec9-alfred.dts

diff --git a/arch/arm64/boot/dts/exynos/axis/Makefile b/arch/arm64/boot/dts/exynos/axis/Makefile
index ccf00de64016..da6a426516fc 100644
--- a/arch/arm64/boot/dts/exynos/axis/Makefile
+++ b/arch/arm64/boot/dts/exynos/axis/Makefile
@@ -1,4 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0
 
 dtb-$(CONFIG_ARCH_ARTPEC) += \
-	artpec8-grizzly.dtb
+	artpec8-grizzly.dtb \
+	artpec9-alfred.dtb
diff --git a/arch/arm64/boot/dts/exynos/axis/artpec9-alfred.dts b/arch/arm64/boot/dts/exynos/axis/artpec9-alfred.dts
new file mode 100644
index 000000000000..5a779f1acf3b
--- /dev/null
+++ b/arch/arm64/boot/dts/exynos/axis/artpec9-alfred.dts
@@ -0,0 +1,36 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+/*
+ * Axis ARTPEC-9 Alfred board device tree source
+ *
+ * Copyright (c) 2025 Samsung Electronics Co., Ltd.
+ *             https://www.samsung.com
+ * Copyright (c) 2025  Axis Communications AB.
+ *             https://www.axis.com
+ */
+
+/dts-v1/;
+#include "artpec9.dtsi"
+#include "artpec9-pinctrl.dtsi"
+#include <dt-bindings/gpio/gpio.h>
+
+/ {
+	model = "ARTPEC-9 alfred board";
+	compatible = "axis,artpec9-alfred", "axis,artpec9";
+
+	aliases {
+		serial0 = &serial_0;
+	};
+
+	chosen {
+		stdout-path = &serial_0;
+	};
+
+	memory@80000000 {
+		device_type = "memory";
+		reg = <0x0 0x80000000 0x0 0x80000000>;
+	};
+};
+
+&osc_clk {
+	clock-frequency = <50000000>;
+};
-- 
2.17.1

