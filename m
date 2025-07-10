Received: from spam.coasia.com (mail2.coasia.com [112.168.119.159])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14FC1AD23
	for <linux-samsung-soc@vger.kernel.org>; Thu, 10 Jul 2025 00:21:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=112.168.119.159
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752106868; cv=none; b=HLSpK33Ufytxfs/jAqiytOAMFNzv2MF3x0Cr/IVXHkWOZLcKrvmTeUrWVWW19P77DrT6Pq+bd4PyeHlG8SrQXj9hthup2mxYcAqGFvJMAafRp0UDBzrhB6dey+dkzzQSW2h6qXHJXvqrUwDWanEDlv898rKTJWnF6WI+MESnE/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752106868; c=relaxed/simple;
	bh=o3a1bC8AN1reTFYV1DZL9sumN+dkxNJ8J+cIRkSOHq8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=C8k1md5YRZRYW6u/AzVlge4fYrLwveEBG4nHvfY5qda+zweGH8QSxFcDbNyVLE6k7l1mQRJ5yb/T4watXlEO2NPzye3lbA3L2wnNFarc9jXp2YaSFt0NWasI53rUnOuggmde5wLAOHZWRbPhNRPZUrS81YmptHEF5fI/ihvFGPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=coasia.com; spf=pass smtp.mailfrom=coasia.com; dkim=pass (1024-bit key) header.d=coasia.com header.i=@coasia.com header.b=SR5H6bth; arc=none smtp.client-ip=112.168.119.159
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=coasia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=coasia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=coasia.com header.i=@coasia.com header.b="SR5H6bth"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=coasia.com; s=coasia;
	t=1752106863; bh=o3a1bC8AN1reTFYV1DZL9sumN+dkxNJ8J+cIRkSOHq8=;
	l=2392; h=From:To:Subject:Date:Message-Id:MIME-Version;
	b=SR5H6bthxDFxdS5cyI+hWgdw41e3CnSNSyPkSZ6RBikniRnyU6gkSV4fjpI03JhQz
	 5XtwwWM/KrrvlQZqPaiX2eBMSO3VvXDKS0sEJlm0Fnk0iSFmxqlt5rFaY0ZZaDHuTU
	 g+k7aN7unBUfet3TtSP6+s9FrFGtH91MBz9N0r/4=
Received: from unknown (HELO kangseongu..) (ksk4725@coasia.com@115.23.218.194)
	by 192.168.10.159 with ESMTP; 10 Jul 2025 09:21:03 +0900
X-Original-SENDERIP: 115.23.218.194
X-Original-SENDERCOUNTRY: KR, South Korea 
X-Original-MAILFROM: ksk4725@coasia.com
X-Original-RCPTTO: jesper.nilsson@axis.com,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	krzk@kernel.org,
	s.nawrocki@samsung.com,
	cw00.choi@samsung.com,
	alim.akhtar@samsung.com,
	linus.walleij@linaro.org,
	tomasz.figa@gmail.com,
	catalin.marinas@arm.com,
	will@kernel.org,
	arnd@arndb.de,
	ksk4725@coasia.com,
	smn1196@coasia.com,
	ravi.patel@samsung.com,
	linux-arm-kernel@axis.com,
	kenkim@coasia.com,
	pjsin865@coasia.com,
	gwk1013@coasia.com,
	hgkim05@coasia.com,
	mingyoungbo@coasia.com,
	pankaj.dubey@samsung.com,
	shradha.t@samsung.com,
	inbaraj.e@samsung.com,
	swathi.ks@samsung.com,
	hrishikesh.d@samsung.com,
	dj76.yang@samsung.com,
	hypmean.kim@samsung.com,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	soc@lists.linux.dev
From: ksk4725@coasia.com
To: Jesper Nilsson <jesper.nilsson@axis.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Tomasz Figa <tomasz.figa@gmail.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	SeonGu Kang <ksk4725@coasia.com>,
	SungMin Park <smn1196@coasia.com>,
	Ravi Patel <ravi.patel@samsung.com>,
	linux-arm-kernel@axis.com
Cc: kenkim <kenkim@coasia.com>,
	Jongshin Park <pjsin865@coasia.com>,
	GunWoo Kim <gwk1013@coasia.com>,
	HaGyeong Kim <hgkim05@coasia.com>,
	GyoungBo Min <mingyoungbo@coasia.com>,
	Pankaj Dubey <pankaj.dubey@samsung.com>,
	Shradha Todi <shradha.t@samsung.com>,
	Inbaraj E <inbaraj.e@samsung.com>,
	Swathi K S <swathi.ks@samsung.com>,
	Hrishikesh <hrishikesh.d@samsung.com>,
	Dongjin Yang <dj76.yang@samsung.com>,
	Sang Min Kim <hypmean.kim@samsung.com>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	soc@lists.linux.dev
Subject: [PATCH 13/16] dt-bindings: arm: Add Axis ARTPEC SoC platform
Date: Thu, 10 Jul 2025 09:20:43 +0900
Message-Id: <20250710002047.1573841-14-ksk4725@coasia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250710002047.1573841-1-ksk4725@coasia.com>
References: <20250710002047.1573841-1-ksk4725@coasia.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ravi Patel <ravi.patel@samsung.com>

Add device tree bindings for the Axis ARTPEC-8 SoC platform
and ARTPEC-8 Grizzly board.

Also move the existing ARTPEC-6 related bindings from .txt
to yaml format.

Signed-off-by: sungminpark <smn1196@coasia.com>
Signed-off-by: Ravi Patel <ravi.patel@samsung.com>
---
 .../devicetree/bindings/arm/axis.txt          | 13 -------
 .../devicetree/bindings/arm/axis.yaml         | 35 +++++++++++++++++++
 2 files changed, 35 insertions(+), 13 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/arm/axis.txt
 create mode 100644 Documentation/devicetree/bindings/arm/axis.yaml

diff --git a/Documentation/devicetree/bindings/arm/axis.txt b/Documentation/devicetree/bindings/arm/axis.txt
deleted file mode 100644
index ebd33a88776f..000000000000
--- a/Documentation/devicetree/bindings/arm/axis.txt
+++ /dev/null
@@ -1,13 +0,0 @@
-Axis Communications AB
-ARTPEC series SoC Device Tree Bindings
-
-ARTPEC-6 ARM SoC
-================
-
-Required root node properties:
-- compatible = "axis,artpec6";
-
-ARTPEC-6 Development board:
----------------------------
-Required root node properties:
-- compatible = "axis,artpec6-dev-board", "axis,artpec6";
diff --git a/Documentation/devicetree/bindings/arm/axis.yaml b/Documentation/devicetree/bindings/arm/axis.yaml
new file mode 100644
index 000000000000..70fb3caa70df
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/axis.yaml
@@ -0,0 +1,35 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/arm/axis.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Axis ARTPEC platforms
+
+maintainers:
+  - Jesper Nilsson <jesper.nilsson@axis.com>
+  - SeonGu Kang <ksk4725@coasia.com>
+  - SungMin Park <smn1196@coasia.com>
+  - Ravi Patel <ravi.patel@samsung.com>
+  - linux-arm-kernel@axis.com
+
+properties:
+  $nodename:
+    const: '/'
+  compatible:
+    oneOf:
+      - description: Axis ARTPEC-6 Development board
+        items:
+          - enum:
+              - axis,artpec6-dev-board
+          - const: axis,artpec6
+
+      - description: Axis ARTPEC-8 Grizzly board
+        items:
+          - enum:
+              - axis,artpec8-grizzly
+          - const: axis,artpec8
+
+additionalProperties: true
+
+...
-- 
2.34.1

