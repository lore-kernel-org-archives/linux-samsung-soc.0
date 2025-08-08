Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD906252900
	for <linux-samsung-soc@vger.kernel.org>; Fri,  8 Aug 2025 14:15:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754662546; cv=none; b=MAwoPzOYBvEaJ10UBxNv/x8NzgRsHsHLAEa7QsO2rQoRFMbJXfV3zqPSZTq/uPuGEpWBcav/5Vi0khNrhUhU/FBcyzJic0UUt1YygInCh97WHS3uKMTRGhYVGyJvWGFmxOIZnkx0UmQiQnNu/gCG/NEOK51gQWKMlB3682gy7zM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754662546; c=relaxed/simple;
	bh=fhGiiTHcd/L/fp2vOjOAA6fKenzCFD4fLb1Bk4W9xSE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:MIME-Version:
	 Content-Type:References; b=AbmbiwgApWcIyySijj54Ho9W3JYWmigdOYEjbDe/kKpCe12G6WvIEFaFJ/bI5HSN3D/Gy07iu9vfRLfTrQ25zDki32pgROrhjJGeJUfdEuEX5m/7BatbDVotM0OKb4827YqxIFwg7+DNUkWqRzQqNVqju7PmuC9elbvjbydvH7w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=r+RdHuCh; arc=none smtp.client-ip=203.254.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="r+RdHuCh"
Received: from epcas5p3.samsung.com (unknown [182.195.41.41])
	by mailout4.samsung.com (KnoxPortal) with ESMTP id 20250808141542epoutp04acaf9898a231e1417497ebf39b83e561~Z0EkVuzPy2291222912epoutp04R
	for <linux-samsung-soc@vger.kernel.org>; Fri,  8 Aug 2025 14:15:42 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20250808141542epoutp04acaf9898a231e1417497ebf39b83e561~Z0EkVuzPy2291222912epoutp04R
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1754662542;
	bh=N5Do/Zm0purz49bPXXww2B2dKStSKo6VERcXNpISwh8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=r+RdHuCh4Du6L6Of30SUKboyM/ys8Fz9v9qyqOQBqJR0uI8db+eWdZOqYjW5hwryf
	 7jelggVxjqHwnGlHuUjv0MdN8n2Em48xAs4qHKe/eefNKiAdoVE8ppyRSbz6NhwchP
	 PhOxR4MvS7cLoR0XXgqzLca4ZxH1RjWTpFjXnnAI=
Received: from epsnrtp03.localdomain (unknown [182.195.42.155]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPS id
	20250808141541epcas5p16bdc32bfcf909bbcec3badbd9deafcfb~Z0EjUcd3x0745607456epcas5p1M;
	Fri,  8 Aug 2025 14:15:41 +0000 (GMT)
Received: from epcas5p2.samsung.com (unknown [182.195.38.91]) by
	epsnrtp03.localdomain (Postfix) with ESMTP id 4bz5fN11d5z3hhT3; Fri,  8 Aug
	2025 14:15:40 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPA id
	20250808141241epcas5p268673ad83b4cadce6362c9184195ccad~Z0B8QJhk12375723757epcas5p2u;
	Fri,  8 Aug 2025 14:12:41 +0000 (GMT)
Received: from bose.samsungds.net (unknown [107.108.83.9]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20250808141239epsmtip2986bc0dd1556f165d6325d5feb382449~Z0B57XW1x1615716157epsmtip2N;
	Fri,  8 Aug 2025 14:12:39 +0000 (GMT)
From: Raghav Sharma <raghav.s@samsung.com>
To: krzk@kernel.org, s.nawrocki@samsung.com, cw00.choi@samsung.com,
	mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org,
	conor+dt@kernel.org, sunyeal.hong@samsung.com, shin.son@samsung.com,
	alim.akhtar@samsung.com
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, dev.tailor@samsung.com,
	chandan.vn@samsung.com, karthik.sun@samsung.com, raghav.s@samsung.com
Subject: [PATCH v1 1/3] dt-bindings: clock: exynosautov920: add m2m clock
 definitions
Date: Fri,  8 Aug 2025 19:51:44 +0530
Message-Id: <20250808142146.3181062-2-raghav.s@samsung.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250808142146.3181062-1-raghav.s@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250808141241epcas5p268673ad83b4cadce6362c9184195ccad
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-543,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250808141241epcas5p268673ad83b4cadce6362c9184195ccad
References: <20250808142146.3181062-1-raghav.s@samsung.com>
	<CGME20250808141241epcas5p268673ad83b4cadce6362c9184195ccad@epcas5p2.samsung.com>

Add device tree clock binding definitions for CMU_M2M

Signed-off-by: Raghav Sharma <raghav.s@samsung.com>
---
 .../clock/samsung,exynosautov920-clock.yaml   | 21 +++++++++++++++++++
 .../clock/samsung,exynosautov920.h            |  5 +++++
 2 files changed, 26 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/samsung,exynosautov920-clock.yaml b/Documentation/devicetree/bindings/clock/samsung,exynosautov920-clock.yaml
index 72f59db73f76..b2dfe6ed353a 100644
--- a/Documentation/devicetree/bindings/clock/samsung,exynosautov920-clock.yaml
+++ b/Documentation/devicetree/bindings/clock/samsung,exynosautov920-clock.yaml
@@ -38,6 +38,7 @@ properties:
       - samsung,exynosautov920-cmu-hsi0
       - samsung,exynosautov920-cmu-hsi1
       - samsung,exynosautov920-cmu-hsi2
+      - samsung,exynosautov920-cmu-m2m
       - samsung,exynosautov920-cmu-misc
       - samsung,exynosautov920-cmu-peric0
       - samsung,exynosautov920-cmu-peric1
@@ -226,6 +227,26 @@ allOf:
             - const: embd
             - const: ethernet
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: samsung,exynosautov920-cmu-m2m
+
+    then:
+      properties:
+        clocks:
+          items:
+            - description: External reference clock (38.4 MHz)
+            - description: CMU_M2M NOC clock (from CMU_TOP)
+            - description: CMU_M2M JPEG clock (from CMU_TOP)
+
+        clock-names:
+          items:
+            - const: oscclk
+            - const: noc
+            - const: jpeg
+
 required:
   - compatible
   - "#clock-cells"
diff --git a/include/dt-bindings/clock/samsung,exynosautov920.h b/include/dt-bindings/clock/samsung,exynosautov920.h
index 93e6233d1358..0342a988565a 100644
--- a/include/dt-bindings/clock/samsung,exynosautov920.h
+++ b/include/dt-bindings/clock/samsung,exynosautov920.h
@@ -295,4 +295,9 @@
 #define CLK_DOUT_HSI2_ETHERNET          6
 #define CLK_DOUT_HSI2_ETHERNET_PTP      7
 
+/* CMU_M2M */
+#define CLK_MOUT_M2M_JPEG_USER          1
+#define CLK_MOUT_M2M_NOC_USER           2
+#define CLK_DOUT_M2M_NOCP               3
+
 #endif /* _DT_BINDINGS_CLOCK_EXYNOSAUTOV920_H */
-- 
2.34.1

