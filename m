Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AB2832C85
	for <linux-samsung-soc@vger.kernel.org>; Mon, 21 Jul 2025 02:46:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753065984; cv=none; b=ZnEUmI/lpBCWaxVAR4QwwpbdKH5a39Y4fuN+CyNjaseaaqKIl5m0d/8xyAz7qCUFLhpduhPn/C4o9W9xjG42kxchaOeb4lkZdNVKtWGABHtWlUCcWUODvaz9xKWDn77gP/oOvFKcOxVOtmqmltYo1EHvHVdDRlbfU5SIxPT1IUE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753065984; c=relaxed/simple;
	bh=8Z4REnWjtkDjAm7jIoVeaNDO5sByHg+aMhV6qQdTW1Y=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:MIME-Version:
	 Content-Type:References; b=AX2YYe3DD4OWs0fBqFbdMzh4WgfgEPHdScDUWg/JSlxuI6BkADTmyuyuRC840PkNMDsomWeCkSR9i5lAsMEo1UpH5VitALSWq1VtXdgPyXoSBYcX32ijPbhEIqG/uj1klc0+6YFKPYovlVEQ7xVrs1GBCYSihRSByW/p/JzN99o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=IFklJoPJ; arc=none smtp.client-ip=203.254.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="IFklJoPJ"
Received: from epcas2p1.samsung.com (unknown [182.195.41.53])
	by mailout4.samsung.com (KnoxPortal) with ESMTP id 20250721024613epoutp04f936d7f18ac21666225ce0d3effd0f42~UJDcI2MHX1548815488epoutp04L
	for <linux-samsung-soc@vger.kernel.org>; Mon, 21 Jul 2025 02:46:13 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20250721024613epoutp04f936d7f18ac21666225ce0d3effd0f42~UJDcI2MHX1548815488epoutp04L
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1753065973;
	bh=WYO77tq7W5vMECTNJggRjm3ersbeWEtJCeArb977E9A=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=IFklJoPJZwcqOv/w+VcOE5cb0+2rS6kEFUtb1fl95waOLENyaLtE6mfhZAoSfJVsy
	 nlAdXPfNzOvZTi/YCTfQKkmyA9CRqs0xO/244HAJUl9MjVlNfVI5ARVnb2gaHG81Et
	 H+t33manvOoQu3Ixk4BXeZPmPN0FFICn4t/9jZBI=
Received: from epsnrtp02.localdomain (unknown [182.195.42.154]) by
	epcas2p2.samsung.com (KnoxPortal) with ESMTPS id
	20250721024613epcas2p229f3754dac8b54208ffbe0b221c807e4~UJDbfi5Nz2628326283epcas2p22;
	Mon, 21 Jul 2025 02:46:13 +0000 (GMT)
Received: from epcas2p1.samsung.com (unknown [182.195.36.90]) by
	epsnrtp02.localdomain (Postfix) with ESMTP id 4bllC82lmmz2SSKb; Mon, 21 Jul
	2025 02:46:12 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas2p4.samsung.com (KnoxPortal) with ESMTPA id
	20250721024611epcas2p47ebaf8cb494fc2bf71a83b00ba47f2b3~UJDaEi5pY0522205222epcas2p4i;
	Mon, 21 Jul 2025 02:46:11 +0000 (GMT)
Received: from AProject.dsn.sec.samsung.com (unknown [10.229.9.52]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20250721024611epsmtip27e4a25bd9da3119a3e88b5ff0c56cce1~UJDaAmW-Q1347413474epsmtip2i;
	Mon, 21 Jul 2025 02:46:11 +0000 (GMT)
From: ew kim <ew.kim@samsung.com>
To: broonie@kernel.org, s.nawrocki@samsung.com, robh@kernel.org,
	krzk+dt@kernel.org
Cc: lgirdwood@gmail.com, tiwai@suse.com, perex@perex.cz,
	conor+dt@kernel.org, alim.akhtar@samsung.com, linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, ew kim
	<ew.kim@samsung.com>
Subject: [PATCH 3/9] ASoC: dt-bindings: sound: Add Samsung ExynosAuto ABOX
 binding
Date: Mon, 21 Jul 2025 11:30:46 +0900
Message-Id: <20250721023052.3586000-4-ew.kim@samsung.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250721023052.3586000-1-ew.kim@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250721024611epcas2p47ebaf8cb494fc2bf71a83b00ba47f2b3
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
cpgsPolicy: CPGSC10-234,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250721024611epcas2p47ebaf8cb494fc2bf71a83b00ba47f2b3
References: <20250721023052.3586000-1-ew.kim@samsung.com>
	<CGME20250721024611epcas2p47ebaf8cb494fc2bf71a83b00ba47f2b3@epcas2p4.samsung.com>

Add the device tree binding documentation for the Samsung Exynos Automotive
ABOX generic audio management core. This binding describes how to configure
the maximum number of PCM playback, PCM capture, and dummy I2S backend
instances for the ABOX core. Actual hardware functionality is provided
by child audio sub-drivers.

Signed-off-by: ew kim <ew.kim@samsung.com>
---
 .../bindings/sound/samsung,exynosauto.yaml    | 69 +++++++++++++++++++
 1 file changed, 69 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/samsung,exynosauto.yaml

diff --git a/Documentation/devicetree/bindings/sound/samsung,exynosauto.yaml b/Documentation/devicetree/bindings/sound/samsung,exynosauto.yaml
new file mode 100644
index 000000000000..b1e49f38ffe9
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/samsung,exynosauto.yaml
@@ -0,0 +1,69 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/samsung,exynosauto.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Samsung Exynos Automotive Abox Generic
+
+maintainers:
+  - Eunwoo Kim <ew.kim@samsung.com>
+
+description: |
+  The Samsung Exynos Automotive Abox Generic node represents a
+  generic audio management platform device inside Exynos Automotive SoCs.
+  It does not directly control hardware resources itself, but acts as
+  a common interface to manage child audio sub-drivers for PCM playback,
+  PCM capture, and I2S dummy backends.
+
+  Typically, this node provides configuration for the maximum number of
+  PCM playback and capture devices (ALSA PCM) and the maximum number
+  of dummy I2S backend devices. The actual hardware control is handled
+  by child drivers attached to this generic core.
+
+  This node must exist for the platform driver to probe,
+  even though it does not map any physical hardware address.
+
+properties:
+  compatible:
+    const: samsung,abox_generic
+
+  samsung,num-pcm-playback:
+    description: Maximum number of PCM playback instances (ALSA PCM devices).
+    $ref: /schemas/types.yaml#/definitions/uint32
+
+  samsung,num-pcm-capture:
+    description: Maximum number of PCM capture instances (ALSA PCM devices).
+    $ref: /schemas/types.yaml#/definitions/uint32
+
+  samsung,num-i2s-dummy-backend:
+    description: Maximum number of dummy I2S backend instances.
+    $ref: /schemas/types.yaml#/definitions/uint32
+
+  '#address-cells':
+    description: Required for child nodes that may declare address space.
+    const: 2
+
+  '#size-cells':
+    description: Required for child nodes that may declare address space.
+    const: 1
+
+required:
+  - compatible
+  - samsung,num-pcm-playback
+  - samsung,num-pcm-capture
+  - samsung,num-i2s-dummy-backend
+
+additionalProperties: false
+
+examples:
+  - |
+    abox_generic {
+      compatible = "samsung,abox_generic";
+      samsung,num-pcm-playback = <32>;
+      samsung,num-pcm-capture = <32>;
+      samsung,num-i2s-dummy-backend = <5>;
+      status = "disabled";
+      #address-cells = <2>;
+      #size-cells = <1>;
+    };
-- 
2.25.1

