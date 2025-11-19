Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F8DC364031
	for <linux-samsung-soc@vger.kernel.org>; Wed, 19 Nov 2025 13:14:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763558089; cv=none; b=E5CY2xEA4ZzGsPRD3qHs43L2zZjnI4nFEVLt+wl0/yXCZh3ZxW7r+Nj+8VlZTPjTcF5qh8vJGyipZ+eRcrk8u9PBhRtUpLUq5oChuaVmaqqTeaycc6JB8jasoXu2bDQLXf6gwpl9xxFk77UXP2xbQ1roMuboJDvW+3Po0RN+eG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763558089; c=relaxed/simple;
	bh=g39XsjcOcmb4NE7EJkQQcJo/6pdXgupRJ/KPZOkHnT0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:Content-Type:
	 References; b=NnE/Xl4ez/AAZOiQ8h9NlagiDdd2PONaCgvzdfzYh7DWoYaTdJIW4Kydv/62/dmDDrIzJHJEUSr07cTDWlFd4+9g4OkanC4yX6NR7vrwLwe7ifuaigHsVShBCP+T/N12Z5Yj0fYdzJ1P7h/oPjlwUzRxQhSrpmXdJTa6d30is5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=AkC/4mmF; arc=none smtp.client-ip=203.254.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="AkC/4mmF"
Received: from epcas5p3.samsung.com (unknown [182.195.41.41])
	by mailout4.samsung.com (KnoxPortal) with ESMTP id 20251119131441epoutp048276b175b056b400f6e18b19c6bf41bb~5artR2pid1925919259epoutp04J
	for <linux-samsung-soc@vger.kernel.org>; Wed, 19 Nov 2025 13:14:41 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20251119131441epoutp048276b175b056b400f6e18b19c6bf41bb~5artR2pid1925919259epoutp04J
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1763558081;
	bh=cRhvpd6x1HY/izs//K1pFbwwDcGX2ZhUl9lY9Dlgo/o=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=AkC/4mmFS/nA4d/NpfM8Y+IZlHXTNNFlFleQ7+Gjv4CSPOkMDFBZTwu/HOB8X65EI
	 jC67FsbHds9KoBs/kVJGuKrdNQtXkyNxhPyrlLChYfXfzGFCBO38oNdRKOqxvtsQTE
	 sZkHKAjlitwxu17sbykXcjpe9iC9Wibp6wvf+KLY=
Received: from epsnrtp04.localdomain (unknown [182.195.42.156]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPS id
	20251119131440epcas5p40389f59cd6919581213182c2ac276d72~5arsX4xII2519125191epcas5p4y;
	Wed, 19 Nov 2025 13:14:40 +0000 (GMT)
Received: from epcas5p3.samsung.com (unknown [182.195.38.88]) by
	epsnrtp04.localdomain (Postfix) with ESMTP id 4dBMQR6T71z6B9m7; Wed, 19 Nov
	2025 13:14:39 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPA id
	20251119131438epcas5p189f617cb2a9d7b0376b9fedd9a738d12~5arqerEUc0462504625epcas5p1Z;
	Wed, 19 Nov 2025 13:14:38 +0000 (GMT)
Received: from Jaguar.samsungds.net (unknown [107.109.115.6]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20251119131424epsmtip194b252d9b5e9f3b24b24ce2f36603e76~5ardTSWIL2550425504epsmtip1w;
	Wed, 19 Nov 2025 13:14:24 +0000 (GMT)
From: Ravi Patel <ravi.patel@samsung.com>
To: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	jesper.nilsson@axis.com, lars.persson@axis.com, alim.akhtar@samsung.com
Cc: ravi.patel@samsung.com, ksk4725@coasia.com, smn1196@coasia.com,
	linux-arm-kernel@axis.com, krzk@kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, pjsin865@coasia.com, gwk1013@coasia.com,
	bread@coasia.com, jspark@coasia.com, limjh0823@coasia.com,
	lightwise@coasia.com, hgkim05@coasia.com, mingyoungbo@coasia.com,
	shradha.t@samsung.com, swathi.ks@samsung.com, kenkim@coasia.com,
	kitak81.kim@samsung.com
Subject: [PATCH v2 1/3] dt-bindings: arm: axis: Add ARTPEC-9 alfred board
Date: Wed, 19 Nov 2025 18:43:00 +0530
Message-Id: <20251119131302.79088-2-ravi.patel@samsung.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20251119131302.79088-1-ravi.patel@samsung.com>
X-CMS-MailID: 20251119131438epcas5p189f617cb2a9d7b0376b9fedd9a738d12
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-541,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20251119131438epcas5p189f617cb2a9d7b0376b9fedd9a738d12
References: <20251119131302.79088-1-ravi.patel@samsung.com>
	<CGME20251119131438epcas5p189f617cb2a9d7b0376b9fedd9a738d12@epcas5p1.samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>

Document the Axis ARTPEC-9 SoC binding and the alfred board
which uses ARTPEC-9 SoC.

Signed-off-by: Ravi Patel <ravi.patel@samsung.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
 Documentation/devicetree/bindings/arm/axis.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/axis.yaml b/Documentation/devicetree/bindings/arm/axis.yaml
index 63e9aca85db7..3062901196a6 100644
--- a/Documentation/devicetree/bindings/arm/axis.yaml
+++ b/Documentation/devicetree/bindings/arm/axis.yaml
@@ -31,6 +31,12 @@ properties:
               - axis,artpec8-grizzly
           - const: axis,artpec8
 
+      - description: Axis ARTPEC-9 SoC board
+        items:
+          - enum:
+              - axis,artpec9-alfred
+          - const: axis,artpec9
+
 additionalProperties: true
 
 ...
-- 
2.17.1

