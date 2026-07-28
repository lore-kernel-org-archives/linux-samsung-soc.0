Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBD2742FCB1
	for <linux-samsung-soc@vger.kernel.org>; Tue, 28 Jul 2026 11:53:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785239606; cv=none; b=iz/zwh8FxNNOq2xHcWDOLR15Fk7u3El13OV3MLkaquBo5rAvcnVcGH3l5kUDbw3Cka/jBBmiTsiM2lJZePIbPfrp8Hq27G15UpGS+zfUJ1wSYUTjrl2WuSbkG1UGLfAMERVyBstNRJQIjap2s/+EmYplqsxS68fF+issPXwj+ME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785239606; c=relaxed/simple;
	bh=oDFVnLnOk4NoeEueaShhwgOXJqii1V11KswfmdPbc1k=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:MIME-Version:
	 Content-Type:References; b=fXqkPVRZhwnnX6hC37NA0n5z98jRp6uPnKcA+6+8yChcEwdtHuV8eBHV23BFg/xW+2k6El7GC3u7iqOxzF74wxxi2RrbViX2rtFHtWBMJDYYGVtHjPrpJtjqYgOYeZ0NlXB8lj9oMb2fu8U6wgAJpM8CIxUhSaO5/SUyG9IyM8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=CbOwTmlW; arc=none smtp.client-ip=203.254.224.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="CbOwTmlW"
Received: from epcas5p1.samsung.com (unknown [182.195.41.39])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20260728115323epoutp02bbdedb0e4b75b97d4bd9b0c0fc049e7b~GcfXcHJo12459424594epoutp02N
	for <linux-samsung-soc@vger.kernel.org>; Tue, 28 Jul 2026 11:53:23 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20260728115323epoutp02bbdedb0e4b75b97d4bd9b0c0fc049e7b~GcfXcHJo12459424594epoutp02N
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1785239603;
	bh=wgghNJb4FIzMo8iXgaQHJ4yIVaJ5druGQmkTmZ8wZ00=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=CbOwTmlWntUKPhBuqjyIwHP1sSZjsDOVVBucrNuga22gmzY8RrozFEw+MyeH/DJ0Y
	 bHRHBnriA90YHq/OCaOYd6Gl/TtOmWS4i9OFJC56FlWTOd8yUJHqR65cAaiieF8Hgk
	 0Y/B5umfVQwzxhto/rq+frGfd36quu/SAJ9A91co=
Received: from epsnrtp02.localdomain (unknown [182.195.42.154]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPS id
	20260728115322epcas5p4ec3601f04170b70e16419bc805835c36~GcfW5A8Kw2034920349epcas5p4B;
	Tue, 28 Jul 2026 11:53:22 +0000 (GMT)
Received: from epcas5p1.samsung.com (unknown [182.195.38.90]) by
	epsnrtp02.localdomain (Postfix) with ESMTP id 4h8Ykn3VkNz2SSKY; Tue, 28 Jul
	2026 11:53:21 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPA id
	20260728115320epcas5p2513ae3cae8e7919a178d6b34bb206c2b~GcfVaJYVm0514205142epcas5p2m;
	Tue, 28 Jul 2026 11:53:20 +0000 (GMT)
Received: from bose.samsungds.net (unknown [107.108.83.9]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20260728115318epsmtip13512e1b28cb5d6255c66336037162527~GcfS1Qv8Z2235622356epsmtip1h;
	Tue, 28 Jul 2026 11:53:17 +0000 (GMT)
From: "raghav.s" <raghav.s@samsung.com>
To: krzk@kernel.org, s.nawrocki@samsung.com, cw00.choi@samsung.com,
	peter.griffin@linaro.org, alim.akhtar@samsung.com, mturquette@baylibre.com,
	sboyd@kernel.org, bmasney@redhat.com, robh@kernel.org, conor+dt@kernel.org
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, hajun.sung@samsung.com, raghav.s@samsung.com,
	is.gandhi@samsung.com, ts.amit@samsung.com, pokala.reddy@samsung.com
Subject: [PATCH 11/13] dt-bindings: clock: exynos8855: add usb clock
 definitions
Date: Tue, 28 Jul 2026 17:41:09 +0530
Message-Id: <20260728121111.2077860-12-raghav.s@samsung.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260728121111.2077860-1-raghav.s@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20260728115320epcas5p2513ae3cae8e7919a178d6b34bb206c2b
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-543,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20260728115320epcas5p2513ae3cae8e7919a178d6b34bb206c2b
References: <20260728121111.2077860-1-raghav.s@samsung.com>
	<CGME20260728115320epcas5p2513ae3cae8e7919a178d6b34bb206c2b@epcas5p2.samsung.com>

Add device tree clock binding definitions for CMU_USB

Signed-off-by: raghav.s <raghav.s@samsung.com>
---
 .../clock/samsung,exynos8855-clock.yaml       | 21 +++++++++++++++++++
 .../dt-bindings/clock/samsung,exynos8855.h    | 12 +++++++++++
 2 files changed, 33 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/samsung,exynos8855-clock.yaml b/Documentation/devicetree/bindings/clock/samsung,exynos8855-clock.yaml
index e97b65f8be5f..736d3429bf4c 100644
--- a/Documentation/devicetree/bindings/clock/samsung,exynos8855-clock.yaml
+++ b/Documentation/devicetree/bindings/clock/samsung,exynos8855-clock.yaml
@@ -32,6 +32,7 @@ properties:
       - samsung,exynos8855-cmu-peric
       - samsung,exynos8855-cmu-peris
       - samsung,exynos8855-cmu-top
+      - samsung,exynos8855-cmu-usb
 
   clocks:
     minItems: 1
@@ -126,6 +127,26 @@ allOf:
           items:
             - const: oscclk
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: samsung,exynos8855-cmu-usb
+
+    then:
+      properties:
+        clocks:
+          items:
+            - description: External reference clock (76.8 MHz)
+            - description: CMU_USB NOC clock (from CMU_TOP)
+            - description: CMU_USB USB20DRD clock (from CMU_TOP)
+
+        clock-names:
+          items:
+            - const: oscclk
+            - const: bus
+            - const: usb20drd
+
 required:
   - compatible
   - "#clock-cells"
diff --git a/include/dt-bindings/clock/samsung,exynos8855.h b/include/dt-bindings/clock/samsung,exynos8855.h
index 44484a9d67f5..bf76464298d2 100644
--- a/include/dt-bindings/clock/samsung,exynos8855.h
+++ b/include/dt-bindings/clock/samsung,exynos8855.h
@@ -59,6 +59,10 @@
 #define CLKCMU_MOUT_HSI_UFS_EMBD           47
 #define CLKCMU_DOUT_HSI_NOC                48
 #define CLKCMU_DOUT_HSI_UFS_EMBD           49
+#define CLKCMU_MOUT_USB_NOC                50
+#define CLKCMU_MOUT_USB_USB20DRD           51
+#define CLKCMU_DOUT_USB_NOC                52
+#define CLKCMU_DOUT_USB_USB20DRD           53
 
 /* CMU_PERIC */
 #define CLK_MOUT_PERIC_IP_USER             1
@@ -105,4 +109,12 @@
 #define CLK_GOUT_CMU_HSI_IPCLKPORT_PCLK    3
 #define CLK_GOUT_SYSREG_HSI_IPCLKPORT_PCLK 4
 
+/* CMU_USB */
+#define CLK_MOUT_USB_NOC_USER              1
+#define CLK_MOUT_USB_USB20DRD              2
+#define CLK_MOUT_USB_USB20DRD_USER         3
+#define CLK_DOUT_USB_NOC_DIV3              4
+#define CLK_GOUT_CMU_USB_IPCLKPORT_PCLK    5
+#define CLK_GOUT_SYSREG_USB_IPCLKPORT_PCLK 6
+
 #endif /* _DT_BINDINGS_CLOCK_EXYNOS8855_H */
-- 
2.34.1

