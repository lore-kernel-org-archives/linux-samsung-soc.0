Received: from mailout3.samsung.com (mailout3.samsung.com [203.254.224.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3761A274FE8
	for <linux-samsung-soc@vger.kernel.org>; Mon, 15 Sep 2025 05:11:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757913072; cv=none; b=Q/r40tnDD/4IvB7HgT/43Ze9JJH14Bc5lj2GziVz1pZVYmgOa1tVlatYseeLvHSqyFfw9ul0ON8AV+PNNZvpzjTJa8CUlQMqJ1ezHBUeJueOTZq38YeOfGfRfFN2YMGcuoUrSLEXnnZddm46oTl9gUiUOOPQ1rBlX8GMb9lZfxE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757913072; c=relaxed/simple;
	bh=KmEQCW9Cql9a5TIIg9oOo7EoLIf6c3rjcaWqnBj9prU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:MIME-Version:
	 Content-Type:References; b=ug55ujhvEGcjZwGuCz5FZTud4upkYlN4pMoSuHFv8NzI+8tPhdlOlva58ljFUF6MWmLhn2M7nmfITRYYkaYZ7rFPsx1uk1iZP/IBkB/4U/6r5eMXJlerrTRynv6ieqC5Av+U+kxTRxwQJ4ho07jkD+8a5cSblKhyuIf0+gQ/Odk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=TiZkmvwe; arc=none smtp.client-ip=203.254.224.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="TiZkmvwe"
Received: from epcas2p3.samsung.com (unknown [182.195.41.55])
	by mailout3.samsung.com (KnoxPortal) with ESMTP id 20250915051108epoutp03f5a055393f4e0d44b3efd06dea8860f4~lXJ8-dOBb2685726857epoutp03C
	for <linux-samsung-soc@vger.kernel.org>; Mon, 15 Sep 2025 05:11:08 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20250915051108epoutp03f5a055393f4e0d44b3efd06dea8860f4~lXJ8-dOBb2685726857epoutp03C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1757913068;
	bh=qmqMtJNrFtzSEf/7j5AmJKS9QXgfr+PbsuXopig7LdI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=TiZkmvwe8V7Z02jiyiP6KDXZImnEjRU6RlgmLFElerxuTKKzowFtPjq7+0EdojUN2
	 j4DNah1pgjbVytIIOVtQV//RaomPVraUFG+iZ4Jqe+zhrEQx1Ch5ix+62JIV5TWYTd
	 abhAc7BS7+Mi2WJnju5LO9j8fcfNgdzl10sJjBVc=
Received: from epsnrtp04.localdomain (unknown [182.195.42.156]) by
	epcas2p3.samsung.com (KnoxPortal) with ESMTPS id
	20250915051107epcas2p3a1ed106ddcd5760e4396e66b59d975af~lXJ8JG-xt0284402844epcas2p3U;
	Mon, 15 Sep 2025 05:11:07 +0000 (GMT)
Received: from epcas2p2.samsung.com (unknown [182.195.36.99]) by
	epsnrtp04.localdomain (Postfix) with ESMTP id 4cQCmW0kVNz6B9mB; Mon, 15 Sep
	2025 05:11:07 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas2p3.samsung.com (KnoxPortal) with ESMTPA id
	20250915051106epcas2p37bc7519afa767689f6ea23b2dde9fb61~lXJ674Us-0246002460epcas2p3m;
	Mon, 15 Sep 2025 05:11:06 +0000 (GMT)
Received: from tayo (unknown [10.229.9.198]) by epsmtip1.samsung.com
	(KnoxPortal) with ESMTPA id
	20250915051106epsmtip11720c0cdef36e4498c987188846be9e2~lXJ63Fhuv0849808498epsmtip1A;
	Mon, 15 Sep 2025 05:11:06 +0000 (GMT)
From: "myunggeun.ji" <myunggeun.ji@samsung.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>, Joerg Roedel <joro@8bytes.org>,
	Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
	iommu@lists.linux.dev
Cc: Jongho Park <jongho0910.park@samsung.com>, kiisung lee
	<kiisung.lee@samsung.com>, "myunggeun.ji" <myunggeun.ji@samsung.com>
Subject: [PATCH 2/2] arm64: dts: exynosautov920: Add DT node for sysMMU
Date: Mon, 15 Sep 2025 14:13:20 +0900
Message-ID: <20250915051320.3378957-3-myunggeun.ji@samsung.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250915051320.3378957-1-myunggeun.ji@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250915051106epcas2p37bc7519afa767689f6ea23b2dde9fb61
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
cpgsPolicy: CPGSC10-234,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250915051106epcas2p37bc7519afa767689f6ea23b2dde9fb61
References: <20250915051320.3378957-1-myunggeun.ji@samsung.com>
	<CGME20250915051106epcas2p37bc7519afa767689f6ea23b2dde9fb61@epcas2p3.samsung.com>

System Memory Management Unit(SysMMU) for dpuf also called iommu.
This sysmmu is version 9.0.
DPUF has 3 dma blk, each channel is mapped to one iommu.

Signed-off-by: myunggeun.ji <myunggeun.ji@samsung.com>
---
 .../arm64/boot/dts/exynos/exynosautov920.dtsi | 21 +++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/exynosautov920.dtsi b/arch/arm64/boot/dts/exynos/exynosautov920.dtsi
index 0fdf2062930a..ec3dc77b46bf 100644
--- a/arch/arm64/boot/dts/exynos/exynosautov920.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynosautov920.dtsi
@@ -1494,6 +1494,27 @@ cmu_cpucl2: clock-controller@1ee00000 {
 				      "switch",
 				      "cluster";
 		};
+
+		sysmmu_dpuf0: sysmmu@18040000 {
+			compatible = "samsung,exynos-sysmmu";
+			reg = <0x18040000 0x10000>;
+			interrupts = <GIC_SPI 269 IRQ_TYPE_LEVEL_HIGH>;
+			#iommu-cells = <0>;
+		};
+
+		sysmmu_dpuf1: sysmmu@18440000 {
+			compatible = "samsung,exynos-sysmmu";
+			reg = <0x18440000 0x10000>;
+			interrupts = <GIC_SPI 332 IRQ_TYPE_LEVEL_HIGH>;
+			#iommu-cells = <0>;
+		};
+
+		sysmmu_dpuf2: sysmmu@18840000 {
+			compatible = "samsung,exynos-sysmmu";
+			reg = <0x18840000 0x10000>;
+			interrupts = <GIC_SPI 395 IRQ_TYPE_LEVEL_HIGH>;
+			#iommu-cells = <0>;
+		};
 	};
 
 	timer {
-- 
2.50.1

