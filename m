Received: from mailout3.samsung.com (mailout3.samsung.com [203.254.224.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F006828F52F
	for <linux-samsung-soc@vger.kernel.org>; Fri,  9 May 2025 13:35:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746797737; cv=none; b=NzoRREaA/fRFGRL6aWMVNCj6Uf8G5/N45VOh5IVa2YyW22hs4dPhaTpwxIBuhboJk1WGTR3UZLdyLTqc3d4uXGykc4y7rcxlo2PyjikUZxPP5CMu/Dh9jKsq3vGCREZcXf60lFJWCuOuBtkeBi1thjv6viO/TmYheVuB4vBq0tM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746797737; c=relaxed/simple;
	bh=HT4vGYib1vkdrhrAux+8AkJRUgQhALHudbO2KB1R0Ws=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 References; b=mR5rsu/jD4fLkmucX2uqwEELjqqdejWPnqUEAdhXKyig4KWsAWEAIjfHGbqfh96ftTx9yCT/PxuYORQmn9uUYrae/ivpPpzW0v/5WAR1rAg5KFiQv4JD5TdQWolooXzvUL6zppIATbGT4ku/N0IVxdRHICaPkMgjRahozq1BtxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=i+VTSVIW; arc=none smtp.client-ip=203.254.224.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="i+VTSVIW"
Received: from epcas5p2.samsung.com (unknown [182.195.41.40])
	by mailout3.samsung.com (KnoxPortal) with ESMTP id 20250509133532epoutp03e02fbb7ec4eb1e1fcfdb52ee9b78a7ac~930iAB2IU1415214152epoutp03e
	for <linux-samsung-soc@vger.kernel.org>; Fri,  9 May 2025 13:35:32 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20250509133532epoutp03e02fbb7ec4eb1e1fcfdb52ee9b78a7ac~930iAB2IU1415214152epoutp03e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1746797733;
	bh=uJ5xv2x3X+CRQNWp7iVnE+JtSDZ7GFWFYjczehxiho4=;
	h=From:To:Cc:Subject:Date:References:From;
	b=i+VTSVIWQo2OHtACmCTOYnEtFEs+AsI1FbspSS0Z7T87WOgKSxC9iL6z4WI36KPoJ
	 lMuel5I7Kp91C1DyusZYYghlGi5ImkOSAXjN99u/UUzUX90FRpdHQPHWh2vd+ExWjX
	 YpEswFkogWCUYH+Z9GpDft4ot7QGkueW+nYLreI8=
Received: from epsnrtp01.localdomain (unknown [182.195.42.153]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPS id
	20250509133532epcas5p21941906580941e4d09b5537939fd6155~930hZsG6t1470614706epcas5p2b;
	Fri,  9 May 2025 13:35:32 +0000 (GMT)
Received: from epcas5p2.samsung.com (unknown [182.195.38.183]) by
	epsnrtp01.localdomain (Postfix) with ESMTP id 4Zv9423nBYz6B9m5; Fri,  9 May
	2025 13:35:30 +0000 (GMT)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPA id
	20250509131427epcas5p1fe29ea19cb7624dc828935d6ec47854b~93iH5KmMz0480904809epcas5p1q;
	Fri,  9 May 2025 13:14:27 +0000 (GMT)
Received: from epsmgmcp1.samsung.com (unknown [182.195.42.82]) by
	epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
	20250509131427epsmtrp11595d142fc3783a9bfbb5144812b6041~93iH4U90x3116831168epsmtrp1S;
	Fri,  9 May 2025 13:14:27 +0000 (GMT)
X-AuditID: b6c32a52-40bff70000004c16-87-681dffb3509c
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
	epsmgmcp1.samsung.com (Symantec Messaging Gateway) with SMTP id
	E0.8D.19478.3BFFD186; Fri,  9 May 2025 22:14:27 +0900 (KST)
Received: from bose.samsungds.net (unknown [107.108.83.9]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20250509131425epsmtip1df3d977fb138a2f14c4f522f592f98f0~93iFuuKrU2903429034epsmtip1b;
	Fri,  9 May 2025 13:14:25 +0000 (GMT)
From: Raghav Sharma <raghav.s@samsung.com>
To: krzk@kernel.org, s.nawrocki@samsung.com, cw00.choi@samsung.com,
	alim.akhtar@samsung.com, mturquette@baylibre.com, sboyd@kernel.org,
	robh@kernel.org, conor+dt@kernel.org, sunyeal.hong@samsung.com,
	shin.son@samsung.com
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Raghav Sharma <raghav.s@samsung.com>
Subject: [PATCH v1] dt-bindings: clock: exynosautov920: add hsi2 clock
 definitions
Date: Fri,  9 May 2025 18:54:14 +0530
Message-Id: <20250509132414.3752159-1-raghav.s@samsung.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrGLMWRmVeSWpSXmKPExsWy7bCSnO7m/7IZBncmmVo8mLeNzWLN3nNM
	Fte/PGe1mH/kHKvF+fMb2C02Pb7GavGx5x6rxeVdc9gsZpzfx2Rx8ZSrxfeVdxgt/u/ZwW5x
	+E07q8W/axtZLCYfX8tq0bRsPZODgMf7G63sHptWdbJ5bF5S79G3ZRWjx+dNcgGsUVw2Kak5
	mWWpRfp2CVwZvW/2shb8Eam4eeQbUwPjZf4uRk4OCQETiePzfrF3MXJxCAlsZ5TYf+8vI0RC
	QmLf/99QtrDEyn/PoYreMkr0b53OBJJgE9CSuLL9HRuILSLwjlFi0zoxkCJmgQuMEp9e/gTq
	5uAQFgiSmD8jC6SGRUBV4v/2yywgNq+AtcSxHe0sEAvkJfYfPMsMEReUODnzCVicGSjevHU2
	8wRGvllIUrOQpBYwMq1iFE0tKM5Nz00uMNQrTswtLs1L10vOz93ECA56raAdjMvW/9U7xMjE
	wXiIUYKDWUmE93mnTIYQb0piZVVqUX58UWlOavEhRmkOFiVxXuWczhQhgfTEktTs1NSC1CKY
	LBMHp1QDk+yeR6wrc6z2JWd49lw4XXc2Rnn6sR0M3CxLt1VN/eEt5PlsupX6rcfpa2wufn+6
	/UB4qrqY5qwP5VJdp2X93XbIHPd3+8gv/iK8nUVafpuLUqOFs4OA9mvdG6dOO5207UjgMupp
	+MDxKKpNZNns35wX7t3JX+j6M2v/v+7E9HtWu89/COwwvLBz3vMbDKvF18YdFDl4UWOmWMdu
	7Qt13/+uc+JjWl3wvNrs3k0b5ZeVn0TtN/P+v+h04tyJ36+sVv38Z2ArGxLq3/0ro+BWzrVf
	wR/zvuzUE1nCvHQul+0Tbaa36zOkfyxTuXg8LVa7IaEurqhiaePmmlXFu/afuT7vwwG/1SuZ
	TzOdPD3b/7ESS3FGoqEWc1FxIgDhAktx6QIAAA==
X-CMS-MailID: 20250509131427epcas5p1fe29ea19cb7624dc828935d6ec47854b
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-543,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250509131427epcas5p1fe29ea19cb7624dc828935d6ec47854b
References: <CGME20250509131427epcas5p1fe29ea19cb7624dc828935d6ec47854b@epcas5p1.samsung.com>

Add device tree clock binding definitions for CMU_HSI2

Signed-off-by: Raghav Sharma <raghav.s@samsung.com>
---
 .../clock/samsung,exynosautov920-clock.yaml   | 29 +++++++++++++++++--
 .../clock/samsung,exynosautov920.h            |  9 ++++++
 2 files changed, 36 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/samsung,exynosautov920-clock.yaml b/Documentation/devicetree/bindings/clock/samsung,exynosautov920-clock.yaml
index 6961a68098f4..3cbb1dc8d828 100644
--- a/Documentation/devicetree/bindings/clock/samsung,exynosautov920-clock.yaml
+++ b/Documentation/devicetree/bindings/clock/samsung,exynosautov920-clock.yaml
@@ -41,14 +41,15 @@ properties:
       - samsung,exynosautov920-cmu-misc
       - samsung,exynosautov920-cmu-hsi0
       - samsung,exynosautov920-cmu-hsi1
+      - samsung,exynosautov920-cmu-hsi2
 
   clocks:
     minItems: 1
-    maxItems: 4
+    maxItems: 5
 
   clock-names:
     minItems: 1
-    maxItems: 4
+    maxItems: 5
 
   "#clock-cells":
     const: 1
@@ -201,6 +202,30 @@ allOf:
             - const: usbdrd
             - const: mmc_card
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: samsung,exynosautov920-cmu-hsi2
+
+    then:
+      properties:
+        clocks:
+          items:
+            - description: External reference clock (38.4 MHz)
+            - description: CMU_HSI2 NOC clock (from CMU_TOP)
+            - description: CMU_HSI2 NOC UFS clock (from CMU_TOP)
+            - description: CMU_HSI2 UFS EMBD clock (from CMU_TOP)
+            - description: CMU_HSI2 ETHERNET clock (from CMU_TOP)
+
+        clock-names:
+          items:
+            - const: oscclk
+            - const: noc
+            - const: ufs
+            - const: embd
+            - const: ethernet
+
 required:
   - compatible
   - "#clock-cells"
diff --git a/include/dt-bindings/clock/samsung,exynosautov920.h b/include/dt-bindings/clock/samsung,exynosautov920.h
index 5e6896e9627f..93e6233d1358 100644
--- a/include/dt-bindings/clock/samsung,exynosautov920.h
+++ b/include/dt-bindings/clock/samsung,exynosautov920.h
@@ -286,4 +286,13 @@
 #define CLK_MOUT_HSI1_USBDRD_USER	3
 #define CLK_MOUT_HSI1_USBDRD		4
 
+/* CMU_HSI2 */
+#define FOUT_PLL_ETH                    1
+#define CLK_MOUT_HSI2_NOC_UFS_USER      2
+#define CLK_MOUT_HSI2_UFS_EMBD_USER     3
+#define CLK_MOUT_HSI2_ETHERNET          4
+#define CLK_MOUT_HSI2_ETHERNET_USER     5
+#define CLK_DOUT_HSI2_ETHERNET          6
+#define CLK_DOUT_HSI2_ETHERNET_PTP      7
+
 #endif /* _DT_BINDINGS_CLOCK_EXYNOSAUTOV920_H */
-- 
2.34.1

