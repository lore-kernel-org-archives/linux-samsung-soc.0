Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B262642049
	for <linux-samsung-soc@vger.kernel.org>; Wed, 29 Oct 2025 13:09:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761743359; cv=none; b=hKCUBqOJ/0TjM9WPlOIkK13YEgDFD5XA6S+A3U1XijcKXwDvNuHeAG0a0RI826xZJNj5C7zxnHSILIeGlAX2+qoDBQuc20+Sm/E8SuXoN36anZgeWfuOPBIlYwXT7Lkhyt9XdtVftHBUEtF73gqWn+HTHARfa76eWlfDLLGFzvU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761743359; c=relaxed/simple;
	bh=hX/L3l6he6aKhXrW+BbwyLOLFGJnEz73yJiqxGhKoaY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:Content-Type:
	 References; b=HgUjoKbU3nN0wY1c7euxKDjpGF4KpsDEzCjazYbHxjcPhd7/Yh6nkL1rLu5UXVpUxpqmCoQ7dUQviaeXxDes69bxg0bHwce0B23/ZSVOgh0R+py312sZm6L8jGclRsAVfaCSLAN/WDG/qTtl8Db8N1eA58eLm6hAubhmAWwWMoY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=F0bjp2pv; arc=none smtp.client-ip=203.254.224.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="F0bjp2pv"
Received: from epcas5p4.samsung.com (unknown [182.195.41.42])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20251029130915epoutp02d327fc9670091080f49003040d558f8f~y_D_Cb0Eg0512205122epoutp02a
	for <linux-samsung-soc@vger.kernel.org>; Wed, 29 Oct 2025 13:09:15 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20251029130915epoutp02d327fc9670091080f49003040d558f8f~y_D_Cb0Eg0512205122epoutp02a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1761743355;
	bh=mhdCUOJguwRxW0Me6zDM1dADDQ0Txm6u4urbm0RY+sY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=F0bjp2pvXZzSe9z4xpB0A9o7CfsedzMP+nonWQoLrSGd9+/sd+0VNviFOO86Qkvcn
	 GwBUC+xGljVPf4btFlDtbtalMcxyI9RyONiIMIkHUYgH2VWz9fargriXNLdhVHEe1v
	 J90dpC4kdTAxMaT83iVIVErLynCZAFqviEm9iJCs=
Received: from epsnrtp03.localdomain (unknown [182.195.42.155]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPS id
	20251029130914epcas5p1d645530f0d84d710a5b3096904e87d8f~y_D8guElW2691926919epcas5p1t;
	Wed, 29 Oct 2025 13:09:14 +0000 (GMT)
Received: from epcas5p1.samsung.com (unknown [182.195.38.92]) by
	epsnrtp03.localdomain (Postfix) with ESMTP id 4cxSHs2873z3hhT3; Wed, 29 Oct
	2025 13:09:13 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPA id
	20251029130912epcas5p2f6596fefe3fe5513958b8209e78fa2c6~y_D6vKxIV3210832108epcas5p2o;
	Wed, 29 Oct 2025 13:09:12 +0000 (GMT)
Received: from Jaguar.samsungds.net (unknown [107.109.115.6]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20251029130900epsmtip26950c5dad6ff42f9f52bc58d8e51c136~y_DvcRhBp1199811998epsmtip2e;
	Wed, 29 Oct 2025 13:08:59 +0000 (GMT)
From: Ravi Patel <ravi.patel@samsung.com>
To: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	jesper.nilsson@axis.com, lars.persson@axis.com, mturquette@baylibre.com,
	sboyd@kernel.org, alim.akhtar@samsung.com, s.nawrocki@samsung.com,
	cw00.choi@samsung.com
Cc: ravi.patel@samsung.com, ksk4725@coasia.com, smn1196@coasia.com,
	linux-arm-kernel@axis.com, krzk@kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	pjsin865@coasia.com, gwk1013@coasia.com, bread@coasia.com,
	jspark@coasia.com, limjh0823@coasia.com, lightwise@coasia.com,
	hgkim05@coasia.com, mingyoungbo@coasia.com, shradha.t@samsung.com,
	swathi.ks@samsung.com, kenkim@coasia.com
Subject: [PATCH v3 4/4] dt-bindings: samsung: exynos-pmu: Add compatible for
 ARTPEC-9 SoC
Date: Wed, 29 Oct 2025 18:37:31 +0530
Message-Id: <20251029130731.51305-5-ravi.patel@samsung.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20251029130731.51305-1-ravi.patel@samsung.com>
X-CMS-MailID: 20251029130912epcas5p2f6596fefe3fe5513958b8209e78fa2c6
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-541,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20251029130912epcas5p2f6596fefe3fe5513958b8209e78fa2c6
References: <20251029130731.51305-1-ravi.patel@samsung.com>
	<CGME20251029130912epcas5p2f6596fefe3fe5513958b8209e78fa2c6@epcas5p2.samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>

From: SungMin Park <smn1196@coasia.com>

Add Axis ARTPEC-9 pmu compatible to the bindings documentation.
It reuses the older samsung,exynos7-pmu design.

Signed-off-by: SungMin Park <smn1196@coasia.com>
Signed-off-by: Ravi Patel <ravi.patel@samsung.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
 Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml b/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml
index be1441193fee..9d3e8e9817fb 100644
--- a/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml
+++ b/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml
@@ -52,6 +52,7 @@ properties:
           - const: syscon
       - items:
           - enum:
+              - axis,artpec9-pmu
               - samsung,exynos2200-pmu
               - samsung,exynos7870-pmu
               - samsung,exynos7885-pmu
--
2.17.1

