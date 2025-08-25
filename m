Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9438824728B
	for <linux-samsung-soc@vger.kernel.org>; Mon, 25 Aug 2025 06:49:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756104580; cv=none; b=lrN6xaMxzvmU4i9K11fV3OJY1VXTIVGqnTb9VFEmOzWI2LCIZHn7n13DULHI4YsB47ahewAPBrrPDB3K8+WjFKkGiV1J3R+RSCfbrX8h3SxPudVLgCYUBPGjrk/zUSJVDxvirlA6FsirsOG075e/HB+494RcAkVF2Jpk6kR8M/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756104580; c=relaxed/simple;
	bh=5irpsby5GozMjd+4UBYCgTbWkSp/nS3TVNsGoSRqTUc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:MIME-Version:
	 Content-Type:References; b=sitWGjk9WlyAbRgumqJnAEbZseYQ92HRD99KroZMeApYtIbdUoifbFqZJg8jAvXRI+b3CSxVdELiiM3QdP5nr62DicljhKYG4VZ2ROQMF+zn9wjdCXjRJUAB4rKI9QtPurAbvOGeDWti4BS2jGzXrlmVCB3UNbPQ2Ez767uaVfs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=Rd44spCk; arc=none smtp.client-ip=203.254.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="Rd44spCk"
Received: from epcas2p1.samsung.com (unknown [182.195.41.53])
	by mailout4.samsung.com (KnoxPortal) with ESMTP id 20250825064935epoutp048059cef7fe28998e816a8597ab3ced77~e7860xwOT2801628016epoutp04b
	for <linux-samsung-soc@vger.kernel.org>; Mon, 25 Aug 2025 06:49:35 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20250825064935epoutp048059cef7fe28998e816a8597ab3ced77~e7860xwOT2801628016epoutp04b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1756104575;
	bh=4rYafmcxZpihj0V9KbWDaQSBDKY7QVxXAz73yYLOt/o=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Rd44spCkNmgIEgk1nsAcOoQHdxwLJXZ577xFPTRvJuPMwYB0m4vdvo92IRVu3dOZm
	 IpCbAPYRUjktwWrq6gSXnI5DZO77PfUMnC465Ue8lJS+1Jrv1dJeEVpnQG0GwE4k1g
	 D7IC46ff/nTRCYCnDQW2sch3TYbdt5503/8SXTlk=
Received: from epsnrtp02.localdomain (unknown [182.195.42.154]) by
	epcas2p1.samsung.com (KnoxPortal) with ESMTPS id
	20250825064935epcas2p151228bc8741eba946fd87ce0eef9e97a~e786SsPxD0726907269epcas2p1E;
	Mon, 25 Aug 2025 06:49:35 +0000 (GMT)
Received: from epcas2p3.samsung.com (unknown [182.195.36.97]) by
	epsnrtp02.localdomain (Postfix) with ESMTP id 4c9Lxp4HQGz2SSKZ; Mon, 25 Aug
	2025 06:49:34 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas2p4.samsung.com (KnoxPortal) with ESMTPA id
	20250825064933epcas2p40a7c491366097f90add675bc36822ef9~e785EdrSo2497024970epcas2p4r;
	Mon, 25 Aug 2025 06:49:33 +0000 (GMT)
Received: from asswp60 (unknown [10.229.9.60]) by epsmtip1.samsung.com
	(KnoxPortal) with ESMTPA id
	20250825064933epsmtip1b479a02478b7997e16d4df8e6bf8e5de~e784-8SKK1035610356epsmtip1q;
	Mon, 25 Aug 2025 06:49:33 +0000 (GMT)
From: Shin Son <shin.son@samsung.com>
To: Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>, Krzysztof Kozlowski
	<krzk@kernel.org>, "Rafael J . Wysocki" <rafael@kernel.org>, Daniel Lezcano
	<daniel.lezcano@linaro.org>, Zhang Rui <rui.zhang@intel.com>, Lukasz Luba
	<lukasz.luba@arm.com>, Rob Herring <robh@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: Shin Son <shin.son@samsung.com>, linux-pm@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH 3/3] arm64: dts: exynosautov920: Add tmu hardware binding
Date: Mon, 25 Aug 2025 15:49:29 +0900
Message-ID: <20250825064929.188101-4-shin.son@samsung.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250825064929.188101-1-shin.son@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250825064933epcas2p40a7c491366097f90add675bc36822ef9
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
cpgsPolicy: CPGSC10-234,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250825064933epcas2p40a7c491366097f90add675bc36822ef9
References: <20250825064929.188101-1-shin.son@samsung.com>
	<CGME20250825064933epcas2p40a7c491366097f90add675bc36822ef9@epcas2p4.samsung.com>

Create a new exynosautov920-tmu.dtsi describing new TMU hardware
and include it from exynosautov920.dtsi.

The exynosautov920-tmu node uses the misc clock as its source
and exposes two new DT properties:

- tmu-name: identifies the TMU variant for sensor skipping
- sensor-index-ranges: defines valid sensor index ranges for the bitmap

This TMU binding defines six thermal zones with a critical trip point
at 125 degrees:

tmu_top : cpucl0-left, cpucl1
tmu_sub0: cpucl0-right, cpucl2
tmu_sub1: g3d, npu

Signed-off-by: Shin Son <shin.son@samsung.com>
---
 .../boot/dts/exynos/exynosautov920-tmu.dtsi   | 92 +++++++++++++++++++
 .../arm64/boot/dts/exynos/exynosautov920.dtsi | 34 +++++++
 2 files changed, 126 insertions(+)
 create mode 100644 arch/arm64/boot/dts/exynos/exynosautov920-tmu.dtsi

diff --git a/arch/arm64/boot/dts/exynos/exynosautov920-tmu.dtsi b/arch/arm64/boot/dts/exynos/exynosautov920-tmu.dtsi
new file mode 100644
index 000000000000..fa88e9bcdfec
--- /dev/null
+++ b/arch/arm64/boot/dts/exynos/exynosautov920-tmu.dtsi
@@ -0,0 +1,92 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Samsung's ExynosAuto920 TMU configurations device tree source
+ *
+ * Copyright (c) 2020 Samsung Electronics Co., Ltd.
+ *
+ * Samsung's ExynosAuto920 SoC TMU(Thermal Managemenut Unit) are listed as
+ * device tree nodes in this file.
+ */
+
+/ {
+	thermal-zones {
+		cpucl0left-thermal {
+			polling-delay-passive = <0>;
+			polling-delay = <0>;
+			thermal-sensors = <&tmuctrl_top 0>;
+
+			trips {
+				cpucl0_0_critical: cpucl0-0-critical {
+					temperature = <125000>;	/* millicelsius */
+					hysteresis = <0>;	/* millicelsius */
+					type = "critical";
+				};
+			};
+		};
+		cpucl0right-thermal {
+			polling-delay-passive = <0>;
+			polling-delay = <0>;
+			thermal-sensors = <&tmuctrl_sub0 0>;
+
+			trips {
+				cpucl0_1_critical: cpucl0-1-critical {
+					temperature = <125000>;	/* millicelsius */
+					hysteresis = <0>;	/* millicelsius */
+					type = "critical";
+				};
+			};
+		};
+		cpucl1-thermal {
+			polling-delay-passive = <0>;
+			polling-delay = <0>;
+			thermal-sensors = <&tmuctrl_top 1>;
+
+			trips {
+				cpucl1_critical: cpucl1-critical {
+					temperature = <125000>;	/* millicelsius */
+					hysteresis = <0>;	/* millicelsius */
+					type = "critical";
+				};
+			};
+		};
+		cpucl2-thermal {
+			polling-delay-passive = <0>;
+			polling-delay = <0>;
+			thermal-sensors = <&tmuctrl_sub0 1>;
+
+			trips {
+				cpucl2_critical: cpucl2-critical {
+					temperature = <125000>;	/* millicelsius */
+					hysteresis = <0>;	/* millicelsius */
+					type = "critical";
+				};
+			};
+		};
+		g3d-thermal {
+			polling-delay-passive = <0>;
+			polling-delay = <0>;
+			thermal-sensors = <&tmuctrl_sub1 0>;
+
+			trips {
+				g3d_critical: g3d-critical {
+					temperature = <125000>; /* millicelsius */
+					hysteresis = <0>; /* millicelsius */
+					type = "critical";
+				};
+			};
+		};
+		npu-thermal {
+			polling-delay-passive = <0>;
+			polling-delay = <0>;
+			thermal-sensors = <&tmuctrl_sub1 1>;
+
+			trips {
+				npu_critical: npu-critical {
+					temperature = <125000>; /* millicelsius */
+					hysteresis = <0>; /* millicelsius */
+					type = "critical";
+				};
+			};
+		};
+	};
+};
diff --git a/arch/arm64/boot/dts/exynos/exynosautov920.dtsi b/arch/arm64/boot/dts/exynos/exynosautov920.dtsi
index 0fdf2062930a..a4ff941f8e43 100644
--- a/arch/arm64/boot/dts/exynos/exynosautov920.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynosautov920.dtsi
@@ -330,6 +330,39 @@ watchdog_cl1: watchdog@10070000 {
 			samsung,cluster-index = <1>;
 		};
 
+		tmuctrl_top: tmutop-thermal@100a0000 {
+			compatible = "samsung,exynosautov920-tmu";
+			reg = <0x100A0000 0x1000>;
+			interrupts = <GIC_SPI 951 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cmu_misc CLK_DOUT_MISC_NOCP>;
+			clock-names = "tmu_apbif";
+			#thermal-sensor-cells = <1>;
+			tmu-name = "TMU_TOP";
+			sensor-index-ranges = <1 12>;
+		};
+
+		tmuctrl_sub0: tmusub0-thermal@100b0000 {
+			compatible = "samsung,exynosautov920-tmu";
+			reg = <0x100B0000 0x1000>;
+			interrupts = <GIC_SPI 950 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cmu_misc CLK_DOUT_MISC_NOCP>;
+			clock-names = "tmu_apbif";
+			#thermal-sensor-cells = <1>;
+			tmu-name = "TMU_SUB0";
+			sensor-index-ranges = <3 10>;
+		};
+
+		tmuctrl_sub1: tmusub1-thermal@100c0000 {
+			compatible = "samsung,exynosautov920-tmu";
+			reg = <0x100C0000 0x1000>;
+			interrupts = <GIC_SPI 949 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cmu_misc CLK_DOUT_MISC_NOCP>;
+			clock-names = "tmu_apbif";
+			#thermal-sensor-cells = <1>;
+			tmu-name = "TMU_SUB1";
+			sensor-index-ranges = <1 7>;
+		};
+
 		gic: interrupt-controller@10400000 {
 			compatible = "arm,gic-v3";
 			#interrupt-cells = <3>;
@@ -1507,3 +1540,4 @@ timer {
 };
 
 #include "exynosautov920-pinctrl.dtsi"
+#include "exynosautov920-tmu.dtsi"
-- 
2.50.1

