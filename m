Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=203.254.224.33
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794567486;
	b=JgSpPt8+qT4qIxxccwqTPx56wby07CqtIeMy4xtXinqUk1XljKlysenuxVmj1qakmDwk
	 dEpFPA/S+FV3psJLPOm0M0oRsr8qflmoY22zsDIvX3uzMjKTBbH0rTMrwhSBdZtjEyQdd
	 jAshhnHhERAVnL+baFK+bon3M78v1jUZvLW/3NUdVaCy30YRPxmZnQkFRpCcrEhy9ghdn
	 J+yx2FEHecz5Al7mQtI0hMObKKrHPLchpmuC21M4mlk1MK2cw3vGecWT3UcWg6RTsjtSO
	 l4VCQsy9DmsJPou9AOPSjqmsKmjlncfnPEGgCT3bILvjxRCZU1xYLjTaQNcORY07mQw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794567486;
	h=DMARC-Filter:Received:DKIM-Filter:DKIM-Signature:Received:Received:
	 Received:Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 In-Reply-To:MIME-Version:Content-Transfer-Encoding:X-CMS-MailID:
	 X-Msg-Generator:Content-Type:X-Sendblock-Type:CMS-TYPE:X-CPGSPASS:
	 X-Hop-Count:X-CMS-RootMailID:References;
	bh=/mF0XBJwiryCyMPrZszn5OendoJ/4n7hQYYsJtVWvy4=;
	b=Mj9vJfvMmb88GrRl7o3yGfzhxdcn+aBD6Pv3U3V9fp0KoiXUqZbV6EbbORHH3xCZ7Qrz
	 4Uuz+o845Y5KpLQ6sv/2SKOPEvI5eal9KAmvUTakBy54fkbBnQOoOoRsKb0XtciiMvpRi
	 ebGhYaTRwZTVLfs+CQjchtjTFZvpyfcM8+KTk3RElSYncsLei7lVYzQ6GJ4JMbm1FGVEE
	 a96wBDgWR6WJoSd6PkN/BFkifWfzFo245dgn5goNbxX4HS2FGdD+CSsFlV5LHnSbKBZhK
	 W9TuSU9AL54v/CpuzxcG7RfFhBitfOLb9o+xcPrxFZ6Nq7yQr3SZRQrZfi1JtEtq92w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=samsung.com;
	spf=pass smtp.mailfrom=samsung.com;
	dkim=pass header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=XaMT3d5r;
	arc=none smtp.remote-ip=203.254.224.33
Received: from mailout3.samsung.com (mailout3.samsung.com [203.254.224.33])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67140606B253
	for <linux-samsung-soc@vger.kernel.org>; Fri, 13 Nov 2026 10:58:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 67140606B253
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=XaMT3d5r
Received: from epcas5p1.samsung.com (unknown [182.195.41.39])
	by mailout3.samsung.com (KnoxPortal) with ESMTP id 20261113105803epoutp038eeaf878d220efb08e3aff357506d1a8~nlZ5Bq9iS0964709647epoutp03_
	for <linux-samsung-soc@vger.kernel.org>; Fri, 13 Nov 2026 10:58:03 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20261113105803epoutp038eeaf878d220efb08e3aff357506d1a8~nlZ5Bq9iS0964709647epoutp03_
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1794567483;
	bh=/mF0XBJwiryCyMPrZszn5OendoJ/4n7hQYYsJtVWvy4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=XaMT3d5rT/kWAF4a26S9ITMs5FYv+iVPGY1Eq306xBr365C15nbK7SSP63IWzOQAK
	 KRSG2PU0aGv7/qK7sIMKTAAyta2n/y26UW6zcR+PjXi3T7SrsMZut5BHMCqABG+FUS
	 8vvCJpCcBPtp9P4n3i1T4GnBTKdgNCmyKvwIJiig=
Received: from epsnrtp03.localdomain (unknown [182.195.42.155]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPS id
	20261113105802epcas5p29801a07f86f08317b781f3af7d22ef5a~nlZ4gizkT1211212112epcas5p2Y;
	Fri, 13 Nov 2026 10:58:02 +0000 (GMT)
Received: from epcpadp2new (unknown [182.195.40.142]) by
	epsnrtp03.localdomain (Postfix) with ESMTP id 4jQvP66DwMz3hhT7; Fri, 13 Nov
	2026 10:58:02 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPA id
	20261113104838epcas5p2623c7a05b6163954e13e98367063e7d4~nlRqiYXti0676206762epcas5p2P;
	Fri, 13 Nov 2026 10:48:38 +0000 (GMT)
Received: from bose.samsungds.net (unknown [107.108.83.9]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20261113104835epsmtip2cb97bab455f60cc347964defad1fe624~nlRoBRLAE2503825038epsmtip2G;
	Fri, 13 Nov 2026 10:48:35 +0000 (GMT)
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
Subject: [PATCH v3 03/14 RESEND] dt-bindings: clock: exynos8855: add peris
 clock definitions
Date: Fri, 13 Nov 2026 16:36:01 +0530
Message-Id: <937773018.41794567482875.JavaMail.epsvc@epcpadp2new>
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
X-CMS-MailID: 20261113104838epcas5p2623c7a05b6163954e13e98367063e7d4
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
X-CPGSPASS: Y
X-Hop-Count: 3
X-CMS-RootMailID: 20261113104838epcas5p2623c7a05b6163954e13e98367063e7d4
References: <20261113110612.3265841-1-raghav.s@samsung.com>
	<CGME20261113104838epcas5p2623c7a05b6163954e13e98367063e7d4@epcas5p2.samsung.com>

Add device tree clock binding definitions for CMU_PERIS

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Raghav Sharma <raghav.s@samsung.com>
---
 .../clock/samsung,exynos8855-clock.yaml       | 21 +++++++++++++++++++
 .../dt-bindings/clock/samsung,exynos8855.h    | 11 ++++++++++
 2 files changed, 32 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/samsung,exynos8855-clock.yaml b/Documentation/devicetree/bindings/clock/samsung,exynos8855-clock.yaml
index 486b7347ad44..53fc8040e173 100644
--- a/Documentation/devicetree/bindings/clock/samsung,exynos8855-clock.yaml
+++ b/Documentation/devicetree/bindings/clock/samsung,exynos8855-clock.yaml
@@ -29,6 +29,7 @@ properties:
   compatible:
     enum:
       - samsung,exynos8855-cmu-peric
+      - samsung,exynos8855-cmu-peris
       - samsung,exynos8855-cmu-top
 
   clocks:
@@ -73,6 +74,26 @@ allOf:
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
index cd445bb45070..5d8b38a744b5 100644
--- a/include/dt-bindings/clock/samsung,exynos8855.h
+++ b/include/dt-bindings/clock/samsung,exynos8855.h
@@ -203,4 +203,15 @@
 #define CLK_GOUT_UART_DBG_PERIC            25
 #define CLK_GOUT_USI_PERIC                 26
 
+/* CMU_PERIS */
+#define CLK_MOUT_PERIS_NOC_USER            1
+#define CLK_MOUT_PERIS_GIC                 2
+#define CLK_MOUT_PERIS_GIC_USER            3
+#define CLK_DOUT_PERIS_NOCP                4
+#define CLK_DOUT_PERIS_OTP                 5
+#define CLK_GOUT_CMU_PERIS                 6
+#define CLK_GOUT_SYSREG_PERIS              7
+#define CLK_GOUT_WDT0_PERIS                8
+#define CLK_GOUT_WDT1_PERIS                9
+
 #endif /* _DT_BINDINGS_CLOCK_EXYNOS8855_H */
-- 
2.34.1


