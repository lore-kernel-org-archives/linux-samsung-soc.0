Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=203.254.224.25
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792479001;
	b=ujf3O+3J+wtLuT4G79IEUoGWHs+jVDgZH5E/j/FBwaxwMlbG8gNXNddr5OoXJJx26ck+
	 o0z0WU7Yc7VJZOzjVFLLZTrhcM86MeD/kUSuAr9Jjee/ciTbv90i2nIImfOFSNGPGBze0
	 toe1qqA8xvksBw1SYzbYd9zMN6iylg2alIPiAr/ueJgv4zkrjUXcoiID0iMF7+fLi/KxN
	 PBfgpjfjW08nA9Y1+FCkd1k6+f36S2oxBdFLViLwB+w+gID4+Uj03wkGJRt8H/oVfy8TT
	 QVJ9nXs63E2QCM6Nxo3AnQGefoOKGXHS2c8+vyVZnxqUbibcF34z9kMyvoOXd55q1jQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792479001;
	h=DMARC-Filter:Received:DKIM-Filter:DKIM-Signature:Received:Received:
	 Received:Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 In-Reply-To:MIME-Version:Content-Transfer-Encoding:X-CMS-MailID:
	 X-Msg-Generator:Content-Type:X-Sendblock-Type:CMS-TYPE:cpgsPolicy:
	 X-CFilter-Loop:X-CMS-RootMailID:References;
	bh=tWkaG3M1ybkYTdaWSTR7V1saFfsOuJsMAGwFO7f5RRE=;
	b=OMmMoqIwdnse492BSuqd96s/P0QvvO4TFMWCTnKox9Alkw8KMAKKwqVTYHPf/fC3s+il
	 KMVam420FvANK02Ni+Y70rxyshQR3NziF15gj8Fgo3Ed1vadWab7lmB3IVy4O12NLgib6
	 BFI7G/4E7MMwKpDfSpj4G6Yzp9kehR2xduM7Nn/E39pZWpDp6ercSgBUZC8IIlFOWMU5t
	 Fig0Fs8Gmzwwwbh4aPlIAse0bttx+ObvgKOblQyvWqrNTqoAz5JGFsc+kchJYyz1T+OOg
	 tHx8Qp9sFBOaOgtVbgwFT1JwHeqET0KWPLxNAYyCAK2c9Ny50fDpN1/+bjoFgxNa6EQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=samsung.com;
	spf=pass smtp.mailfrom=samsung.com;
	dkim=pass header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=bEAZzL0Q;
	arc=none smtp.remote-ip=203.254.224.25
Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE28F60A2601
	for <linux-samsung-soc@vger.kernel.org>; Tue, 20 Oct 2026 06:50:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BE28F60A2601
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=bEAZzL0Q
Received: from epcas5p1.samsung.com (unknown [182.195.41.39])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20261020064959epoutp0262d30e1d39d831d692d0dc5535c592b3~gKicUsV8S2267922679epoutp02D
	for <linux-samsung-soc@vger.kernel.org>; Tue, 20 Oct 2026 06:49:59 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20261020064959epoutp0262d30e1d39d831d692d0dc5535c592b3~gKicUsV8S2267922679epoutp02D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1792478999;
	bh=tWkaG3M1ybkYTdaWSTR7V1saFfsOuJsMAGwFO7f5RRE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=bEAZzL0QQPjcbejbEnUpg21qoiA2fCLVRFjRF9RpDjGAeQHIW+7apxeA9ZH2LWpdv
	 JosjPLyi1ebytT5IMHtmbkzqrNhlltHkgkDzN2ULqjJNhjzdQsi+hxT6HxAr6E0jPQ
	 DfFLgIL9QxOK9wnGPEAUKDykREHLmTGr4CaMRbjA=
Received: from epsnrtp03.localdomain (unknown [182.195.42.155]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPS id
	20261020064958epcas5p27b1e8ab2e53212c7476b6d5529ff1d59~gKibX1GIp0635106351epcas5p2H;
	Tue, 20 Oct 2026 06:49:58 +0000 (GMT)
Received: from epcas5p2.samsung.com (unknown [182.195.38.89]) by
	epsnrtp03.localdomain (Postfix) with ESMTP id 4j831x01gPz3hhTD; Tue, 20 Oct
	2026 06:49:57 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPA id
	20261020063835epcas5p2d869b6a168944982aebd5defa736bba0~gKYgGN7AV2333523335epcas5p23;
	Tue, 20 Oct 2026 06:38:35 +0000 (GMT)
Received: from bose.samsungds.net (unknown [107.108.83.9]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20261020063833epsmtip108705944dd0b2e4142e079a6a0b4d202~gKYdvlOyP0323303233epsmtip1G;
	Tue, 20 Oct 2026 06:38:33 +0000 (GMT)
From: Raghav Sharma <raghav.s@samsung.com>
To: krzk@kernel.org, s.nawrocki@samsung.com, cw00.choi@samsung.com,
	peter.griffin@linaro.org, alim.akhtar@samsung.com, sboyd@kernel.org,
	bmasney+clk@redhat.com, jbrunet+clk@baylibre.com, robh@kernel.org,
	conor+dt@kernel.org, raghav.s@samsung.com
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, is.gandhi@samsung.com, ts.amit@samsung.com,
	pokala.reddy@samsung.com
Subject: [PATCH v3 13/14] arm64: dts: exynos8855: add cmu_hsi clock DT nodes
Date: Tue, 20 Oct 2026 12:25:57 +0530
Message-Id: <20261020065558.1829402-14-raghav.s@samsung.com>
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
X-CMS-MailID: 20261020063835epcas5p2d869b6a168944982aebd5defa736bba0
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-543,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20261020063835epcas5p2d869b6a168944982aebd5defa736bba0
References: <20261020065558.1829402-1-raghav.s@samsung.com>
	<CGME20261020063835epcas5p2d869b6a168944982aebd5defa736bba0@epcas5p2.samsung.com>

Add required dt node for cmu_hsi block, while at it add
sysreg_hsi node which contians bits for DRCG and MEMCLK
which are used by clock driver

Signed-off-by: Alim Akhtar <alim.akhtar@samsung.com>
Signed-off-by: Raghav Sharma <raghav.s@samsung.com>
---
 arch/arm64/boot/dts/exynos/exynos8855.dtsi | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/exynos8855.dtsi b/arch/arm64/boot/dts/exynos/exynos8855.dtsi
index b461de6a7548..3dd7a4c4c609 100644
--- a/arch/arm64/boot/dts/exynos/exynos8855.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos8855.dtsi
@@ -241,6 +241,27 @@ pinctrl_pericmmc: pinctrl@154f0000 {
 			interrupts = <GIC_SPI 395 IRQ_TYPE_LEVEL_HIGH>;
 		};
 
+		cmu_hsi: clock-controller@17000000 {
+			compatible = "samsung,exynos8855-cmu-hsi";
+			reg = <0x17000000 0x10000>;
+			#clock-cells = <1>;
+
+			clocks = <&oscclk>,
+				 <&cmu_top CLKCMU_DOUT_HSI_NOC>,
+				 <&cmu_top CLKCMU_DOUT_HSI_UFS_EMBD>;
+			clock-names = "oscclk",
+				      "bus",
+				      "ufs_embd";
+			samsung,sysreg = <&sysreg_hsi>;
+		};
+
+		sysreg_hsi: syscon@17020000 {
+			compatible = "samsung,exynos8855-hsi-sysreg",
+				      "syscon";
+			reg = <0x17020000 0x10000>;
+			clocks = <&cmu_hsi CLK_GOUT_SYSREG_HSI>;
+		};
+
 		pinctrl_hsi_ufs: pinctrl@17040000 {
 			compatible = "samsung,exynos8855-pinctrl";
 			reg = <0x17040000 0x1000>;
-- 
2.34.1

