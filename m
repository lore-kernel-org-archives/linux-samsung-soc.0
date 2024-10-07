Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3F0C16C687
	for <linux-samsung-soc@vger.kernel.org>; Mon,  7 Oct 2024 07:20:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728285611; cv=none; b=M7eCOXQGbYq3kJuXdNTz1SXeHu/EpEETYthM5g/66tVWDG1ySpG05ptKp/WQxvreOmLpr2xvg75Sx6eJTYZz1Hqc9GEGsZmVJhBnXzbA1qKrlSd05xvLMjImRKHZdJpg7JGmKHc3hqxeUDas70h8tXPn2KS3JLyxOcEpJk4WAto=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728285611; c=relaxed/simple;
	bh=WRqjubW+I7cN3Hd71LqTLIqW6XSd4ucEaJXbUbMu5Ro=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:MIME-Version:
	 Content-Type:References; b=N8afzM05Y+Nw96IHmRWgduEc02xnw23b9L+vNKBxJjKdP4ej5MsgQTzl9Qb2EnnQ31P0g0cDZ+oHcfnO7PkR53pdEAI/BwbH+jvpBn2zc6xM3fyHpN/wKuAKRkmkmbGhy1w3Xjdks1eG3v0jADNwHprmfzsqZKczGSa4dC8QXkM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=lWcuUIyY; arc=none smtp.client-ip=203.254.224.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="lWcuUIyY"
Received: from epcas2p4.samsung.com (unknown [182.195.41.56])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20241007071340epoutp021650d56b22e8362d6e3baa6c8022a465~8GkBDq3X81791817918epoutp02_
	for <linux-samsung-soc@vger.kernel.org>; Mon,  7 Oct 2024 07:13:40 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20241007071340epoutp021650d56b22e8362d6e3baa6c8022a465~8GkBDq3X81791817918epoutp02_
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1728285220;
	bh=ssRExWKD5A07LgoUhNw/tWVunYPb56F3kIxoBfoq3pA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=lWcuUIyYTkZdaAbo76QUup0nTxxAfPQsOLJjkLjIeRSFc3GLH0QZRID/01Do1WIkj
	 0kmDXv/+OInyIUcjfsSqHiH24fX1HKk/kXNh43PrbkoD7EGD/zPL2pcyIbhzJCuzr0
	 Gx1sdYh2CsnfLYGfl/omNydpHOw2MHM3XiZYZDEw=
Received: from epsnrtp2.localdomain (unknown [182.195.42.163]) by
	epcas2p2.samsung.com (KnoxPortal) with ESMTP id
	20241007071339epcas2p274867e155f621ea924ff6a58efe34b17~8GkAif-p91721917219epcas2p2b;
	Mon,  7 Oct 2024 07:13:39 +0000 (GMT)
Received: from epsmges2p4.samsung.com (unknown [182.195.36.99]) by
	epsnrtp2.localdomain (Postfix) with ESMTP id 4XMVkC0yN0z4x9Pw; Mon,  7 Oct
	2024 07:13:39 +0000 (GMT)
Received: from epcas2p1.samsung.com ( [182.195.41.53]) by
	epsmges2p4.samsung.com (Symantec Messaging Gateway) with SMTP id
	04.E4.09811.22A83076; Mon,  7 Oct 2024 16:13:39 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
	epcas2p4.samsung.com (KnoxPortal) with ESMTPA id
	20241007071338epcas2p4361cff07030753a9c7c3e1589209a20d~8Gj-hUyJ_2310723107epcas2p4U;
	Mon,  7 Oct 2024 07:13:38 +0000 (GMT)
Received: from epsmgms1p2new.samsung.com (unknown [182.195.42.42]) by
	epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
	20241007071338epsmtrp275e14ef7d6a8f3dbc5783f1c9ee5e32a~8Gj-gXchA2826428264epsmtrp2B;
	Mon,  7 Oct 2024 07:13:38 +0000 (GMT)
X-AuditID: b6c32a48-7f9ff70000002653-6c-67038a2227da
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
	epsmgms1p2new.samsung.com (Symantec Messaging Gateway) with SMTP id
	EC.18.08227.22A83076; Mon,  7 Oct 2024 16:13:38 +0900 (KST)
Received: from localhost.localdomain (unknown [10.229.9.60]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20241007071338epsmtip2a7e85f04b8772fa991b2628c42a6e3e2~8Gj-N6qVr1371013710epsmtip2A;
	Mon,  7 Oct 2024 07:13:38 +0000 (GMT)
From: Sunyeal Hong <sunyeal.hong@samsung.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, Sylwester Nawrocki
	<s.nawrocki@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar
	<alim.akhtar@samsung.com>, Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Sunyeal Hong <sunyeal.hong@samsung.com>
Subject: [PATCH v1 3/3] arm64: dts: exynosautov920: add peric1, misc and
 hsi0/1 clock DT nodes
Date: Mon,  7 Oct 2024 16:13:33 +0900
Message-ID: <20241007071333.3011125-4-sunyeal.hong@samsung.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20241007071333.3011125-1-sunyeal.hong@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrHJsWRmVeSWpSXmKPExsWy7bCmqa5yF3O6wanXTBYP5m1js1iz9xyT
	xfUvz1kt5h85x2px/vwGdotNj6+xWnzsucdqcXnXHDaLGef3MVlcPOVq8X/PDnaLw2/aWS3+
	XdvIYtG0bD2TA5/H+xut7B6bVnWyeWxeUu/Rt2UVo8fnTXIBrFHZNhmpiSmpRQqpecn5KZl5
	6bZK3sHxzvGmZgaGuoaWFuZKCnmJuam2Si4+AbpumTlAdyoplCXmlAKFAhKLi5X07WyK8ktL
	UhUy8otLbJVSC1JyCswL9IoTc4tL89L18lJLrAwNDIxMgQoTsjOmfHzOWHBWtGLOoTssDYyv
	BLoYOTkkBEwk5k2/x9LFyMUhJLCDUWLXp342COcTo8StS/ehMt8YJT7cOMYO0/K3fwUTRGIv
	o8SWI72sEM5HRonjPx4ydjFycLAJ6Er8+ecAEhcR2MMkseX8ErAOZoGzjBJ35ywAGyUskCBx
	4/UqVhCbRUBVYmffaRYQm1fAXmLjiUlQ6+Qlrj8+ygRicwo4SDw7B7IApEZQ4uTMJ2D1zEA1
	zVtnM4MskBCYyyFxor2DHeQKCQEXiVk75SDmCEu8Or4FaqaUxOd3e9kg7HyJydffMkH0NjBK
	XPvXzQyRsJdYdOYn2BxmAU2J9bv0IUYqSxy5BbWWT6Lj8F+oTbwSHW1CEI1qEp+uXIYaIiNx
	7MQzKNtDYsqlPmjATWaUOH2uiWkCo8IsJN/MQvLNLITFCxiZVzGKpRYU56anFhsVmMCjODk/
	dxMjOOFqeexgnP32g94hRiYOxkOMEhzMSiK8EWsY04V4UxIrq1KL8uOLSnNSiw8xmgLDeiKz
	lGhyPjDl55XEG5pYGpiYmRmaG5kamCuJ895rnZsiJJCeWJKanZpakFoE08fEwSnVwOSdKKp1
	SjeEXyJZ9b/IR8/2GRuvb3yhW2pdtiggXD9mjb3nqaYmpmnrX/mHW2pf8nlfF6V9Tu3iU/Y3
	YpVOZaWtnYdUb24JDpw43WDrZ728w/7vvvnLPs9+HLTtn9fyN1EzlbO15Kfte3k1x3/Hx63t
	TXPUts5kmxNx+uKWWaHsm+sCpn8o2JT4T+qS6/Kfb9MYE3+dn7L41SavBdq9vdq90R1TpklZ
	t22JvvKaw29Ny48DP1mFoqR2uRS9STh4/mf7iY7/6T6LKjdnTSt2WHS+1zX32zKP6/NrTRon
	p/OLZN6477BXbXXClaisP93MZnaTRedWP/lqNSW3b/+HfrOIyHf/le8mKE9Z9aL06AYlluKM
	REMt5qLiRAAgD1D4QQQAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrOLMWRmVeSWpSXmKPExsWy7bCSvK5SF3O6weZlchYP5m1js1iz9xyT
	xfUvz1kt5h85x2px/vwGdotNj6+xWnzsucdqcXnXHDaLGef3MVlcPOVq8X/PDnaLw2/aWS3+
	XdvIYtG0bD2TA5/H+xut7B6bVnWyeWxeUu/Rt2UVo8fnTXIBrFFcNimpOZllqUX6dglcGVM+
	PmcsOCtaMefQHZYGxlcCXYycHBICJhJ/+1cwgdhCArsZJX5/VYKIy0hsbPjPDmELS9xvOcLa
	xcgFVPOeUeLl/odADRwcbAK6En/+OYDERQQOMUlM/PyUBcRhFrjMKHHs7mRmkG5hgTiJplcz
	WEBsFgFViZ19p8FsXgF7iY0nJkFtkJe4/vgo2BWcAg4Sz849ZARZIARUc/NDAkS5oMTJmU/A
	WpmBypu3zmaewCgwC0lqFpLUAkamVYySqQXFuem5xYYFRnmp5XrFibnFpXnpesn5uZsYwXGh
	pbWDcc+qD3qHGJk4GA8xSnAwK4nwRqxhTBfiTUmsrEotyo8vKs1JLT7EKM3BoiTO++11b4qQ
	QHpiSWp2ampBahFMlomDU6qBKW7Cw919s9+UKkwU7jx2dj1jU/IapX+1fw7wvdDsT9t/eYPP
	ldDZvvE/GQu/hVm/WPVaWvzQrC27xOU0eJYvKFqo0/Z9ZfhdpUX5V0PdwuM9r22ap8Ox5B3L
	2TPCtny7n37z23zKl8tDbf+Z16Y5B56+Mah6t4Z9AuvTuVsy5u1p+75kt9Sswncv//c+Drv7
	aMoLpxkHd7KszX1aXrNHoEtQ4nWs33d35r7555lab795XXGVU3mT9LzLazf5y3vlXs/0+M4Q
	8dLKxdvggNzDo77F2kJXj09RXBQ9f8d/T5ZbyT9/ctRYHb7fNt18l3iM7U6r8APlM89brjkQ
	8cZJ/GfaybVTbU9aFz5viGdPZxFSYinOSDTUYi4qTgQAIAa3IfoCAAA=
X-CMS-MailID: 20241007071338epcas2p4361cff07030753a9c7c3e1589209a20d
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20241007071338epcas2p4361cff07030753a9c7c3e1589209a20d
References: <20241007071333.3011125-1-sunyeal.hong@samsung.com>
	<CGME20241007071338epcas2p4361cff07030753a9c7c3e1589209a20d@epcas2p4.samsung.com>

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

