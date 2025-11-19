Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96DDA3559CA
	for <linux-samsung-soc@vger.kernel.org>; Wed, 19 Nov 2025 11:39:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763552375; cv=none; b=sGc26hQVLnV1My3kMiRBvNr4UKNRofJHJOEyaMzXFIJIYpW2oB/21CxD3fRrk4y8z4XucBjcwWz7psbrD3cW6lNu9AcNFbR93KjODutGu0inQtDi8ebHQoDlcSPsDhuv0X6TaSNDrZXiP5eaKOoaOx4WYLwk8zftjSDdTMHjxzY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763552375; c=relaxed/simple;
	bh=Vm3wXIL/OgSlT+Ejd1rArBeffI5yG2eybK9CCw396w0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:MIME-Version:
	 Content-Type:References; b=ZWPw2YVCzw4O+RgNEF8eLA7EYl7E251ge2aBwzcMAP7waS3Xt3HzJNdrc+SVgBlHT1Uh9AbBQ7L8tvqgi4cQa2Cctwd0/zFOAHkHeviCCcgUaMioyaNeEc3hXmsr7GkbO/QA+xzUcR18swiJnQzUHnmhsSlKV+sKzRENyMhNlks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=m2wfxYEj; arc=none smtp.client-ip=203.254.224.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="m2wfxYEj"
Received: from epcas5p1.samsung.com (unknown [182.195.41.39])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20251119113930epoutp02fb5b1962f8dda00c737f01de15f4ce66~5ZYmLQdK71279012790epoutp02g
	for <linux-samsung-soc@vger.kernel.org>; Wed, 19 Nov 2025 11:39:30 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20251119113930epoutp02fb5b1962f8dda00c737f01de15f4ce66~5ZYmLQdK71279012790epoutp02g
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1763552370;
	bh=TLF10e2j/z2SjQNh8+kfz89LXpAX9SXlv2XfZ9bKsfo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=m2wfxYEjuR4l5JvCrGjfnFIvJXAwwc74X6kgzmIOVx+h1cDBS5b7/ueT5YT0RQbU+
	 fItw9byh+S33ACqS/CkSDxODcWdzSKmNdmvLNI+sUuyIl+QtWuVZ3S0nxG1FFbut6A
	 S+pvrcpFzHDYjBPbnT8orb2wGcMN2diTw8hOSySI=
Received: from epsnrtp04.localdomain (unknown [182.195.42.156]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPS id
	20251119113930epcas5p4c6a8a20a32b2213c65c36df1a7c6c16a~5ZYlwHsHn2804328043epcas5p4L;
	Wed, 19 Nov 2025 11:39:30 +0000 (GMT)
Received: from epcas5p2.samsung.com (unknown [182.195.38.86]) by
	epsnrtp04.localdomain (Postfix) with ESMTP id 4dBKJd0gxNz6B9m5; Wed, 19 Nov
	2025 11:39:29 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPA id
	20251119113927epcas5p15154cb4a7824e9ca65ac18842b68d785~5ZYjy29T80615006150epcas5p1b;
	Wed, 19 Nov 2025 11:39:27 +0000 (GMT)
Received: from bose.samsungds.net (unknown [107.108.83.9]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20251119113922epsmtip164b1776603420273aa4d0fbb8ac05af6~5ZYe86RhQ0223102231epsmtip1g;
	Wed, 19 Nov 2025 11:39:22 +0000 (GMT)
From: Raghav Sharma <raghav.s@samsung.com>
To: krzk@kernel.org, s.nawrocki@samsung.com, cw00.choi@samsung.com,
	alim.akhtar@samsung.com, mturquette@baylibre.com, sboyd@kernel.org,
	robh@kernel.org, conor+dt@kernel.org, sunyeal.hong@samsung.com,
	shin.son@samsung.com
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, chandan.vn@samsung.com,
	dev.tailor@samsung.com, karthik.sun@samsung.com, Raghav Sharma
	<raghav.s@samsung.com>
Subject: [PATCH 1/3] dt-bindings: clock: exynosautov920: add MFD clock
 definitions
Date: Wed, 19 Nov 2025 17:17:42 +0530
Message-Id: <20251119114744.1914416-2-raghav.s@samsung.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251119114744.1914416-1-raghav.s@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20251119113927epcas5p15154cb4a7824e9ca65ac18842b68d785
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-543,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20251119113927epcas5p15154cb4a7824e9ca65ac18842b68d785
References: <20251119114744.1914416-1-raghav.s@samsung.com>
	<CGME20251119113927epcas5p15154cb4a7824e9ca65ac18842b68d785@epcas5p1.samsung.com>

Add device tree clock binding definitions for CMU_MFD

Signed-off-by: Raghav Sharma <raghav.s@samsung.com>
---
 .../clock/samsung,exynosautov920-clock.yaml   | 19 +++++++++++++++++++
 .../clock/samsung,exynosautov920.h            |  4 ++++
 2 files changed, 23 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/samsung,exynosautov920-clock.yaml b/Documentation/devicetree/bindings/clock/samsung,exynosautov920-clock.yaml
index 5bf905f88a1a..1318720193b3 100644
--- a/Documentation/devicetree/bindings/clock/samsung,exynosautov920-clock.yaml
+++ b/Documentation/devicetree/bindings/clock/samsung,exynosautov920-clock.yaml
@@ -40,6 +40,7 @@ properties:
       - samsung,exynosautov920-cmu-hsi2
       - samsung,exynosautov920-cmu-m2m
       - samsung,exynosautov920-cmu-mfc
+      - samsung,exynosautov920-cmu-mfd
       - samsung,exynosautov920-cmu-misc
       - samsung,exynosautov920-cmu-peric0
       - samsung,exynosautov920-cmu-peric1
@@ -268,6 +269,24 @@ allOf:
             - const: mfc
             - const: wfd
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: samsung,exynosautov920-cmu-mfd
+
+    then:
+      properties:
+        clocks:
+          items:
+            - description: External reference clock (38.4 MHz)
+            - description: CMU_MFD NOC clock (from CMU_TOP)
+
+        clock-names:
+          items:
+            - const: oscclk
+            - const: noc
+
 required:
   - compatible
   - "#clock-cells"
diff --git a/include/dt-bindings/clock/samsung,exynosautov920.h b/include/dt-bindings/clock/samsung,exynosautov920.h
index 970d05167fc6..06dec27a8c77 100644
--- a/include/dt-bindings/clock/samsung,exynosautov920.h
+++ b/include/dt-bindings/clock/samsung,exynosautov920.h
@@ -305,4 +305,8 @@
 #define CLK_MOUT_MFC_WFD_USER           2
 #define CLK_DOUT_MFC_NOCP               3
 
+/* CMU_MFD */
+#define CLK_MOUT_MFD_NOC_USER           1
+#define CLK_DOUT_MFD_NOCP               2
+
 #endif /* _DT_BINDINGS_CLOCK_EXYNOSAUTOV920_H */
-- 
2.34.1

