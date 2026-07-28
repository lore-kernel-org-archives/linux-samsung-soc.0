Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5686F42CB11
	for <linux-samsung-soc@vger.kernel.org>; Tue, 28 Jul 2026 11:53:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785239583; cv=none; b=KTAPilYDvvPeTrcVUjui6ACGYx8UDCPNLAg7T4fxDHjf13KlWxmpL0SdxRCKBNJRSJc2N0sBPqOzlZjqXE7FO0EgD7IEF4f/4a+efbv0LBZ/ejxLhNZx2X5npXYEFj7crMZQBkJUVj3kBpL7Q0iG4S3xKLdolJeUY6tEys9uTgo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785239583; c=relaxed/simple;
	bh=6JjlHIIpVMWdSVYhya/tanJIicFNrcfQjFxkykwWbL8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:MIME-Version:
	 Content-Type:References; b=PZ2QTKk73d3Z97Onrn16jy7v8BWIU4fB/leYxzIUeXPiA4qLLmOyLG3gM9K/rmzJyKSLDYqMHYqHN4IIkiE1Ps3zJPS3/3QUmFmSVNAs2hoFYtFwx7rAdOMxAdrTt1WdM3Ts5nHB9ihJHgQZzhF3EGgZkGBsnuJVUKJ7BN3RY74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=guA+Xu0a; arc=none smtp.client-ip=203.254.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="guA+Xu0a"
Received: from epcas5p3.samsung.com (unknown [182.195.41.41])
	by mailout4.samsung.com (KnoxPortal) with ESMTP id 20260728115259epoutp048a999445b0bb68294bcae6a633f8e6fe~GcfBc62DG3133131331epoutp04W
	for <linux-samsung-soc@vger.kernel.org>; Tue, 28 Jul 2026 11:52:59 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20260728115259epoutp048a999445b0bb68294bcae6a633f8e6fe~GcfBc62DG3133131331epoutp04W
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1785239579;
	bh=ien/KicL20MUSYRJ4AKEFJiPdLprHP5PJTf+rK9nL7c=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=guA+Xu0aG6kbzCvJUVFG2rSUvaYjTJyctq+fhVkvJFVq+TWCE+Ai94sORSBOKcBhj
	 QUsv7y4zXZdRxTWPzXoFljGtROqukOf6rwT5PWws+9rL3P4mJlv6s73k8YD6lvwiNp
	 YHwKU32UOLaOz9ydoSaVN2W4NoD+vTuu4fsPJIRc=
Received: from epsnrtp01.localdomain (unknown [182.195.42.153]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPS id
	20260728115258epcas5p1375c6f860122152a70403d6ac72feb5e~GcfA5TPoD1219612196epcas5p1n;
	Tue, 28 Jul 2026 11:52:58 +0000 (GMT)
Received: from epcas5p2.samsung.com (unknown [182.195.38.89]) by
	epsnrtp01.localdomain (Postfix) with ESMTP id 4h8YkK5kzJz6B9m5; Tue, 28 Jul
	2026 11:52:57 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPA id
	20260728115256epcas5p38cbcfe68218d08301d237705388e6e62~Gce-DohJ21872318723epcas5p3n;
	Tue, 28 Jul 2026 11:52:56 +0000 (GMT)
Received: from bose.samsungds.net (unknown [107.108.83.9]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20260728115252epsmtip11c89084cde049e488a7b56865f3ca2bc~Gce7CCdqc2641026410epsmtip1H;
	Tue, 28 Jul 2026 11:52:52 +0000 (GMT)
From: "raghav.s" <raghav.s@samsung.com>
To: krzk@kernel.org, s.nawrocki@samsung.com, cw00.choi@samsung.com,
	peter.griffin@linaro.org, alim.akhtar@samsung.com, mturquette@baylibre.com,
	sboyd@kernel.org, bmasney@redhat.com, robh@kernel.org, conor+dt@kernel.org
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, hajun.sung@samsung.com, raghav.s@samsung.com,
	is.gandhi@samsung.com, ts.amit@samsung.com, pokala.reddy@samsung.com
Subject: [PATCH 04/13] arm64: dts: exynos8855: add cmu_top & cmu_peric clock
 DT nodes
Date: Tue, 28 Jul 2026 17:41:02 +0530
Message-Id: <20260728121111.2077860-5-raghav.s@samsung.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260728121111.2077860-1-raghav.s@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20260728115256epcas5p38cbcfe68218d08301d237705388e6e62
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-543,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20260728115256epcas5p38cbcfe68218d08301d237705388e6e62
References: <20260728121111.2077860-1-raghav.s@samsung.com>
	<CGME20260728115256epcas5p38cbcfe68218d08301d237705388e6e62@epcas5p3.samsung.com>

Add required dt node for cmu_top & cmu_peric block

Signed-off-by: raghav.s <raghav.s@samsung.com>
---
 arch/arm64/boot/dts/exynos/exynos8855.dtsi | 24 ++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/exynos8855.dtsi b/arch/arm64/boot/dts/exynos/exynos8855.dtsi
index 9d82fceb5130..0053730b3e01 100644
--- a/arch/arm64/boot/dts/exynos/exynos8855.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos8855.dtsi
@@ -10,6 +10,7 @@
  */
 
 #include <dt-bindings/interrupt-controller/arm-gic.h>
+#include <dt-bindings/clock/samsung,exynos8855.h>
 
 / {
 	compatible = "samsung,exynos8855";
@@ -165,12 +166,35 @@ pinctrl_cmgp: pinctrl@12030000 {
 			interrupts = <GIC_SPI 114 IRQ_TYPE_LEVEL_HIGH>;
 		};
 
+		cmu_top: clock-controller@13900000 {
+			compatible = "samsung,exynos8855-cmu-top";
+			reg = <0x13900000 0x8000>;
+			#clock-cells = <1>;
+			clocks = <&oscclk>;
+			clock-names = "oscclk";
+		};
+
 		pinctrl_usi: pinctrl@15030000 {
 			compatible = "samsung,exynos8855-pinctrl";
 			reg = <0x15030000 0x1000>;
 			interrupts = <GIC_SPI 440 IRQ_TYPE_LEVEL_HIGH>;
 		};
 
+		cmu_peric: clock-controller@15400000 {
+			compatible = "samsung,exynos8855-cmu-peric";
+			reg = <0x15400000 0x8000>;
+			#clock-cells = <1>;
+
+			clocks = <&oscclk>,
+				 <&cmu_top CLKCMU_DOUT_PERIC_NOC>,
+				 <&cmu_top CLKCMU_DOUT_PERIC_MMC_CARD>,
+				 <&cmu_top CLKCMU_DOUT_PERIC_IP>;
+			clock-names = "oscclk",
+				      "bus",
+				      "mmc_card",
+				      "ip";
+		};
+
 		pinctrl_peric: pinctrl@15440000 {
 			compatible = "samsung,exynos8855-pinctrl";
 			reg = <0x15440000 0x1000>;
-- 
2.34.1

