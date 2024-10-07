Received: from mailout3.samsung.com (mailout3.samsung.com [203.254.224.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7D4B183CBE
	for <linux-samsung-soc@vger.kernel.org>; Mon,  7 Oct 2024 07:18:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728285520; cv=none; b=TpSeNVXLqVDuNY86B23NxakhgKn0CNV0a+QJkYoB+BvX/PJPBEKLw0Oy8Y4bmj4jnGVbBR/osTsfUPT2wGLVVimbUPblg1LQ5DBtqBbP0QRhBg76YLa+6h7KTuHKc3+QhcwPl13YKwKjpbNLzMNFv7JjfIOQy1gli5d1tzR5mFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728285520; c=relaxed/simple;
	bh=WRqjubW+I7cN3Hd71LqTLIqW6XSd4ucEaJXbUbMu5Ro=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:MIME-Version:
	 Content-Type:References; b=aB8dJZYFKUlh5nGi7AoxEi7uxO8M22gk0ayPieaOzN/inXS83hu/Pykmjp7iKLuj2WWvyTpk6ijcXODFV+t/GTorNerkYkadqtqiDIgspFFjSQFgY6b6B8mIKJaQSRz969zMa2cpDt1okZNbxspSgL59vppo5LBcOHOBEebnmWU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=lMox+tOV; arc=none smtp.client-ip=203.254.224.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="lMox+tOV"
Received: from epcas2p4.samsung.com (unknown [182.195.41.56])
	by mailout3.samsung.com (KnoxPortal) with ESMTP id 20241007071836epoutp03cdb0d40c661b057b7c911f034ac6905e~8GoUclERn2393123931epoutp03L
	for <linux-samsung-soc@vger.kernel.org>; Mon,  7 Oct 2024 07:18:36 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20241007071836epoutp03cdb0d40c661b057b7c911f034ac6905e~8GoUclERn2393123931epoutp03L
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1728285516;
	bh=ssRExWKD5A07LgoUhNw/tWVunYPb56F3kIxoBfoq3pA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=lMox+tOV7L/LS0ZdwufUGpZ+ItE33eT9ZiZVrzw9VZBwtIadcXoWcJ3LaOe6JtLKG
	 WNlZQXM8AC77kobMx7HQh0qdXZDlpgR5cw0fSp2qZUMxcip3OzRFGKvPRstzD71yXC
	 Mu/reNVJqWN6+8MSq0t9K983RsafIX12yY2b1gJE=
Received: from epsnrtp3.localdomain (unknown [182.195.42.164]) by
	epcas2p3.samsung.com (KnoxPortal) with ESMTP id
	20241007071835epcas2p38edebef7fa47916681d3b005df8555ef~8GoT7JpT-2967729677epcas2p3Q;
	Mon,  7 Oct 2024 07:18:35 +0000 (GMT)
Received: from epsmges2p3.samsung.com (unknown [182.195.36.97]) by
	epsnrtp3.localdomain (Postfix) with ESMTP id 4XMVqt5tWZz4x9Q2; Mon,  7 Oct
	2024 07:18:34 +0000 (GMT)
Received: from epcas2p4.samsung.com ( [182.195.41.56]) by
	epsmges2p3.samsung.com (Symantec Messaging Gateway) with SMTP id
	8B.89.09776.A4B83076; Mon,  7 Oct 2024 16:18:34 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
	epcas2p3.samsung.com (KnoxPortal) with ESMTPA id
	20241007071834epcas2p34166194efb512b6346d0f6d47188859b~8GoS0ddTJ2967629676epcas2p3O;
	Mon,  7 Oct 2024 07:18:34 +0000 (GMT)
Received: from epsmgms1p2new.samsung.com (unknown [182.195.42.42]) by
	epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
	20241007071834epsmtrp1efb6e7aa1c9288cbf976c80cc5c47ecf~8GoSzh4rh1654816548epsmtrp18;
	Mon,  7 Oct 2024 07:18:34 +0000 (GMT)
X-AuditID: b6c32a47-d53fa70000002630-ec-67038b4a5683
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
	epsmgms1p2new.samsung.com (Symantec Messaging Gateway) with SMTP id
	81.A8.08227.A4B83076; Mon,  7 Oct 2024 16:18:34 +0900 (KST)
Received: from localhost.localdomain (unknown [10.229.9.60]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20241007071834epsmtip10785b4c3baf1ba1657391c520bd3c04c~8GoSl7FvG0992509925epsmtip1s;
	Mon,  7 Oct 2024 07:18:34 +0000 (GMT)
From: Sunyeal Hong <sunyeal.hong@samsung.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, Sylwester Nawrocki
	<s.nawrocki@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar
	<alim.akhtar@samsung.com>, Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Sunyeal Hong <sunyeal.hong@samsung.com>
Subject: [PATCH v2 3/3] arm64: dts: exynosautov920: add peric1, misc and
 hsi0/1 clock DT nodes
Date: Mon,  7 Oct 2024 16:18:29 +0900
Message-ID: <20241007071829.3042094-4-sunyeal.hong@samsung.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20241007071829.3042094-1-sunyeal.hong@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrPJsWRmVeSWpSXmKPExsWy7bCmha5XN3O6wZJz2hYP5m1js1iz9xyT
	xfUvz1kt5h85x2px/vwGdotNj6+xWnzsucdqcXnXHDaLGef3MVlcPOVq8X/PDnaLw2/aWS3+
	XdvIYtG0bD2TA5/H+xut7B6bVnWyeWxeUu/Rt2UVo8fnTXIBrFHZNhmpiSmpRQqpecn5KZl5
	6bZK3sHxzvGmZgaGuoaWFuZKCnmJuam2Si4+AbpumTlAdyoplCXmlAKFAhKLi5X07WyK8ktL
	UhUy8otLbJVSC1JyCswL9IoTc4tL89L18lJLrAwNDIxMgQoTsjOmfHzOWHBWtGLOoTssDYyv
	BLoYOTkkBEwkuh/NYe9i5OIQEtjBKLF3VycLhPOJUeJzew8ThPONUeLvy1ZWmJb2OZvZIBJ7
	GSW2rWiFcj4ySux+cARoGAcHm4CuxJ9/DiBxEYE9TBJbzi8BG8UscJZR4u6cBewgo4QFEiQO
	ND1hBLFZBFQlvt44AbaCV8Be4suRKcwQ6+Qlrj8+ygRicwo4SNy98ZERokZQ4uTMJywgNjNQ
	TfPW2cwgCyQEFnJIfP0Ech9Is4vEvPlHoe4Wlnh1fAs7hC0l8bK/DcrOl5h8/S0TRHMDo8S1
	f91Qm+0lFp35CfYOs4CmxPpd+iCmhICyxJFbUHv5JDoO/2WHCPNKdLQJQTSqSXy6chlqiIzE
	sRPPoGwPibc/rkPDdzKjxOYzr9kmMCrMQvLOLCTvzEJYvICReRWjWGpBcW56arFRgTE8jpPz
	czcxglOulvsOxhlvP+gdYmTiYDzEKMHBrCTCG7GGMV2INyWxsiq1KD++qDQntfgQoykwsCcy
	S4km5wOTfl5JvKGJpYGJmZmhuZGpgbmSOO+91rkpQgLpiSWp2ampBalFMH1MHJxSDUzhwsx7
	Dug6e2Z+quFrT3z+OO9R9Mv3UU4/7jAsfHZcUmLpf63fSzXjBTtvKx+Sr617FPLi17NHng8l
	swtub5j0t2tRXkjJk9XsDP6HbUp8LPYHMIv8LWZvquqcrf/uuWNU6b8v08SrC7Zs2OvwLP1B
	098eK1G9S4l73y9xZzjc9n73zff7vt4UW+epZXnFLXQnl+icZqWMw89bLf/FvrtR+eNV9eeF
	q/+kiScyZT98Ms3l7MfjgmJzVpbP5A84wqDZuMpcJPTa37STF8ydrZsV7HTepCsI+U8+dX3D
	/WM/WL5fjZX+80tqxe3ang9Rh/P7zlX5L8r9z9el/UNMJv23yv9d59iudM/pkBft+f1NiaU4
	I9FQi7moOBEAxCUBuUIEAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrJLMWRmVeSWpSXmKPExsWy7bCSnK5XN3O6wZPpXBYP5m1js1iz9xyT
	xfUvz1kt5h85x2px/vwGdotNj6+xWnzsucdqcXnXHDaLGef3MVlcPOVq8X/PDnaLw2/aWS3+
	XdvIYtG0bD2TA5/H+xut7B6bVnWyeWxeUu/Rt2UVo8fnTXIBrFFcNimpOZllqUX6dglcGVM+
	PmcsOCtaMefQHZYGxlcCXYycHBICJhLtczazdTFycQgJ7GaUmNW3lwkiISOxseE/O4QtLHG/
	5QgrRNF7Ron/V5cwdjFycLAJ6Er8+ecAEhcROMQkMfHzUxYQh1ngMqPEsbuTmUG6hQXiJA5t
	PcQKYrMIqEp8vXECzOYVsJf4cmQKM8QGeYnrj4+CbeYUcJC4e+MjI4gtBFTz4ux7Roh6QYmT
	M5+wgNjMQPXNW2czT2AUmIUkNQtJagEj0ypGydSC4tz03GLDAqO81HK94sTc4tK8dL3k/NxN
	jODY0NLawbhn1Qe9Q4xMHIyHGCU4mJVEeCPWMKYL8aYkVlalFuXHF5XmpBYfYpTmYFES5/32
	ujdFSCA9sSQ1OzW1ILUIJsvEwSnVwGQ/o1nF02hj7UJu59AHgYue6J7KX2+iIz178vqv4d2t
	YS2uN4Tryj7+2DLtBntR1OYLaT+c4i/NcXcWn3xsTS9ficH2j3ol0dL7fldELVPuvin2o93P
	4m/j/1vfnq2qdHdK/BXz9X2uWPzxplP/QhuMF2r6/Zkq/cLk7aGiz458m0pudU807hJaunHp
	V+PMA0x7zW+VvuEyeXz4DGfDyqoO1/17y/WuuBb+/vD/OO+VdSy/H0gWBZrvSeplYtnVlcOm
	OdGxOFo3vfmwrXrbjiSdA4e2B/FrTcr0fXvp9d49FpMl/JYfSr/wjeFPniizzZ4K264NlyO+
	PT5TcEPjTuqZ9AB2jUBuRp8Fn22fvFZiKc5INNRiLipOBAAzxJ95/AIAAA==
X-CMS-MailID: 20241007071834epcas2p34166194efb512b6346d0f6d47188859b
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20241007071834epcas2p34166194efb512b6346d0f6d47188859b
References: <20241007071829.3042094-1-sunyeal.hong@samsung.com>
	<CGME20241007071834epcas2p34166194efb512b6346d0f6d47188859b@epcas2p3.samsung.com>

Add cmu_peric1 for USI, I2C and I3C clocks respectively.
Add cmu_misc for MISC, GIC and OTP clocks respectively.
Add cmu_hsi0 for PCIE clocks respectively.
Add cmu_hsi1 for USB and MMC clocks respectively.

Signed-off-by: Sunyeal Hong <sunyeal.hong@samsung.com>
---
 .../arm64/boot/dts/exynos/exynosautov920.dtsi | 50 +++++++++++++++++++
 1 file changed, 50 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/exynosautov920.dtsi b/arch/arm64/boot/dts/exynos/exynosautov920.dtsi
index 91882b37fdb3..c759134c909e 100644
--- a/arch/arm64/boot/dts/exynos/exynosautov920.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynosautov920.dtsi
@@ -172,6 +172,17 @@ chipid@10000000 {
 			reg = <0x10000000 0x24>;
 		};
 
+		cmu_misc: clock-controller@10020000 {
+			compatible = "samsung,exynosautov920-cmu-misc";
+			reg = <0x10020000 0x8000>;
+			#clock-cells = <1>;
+
+			clocks = <&xtcxo>,
+				 <&cmu_top DOUT_CLKCMU_MISC_NOC>;
+			clock-names = "oscclk",
+				      "noc";
+		};
+
 		gic: interrupt-controller@10400000 {
 			compatible = "arm,gic-v3";
 			#interrupt-cells = <3>;
@@ -247,6 +258,19 @@ pwm: pwm@109b0000 {
 			status = "disabled";
 		};
 
+		cmu_peric1: clock-controller@10c00000 {
+			compatible = "samsung,exynosautov920-cmu-peric1";
+			reg = <0x10c00000 0x8000>;
+			#clock-cells = <1>;
+
+			clocks = <&xtcxo>,
+				 <&cmu_top DOUT_CLKCMU_PERIC1_NOC>,
+				 <&cmu_top DOUT_CLKCMU_PERIC1_IP>;
+			clock-names = "oscclk",
+				      "noc",
+				      "ip";
+		};
+
 		syscon_peric1: syscon@10c20000 {
 			compatible = "samsung,exynosautov920-peric1-sysreg",
 				     "syscon";
@@ -283,12 +307,38 @@ pmu_system_controller: system-controller@11860000 {
 			reg = <0x11860000 0x10000>;
 		};
 
+		cmu_hsi0: clock-controller@16000000 {
+			compatible = "samsung,exynosautov920-cmu-hsi0";
+			reg = <0x16000000 0x8000>;
+			#clock-cells = <1>;
+
+			clocks = <&xtcxo>,
+				 <&cmu_top DOUT_CLKCMU_HSI0_NOC>;
+			clock-names = "oscclk",
+				      "noc";
+		};
+
 		pinctrl_hsi0: pinctrl@16040000 {
 			compatible = "samsung,exynosautov920-pinctrl";
 			reg = <0x16040000 0x10000>;
 			interrupts = <GIC_SPI 442 IRQ_TYPE_LEVEL_HIGH>;
 		};
 
+		cmu_hsi1: clock-controller@16400000 {
+			compatible = "samsung,exynosautov920-cmu-hsi1";
+			reg = <0x16400000 0x8000>;
+			#clock-cells = <1>;
+
+			clocks = <&xtcxo>,
+				 <&cmu_top DOUT_CLKCMU_HSI1_NOC>,
+				 <&cmu_top DOUT_CLKCMU_HSI1_USBDRD>,
+				 <&cmu_top DOUT_CLKCMU_HSI1_MMC_CARD>;
+			clock-names = "oscclk",
+				      "noc",
+				      "usbdrd",
+				      "mmc_card";
+		};
+
 		pinctrl_hsi1: pinctrl@16450000 {
 			compatible = "samsung,exynosautov920-pinctrl";
 			reg = <0x16450000 0x10000>;
-- 
2.46.0

