Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=203.254.224.24
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794567282;
	b=sK5P0xwcxInfOj++yBcENHRuAY5wGTz3oXq6BO9o79MpHeVvV3kKk8ItORer+rWjxe/N
	 73/bJ6Ru+mj4TDsDnXPrJf3u87Pd1xutnrEuFImfZoHEYaIIieqXhN/emyYt73x8s7fbE
	 e69NKH5B/8Af0RBd4ZOneuUAP+Z9HQDO+WcPGwxNmuR67WIbJUeqJi2+Jdc7VzejWoF7L
	 oewu22bHX1rH+/xSF4DXZHzyn299TNJflUpy3QqlP8U/2iGos8SwLPppeS4b3N1iPgI74
	 1I4PUyhUjqxQIR+Sy4YlNphVlbS7Udke07A/YdFJQhrEci1ewb15QGrGeJV6XnXXl4w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794567282;
	h=DMARC-Filter:Received:DKIM-Filter:DKIM-Signature:Received:Received:
	 Received:Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 In-Reply-To:MIME-Version:Content-Transfer-Encoding:X-CMS-MailID:
	 X-Msg-Generator:Content-Type:X-Sendblock-Type:CMS-TYPE:X-CPGSPASS:
	 cpgsPolicy:X-CFilter-Loop:X-CMS-RootMailID:References;
	bh=maBUpjo3g0KZFtGYzIJqew6LPOZ23uD7gqeYdMcjDLU=;
	b=y3vqTRQwmZLJ2EEkRRQ7TasKIZ8s9auVgWSvl31bSz8gGTx6kjlhTAT4qq+XX5r9NjBN
	 Cbvsv1xum8YOp7W/t6kYBJF+aP/04QqZhFI8nBhOrrlvq+X7mPfIkZrLFr1C9ZlEo1OkC
	 oIhzBfqyEqLnFAPIZUbjq/dItt4FzMi8w03uaxb5gZrSlciRXYMOaLGKsVRXl5f+2QwZZ
	 3ETQ+sqiBZs7hKkDH+oHLwDj+cTh064dxBRdEHhqvzK+qZ4MbdDzOiWi3sv/9ddWNbarI
	 O3faJ1Gb9kjT3E+JQV5oSSGts/8ol0LsiqbfXKFYhrE694Wfky5PIYemkec1x5kjx6Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=samsung.com;
	spf=pass smtp.mailfrom=samsung.com;
	dkim=pass header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=k967YDOy;
	arc=none smtp.remote-ip=203.254.224.24
Received: from mailout1.samsung.com (mailout1.samsung.com [203.254.224.24])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEA8E606B259
	for <linux-samsung-soc@vger.kernel.org>; Fri, 13 Nov 2026 10:54:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BEA8E606B259
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=k967YDOy
Received: from epcas5p1.samsung.com (unknown [182.195.41.39])
	by mailout1.samsung.com (KnoxPortal) with ESMTP id 20261113105440epoutp01f784c854b984bcf38bc712d77ed13304~nlW7z_Uvo0704907049epoutp01V
	for <linux-samsung-soc@vger.kernel.org>; Fri, 13 Nov 2026 10:54:40 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20261113105440epoutp01f784c854b984bcf38bc712d77ed13304~nlW7z_Uvo0704907049epoutp01V
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1794567280;
	bh=maBUpjo3g0KZFtGYzIJqew6LPOZ23uD7gqeYdMcjDLU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=k967YDOynOs5q+qTUYvdIT1strVqrEfz9CK9q+ZaBNiBLttKLgFh7nDNcDEawf2VC
	 fX4nUn+mtxZo18PiW0OwfYBD/3pFet5vPvwEFbe5SzX+w62RaepQU6OboAhhH2qyu0
	 l/7P2RyDiv6AjpfcZrBxTPlGGpUwiSTkrPTFIR1I=
Received: from epsnrtp03.localdomain (unknown [182.195.42.155]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPS id
	20261113105439epcas5p4247ef2ea76494e3b06bdd51a6c346821~nlW7K2_JM0195101951epcas5p45;
	Fri, 13 Nov 2026 10:54:39 +0000 (GMT)
Received: from epcas5p4.samsung.com (unknown [182.195.38.90]) by
	epsnrtp03.localdomain (Postfix) with ESMTP id 4jQvKB3qxLz3hhTB; Fri, 13 Nov
	2026 10:54:38 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPA id
	20261113104904epcas5p1546fd543fad42a61f1a70d4fd55ac833~nlSC6VPUQ1962219622epcas5p1F;
	Fri, 13 Nov 2026 10:49:04 +0000 (GMT)
Received: from bose.samsungds.net (unknown [107.108.83.9]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20261113104901epsmtip2f65f7a35aa6da8d4c5dd619b875a2007~nlSAOTIAn2220522205epsmtip2M;
	Fri, 13 Nov 2026 10:49:01 +0000 (GMT)
From: Raghav Sharma <raghav.s@samsung.com>
To: krzk@kernel.org, s.nawrocki@samsung.com, cw00.choi@samsung.com,
	peter.griffin@linaro.org, alim.akhtar@samsung.com, sboyd@kernel.org,
	bmasney+clk@redhat.com, jbrunet+clk@baylibre.com, robh@kernel.org,
	conor+dt@kernel.org, raghav.s@samsung.com
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, is.gandhi@samsung.com, ts.amit@samsung.com,
	pokala.reddy@samsung.com
Subject: [PATCH v3 12/14 RESEND] arm64: dts: exynos8855: add cmu_peris clock
 DT nodes
Date: Fri, 13 Nov 2026 16:36:10 +0530
Message-Id: <20261113110612.3265841-13-raghav.s@samsung.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261113110612.3265841-1-raghav.s@samsung.com>
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
X-CMS-MailID: 20261113104904epcas5p1546fd543fad42a61f1a70d4fd55ac833
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
X-CPGSPASS: Y
cpgsPolicy: CPGSC10-543,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20261113104904epcas5p1546fd543fad42a61f1a70d4fd55ac833
References: <20261113110612.3265841-1-raghav.s@samsung.com>
	<CGME20261113104904epcas5p1546fd543fad42a61f1a70d4fd55ac833@epcas5p1.samsung.com>

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

