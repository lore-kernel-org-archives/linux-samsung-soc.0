Received: from mailout1.samsung.com (mailout1.samsung.com [203.254.224.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 636131C2452
	for <linux-samsung-soc@vger.kernel.org>; Thu, 10 Oct 2024 11:18:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.24
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728559124; cv=none; b=B+fQXPH8ymvewqgpZvx7tyU/aklPzB/Tz58LNF+vp39ZGcDT+YPOok+HsyzFytmNC0mmO7ShBxFUpvVrkd9Xcox29oBEH9U1HfVjvUraYfCpW2JjH9e01OUJB8g9wDsvm9SjFla69uMvSy2+dLjwX2yCzGPGqeUYoFDPmKZTFq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728559124; c=relaxed/simple;
	bh=Vc6s6+COXzy9c+XnCeM/NP2FHQTRAQyn6+gq+l+mYD0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:MIME-Version:
	 Content-Type:References; b=Lmef2qjxaxdstVsbKonlk81RwMYch/EDe1aOl8zhckHY7kpp5WkQT0bOBFddv5kPnuwepa+p3nOOaUu5n5QV6+vjHVWXsy65NjFRbb/XSSQXr7xQYJubyQInlzEKa0SFoFuYh7asIm1kYx9d0KmGeDoWbnUc4JEREuKpyW2nVpM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=Q+8TOJ49; arc=none smtp.client-ip=203.254.224.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="Q+8TOJ49"
Received: from epcas2p1.samsung.com (unknown [182.195.41.53])
	by mailout1.samsung.com (KnoxPortal) with ESMTP id 20241010111840epoutp01a28d4129075db84a4d2550a452ea00e6~9E1yVoHga1429614296epoutp01i
	for <linux-samsung-soc@vger.kernel.org>; Thu, 10 Oct 2024 11:18:40 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20241010111840epoutp01a28d4129075db84a4d2550a452ea00e6~9E1yVoHga1429614296epoutp01i
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1728559120;
	bh=JSOERbu7StGHVylZzo/2W5mtPqm88Oi/lnglXITEDJg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Q+8TOJ490khWwqBg/g8tsHUGvGHvDNWM4fHMl1ZS5Gl+s/3Tu9TwCXRDiCZdO88s3
	 5SNHy3tNGDB+qzA1IhY68bEg9Gd0hLXQf6MKhjfw/DrlAhlFfxCMlzg7DokwCDtDF7
	 smH8P5c3IWl/DDFFbxY8EwT8Xt8JkAEbJ0dASOcY=
Received: from epsnrtp1.localdomain (unknown [182.195.42.162]) by
	epcas2p3.samsung.com (KnoxPortal) with ESMTP id
	20241010111839epcas2p3f8fcd5f5b5c96e2610f583155cd19fa6~9E1x2udUs2049220492epcas2p3y;
	Thu, 10 Oct 2024 11:18:39 +0000 (GMT)
Received: from epsmgec2p1-new.samsung.com (unknown [182.195.36.100]) by
	epsnrtp1.localdomain (Postfix) with ESMTP id 4XPS1W222Lz4x9Pp; Thu, 10 Oct
	2024 11:18:39 +0000 (GMT)
Received: from epcas2p1.samsung.com ( [182.195.41.53]) by
	epsmgec2p1-new.samsung.com (Symantec Messaging Gateway) with SMTP id
	A1.29.18950.F08B7076; Thu, 10 Oct 2024 20:18:39 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
	epcas2p1.samsung.com (KnoxPortal) with ESMTPA id
	20241010111837epcas2p11dddc10945ca0648997dccaaf4854d93~9E1wGm5eG2327023270epcas2p1C;
	Thu, 10 Oct 2024 11:18:37 +0000 (GMT)
Received: from epsmgms1p2new.samsung.com (unknown [182.195.42.42]) by
	epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
	20241010111837epsmtrp2ec3e44ec505d0ee029e948ca2ac59eca~9E1wF0zaU1345313453epsmtrp2_;
	Thu, 10 Oct 2024 11:18:37 +0000 (GMT)
X-AuditID: b6c32a4d-1f1c070000004a06-6d-6707b80f2f81
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
	epsmgms1p2new.samsung.com (Symantec Messaging Gateway) with SMTP id
	D5.9C.08227.D08B7076; Thu, 10 Oct 2024 20:18:37 +0900 (KST)
Received: from localhost.localdomain (unknown [10.229.9.55]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20241010111837epsmtip165611444b83078fa5be359fb6f6e26a0~9E1v6JLgF1418914189epsmtip14;
	Thu, 10 Oct 2024 11:18:37 +0000 (GMT)
From: Taewan Kim <trunixs.kim@samsung.com>
To: Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck
	<linux@roeck-us.net>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Alim Akhtar
	<alim.akhtar@samsung.com>
Cc: linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, Byoungtae Cho <bt.cho@samsung.com>,
	Taewan Kim <trunixs.kim@samsung.com>
Subject: [PATCH v2 1/3] dt-bindings: watchdog: Document ExynosAutoV920
 watchdog bindings
Date: Thu, 10 Oct 2024 20:18:05 +0900
Message-ID: <20241010111807.3635504-2-trunixs.kim@samsung.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20241010111807.3635504-1-trunixs.kim@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrMJsWRmVeSWpSXmKPExsWy7bCmqS7/DvZ0g2N7OC0ezNvGZnH/Ux+T
	xZq955gs5h85x2rxctY9NotNj6+xWlzeNYfNYsb5fUwWN9btY7d4svAMk8X/PTvYLSYtPs9k
	8fjlP2YHXo9NqzrZPFauWcPqsXlJvcfO7w3sHn1bVjF6fN4kF8AWlW2TkZqYklqkkJqXnJ+S
	mZduq+QdHO8cb2pmYKhraGlhrqSQl5ibaqvk4hOg65aZA3SokkJZYk4pUCggsbhYSd/Opii/
	tCRVISO/uMRWKbUgJafAvECvODG3uDQvXS8vtcTK0MDAyBSoMCE74+fri8wFn3gqWlaeYm9g
	XMDZxcjJISFgItGzazl7FyMXh5DAHkaJza3noZxPjBLrOo+zQDjfGCU2/DrPCNOyfPlnqMRe
	RokDn+8xQjgfGSU6Dv8Dq2IT0JLYdvgVE0hCROA1o0RT7ztmEIdZ4CujxPbWVlaQKmGBKImj
	16eCdbAIqEpM/7WaHcTmFbCTuHpoFzPEPnmJ64+PMoHYnAL2ErO+LWGBqBGUODnzCZjNDFTT
	vHU22AIJgZkcEufOf2GHaHaRmLWkjw3CFpZ4dXwLVFxK4vO7vVDxfImVK08wQdg1EvfadrFA
	2PYSi878BKrnAFqgKbF+lz6IKSGgLHHkFtRaPqCH/7JDhHklOtqEIEygT5YFQMyQlpg4Yy3U
	Hg+J+3/vQgNuEqPE72snmSYwKsxC8swsJM/MQti7gJF5FaNUakFxbnpqslGBoW5eajk8mpPz
	czcxglOvlu8Oxtfr/+odYmTiYDzEKMHBrCTCq7uQNV2INyWxsiq1KD++qDQntfgQoykwuCcy
	S4km5wOTf15JvKGJpYGJmZmhuZGpgbmSOO+91rkpQgLpiSWp2ampBalFMH1MHJxSDUzdFxlv
	r0lIZp3XvVNYL/Gg6A7Bdu+X09hnrPzyXequ7DfBGftOW85ymNRce/BRT7yG4NmvbeoHL5pP
	l3zRrJ64/b3Yx6XJftpFXZ/4L/zO2r53nYS1HDuzT03ZZO6vkzLcDuZ/nOx8uN35yOMLD5Mn
	LLy22tjS3Es3KXyWZkp3RK5u/j8L4Q91nwPaguLNNz1dkT9X/Fh17LQa3QU3SrWcHsy6G30s
	+170lOwry0vYOhXqHpfp7n5lv5Wj/bOZrPNDyfrmlMje5H/pahbpi1R5Pu/gnbEgyeRu0aGW
	Bhah1T3R37102NeE1gpyb+bV2fPhg1RguuZqeX3PVOY/btH3Z+xa+GnulXtiQv38yUosxRmJ
	hlrMRcWJAKhnJe5GBAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrFLMWRmVeSWpSXmKPExsWy7bCSnC7vDvZ0g9XHTSwezNvGZnH/Ux+T
	xZq955gs5h85x2rxctY9NotNj6+xWlzeNYfNYsb5fUwWN9btY7d4svAMk8X/PTvYLSYtPs9k
	8fjlP2YHXo9NqzrZPFauWcPqsXlJvcfO7w3sHn1bVjF6fN4kF8AWxWWTkpqTWZZapG+XwJXx
	8/VF5oJPPBUtK0+xNzAu4Oxi5OSQEDCRWL78M0sXIxeHkMBuRolPs76xQySkJY78fsEGYQtL
	3G85wgpR9J5R4vafFSwgCTYBLYlth18xgSREQBJnv/xiBEkwC/xmlNiwwBjEFhaIkJh6ZjVY
	A4uAqsT0X6vBNvAK2ElcPbSLGWKDvMT1x0eZQGxOAXuJWd+WgNULAdV8//+JGaJeUOLkzCcs
	EPPlJZq3zmaewCgwC0lqFpLUAkamVYySqQXFuem5xYYFRnmp5XrFibnFpXnpesn5uZsYwdGh
	pbWDcc+qD3qHGJk4GA8xSnAwK4nw6i5kTRfiTUmsrEotyo8vKs1JLT7EKM3BoiTO++11b4qQ
	QHpiSWp2ampBahFMlomDU6qBaaXFVAaW0niFL1tPvZv3v6dl73PzqJv3++esb9ROSlm58ZWK
	q+eKnK03nko1xFdeWLy9ZOKlCVZPfPm/9c/fdHM5c5l7fNHx/lddXeJ1d51XewTcMP2X4jE/
	+vD+PibVK1Jv2fK5/n+7WG2RmzbjbBtzHbfDNN2z/5q+fFz4Sj+hMfe7s8b/lvPCXlH/7+yc
	PzvXSZWtKUZf58OdNJa5v7K2Ze+fLKZT0rtSo+HTW+en4Rq39isvuGcmweD2pLAx+cS59bdc
	kkr+r3sS/c2Vk3d7x6mdPteevl+2z1CLYx9fxcZUSZsy7sPNWqmfDi5Rsw2VdLT/t1DFXmTR
	rx2LTp1YnfLvhf5v4bD1/R3O7UosxRmJhlrMRcWJAA2xy5H9AgAA
X-CMS-MailID: 20241010111837epcas2p11dddc10945ca0648997dccaaf4854d93
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20241010111837epcas2p11dddc10945ca0648997dccaaf4854d93
References: <20241010111807.3635504-1-trunixs.kim@samsung.com>
	<CGME20241010111837epcas2p11dddc10945ca0648997dccaaf4854d93@epcas2p1.samsung.com>

From: Byoungtae Cho <bt.cho@samsung.com>

Add "samsung-exynosautov920-wdt" compatible to the dt-schema
document. ExynosAutoV920 is new SoC for automotive, similar to
exynosautov9 but some CPU configurations are quite different.

Signed-off-by: Byoungtae Cho <bt.cho@samsung.com>
Signed-off-by: Taewan Kim <trunixs.kim@samsung.com>
---
 Documentation/devicetree/bindings/watchdog/samsung-wdt.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/watchdog/samsung-wdt.yaml b/Documentation/devicetree/bindings/watchdog/samsung-wdt.yaml
index 77a5ddd0426e..d175ae968336 100644
--- a/Documentation/devicetree/bindings/watchdog/samsung-wdt.yaml
+++ b/Documentation/devicetree/bindings/watchdog/samsung-wdt.yaml
@@ -26,6 +26,7 @@ properties:
           - samsung,exynos7-wdt                   # for Exynos7
           - samsung,exynos850-wdt                 # for Exynos850
           - samsung,exynosautov9-wdt              # for Exynosautov9
+          - samsung,exynosautov920-wdt            # for Exynosautov920
       - items:
           - enum:
               - tesla,fsd-wdt
@@ -77,6 +78,7 @@ allOf:
               - samsung,exynos7-wdt
               - samsung,exynos850-wdt
               - samsung,exynosautov9-wdt
+              - samsung,exynosautov920-wdt
     then:
       required:
         - samsung,syscon-phandle
@@ -88,6 +90,7 @@ allOf:
               - google,gs101-wdt
               - samsung,exynos850-wdt
               - samsung,exynosautov9-wdt
+              - samsung,exynosautov920-wdt
     then:
       properties:
         clocks:
-- 
2.46.0

