Received: from mailout3.samsung.com (mailout3.samsung.com [203.254.224.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DADE33A9CF
	for <linux-samsung-soc@vger.kernel.org>; Wed, 10 Jun 2026 05:03:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781067821; cv=none; b=DGrFrLfI7Eng8o00cJdtK//UDmy0d5t9g65/FHiJJc4x+0igOlnnrEf+DwPVr+CHzp+tYeG5rPkcf3rfXT6KY9OvuHHvHBEZk1GkQdFSwwNzr1AgAI9J0JwpwWpik3f9ts4LhDi/WZCXGpxGn8Nfb1MUVfHFJC1r/ORN06WqVqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781067821; c=relaxed/simple;
	bh=Pax4m6nK4pG6R31DiVcIF/qo3cpKDqLqclQ+WpfObnk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:MIME-Version:
	 Content-Type:References; b=X3CknpNNkBb6NGV1GamXBTaeRCe080cCIHdeDlDApxMzV2pWnYKkap0RuWcR+CTno5itCZwrJl6v+YUHYoG+b3bJN1jJJtTpAx5WlaTR/ratJ244y9AhtRecDkRRqLbBEBQpOJwIOvxioG/rZOTL9c7+xDFh0edV9y7LYUgHvWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=D4we42SI; arc=none smtp.client-ip=203.254.224.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="D4we42SI"
Received: from epcas2p3.samsung.com (unknown [182.195.41.55])
	by mailout3.samsung.com (KnoxPortal) with ESMTP id 20260610050337epoutp0303f37ec00b375381c17b4728928fcfd1~3n75OEepp0269602696epoutp03e
	for <linux-samsung-soc@vger.kernel.org>; Wed, 10 Jun 2026 05:03:37 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20260610050337epoutp0303f37ec00b375381c17b4728928fcfd1~3n75OEepp0269602696epoutp03e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1781067817;
	bh=H9ovJzCXhhhqKYuIwIuvGMuIArl2WOSc/Jo/J9JUc1A=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=D4we42SIfe9I3c7LF15XVc4N+Ok5wd1W56VAXG0FMsFcBgtkEBJJJfiz711uqfBrk
	 L5nbB9FtVEhCQzXt/q9yOPpdydtuGWZeD4IJxa3lmqkCWlmQzET9w+ylABd/LFXukY
	 wVfXLp4H7JWGdlGG7C7R3ol49iCWaASNqGDpFdqY=
Received: from epsnrtp01.localdomain (unknown [182.195.42.153]) by
	epcas2p3.samsung.com (KnoxPortal) with ESMTPS id
	20260610050336epcas2p3d4da2a15424dc7cdae9fdc92b8657b4e~3n74t8mKN0743907439epcas2p3-;
	Wed, 10 Jun 2026 05:03:36 +0000 (GMT)
Received: from epcas2p2.samsung.com (unknown [182.195.38.204]) by
	epsnrtp01.localdomain (Postfix) with ESMTP id 4gZtw829kgz6B9m6; Wed, 10 Jun
	2026 05:03:36 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas2p3.samsung.com (KnoxPortal) with ESMTPA id
	20260610050335epcas2p3ec1c019e86b75e9a4edd965a8b27ebd3~3n73kIW3d1025210252epcas2p3D;
	Wed, 10 Jun 2026 05:03:35 +0000 (GMT)
Received: from asswp146.dsn.sec.samsung.com (unknown [12.81.221.119]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20260610050335epsmtip27ce4fa849c2b99f059a31acdac8909c6~3n73c8N9t1155711557epsmtip2f;
	Wed, 10 Jun 2026 05:03:35 +0000 (GMT)
From: Sanghoon Bae <sh86.bae@samsung.com>
To: robh@kernel.org, krzk@kernel.org, conor+dt@kernel.org, vkoul@kernel.org,
	alim.akhtar@samsung.com, kishon@kernel.org
Cc: krzk+dt@kernel.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
	sowon.na@samsung.com, Sanghoon Bae <sh86.bae@samsung.com>
Subject: [PATCH v3 1/2] dt-bindings: soc: samsung: exynos-sysreg: Add hsi0
 for ExynosAutov920
Date: Wed, 10 Jun 2026 14:03:25 +0900
Message-ID: <20260610050326.2903402-2-sh86.bae@samsung.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260610050326.2903402-1-sh86.bae@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20260610050335epcas2p3ec1c019e86b75e9a4edd965a8b27ebd3
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
cpgsPolicy: CPGSC10-234,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20260610050335epcas2p3ec1c019e86b75e9a4edd965a8b27ebd3
References: <20260610050326.2903402-1-sh86.bae@samsung.com>
	<CGME20260610050335epcas2p3ec1c019e86b75e9a4edd965a8b27ebd3@epcas2p3.samsung.com>

Add hsi0 compatible on samsung,exynos-sysreg
To support ExynosAutov920 PCIe settings:
- PCIe PHY power control
- PLL settings for PCIe
- PCIe device direction (RC/EP)

Signed-off-by: Sanghoon Bae <sh86.bae@samsung.com>
---
 .../devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml   | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml b/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml
index 9c63dbcd4d77..fcdb9ffd2644 100644
--- a/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml
+++ b/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml
@@ -37,6 +37,7 @@ properties:
               - samsung,exynos8895-peric1-sysreg
               - samsung,exynos990-peric0-sysreg
               - samsung,exynos990-peric1-sysreg
+              - samsung,exynosautov920-hsi0-sysreg
               - samsung,exynosautov920-hsi2-sysreg
               - samsung,exynosautov920-peric0-sysreg
               - samsung,exynosautov920-peric1-sysreg
-- 
2.45.2

