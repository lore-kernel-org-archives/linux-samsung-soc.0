Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AA8D288C89
	for <linux-samsung-soc@vger.kernel.org>; Fri, 26 Sep 2025 07:40:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758872424; cv=none; b=dYVkeNN+Z3zfTVwMmL9s/QGH+em509sGkowF9vvYqpg+6wWV5LTjtpVQUj/ychxObcDF3mQpSReC2+6qgOctno9XPEZW872n3Yqj8HWejzemSBL/0hQdSRndYoDyIablqNHYmSR4BqJUYlB7R9Ot/Qxss/TA5xfZTZyWAKvTwsQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758872424; c=relaxed/simple;
	bh=l1RL/5IMw6FZvt+E+6wstOuDI36clXXRoGddBu4pCE4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:MIME-Version:
	 Content-Type:References; b=L6VT8mzPS3cZUw8+uGfTkrknUxpVCB3MfRKX+toYXPj7E2S1ZYITH5GJdZx5U56qVpZtON1zbwoZQRm2f7B0QlmHMg7jn16I84oqGMNmiCF2dAbTRo8r1uIFGVvdqDeoJdVsU35VzUTzhKyl1oK0IaxR/kBFaIfLwnF8EFeRIjw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=Ub9dHQf1; arc=none smtp.client-ip=203.254.224.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="Ub9dHQf1"
Received: from epcas2p2.samsung.com (unknown [182.195.41.54])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20250926074019epoutp02d9b50d281163c0245194a1aa8cefe365~oxSWPGlRP1904119041epoutp02M
	for <linux-samsung-soc@vger.kernel.org>; Fri, 26 Sep 2025 07:40:19 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20250926074019epoutp02d9b50d281163c0245194a1aa8cefe365~oxSWPGlRP1904119041epoutp02M
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1758872419;
	bh=cqFvsweeMIydvpkKRbWUDCT5Z9vdCXOgwYUao+S7sbw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Ub9dHQf1rIPisddjJW49nGx0PC5pU4jXQaHDXUdBuLk77U0MsnGic7KbuNw2hmL6R
	 bgBFN0tffJ4aa3wLcrYdXPT9QNSGoV0EGyMtAeEdO6ZlFwxSMBnux0tFOv3isEFE6m
	 H7elaL6YXOztmK3u3y4j/E6Ytkv4bBfhHIPUzHXg=
Received: from epsnrtp01.localdomain (unknown [182.195.42.153]) by
	epcas2p4.samsung.com (KnoxPortal) with ESMTPS id
	20250926074019epcas2p416e087caf4fd9cf6e956961f1cf6d333~oxSVuwDt-2914429144epcas2p4G;
	Fri, 26 Sep 2025 07:40:19 +0000 (GMT)
Received: from epcas2p2.samsung.com (unknown [182.195.36.69]) by
	epsnrtp01.localdomain (Postfix) with ESMTP id 4cY2YZ0hjmz6B9m9; Fri, 26 Sep
	2025 07:40:18 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas2p1.samsung.com (KnoxPortal) with ESMTPA id
	20250926074017epcas2p18fb2fc616b92dc04ad9e018151c2ba29~oxSUQRHA61723517235epcas2p1N;
	Fri, 26 Sep 2025 07:40:17 +0000 (GMT)
Received: from asswp146.dsn.sec.samsung.com (unknown [10.229.19.146]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20250926074017epsmtip2605014d87cb2a679f123ac72d62d40f4~oxSULQqe31191711917epsmtip21;
	Fri, 26 Sep 2025 07:40:17 +0000 (GMT)
From: Sanghoon Bae <sh86.bae@samsung.com>
To: robh@kernel.org, krzk@kernel.org, conor+dt@kernel.org, vkoul@kernel.org,
	alim.akhtar@samsung.com, kishon@kernel.org, m.szyprowski@samsung.com,
	jh80.chung@samsung.com, shradha.t@samsung.com
Cc: krzk+dt@kernel.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
	linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
	sh86.bae@samsung.com
Subject: [PATCH 2/4] dt-bindings: phy: Add PCIe PHY support for
 ExynosAutov920 SoC
Date: Fri, 26 Sep 2025 16:39:17 +0900
Message-ID: <20250926073921.1000866-3-sh86.bae@samsung.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250926073921.1000866-1-sh86.bae@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250926074017epcas2p18fb2fc616b92dc04ad9e018151c2ba29
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
cpgsPolicy: CPGSC10-234,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250926074017epcas2p18fb2fc616b92dc04ad9e018151c2ba29
References: <20250926073921.1000866-1-sh86.bae@samsung.com>
	<CGME20250926074017epcas2p18fb2fc616b92dc04ad9e018151c2ba29@epcas2p1.samsung.com>

Since the Exynosautov920 SoC uses the Samsung PCIe PHY, add support
for it in the Exynosautov920 PCIe PHY bindings.

The Exynosautov920 SoC includes two PHY instances: one for a 4-lane PHY
and another for a 2-lane PHY. Each PHY can be used by separate
controllers through the bifurcation option. Therefore, from 2 up to 4
PCIe controllers can be supported and connected with this PHY driver.

PCIe lane number is used to distinguish each PHY instance.
This is required since two PHY instances on ExynosAutov920 is not
identical.
On PHY driver code, need to check each instance and different settings.

Signed-off-by: Sanghoon Bae <sh86.bae@samsung.com>
---
 .../bindings/phy/samsung,exynos-pcie-phy.yaml      | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/samsung,exynos-pcie-phy.yaml b/Documentation/devicetree/bindings/phy/samsung,exynos-pcie-phy.yaml
index 6295472696db..1e8b88d2cd56 100644
--- a/Documentation/devicetree/bindings/phy/samsung,exynos-pcie-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/samsung,exynos-pcie-phy.yaml
@@ -19,6 +19,7 @@ properties:
       - samsung,exynos5433-pcie-phy
       - tesla,fsd-pcie-phy0
       - tesla,fsd-pcie-phy1
+      - samsung,exynosautov920-pcie-phy
 
   reg:
     minItems: 1
@@ -34,6 +35,10 @@ properties:
     description: phandle for FSYS sysreg interface, used to control
                  sysreg registers bits for PCIe PHY
 
+  num-lanes:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    enum: [2, 4]
+
 allOf:
   - if:
       properties:
@@ -42,6 +47,7 @@ allOf:
             enum:
               - tesla,fsd-pcie-phy0
               - tesla,fsd-pcie-phy1
+              - samsung,exynosautov920-pcie-phy
     then:
       properties:
         reg:
@@ -52,6 +58,14 @@ allOf:
       properties:
         reg:
           maxItems: 1
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: samsung,exynosautov920-pcie-phy
+    then:
+      required:
+        - num-lanes
 
 required:
   - "#phy-cells"
-- 
2.45.2

