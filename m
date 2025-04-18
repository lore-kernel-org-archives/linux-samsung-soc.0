Received: from mailout1.samsung.com (mailout1.samsung.com [203.254.224.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90991267F52
	for <linux-samsung-soc@vger.kernel.org>; Fri, 18 Apr 2025 06:15:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.24
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744956922; cv=none; b=YXPHdjSJm0gNqYCIFe6ufVTDU7HsW+TdZcPTCgVXdghRMwGcdlcz3nHxDD7Y6wMSj3SXc5AJ79i+rr4igplNFOAa8UVoWjzdOziNxlJZ0yjEAGgdEubaWnJnM/Dt0Yykma8WZI9WKRG9I0rJ9Q7rfsw9yX2ypJmKcvK+TlzImHE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744956922; c=relaxed/simple;
	bh=ozSbajrfTES3HYTQG31nG5UJl1WbEuIsbT8qFaiFQSM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:MIME-Version:
	 Content-Type:References; b=LD7SjvqbJrt9bJYn0Jf2YhBskozwmMX+PGmG9WbJr1ry9tVMwNa2QGAxmVnPOtVsl3alnc+vIY9VbeGz02Pfo0j6sZjc4ENFXb7dVThGZRfGYNZMFRJ5X0yFT9pOhp8NxDC+wwhgW/fP6iWdHGpm3N1NQszhDJUjzIOYb6/pCk8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=nQXHJLa/; arc=none smtp.client-ip=203.254.224.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="nQXHJLa/"
Received: from epcas2p3.samsung.com (unknown [182.195.41.55])
	by mailout1.samsung.com (KnoxPortal) with ESMTP id 20250418061517epoutp01f5392e6fa427b36eed22e6f2d2ccb772~3VRIwAXxb1284712847epoutp01c
	for <linux-samsung-soc@vger.kernel.org>; Fri, 18 Apr 2025 06:15:17 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20250418061517epoutp01f5392e6fa427b36eed22e6f2d2ccb772~3VRIwAXxb1284712847epoutp01c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1744956917;
	bh=xgncfsXMxq1UbW2oBNT5fRdmhvcqQjNCYqaHqXrv94Y=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=nQXHJLa/Q9+/ipB5NbrO2lsBvR3uUIiytSo7b+As00s2DStwbGpbW+UXBHUew/4e2
	 BKB7wN3Qqaihqc/cdfaZbUM7ldNW3XpakAV4E6jEgMvfEKOuXhTb/FjW8an0JSbGix
	 l5AJI/ELOpA0ML9fdzphrOd/dFfby4BGcH3x7KDQ=
Received: from epsnrtp02.localdomain (unknown [182.195.42.154]) by
	epcas2p2.samsung.com (KnoxPortal) with ESMTPS id
	20250418061516epcas2p2e37511d73b5602fc29c3acbfb2d0c82f~3VRHxn0zE2967429674epcas2p2A;
	Fri, 18 Apr 2025 06:15:16 +0000 (GMT)
Received: from epcas2p2.samsung.com (unknown [182.195.36.92]) by
	epsnrtp02.localdomain (Postfix) with ESMTP id 4Zf4Hl5kVnz2SSKg; Fri, 18 Apr
	2025 06:15:15 +0000 (GMT)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
	epcas2p3.samsung.com (KnoxPortal) with ESMTPA id
	20250418061515epcas2p3d2dd703db7eb645f4866dcb01cc288fc~3VRG3Pxah1350013500epcas2p3x;
	Fri, 18 Apr 2025 06:15:15 +0000 (GMT)
Received: from epsmgms1p2new.samsung.com (unknown [182.195.42.42]) by
	epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
	20250418061515epsmtrp279335f4aa93070e078ce3c0c6d34dcd2~3VRG2YUnS0714207142epsmtrp23;
	Fri, 18 Apr 2025 06:15:15 +0000 (GMT)
X-AuditID: b6c32a2a-d57fe70000002265-d1-6801edf289e9
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
	epsmgms1p2new.samsung.com (Symantec Messaging Gateway) with SMTP id
	B1.AE.08805.2FDE1086; Fri, 18 Apr 2025 15:15:15 +0900 (KST)
Received: from localhost.localdomain (unknown [10.229.9.60]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20250418061514epsmtip1965d5c7ecebd25a400c904c7d312abec~3VRGkVuK60438204382epsmtip1O;
	Fri, 18 Apr 2025 06:15:14 +0000 (GMT)
From: Shin Son <shin.son@samsung.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, Sylwester Nawrocki
	<s.nawrocki@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar
	<alim.akhtar@samsung.com>, Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Sunyeal Hong <sunyeal.hong@samsung.com>
Cc: Shin Son <shin.son@samsung.com>, linux-samsung-soc@vger.kernel.org,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] dt-bindings: clock: exynosautov920: add cpucl0 clock
 definitions
Date: Fri, 18 Apr 2025 15:14:58 +0900
Message-ID: <20250418061500.1629200-2-shin.son@samsung.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250418061500.1629200-1-shin.son@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrFLMWRmVeSWpSXmKPExsWy7bCSnO7nt4wZBhvXslg8mLeNzWLN3nNM
	Fte/PGe1mH/kHKvF+fMb2C02Pb7GavGx5x6rxeVdc9gsZpzfx2Rx8ZSrxf89O9gtDr9pZ7X4
	d20ji8Xk42tZLZqWrWdy4Pd4f6OV3WPTqk42j81L6j36tqxi9Pi8SS6ANYrLJiU1J7MstUjf
	LoEr4/uNNcwFH8Qr9iyfy9TAeF2oi5GDQ0LARGLjdoEuRi4OIYHdjBKndy1n7WLkBIpLSBye
	MYERwhaWuN9yhBWi6D2jxMXl39hBmtkEVCU2/ZYHiYsIvGWSWP7/ABNIA7PAaUaJnWdkQGxh
	gVCJLdumsYPYLED1N/Y3sYDYvALWEl83nWKGOEJeor9DAiTMKWAjsXTfLDaQsBBQycIXdRDV
	ghInZz5hgZguL9G8dTbzBEaBWUhSs5CkFjAyrWKUTC0ozk3PLTYsMMpLLdcrTswtLs1L10vO
	z93ECI4OLa0djHtWfdA7xMjEwXiIUYKDWUmE95z5v3Qh3pTEyqrUovz4otKc1OJDjNIcLEri
	vN9e96YICaQnlqRmp6YWpBbBZJk4OKUamIxn8rhEHSr9ZPovQp9PPdH1ANfr4qm7T29QWncz
	6Oatyqq6JXGmLJfXP/o8o+DPQu5tuoUKk313pM5y3OsbLM/mYfVkf/yf3RHGkf9/sX3JKolO
	+bbdUzI3+cuN63LMJjL/Jb3WfsryrudpZ3I40v2IR2tq79KgBYna6xW63qwW3jJl5vdXOSem
	Oee+ctnvvappV9OmvUdWt1xsXiKW8Hcyl+HHaD+j+7xthZePdb77817guPwKSX0rq93Cdcfv
	v3mtYBl/kk/r6+pXd/bsyivI7Os49vLS5fNi/FFq190N2SMMkiJkd0y4+enTkpmXnuhNaXt/
	o85p3oX30cdrw+oXbnp+/f0pizfxEzY9bmxWYinOSDTUYi4qTgQAgyanv/0CAAA=
X-CMS-MailID: 20250418061515epcas2p3d2dd703db7eb645f4866dcb01cc288fc
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
cpgsPolicy: CPGSC10-234,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250418061515epcas2p3d2dd703db7eb645f4866dcb01cc288fc
References: <20250418061500.1629200-1-shin.son@samsung.com>
	<CGME20250418061515epcas2p3d2dd703db7eb645f4866dcb01cc288fc@epcas2p3.samsung.com>

Add cpucl0 clock definitions.

Signed-off-by: Shin Son <shin.son@samsung.com>
---
 .../clock/samsung,exynosautov920-clock.yaml   | 25 +++++++++++++++++++
 .../clock/samsung,exynosautov920.h            | 19 ++++++++++++++
 2 files changed, 44 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/samsung,exynosautov920-clock.yaml b/Documentation/devicetree/bindings/clock/samsung,exynosautov920-clock.yaml
index 3330b2727474..d12b17c177df 100644
--- a/Documentation/devicetree/bindings/clock/samsung,exynosautov920-clock.yaml
+++ b/Documentation/devicetree/bindings/clock/samsung,exynosautov920-clock.yaml
@@ -8,6 +8,7 @@ title: Samsung ExynosAuto v920 SoC clock controller
 
 maintainers:
   - Sunyeal Hong <sunyeal.hong@samsung.com>
+  - Shin Son <shin.son@samsung.com>
   - Chanwoo Choi <cw00.choi@samsung.com>
   - Krzysztof Kozlowski <krzk@kernel.org>
   - Sylwester Nawrocki <s.nawrocki@samsung.com>
@@ -32,6 +33,7 @@ properties:
   compatible:
     enum:
       - samsung,exynosautov920-cmu-top
+      - samsung,exynosautov920-cmu-cpucl0
       - samsung,exynosautov920-cmu-peric0
       - samsung,exynosautov920-cmu-peric1
       - samsung,exynosautov920-cmu-misc
@@ -69,6 +71,29 @@ allOf:
           items:
             - const: oscclk
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - samsung,exynosautov920-cmu-cpucl0
+
+    then:
+      properties:
+        clocks:
+          items:
+            - description: External reference clock (38.4 MHz)
+            - description: CMU_CPUCL0 SWITCH clock (from CMU_TOP)
+            - description: CMU_CPUCL0 CLUSTER clock (from CMU_TOP)
+            - description: CMU_CPUCL0 DBG clock (from CMU_TOP)
+
+        clock-names:
+          items:
+            - const: oscclk
+            - const: switch
+            - const: cluster
+            - const: dbg
+
   - if:
       properties:
         compatible:
diff --git a/include/dt-bindings/clock/samsung,exynosautov920.h b/include/dt-bindings/clock/samsung,exynosautov920.h
index 0c681f2ba3d0..c57a1d749700 100644
--- a/include/dt-bindings/clock/samsung,exynosautov920.h
+++ b/include/dt-bindings/clock/samsung,exynosautov920.h
@@ -162,6 +162,25 @@
 #define DOUT_CLKCMU_TAA_NOC		146
 #define DOUT_TCXO_DIV2			147
 
+/* CMU_CPUCL0 */
+#define CLK_FOUT_CPUCL0_PLL		1
+
+#define CLK_MOUT_PLL_CPUCL0		2
+#define CLK_MOUT_CPUCL0_CLUSTER_USER	3
+#define CLK_MOUT_CPUCL0_DBG_USER	4
+#define CLK_MOUT_CPUCL0_SWITCH_USER	5
+#define CLK_MOUT_CPUCL0_CLUSTER		6
+#define CLK_MOUT_CPUCL0_CORE		7
+
+#define CLK_DOUT_CLUSTER0_ACLK		8
+#define CLK_DOUT_CLUSTER0_ATCLK		9
+#define CLK_DOUT_CLUSTER0_MPCLK		10
+#define CLK_DOUT_CLUSTER0_PCLK		11
+#define CLK_DOUT_CLUSTER0_PERIPHCLK	12
+#define CLK_DOUT_CPUCL0_DBG_NOC		13
+#define CLK_DOUT_CPUCL0_DBG_PCLKDBG	14
+#define CLK_DOUT_CPUCL0_NOCP		15
+
 /* CMU_PERIC0 */
 #define CLK_MOUT_PERIC0_IP_USER		1
 #define CLK_MOUT_PERIC0_NOC_USER	2
-- 
2.49.0

