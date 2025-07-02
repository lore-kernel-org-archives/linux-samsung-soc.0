Received: from mailout1.samsung.com (mailout1.samsung.com [203.254.224.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0219E15747D
	for <linux-samsung-soc@vger.kernel.org>; Wed,  2 Jul 2025 01:33:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.24
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751420018; cv=none; b=i0JzIGvsMEMdIDGLBcJVJR4Cr7tthUC/uR4FU175UoTPax5M7J8h5EePkyjQFoiGT9Ang+Yn0EzQ+p/+S2y0ZfsVUiE1KGosnjM29GFeHk4wfrElWX5ODn+FtX2DxSfYJXCAdF2NF8bPHJv7xWJHUj8IiqMdoUBGTglnjX6JxII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751420018; c=relaxed/simple;
	bh=2y+yGdD48EhavOqxZUuoS8Dz/6UQC0JWe7RP1kQJVyY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:MIME-Version:
	 Content-Type:References; b=j/OwQ3Yedq42x6Tl8w4Kh7s3PNNUZuqk9IKblx98IFyrguU/G3VdtgJQpGW3s7LROUnj4etT3Y5WP0hrZLVFnZh0xg8Fbq1Q8ug/prUH2fL29VZ6u4P/SGdTcFWz5xQrclqStUGei0DM6p/fg1dlc3yJrvu5cCdUbuk0410tCMg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=qkGbg0BK; arc=none smtp.client-ip=203.254.224.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="qkGbg0BK"
Received: from epcas2p1.samsung.com (unknown [182.195.41.53])
	by mailout1.samsung.com (KnoxPortal) with ESMTP id 20250702013334epoutp01291c231e02f7794319b5ab6c0d26e264~OSzk_8Gpu1789717897epoutp010
	for <linux-samsung-soc@vger.kernel.org>; Wed,  2 Jul 2025 01:33:34 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20250702013334epoutp01291c231e02f7794319b5ab6c0d26e264~OSzk_8Gpu1789717897epoutp010
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1751420014;
	bh=0Yw4e+2lF0MJw5eWrPAQAa8L4Y/dn2ic1hwkFD9r1x4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=qkGbg0BKJgYTVwccUU38MtDZgDXXBTmCbq9tGxxrD2lzb7dfgvh0yIgi1+hAcqDkN
	 oOHtVg77z6O0uloBvQ3FKHFZFybDNvNxNm55lGNy/WWi3zjprT5tV3COIw53H2dCR0
	 B9/UX3EGEopBLylIogw+leDOLG4rG2UWkaucLEIg=
Received: from epsnrtp04.localdomain (unknown [182.195.42.156]) by
	epcas2p2.samsung.com (KnoxPortal) with ESMTPS id
	20250702013333epcas2p2bca65836b031b0e8c13c9998ba9940c4~OSzkiA6wD0894408944epcas2p2S;
	Wed,  2 Jul 2025 01:33:33 +0000 (GMT)
Received: from epcas2p1.samsung.com (unknown [182.195.36.100]) by
	epsnrtp04.localdomain (Postfix) with ESMTP id 4bX2V50CsCz6B9m5; Wed,  2 Jul
	2025 01:33:33 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas2p4.samsung.com (KnoxPortal) with ESMTPA id
	20250702013332epcas2p4ea41cc442d42fd7b2c742e1d08b26182~OSzjMSHH_0722207222epcas2p4M;
	Wed,  2 Jul 2025 01:33:32 +0000 (GMT)
Received: from asswp146.dsn.sec.samsung.com (unknown [10.229.19.146]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20250702013332epsmtip2e2924c285199fe210543680e16fc2ff1~OSzjGiRVl2451124511epsmtip2i;
	Wed,  2 Jul 2025 01:33:32 +0000 (GMT)
From: Sowon Na <sowon.na@samsung.com>
To: robh@kernel.org, krzk@kernel.org, conor+dt@kernel.org, vkoul@kernel.org,
	alim.akhtar@samsung.com, kishon@kernel.org
Cc: krzk+dt@kernel.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
	sowon.na@samsung.com
Subject: [PATCH 3/5] dt-bindings: soc: samsung: exynos-sysreg: add hsi2 for
 ExynosAutov920
Date: Wed,  2 Jul 2025 10:33:09 +0900
Message-ID: <20250702013316.2837427-4-sowon.na@samsung.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250702013316.2837427-1-sowon.na@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250702013332epcas2p4ea41cc442d42fd7b2c742e1d08b26182
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
cpgsPolicy: CPGSC10-234,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250702013332epcas2p4ea41cc442d42fd7b2c742e1d08b26182
References: <20250702013316.2837427-1-sowon.na@samsung.com>
	<CGME20250702013332epcas2p4ea41cc442d42fd7b2c742e1d08b26182@epcas2p4.samsung.com>

Add hsi2 compatible for ExynosAutov920 ufs shareability register to
set io coherency of the ExynosAutov920 ufs.

Signed-off-by: Sowon Na <sowon.na@samsung.com>
---
 .../devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml   | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml b/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml
index d27ed6c9d61e..d8b302f97547 100644
--- a/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml
+++ b/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml
@@ -30,6 +30,7 @@ properties:
               - samsung,exynos8895-fsys1-sysreg
               - samsung,exynos8895-peric0-sysreg
               - samsung,exynos8895-peric1-sysreg
+              - samsung,exynosautov920-hsi2-sysreg
               - samsung,exynosautov920-peric0-sysreg
               - samsung,exynosautov920-peric1-sysreg
               - tesla,fsd-cam-sysreg
-- 
2.45.2

