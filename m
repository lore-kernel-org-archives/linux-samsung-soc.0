Received: from mailout1.samsung.com (mailout1.samsung.com [203.254.224.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96DE02FAC0E
	for <linux-samsung-soc@vger.kernel.org>; Mon, 15 Sep 2025 09:45:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.24
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757929523; cv=none; b=rJHOIRvLy91fFPatmps5J/TPMqDnK8dn2tJf11fzyKTc5TKDRYpRUthYoZby0TXB+WmlYikeDmGgva/v8BM/C2glKwApQ2Zz0SvGh1b33sm0ye5f7mLqZLdLvuJ5dF5eh9tnUGtcjaioQRv+qkdrLIlwt81n8vGnfg5SXJcsSkM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757929523; c=relaxed/simple;
	bh=+4atGC30te10VhjDx/SUYYrTyldTWCjSe4FbHda0HNU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:MIME-Version:
	 Content-Type:References; b=GwuKsmpDZMU7ayxg0/AIHKTf2AU9v0PsnkuKOKg8Dn6tKwLcZJzGqFdz87x+U1v87c7dfzdIy/ConF4amaJZhv6aG9WlS99J9BQ/xOAw21qS3lKpT6vrr29iizLrwGml/kDaWhxB8YvKLo1RDmXDaDdGH+xDCbAyCgPdbsoihLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=cTJSmhRL; arc=none smtp.client-ip=203.254.224.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="cTJSmhRL"
Received: from epcas5p2.samsung.com (unknown [182.195.41.40])
	by mailout1.samsung.com (KnoxPortal) with ESMTP id 20250915094520epoutp01c5a3fc4f85c2333c40991b4711f767ff~la5WmD60d2475024750epoutp01V
	for <linux-samsung-soc@vger.kernel.org>; Mon, 15 Sep 2025 09:45:20 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20250915094520epoutp01c5a3fc4f85c2333c40991b4711f767ff~la5WmD60d2475024750epoutp01V
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1757929520;
	bh=h5Qx2f0DAcTaHN6YlDlV7lx8gsTEB7rVcts4fMiiACk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=cTJSmhRLMtP8b8BOGBcMx2tZ2tOw+fUh35mjxm6zUAfliXjVXn+slfGJpNm9rpksG
	 vxmAAoeqei4OVjFdq03/UvywCOsZmYg0FsMYw7SGJ4lZlbMHxNDDencsh2noerd3oE
	 z7tXwGD7m0UyM01lKgeQ3Fy08ofnHfmY2gBnSc0A=
Received: from epsnrtp04.localdomain (unknown [182.195.42.156]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPS id
	20250915094519epcas5p49dcc9ee8e9c917923c7bcfd996043832~la5V97V5y1185011850epcas5p4F;
	Mon, 15 Sep 2025 09:45:19 +0000 (GMT)
Received: from epcas5p1.samsung.com (unknown [182.195.38.92]) by
	epsnrtp04.localdomain (Postfix) with ESMTP id 4cQKrt2nS9z6B9m8; Mon, 15 Sep
	2025 09:45:18 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPA id
	20250915094517epcas5p2186fc92cca758b6fe610c0ec91ee51bc~la5UiVNol1637416374epcas5p2o;
	Mon, 15 Sep 2025 09:45:17 +0000 (GMT)
Received: from bose.samsungds.net (unknown [107.108.83.9]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20250915094515epsmtip24dc5a7988d4add454ce9185519ae6d2d~la5SLhp3X0834508345epsmtip2S;
	Mon, 15 Sep 2025 09:45:15 +0000 (GMT)
From: Raghav Sharma <raghav.s@samsung.com>
To: krzk@kernel.org, s.nawrocki@samsung.com, cw00.choi@samsung.com,
	alim.akhtar@samsung.com, mturquette@baylibre.com, sboyd@kernel.org,
	robh@kernel.org, conor+dt@kernel.org, sunyeal.hong@samsung.com,
	shin.son@samsung.com
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, chandan.vn@samsung.com,
	dev.tailor@samsung.com, karthik.sun@samsung.com, Raghav Sharma
	<raghav.s@samsung.com>
Subject: [PATCH v2 3/3] arm64: dts: exynosautov920: add CMU_M2M clock DT
 nodes
Date: Mon, 15 Sep 2025 15:24:01 +0530
Message-Id: <20250915095401.3699849-4-raghav.s@samsung.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250915095401.3699849-1-raghav.s@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250915094517epcas5p2186fc92cca758b6fe610c0ec91ee51bc
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-543,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250915094517epcas5p2186fc92cca758b6fe610c0ec91ee51bc
References: <20250915095401.3699849-1-raghav.s@samsung.com>
	<CGME20250915094517epcas5p2186fc92cca758b6fe610c0ec91ee51bc@epcas5p2.samsung.com>

Add required dt node for CMU_M2M block, which provides
clocks for M2M IP

Signed-off-by: Raghav Sharma <raghav.s@samsung.com>
---
 arch/arm64/boot/dts/exynos/exynosautov920.dtsi | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/exynosautov920.dtsi b/arch/arm64/boot/dts/exynos/exynosautov920.dtsi
index 0fdf2062930a..d19d71faa6f8 100644
--- a/arch/arm64/boot/dts/exynos/exynosautov920.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynosautov920.dtsi
@@ -1454,6 +1454,19 @@ pinctrl_aud: pinctrl@1a460000 {
 			reg = <0x1a460000 0x10000>;
 		};
 
+		cmu_m2m: clock-controller@1a800000 {
+			compatible = "samsung,exynosautov920-cmu-m2m";
+			reg = <0x1a800000 0x8000>;
+			#clock-cells = <1>;
+
+			clocks = <&xtcxo>,
+				 <&cmu_top DOUT_CLKCMU_M2M_NOC>,
+				 <&cmu_top DOUT_CLKCMU_M2M_JPEG>;
+			clock-names = "oscclk",
+				      "noc",
+				      "jpeg";
+		};
+
 		cmu_cpucl0: clock-controller@1ec00000 {
 			compatible = "samsung,exynosautov920-cmu-cpucl0";
 			reg = <0x1ec00000 0x8000>;
-- 
2.34.1

