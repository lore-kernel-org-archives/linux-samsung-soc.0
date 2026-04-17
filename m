Received: from mailout1.samsung.com (mailout1.samsung.com [203.254.224.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF6AF3921CA
	for <linux-samsung-soc@vger.kernel.org>; Fri, 17 Apr 2026 11:58:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.24
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776427128; cv=none; b=heMkuWZglxiF/3WOAzvYHBS710zOOGskSoB3+LPn/3BAU+PIbcuFvZhAotFZ4clJv6yzjlDKlFymI0CzNjc46xF4EJBMKd3Lt6DGfJKvZUGEGmR51fg7FBRexQCqr2BOOT1M+fB+rCBRZvHghYzpDcotDkwrK0senZTmZU27bvU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776427128; c=relaxed/simple;
	bh=jVP74l+d42j9pCUDaqYNMTl1xTEGiV9aQbUauEXrTAw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:MIME-Version:
	 Content-Type:References; b=HFgykEPo5Y2ikGFRD6YuEEjCNTbnORemelXz9PznAbeh9idAbZYV/kQ6+kGNaibMJO/HSjzsAWPH6KZ7pRDcL80Rw3l+G5+6cnMtw8rkcQBSgKWTQc7GkJDebTYQrBeNQjLBzgfAlKGOYRnh+44hnMClGr8VJlK8fOIEQJDFjRQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=h61PXVi8; arc=none smtp.client-ip=203.254.224.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="h61PXVi8"
Received: from epcas5p1.samsung.com (unknown [182.195.41.39])
	by mailout1.samsung.com (KnoxPortal) with ESMTP id 20260417115844epoutp017e5a9f2fc99ef120f06cab22fdf0dbaf~nIw7f5uWl2937029370epoutp01k
	for <linux-samsung-soc@vger.kernel.org>; Fri, 17 Apr 2026 11:58:44 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20260417115844epoutp017e5a9f2fc99ef120f06cab22fdf0dbaf~nIw7f5uWl2937029370epoutp01k
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1776427124;
	bh=WkxI4lMMv9ujNsKgYtnd5P0MBRZIO8gABKqtfUpxztA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=h61PXVi8G0+H2750ZHfGfrG2zYaKLBad6btBGrfYgqG5Ab6suGhWy0W9mBH1zUQmd
	 PbIuK12V6deFuON+zh95+mW2ED+mNPv7GSJ+r9yX/ki9Z5FdSUR8WCeZIKfeS9aGhK
	 n3C5+12A35e5Oyutfbh9JH2AqkTXwKm62Pb4xtgc=
Received: from epsnrtp03.localdomain (unknown [182.195.42.155]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPS id
	20260417115844epcas5p29a61996d89574b77c465771620720399~nIw6y05mB1627016270epcas5p2O;
	Fri, 17 Apr 2026 11:58:44 +0000 (GMT)
Received: from epcas5p4.samsung.com (unknown [182.195.38.93]) by
	epsnrtp03.localdomain (Postfix) with ESMTP id 4fxth30btmz3hhT9; Fri, 17 Apr
	2026 11:58:43 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPA id
	20260417115842epcas5p1fb06d6f1663b97b1eae3aafaa6a3de0b~nIw5XBmH10152301523epcas5p1L;
	Fri, 17 Apr 2026 11:58:42 +0000 (GMT)
Received: from bose.samsungds.net (unknown [107.108.83.9]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20260417115836epsmtip25d8f2f024f7e0c2a04f1f016c96fbc41~nIw0LImmL1009810098epsmtip2D;
	Fri, 17 Apr 2026 11:58:36 +0000 (GMT)
From: Alim Akhtar <alim.akhtar@samsung.com>
To: avri.altman@wdc.com, bvanassche@acm.org, robh@kernel.org,
	martin.petersen@oracle.com, krzk+dt@kernel.org
Cc: sowon.na@samsung.com, peter.griffin@linaro.org,
	linux-scsi@vger.kernel.org, devicetree@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, Krzysztof
	Kozlowski <krzysztof.kozlowski@linaro.org>, Alim Akhtar
	<alim.akhtar@samsung.com>
Subject: [PATCH v2 2/4] dt-bindings: ufs: exynos: add ExynosAutov920
 compatible string
Date: Fri, 17 Apr 2026 17:44:50 +0530
Message-Id: <20260417121452.827054-3-alim.akhtar@samsung.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260417121452.827054-1-alim.akhtar@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20260417115842epcas5p1fb06d6f1663b97b1eae3aafaa6a3de0b
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-543,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20260417115842epcas5p1fb06d6f1663b97b1eae3aafaa6a3de0b
References: <20260417121452.827054-1-alim.akhtar@samsung.com>
	<CGME20260417115842epcas5p1fb06d6f1663b97b1eae3aafaa6a3de0b@epcas5p1.samsung.com>

From: Sowon Na <sowon.na@samsung.com>

Add samsung,exynosautov920-ufs compatible for ExynosAutov920 SoC.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Sowon Na <sowon.na@samsung.com>
Signed-off-by: Alim Akhtar <alim.akhtar@samsung.com>
---
 Documentation/devicetree/bindings/ufs/samsung,exynos-ufs.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/ufs/samsung,exynos-ufs.yaml b/Documentation/devicetree/bindings/ufs/samsung,exynos-ufs.yaml
index a7eb7ad85a94..710ce493f3b6 100644
--- a/Documentation/devicetree/bindings/ufs/samsung,exynos-ufs.yaml
+++ b/Documentation/devicetree/bindings/ufs/samsung,exynos-ufs.yaml
@@ -19,6 +19,7 @@ properties:
       - samsung,exynos7-ufs
       - samsung,exynosautov9-ufs
       - samsung,exynosautov9-ufs-vh
+      - samsung,exynosautov920-ufs
       - tesla,fsd-ufs
 
   reg:
-- 
2.34.1

