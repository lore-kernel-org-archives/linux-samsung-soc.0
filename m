Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB0AE27A127
	for <linux-samsung-soc@vger.kernel.org>; Wed, 14 May 2025 13:52:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747230760; cv=none; b=ex3RVgEzfbx4qjMDcUAf21y0l7t52emhxw73b1iimKN7YLH9ZZS5eEh5J2/LUUK5quuuAePjP1lkmKP1wQqkP+paGLLlj6mk9LufHRSUfd6LZ7D1E3gT89VdzAeAWDtaYePxW6Bz0r3kZqrYIt6jBLROVAQsu37k3y/XxLmUA9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747230760; c=relaxed/simple;
	bh=HT4vGYib1vkdrhrAux+8AkJRUgQhALHudbO2KB1R0Ws=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:MIME-Version:
	 Content-Type:References; b=KcalmTrKnAGjllExClJ6EJ/IZ31j11UZ3vrlGdyQ5Dvn7jwXZepM2cO/pkOy8Wq7/6y1JKKJ8bgPVhbhOXY8rEPSTm5Bx3yAcrj++m46F6M8DXSCEQblbIuQ2YMxXPj2Z/h/AY2zcQS12SrDUj6Ulu7OQ6e7aBAQM/0MoP8U0lA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=VTplLPJ4; arc=none smtp.client-ip=203.254.224.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="VTplLPJ4"
Received: from epcas5p3.samsung.com (unknown [182.195.41.41])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20250514135236epoutp02b01a88b7766c1a651767f562fc3091f0~-aR27rMwU0640206402epoutp02v
	for <linux-samsung-soc@vger.kernel.org>; Wed, 14 May 2025 13:52:36 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20250514135236epoutp02b01a88b7766c1a651767f562fc3091f0~-aR27rMwU0640206402epoutp02v
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1747230756;
	bh=uJ5xv2x3X+CRQNWp7iVnE+JtSDZ7GFWFYjczehxiho4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=VTplLPJ4icTRM9XyptCN0lLZkoIcoQtoJ4fyMU9X+ePwJSZ4KEoWSXXz77gqORGBU
	 HiAIJvOkYkHB0qr068JWXp+emqhwZ6vd8S9MfkVsHirvKBDDtvHglPHuOxLXXKhf3P
	 J/3vGmt4Whvi2xjWmA0n7kmcJumk9X1dCNgFc6eE=
Received: from epsnrtp04.localdomain (unknown [182.195.42.156]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPS id
	20250514135236epcas5p3ad11adde7c8e2399382f6371b6aefe08~-aR2YIjrB0225002250epcas5p3q;
	Wed, 14 May 2025 13:52:36 +0000 (GMT)
Received: from epcas5p3.samsung.com (unknown [182.195.38.179]) by
	epsnrtp04.localdomain (Postfix) with ESMTP id 4ZyFCQ217lz6B9m5; Wed, 14 May
	2025 13:52:34 +0000 (GMT)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPA id
	20250514095236epcas5p2c7a6c9380182da503bbe058edd69b84a~-XATy4dh02782827828epcas5p2D;
	Wed, 14 May 2025 09:52:36 +0000 (GMT)
Received: from epsmgmc1p1new.samsung.com (unknown [182.195.42.40]) by
	epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
	20250514095236epsmtrp249e7c263a2b6d642fcce3cf32bf6f15f~-XATx8FRg3153131531epsmtrp23;
	Wed, 14 May 2025 09:52:36 +0000 (GMT)
X-AuditID: b6c32a28-46cef70000001e8a-48-682467e4e373
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
	epsmgmc1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
	12.B4.07818.4E764286; Wed, 14 May 2025 18:52:36 +0900 (KST)
Received: from bose.samsungds.net (unknown [107.108.83.9]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20250514095233epsmtip2ac7a0923a2e425fc4ddbfcf5b2508af1~-XAQ-_SON1705717057epsmtip2P;
	Wed, 14 May 2025 09:52:33 +0000 (GMT)
From: Raghav Sharma <raghav.s@samsung.com>
To: krzk@kernel.org, s.nawrocki@samsung.com, cw00.choi@samsung.com,
	alim.akhtar@samsung.com, mturquette@baylibre.com, sboyd@kernel.org,
	robh@kernel.org, conor+dt@kernel.org, richardcochran@gmail.com,
	sunyeal.hong@samsung.com, shin.son@samsung.com
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
	dev.tailor@samsung.com, chandan.vn@samsung.com, karthik.sun@samsung.com,
	Raghav Sharma <raghav.s@samsung.com>
Subject: [PATCH v2 1/3] dt-bindings: clock: exynosautov920: add hsi2 clock
 definitions
Date: Wed, 14 May 2025 15:32:12 +0530
Message-Id: <20250514100214.2479552-2-raghav.s@samsung.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250514100214.2479552-1-raghav.s@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFuplkeLIzCtJLcpLzFFi42LZdlhJXvdJukqGwbPFahYP5m1js5jwJcJi
	zd5zTBbXvzxntbi3Yxm7xfwj51gtGme8YbI4f34Du8Wmx9dYLT723GO1uLxrDpvFjPP7mCwu
	nnK1OLZAzOL7yjuMFkfOvGC2+L9nB7vF4TftrBb/rm1ksZh8fC2rRdOy9UwOoh7vb7Sye+yc
	dZfdY9OqTjaPzUvqPfq2rGL0+LxJLoAtissmJTUnsyy1SN8ugSuj981e1oI/IhU3j3xjamC8
	zN/FyMkhIWAicffjA7YuRi4OIYHdjBKbpj5igkhISOz7/5sRwhaWWPnvOTuILSTwllFi/rtC
	EJtNQEviyvZ3YM0iAl1MEuf+vWIBSTAL7GSSWLleAsQWFgiTuD3rK1Ccg4NFQFXizEI3kDCv
	gLXEq30fmCHmy0vsP3gWzOYUsJH4+uIyM8Qua4mWV3OYIOoFJU7OfAI1Xl6ieets5gmMArOQ
	pGYhSS1gZFrFKJlaUJybnptsWGCYl1quV5yYW1yal66XnJ+7iREcY1oaOxjffWvSP8TIxMF4
	iFGCg1lJhPd6lnKGEG9KYmVValF+fFFpTmrxIUZpDhYlcd6VhhHpQgLpiSWp2ampBalFMFkm
	Dk6pBqbKJbcCCpR823fUTWKbzVIoN1MuU8V1A9d588urg5r21y/7KFizZMPR6QnXTqReureM
	6W2EWu6Hj2ujDxptUXWYfW3VopUzHgmbMKnIyf0qVCrY+3j5ZJOYgKTiC1O2CZy8wu94iK09
	0Uzn+LKL/3pP28hKx/37sUP9j4N+w9nECuXdM2/IGxlO0jl3S37KyhbT2e0ZayPmfL+ufPra
	qnWxUqxhuU/fZHw07zDLCI+awH26weZrytNv18qitbl19E4KFqr/2vLjo+fJ01NlfoVOyvkY
	Lh307R4nt2/lpNPPxTc9YlVJKLG8vqKzRoMzMbv55tbrQnsydioc0DhUYdOoxSJ4rJF/ft6C
	APmtFzuVWIozEg21mIuKEwGC6JfDIAMAAA==
X-CMS-MailID: 20250514095236epcas5p2c7a6c9380182da503bbe058edd69b84a
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-543,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250514095236epcas5p2c7a6c9380182da503bbe058edd69b84a
References: <20250514100214.2479552-1-raghav.s@samsung.com>
	<CGME20250514095236epcas5p2c7a6c9380182da503bbe058edd69b84a@epcas5p2.samsung.com>

Add device tree clock binding definitions for CMU_HSI2

Signed-off-by: Raghav Sharma <raghav.s@samsung.com>
---
 .../clock/samsung,exynosautov920-clock.yaml   | 29 +++++++++++++++++--
 .../clock/samsung,exynosautov920.h            |  9 ++++++
 2 files changed, 36 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/samsung,exynosautov920-clock.yaml b/Documentation/devicetree/bindings/clock/samsung,exynosautov920-clock.yaml
index 6961a68098f4..3cbb1dc8d828 100644
--- a/Documentation/devicetree/bindings/clock/samsung,exynosautov920-clock.yaml
+++ b/Documentation/devicetree/bindings/clock/samsung,exynosautov920-clock.yaml
@@ -41,14 +41,15 @@ properties:
       - samsung,exynosautov920-cmu-misc
       - samsung,exynosautov920-cmu-hsi0
       - samsung,exynosautov920-cmu-hsi1
+      - samsung,exynosautov920-cmu-hsi2
 
   clocks:
     minItems: 1
-    maxItems: 4
+    maxItems: 5
 
   clock-names:
     minItems: 1
-    maxItems: 4
+    maxItems: 5
 
   "#clock-cells":
     const: 1
@@ -201,6 +202,30 @@ allOf:
             - const: usbdrd
             - const: mmc_card
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: samsung,exynosautov920-cmu-hsi2
+
+    then:
+      properties:
+        clocks:
+          items:
+            - description: External reference clock (38.4 MHz)
+            - description: CMU_HSI2 NOC clock (from CMU_TOP)
+            - description: CMU_HSI2 NOC UFS clock (from CMU_TOP)
+            - description: CMU_HSI2 UFS EMBD clock (from CMU_TOP)
+            - description: CMU_HSI2 ETHERNET clock (from CMU_TOP)
+
+        clock-names:
+          items:
+            - const: oscclk
+            - const: noc
+            - const: ufs
+            - const: embd
+            - const: ethernet
+
 required:
   - compatible
   - "#clock-cells"
diff --git a/include/dt-bindings/clock/samsung,exynosautov920.h b/include/dt-bindings/clock/samsung,exynosautov920.h
index 5e6896e9627f..93e6233d1358 100644
--- a/include/dt-bindings/clock/samsung,exynosautov920.h
+++ b/include/dt-bindings/clock/samsung,exynosautov920.h
@@ -286,4 +286,13 @@
 #define CLK_MOUT_HSI1_USBDRD_USER	3
 #define CLK_MOUT_HSI1_USBDRD		4
 
+/* CMU_HSI2 */
+#define FOUT_PLL_ETH                    1
+#define CLK_MOUT_HSI2_NOC_UFS_USER      2
+#define CLK_MOUT_HSI2_UFS_EMBD_USER     3
+#define CLK_MOUT_HSI2_ETHERNET          4
+#define CLK_MOUT_HSI2_ETHERNET_USER     5
+#define CLK_DOUT_HSI2_ETHERNET          6
+#define CLK_DOUT_HSI2_ETHERNET_PTP      7
+
 #endif /* _DT_BINDINGS_CLOCK_EXYNOSAUTOV920_H */
-- 
2.34.1

