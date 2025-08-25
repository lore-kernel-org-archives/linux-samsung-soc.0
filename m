Received: from mailout3.samsung.com (mailout3.samsung.com [203.254.224.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18D2A2F28E7
	for <linux-samsung-soc@vger.kernel.org>; Mon, 25 Aug 2025 12:07:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756123656; cv=none; b=nWVCnVzERIjrXJUMF4Fwx4IBY7XyAns1arehdUjXWonO6xJNeXaA7rch7d7ynTMEQITG4HuxuT81QWTpGh3dxhU6h6SsKcUYsLHX8B8JomCUM/Vzv0PdvsIJpAVv3WlxQPIISnQdiOLvp4aOQOFCJFdePvpoGZWOTP6OXUXKheQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756123656; c=relaxed/simple;
	bh=mJ6HFGL+Y4jf3Bmgp3K1vm5i2Wtb2CuxlstC1OdNlm0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:Content-Type:
	 References; b=E7F2yq1bPY+WDNW1ubthe1MMAq6USeqOoKbFaP4HflQa7B1XhKUQjH8R8csVEfFjmyA4gbU0if1Tm+qo+DGQ4gkSubQaOyzRVnq0TrcMEjccpTf+GDnZSnqrCKpXG4k9BoawyMOqVuFJpYBI32MWmg2f1Zboctvg5uaeTJSFpgg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=U1/TmrCq; arc=none smtp.client-ip=203.254.224.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="U1/TmrCq"
Received: from epcas5p2.samsung.com (unknown [182.195.41.40])
	by mailout3.samsung.com (KnoxPortal) with ESMTP id 20250825120733epoutp03187724ad557e419e5375a9bdbdd49ce9~fASiR5_TG0405904059epoutp03O
	for <linux-samsung-soc@vger.kernel.org>; Mon, 25 Aug 2025 12:07:33 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20250825120733epoutp03187724ad557e419e5375a9bdbdd49ce9~fASiR5_TG0405904059epoutp03O
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1756123653;
	bh=4KrVFImLWWMk4u+RCG6atSptECAqVlbM836WIDvTOgE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=U1/TmrCqoyvCzSZXahR4NgruaIiy5XmE7CF7hFIIjejetp4ZqBShD1bOIDhASJm62
	 SVp6ieBJuvGspLyJ7FWdD4kSFbr4LIP0VYzGY01Trj8GPEXfoKBpvbxacilYbpcKD3
	 +RlUzb9eYbSa875ZlXlRj4fl+I0kl86rAG/gx5pg=
Received: from epsnrtp04.localdomain (unknown [182.195.42.156]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPS id
	20250825120732epcas5p4e2a69e6f20490ca8708f2c879e7763dc~fAShY-spP3220632206epcas5p4Y;
	Mon, 25 Aug 2025 12:07:32 +0000 (GMT)
Received: from epcas5p2.samsung.com (unknown [182.195.38.94]) by
	epsnrtp04.localdomain (Postfix) with ESMTP id 4c9V0g3yC7z6B9m5; Mon, 25 Aug
	2025 12:07:31 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPA id
	20250825120730epcas5p347b6acfa329848471d55191150c8c983~fASfk49tU2789627896epcas5p3o;
	Mon, 25 Aug 2025 12:07:30 +0000 (GMT)
Received: from Jaguar.samsungds.net (unknown [107.109.115.6]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20250825120725epsmtip2eb025832c49be2d2926c812e51782b51~fASbCU4Y50171501715epsmtip2H;
	Mon, 25 Aug 2025 12:07:25 +0000 (GMT)
From: Ravi Patel <ravi.patel@samsung.com>
To: jesper.nilsson@axis.com, mturquette@baylibre.com, sboyd@kernel.org,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, krzk@kernel.org,
	s.nawrocki@samsung.com, cw00.choi@samsung.com, alim.akhtar@samsung.com,
	linus.walleij@linaro.org, tomasz.figa@gmail.com, catalin.marinas@arm.com,
	will@kernel.org, arnd@arndb.de
Cc: ksk4725@coasia.com, kenkim@coasia.com, pjsin865@coasia.com,
	gwk1013@coasia.com, hgkim05@coasia.com, mingyoungbo@coasia.com,
	smn1196@coasia.com, pankaj.dubey@samsung.com, shradha.t@samsung.com,
	ravi.patel@samsung.com, inbaraj.e@samsung.com, swathi.ks@samsung.com,
	hrishikesh.d@samsung.com, dj76.yang@samsung.com, hypmean.kim@samsung.com,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-arm-kernel@axis.com,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-gpio@vger.kernel.org, soc@lists.linux.dev
Subject: [PATCH v3 07/10] dt-bindings: arm: axis: Add ARTPEC-8 grizzly board
Date: Mon, 25 Aug 2025 17:14:33 +0530
Message-Id: <20250825114436.46882-8-ravi.patel@samsung.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250825114436.46882-1-ravi.patel@samsung.com>
X-CMS-MailID: 20250825120730epcas5p347b6acfa329848471d55191150c8c983
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-541,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250825120730epcas5p347b6acfa329848471d55191150c8c983
References: <20250825114436.46882-1-ravi.patel@samsung.com>
	<CGME20250825120730epcas5p347b6acfa329848471d55191150c8c983@epcas5p3.samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>

From: SungMin Park <smn1196@coasia.com>

Document the Axis ARTPEC-8 SoC binding and the grizzly board
which uses ARTPEC-8 SoC.

Signed-off-by: SungMin Park <smn1196@coasia.com>
Signed-off-by: SeonGu Kang <ksk4725@coasia.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Ravi Patel <ravi.patel@samsung.com>
---
 Documentation/devicetree/bindings/arm/axis.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/axis.yaml b/Documentation/devicetree/bindings/arm/axis.yaml
index f9c218dc6883..63e9aca85db7 100644
--- a/Documentation/devicetree/bindings/arm/axis.yaml
+++ b/Documentation/devicetree/bindings/arm/axis.yaml
@@ -8,6 +8,7 @@ title: Axis ARTPEC platforms
 
 maintainers:
   - Jesper Nilsson <jesper.nilsson@axis.com>
+  - Lars Persson <lars.persson@axis.com>
   - linux-arm-kernel@axis.com
 
 description: |
@@ -24,6 +25,12 @@ properties:
               - axis,artpec6-dev-board
           - const: axis,artpec6
 
+      - description: Axis ARTPEC-8 SoC board
+        items:
+          - enum:
+              - axis,artpec8-grizzly
+          - const: axis,artpec8
+
 additionalProperties: true
 
 ...
-- 
2.49.0

