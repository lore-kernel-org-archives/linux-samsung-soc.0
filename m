Received: from mailout3.samsung.com (mailout3.samsung.com [203.254.224.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54FE329408
	for <linux-samsung-soc@vger.kernel.org>; Mon, 18 Nov 2024 02:10:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731895823; cv=none; b=CmQ0caQnd+9SyKVmO3B1+L58HpcIiH7Xbcl0xfNCn2YiTXi0tAf6xXnx64W7m/VRdNUfAWLdD7FLtNLZsPagZJ2VAfiCAAKJUaO7Hv3yS2J4c/BTGwG46/eo0corXpvy8LDrINYE/cxmuWOSFwic3y//39q3xW/lfuwzlp2jyfs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731895823; c=relaxed/simple;
	bh=Soy9GQSjn+diVr2BwnIv7kgZ7dWzZHHBlJn3YM6GPns=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:MIME-Version:
	 Content-Type:References; b=RUbSydlBVMmSPDn3hV8eaWueQtttF6ORET+G/9oSp/UV6ybfyZe/+9NuE9y8enzlBx/2zI5eBYsXSsN1BkMtIhUqvTJnsrkex644FYvRRwqKr1ZTWe2nNta6I/1ahht1T8CawS5mw8YxNte1cznChlBTsQnM8cjafP2dax0blAg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=EnlW7b6b; arc=none smtp.client-ip=203.254.224.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="EnlW7b6b"
Received: from epcas2p3.samsung.com (unknown [182.195.41.55])
	by mailout3.samsung.com (KnoxPortal) with ESMTP id 20241118021013epoutp032e2bdb6c2b33c541fcddcde1189b66ca~I7hD9ob9e3186031860epoutp03k
	for <linux-samsung-soc@vger.kernel.org>; Mon, 18 Nov 2024 02:10:13 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20241118021013epoutp032e2bdb6c2b33c541fcddcde1189b66ca~I7hD9ob9e3186031860epoutp03k
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1731895813;
	bh=+dH4mUPoSDyTToO9Vmu3/BKtko4cNDIL3tKP79wep84=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=EnlW7b6bXkRdK0Hlzs+EXtnllyOW6hNjmkMP1V8L0KFP7UNjnOCFvsUa3K/x/HfD5
	 tjCCiirDXtTSw4RHyaCyoSfziqGm53eTszVjd0/gT/iIz8ynj6fPDM4JDTBAau3bOM
	 STN//CEc1NuKpgJ7d+qO/Xx8jLmHfB+UxdCT3eoU=
Received: from epsnrtp2.localdomain (unknown [182.195.42.163]) by
	epcas2p3.samsung.com (KnoxPortal) with ESMTP id
	20241118021012epcas2p3d5db923dbd4a1d4d8b27684f7d4451b8~I7hDOpWnD0163701637epcas2p38;
	Mon, 18 Nov 2024 02:10:12 +0000 (GMT)
Received: from epsmges2p2.samsung.com (unknown [182.195.36.88]) by
	epsnrtp2.localdomain (Postfix) with ESMTP id 4XsB0g5Qqqz4x9QM; Mon, 18 Nov
	2024 02:10:11 +0000 (GMT)
Received: from epcas2p4.samsung.com ( [182.195.41.56]) by
	epsmges2p2.samsung.com (Symantec Messaging Gateway) with SMTP id
	2E.58.59410.302AA376; Mon, 18 Nov 2024 11:10:11 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
	epcas2p2.samsung.com (KnoxPortal) with ESMTPA id
	20241118021011epcas2p21593217ccf58afddad5ce36f510e7cb6~I7hB9D7AP0257102571epcas2p2R;
	Mon, 18 Nov 2024 02:10:11 +0000 (GMT)
Received: from epsmgms1p2new.samsung.com (unknown [182.195.42.42]) by
	epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
	20241118021011epsmtrp2d4021d77ccea7c03c426517c9b7e6f9f~I7hB7u13E2522625226epsmtrp2T;
	Mon, 18 Nov 2024 02:10:11 +0000 (GMT)
X-AuditID: b6c32a46-a3785a800001e812-52-673aa203c27c
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
	epsmgms1p2new.samsung.com (Symantec Messaging Gateway) with SMTP id
	72.E5.19220.302AA376; Mon, 18 Nov 2024 11:10:11 +0900 (KST)
Received: from asswp146.dsn.sec.samsung.com (unknown [10.229.19.146]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20241118021011epsmtip1bc2dfd66fdb547e834f624596022cb99~I7hBtjur33059530595epsmtip1R;
	Mon, 18 Nov 2024 02:10:11 +0000 (GMT)
From: Sowon Na <sowon.na@samsung.com>
To: robh@kernel.org, krzk@kernel.org, conor+dt@kernel.org, vkoul@kernel.org,
	alim.akhtar@samsung.com, kishon@kernel.org
Cc: krzk+dt@kernel.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
	sowon.na@samsung.com, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v3 1/3] dt-bindings: phy: Add ExynosAutov920 UFS PHY
 bindings
Date: Mon, 18 Nov 2024 11:10:04 +0900
Message-ID: <20241118021009.2858849-2-sowon.na@samsung.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241118021009.2858849-1-sowon.na@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprPJsWRmVeSWpSXmKPExsWy7bCmhS7zIqt0g9YLWhYP5m1js1iz9xyT
	xfwj51gtjrb+Z7Z4Oesem8X58xvYLfa+3spucXnXHDaLGef3MVn837OD3eL3z0NMFjvvnGB2
	4PHYtKqTzePOtT1sHn1bVjF6fN4kF8ASlW2TkZqYklqkkJqXnJ+SmZduq+QdHO8cb2pmYKhr
	aGlhrqSQl5ibaqvk4hOg65aZA3SakkJZYk4pUCggsbhYSd/Opii/tCRVISO/uMRWKbUgJafA
	vECvODG3uDQvXS8vtcTK0MDAyBSoMCE7Y/LTDsaC/WwVs77dZmxgPMraxcjJISFgInF+3w+m
	LkYuDiGBHYwSF07OYodwPjFK7F+xnRHC+cYo8fDYWxaYlu0ndjNDJPYySjR3HmOFcH4xSlzu
	ugLUz8HBJqAqca2hCsQUEaiUmLvMGaSEWeAwo8TjD91sIIOEBfwlVu29zwxiswCVv/iyAMzm
	FbCWWPuhBeo+eYmLa56D1XMK2EjM3ryKHaJGUOLkzCdgBzED1TRvnQ12kIRAJ4fEnUvroJpd
	JBb9OsgGYQtLvDq+hR3ClpL4/G4vVDxfYv3Du1B2hcTdQ/+hvrSXWHTmJ9gvzAKaEut36YOY
	EgLKEkduQa3lk+g4/JcdIswr0dEmBNGoJNFxfg4ThC0hserFZKjhHhJHb6xjg4RUP6PE6uWL
	mCcwKsxC8s0sJN/MQli8gJF5FaNYakFxbnpqsVGBETyCk/NzNzGCU6qW2w7GKW8/6B1iZOJg
	PMQowcGsJMJ7ydU8XYg3JbGyKrUoP76oNCe1+BCjKTCsJzJLiSbnA5N6Xkm8oYmlgYmZmaG5
	kamBuZI4773WuSlCAumJJanZqakFqUUwfUwcnFINTHx7llvtvKDvKLH3dKnc0ri/5WuOpT8q
	rtLVcvusLRh6XeXcxW8TfU+W9x1inqQqZFRcGLWi9VixiTvjh3NT3j/drVKy58+xnUu9tbl0
	k15d74hJOCv95HLn3D+PMg4qbJ7+ffWSxWH8C0snZK1Pa59XsfPOgTkTj+X+tlzcNP3ogoMM
	8TUCe9Zs2OGY56t7fLNuVIzZzcOq63Svs7S01f3hOMW6Of3cxtmvswWVdU1OPWZctv/kmW+W
	qs82ZS3dZPjmygVGrXs1re9mfzR8sXiKjGJ9x/eu6ybqjt/8TkjUi7F1TM0pZRGO2JHXv+Sp
	wU3bxvuZkZUVdqtUjafxvvvtdMp+SsCFTxcLDwiVKdgqsRRnJBpqMRcVJwIAi/FsnDIEAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrNLMWRmVeSWpSXmKPExsWy7bCSnC7zIqt0g0NPeS0ezNvGZrFm7zkm
	i/lHzrFaHG39z2zxctY9Novz5zewW+x9vZXd4vKuOWwWM87vY7L4v2cHu8Xvn4eYLHbeOcHs
	wOOxaVUnm8eda3vYPPq2rGL0+LxJLoAlissmJTUnsyy1SN8ugStj8tMOxoL9bBWzvt1mbGA8
	ytrFyMkhIWAisf3EbuYuRi4OIYHdjBKnm/9AJSQkvr3ZwwRhC0vcbznCClH0g1Hi4JYlLF2M
	HBxsAqoS1xqqQOIiAo2MEs8/TAabxCxwklFi+p0/jCDdwgK+Epfa2tlAbBaghhdfFjCD2LwC
	1hJrP7RAbZOXuLjmOVgNp4CNxOzNq9hBFggB1XQeCIcoF5Q4OfMJC4jNDFTevHU28wRGgVlI
	UrOQpBYwMq1ilEwtKM5Nzy02LDDKSy3XK07MLS7NS9dLzs/dxAgOfy2tHYx7Vn3QO8TIxMF4
	iFGCg1lJhPeSq3m6EG9KYmVValF+fFFpTmrxIUZpDhYlcd5vr3tThATSE0tSs1NTC1KLYLJM
	HJxSDUzFTY5bM6e+eVa5/ZfDhm+vLmyJe5iUYX4gfbfmwwClY3OZUtL56zxY1Z8szY4qjF16
	y2Lf4XcTJy/gtfBNbvJlSryRcdsjcjP/Nd6XXqEOSn8rVvN83ete2Zvl0+gnP8PbOmOhk7Fm
	kyh3ee/Txavj7346GfPh27LCb/vZCisPCtlP2fVvi1GXz6Y/Yb+PZDo0JHgWvpSPPclzbGLf
	JCPHp0lfL7TOXLgj4UH72Y4858ITR180TODINPhQ6q5wcOqDD0tXv9H5sbh9cvxso8mX+rxO
	HL4yJ2KpxTe7pVLOx5P619XErpR0D+2V6FZdmXPu/ZKuCD2JjTouwTuEM1cEp8QFroqYYDL5
	60bX00lKLMUZiYZazEXFiQAHIz5j7gIAAA==
X-CMS-MailID: 20241118021011epcas2p21593217ccf58afddad5ce36f510e7cb6
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20241118021011epcas2p21593217ccf58afddad5ce36f510e7cb6
References: <20241118021009.2858849-1-sowon.na@samsung.com>
	<CGME20241118021011epcas2p21593217ccf58afddad5ce36f510e7cb6@epcas2p2.samsung.com>

Add samsung,exynosautov920-ufs-phy compatible for ExynosAuto v920 SoC.

Signed-off-by: Sowon Na <sowon.na@samsung.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/phy/samsung,ufs-phy.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/phy/samsung,ufs-phy.yaml b/Documentation/devicetree/bindings/phy/samsung,ufs-phy.yaml
index f402e31bf58d..d70ffeb6e824 100644
--- a/Documentation/devicetree/bindings/phy/samsung,ufs-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/samsung,ufs-phy.yaml
@@ -18,6 +18,7 @@ properties:
       - google,gs101-ufs-phy
       - samsung,exynos7-ufs-phy
       - samsung,exynosautov9-ufs-phy
+      - samsung,exynosautov920-ufs-phy
       - tesla,fsd-ufs-phy
 
   reg:
-- 
2.45.2

