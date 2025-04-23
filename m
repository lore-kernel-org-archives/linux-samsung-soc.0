Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC1D5267F58
	for <linux-samsung-soc@vger.kernel.org>; Wed, 23 Apr 2025 06:52:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745391138; cv=none; b=egsIW6oOmDIlbOilOCyatEqvpTwdhWkSDbQjl2RoHq0rrpDAPA9cmzNjV8o5X3i62/o3YKKhzwyzg6T8F5BRPAylcLd2i3fwJTDy4dvqrrks826+PoStnYQM4yVwskBwN2LtHHNb3IN34UIZfr2QxB8+lxKL8s8KhqFSy7UqRQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745391138; c=relaxed/simple;
	bh=bL+LtkMfOsvBWlXbFClLhSCh0I7SAFPogrm5vzCCgBQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 References; b=M5tHCah9A6PMMBTjFTLyk/I/x3sBTg2SRsYxkGpePgD6Gz4rtkW6xBRkKujr36X7UfnomwZ3QwhZt0gFdgG5WmlE3Aavgw0uQPVELcJIyHw07lAxHdX+00v3nHJKbWE3J5mOLpBwMDX1PSk7YZPI6UCrl9Hd/xhPRmBy0D4+bWM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=cxS8GEU+; arc=none smtp.client-ip=203.254.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="cxS8GEU+"
Received: from epcas5p4.samsung.com (unknown [182.195.41.42])
	by mailout4.samsung.com (KnoxPortal) with ESMTP id 20250423065212epoutp04f5377ded3e8b054d84596349086902c5~43-zaQMoo2044220442epoutp04X
	for <linux-samsung-soc@vger.kernel.org>; Wed, 23 Apr 2025 06:52:12 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20250423065212epoutp04f5377ded3e8b054d84596349086902c5~43-zaQMoo2044220442epoutp04X
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1745391132;
	bh=sCMKVaP+cy0u4Wt+s96a/0ZTfWOMeEFbK8aMXkMagXQ=;
	h=From:To:Cc:Subject:Date:References:From;
	b=cxS8GEU+7Ab2SOkAiApnW7D7k+yUo7151cykyy7EqqffQgBs9F/mRf3QCOTHx8pDP
	 LmMszPKfRiEp29K/1uvR/sLZIqsJhns/UO5dkzsyrKKee0d6TNhRIo+XoBA4+NLSOB
	 qTvjhBODGlI5P0Z6go66T15RzgBeYCfUsSRH3uZE=
Received: from epsnrtp04.localdomain (unknown [182.195.42.156]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPS id
	20250423065212epcas5p2e537f7634a3d93d9f54c4aea48399cca~43-y5S0v71817318173epcas5p2l;
	Wed, 23 Apr 2025 06:52:12 +0000 (GMT)
Received: from epcas5p1.samsung.com (unknown [182.195.38.178]) by
	epsnrtp04.localdomain (Postfix) with ESMTP id 4Zj8t25dc1z6B9mB; Wed, 23 Apr
	2025 06:52:10 +0000 (GMT)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPA id
	20250423060042epcas5p2c04be779e21089f33b8a9a7785bb151a~43S1K6yxW1700517005epcas5p2o;
	Wed, 23 Apr 2025 06:00:42 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
	epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
	20250423060042epsmtrp2ffea677e8c78fe8fe5d99ded8a24997a~43S1JwWvn2017920179epsmtrp2h;
	Wed, 23 Apr 2025 06:00:42 +0000 (GMT)
X-AuditID: b6c32a29-55afd7000000223e-4a-6808820af8c7
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
	epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
	17.34.08766.A0288086; Wed, 23 Apr 2025 15:00:42 +0900 (KST)
Received: from INBRO002053.samsungds.net (unknown [107.122.2.234]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20250423060040epsmtip2463b8b5e2df2ed814f7deaae604d3280~43Szb_efD1997919979epsmtip2y;
	Wed, 23 Apr 2025 06:00:40 +0000 (GMT)
From: Yashwant Varur <yashwant.v@samsung.com>
To: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	alim.akhtar@samsung.com, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: cs0617.lee@samsung.com, g.naidu@samsung.com, niyas.ahmed@samsung.com,
	yashwant.v@samsung.com
Subject: [PATCH] arm64: dts: exynos: Added the ethernet pin configuration
Date: Wed, 23 Apr 2025 11:30:34 +0530
Message-Id: <20250423060034.973-1-yashwant.v@samsung.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrILMWRmVeSWpSXmKPExsWy7bCSvC5XE0eGweud7BYP5m1js1iz9xyT
	xap3vBbzj5xjtdgy8zKzxctZ99gsNj2+xmpxedccNosZ5/cxWTyZ8ojV4v+eHewWqyY+YnPg
	8di0qpPNY/OSeo++LasYPT5vkgtgieKySUnNySxLLdK3S+DK+HD4FnvBbf6KzlOHmRsYJ/N2
	MXJySAiYSOxcfZupi5GLQ0hgN6PEjVNNbF2MHEAJKYmGN+EQNcISK/89Z4eo+coo8ezCb0aQ
	BJuArsS+L0cZQRIiAs8YJZa2LmUBSTALpEn8fdsJViQs4Clx7lcLE4jNIqAqMe/ZdzCbV8BS
	YvvbR0wQG+Ql9h88ywwRF5Q4OfMJ1Bx5ieats5knMPLNQpKahSS1gJFpFaNkakFxbnpusWGB
	YV5quV5xYm5xaV66XnJ+7iZGcChrae5g3L7qg94hRiYOxkOMEhzMSiK8v9zYM4R4UxIrq1KL
	8uOLSnNSiw8xSnOwKInzir/oTRESSE8sSc1OTS1ILYLJMnFwSjUwbRRf+kinNHiFor/O2VfJ
	eReDA/cdZ1q5mPvpOt/GTEkTSVGz1sPhs+P/eUhIHfFUvnWjfmPoriqXlvf+S2OnaMXdzeB9
	bbwoUfP26ojVnw60f7zTxpSiH6e3aGn045/cVbcSj56tv1rpFtFSHx/BYr9qjemSmx9M2XXy
	s3RP3kmofeWlOHVx1N6DEbb1IgxPJdRmH7sTM9/23t0i1iNTs6rbDx534Ak5ZdF8zfqGooHC
	g6wXBz8wiu8T+OJmavBpHZPOipXW0t+rHu248EDJzV2HR4XXp6Gk7mq1kpWFUmBysbjRBLOj
	Yt0xyx3/X3n4xH1FwK/Tr1b+iktmzm+7lDAjdsrheculOFsa2kWUWIozEg21mIuKEwHD0cEp
	1AIAAA==
X-CMS-MailID: 20250423060042epcas5p2c04be779e21089f33b8a9a7785bb151a
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-543,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250423060042epcas5p2c04be779e21089f33b8a9a7785bb151a
References: <CGME20250423060042epcas5p2c04be779e21089f33b8a9a7785bb151a@epcas5p2.samsung.com>

This patch adds the ethernet pin configuration.

Signed-off-by: Yashwant Varur <yashwant.v@samsung.com>
Signed-off-by: Changsub Lee <cs0617.lee@samsung.com>
---
 .../dts/exynos/exynosautov920-pinctrl.dtsi    | 41 +++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/exynosautov920-pinctrl.dtsi b/arch/arm64/boot/dts/exynos/exynosautov920-pinctrl.dtsi
index 663e8265cbf5..778584d339d5 100644
--- a/arch/arm64/boot/dts/exynos/exynosautov920-pinctrl.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynosautov920-pinctrl.dtsi
@@ -166,6 +166,24 @@ gph6: gph6-gpio-bank {
 		interrupt-controller;
 		#interrupt-cells = <2>;
 	};
+
+	eth0_pps_out: eth0_pps_out {
+		samsung,pins = "gph3-0";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_OUTPUT>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+	};
+
+	eth0_rgmii: eth0_rgmii {
+		samsung,pins = "gph3-1", "gph3-2", "gph3-3", "gph3-4",
+				"gph3-5", "gph3-6", "gph3-7", "gph4-0",
+				"gph4-1", "gph4-2", "gph4-3", "gph4-4";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+	};
+
+	eth0_mdc_mdio: eth0_mdc_mdio {
+		samsung,pins = "gph4-5", "gph4-6";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+	};
 };
 
 &pinctrl_hsi2ufs {
@@ -750,6 +768,29 @@ i3c3_bus: i3c3-bus-pins {
 		samsung,pin-function = <EXYNOS_PIN_FUNC_4>;
 		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
 	};
+
+	eth_extpll_avb: eth_extpll_avb {
+		samsung,pins = "gpg3-0";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV3>;
+	};
+
+	eth0_pps_out0: eth0_pps_out0 {
+		samsung,pins = "gpg0-0";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+	};
+
+	eth0_pps_out1: eth0_pps_out1 {
+		samsung,pins = "gpg0-1";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+	};
+
+	eth_phy_reset: eth_phy_reset {
+		samsung,pins = "gpg3-1";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_OUTPUT>;
+	};
+
 };
 
 &pinctrl_peric1 {
-- 
2.34.1

