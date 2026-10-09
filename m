Received: from mailout1.samsung.com (mailout1.samsung.com [203.254.224.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 682534E3769
	for <linux-samsung-soc@vger.kernel.org>; Fri,  9 Oct 2026 11:43:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.24
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791546246; cv=none; b=ZWhrkrlb8zURLWpmHMeKX+2l4nCenjOTaGMR2v9IUsU0YvCqVM2nUaEznHYz9fiJ80Ftq1ysTMluiRYYSFNnT4Xpb8VWInbYZHj283UW/exVSp5wKb/hLhQPGSp4AUa121rB44CVu97DuPDFers06v72IMETpuUU4YjURcQbfuw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791546246; c=relaxed/simple;
	bh=MQdXQFIDa43MyWlPe0nx46ZlHklHiyYoae8idz+ptDQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:MIME-Version:
	 Content-Type:References; b=VZAk7VxU3HXGoYmmVBiAQ0uJLZ0zaTzDFP2geye7+ugB3KeQrzOaJpZfLr1FHxqvpfWjtAzF2UfmlU/iMD+kjriRcyvbX+TMP8Slf9JN1BF/TQgq79FSdstU1dLXGUf2ReSQ+xhntTDB0QHT/YDKzewwQR9X6Klw+MgQ7ROxLmI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=feqWSJiG; arc=none smtp.client-ip=203.254.224.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="feqWSJiG"
Received: from epcas5p1.samsung.com (unknown [182.195.41.39])
	by mailout1.samsung.com (KnoxPortal) with ESMTP id 20261009114347epoutp01252781f2528ef6a1064226c2b7cc022f~c2c1IxF_K1386613866epoutp01S
	for <linux-samsung-soc@vger.kernel.org>; Fri,  9 Oct 2026 11:43:47 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20261009114347epoutp01252781f2528ef6a1064226c2b7cc022f~c2c1IxF_K1386613866epoutp01S
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1791546227;
	bh=UNE23QaDNLY3/tsvq3NkcS3U8URyxQyHlVbcIU2tINg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=feqWSJiGcgZwvcl8St5kIuvjUc/9YtqF7RYJN7CLy5Nbqrmc6cHUliaHBjtGJW09S
	 5TPjHLSfJpLJ4i4RC3/tJT3BKViTiZKsSef+CNw6LTY9aat5iUln00GHQwvrRUAOTz
	 JcL4HwJUogXW7LhGkIIIbOmhfMAnwXGa5JVhW6LU=
Received: from epsnrtp03.localdomain (unknown [182.195.42.155]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPS id
	20261009114346epcas5p3cec82a1fc9f19a53855fb5aa4e5660aa~c2c0jdC-R0307103071epcas5p3u;
	Fri,  9 Oct 2026 11:43:46 +0000 (GMT)
Received: from epcas5p4.samsung.com (unknown [182.195.38.92]) by
	epsnrtp03.localdomain (Postfix) with ESMTP id 4j1Q416WSkz3hhT3; Fri,  9 Oct
	2026 11:43:45 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPA id
	20261009114345epcas5p4e16ed504e6238438f7f66b1e0557136d~c2czMx7Cx1488414884epcas5p4g;
	Fri,  9 Oct 2026 11:43:45 +0000 (GMT)
Received: from bose.samsungds.net (unknown [107.108.83.9]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20261009114342epsmtip2c38ba747e36fbd62a04b0d9078f08478~c2cw4k6Pz0916809168epsmtip2A;
	Fri,  9 Oct 2026 11:43:42 +0000 (GMT)
From: Raghav Sharma <raghav.s@samsung.com>
To: krzk@kernel.org, s.nawrocki@samsung.com, cw00.choi@samsung.com,
	peter.griffin@linaro.org, alim.akhtar@samsung.com, sboyd@kernel.org,
	bmasney+clk@redhat.com, jbrunet+clk@baylibre.com, robh@kernel.org,
	conor+dt@kernel.org, raghav.s@samsung.com
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, is.gandhi@samsung.com, ts.amit@samsung.com,
	pokala.reddy@samsung.com
Subject: [PATCH v2 05/14] dt-bindings: clock: exynos8855: add usb clock
 definitions
Date: Fri,  9 Oct 2026 17:31:28 +0530
Message-Id: <20261009120137.2801911-6-raghav.s@samsung.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261009120137.2801911-1-raghav.s@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20261009114345epcas5p4e16ed504e6238438f7f66b1e0557136d
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-543,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20261009114345epcas5p4e16ed504e6238438f7f66b1e0557136d
References: <20261009120137.2801911-1-raghav.s@samsung.com>
	<CGME20261009114345epcas5p4e16ed504e6238438f7f66b1e0557136d@epcas5p4.samsung.com>

Add device tree clock binding definitions for CMU_USB

Signed-off-by: Raghav Sharma <raghav.s@samsung.com>
---
 .../clock/samsung,exynos8855-clock.yaml       | 21 +++++++++++++++++++
 .../dt-bindings/clock/samsung,exynos8855.h    |  8 +++++++
 2 files changed, 29 insertions(+)

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
index 67cd97d8fab8..f4261956ab4a 100644
--- a/include/dt-bindings/clock/samsung,exynos8855.h
+++ b/include/dt-bindings/clock/samsung,exynos8855.h
@@ -222,4 +222,12 @@
 #define CLK_GOUT_UFS_EMBD_ACLK_HSI         5
 #define CLK_GOUT_UFS_EMBD_UNIPRO_HSI       6
 
+/* CMU_USB */
+#define CLK_MOUT_USB_NOC_USER              1
+#define CLK_MOUT_USB_USB20DRD              2
+#define CLK_MOUT_USB_USB20DRD_USER         3
+#define CLK_DOUT_USB_NOC_DIV3              4
+#define CLK_GOUT_CMU_USB                   5
+#define CLK_GOUT_SYSREG_USB                6
+
 #endif /* _DT_BINDINGS_CLOCK_EXYNOS8855_H */
-- 
2.34.1

