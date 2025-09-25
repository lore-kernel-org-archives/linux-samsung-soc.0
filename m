Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A38D202C46
	for <linux-samsung-soc@vger.kernel.org>; Thu, 25 Sep 2025 12:56:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758804991; cv=none; b=pXZGxCsz9KlOOpNrBY0i1oSx+G3UTkCURblT3evWg7nCLBaqwNWfW+PuIIVM/PhxHLykLsnvXyocqGBaLKQJttkmxUYLbxQ1S+N1vTubH5uI4oZOVOEF1DyJuEx7r4Us8OuuqkZXBrk7jEB/fjz0Xln4S89Oysz2Vi0bUFLlSRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758804991; c=relaxed/simple;
	bh=zfRD2NhN+jwJe3TpYl4kyedsa+MtS16LR2jcIuY5Nvo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:MIME-Version:
	 Content-Type:References; b=IS3n8h9zxiqLPriH+RBUYt0Nd355nlnEH9mcFmtiZ9Sd6Nl1Od40EHHYill5F/fg60eNhQtvT3bGPX6tNZepEGc3PAD/HuYVhhWNxLwH4YVe3wW8Z7BYwb9tPgn4fmxwveqRZ9Sbgx+0W+pu2E9MV5xU5bezQ3TNqwBlh9oZp0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=QtbQxVaZ; arc=none smtp.client-ip=203.254.224.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="QtbQxVaZ"
Received: from epcas5p1.samsung.com (unknown [182.195.41.39])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20250925125626epoutp02f44a3d6b6fd9bc0903527e5b9ee47ba2~oh9EWyQlJ2265422654epoutp02R
	for <linux-samsung-soc@vger.kernel.org>; Thu, 25 Sep 2025 12:56:26 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20250925125626epoutp02f44a3d6b6fd9bc0903527e5b9ee47ba2~oh9EWyQlJ2265422654epoutp02R
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1758804986;
	bh=emDBLi0S/XbmKkKrMOpftjZrfm/X9R0ePHepVQNumuQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=QtbQxVaZMOTNc9SnArQhy8kECydiSbgkE1EbrdK/+rwbFbGzjCGWD4WyQVJPmIlUX
	 HItoYfWfS7m53kw74lLQ/vxWMdBbAaEZuFq8/sTQeaRXWDjfAeNEL9P36pCFVF+COD
	 nhuKf1d36jWfm7Jr80YHl992P7YbebM9tAJq8YuE=
Received: from epsnrtp01.localdomain (unknown [182.195.42.153]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPS id
	20250925125625epcas5p102b8b73d66fa1c644f6d5253a6572ba5~oh9DtWlVI0620606206epcas5p1e;
	Thu, 25 Sep 2025 12:56:25 +0000 (GMT)
Received: from epcas5p2.samsung.com (unknown [182.195.38.92]) by
	epsnrtp01.localdomain (Postfix) with ESMTP id 4cXYcm6mD9z6B9m5; Thu, 25 Sep
	2025 12:56:24 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPA id
	20250925125624epcas5p1b8da5d2cca89128d286f740b9896c609~oh9CQvnaO2772627726epcas5p1X;
	Thu, 25 Sep 2025 12:56:24 +0000 (GMT)
Received: from bose.samsungds.net (unknown [107.108.83.9]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20250925125620epsmtip23c875d90d5ac17a4285aaef1ddbd0109~oh8__yXQ-1425914259epsmtip2k;
	Thu, 25 Sep 2025 12:56:20 +0000 (GMT)
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
Subject: [PATCH 3/3] arm64: dts: exynosautov920: add CMU_MFC clock DT nodes
Date: Thu, 25 Sep 2025 18:34:57 +0530
Message-Id: <20250925130457.3476803-4-raghav.s@samsung.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250925130457.3476803-1-raghav.s@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250925125624epcas5p1b8da5d2cca89128d286f740b9896c609
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-543,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250925125624epcas5p1b8da5d2cca89128d286f740b9896c609
References: <20250925130457.3476803-1-raghav.s@samsung.com>
	<CGME20250925125624epcas5p1b8da5d2cca89128d286f740b9896c609@epcas5p1.samsung.com>

Add required dt node for CMU_MFC block, which provides
clocks for MFC IP

Signed-off-by: Raghav Sharma <raghav.s@samsung.com>
---
 arch/arm64/boot/dts/exynos/exynosautov920.dtsi | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/exynosautov920.dtsi b/arch/arm64/boot/dts/exynos/exynosautov920.dtsi
index d19d71faa6f8..6ee74d260776 100644
--- a/arch/arm64/boot/dts/exynos/exynosautov920.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynosautov920.dtsi
@@ -1449,6 +1449,19 @@ ufs_0_phy: phy@16e04000 {
 			status = "disabled";
 		};
 
+		cmu_mfc: clock-controller@19c00000 {
+			compatible = "samsung,exynosautov920-cmu-mfc";
+			reg = <0x19c00000 0x8000>;
+			#clock-cells = <1>;
+
+			clocks = <&xtcxo>,
+				 <&cmu_top DOUT_CLKCMU_MFC_MFC>,
+				 <&cmu_top DOUT_CLKCMU_MFC_WFD>;
+			clock-names = "oscclk",
+				      "mfc",
+				      "wfd";
+		};
+
 		pinctrl_aud: pinctrl@1a460000 {
 			compatible = "samsung,exynosautov920-pinctrl";
 			reg = <0x1a460000 0x10000>;
-- 
2.34.1

