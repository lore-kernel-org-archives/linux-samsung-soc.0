Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE7C21A0716
	for <linux-samsung-soc@vger.kernel.org>; Thu, 12 Sep 2024 10:39:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726137554; cv=none; b=Jp9wDA4s1V3XMTOQYFpdV6UxjlvmGc5rnBbv/3xaDgDsUDyytW/6sNo/Crr+johf2UKJVa8Ptdvo4hqEebykTV7P2gjY8JcQJtK7LJgzHNj/h9JREwblcMYgBHAaKYgc8AcNoRi/MQ2EI2Knb6e2IvNW6zVO0bXAF6GRl0q2COc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726137554; c=relaxed/simple;
	bh=WRqjubW+I7cN3Hd71LqTLIqW6XSd4ucEaJXbUbMu5Ro=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:MIME-Version:
	 Content-Type:References; b=eGOHNNriZ4Agbm4nQIISKyVHO+erkHLNw5SODQzqY1F/YmVjkAVH1ckkV2K2rrz1YId6WsrjzUJ7lf8Asxg7filBJGp3LgH1a8J5zwl39bzlSaxSpgnx30kUyXdGc1VCigxiG0eRCuP9iyLgmADovsk3tq3aX4ndn1aMBuletFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=V3xb6Xed; arc=none smtp.client-ip=203.254.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="V3xb6Xed"
Received: from epcas2p4.samsung.com (unknown [182.195.41.56])
	by mailout4.samsung.com (KnoxPortal) with ESMTP id 20240912103905epoutp04b5b0e8c56ef8ef5782d1b15a7e849fef~0ePOpOHva2324623246epoutp041
	for <linux-samsung-soc@vger.kernel.org>; Thu, 12 Sep 2024 10:39:05 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20240912103905epoutp04b5b0e8c56ef8ef5782d1b15a7e849fef~0ePOpOHva2324623246epoutp041
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1726137545;
	bh=ssRExWKD5A07LgoUhNw/tWVunYPb56F3kIxoBfoq3pA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=V3xb6Xed1HfphxdLWvHDLMTduz8Y+E9s9xqVEbEuYEgWiG9k/D70jJev8+kWevHYX
	 oMvHl+GTj0wxYSLvYyvuRNKtTvb1C2PfdW/nLzx0OGbfoh15OTvu6UkoB8W0B0pehW
	 E/KWVCAQyEmtXg+Z6zWOGOPWCouCGJYqp41AFiS4=
Received: from epsnrtp1.localdomain (unknown [182.195.42.162]) by
	epcas2p1.samsung.com (KnoxPortal) with ESMTP id
	20240912103904epcas2p1a914b7015e53933a7cdd39e73aa5fa05~0ePOPpIEQ0836508365epcas2p1m;
	Thu, 12 Sep 2024 10:39:04 +0000 (GMT)
Received: from epsmgec2p1-new.samsung.com (unknown [182.195.36.99]) by
	epsnrtp1.localdomain (Postfix) with ESMTP id 4X4DSm0xf8z4x9Py; Thu, 12 Sep
	2024 10:39:04 +0000 (GMT)
Received: from epcas2p3.samsung.com ( [182.195.41.55]) by
	epsmgec2p1-new.samsung.com (Symantec Messaging Gateway) with SMTP id
	52.ED.19039.7C4C2E66; Thu, 12 Sep 2024 19:39:03 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
	epcas2p1.samsung.com (KnoxPortal) with ESMTPA id
	20240912103903epcas2p1ad72b43cca455c810d15a2c5ff5c5986~0ePNFP3Uc0836408364epcas2p10;
	Thu, 12 Sep 2024 10:39:03 +0000 (GMT)
Received: from epsmgms1p2new.samsung.com (unknown [182.195.42.42]) by
	epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
	20240912103903epsmtrp19746757a5a0ea17d62ef51f043103b4f~0ePNEOyH70661906619epsmtrp1S;
	Thu, 12 Sep 2024 10:39:03 +0000 (GMT)
X-AuditID: b6c32a4d-305ff70000004a5f-2a-66e2c4c71c06
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
	epsmgms1p2new.samsung.com (Symantec Messaging Gateway) with SMTP id
	66.AE.08456.7C4C2E66; Thu, 12 Sep 2024 19:39:03 +0900 (KST)
Received: from localhost.localdomain (unknown [10.229.9.60]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20240912103903epsmtip18be9d75594ce37d295394647d3681498~0ePM1fFhS3132831328epsmtip17;
	Thu, 12 Sep 2024 10:39:03 +0000 (GMT)
From: Sunyeal Hong <sunyeal.hong@samsung.com>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>, Chanwoo Choi
	<cw00.choi@samsung.com>, Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org, Sunyeal Hong <sunyeal.hong@samsung.com>
Subject: [PATCH 3/3] arm64: dts: exynosautov920: add peric1, misc and hsi0/1
 clock DT nodes
Date: Thu, 12 Sep 2024 19:38:56 +0900
Message-ID: <20240912103856.3330631-4-sunyeal.hong@samsung.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240912103856.3330631-1-sunyeal.hong@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrIJsWRmVeSWpSXmKPExsWy7bCmue7xI4/SDPZft7J4MG8bm8WaveeY
	LK5/ec5qMf/IOVaLl7PusVlsenyN1eJjzz1Wi8u75rBZzDi/j8ni4ilXi/97drBbHH7Tzmrx
	79pGFoumZeuZHPg83t9oZffYtKqTzWPzknqPvi2rGD0+b5ILYI3KtslITUxJLVJIzUvOT8nM
	S7dV8g6Od443NTMw1DW0tDBXUshLzE21VXLxCdB1y8wBulNJoSwxpxQoFJBYXKykb2dTlF9a
	kqqQkV9cYquUWpCSU2BeoFecmFtcmpeul5daYmVoYGBkClSYkJ0x5eNzxoKzohVzDt1haWB8
	JdDFyMkhIWAiMXP6DJYuRi4OIYE9jBKL/61gAUkICXxilJjxvQgi8Y1R4szMNUAJDrCOA9v0
	IOJ7GSV+v9wD1f2RUWLpkclgRWwCuhJ//jmAxEUE9jNJ3FowkxXEYRY4yyix6vAesBXCArES
	lx88ZQSxWQRUJaZd38kOYvMK2EtsnTCHHeI+eYnrj48ygdicAg4Sa+7NYIGoEZQ4OfMJmM0M
	VNO8dTYzyAIJgZkcEp2X7kE1u0i8XzKTCcIWlnh1fAtUXEriZX8blJ0vMfn6WyaI5gZGiWv/
	upkhEvYSi878ZAd5h1lAU2L9Ln2I95UljtyC2ssn0XH4LztEmFeio00IolFN4tOVy1BDZCSO
	nXgGZXtIPL/3kQkSWJMZJT5s280ygVFhFpJ3ZiF5ZxbC4gWMzKsYpVILinPTU5ONCgx181LL
	4bGcnJ+7iRGcdrV8dzC+Xv9X7xAjEwfjIUYJDmYlEd5JbI/ShHhTEiurUovy44tKc1KLDzGa
	AgN8IrOUaHI+MPHnlcQbmlgamJiZGZobmRqYK4nz3mudmyIkkJ5YkpqdmlqQWgTTx8TBKdXA
	pME654XKBOva6zOvf6w499B8lsyPH0IfbCSLgqely8jdV/nVpyHbV/Eyaw+X5qPeuICXH40P
	c/f6TfHef++SPvtR1t0XteRVhPxPO9++tf/rn4sl7KyeVaUnfI4cZOpZ9GJRIk/49L1xhR9y
	EgKyIgUNlk+O/3F4a7H+a/UbZdcna/ffZ/tw7Mq1nxEhR2q/+Udx2t90edRdunvTVH7//ZL3
	nuQYlognHNsSuyttslXULc00jkiFLUcWnTy1tjzHivGwE6eQ8uQI49Svxx9kPjlpIXFYZF3k
	ljv9ExtbGJb3bZl/d1Hc6V/zmYUOv/7Js267wZ/9D3Y/KhY77vWidVtyy84Fjp4qRfPVlyt6
	cyqxFGckGmoxFxUnAgB6ceZXRAQAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrBLMWRmVeSWpSXmKPExsWy7bCSnO7xI4/SDJ6fFbZ4MG8bm8WaveeY
	LK5/ec5qMf/IOVaLl7PusVlsenyN1eJjzz1Wi8u75rBZzDi/j8ni4ilXi/97drBbHH7Tzmrx
	79pGFoumZeuZHPg83t9oZffYtKqTzWPzknqPvi2rGD0+b5ILYI3isklJzcksSy3St0vgypjy
	8TljwVnRijmH7rA0ML4S6GLk4JAQMJE4sE2vi5GLQ0hgN6PEnLZ/rF2MnEBxGYmNDf/ZIWxh
	ifstR1ghit4zSpye8ZAFpJlNQFfizz8HkLiIwFEmiU0LnjGDOMwClxklzu6C6BYWiJY4+mEi
	mM0ioCox7fpOMJtXwF5i64Q5UBvkJa4/PsoEYnMKOEisuTeDBcQWAqrZvesLC0S9oMTJmU/A
	bGag+uats5knMArMQpKahSS1gJFpFaNkakFxbnpusWGBUV5quV5xYm5xaV66XnJ+7iZGcGRo
	ae1g3LPqg94hRiYOxkOMEhzMSiK8k9gepQnxpiRWVqUW5ccXleakFh9ilOZgURLn/fa6N0VI
	ID2xJDU7NbUgtQgmy8TBKdXAtCBQuTLv/oqoWGXNSwUvt95p5dXYVa2dxV8efW+uwKyH2noB
	sSeqJv9oi7Z+M2dxw/G/SRcC/x4z1/1qn7fWa65m2b9vWdoxi/j+KFW23TIuPqfmpMP0S/Zr
	dzS/VnVA6oW8rwHy9jv0UhpuXTHyU7r4v+ICg7PdPnvVpo2rmZ+GvKts3L14S8YN80MKWXPc
	HZp5JHltPNd418pvZbC1Ft5nb1tyOm+v/vapL2dOddjS9k3wis+r9M9X7i6RYAlYaj17+qZJ
	AQd0mJ7oi/8LnXORy0TD4sC067s3fHTWXJ//03n+c0Xle5f6BepX1vktlp3pfMJ04UPjfRm3
	b8xfcmXByjtK9ief+n2M006rUWIpzkg01GIuKk4EAPE8/VP7AgAA
X-CMS-MailID: 20240912103903epcas2p1ad72b43cca455c810d15a2c5ff5c5986
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20240912103903epcas2p1ad72b43cca455c810d15a2c5ff5c5986
References: <20240912103856.3330631-1-sunyeal.hong@samsung.com>
	<CGME20240912103903epcas2p1ad72b43cca455c810d15a2c5ff5c5986@epcas2p1.samsung.com>

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

