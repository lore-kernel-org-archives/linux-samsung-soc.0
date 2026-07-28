Received: from mailout1.samsung.com (mailout1.samsung.com [203.254.224.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 634C942EEB3
	for <linux-samsung-soc@vger.kernel.org>; Tue, 28 Jul 2026 11:53:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.24
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785239587; cv=none; b=orj8rmroMlkWKrLAkAOl4VZGwaxslzPkIdiV2AXq774SuCrRQQS3xqz5WRcHJg2VlesBMeUuwL04YpCfia8k8gbjF2FNDkzEhYRVITJdAaMlbCprnGhZkoh5M9svBFEjtXhYaMFX7tI1IXhz7aBIGqnli9EJ/DfHRd+BQY/eSJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785239587; c=relaxed/simple;
	bh=5H+2CkwE8/O5g0pV7HLjLLbb2BaOe9KMTWDO7hVDcaA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:MIME-Version:
	 Content-Type:References; b=l4ykjiSsLsoQxZjBbQjRMubRO6HGwkDzndYoHcxWZhguEwaoAsrSxei3KYekc5NVXbxkOJRisbpJFEUWzwJnaXnWXXsLYc1BFxOqu+5qAcbGRYMEC9X8lgxxLXEMQhds/bRi64776rsRZFRPSQHHpwOKCn7bOvYKw0xjwWpEV04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=LYnUPTsU; arc=none smtp.client-ip=203.254.224.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="LYnUPTsU"
Received: from epcas5p4.samsung.com (unknown [182.195.41.42])
	by mailout1.samsung.com (KnoxPortal) with ESMTP id 20260728115302epoutp0176936a3a83917e8345863fb290a23eb5~GcfEYgjUh1089410894epoutp01S
	for <linux-samsung-soc@vger.kernel.org>; Tue, 28 Jul 2026 11:53:02 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20260728115302epoutp0176936a3a83917e8345863fb290a23eb5~GcfEYgjUh1089410894epoutp01S
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1785239582;
	bh=VDfTALnNGJ4dV9TcMw3rH2Xy3f5JFfUvxg5LHO/nAqM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=LYnUPTsU7dKE25E9cG1+MpOaF07OKs7t8jp7qp6NuXwAmPFWXtLb4ayyIoaP7KA41
	 25zVQxmh8x7l1epp2QY+dhxiEv8LYi40Q6A1zfZHnFJ3RqGV6yJQUiMznj2wYjxfoQ
	 q/U/mi5wXw41x+NEzYOMj43TeZpCK8+q4KYVfHQY=
Received: from epsnrtp02.localdomain (unknown [182.195.42.154]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPS id
	20260728115301epcas5p41977e64305d5ac4652805e4bab099a15~GcfDvI8vV2959829598epcas5p4j;
	Tue, 28 Jul 2026 11:53:01 +0000 (GMT)
Received: from epcas5p4.samsung.com (unknown [182.195.38.89]) by
	epsnrtp02.localdomain (Postfix) with ESMTP id 4h8YkN6VgKz2SSKZ; Tue, 28 Jul
	2026 11:53:00 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPA id
	20260728115300epcas5p35dc4bce1b09a4d989170e67eb5d6a752~GcfCVrMZ81684116841epcas5p33;
	Tue, 28 Jul 2026 11:53:00 +0000 (GMT)
Received: from bose.samsungds.net (unknown [107.108.83.9]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20260728115256epsmtip1db0510f61386b1e01e1163b71fa49d22~Gce-BgHq72235622356epsmtip1b;
	Tue, 28 Jul 2026 11:52:56 +0000 (GMT)
From: "raghav.s" <raghav.s@samsung.com>
To: krzk@kernel.org, s.nawrocki@samsung.com, cw00.choi@samsung.com,
	peter.griffin@linaro.org, alim.akhtar@samsung.com, mturquette@baylibre.com,
	sboyd@kernel.org, bmasney@redhat.com, robh@kernel.org, conor+dt@kernel.org
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, hajun.sung@samsung.com, raghav.s@samsung.com,
	is.gandhi@samsung.com, ts.amit@samsung.com, pokala.reddy@samsung.com
Subject: [PATCH 05/13] dt-bindings: clock: exynos8855: add peris clock
 definitions
Date: Tue, 28 Jul 2026 17:41:03 +0530
Message-Id: <20260728121111.2077860-6-raghav.s@samsung.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260728121111.2077860-1-raghav.s@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20260728115300epcas5p35dc4bce1b09a4d989170e67eb5d6a752
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-543,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20260728115300epcas5p35dc4bce1b09a4d989170e67eb5d6a752
References: <20260728121111.2077860-1-raghav.s@samsung.com>
	<CGME20260728115300epcas5p35dc4bce1b09a4d989170e67eb5d6a752@epcas5p3.samsung.com>

Add device tree clock binding definitions for CMU_PERIS

Signed-off-by: raghav.s <raghav.s@samsung.com>
---
 .../clock/samsung,exynos8855-clock.yaml       | 21 +++++++++++++++++++
 .../dt-bindings/clock/samsung,exynos8855.h    | 16 ++++++++++++++
 2 files changed, 37 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/samsung,exynos8855-clock.yaml b/Documentation/devicetree/bindings/clock/samsung,exynos8855-clock.yaml
index 073c19debd0d..62277c67fec1 100644
--- a/Documentation/devicetree/bindings/clock/samsung,exynos8855-clock.yaml
+++ b/Documentation/devicetree/bindings/clock/samsung,exynos8855-clock.yaml
@@ -29,6 +29,7 @@ properties:
   compatible:
     enum:
       - samsung,exynos8855-cmu-peric
+      - samsung,exynos8855-cmu-peris
       - samsung,exynos8855-cmu-top
 
   clocks:
@@ -68,6 +69,26 @@ allOf:
             - const: mmc_card
             - const: ip
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: samsung,exynos8855-cmu-peris
+
+    then:
+      properties:
+        clocks:
+          items:
+            - description: External reference clock (76.8 MHz)
+            - description: CMU_PERIS GIC clock (from CMU_TOP)
+            - description: CMU_PERIS NOC clock (from CMU_TOP)
+
+        clock-names:
+          items:
+            - const: oscclk
+            - const: gic
+            - const: bus
+
   - if:
       properties:
         compatible:
diff --git a/include/dt-bindings/clock/samsung,exynos8855.h b/include/dt-bindings/clock/samsung,exynos8855.h
index 14369b749fb2..9efaf3e330b4 100644
--- a/include/dt-bindings/clock/samsung,exynos8855.h
+++ b/include/dt-bindings/clock/samsung,exynos8855.h
@@ -50,6 +50,11 @@
 #define DOUT_SHARED4_DIV4		   38
 #define FOUT_MMC_PLL_DIV1                  39
 #define FOUT_MMC_PLL_DIV2                  40
+#define CLKCMU_MOUT_PERIS_GIC              41
+#define CLKCMU_MOUT_PERIS_NOC              42
+#define CLKCMU_DOUT_PERIS_GIC              43
+#define CLKCMU_DOUT_PERIS_NOC              44
+#define FOUT_MMC_PLL_CLKOUT_DIV2           45
 
 /* CMU_PERIC */
 #define CLK_MOUT_PERIC_IP_USER             1
@@ -79,4 +84,15 @@
 #define CLK_GOUT_UART_DBG_PERIC_IPCLKPORT_PCLK 25
 #define CLK_GOUT_USI_PERIC_IPCLKPORT_PCLK  26
 
+/* CMU_PERIS */
+#define CLK_MOUT_PERIS_NOC_USER            1
+#define CLK_MOUT_PERIS_GIC                 2
+#define CLK_MOUT_PERIS_GIC_USER            3
+#define CLK_DOUT_PERIS_NOCP                4
+#define CLK_DOUT_PERIS_OTP                 5
+#define CLK_GOUT_CMU_PERIS_IPCLKPORT_PCLK  6
+#define CLK_GOUT_SYSREG_PERIS_IPCLKPORT_PCLK 7
+#define CLK_GOUT_WDT0_PERIS_IPCLKPORT_PCLK   8
+#define CLK_GOUT_WDT1_PERIS_IPCLKPORT_PCLK   9
+
 #endif /* _DT_BINDINGS_CLOCK_EXYNOS8855_H */
-- 
2.34.1

