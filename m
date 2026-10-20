Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=203.254.224.33
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792479788;
	b=heZBK6ID45gw8YHi/daJI+QdRljeu5zhg1oGg7BTeG4RCNxoLq4Ajx3kVdfwBR3wke/N
	 EstJTeGEjwY6kW5GBZ20f2dfnKNCqsFI406V3yTIs+l2X5caXyDfbGjo81JUKi3ugmNXG
	 wpQknX5iiNlbOCNAcxlhaZnwPC01Jv0bJdquk91bb+NCPfU3D1aNyh2HS6AkZwnyjq5d9
	 sp6RZ6/dc6m6ptbDpNZO7yKnHUZ5HVt5jHwlfBiaskSjXc2l3OMsdxAfOfRerRz9SzEyq
	 hOqBldxBGvkl08beSN+Xr+pc4b/xCHpVrI/vHauH+UrNOBk6CvpPM1tc8E+ILxhtXUA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792479788;
	h=DMARC-Filter:Received:DKIM-Filter:DKIM-Signature:Received:Received:
	 Received:Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 In-Reply-To:MIME-Version:Content-Transfer-Encoding:X-CMS-MailID:
	 X-Msg-Generator:Content-Type:X-Sendblock-Type:CMS-TYPE:X-CPGSPASS:
	 X-Hop-Count:X-CMS-RootMailID:References;
	bh=erFYt3v+QSuQ7rGTo+dYGddg5732pLpZexzaOVFDdxw=;
	b=QEndvE9MSSuVewjxT5FdkANaEYt14YN+dyf3qAGLRTX4x/TroJ/HCM4JyVZzwSt1St4i
	 CONgGI3KVEdyXwDM9GbnzggaiSuGUEtg+7uOuQLTWaP/1EZ25KWqLpv/nLw2yLRz96GKh
	 p6H/qLqN2m3tadY15/3rpwF/B7Ym4AaWi5zMAca/LAcdoZxTyefSXag7tnzBz9SJu+zWK
	 ochlKtJYz9rvp9NIilIQllSb9ASwNKr96uXQzPiQtyMgR6GQVBiwS+mlSqQvAVj/D0NqT
	 8yZHzrG0S+MEWmp6aLgsC/U/A6Ie7580z4+x6qXef9FoBQwFV+cLdiSBpBKIx7DeSqg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=samsung.com;
	spf=pass smtp.mailfrom=samsung.com;
	dkim=pass header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=X1pTw+eb;
	arc=none smtp.remote-ip=203.254.224.33
Received: from mailout3.samsung.com (mailout3.samsung.com [203.254.224.33])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA2A0606A327
	for <linux-samsung-soc@vger.kernel.org>; Tue, 20 Oct 2026 07:03:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AA2A0606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=X1pTw+eb
Received: from epcas5p2.samsung.com (unknown [182.195.41.40])
	by mailout3.samsung.com (KnoxPortal) with ESMTP id 20261020070305epoutp03000c9f6e3eff4544f0f49f6fc5b85a26~gKt4fcupb2086520865epoutp036
	for <linux-samsung-soc@vger.kernel.org>; Tue, 20 Oct 2026 07:03:05 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20261020070305epoutp03000c9f6e3eff4544f0f49f6fc5b85a26~gKt4fcupb2086520865epoutp036
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1792479785;
	bh=erFYt3v+QSuQ7rGTo+dYGddg5732pLpZexzaOVFDdxw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=X1pTw+ebli3wfAMggxgQhkTbt7mMqM6u+hjsNqcDZbjXrRExdMdlY0+t4tCl9Ks91
	 5TrKpQ/9VlXJIqaX3i66Sx3TIx18OgG90q3BipypiSX+UIUVPC9yrZ/PbqUaiFdeEX
	 JimK48ai6X8E2K6/NV2wRU1s/JjFsQ2FUTdTogRk=
Received: from epsnrtp01.localdomain (unknown [182.195.42.153]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPS id
	20261020070304epcas5p18dab9bc6b0923e448f472bcfeeeabe97~gKt3mJnoI0096800968epcas5p1K;
	Tue, 20 Oct 2026 07:03:04 +0000 (GMT)
Received: from epcpadp2new (unknown [182.195.40.142]) by
	epsnrtp01.localdomain (Postfix) with ESMTP id 4j83K41Lhzz6B9mP; Tue, 20 Oct
	2026 07:03:04 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPA id
	20261020065553epcas5p35b4a16d8c277025a08378a5b915c2173~gKnl-k2Lr1777617776epcas5p3G;
	Tue, 20 Oct 2026 06:55:53 +0000 (GMT)
Received: from bose.samsungds.net (unknown [107.108.83.9]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20261020065550epsmtip14bbe41349807f059ef71ef62b6db97ac~gKnjZgNmG1278912789epsmtip1x;
	Tue, 20 Oct 2026 06:55:50 +0000 (GMT)
From: Raghav Sharma <raghav.s@samsung.com>
To: krzk@kernel.org, s.nawrocki@samsung.com, cw00.choi@samsung.com,
	peter.griffin@linaro.org, alim.akhtar@samsung.com, sboyd@kernel.org,
	bmasney+clk@redhat.com, jbrunet+clk@baylibre.com, robh@kernel.org,
	conor+dt@kernel.org, raghav.s@samsung.com
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, is.gandhi@samsung.com, ts.amit@samsung.com,
	pokala.reddy@samsung.com, cpgs@samsung.com, Krzysztof Kozlowski
	<krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v3 04/14] dt-bindings: clock: exynos8855: add hsi clock
 definitions
Date: Tue, 20 Oct 2026 12:43:45 +0530
Message-Id: <937773018.41792479784183.JavaMail.epsvc@epcpadp2new>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261020071346.1918640-1-raghav.s@samsung.com>
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
X-CMS-MailID: 20261020065553epcas5p35b4a16d8c277025a08378a5b915c2173
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
X-CPGSPASS: Y
X-Hop-Count: 3
X-CMS-RootMailID: 20261020065553epcas5p35b4a16d8c277025a08378a5b915c2173
References: <20261020071346.1918640-1-raghav.s@samsung.com>
	<CGME20261020065553epcas5p35b4a16d8c277025a08378a5b915c2173@epcas5p3.samsung.com>

Add device tree clock binding definitions for CMU_HSI

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Raghav Sharma <raghav.s@samsung.com>
---
 .../clock/samsung,exynos8855-clock.yaml       | 21 +++++++++++++++++++
 .../dt-bindings/clock/samsung,exynos8855.h    |  8 +++++++
 2 files changed, 29 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/samsung,exynos8855-clock.yaml b/Documentation/devicetree/bindings/clock/samsung,exynos8855-clock.yaml
index 53fc8040e173..21928235d131 100644
--- a/Documentation/devicetree/bindings/clock/samsung,exynos8855-clock.yaml
+++ b/Documentation/devicetree/bindings/clock/samsung,exynos8855-clock.yaml
@@ -28,6 +28,7 @@ description: |
 properties:
   compatible:
     enum:
+      - samsung,exynos8855-cmu-hsi
       - samsung,exynos8855-cmu-peric
       - samsung,exynos8855-cmu-peris
       - samsung,exynos8855-cmu-top
@@ -52,6 +53,26 @@ properties:
       Phandle to system registers interface.
 
 allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: samsung,exynos8855-cmu-hsi
+
+    then:
+      properties:
+        clocks:
+          items:
+            - description: External reference clock (76.8 MHz)
+            - description: CMU_HSI NOC clock (from CMU_TOP)
+            - description: CMU_HSI UFS_EMBD clock (from CMU_TOP)
+
+        clock-names:
+          items:
+            - const: oscclk
+            - const: bus
+            - const: ufs_embd
+
   - if:
       properties:
         compatible:
diff --git a/include/dt-bindings/clock/samsung,exynos8855.h b/include/dt-bindings/clock/samsung,exynos8855.h
index 5d8b38a744b5..67cd97d8fab8 100644
--- a/include/dt-bindings/clock/samsung,exynos8855.h
+++ b/include/dt-bindings/clock/samsung,exynos8855.h
@@ -214,4 +214,12 @@
 #define CLK_GOUT_WDT0_PERIS                8
 #define CLK_GOUT_WDT1_PERIS                9
 
+/* CMU_HSI */
+#define CLK_MOUT_HSI_NOC_USER              1
+#define CLK_MOUT_HSI_UFS_EMBD_USER         2
+#define CLK_GOUT_CMU_HSI                   3
+#define CLK_GOUT_SYSREG_HSI                4
+#define CLK_GOUT_UFS_EMBD_ACLK_HSI         5
+#define CLK_GOUT_UFS_EMBD_UNIPRO_HSI       6
+
 #endif /* _DT_BINDINGS_CLOCK_EXYNOS8855_H */
-- 
2.34.1


