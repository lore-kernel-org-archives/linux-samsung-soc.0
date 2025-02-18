Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6C5B271288;
	Tue, 18 Feb 2025 18:50:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739904613; cv=none; b=ngD1Cs3yCuCXTMf/3W9gQ9gY4+nDFq0mUYK+kmvFTxt+kxPwvie2RbPFJzgUpclViwD755iXo4GEskAIU1bGUbBlLcppP9IBSaXFAvzhZl34xE4z1i4cJsGinU0UFdDHTHlWh8j+W0DWwiSxtQwwftlqPABDncyhNkj1vupe00g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739904613; c=relaxed/simple;
	bh=ELQCwqU9r/Ux6fVgGsOceolUH8SfxUT0kfm0v5kir5w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fz8dJ5IGRvYa49L0hR7t2sYfaEo1B0SZ2yhi8wu6LtzQBJJhrvgkP65qy08XNdqCcwnxSd+x3bZhytPyVkCYKTV9GWHOCa3IrYqiou26aUYDGjLFgJZCGynBg2TSegnnlgzrHVplBAdw4Je4yAYBvSB3wjK8uHflgLX863r3hBY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=cJ7r1m4a; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="cJ7r1m4a"
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 4C86D25EB9;
	Tue, 18 Feb 2025 19:50:10 +0100 (CET)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0MLNfuRberur; Tue, 18 Feb 2025 19:50:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1739904605; bh=ELQCwqU9r/Ux6fVgGsOceolUH8SfxUT0kfm0v5kir5w=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=cJ7r1m4aKvi2mlwMsi0IzxZFZjibTmlwfe3Q2wClVxrtRAy3CsyoeXNsbINsBNQJZ
	 yIJskO3HVpN1DIlrbzy/L49b7nE9TH2vUUYQvlG6SJddq7QChUpkumwaFN78KIRHQm
	 45cmD/dGS0FzMa3lTvYtueCcUp5RBX/T0ScuYHoFWfGggS/BKjk43nBbY4XlvH72Ag
	 mp7MxPm3oe5jm6ffzjffwFHdNkwIcyh/r7BHmtmfIKvNmwdSpVLRiZXhUBdMgs3UaG
	 vLe7Wd3qlrYdb7QpumWIA78NVitkgCn1NKpz0bbGcvVSQBgQf2u2ENNIvtQSBqDsrB
	 yQRKnnQhsadtw==
From: Kaustabh Chakraborty <kauschluss@disroot.org>
Date: Wed, 19 Feb 2025 00:19:49 +0530
Subject: [PATCH v2 1/3] regulator: dt-bindings: add documentation for
 s2mpu05-pmic regulators
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250219-exynos7870-pmic-regulators-v2-1-1ea86fb332f7@disroot.org>
References: <20250219-exynos7870-pmic-regulators-v2-0-1ea86fb332f7@disroot.org>
In-Reply-To: <20250219-exynos7870-pmic-regulators-v2-0-1ea86fb332f7@disroot.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Lee Jones <lee@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, Kaustabh Chakraborty <kauschluss@disroot.org>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1739904598; l=2031;
 i=kauschluss@disroot.org; s=20250202; h=from:subject:message-id;
 bh=ELQCwqU9r/Ux6fVgGsOceolUH8SfxUT0kfm0v5kir5w=;
 b=2LGvXXxQAXvJx6QazYSK5PG4xQnkxM4qave/gJvncP6UTOljabilVxOcKQzKUlDyf7GHKt/zD
 eDzMgCoH/ztDzS3nDcYdX/XQDI8KvFOiUC14OWOh+vckq2iauehRKry
X-Developer-Key: i=kauschluss@disroot.org; a=ed25519;
 pk=h2xeR+V2I1+GrfDPAhZa3M+NWA0Cnbdkkq1bH3ct1hE=

S2MPU05 is a PMIC found in Exynos7870 devices, which controls voltage
regulators (21 LDOs and 5 BUCKs). Provide documentation for devicetree
definitions, regulator naming patterns, etc.

Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
---
 .../bindings/regulator/samsung,s2mpu05.yaml        | 47 ++++++++++++++++++++++
 1 file changed, 47 insertions(+)

diff --git a/Documentation/devicetree/bindings/regulator/samsung,s2mpu05.yaml b/Documentation/devicetree/bindings/regulator/samsung,s2mpu05.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..8189e4335b54651f9e7edebf74edb768674791e6
--- /dev/null
+++ b/Documentation/devicetree/bindings/regulator/samsung,s2mpu05.yaml
@@ -0,0 +1,47 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/regulator/samsung,s2mpu05.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Samsung S2MPU05 Power Management IC regulators
+
+maintainers:
+  - Kaustabh Chakraborty <kauschluss@disroot.org>
+
+description: |
+  This is a part of device tree bindings for S2M and S5M family of Power
+  Management IC (PMIC).
+
+  The S2MPU05 provides buck and LDO regulators.
+
+  See also Documentation/devicetree/bindings/mfd/samsung,s2mps11.yaml for
+  additional information and example.
+
+patternProperties:
+  # 21 LDOs
+  "^LDO([1-9]|10|2[5-9]|3[0-5])$":
+    type: object
+    $ref: regulator.yaml#
+    unevaluatedProperties: false
+    description:
+      Properties for single LDO regulator.
+
+      LDOs 11-24 are used for CP, and they're left unimplemented due to lack
+      of documentation on these regulators.
+
+    required:
+      - regulator-name
+
+  # 5 bucks
+  "^BUCK[1-5]$":
+    type: object
+    $ref: regulator.yaml#
+    unevaluatedProperties: false
+    description:
+      Properties for single BUCK regulator.
+
+    required:
+      - regulator-name
+
+additionalProperties: false

-- 
2.48.1

