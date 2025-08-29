Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01C0631CA7A
	for <linux-samsung-soc@vger.kernel.org>; Fri, 29 Aug 2025 13:57:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756475829; cv=none; b=N3y/IBcvG4qaYtQq10bYPBkO3j/B4OCSs6pSa6c3+limpscJaqzHXoJJPt/DNz1mmdLDNs2BXkc8qSWBtCNtKNSR3dGiWp3AmJ8eRDB055rOwSZ6tlSiQUVC/q2Eg9/Z2iv1Nc+Anf3P7ywKpXqN0EQ3mD3Go+f6qjOovI8DRIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756475829; c=relaxed/simple;
	bh=OhNPbnt1rf5s8smDv39eHuvIsyk/DaFHGGKYuhVdoxo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:MIME-Version:
	 Content-Type:References; b=GYYfJVmahp7zD0An5Ch0jZ30/bY1aNFPEz74uwVWwU9/ROmzc1JpE1PtgmUb6BUPgXFjWvWcGR3xKGRefYJBgvtIvgdoaRH8uvP9J+5nnGQkag57yrTp1Y1bumB/reJ3W1DvSy6X1xTrw233an51ZneyK2KNwOd287Voycdy3f4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=X4LcKWs6; arc=none smtp.client-ip=203.254.224.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="X4LcKWs6"
Received: from epcas5p1.samsung.com (unknown [182.195.41.39])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20250829135705epoutp0242a509dc87e4ebf4976a308d2c899b1b~gQXT8DTBb2867728677epoutp02G
	for <linux-samsung-soc@vger.kernel.org>; Fri, 29 Aug 2025 13:57:05 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20250829135705epoutp0242a509dc87e4ebf4976a308d2c899b1b~gQXT8DTBb2867728677epoutp02G
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1756475825;
	bh=HpTKhZ7/rpVPsXoILVVhOB2b+exwcmHjfNj1mWTFV1Q=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=X4LcKWs6160yTCH+IYNGHzCISj8YZjCdYL3IlxX7tEQxAoAIrU8ox2c07l7MPHoaA
	 p4viO16j1kadBl9BVXq5Dx8ReXckKzwa9lPTFJrxI4Kz58tPx1ixVRyZ5Mizxw/Yr4
	 D/4cEztMCuJb1yBVdBTcGnwQjdh1Zi8T4OtNuxP0=
Received: from epsnrtp04.localdomain (unknown [182.195.42.156]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPS id
	20250829135704epcas5p261ee4e9409c6b563e52c485a959b9a9e~gQXTXg0Uw1958719587epcas5p2W;
	Fri, 29 Aug 2025 13:57:04 +0000 (GMT)
Received: from epcas5p1.samsung.com (unknown [182.195.38.88]) by
	epsnrtp04.localdomain (Postfix) with ESMTP id 4cD0FC5dN2z6B9m5; Fri, 29 Aug
	2025 13:57:03 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPA id
	20250829135703epcas5p14bbcc16e8d3622950a28e0ce40ff2dcd~gQXR4BPzZ1167611676epcas5p1z;
	Fri, 29 Aug 2025 13:57:03 +0000 (GMT)
Received: from cheetah.samsungds.net (unknown [107.109.115.53]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20250829135701epsmtip2ba771a62bb7f0c34182fac990cda423d~gQXQRzt9-1416014160epsmtip22;
	Fri, 29 Aug 2025 13:57:01 +0000 (GMT)
From: Varada Pavani <v.pavani@samsung.com>
To: krzk@kernel.org, s.nawrocki@samsung.com, cw00.choi@samsung.com,
	alim.akhtar@samsung.com, mturquette@baylibre.com, sboyd@kernel.org,
	linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: aswani.reddy@samsung.com, gost.dev@samsung.com, Varada Pavani
	<v.pavani@samsung.com>
Subject: [PATCH 1/2] dt-bindings: watchdog: Modify tesla fsd bindings
Date: Fri, 29 Aug 2025 19:26:42 +0530
Message-ID: <20250829135643.105406-2-v.pavani@samsung.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250829135643.105406-1-v.pavani@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250829135703epcas5p14bbcc16e8d3622950a28e0ce40ff2dcd
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-541,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250829135703epcas5p14bbcc16e8d3622950a28e0ce40ff2dcd
References: <20250829135643.105406-1-v.pavani@samsung.com>
	<CGME20250829135703epcas5p14bbcc16e8d3622950a28e0ce40ff2dcd@epcas5p1.samsung.com>

FSD SoC WDT is using Samsung legacy WDT driver with
"samsung,exynos7-wdt" compatibility. Now change the compatibility due to
few driver changes (PMU bit changes for each WDT instance and Clocks)
for WDT found in FSD SoC.

Signed-off-by: Varada Pavani <v.pavani@samsung.com>
---
 .../devicetree/bindings/watchdog/samsung-wdt.yaml        | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/watchdog/samsung-wdt.yaml b/Documentation/devicetree/bindings/watchdog/samsung-wdt.yaml
index d175ae968336..db2009654fe4 100644
--- a/Documentation/devicetree/bindings/watchdog/samsung-wdt.yaml
+++ b/Documentation/devicetree/bindings/watchdog/samsung-wdt.yaml
@@ -27,10 +27,7 @@ properties:
           - samsung,exynos850-wdt                 # for Exynos850
           - samsung,exynosautov9-wdt              # for Exynosautov9
           - samsung,exynosautov920-wdt            # for Exynosautov920
-      - items:
-          - enum:
-              - tesla,fsd-wdt
-          - const: samsung,exynos7-wdt
+          - tesla,fsd-wdt
 
   reg:
     maxItems: 1
@@ -79,6 +76,7 @@ allOf:
               - samsung,exynos850-wdt
               - samsung,exynosautov9-wdt
               - samsung,exynosautov920-wdt
+              - tesla,fsd-wdt
     then:
       required:
         - samsung,syscon-phandle
@@ -91,6 +89,7 @@ allOf:
               - samsung,exynos850-wdt
               - samsung,exynosautov9-wdt
               - samsung,exynosautov920-wdt
+              - tesla,fsd-wdt
     then:
       properties:
         clocks:
@@ -102,7 +101,7 @@ allOf:
             - const: watchdog
             - const: watchdog_src
         samsung,cluster-index:
-          enum: [0, 1]
+          enum: [0, 1, 2]
       required:
         - samsung,cluster-index
     else:
-- 
2.49.0

