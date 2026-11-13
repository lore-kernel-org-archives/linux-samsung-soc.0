Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=203.254.224.34
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794567486;
	b=F7nusm4ZisQaGY4yQKQ63ck4jVM07CoAfXYISXmcJevvQj+fGf5LA6V5uLYYPCm4c+Hu
	 cfx3RvNBQWWjNVRuCbyJtO0kPfZo0hCY8n59t90vtJQ2wIvnACL8J76AGiePpZt6GZR4o
	 j+1WZKPTMDGUrzi4XTtEzM9Nt4MK2+rP1rkufdRx/IbwBGTrsv3nc6jhrSSHaq+ammmF8
	 8mdua0/eUXY8OzLur8LX2AoGYf0KsBoQ7qv3kcsqGY9Tb4DNPbcWhxCsqid9Ma6B93UTm
	 4WpM0ZhU82JRIqlzNu4SgbXDp0ZQKZJE/KfmCGrh9FND0xNKuFjfx4LtvebQ4Vyr20A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794567486;
	h=DMARC-Filter:Received:DKIM-Filter:DKIM-Signature:Received:Received:
	 Received:Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 In-Reply-To:MIME-Version:Content-Transfer-Encoding:X-CMS-MailID:
	 X-Msg-Generator:Content-Type:X-Sendblock-Type:CMS-TYPE:X-CPGSPASS:
	 X-Hop-Count:X-CMS-RootMailID:References;
	bh=qhFh7zT1+bzubZ3GCKmZli8T8ugrkRfM7QpmtOWqwF8=;
	b=CkzQi344JGcatoCPqw24tW6XOhtbMB16++piMUHYxgXBcrxU0FLeKFplotVZ6ilRX2ww
	 nzFdDpOWpPzw1WWIMnCYy9SOeyQ3gTTbvd4RNbQlaty+xHUjq1CzTrwuBSDxmcdz49y+y
	 MTBDyvS1Ge9wnPqiPKHtWcxeDlOoRWwF86pDkG15PaMkHeSmGr78jQyYJisuNs9OlKm5/
	 zAuRtWc7Tk1HhMQSNVWLRVI8g/dEnMU/5bBWvDmOZ4F2Qnolc1PXTYzwxmKGwsIP1bVAs
	 p2yb8/40RaegFzE+EMXktu1eNeGBVHgcMh7oUL8cspwcAFIZjdM2EY/MiF6eN4xF3FA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=samsung.com;
	spf=pass smtp.mailfrom=samsung.com;
	dkim=pass header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=u1s53RMK;
	arc=none smtp.remote-ip=203.254.224.34
Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B791606B24D
	for <linux-samsung-soc@vger.kernel.org>; Fri, 13 Nov 2026 10:58:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5B791606B24D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=u1s53RMK
Received: from epcas5p1.samsung.com (unknown [182.195.41.39])
	by mailout4.samsung.com (KnoxPortal) with ESMTP id 20261113105803epoutp047bada08a8da635659e6e7cfdee559790~nlZ5OCUWN1611416114epoutp04B
	for <linux-samsung-soc@vger.kernel.org>; Fri, 13 Nov 2026 10:58:03 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20261113105803epoutp047bada08a8da635659e6e7cfdee559790~nlZ5OCUWN1611416114epoutp04B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1794567483;
	bh=qhFh7zT1+bzubZ3GCKmZli8T8ugrkRfM7QpmtOWqwF8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=u1s53RMKS4d41x3WlHcK5Cj0e8pIrS+08KlB9ZmNnowQmlvZofpgwRq9fStkqId1M
	 g0Y+s9VZJGvPGfo7PhhzpAJIQwbQBaXN+P2F3Z9/Kt985/gR3ZOZO8BJt4AyvLwJtg
	 DBcN9PWL1Fiq3Pn/r1t1yckpHj8xR4CW5pVKm7LQ=
Received: from epsnrtp01.localdomain (unknown [182.195.42.153]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPS id
	20261113105803epcas5p3885531154ec8e0cd5610ed634c9dfe12~nlZ4pxRFU2375523755epcas5p3G;
	Fri, 13 Nov 2026 10:58:03 +0000 (GMT)
Received: from epcpadp2new (unknown [182.195.40.142]) by
	epsnrtp01.localdomain (Postfix) with ESMTP id 4jQvP70DP5z6B9m6; Fri, 13 Nov
	2026 10:58:03 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPA id
	20261113104844epcas5p4c1cb0c31de8b5b445f7f0060f81cf753~nlRwAgOo21464514645epcas5p4O;
	Fri, 13 Nov 2026 10:48:44 +0000 (GMT)
Received: from bose.samsungds.net (unknown [107.108.83.9]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20261113104841epsmtip261c51c6b828a5949207dbae96280c353~nlRtf8azg2503825038epsmtip2I;
	Fri, 13 Nov 2026 10:48:41 +0000 (GMT)
From: Raghav Sharma <raghav.s@samsung.com>
To: krzk@kernel.org, s.nawrocki@samsung.com, cw00.choi@samsung.com,
	peter.griffin@linaro.org, alim.akhtar@samsung.com, sboyd@kernel.org,
	bmasney+clk@redhat.com, jbrunet+clk@baylibre.com, robh@kernel.org,
	conor+dt@kernel.org, raghav.s@samsung.com
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, is.gandhi@samsung.com, ts.amit@samsung.com,
	pokala.reddy@samsung.com, Krzysztof Kozlowski
	<krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v3 05/14 RESEND] dt-bindings: clock: exynos8855: add usb
 clock definitions
Date: Fri, 13 Nov 2026 16:36:03 +0530
Message-Id: <927327686.61794567483016.JavaMail.epsvc@epcpadp2new>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261113110612.3265841-1-raghav.s@samsung.com>
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Post: <mailto:linux-samsung-soc@vger.kernel.org>
List-Help: <mailto:linux-samsung-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-samsung-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20261113104844epcas5p4c1cb0c31de8b5b445f7f0060f81cf753
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
X-CPGSPASS: Y
X-Hop-Count: 3
X-CMS-RootMailID: 20261113104844epcas5p4c1cb0c31de8b5b445f7f0060f81cf753
References: <20261113110612.3265841-1-raghav.s@samsung.com>
	<CGME20261113104844epcas5p4c1cb0c31de8b5b445f7f0060f81cf753@epcas5p4.samsung.com>

Add device tree clock binding definitions for CMU_USB

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Raghav Sharma <raghav.s@samsung.com>
---
 .../clock/samsung,exynos8855-clock.yaml       | 21 +++++++++++++++++++
 .../dt-bindings/clock/samsung,exynos8855.h    |  8 +++++++
 2 files changed, 29 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/samsung,exynos8855-clock.yaml b/Documentation/devicetree/bindings/clock/samsung,exynos8855-clock.yaml
index 21928235d131..c68a64eb35c5 100644
--- a/Documentation/devicetree/bindings/clock/samsung,exynos8855-clock.yaml
+++ b/Documentation/devicetree/bindings/clock/samsung,exynos8855-clock.yaml
@@ -32,6 +32,7 @@ properties:
       - samsung,exynos8855-cmu-peric
       - samsung,exynos8855-cmu-peris
       - samsung,exynos8855-cmu-top
+      - samsung,exynos8855-cmu-usb
 
   clocks:
     minItems: 1
@@ -143,6 +144,26 @@ allOf:
       required:
         - samsung,sysreg
 
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


