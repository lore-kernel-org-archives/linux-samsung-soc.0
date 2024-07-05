Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68AAF1755A
	for <linux-samsung-soc@vger.kernel.org>; Fri,  5 Jul 2024 02:11:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720145521; cv=none; b=iqs9/oZF+bzvvn2F0kjdFqEfOEuBguVXD6RAUC3Wy0gBjqRVh6dbKYDA59ZsrDmETdxsflRGqyVO2D/pIRiqscAluNDK2XNp55qXsVStr2gMKbQs4OLQJtf4dXnyaVTY0VHeVb2mrfJzTywEVUlPWQ4ASYIUlx22RXf4wes0OrM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720145521; c=relaxed/simple;
	bh=mTNdOpX/ytgk0ejsL5C4DYmcHv/Hku0Akw5dhuTXx1Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:MIME-Version:
	 Content-Type:References; b=EmREXqvegOOEUe3V7ujzydC5mEfQepGDb5BazuVqgX6aG8o1W5jktm/94Pp/28CGujh5PwPyNGVqRMb5YC7eVHKCZCMcxyaQnr+095F4krzVRitO+S0HSHbmogEwfjmQj0iyri3xWuKrXvczsKMP1ZCTHUDU7VnNTMt6wKj8Vd0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=Orfjmv+d; arc=none smtp.client-ip=203.254.224.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="Orfjmv+d"
Received: from epcas2p2.samsung.com (unknown [182.195.41.54])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20240705021151epoutp02893a7f45b82bc49e33581998a118f5c3~fLzqkUhMY2733927339epoutp02y
	for <linux-samsung-soc@vger.kernel.org>; Fri,  5 Jul 2024 02:11:51 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20240705021151epoutp02893a7f45b82bc49e33581998a118f5c3~fLzqkUhMY2733927339epoutp02y
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1720145511;
	bh=GxEmpKevi0qgflg9bbKS+JNnAvxk/Z0OZhTmXnuFcHM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Orfjmv+d6AdL9hjDWTeX0WUhbgDSuje/3uMoKMGWyd7I9kItitkvB3X4kDVDZtrcb
	 LukuMPueWqJMCCfIZFKJl4yerslwgHLBMuFYNqqO3g1M38Kc9lzuXpRRWE459603oL
	 HE3mMfxWRjDQEeEMmJrXFZhPfZPyznB1g1yORRiI=
Received: from epsnrtp4.localdomain (unknown [182.195.42.165]) by
	epcas2p4.samsung.com (KnoxPortal) with ESMTP id
	20240705021150epcas2p423d2871a2f34e1c5c9ce42f0eae32ac4~fLzqA-P2x3136231362epcas2p4u;
	Fri,  5 Jul 2024 02:11:50 +0000 (GMT)
Received: from epsmges2p3.samsung.com (unknown [182.195.36.88]) by
	epsnrtp4.localdomain (Postfix) with ESMTP id 4WFcTL37HYz4x9Pq; Fri,  5 Jul
	2024 02:11:50 +0000 (GMT)
Received: from epcas2p1.samsung.com ( [182.195.41.53]) by
	epsmges2p3.samsung.com (Symantec Messaging Gateway) with SMTP id
	6D.75.09806.56657866; Fri,  5 Jul 2024 11:11:49 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
	epcas2p2.samsung.com (KnoxPortal) with ESMTPA id
	20240705021148epcas2p2f460d561d647a3f02ee01b3ad8979706~fLzn-Yx-p2224522245epcas2p29;
	Fri,  5 Jul 2024 02:11:48 +0000 (GMT)
Received: from epsmgmcp1.samsung.com (unknown [182.195.42.82]) by
	epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
	20240705021148epsmtrp1bed0a783b7a1254573e3f1cf914debfb~fLzn_ug2f0594305943epsmtrp1O;
	Fri,  5 Jul 2024 02:11:48 +0000 (GMT)
X-AuditID: b6c32a47-c6bff7000000264e-9c-668756653704
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
	epsmgmcp1.samsung.com (Symantec Messaging Gateway) with SMTP id
	BC.0A.18846.46657866; Fri,  5 Jul 2024 11:11:48 +0900 (KST)
Received: from localhost.localdomain (unknown [10.229.9.60]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20240705021148epsmtip259ebb9eb5b4d96fdc05362d463135943~fLzn0Y82H0030900309epsmtip20;
	Fri,  5 Jul 2024 02:11:48 +0000 (GMT)
From: Sunyeal Hong <sunyeal.hong@samsung.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, Sylwester Nawrocki
	<s.nawrocki@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar
	<alim.akhtar@samsung.com>, Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, Sunyeal Hong <sunyeal.hong@samsung.com>
Subject: [PATCH 1/5] dt-bindings: clock: add Exynos Auto v920 SoC CMU
 bindings
Date: Fri,  5 Jul 2024 11:11:06 +0900
Message-ID: <20240705021110.2495344-2-sunyeal.hong@samsung.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240705021110.2495344-1-sunyeal.hong@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprKJsWRmVeSWpSXmKPExsWy7bCmqW5qWHuawbkFmhYP5m1js7j+5Tmr
	xfnzG9gtPvbcY7W4vGsOm8WM8/uYLC6ecrU4/Kad1eLftY0sFk3L1jM5cHm8v9HK7rFpVSeb
	R9+WVYwenzfJBbBEZdtkpCampBYppOYl56dk5qXbKnkHxzvHm5oZGOoaWlqYKynkJeam2iq5
	+AToumXmAN2jpFCWmFMKFApILC5W0rezKcovLUlVyMgvLrFVSi1IySkwL9ArTswtLs1L18tL
	LbEyNDAwMgUqTMjOuHZoJ1NBn3zF7zknmBsYF4p3MXJySAiYSGx/cICli5GLQ0hgB6NEz85b
	rBDOJ0aJfVuPs8A5a66tYu9i5ABreXYzCiK+k1Fix6U/bBDOR0aJrft3MYIUsQnoSvz55wAS
	FxH4zijR/3Yf2CRmgU5GiatHtzOBLBcWCJDY/2ovE0gDi4CqRO/iMJAwr4C9xPn/21gh7pOX
	uLjmORuIzSngIPH8yAFWiBpBiZMzn7CA2MxANc1bZzODzJcQ+Mou8WvCPzaIZheJo70rWCBs
	YYlXx7ewQ9hSEi/726DsfInJ198yQTQ3MEpc+9fNDJGwl1h05ifYy8wCmhLrd+lDfK8sceQW
	1F4+iY7Df6GBwivR0SYE0agm8enKZaghMhLHTjyDsj0kpu9dAA3dyYwStxuesE1gVJiF5J1Z
	SN6ZhbB4ASPzKkax1ILi3PTUYqMCY3gMJ+fnbmIEp08t9x2MM95+0DvEyMTBeIhRgoNZSYRX
	6n1zmhBvSmJlVWpRfnxRaU5q8SFGU2BYT2SWEk3OBybwvJJ4QxNLAxMzM0NzI1MDcyVx3nut
	c1OEBNITS1KzU1MLUotg+pg4OKUamNhMfRl3TFJxCF+eePeenNUq1dkTGWcVRf9YJ7FjrZh0
	/zoVod+BG84c4vyZtfGs7S+vRbNM52WHzwl7yln8+7uWRtIqu3cLPPbIOXw7uNdBj01YMmwS
	wwqmSHnWGUcO8Fl2zoqc1TSXPZm7zCDsZkAIy8QXh4p37/25ujbDcXOQzyuPzg+3vtfYlHxf
	7yjCurh8negGuTNW34UTjOR+zr2xm0XhzWYRyT3clsmqrwTtAk8+P7s77mlSkfUBwXeVuqyd
	MhtdM+dnzfoafExMI3a7lJVUzhmn1mW9nndXGQg9cpjtcHKChShndliSxqmZU9ibhEx61GT+
	BlXN4WI+uerLpBN/5HJ7myxOfv3QqcRSnJFoqMVcVJwIAADVj44oBAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrNLMWRmVeSWpSXmKPExsWy7bCSvG5KWHuawZOPuhYP5m1js7j+5Tmr
	xfnzG9gtPvbcY7W4vGsOm8WM8/uYLC6ecrU4/Kad1eLftY0sFk3L1jM5cHm8v9HK7rFpVSeb
	R9+WVYwenzfJBbBEcdmkpOZklqUW6dslcGVcO7STqaBPvuL3nBPMDYwLxbsYOTgkBEwknt2M
	6mLk4hAS2M4o0b9zD1sXIydQXEZiY8N/dghbWOJ+yxFWiKL3jBJrt+5iBGlmE9CV+PPPASQu
	IvCbUeLH3u+MIA6zQC+jxJ3b/5hAuoUF/CSmfl3LBtLAIqAq0bs4DCTMK2Avcf7/NlaIBfIS
	F9c8B1vMKeAg8fzIAbC4EFBN17KbLBD1ghInZz4Bs5mB6pu3zmaewCgwC0lqFpLUAkamVYyi
	qQXFuem5yQWGesWJucWleel6yfm5mxjB4a0VtINx2fq/eocYmTgYDzFKcDArifBKvW9OE+JN
	SaysSi3Kjy8qzUktPsQozcGiJM6rnNOZIiSQnliSmp2aWpBaBJNl4uCUamBivsyy+ezm8CNn
	q3Ye6D+Uw37lr1PT/ea/07+f4S47LHlE9NuSJWbiC2efL3Bm6Iuee7HadvuKw2J6EYsU13Zm
	3hLZ23Wjy1CWQ+TchM8RFVvn3/j0X7Ylo0g77cMkO9avV0xvnH2WvnZvytnolv8BLtyneOfO
	9wtV+RXCzHHzqXixibx7xf7GQwX7Nd9fEDjb2dEXMGH7mdulwpWnmSX6qn8mbj/TKNz/K1S6
	NYJbir8uKvdP3C9PM6WHJZuFJs2fzfrVhcWbU2hxV4HKzb1mNuKZTL5WS64sNXrmYySqUzX/
	oHOEu2E+//rzgV31Fq9Pzr2m2e2YGnL2P9+Ez9Xb8sIfZ0TWHuoqWFC9QESJpTgj0VCLuag4
	EQB1WBKx3gIAAA==
X-CMS-MailID: 20240705021148epcas2p2f460d561d647a3f02ee01b3ad8979706
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20240705021148epcas2p2f460d561d647a3f02ee01b3ad8979706
References: <20240705021110.2495344-1-sunyeal.hong@samsung.com>
	<CGME20240705021148epcas2p2f460d561d647a3f02ee01b3ad8979706@epcas2p2.samsung.com>

Add dt-schema for Exynos Auto v920 SoC clock controller.

Signed-off-by: Sunyeal Hong <sunyeal.hong@samsung.com>
---
 .../clock/samsung,exynosautov920-clock.yaml   | 115 ++++++++++++++++++
 1 file changed, 115 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/samsung,exynosautov920-clock.yaml

diff --git a/Documentation/devicetree/bindings/clock/samsung,exynosautov920-clock.yaml b/Documentation/devicetree/bindings/clock/samsung,exynosautov920-clock.yaml
new file mode 100644
index 000000000000..3e5e408c8336
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/samsung,exynosautov920-clock.yaml
@@ -0,0 +1,115 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/samsung,exynosautov920-clock.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Samsung Exynos Auto v920 SoC clock controller
+
+maintainers:
+  - Sunyeal Hong <sunyeal.hong@samsung.com>
+  - Chanwoo Choi <cw00.choi@samsung.com>
+  - Krzysztof Kozlowski <krzk@kernel.org>
+  - Sylwester Nawrocki <s.nawrocki@samsung.com>
+
+description: |
+  Exynos Auto v920 clock controller is comprised of several CMU units, generating
+  clocks for different domains. Those CMU units are modeled as separate device
+  tree nodes, and might depend on each other. Root clocks in that clock tree are
+  two external clocks:: OSCCLK/XTCXO (38.4 MHz) and RTCCLK/XrtcXTI (32768 Hz).
+  The external OSCCLK must be defined as fixed-rate clock in dts.
+
+  CMU_TOP is a top-level CMU, where all base clocks are prepared using PLLs and
+  dividers; all other clocks of function blocks (other CMUs) are usually
+  derived from CMU_TOP.
+
+  Each clock is assigned an identifier and client nodes can use this identifier
+  to specify the clock which they consume. All clocks available for usage
+  in clock consumer nodes are defined as preprocessor macros in
+  'include/dt-bindings/clock/samsung,exynosautov920.h' header.
+
+properties:
+  compatible:
+    enum:
+      - samsung,exynosautov920-cmu-top
+      - samsung,exynosautov920-cmu-peric0
+
+  clocks:
+    minItems: 1
+    maxItems: 3
+
+  clock-names:
+    minItems: 1
+    maxItems: 3
+
+  "#clock-cells":
+    const: 1
+
+  reg:
+    maxItems: 1
+
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: samsung,exynosautov920-cmu-top
+
+    then:
+      properties:
+        clocks:
+          items:
+            - description: External reference clock (38.4 MHz)
+
+        clock-names:
+          items:
+            - const: oscclk
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: samsung,exynosautov920-cmu-peric0
+
+    then:
+      properties:
+        clocks:
+          items:
+            - description: External reference clock (38.4 MHz)
+            - description: CMU_PERIC0 NOC clock (from CMU_TOP)
+            - description: CMU_PERIC0 IP clock (from CMU_TOP)
+
+        clock-names:
+          items:
+            - const: oscclk
+            - const: dout_clkcmu_peric0_noc
+            - const: dout_clkcmu_peric0_ip
+
+required:
+  - compatible
+  - "#clock-cells"
+  - clocks
+  - clock-names
+  - reg
+
+additionalProperties: false
+
+examples:
+  # Clock controller node for CMU_PERIC0
+  - |
+    #include <dt-bindings/clock/samsung,exynosautov920.h>
+
+    cmu_peric0: clock-controller@10800000 {
+        compatible = "samsung,exynosautov920-cmu-peric0";
+        reg = <0x10800000 0x8000>;
+        #clock-cells = <1>;
+
+        clocks = <&xtcxo>,
+                 <&cmu_top DOUT_CLKCMU_PERIC0_NOC>,
+                 <&cmu_top DOUT_CLKCMU_PERIC0_IP>;
+        clock-names = "oscclk",
+                      "dout_clkcmu_peric0_noc",
+                      "dout_clkcmu_peric0_ip";
+    };
+
+...
-- 
2.43.2

