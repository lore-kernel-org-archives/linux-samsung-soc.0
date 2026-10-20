Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=203.254.224.24
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792478996;
	b=v4MMs6sJyr/GNrn78BOkN22QPGisbBt6ReM2ib/1+VKnfn3CPFeUhO/PkSrAzUuXOUyt
	 F+FFIaDpCRwWceF0CBhx4Jd4rYYcPqFqH68cR6Z2kR1TwSVYAupFJLnlwINWq9ifmKRiB
	 SKr47Zi2wYsEyamBCXT/SQaAM2Mk6cwHBKU4pvpdZInKBNO7PBaR362YDQVdFGtb+AtGP
	 1UPME+uo0uVbfO0s4w6e3kujspDRIiLHukl1GN7lI2yQsJCZV3DsNP9f8rUtdrCNtb7Cn
	 ssS1joPGqBpe1eOnUDzCmNcabFeB+86AGdgX4Xwi7fH3e8gin1dLJsuTWyCshoHC9jQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792478996;
	h=DMARC-Filter:Received:DKIM-Filter:DKIM-Signature:Received:Received:
	 Received:Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 In-Reply-To:MIME-Version:Content-Transfer-Encoding:X-CMS-MailID:
	 X-Msg-Generator:Content-Type:X-Sendblock-Type:CMS-TYPE:cpgsPolicy:
	 X-CFilter-Loop:X-CMS-RootMailID:References;
	bh=maBUpjo3g0KZFtGYzIJqew6LPOZ23uD7gqeYdMcjDLU=;
	b=KnYoRySzmyeUcSXbw2x4frZ6mgxsMsereErUKG8Ya6qR+gZAJBq3h6DjxputfDMbaPco
	 zQN7xq459z+a7BY1ZGIFpr0lXXf+sYBFW2zntGfpyUEOkdnkATfTd/sgyb6BlHI7T/GvC
	 AZOVIZ5GxIJKrF//m+sSs4LF8z0qZDFJ+A0GXToEIClCsjE0+PsOZXFePSzrdePbRyMbr
	 Z98cmpgwMMI/zx1SlTKXYAgzOJC6d3nO34VZYA2HjGLYQkn1yEqAik8pnNmtuRwxWRYH1
	 +erBQXFIu3kCGfOoUWcBMTUFaz02XUJh0VnE6A23FinhrxE6hWYSunjw/zCIYhFii5Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=samsung.com;
	spf=pass smtp.mailfrom=samsung.com;
	dkim=pass header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b="PEdh/jOS";
	arc=none smtp.remote-ip=203.254.224.24
Received: from mailout1.samsung.com (mailout1.samsung.com [203.254.224.24])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88E89606A319
	for <linux-samsung-soc@vger.kernel.org>; Tue, 20 Oct 2026 06:49:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 88E89606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=PEdh/jOS
Received: from epcas5p4.samsung.com (unknown [182.195.41.42])
	by mailout1.samsung.com (KnoxPortal) with ESMTP id 20261020064953epoutp01cbca9171417eefe6a5d2a6c7ade90243~gKiXhP0A42450224502epoutp01P
	for <linux-samsung-soc@vger.kernel.org>; Tue, 20 Oct 2026 06:49:53 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20261020064953epoutp01cbca9171417eefe6a5d2a6c7ade90243~gKiXhP0A42450224502epoutp01P
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1792478993;
	bh=maBUpjo3g0KZFtGYzIJqew6LPOZ23uD7gqeYdMcjDLU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=PEdh/jOSgTkNQkU5mo45CSwtqWiuRlOhh0CqeDx7uEx+bXFnvjfKFGlXFmjeX2irz
	 eEa7VZE5Xy8DqSzGMBK+wUAqs7mk2JR2B2aw72kJQzrR9e5+qwbYjT8MJuQWn0eO6i
	 Ax64mxCiQt/HhdrkIZy02HR1j3hFAPBzt7Np/nNQ=
Received: from epsnrtp01.localdomain (unknown [182.195.42.153]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPS id
	20261020064953epcas5p30ff0f5805bdd1f0ce0daac03ded0bc2e~gKiXEUW_E2196521965epcas5p3l;
	Tue, 20 Oct 2026 06:49:53 +0000 (GMT)
Received: from epcas5p2.samsung.com (unknown [182.195.38.94]) by
	epsnrtp01.localdomain (Postfix) with ESMTP id 4j831r2fHzz6B9m9; Tue, 20 Oct
	2026 06:49:52 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPA id
	20261020063833epcas5p102d557293024c00b1aaf00b6969f9978~gKYdgjM031479414794epcas5p1P;
	Tue, 20 Oct 2026 06:38:33 +0000 (GMT)
Received: from bose.samsungds.net (unknown [107.108.83.9]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20261020063830epsmtip147b74f688192e34b5eb651e9bb8bd9dd~gKYa81B4x0381003810epsmtip11;
	Tue, 20 Oct 2026 06:38:30 +0000 (GMT)
From: Raghav Sharma <raghav.s@samsung.com>
To: krzk@kernel.org, s.nawrocki@samsung.com, cw00.choi@samsung.com,
	peter.griffin@linaro.org, alim.akhtar@samsung.com, sboyd@kernel.org,
	bmasney+clk@redhat.com, jbrunet+clk@baylibre.com, robh@kernel.org,
	conor+dt@kernel.org, raghav.s@samsung.com
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, is.gandhi@samsung.com, ts.amit@samsung.com,
	pokala.reddy@samsung.com
Subject: [PATCH v3 12/14] arm64: dts: exynos8855: add cmu_peris clock DT
 nodes
Date: Tue, 20 Oct 2026 12:25:56 +0530
Message-Id: <20261020065558.1829402-13-raghav.s@samsung.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261020065558.1829402-1-raghav.s@samsung.com>
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Post: <mailto:linux-samsung-soc@vger.kernel.org>
List-Help: <mailto:linux-samsung-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-samsung-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20261020063833epcas5p102d557293024c00b1aaf00b6969f9978
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-543,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20261020063833epcas5p102d557293024c00b1aaf00b6969f9978
References: <20261020065558.1829402-1-raghav.s@samsung.com>
	<CGME20261020063833epcas5p102d557293024c00b1aaf00b6969f9978@epcas5p1.samsung.com>

Add required dt node for cmu_peris block. Also add sysreg_peris node.
sysreg_peris contains DRCG SFRs bits which are used in clock driver.

Signed-off-by: Alim Akhtar <alim.akhtar@samsung.com>
Signed-off-by: Raghav Sharma <raghav.s@samsung.com>
---
 arch/arm64/boot/dts/exynos/exynos8855.dtsi | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/exynos8855.dtsi b/arch/arm64/boot/dts/exynos/exynos8855.dtsi
index 2e5dc79d66bc..b461de6a7548 100644
--- a/arch/arm64/boot/dts/exynos/exynos8855.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos8855.dtsi
@@ -146,6 +146,27 @@ soc: soc@0 {
 		#size-cells = <1>;
 		ranges = <0x0 0x0 0x0 0x20000000>;
 
+		sysreg_peris: syscon@10020000 {
+			compatible = "samsung,exynos8855-peris-sysreg",
+				      "syscon";
+			reg = <0x10020000 0x10000>;
+			clocks = <&cmu_peris CLK_GOUT_SYSREG_PERIS>;
+		};
+
+		cmu_peris: clock-controller@10030000 {
+			compatible = "samsung,exynos8855-cmu-peris";
+			reg = <0x10030000 0x10000>;
+			#clock-cells = <1>;
+
+			clocks = <&oscclk>,
+				 <&cmu_top CLKCMU_DOUT_PERIS_GIC>,
+				 <&cmu_top CLKCMU_DOUT_PERIS_NOC>;
+			clock-names = "oscclk",
+				      "gic",
+				      "bus";
+			samsung,sysreg = <&sysreg_peris>;
+		};
+
 		gic: interrupt-controller@10200000 {
 			compatible = "arm,gic-v3";
 			#interrupt-cells = <3>;
-- 
2.34.1

