Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5981C4E56C2
	for <linux-samsung-soc@vger.kernel.org>; Fri,  9 Oct 2026 11:44:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791546272; cv=none; b=au9Zk/ezavp1ZGKtMRVmDOqEKLDgtymunaxH9395X6thTxegp5TNABBzrbBi7v8YnBHTpzFg0BAogJANRvI18ZGFCjlYZwaU0pvTpdFXbF4lTDNDKYt3w00rA8184FTCKiLZ6xmJkbFm5dMNWuJ0/Vajpqld5owjmiZCZrYxBsk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791546272; c=relaxed/simple;
	bh=YuhbXVUbJmVPZz96WV+RRldUuT3HyHErtzp6TqgQrpQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:MIME-Version:
	 Content-Type:References; b=O6kNHazUCENFTJMACSsavMiIHEGWE0H92nbpp7m+tOhvpZ5H8E4rq/NL5Hej+tbFSLUF2oL7o0s4IvqOYHvfuUQD3mtYC5UQWw6WVBsa00AYDFmrdc+BeKPGe3YsTMwHC4AJaAJ5Gh3fAb68X2pOF6BO2E1W1ZowEI6B4sJSJqc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=fiVbMIVa; arc=none smtp.client-ip=203.254.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="fiVbMIVa"
Received: from epcas5p4.samsung.com (unknown [182.195.41.42])
	by mailout4.samsung.com (KnoxPortal) with ESMTP id 20261009114412epoutp04436d9f545d54e4fcd07c7d9da775ecc3~c2dMczUm93022030220epoutp04h
	for <linux-samsung-soc@vger.kernel.org>; Fri,  9 Oct 2026 11:44:12 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20261009114412epoutp04436d9f545d54e4fcd07c7d9da775ecc3~c2dMczUm93022030220epoutp04h
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1791546252;
	bh=1hJ0aQ7fGA2QuLMADJWwMmxygYV3IJuA53iBt1oJi10=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=fiVbMIVa3Ma/tz2VhuqO2sCI+rdS29HR+sYxNC4l4jC/TJu3+s+zM1p5GryzrzYo1
	 JsAWjMsArlIAp/Ga+ij+/zV7HfIgY0tf5O+Rtjs7IrtLO4yGtkj3OhlGj/eZfwH/Va
	 6G1a81mxJUuor005q5vXEr7Xgmfsif1Ng40WBMdQ=
Received: from epsnrtp03.localdomain (unknown [182.195.42.155]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPS id
	20261009114411epcas5p499467c7e1fb0dc01cbf0283bb3f058ad~c2dL8dGJe2750927509epcas5p4S;
	Fri,  9 Oct 2026 11:44:11 +0000 (GMT)
Received: from epcas5p4.samsung.com (unknown [182.195.38.92]) by
	epsnrtp03.localdomain (Postfix) with ESMTP id 4j1Q4V6lcZz3hhT3; Fri,  9 Oct
	2026 11:44:10 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPA id
	20261009114410epcas5p3eada00785bc52c029f42c47ad6222466~c2dKeoqQF1310413104epcas5p3O;
	Fri,  9 Oct 2026 11:44:10 +0000 (GMT)
Received: from bose.samsungds.net (unknown [107.108.83.9]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20261009114407epsmtip201bed821dde3adb3153548808e14fb5c~c2dIKg65-1160511605epsmtip2T;
	Fri,  9 Oct 2026 11:44:07 +0000 (GMT)
From: Raghav Sharma <raghav.s@samsung.com>
To: krzk@kernel.org, s.nawrocki@samsung.com, cw00.choi@samsung.com,
	peter.griffin@linaro.org, alim.akhtar@samsung.com, sboyd@kernel.org,
	bmasney+clk@redhat.com, jbrunet+clk@baylibre.com, robh@kernel.org,
	conor+dt@kernel.org, raghav.s@samsung.com
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, is.gandhi@samsung.com, ts.amit@samsung.com,
	pokala.reddy@samsung.com
Subject: [PATCH v2 14/14] arm64: dts: exynos8855: add cmu_usb clock DT nodes
Date: Fri,  9 Oct 2026 17:31:37 +0530
Message-Id: <20261009120137.2801911-15-raghav.s@samsung.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261009120137.2801911-1-raghav.s@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20261009114410epcas5p3eada00785bc52c029f42c47ad6222466
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-543,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20261009114410epcas5p3eada00785bc52c029f42c47ad6222466
References: <20261009120137.2801911-1-raghav.s@samsung.com>
	<CGME20261009114410epcas5p3eada00785bc52c029f42c47ad6222466@epcas5p3.samsung.com>

Add required dt node for cmu_usb block, while at this
add sysreg_usb which contains bits for DRCG and MEMCLK
which are used by clk driver

Signed-off-by: Alim Akhtar <alim.akhtar@samsung.com>
Signed-off-by: Raghav Sharma <raghav.s@samsung.com>
---
 arch/arm64/boot/dts/exynos/exynos8855.dtsi | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/exynos8855.dtsi b/arch/arm64/boot/dts/exynos/exynos8855.dtsi
index 3dd7a4c4c609..dcf1e58c6367 100644
--- a/arch/arm64/boot/dts/exynos/exynos8855.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos8855.dtsi
@@ -192,6 +192,27 @@ pinctrl_cmgp: pinctrl@12030000 {
 			interrupts = <GIC_SPI 114 IRQ_TYPE_LEVEL_HIGH>;
 		};
 
+		cmu_usb: clock-controller@13000000 {
+			compatible = "samsung,exynos8855-cmu-usb";
+			reg = <0x13000000 0x10000>;
+			#clock-cells = <1>;
+
+			clocks = <&oscclk>,
+				 <&cmu_top CLKCMU_DOUT_USB_NOC>,
+				 <&cmu_top CLKCMU_DOUT_USB_USB20DRD>;
+			clock-names = "oscclk",
+				      "bus",
+				      "usb20drd";
+			samsung,sysreg = <&sysreg_usb>;
+		};
+
+		sysreg_usb: syscon@13020000 {
+			compatible = "samsung,exynos8855-usb-sysreg",
+				      "syscon";
+			reg = <0x13020000 0x10000>;
+			clocks = <&cmu_usb CLK_GOUT_SYSREG_USB>;
+		};
+
 		cmu_top: clock-controller@13900000 {
 			compatible = "samsung,exynos8855-cmu-top";
 			reg = <0x13900000 0x10000>;
-- 
2.34.1

