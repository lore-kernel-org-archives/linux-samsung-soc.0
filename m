Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=203.254.224.33
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794567294;
	b=WeDOq9HGoftRgKe5LdHRNL8vy+jMNnZlONEumNXggo0OBsmVuQ5FoVLXGD9GtGbJG7rK
	 tqO7/ZzLhn0NzR4e+Vea7Qp12P/v/bCXvBaouXuZmALUivnBhYrvy4vpqZHhZHeB9zLKX
	 Yxx/17CVK3YGjQOLTvA5CIbfLux8dF4Qo41V8KFqVZYs0yAlmtlfaw0FFC/dzQgW0/cor
	 9rB+jwTH9BPc/SMf3ErponZbzf/VS0wfKBf8cgmc73n/O5siALERiahdD678UPLKoc7QW
	 08pj0wyh74pGKdop6Gcd4iG8lXsiqQYvLy5uLKDe6oxkbUP0lAGz9SoJoi1rhYo+1xQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794567294;
	h=DMARC-Filter:Received:DKIM-Filter:DKIM-Signature:Received:Received:
	 Received:Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 In-Reply-To:MIME-Version:Content-Transfer-Encoding:X-CMS-MailID:
	 X-Msg-Generator:Content-Type:X-Sendblock-Type:CMS-TYPE:X-CPGSPASS:
	 cpgsPolicy:X-CFilter-Loop:X-CMS-RootMailID:References;
	bh=1hJ0aQ7fGA2QuLMADJWwMmxygYV3IJuA53iBt1oJi10=;
	b=aQyarilC7CovkRd8qy5qS5r6Rzg3xJzRJbP1JlylNk/mbVLvOUOEVB5KyebLOoYIoaVX
	 /LJ6FTDAluJkBy3ixNJPvotg6Hf5iSYySQSisZG/sJvAyUCq4vg0XpCL2x4j0jF9IX4HJ
	 V/uw9vGg7iPjzyNJtSW2tBPy5t6XNMSbfVAE+LMGvt6gI8jcS2N5LeYzSzwsdrQIagjXt
	 b73DioSWV9VC8HBE3anEcsvQ+uYNtHgFFnDYaby1Nkm4FeWiu+Z5IoXfPCrBWSPL5o5Fy
	 Ym3cXVch4n0QnS3u53uqS+CRzvLVOMSOkbxHgfo7LqO1Hu+NBX3uTdTOO9qd9a7CuRQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=samsung.com;
	spf=pass smtp.mailfrom=samsung.com;
	dkim=pass header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=hJsZgbbc;
	arc=none smtp.remote-ip=203.254.224.33
Received: from mailout3.samsung.com (mailout3.samsung.com [203.254.224.33])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B484A606BD89
	for <linux-samsung-soc@vger.kernel.org>; Fri, 13 Nov 2026 10:54:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B484A606BD89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=hJsZgbbc
Received: from epcas5p4.samsung.com (unknown [182.195.41.42])
	by mailout3.samsung.com (KnoxPortal) with ESMTP id 20261113105451epoutp031900962d02f55b0acc400c5819fe46e2~nlXF99jST0724207242epoutp034
	for <linux-samsung-soc@vger.kernel.org>; Fri, 13 Nov 2026 10:54:51 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20261113105451epoutp031900962d02f55b0acc400c5819fe46e2~nlXF99jST0724207242epoutp034
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1794567291;
	bh=1hJ0aQ7fGA2QuLMADJWwMmxygYV3IJuA53iBt1oJi10=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=hJsZgbbcdAKkR/X7Kk7U2qOCM5Nr3Mb6uWjVv2LQWgwTegGIK/iTbpBpiQGf7gL8N
	 aguJpeTCuB0pXigVH6Nwvmg6dTWwbLvdNJ6zgmwAiP6h7jfgWAcbqA+AEiX9Yr1zm8
	 FgEOQl4zsXQP/i0jsHwoch8qcg5HPYhVCXRZoEco=
Received: from epsnrtp01.localdomain (unknown [182.195.42.153]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPS id
	20261113105450epcas5p3beb6887f44df384c978d9302dfa15106~nlXFFIk3B1064210642epcas5p3n;
	Fri, 13 Nov 2026 10:54:50 +0000 (GMT)
Received: from epcas5p3.samsung.com (unknown [182.195.38.87]) by
	epsnrtp01.localdomain (Postfix) with ESMTP id 4jQvKP23Pzz6B9m6; Fri, 13 Nov
	2026 10:54:49 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPA id
	20261113104909epcas5p1d1b81b4e800e8a1d1cf830f21e52499a~nlSH7HHFH1962219622epcas5p1V;
	Fri, 13 Nov 2026 10:49:09 +0000 (GMT)
Received: from bose.samsungds.net (unknown [107.108.83.9]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20261113104907epsmtip253a28db5655805d5560c32930af65890~nlSFi5msW2539225392epsmtip2Y;
	Fri, 13 Nov 2026 10:49:07 +0000 (GMT)
From: Raghav Sharma <raghav.s@samsung.com>
To: krzk@kernel.org, s.nawrocki@samsung.com, cw00.choi@samsung.com,
	peter.griffin@linaro.org, alim.akhtar@samsung.com, sboyd@kernel.org,
	bmasney+clk@redhat.com, jbrunet+clk@baylibre.com, robh@kernel.org,
	conor+dt@kernel.org, raghav.s@samsung.com
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, is.gandhi@samsung.com, ts.amit@samsung.com,
	pokala.reddy@samsung.com
Subject: [PATCH v3 14/14 RESEND] arm64: dts: exynos8855: add cmu_usb clock
 DT nodes
Date: Fri, 13 Nov 2026 16:36:12 +0530
Message-Id: <20261113110612.3265841-15-raghav.s@samsung.com>
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
X-CMS-MailID: 20261113104909epcas5p1d1b81b4e800e8a1d1cf830f21e52499a
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
X-CPGSPASS: Y
cpgsPolicy: CPGSC10-543,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20261113104909epcas5p1d1b81b4e800e8a1d1cf830f21e52499a
References: <20261113110612.3265841-1-raghav.s@samsung.com>
	<CGME20261113104909epcas5p1d1b81b4e800e8a1d1cf830f21e52499a@epcas5p1.samsung.com>

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

