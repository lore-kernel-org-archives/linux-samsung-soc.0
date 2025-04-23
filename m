Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44A0F265CA3
	for <linux-samsung-soc@vger.kernel.org>; Wed, 23 Apr 2025 04:42:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745383326; cv=none; b=a53kJ3v6nNszPz0ITUzgK89IH3OLqAetLFH1gP74GZR9cmPhywxte6onK8dUbcDnhCjy5IA++zbGyHr+iIZnTNt2NDSc2XIbeWFip3ebZ0rEb11lWAmEmUqLsg1lKJniR7Uk9cwz6pbxIgGdUIfjvv7nKnJi9MKy3juB9yhQmFU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745383326; c=relaxed/simple;
	bh=IvQVcaCNeJ4nb+2gCiM3YdZqB8O4DVkLizQpr4YXWp8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:MIME-Version:
	 Content-Type:References; b=FB9sQ7y2VQzT5SosdKOGB2nU966LsXc4XI/sn/SLXz+sVU/BeZXjjP/t/q3Fh/je6YJBtdgplYYbsLpdU6cyLfRCEtXRu9qArGDMxJha6HzD/rUSkv0v/lA7pbsqXdBFaB9V7rhKDTjNDJ5BU9af8ZEO57y/gPORYvfuzWTe1zM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=bGVrvnhV; arc=none smtp.client-ip=203.254.224.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="bGVrvnhV"
Received: from epcas2p4.samsung.com (unknown [182.195.41.56])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20250423044201epoutp02de16d8dfd85d4ea4426e5e786c7f1c06~42OIrLvnZ0604806048epoutp02I
	for <linux-samsung-soc@vger.kernel.org>; Wed, 23 Apr 2025 04:42:01 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20250423044201epoutp02de16d8dfd85d4ea4426e5e786c7f1c06~42OIrLvnZ0604806048epoutp02I
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1745383321;
	bh=MDU5mSwIENMROE2c/THRi1I4cLbBTvRapiEmlKn5+P0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=bGVrvnhVaO+A9rOaUbb/PVKNL4VaQkq7xEokIZazVMfCRi3nBXuz+jGwf+n7CotOJ
	 S3mshRiXZJDWn2yFzxYfNXxgYww6Bh90SJp9ASpg6/HMQ0RnjpoXt9tu/nr/f0F6n0
	 dkycplf2ZRe4rRh1bpPcvx2YVe+uCk6pQYPRt7JM=
Received: from epsnrtp04.localdomain (unknown [182.195.42.156]) by
	epcas2p1.samsung.com (KnoxPortal) with ESMTPS id
	20250423044200epcas2p16da050f303f2e1d9f40918334e3a36a3~42OH3N0Ed3184831848epcas2p1t;
	Wed, 23 Apr 2025 04:42:00 +0000 (GMT)
Received: from epcas2p2.samsung.com (unknown [182.195.36.98]) by
	epsnrtp04.localdomain (Postfix) with ESMTP id 4Zj5zr1fHtz6B9mD; Wed, 23 Apr
	2025 04:42:00 +0000 (GMT)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
	epcas2p2.samsung.com (KnoxPortal) with ESMTPA id
	20250423044159epcas2p26a4d07552b5646c7e076f3989d8ea354~42OG3BRZW3023630236epcas2p2C;
	Wed, 23 Apr 2025 04:41:59 +0000 (GMT)
Received: from epsmgmc1p1new.samsung.com (unknown [182.195.42.40]) by
	epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
	20250423044159epsmtrp2256fdcb9d71d512aee46cd285469b31f~42OG10lfz0544505445epsmtrp2N;
	Wed, 23 Apr 2025 04:41:59 +0000 (GMT)
X-AuditID: b6c32a28-460ee70000001e8a-0e-68086f97861e
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
	epsmgmc1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
	04.48.07818.79F68086; Wed, 23 Apr 2025 13:41:59 +0900 (KST)
Received: from localhost.localdomain (unknown [10.229.9.60]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20250423044159epsmtip1d13252d2ffa850de0665b63f037a8aa4~42OGgaocV1228512285epsmtip1c;
	Wed, 23 Apr 2025 04:41:59 +0000 (GMT)
From: Shin Son <shin.son@samsung.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, Sylwester Nawrocki
	<s.nawrocki@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar
	<alim.akhtar@samsung.com>, Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Sunyeal Hong <sunyeal.hong@samsung.com>
Cc: Shin Son <shin.son@samsung.com>, linux-samsung-soc@vger.kernel.org,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/3] dt-bindings: clock: exynosautov920: add cpucl0 clock
 definitions
Date: Wed, 23 Apr 2025 13:41:51 +0900
Message-ID: <20250423044153.1288077-2-shin.son@samsung.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250423044153.1288077-1-shin.son@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrNLMWRmVeSWpSXmKPExsWy7bCSnO70fI4Mg9sbxS0ezNvGZrFm7zkm
	i+tfnrNazD9yjtXi/PkN7BabHl9jtfjYc4/V4vKuOWwWM87vY7K4eMrV4v+eHewWh9+0s1r8
	u7aRxWLy8bWsFk3L1jM58Hu8v9HK7rFpVSebx+Yl9R59W1YxenzeJBfAGsVlk5Kak1mWWqRv
	l8CVsffcJ5aCqxIVEzeGNDAuF+5i5OSQEDCR2N98mKWLkYtDSGA3o0T7mQZGiISExOEZE6Bs
	YYn7LUdYIYreM0r0dK0G6uDgYBNQldj0Wx4kLiLwlkli+f8DTCANzAKnGSV2npEBsYUFIiQO
	3ACp5+RgAarvmbqTFcTmFbCWOLDvGivIHAkBeYn+DgmQMKeAjcTMhl1ge4WASiYv+cIGUS4o
	cXLmExaI8fISzVtnM09gFJiFJDULSWoBI9MqRsnUguLc9NxkwwLDvNRyveLE3OLSvHS95Pzc
	TYzg+NDS2MH47luT/iFGJg7GQ4wSHMxKIry/3NgzhHhTEiurUovy44tKc1KLDzFKc7AoifOu
	NIxIFxJITyxJzU5NLUgtgskycXBKNTAFzFnTFFdV0XM7udvBomTlrl6t6GtPbx1N97tka/Bt
	botFzYrLVl/K5fwT4l9+jFyTIXRqedIG4fPcGola9ZPLrSMZFj7/YdX2ZcNJWY+lN9bxnXQ8
	eS3GuOT+rVleu9vU5gsfKnp24m2nCb+vd+iTH/u6d4kHsKxxaLnzysOt6eXfCaszTx+ynnDh
	7rX7Ndm/002nHdF51/98drbv2xCdcPXs0PY/Dyu5q/RDDE/+4ZN+cK2u8/PeI4sibeeILvq8
	a//yF4Fud55sO+g5S1vGv2mTgtzlBYYbhR8tecnGXPh6dc1G/geTzHwSlklZ2FZtZ0yQqNS9
	uGDe2ktf33Nukuk1e3LMyWR3s4tql98lJZbijERDLeai4kQAceVmyf4CAAA=
X-CMS-MailID: 20250423044159epcas2p26a4d07552b5646c7e076f3989d8ea354
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
cpgsPolicy: CPGSC10-234,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250423044159epcas2p26a4d07552b5646c7e076f3989d8ea354
References: <20250423044153.1288077-1-shin.son@samsung.com>
	<CGME20250423044159epcas2p26a4d07552b5646c7e076f3989d8ea354@epcas2p2.samsung.com>

Add cpucl0 clock definitions.

CPUCL0 refers to CPU Cluster 0, which provide clock support
for the CPUs on Exynosauto V920 SoC.

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

