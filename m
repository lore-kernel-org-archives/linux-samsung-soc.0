Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70572277037;
	Fri, 28 Feb 2025 19:37:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740771459; cv=none; b=koQqIKDEnoQEvDP++KQznc25SY/gbmO3E0p0kUTZBHE03eujXogdZwLyWhZr67UgOYWZdRczYZJLZ+rUhOWk/mptuSsO1BYFbVq20QluRoyxA+fbefgyd6u75OgHpv3QKQ8EFUS/j7uiSDS6Zi1RgpQnu3JOF9ANih/+tTTk7nM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740771459; c=relaxed/simple;
	bh=XBuRc/28NV7MDuqpbtBLiVU588EctEg7PkPnSEz6vSQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tfSONhDmbaaVA0q2abeUHBs9+frgjTqVYa3xPkyN/UoQzjF6Z6wV7NFLP/w4/VtO0YCCamo60/D1bq30oxJtYowLKcwXjmCEfRrlK3XJTpEjUWUbatORYwliRQPIf9pnIaKKPlXpDbn32ZyG0A2GO+HdzZk9NAVkKwroT6SivOw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=C+lay9Os; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="C+lay9Os"
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 012B925C64;
	Fri, 28 Feb 2025 20:37:37 +0100 (CET)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pfwa2xbCf35F; Fri, 28 Feb 2025 20:37:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1740771452; bh=XBuRc/28NV7MDuqpbtBLiVU588EctEg7PkPnSEz6vSQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=C+lay9Osp5wPPHxWElQjV8F4rSBHW9m+TcrAmndNAJd7PfP/NH26d2c4Rr4/2Fln+
	 EVJ1DueEdJxtyzNFwoDawTeLif5B0NrS3aEKyGETWgcckkHsZXDbFV7uY/W1auc4b0
	 aRCOpYphqRB6FVhActmho4Z3KSTEFbt/MYFtHx9Gu86xvJPJiqejamjAT1qNAlAOmm
	 de7imhNOLwk8F3krzNjxfOhgQfaGfGRDbqgoSsE9RvCdlBRTUtu+rvuZNM/SCVamN9
	 OZ3+Z++YpHFKTP5bNQlzq7Pk0vD7MLOU0J5IEqI1ejSPXB4y3sRNTj/1oEtm/VHdU+
	 aBjKUzoptInGg==
From: Kaustabh Chakraborty <kauschluss@disroot.org>
Date: Sat, 01 Mar 2025 01:07:12 +0530
Subject: [PATCH v3 1/3] regulator: dt-bindings: add documentation for
 s2mpu05-pmic regulators
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250301-exynos7870-pmic-regulators-v3-1-808d0b47a564@disroot.org>
References: <20250301-exynos7870-pmic-regulators-v3-0-808d0b47a564@disroot.org>
In-Reply-To: <20250301-exynos7870-pmic-regulators-v3-0-808d0b47a564@disroot.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Lee Jones <lee@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, Kaustabh Chakraborty <kauschluss@disroot.org>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1740771440; l=2031;
 i=kauschluss@disroot.org; s=20250202; h=from:subject:message-id;
 bh=XBuRc/28NV7MDuqpbtBLiVU588EctEg7PkPnSEz6vSQ=;
 b=rezWnl3i93Jx27+E6gRrR+in2y1fL5cHEWvJOXDxEveMhUJdLPfXiVujBlTRQsJzu6WDvv9PT
 uWNYEoA3DccAAOmhGKAE2lmS+1w80yPzj9dehYMaAPaYk77kFGHS7p4
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
index 0000000000000000000000000000000000000000..378518a5a7f59822e549cabf4d4b430ec836a68f
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
+  "^ldo([1-9]|10|2[5-9]|3[0-5])$":
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
+  "^buck[1-5]$":
+    type: object
+    $ref: regulator.yaml#
+    unevaluatedProperties: false
+    description:
+      Properties for single buck regulator.
+
+    required:
+      - regulator-name
+
+additionalProperties: false

-- 
2.48.1

