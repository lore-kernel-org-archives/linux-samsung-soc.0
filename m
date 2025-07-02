Received: from mailout1.samsung.com (mailout1.samsung.com [203.254.224.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09EE51BE23F
	for <linux-samsung-soc@vger.kernel.org>; Wed,  2 Jul 2025 01:33:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.24
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751420021; cv=none; b=stx85i8W3u4hIgpKXYgMVezHPz2mtvYtLJZrEyegkVTrpzMo9hlc1o1yZbkipDsrCSjTG+2JJyUtuv30DuO2+F1CP+Wcy4aU6+t8GjXIKHwpsCAjdoxb8zuxC6TiAPrtWRmUL94YnVh8+Wo1Qeblo7D3YIZIJhx2d+rhDNwVook=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751420021; c=relaxed/simple;
	bh=6rgthtioLPgC8TzI1EpGIup0Wnw1i9cSpYZlyhq1vAE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:MIME-Version:
	 Content-Type:References; b=O9QVXBOg5pH6IjYg3nr39zO1px0bcW4JwB0DpCwl7jSWYZMCMRv5HI3vEOdSfS6tr9V3XaO+f3qvg0zz9eyxbtcg3PF2QgaCYrWGg6RXz6wuShdMF5vkpv9gYz2hjDIUUtfHLb3YArf0KPU7DjOduAMgJy/gimDmCCvlr/F1Kdg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=EKxrZV9b; arc=none smtp.client-ip=203.254.224.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="EKxrZV9b"
Received: from epcas2p1.samsung.com (unknown [182.195.41.53])
	by mailout1.samsung.com (KnoxPortal) with ESMTP id 20250702013334epoutp014e73a3b36cbe9a2f8816c079a4e65751~OSzlND8Jw1686016860epoutp01X
	for <linux-samsung-soc@vger.kernel.org>; Wed,  2 Jul 2025 01:33:34 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20250702013334epoutp014e73a3b36cbe9a2f8816c079a4e65751~OSzlND8Jw1686016860epoutp01X
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1751420014;
	bh=MpzzzTN1a7sv35ExTZn8dvG279HkeU3kdloRRozgz+Y=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=EKxrZV9bWmmc5LpNwNNxyWSFEBWkUrGrJTMH9MIey9t/VBT41Mkphu0J98X6Rtq0P
	 5gnAiUDmAsrL4Ij4o7OzYhz+Dy3lEVZIiI3hYiytmfMMwVbJHo261vcQqiLaYLB/2B
	 h+P8o+FO3T621V9Lc1YLNsc4ogIdxyGdmXLdkU1I=
Received: from epsnrtp02.localdomain (unknown [182.195.42.154]) by
	epcas2p1.samsung.com (KnoxPortal) with ESMTPS id
	20250702013334epcas2p1bc84620e0b37bfba62cc0918e89d8b59~OSzktMNWl0297702977epcas2p14;
	Wed,  2 Jul 2025 01:33:34 +0000 (GMT)
Received: from epcas2p2.samsung.com (unknown [182.195.36.70]) by
	epsnrtp02.localdomain (Postfix) with ESMTP id 4bX2V52jVSz2SSKs; Wed,  2 Jul
	2025 01:33:33 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas2p3.samsung.com (KnoxPortal) with ESMTPA id
	20250702013332epcas2p39f6fce695eee06f912f5861fe459fbd5~OSzjUh5eo0547705477epcas2p3F;
	Wed,  2 Jul 2025 01:33:32 +0000 (GMT)
Received: from asswp146.dsn.sec.samsung.com (unknown [10.229.19.146]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20250702013332epsmtip2402243e2ee4768654a4eb374e4f5a21a~OSzjQ5WMj2822028220epsmtip2j;
	Wed,  2 Jul 2025 01:33:32 +0000 (GMT)
From: Sowon Na <sowon.na@samsung.com>
To: robh@kernel.org, krzk@kernel.org, conor+dt@kernel.org, vkoul@kernel.org,
	alim.akhtar@samsung.com, kishon@kernel.org
Cc: krzk+dt@kernel.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
	sowon.na@samsung.com
Subject: [PATCH 5/5] arm64: dts: exynosautov920: enable support for ufs
 device
Date: Wed,  2 Jul 2025 10:33:11 +0900
Message-ID: <20250702013316.2837427-6-sowon.na@samsung.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250702013316.2837427-1-sowon.na@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250702013332epcas2p39f6fce695eee06f912f5861fe459fbd5
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
cpgsPolicy: CPGSC10-234,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250702013332epcas2p39f6fce695eee06f912f5861fe459fbd5
References: <20250702013316.2837427-1-sowon.na@samsung.com>
	<CGME20250702013332epcas2p39f6fce695eee06f912f5861fe459fbd5@epcas2p3.samsung.com>

The exynosautov920 uses v3.1 UFS device.
Add ufs node for ExynosAutov920 SoC.
And enable ufs_phy and ufs devices with ufs_fixed_vcc_reg regulator for
ExynosAutov920 SADK.

Signed-off-by: Sowon Na <sowon.na@samsung.com>
---
 .../boot/dts/exynos/exynosautov920-sadk.dts   | 17 ++++++++++++
 .../arm64/boot/dts/exynos/exynosautov920.dtsi | 27 +++++++++++++++++++
 2 files changed, 44 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/exynosautov920-sadk.dts b/arch/arm64/boot/dts/exynos/exynosautov920-sadk.dts
index a397f068ed53..f979cc1ae6a1 100644
--- a/arch/arm64/boot/dts/exynos/exynosautov920-sadk.dts
+++ b/arch/arm64/boot/dts/exynos/exynosautov920-sadk.dts
@@ -52,6 +52,14 @@ memory@80000000 {
 		      <0x8 0x80000000 0x1 0xfba00000>,
 		      <0xa 0x00000000 0x2 0x00000000>;
 	};
+
+	ufs_fixed_vcc_reg: regulator-0 {
+		compatible = "regulator-fixed";
+		regulator-name = "ufs-vcc";
+		gpio = <&gpg3 2 GPIO_ACTIVE_HIGH>;
+		regulator-boot-on;
+		enable-active-high;
+	};
 };
 
 &pinctrl_alive {
@@ -83,6 +91,15 @@ &usi_0 {
 	status = "okay";
 };
 
+&ufs_0 {
+	status = "okay";
+	vcc-supply = <&ufs_fixed_vcc_reg>;
+};
+
+&ufs_0_phy {
+	status = "okay";
+};
+
 &xtcxo {
 	clock-frequency = <38400000>;
 };
diff --git a/arch/arm64/boot/dts/exynos/exynosautov920.dtsi b/arch/arm64/boot/dts/exynos/exynosautov920.dtsi
index 0fdf2062930a..f787c28fb0d5 100644
--- a/arch/arm64/boot/dts/exynos/exynosautov920.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynosautov920.dtsi
@@ -1426,6 +1426,12 @@ cmu_hsi2: clock-controller@16b00000 {
 				      "ethernet";
 		};
 
+		syscon_hsi2: syscon@16c00000 {
+			compatible = "samsung,exynosautov920-hsi2-sysreg",
+				     "syscon";
+			reg = <0x16c00000 0x800>;
+		};
+
 		pinctrl_hsi2: pinctrl@16c10000 {
 			compatible = "samsung,exynosautov920-pinctrl";
 			reg = <0x16c10000 0x10000>;
@@ -1438,6 +1444,27 @@ pinctrl_hsi2ufs: pinctrl@16d20000 {
 			interrupts = <GIC_SPI 603 IRQ_TYPE_LEVEL_HIGH>;
 		};
 
+		ufs_0: ufs@16e00000 {
+			compatible = "samsung,exynosautov920-ufs";
+			reg = <0x16e00000 0x100>,
+			      <0x16e01100 0x400>,
+			      <0x16e80000 0x8000>,
+			      <0x16d08000 0x800>;
+			reg-names = "hci", "vs_hci", "unipro", "ufsp";
+			interrupts = <GIC_SPI 613 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cmu_hsi2 CLK_MOUT_HSI2_UFS_EMBD_USER>,
+				 <&cmu_hsi2 CLK_MOUT_HSI2_NOC_UFS_USER>;
+			clock-names = "core_clk", "sclk_unipro_main";
+			freq-table-hz = <0 0>, <0 0>;
+			pinctrl-names = "default";
+			pinctrl-0 = <&ufs_rst_n &ufs_refclk_out>;
+			phys = <&ufs_0_phy>;
+			phy-names = "ufs-phy";
+			samsung,sysreg = <&syscon_hsi2 0x710>;
+			dma-coherent;
+			status = "disabled";
+		};
+
 		ufs_0_phy: phy@16e04000 {
 			compatible = "samsung,exynosautov920-ufs-phy";
 			reg = <0x16e04000 0x4000>;
-- 
2.45.2

