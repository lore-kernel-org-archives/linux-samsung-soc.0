Received: from mailout1.samsung.com (mailout1.samsung.com [203.254.224.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A5D34E1C78
	for <linux-samsung-soc@vger.kernel.org>; Fri,  9 Oct 2026 11:43:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.24
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791546238; cv=none; b=aTfgV6mB6dpzJlBCFeUAho0Y+RCBma3Azo7vsR2KFVLTZB4bfZMzhkTXAw0YYzj+8yJ77Vl0pgADK99HXSkf0tM6kDC8wULz1Qa9eyBZ6pO6D+ruRjY2aWsNxMuyw01AJRtNptBdvgmSqf58bHfiBBGbSCmJuH0n9SvX0MLeqXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791546238; c=relaxed/simple;
	bh=oVzdeo4NhsSSb3UiEWGHe6kTxAXBbVgYE7Fa7PrfGbU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:MIME-Version:
	 Content-Type:References; b=J5UT+0Y5/bYrM1lZh4fbEVaEGVq9CWI1cY7Ad9iHK+NAIdZ875YcJNBPtJOb1P1mqmpUhy5K4iPaavmf0EjrL30+AJshcFseAyLZAFzPrDtbkowAqLTtgs3ZADOejojghGuAvjV/q/SCQUVDNUhSVzmNBdQpBELGYXQl7XTuLmk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=C+vYf2C5; arc=none smtp.client-ip=203.254.224.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="C+vYf2C5"
Received: from epcas5p1.samsung.com (unknown [182.195.41.39])
	by mailout1.samsung.com (KnoxPortal) with ESMTP id 20261009114346epoutp016f747ccc6c1ce64a1314021e2712676d~c2c0Blu0m1385013850epoutp01T
	for <linux-samsung-soc@vger.kernel.org>; Fri,  9 Oct 2026 11:43:46 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20261009114346epoutp016f747ccc6c1ce64a1314021e2712676d~c2c0Blu0m1385013850epoutp01T
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1791546226;
	bh=7sm1IklHNsuLjrkLuMNQhzhzXShU5hyqAYYWI9pPG8w=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=C+vYf2C5QsGbhtLnRsDeUAzFUstbK5/TzB5npONjdSmBjEf6F4PTNekuhpiCYQ1LY
	 p/GFlt1lTGjEOevZdh1Ypc+wwXXa4RB4/ocXXsWfLfAafCHSw34UJjWZe3nOpJhuGJ
	 ugwAVpRg+oi/6j7H5mUsn/gcDg+DuYcUPKm1TWXk=
Received: from epsnrtp03.localdomain (unknown [182.195.42.155]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPS id
	20261009114345epcas5p3202c8e959ed065ee2db17869d9c07b1f~c2cy1MeCz0308303083epcas5p3i;
	Fri,  9 Oct 2026 11:43:45 +0000 (GMT)
Received: from epcas5p4.samsung.com (unknown [182.195.38.93]) by
	epsnrtp03.localdomain (Postfix) with ESMTP id 4j1Q400D1Lz3hhT3; Fri,  9 Oct
	2026 11:43:44 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPA id
	20261009114342epcas5p4345e99027177004b612da6fc103ba80f~c2cw1zW7F1488414884epcas5p4Z;
	Fri,  9 Oct 2026 11:43:42 +0000 (GMT)
Received: from bose.samsungds.net (unknown [107.108.83.9]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20261009114340epsmtip2cf17604eccd38a888a78d89d144d89d1~c2cuT9ci73087430874epsmtip2N;
	Fri,  9 Oct 2026 11:43:40 +0000 (GMT)
From: Raghav Sharma <raghav.s@samsung.com>
To: krzk@kernel.org, s.nawrocki@samsung.com, cw00.choi@samsung.com,
	peter.griffin@linaro.org, alim.akhtar@samsung.com, sboyd@kernel.org,
	bmasney+clk@redhat.com, jbrunet+clk@baylibre.com, robh@kernel.org,
	conor+dt@kernel.org, raghav.s@samsung.com
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, is.gandhi@samsung.com, ts.amit@samsung.com,
	pokala.reddy@samsung.com
Subject: [PATCH v2 04/14] dt-bindings: clock: exynos8855: add hsi clock
 definitions
Date: Fri,  9 Oct 2026 17:31:27 +0530
Message-Id: <20261009120137.2801911-5-raghav.s@samsung.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261009120137.2801911-1-raghav.s@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20261009114342epcas5p4345e99027177004b612da6fc103ba80f
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-543,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20261009114342epcas5p4345e99027177004b612da6fc103ba80f
References: <20261009120137.2801911-1-raghav.s@samsung.com>
	<CGME20261009114342epcas5p4345e99027177004b612da6fc103ba80f@epcas5p4.samsung.com>

Add device tree clock binding definitions for CMU_HSI

Signed-off-by: Raghav Sharma <raghav.s@samsung.com>
---
 .../clock/samsung,exynos8855-clock.yaml       | 21 +++++++++++++++++++
 .../dt-bindings/clock/samsung,exynos8855.h    |  8 +++++++
 2 files changed, 29 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/samsung,exynos8855-clock.yaml b/Documentation/devicetree/bindings/clock/samsung,exynos8855-clock.yaml
index 62277c67fec1..e97b65f8be5f 100644
--- a/Documentation/devicetree/bindings/clock/samsung,exynos8855-clock.yaml
+++ b/Documentation/devicetree/bindings/clock/samsung,exynos8855-clock.yaml
@@ -28,6 +28,7 @@ description: |
 properties:
   compatible:
     enum:
+      - samsung,exynos8855-cmu-hsi
       - samsung,exynos8855-cmu-peric
       - samsung,exynos8855-cmu-peris
       - samsung,exynos8855-cmu-top
@@ -47,6 +48,26 @@ properties:
     maxItems: 1
 
 allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: samsung,exynos8855-cmu-hsi
+
+    then:
+      properties:
+        clocks:
+          items:
+            - description: External reference clock (76.8 MHz)
+            - description: CMU_HSI NOC clock (from CMU_TOP)
+            - description: CMU_HSI UFS_EMBD clock (from CMU_TOP)
+
+        clock-names:
+          items:
+            - const: oscclk
+            - const: bus
+            - const: ufs_embd
+
   - if:
       properties:
         compatible:
diff --git a/include/dt-bindings/clock/samsung,exynos8855.h b/include/dt-bindings/clock/samsung,exynos8855.h
index 5d8b38a744b5..67cd97d8fab8 100644
--- a/include/dt-bindings/clock/samsung,exynos8855.h
+++ b/include/dt-bindings/clock/samsung,exynos8855.h
@@ -214,4 +214,12 @@
 #define CLK_GOUT_WDT0_PERIS                8
 #define CLK_GOUT_WDT1_PERIS                9
 
+/* CMU_HSI */
+#define CLK_MOUT_HSI_NOC_USER              1
+#define CLK_MOUT_HSI_UFS_EMBD_USER         2
+#define CLK_GOUT_CMU_HSI                   3
+#define CLK_GOUT_SYSREG_HSI                4
+#define CLK_GOUT_UFS_EMBD_ACLK_HSI         5
+#define CLK_GOUT_UFS_EMBD_UNIPRO_HSI       6
+
 #endif /* _DT_BINDINGS_CLOCK_EXYNOS8855_H */
-- 
2.34.1

