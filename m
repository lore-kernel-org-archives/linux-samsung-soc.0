Received: from mailout1.samsung.com (mailout1.samsung.com [203.254.224.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EE2A27D77D
	for <linux-samsung-soc@vger.kernel.org>; Fri, 26 Sep 2025 07:40:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.24
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758872417; cv=none; b=l7dttoBIXUTNI3SF5M/3gVsLYZJkiBmz2nV41E+KD78/H1JtkZfTTOuOjNKHrDLP281X8X78BKW+tXziM42G/RO84jBo7LW3nEMkiclVjPCMk639h2/HQN6e/CpvF28xrKa0oRTbgLgjQSduhqGd1WwtYxgvnDyC2o8YCt76MaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758872417; c=relaxed/simple;
	bh=a1W6uBLXiqwbAFyl26ECJdV4ZF299y7Km7D7nhkQoxc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:MIME-Version:
	 Content-Type:References; b=bSsJjzDKDxR5BWh2oHVhkIOgbeH1VVArZXDSWf3JGUaOgYK2dfpxCQOEo4IuEboAnwd+nXLK6YgFm6zUQwBkT8nsqu03FdGEgAVBCB7RaSl+qhPyBCwnuDt2FfA2OIvRSkGNWG91kZym5yCjjSeJAg/t7ES4v+N3gm/BwUKiysA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=Y/KbEVBj; arc=none smtp.client-ip=203.254.224.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="Y/KbEVBj"
Received: from epcas2p4.samsung.com (unknown [182.195.41.56])
	by mailout1.samsung.com (KnoxPortal) with ESMTP id 20250926074013epoutp01cc0e8e87048a36875b8504ae569f970c~oxSQ4A7lW0961909619epoutp01D
	for <linux-samsung-soc@vger.kernel.org>; Fri, 26 Sep 2025 07:40:13 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20250926074013epoutp01cc0e8e87048a36875b8504ae569f970c~oxSQ4A7lW0961909619epoutp01D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1758872413;
	bh=4Po68KLFilpwQWxw9CyNZz80qkVt9zVydR1HkDC6YYQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Y/KbEVBjmokg4+rbkbl3LnNgD+ybwZi0ZJHpJWYRAn4PRB/rmdlxP9hji9hz0Z+tE
	 flK4XM4SjHwWetBjYBgRu649Vul9FOjF+y+6O8+mGpEcFHDy0DEjetNqZKWmFDfp7r
	 nPhS43qc8OwIkg8ZsSrXypEHjsIXE6FbTVtkvf5c=
Received: from epsnrtp04.localdomain (unknown [182.195.42.156]) by
	epcas2p3.samsung.com (KnoxPortal) with ESMTPS id
	20250926074013epcas2p329a4df283d64467842604511dd0aebfc~oxSQRMzSv1530715307epcas2p3K;
	Fri, 26 Sep 2025 07:40:13 +0000 (GMT)
Received: from epcas2p2.samsung.com (unknown [182.195.36.100]) by
	epsnrtp04.localdomain (Postfix) with ESMTP id 4cY2YS2nM0z6B9m5; Fri, 26 Sep
	2025 07:40:12 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas2p4.samsung.com (KnoxPortal) with ESMTPA id
	20250926074011epcas2p438f7edb31c720c0950e9df986983f5a5~oxSO-KU-m1317313173epcas2p4B;
	Fri, 26 Sep 2025 07:40:11 +0000 (GMT)
Received: from asswp146.dsn.sec.samsung.com (unknown [10.229.19.146]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20250926074011epsmtip2f18560c1e912ca2ce076f493e09534a4~oxSO31j4l1189111891epsmtip2G;
	Fri, 26 Sep 2025 07:40:11 +0000 (GMT)
From: Sanghoon Bae <sh86.bae@samsung.com>
To: robh@kernel.org, krzk@kernel.org, conor+dt@kernel.org, vkoul@kernel.org,
	alim.akhtar@samsung.com, kishon@kernel.org, m.szyprowski@samsung.com,
	jh80.chung@samsung.com, shradha.t@samsung.com
Cc: krzk+dt@kernel.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
	linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
	sh86.bae@samsung.com
Subject: [PATCH 1/4] dt-bindings: soc: samsung: exynos-sysreg: add hsi0 for
 ExynosAutov920
Date: Fri, 26 Sep 2025 16:39:16 +0900
Message-ID: <20250926073921.1000866-2-sh86.bae@samsung.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250926073921.1000866-1-sh86.bae@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250926074011epcas2p438f7edb31c720c0950e9df986983f5a5
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
cpgsPolicy: CPGSC10-234,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250926074011epcas2p438f7edb31c720c0950e9df986983f5a5
References: <20250926073921.1000866-1-sh86.bae@samsung.com>
	<CGME20250926074011epcas2p438f7edb31c720c0950e9df986983f5a5@epcas2p4.samsung.com>

Add hsi0 compatible for ExynosAutov920 PCIe settings for:
- PCIe PHY power control
- PLL settings for PCIe
- PCIe device direction (RC/EP)

Signed-off-by: Sanghoon Bae <sh86.bae@samsung.com>
---
 .../devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml   | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml b/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml
index d27ed6c9d61e..a44fd24ed0ea 100644
--- a/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml
+++ b/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml
@@ -30,6 +30,7 @@ properties:
               - samsung,exynos8895-fsys1-sysreg
               - samsung,exynos8895-peric0-sysreg
               - samsung,exynos8895-peric1-sysreg
+              - samsung,exynosautov920-hsi0-sysreg
               - samsung,exynosautov920-peric0-sysreg
               - samsung,exynosautov920-peric1-sysreg
               - tesla,fsd-cam-sysreg
-- 
2.45.2

