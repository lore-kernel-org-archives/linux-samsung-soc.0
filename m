Received: from mailout1.samsung.com (mailout1.samsung.com [203.254.224.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 539A91F1931
	for <linux-samsung-soc@vger.kernel.org>; Wed, 14 May 2025 16:10:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.24
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747239009; cv=none; b=l9rkG389sm7PKC3jQWoKjMVSYL30DXP+0MykSlPAlN+uyyhIw1pnA33RwBG5LPKGO0yQ7BIyIiZJtyzO4kTHOR7Apl0+C5CS9Poi6wP/S2BXviB+zOSHQaNmcsT+oSQW0cUbrPyU/zU65chtXyIX35h5iR4td82hvYMeBdddFHE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747239009; c=relaxed/simple;
	bh=UujTwbImuEFoLY34/j9YQBMd373eWpZcoj66e3MN8p4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:MIME-Version:
	 Content-Type:References; b=rKuxdn6HPNSc4pBBe593WQgufIaXeZPGyQMUUUA4MOqds9istcYXnGuRZCsRAlWcKWLjHCAOWb31vYOAKcbRpi+L7ueBf1EkOxWsq9TtFl5R3UrmWjTZUcQdoAJ1FtoPENYZAHVrf+hp6Z7EBUVtaOKtgd3SeX/bdEwH2GKcByI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=tdfXwNdk; arc=none smtp.client-ip=203.254.224.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="tdfXwNdk"
Received: from epcas5p3.samsung.com (unknown [182.195.41.41])
	by mailout1.samsung.com (KnoxPortal) with ESMTP id 20250514161004epoutp01637ac139be0ecc832ddab1aa4caf6484~-cJ4Gdmbv1775117751epoutp01R
	for <linux-samsung-soc@vger.kernel.org>; Wed, 14 May 2025 16:10:04 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20250514161004epoutp01637ac139be0ecc832ddab1aa4caf6484~-cJ4Gdmbv1775117751epoutp01R
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1747239004;
	bh=8j/q2SXJnlHMpBAVbRXsb+GwjmBKAoJT1KIZdrvMyNc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=tdfXwNdkhGMD7hnoJEW80Wrym2+BmIG5dqk0crcElDYXGwg/lVtqdvXVQgCgT44Gs
	 bsQYDjAhqVvQjlazRtK92ZXtmy+VLIm5fBpJCX/A+qG4uVSJY+RH4E8MCo55gHuFqs
	 exWr44Jt9tW1KZVTTEVS5ZBwdGrmO+czT5QWIdhA=
Received: from epsnrtp04.localdomain (unknown [182.195.42.156]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPS id
	20250514161003epcas5p38bccd18e24ea3dcf27520d8ff951b4d7~-cJ3XorjD1577215772epcas5p3y;
	Wed, 14 May 2025 16:10:03 +0000 (GMT)
Received: from epcas5p2.samsung.com (unknown [182.195.38.179]) by
	epsnrtp04.localdomain (Postfix) with ESMTP id 4ZyJG15FpNz6B9m5; Wed, 14 May
	2025 16:10:01 +0000 (GMT)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPA id
	20250514135755epcas5p41291579e7eb266d92b91b82621e0fa5d~-aWfWZH8p1966919669epcas5p43;
	Wed, 14 May 2025 13:57:55 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
	epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
	20250514135755epsmtrp17907aa1fc6bbdf16118cb9793c0527ac~-aWfVc0DZ0052600526epsmtrp1e;
	Wed, 14 May 2025 13:57:55 +0000 (GMT)
X-AuditID: b6c32a29-566fe7000000223e-ab-6824a16215da
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
	epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
	77.2D.08766.261A4286; Wed, 14 May 2025 22:57:54 +0900 (KST)
Received: from bose.samsungds.net (unknown [107.108.83.9]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20250514135752epsmtip209ce6fe3c40175bf184abe73aee75252~-aWdCPY8N0380003800epsmtip2h;
	Wed, 14 May 2025 13:57:52 +0000 (GMT)
From: Pritam Manohar Sutar <pritam.sutar@samsung.com>
To: pritam.sutar@samsung.com, gregkh@linuxfoundation.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, alim.akhtar@samsung.com,
	Thinh.Nguyen@synopsys.com
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org, rosa.pila@samsung.com, dev.tailor@samsung.com,
	faraz.ata@samsung.com, muhammed.ali@samsung.com, selvarasu.g@samsung.com
Subject: [PATCH 1/2] dt-bindings: usb: samsung,exynos-dwc3: add dt-schema
 ExynosAutov920
Date: Wed, 14 May 2025 19:37:40 +0530
Message-Id: <20250514140741.415981-2-pritam.sutar@samsung.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250514140741.415981-1-pritam.sutar@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrNLMWRmVeSWpSXmKPExsWy7bCSvG7SQpUMg4bL1hYP5m1js1iz9xyT
	xb0dy9gt5h85x2px7cZCdovmxevZLF7OusdmsenxNVaLy7vmsFnMOL+PyWLRslZmi/Mvulgt
	nt1bwWbxf88OdosvPx8wWxxZ/pHJYtWCA+wOgh6bVnWyeeyfu4bdY/OSeo++LasYPbbs/8zo
	8XmTXABbFJdNSmpOZllqkb5dAlfGsSXfWAs2c1UcWH6FtYHxBHsXIweHhICJxPd5UV2MXBxC
	ArsZJT7/fsLUxcgJFJeReDRtIyuELSyx8t9zdoiit4wS5zeeZARpZhMwlZi4JwEkLiKwiVHi
	yIqTzCANzAKrmSROT80AsYUFIiT+NrSygdgsAqoSe/auBhvKK2AnMe3Hf6gF8hL7D54F6+UU
	sJfY/mo2C8h8IaCaI0v1IcoFJU7OfMICMV5eonnrbOYJjAKzkKRmIUktYGRaxSiZWlCcm55b
	bFhgmJdarlecmFtcmpeul5yfu4kRHD9amjsYt6/6oHeIkYmD8RCjBAezkgjv9SzlDCHelMTK
	qtSi/Pii0pzU4kOM0hwsSuK84i96U4QE0hNLUrNTUwtSi2CyTBycUg1Mp7hLTnn7vO+efn33
	1PZlk8wPW9tw5xmc8/a8l/r0tnVjh8mjUr9XV6RlbhkJLTqxee6TD0Ki+58/fTEvkFnUcvpz
	o1kM34/e+5H04zjf1oUuLDW8H6NMDZ/2L3VcFSOT2lJndOHlHv2JMq7xbofr+spiwq/eLilo
	9n0dlm5Sd2/qxPWyTPyr9/+9UuayzbBA5vnOD7/nyNZG5uT1xDPxv/2wpzL6X16oT/rbY6Xb
	/bL4sznnOud4fvszadbjefreHDOPx9RaTnqzuW/RwpeBDxyZeTqEqx/9NzY4lp5RKp2xP7pZ
	/Uf13vS1u6r+/DaYV7xAsG3iqQdtTc+n2nX1qy9vEGarv9bkwXl0zcPZSizFGYmGWsxFxYkA
	VUsR+A4DAAA=
X-CMS-MailID: 20250514135755epcas5p41291579e7eb266d92b91b82621e0fa5d
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250514135755epcas5p41291579e7eb266d92b91b82621e0fa5d
References: <20250514140741.415981-1-pritam.sutar@samsung.com>
	<CGME20250514135755epcas5p41291579e7eb266d92b91b82621e0fa5d@epcas5p4.samsung.com>

Add a dedicated compatible for USB controller found in this SoC

Signed-off-by: Pritam Manohar Sutar <pritam.sutar@samsung.com>
---
 .../bindings/usb/samsung,exynos-dwc3.yaml        | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/samsung,exynos-dwc3.yaml b/Documentation/devicetree/bindings/usb/samsung,exynos-dwc3.yaml
index 892545b477ac..6d39e5066944 100644
--- a/Documentation/devicetree/bindings/usb/samsung,exynos-dwc3.yaml
+++ b/Documentation/devicetree/bindings/usb/samsung,exynos-dwc3.yaml
@@ -20,6 +20,7 @@ properties:
           - samsung,exynos7-dwusb3
           - samsung,exynos7870-dwusb3
           - samsung,exynos850-dwusb3
+          - samsung,exynosautov920-dwusb3
       - items:
           - const: samsung,exynos990-dwusb3
           - const: samsung,exynos850-dwusb3
@@ -179,6 +180,21 @@ allOf:
       required:
         - vdd10-supply
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: samsung,exynosautov920-dwusb3
+    then:
+      properties:
+        clocks:
+          minItems: 2
+          maxItems: 2
+        clock-names:
+          items:
+            - const: ref
+            - const: susp_clk
+
 additionalProperties: false
 
 examples:
-- 
2.34.1

