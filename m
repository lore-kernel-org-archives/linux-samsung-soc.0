Received: from mailout3.samsung.com (mailout3.samsung.com [203.254.224.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6DBF3CEB9C
	for <linux-samsung-soc@vger.kernel.org>; Mon, 15 Jun 2026 08:34:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781512469; cv=none; b=bgyYHbUTLjdlYfJmIkyytpM6fyhHqgdhe+4yu3ecQpNczF8/QjwDV1uYtpE7nlRklbyn/PuSDWvk0/3dm26N5MbEuthX3TPLx5j5oqgZhQCoMETwg2uCnqor7hS5WszEadC+jv1fdRvdBo3g0V7njWUQlAmUHRmSDeXSlz18f2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781512469; c=relaxed/simple;
	bh=Coc6+axgNyuKZ/w9tZNcDBOAp4QRsPLZuDPcvvKDRkU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:MIME-Version:
	 Content-Type:References; b=cHaz3uivghrgEUj17zvaQwylofjti1We5za6DAp26O8v9kGi+jgnBfv2lLLjiY6XwUx8AwpZk0afgmw3igtUBB/otAjJCmutXZK4xy8CFmqU9c5lH2uS0lhPU7oBvpbDW6xCMLx1vaAuQGgOogkov4N0uALO9tzUnn2jSdwbJoE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=lyY7TH7A; arc=none smtp.client-ip=203.254.224.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="lyY7TH7A"
Received: from epcas5p2.samsung.com (unknown [182.195.41.40])
	by mailout3.samsung.com (KnoxPortal) with ESMTP id 20260615083420epoutp03e15896797a20f1b52494382c7a01fa34~5NCTzBUsh1018310183epoutp03p
	for <linux-samsung-soc@vger.kernel.org>; Mon, 15 Jun 2026 08:34:20 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20260615083420epoutp03e15896797a20f1b52494382c7a01fa34~5NCTzBUsh1018310183epoutp03p
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1781512460;
	bh=Cz8/kWNTiABNBQS/iHlFdfUP/vEMQXqsBrLkZrtPWyo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=lyY7TH7Ar87nItfdex/Hke4TwXQfqv26BAeQG4/CmYg9EBJirtx3Hh4D//O9fUFc7
	 HrI/khjJ4TyGcf1fIaIhQhlBB2/rLm0TFpPHuePA9B+9p8iMeQV7QTaVWG94HUDIv3
	 n+nB7pHE00URYRnyCWPpyXmnnnCM38TYIjrgVBeI=
Received: from epsnrtp04.localdomain (unknown [182.195.42.156]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPS id
	20260615083420epcas5p3c6d8f488fffa7add3b943b7e82f2cce9~5NCTiTU1o2361823618epcas5p3o;
	Mon, 15 Jun 2026 08:34:20 +0000 (GMT)
Received: from epcas5p4.samsung.com (unknown [182.195.38.92]) by
	epsnrtp04.localdomain (Postfix) with ESMTP id 4gf3Lz4v8Xz6B9m5; Mon, 15 Jun
	2026 08:34:19 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPA id
	20260615083419epcas5p48c6b192d1abcbd5411f0958aa9b83237~5NCSTNBha0786007860epcas5p4Y;
	Mon, 15 Jun 2026 08:34:19 +0000 (GMT)
Received: from bose.samsungds.net (unknown [107.108.83.9]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20260615083417epsmtip10db0ab1e9dba5e80ec21a960585f06f4~5NCQVQDJS0113401134epsmtip1o;
	Mon, 15 Jun 2026 08:34:17 +0000 (GMT)
From: Alim Akhtar <alim.akhtar@samsung.com>
To: krzk@kernel.org, peter.griffin@linaro.org, robh@kernel.org,
	conor+dt@kernel.org, linusw@kernel.org
Cc: linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
	hajun.sung@samsung.com, Alim Akhtar <alim.akhtar@samsung.com>
Subject: [PATCH v2 2/5] dt-binding: pinctrl: samsung: Add exynos8855-pinctrl
 compatible
Date: Mon, 15 Jun 2026 14:22:49 +0530
Message-Id: <20260615085252.1964423-3-alim.akhtar@samsung.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260615085252.1964423-1-alim.akhtar@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20260615083419epcas5p48c6b192d1abcbd5411f0958aa9b83237
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-543,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20260615083419epcas5p48c6b192d1abcbd5411f0958aa9b83237
References: <20260615085252.1964423-1-alim.akhtar@samsung.com>
	<CGME20260615083419epcas5p48c6b192d1abcbd5411f0958aa9b83237@epcas5p4.samsung.com>

Document pin controller support on Exynos8855 SoC.

Signed-off-by: Alim Akhtar <alim.akhtar@samsung.com>
---
 Documentation/devicetree/bindings/pinctrl/samsung,pinctrl.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl.yaml
index 7b006009ca0e..c4773701c92e 100644
--- a/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl.yaml
@@ -53,6 +53,7 @@ properties:
       - samsung,exynos7870-pinctrl
       - samsung,exynos7885-pinctrl
       - samsung,exynos850-pinctrl
+      - samsung,exynos8855-pinctrl
       - samsung,exynos8890-pinctrl
       - samsung,exynos8895-pinctrl
       - samsung,exynos9610-pinctrl
-- 
2.34.1

