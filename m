Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3139D770F0
	for <linux-samsung-soc@vger.kernel.org>; Mon, 29 Jul 2024 04:31:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722227469; cv=none; b=an5eBMoOwRQSwoc3njvH9QIvvp3MovObl0KbzXd8JwoAU0VWvs7P/GEk02fQDYgxb0aOaCJPj6Gktrydkp5kWPt8NLCdQr7AZYpAbUF5RBbUZKB4wA/PcPJhrnhOVyXI4PblgxM88vJZH3iBx/5wxbamvPDmtYB4qCrJXTmVasI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722227469; c=relaxed/simple;
	bh=wB1pVIQYZKWVfVGlfItOwmHJ0VNZaiMNNiVUmWq1zBA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:MIME-Version:
	 Content-Type:References; b=cy3x/7+NZIEX2QNMXSuek3ds9aqavqyN6hBu/WzonVNZAa++n6cVWbI4NiLBuaGF/WZQvOWqQPDGvGylRXJ+Hw3mKZPz1PG2hJRyHBA55b29yT11tOLCflnPm3HL/Slbjx6GC9uZ/7SQDdG+z8WKUQTSkSvKKLMMdSp0FrBeXHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=mRxtxinD; arc=none smtp.client-ip=203.254.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="mRxtxinD"
Received: from epcas1p2.samsung.com (unknown [182.195.41.46])
	by mailout4.samsung.com (KnoxPortal) with ESMTP id 20240729043104epoutp0460a39a10175108ecc2c2f11da480a9a9~mlMEijHee2227022270epoutp04P
	for <linux-samsung-soc@vger.kernel.org>; Mon, 29 Jul 2024 04:31:04 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20240729043104epoutp0460a39a10175108ecc2c2f11da480a9a9~mlMEijHee2227022270epoutp04P
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1722227464;
	bh=/48c96A0XvcZE4kG7ML3/PckI+5U0XxSxTVEwmZX5rA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=mRxtxinDMOxRmFoABjZz25R8lBCX4O5MSkZbppNEgYnpaevlUTSkxcqhEqfwzBOp8
	 mlOKjOFn4/lRt+vSwrAVNwlskkq9J0ZT+JpBhhoXD2O2ho/WBg3CbKxObucea9R032
	 XqUbgQ6cwwZFoGMWFMz4qS1BmZ/zA/G1nBpKQaOk=
Received: from epsnrtp1.localdomain (unknown [182.195.42.162]) by
	epcas1p4.samsung.com (KnoxPortal) with ESMTP id
	20240729043104epcas1p4747dd4ca0e062a69939c0dab5e652eec~mlMD8K-tO1911819118epcas1p4A;
	Mon, 29 Jul 2024 04:31:04 +0000 (GMT)
Received: from epsmgec1p1.samsung.com (unknown [182.195.38.232]) by
	epsnrtp1.localdomain (Postfix) with ESMTP id 4WXQQt6ML2z4x9QH; Mon, 29 Jul
	2024 04:31:02 +0000 (GMT)
Received: from epcas1p3.samsung.com ( [182.195.41.47]) by
	epsmgec1p1.samsung.com (Symantec Messaging Gateway) with SMTP id
	B9.0B.09623.60B17A66; Mon, 29 Jul 2024 13:31:02 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
	epcas1p4.samsung.com (KnoxPortal) with ESMTPA id
	20240729043102epcas1p47e5e622f96e2092ecaff4dcb8f217b34~mlMCQPvgx2159921599epcas1p4u;
	Mon, 29 Jul 2024 04:31:02 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
	epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
	20240729043102epsmtrp1c362ace9b590422701deddc7941c5691~mlMCPUFf-0723007230epsmtrp1O;
	Mon, 29 Jul 2024 04:31:02 +0000 (GMT)
X-AuditID: b6c32a36-ef9ff70000002597-af-66a71b06855a
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
	epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
	0D.54.08964.60B17A66; Mon, 29 Jul 2024 13:31:02 +0900 (KST)
Received: from localhost.localdomain (unknown [10.113.111.204]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20240729043101epsmtip1a093e53af42c5620180cdda2f6bc06b6~mlMB0P-Lo1795717957epsmtip1j;
	Mon, 29 Jul 2024 04:31:01 +0000 (GMT)
From: Kwanghoon Son <k.son@samsung.com>
To: krzk@kernel.org, s.nawrocki@samsung.com, cw00.choi@samsung.com,
	alim.akhtar@samsung.com, mturquette@baylibre.com, sboyd@kernel.org,
	robh@kernel.org, conor+dt@kernel.org, tomasz.figa@gmail.com
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Kwanghoon
	Son <k.son@samsung.com>
Subject: [PATCH 2/4] dt-bindings: clock: exynosautov9: add schema for dpum
Date: Mon, 29 Jul 2024 13:30:37 +0900
Message-Id: <20240729043039.134435-3-k.son@samsung.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240729043039.134435-1-k.son@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrGJsWRmVeSWpSXmKPExsWy7bCmvi6b9PI0gxcrDSwezNvGZrFm7zkm
	i+tfnrNazD9yjtWid81VJovz5zewW2x6fI3V4mPPPVaLGef3MVlcPOVq8X/PDnaLw2/aWS3+
	XdvIYrFq1x9GBz6P9zda2T12zrrL7rFpVSebx+Yl9R59W1YxenzeJBfAFpVtk5GamJJapJCa
	l5yfkpmXbqvkHRzvHG9qZmCoa2hpYa6kkJeYm2qr5OIToOuWmQN0rJJCWWJOKVAoILG4WEnf
	zqYov7QkVSEjv7jEVim1ICWnwLRArzgxt7g0L10vL7XEytDAwMgUqDAhO6Ph+AmmgifcFSc+
	bWRtYHzC0cXIwSEhYCJxfptxFyMXh5DADkaJs4tPsEM4nxglLi+ZzAThfGOU+Nv1lLGLkROs
	49rftSwQib2MEseOrmGGcL4wSuxpXcUCUsUmoC6xpG0t2CwRgeOMEmeWdDOCOMwCKxklHqx6
	AlYlLOAlsW9NE9hcFgFVibbnN1hBbF4Bc4lXL68zQ1woL7H4gQRImFPAQqLr30RmiBJBiZMz
	IcYwA5U0b50NdoWEwEoOifnNd5ghbnWRePR1P5QtLPHq+BZ2CFtK4mV/G5SdLXH04142CLtE
	4vqsRawQtrHE/qWgAOAAWqApsX6XPsQuPol3X3tYIU7jlehoE4K58lZnOUSjqMSZpx+hBnpI
	PP4zCRqk3YwSL1beZp/AKD8LyQezkHwwC2HZAkbmVYxiqQXFuempxYYFRvBYTc7P3cQITrBa
	ZjsYJ739oHeIkYmD8RCjBAezkghv/JWlaUK8KYmVValF+fFFpTmpxYcYTYHBO5FZSjQ5H5ji
	80riDU0sDUzMjIxNLAzNDJXEec9cKUsVEkhPLEnNTk0tSC2C6WPi4JRqYHLzqT1y1sH2tIHs
	5daoA18Fmm1nXFI6XO5ccK54rbUmE/831fU1+14KNb3jem3vs2n+2ZxfU6ZeFtjB9fn3gfLT
	PHMeCc6N7u9YkJCyWHYOsyLP70Ih7zPKz/N3VRcFWDjNbltinhcmsefuS/YlX9M1H7NEeAk+
	PvT1u/383zdFks8XP3u76OGZuwGpjvfW17r8Sy+QZ28X3FK1cOLTJtEt3u25pdJHL8SsPnnw
	qNXaq2fdTSbYbdi9bPX+ufM3nOHa+bbguOI1xX1T66fo3L7ueD3wyIPr79g5pMWmLbHcHfr4
	t/TliiIPHxGtiQoMSllNfcIz57au/7JC9ruY01zG+bKLCm46Wx9q3vi48PxnJZbijERDLeai
	4kQA7gAExjkEAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrDLMWRmVeSWpSXmKPExsWy7bCSnC6b9PI0g64uLosH87axWazZe47J
	4vqX56wW84+cY7XoXXOVyeL8+Q3sFpseX2O1+Nhzj9Vixvl9TBYXT7la/N+zg93i8Jt2Vot/
	1zayWKza9YfRgc/j/Y1Wdo+ds+6ye2xa1cnmsXlJvUffllWMHp83yQWwRXHZpKTmZJalFunb
	JXBlNBw/wVTwhLvixKeNrA2MTzi6GDk5JARMJK79XcsCYgsJ7GaUODxZCyIuKtFxuZGxi5ED
	yBaWOHy4uIuRC6jkE6PEhw2H2EBq2ATUJZa0rWUHSYgIXGaU+L9gEiOIwyywllHi6ZQn7CBV
	wgJeEvvWNDGC2CwCqhJtz2+wgti8AuYSr15eZ4bYIC+x+IEESJhTwEKi699EZoiDzCXuX53A
	BlEuKHFy5hOwQ5mBypu3zmaewCgwC0lqFpLUAkamVYySqQXFuem5xYYFhnmp5XrFibnFpXnp
	esn5uZsYwRGipbmDcfuqD3qHGJk4GA8xSnAwK4nwxl9ZmibEm5JYWZValB9fVJqTWnyIUZqD
	RUmcV/xFb4qQQHpiSWp2ampBahFMlomDU6qB6eTyL4paXnJOgRvj3c/vs/Zdvs3088YPszbW
	hL15LKjAZeLYe6niq/lmzyCp/Rt7rh9KnO9ydW//Vdldu5hid/F5OTJrC9tOCeMryxZ6EPd5
	wZ5Xe9vf7atnOH4ubZnonmSR4KufIlz57D9c2n3icFfFniWvQzesvK73ZvejK/N1djdcOc7T
	8Ot+yvrPt/U+N66bnNoicGJrdGPvO84dJQbMRz4uuHiqX6Xe5KiUodWLE5dtZhb3HlWcoXs7
	bleRoKlvY52QOGdBsELwv4oF25s+LNF+ZrHp9b/2e9NcHpTFCs+X8CtelvH4vp2fYcZf1+vn
	j//gVm43jbEyubSu6yzn8sQ3h64222txBaj8VFJiKc5INNRiLipOBABgp+MC/wIAAA==
X-CMS-MailID: 20240729043102epcas1p47e5e622f96e2092ecaff4dcb8f217b34
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20240729043102epcas1p47e5e622f96e2092ecaff4dcb8f217b34
References: <20240729043039.134435-1-k.son@samsung.com>
	<CGME20240729043102epcas1p47e5e622f96e2092ecaff4dcb8f217b34@epcas1p4.samsung.com>

Add "samsung,exynosautov9-cmu-dpum" compatibles.

Signed-off-by: Kwanghoon Son <k.son@samsung.com>
---
 .../clock/samsung,exynosautov9-clock.yaml     | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/samsung,exynosautov9-clock.yaml b/Documentation/devicetree/bindings/clock/samsung,exynosautov9-clock.yaml
index 55c4f94a14d1..9c8041fc9d4b 100644
--- a/Documentation/devicetree/bindings/clock/samsung,exynosautov9-clock.yaml
+++ b/Documentation/devicetree/bindings/clock/samsung,exynosautov9-clock.yaml
@@ -35,6 +35,7 @@ properties:
       - samsung,exynosautov9-cmu-top
       - samsung,exynosautov9-cmu-busmc
       - samsung,exynosautov9-cmu-core
+      - samsung,exynosautov9-cmu-dpum
       - samsung,exynosautov9-cmu-fsys0
       - samsung,exynosautov9-cmu-fsys1
       - samsung,exynosautov9-cmu-fsys2
@@ -109,6 +110,24 @@ allOf:
             - const: oscclk
             - const: dout_clkcmu_core_bus
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: samsung,exynosautov9-cmu-dpum
+
+    then:
+      properties:
+        clocks:
+          items:
+            - description: External reference clock (26 MHz)
+            - description: CMU_DPUM bus clock (from CMU_TOP)
+
+        clock-names:
+          items:
+            - const: oscclk
+            - const: dout_clkcmu_dpum_bus
+
   - if:
       properties:
         compatible:
-- 
2.39.2

