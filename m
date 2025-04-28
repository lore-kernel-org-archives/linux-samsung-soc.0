Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E85625EFAA
	for <linux-samsung-soc@vger.kernel.org>; Mon, 28 Apr 2025 08:47:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745830058; cv=none; b=BRpf5glMyMs5ZSFE+5H7HybS/I9PZAC5LO0BzMwXLCOh51yFs80bDhC5pd9p8uZ09mKT6VXDuRhtKYYZLRxh/TeR+IsP6YSuE9KZSHQuiL0612TcBtHNCTIxrkzhb8YAO2mPpQjnTKvFIdhsWnlYbMahTziTeNCCD51zm1ax8xw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745830058; c=relaxed/simple;
	bh=8r8wfRjfrdF/yPEHXsQEmuaibcB3+yxNLXbxqOA5fvk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:MIME-Version:
	 Content-Type:References; b=LYIm+CaIaU2PkRHPuE4MtN+LjT7/V5C2i7aBUMYq7TZwAyoHeF5prmmbOS5zqHbweu7CUQf+zoLcqqcSIVsd/1HSjmWkDpPj+A7HpGTrpEX4iBNQIOWJDh6gZ/ibOriIK9I5CNFUJOkl8hgsViRUYKBPLJF+G/5jMxsv2KYfqOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=DJCyUBOR; arc=none smtp.client-ip=203.254.224.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="DJCyUBOR"
Received: from epcas2p2.samsung.com (unknown [182.195.41.54])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20250428084730epoutp0213651de4dd670c8d1ad269e258e827f8~6by5DTCuH0354703547epoutp02T
	for <linux-samsung-soc@vger.kernel.org>; Mon, 28 Apr 2025 08:47:30 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20250428084730epoutp0213651de4dd670c8d1ad269e258e827f8~6by5DTCuH0354703547epoutp02T
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1745830050;
	bh=QoLHO3NZ8rCIAR98kSnIlqa+IDRuSTF1aJXvuCF0QoI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=DJCyUBORRyMdGMvG69AU9hZxdEruCceJnKm7Iti4ydd8Myd9GcFPDAI7qekwG+Ws2
	 +mfoSiqJdcVFPG9JeigXakIENRg0oBhQRTrGYP69rTzwBwEbCmdf8RwNWp3qDEPWoJ
	 uEE/IyAnAZHZtwj4BVFtTeyp1uoBlXSccp7HZpV0=
Received: from epsnrtp03.localdomain (unknown [182.195.42.155]) by
	epcas2p3.samsung.com (KnoxPortal) with ESMTPS id
	20250428084729epcas2p35137e4bcf253f9e096fb3f5606f686e4~6by4jwZkH3025530255epcas2p3G;
	Mon, 28 Apr 2025 08:47:29 +0000 (GMT)
Received: from epcas2p4.samsung.com (unknown [182.195.36.100]) by
	epsnrtp03.localdomain (Postfix) with ESMTP id 4ZmHBn1Yllz3hhTF; Mon, 28 Apr
	2025 08:47:29 +0000 (GMT)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
	epcas2p3.samsung.com (KnoxPortal) with ESMTPA id
	20250428084728epcas2p34ffa0051a16c10ff1c358a98cc2c2fa4~6by3suCY13025530255epcas2p3D;
	Mon, 28 Apr 2025 08:47:28 +0000 (GMT)
Received: from epsmgmcp1.samsung.com (unknown [182.195.42.82]) by
	epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
	20250428084728epsmtrp174d195cdaba526ea41263bb1f6542b04~6by3rh5KQ2986529865epsmtrp1Y;
	Mon, 28 Apr 2025 08:47:28 +0000 (GMT)
X-AuditID: b6c32a52-40bff70000004c16-cc-680f40a03307
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
	epsmgmcp1.samsung.com (Symantec Messaging Gateway) with SMTP id
	E2.CF.19478.0A04F086; Mon, 28 Apr 2025 17:47:28 +0900 (KST)
Received: from localhost.localdomain (unknown [10.229.9.60]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20250428084728epsmtip141d3738578162e2eca70d97b76378d1b~6by3bPxOp1942219422epsmtip1G;
	Mon, 28 Apr 2025 08:47:28 +0000 (GMT)
From: Shin Son <shin.son@samsung.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, Sylwester Nawrocki
	<s.nawrocki@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar
	<alim.akhtar@samsung.com>, Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Sunyeal Hong <sunyeal.hong@samsung.com>
Cc: Shin Son <shin.son@samsung.com>, linux-samsung-soc@vger.kernel.org,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] dt-bindings: clock: exynosautov920: add cpucl1/2 clock
 definitions
Date: Mon, 28 Apr 2025 17:47:19 +0900
Message-ID: <20250428084721.3832664-2-shin.son@samsung.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250428084721.3832664-1-shin.son@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrOLMWRmVeSWpSXmKPExsWy7bCSnO4CB/4Mg/uTpC0ezNvGZrFm7zkm
	i+tfnrNazD9yjtXi/PkN7BabHl9jtfjYc4/V4vKuOWwWM87vY7K4eMrV4v+eHewWh9+0s1r8
	u7aRxWLy8bWsFk3L1jM58Hu8v9HK7rFpVSebx+Yl9R59W1YxenzeJBfAGsVlk5Kak1mWWqRv
	l8CV8e7RG/aC87IVjZe2sjYwHhLrYuTkkBAwkej+sJi5i5GLQ0hgO6NEY8djJoiEhMThGRMY
	IWxhifstR1ghit4zStyb3sfexcjBwSagKrHptzxIXETgLZPE8v8HwJqZBU4zSuw8IwNiCwuE
	S3y+f4MZxGYBqb+4jwXE5hWwlmibdoUNZI6EgLxEf4cESJhTwEbi/MVOsLAQUElfDzdEtaDE
	yZlPWCCmy0s0b53NPIFRYBaS1CwkqQWMTKsYRVMLinPTc5MLDPWKE3OLS/PS9ZLzczcxguNC
	K2gH47L1f/UOMTJxMB5ilOBgVhLhrTLgzxDiTUmsrEotyo8vKs1JLT7EKM3BoiTOq5zTmSIk
	kJ5YkpqdmlqQWgSTZeLglGpgCosTW+DWcrw1YPqBMzXrSmRy+f6lx9yXm7xUZ3PnR2eD20ob
	7k7+9uDF2wWSn1RnqbvtTzVqYtnsUvrtZNWsvU917Ex9LM7f+XtGwXnhrxue4VvesavvKnkp
	3vBe9bfc4nvLLlz4WHqt/C7DXL+jAk991L/HLsxVuiDv43NjTdlGnym+m18t15HRUZrfk67T
	9f+/VOOpTPmiq+fEX5puenKw97pwQ6beWcWSw3vrXs2NPFHHW9i34tGvKX7hV34fzMiwFK1i
	t/h6vOSksWPWHhWh4uvPln6ZxrpRRm9v28btr2S6+PPz7BeE5fy/FHVnn8uD4g/OH7av+tC3
	dt+DbRyXNi+LWfosVPrPxSTdCa+VWIozEg21mIuKEwHlZRX5+gIAAA==
X-CMS-MailID: 20250428084728epcas2p34ffa0051a16c10ff1c358a98cc2c2fa4
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
cpgsPolicy: CPGSC10-234,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250428084728epcas2p34ffa0051a16c10ff1c358a98cc2c2fa4
References: <20250428084721.3832664-1-shin.son@samsung.com>
	<CGME20250428084728epcas2p34ffa0051a16c10ff1c358a98cc2c2fa4@epcas2p3.samsung.com>

Add cpucl1 and cpucl2 clock definitions.

CPUCL1/2 refer to CPU Cluster 1 and CPU Cluster 2,
which provide clock support for the CPUs on Exynosauto V920 SoC.

Signed-off-by: Shin Son <shin.son@samsung.com>
---
 .../clock/samsung,exynosautov920-clock.yaml   | 45 +++++++++++++++++++
 .../clock/samsung,exynosautov920.h            | 32 +++++++++++++
 2 files changed, 77 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/samsung,exynosautov920-clock.yaml b/Documentation/devicetree/bindings/clock/samsung,exynosautov920-clock.yaml
index d12b17c177df..dbeae0cb0cb9 100644
--- a/Documentation/devicetree/bindings/clock/samsung,exynosautov920-clock.yaml
+++ b/Documentation/devicetree/bindings/clock/samsung,exynosautov920-clock.yaml
@@ -34,6 +34,8 @@ properties:
     enum:
       - samsung,exynosautov920-cmu-top
       - samsung,exynosautov920-cmu-cpucl0
+      - samsung,exynosautov920-cmu-cpucl1
+      - samsung,exynosautov920-cmu-cpucl2
       - samsung,exynosautov920-cmu-peric0
       - samsung,exynosautov920-cmu-peric1
       - samsung,exynosautov920-cmu-misc
@@ -94,6 +96,49 @@ allOf:
             - const: cluster
             - const: dbg
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - samsung,exynosautov920-cmu-cpucl1
+
+    then:
+      properties:
+        clocks:
+          items:
+            - description: External reference clock (38.4 MHz)
+            - description: CMU_CPUCL1 SWITCH clock (from CMU_TOP)
+            - description: CMU_CPUCL1 CLUSTER clock (from CMU_TOP)
+
+        clock-names:
+          items:
+            - const: oscclk
+            - const: switch
+            - const: cluster
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - samsung,exynosautov920-cmu-cpucl2
+
+    then:
+      properties:
+        clocks:
+          items:
+            - description: External reference clock (38.4 MHz)
+            - description: CMU_CPUCL2 SWITCH clock (from CMU_TOP)
+            - description: CMU_CPUCL2 CLUSTER clock (from CMU_TOP)
+
+        clock-names:
+          items:
+            - const: oscclk
+            - const: switch
+            - const: cluster
+
+
   - if:
       properties:
         compatible:
diff --git a/include/dt-bindings/clock/samsung,exynosautov920.h b/include/dt-bindings/clock/samsung,exynosautov920.h
index c57a1d749700..5e6896e9627f 100644
--- a/include/dt-bindings/clock/samsung,exynosautov920.h
+++ b/include/dt-bindings/clock/samsung,exynosautov920.h
@@ -181,6 +181,38 @@
 #define CLK_DOUT_CPUCL0_DBG_PCLKDBG	14
 #define CLK_DOUT_CPUCL0_NOCP		15
 
+/* CMU_CPUCL1 */
+#define CLK_FOUT_CPUCL1_PLL		1
+
+#define CLK_MOUT_PLL_CPUCL1		2
+#define CLK_MOUT_CPUCL1_CLUSTER_USER	3
+#define CLK_MOUT_CPUCL1_SWITCH_USER	4
+#define CLK_MOUT_CPUCL1_CLUSTER		5
+#define CLK_MOUT_CPUCL1_CORE		6
+
+#define CLK_DOUT_CLUSTER1_ACLK		7
+#define CLK_DOUT_CLUSTER1_ATCLK		8
+#define CLK_DOUT_CLUSTER1_MPCLK		9
+#define CLK_DOUT_CLUSTER1_PCLK		10
+#define CLK_DOUT_CLUSTER1_PERIPHCLK	11
+#define CLK_DOUT_CPUCL1_NOCP		12
+
+/* CMU_CPUCL2 */
+#define CLK_FOUT_CPUCL2_PLL		1
+
+#define CLK_MOUT_PLL_CPUCL2		2
+#define CLK_MOUT_CPUCL2_CLUSTER_USER	3
+#define CLK_MOUT_CPUCL2_SWITCH_USER	4
+#define CLK_MOUT_CPUCL2_CLUSTER		5
+#define CLK_MOUT_CPUCL2_CORE		6
+
+#define CLK_DOUT_CLUSTER2_ACLK		7
+#define CLK_DOUT_CLUSTER2_ATCLK		8
+#define CLK_DOUT_CLUSTER2_MPCLK		9
+#define CLK_DOUT_CLUSTER2_PCLK		10
+#define CLK_DOUT_CLUSTER2_PERIPHCLK	11
+#define CLK_DOUT_CPUCL2_NOCP		12
+
 /* CMU_PERIC0 */
 #define CLK_MOUT_PERIC0_IP_USER		1
 #define CLK_MOUT_PERIC0_NOC_USER	2
-- 
2.49.0

