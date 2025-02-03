Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3478420F084;
	Mon,  3 Feb 2025 20:36:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738615018; cv=none; b=oZvyAxaQslz2ZFqBY8oBc8/saWXvCcrZKojrHeHT94tFkbiSHfz8VgJ/sGbgDfJphCXkXIjBlQZz5RhEMhfpye0FdiA1Jt+14AIiH04nz7jT5ByLryW6sJlrf23WnpHTa7V8NbiUCKwMYOO44N4J7pQCoYoD5utE6Miuo1jf9N4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738615018; c=relaxed/simple;
	bh=gz98uAfdr3805pYNESqjQS9T33UHVE+dATNQRwzuYXE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jY1YlT6TgDJS225eaAnWz9Xjxnw04wQ/ScR7E3eMtzKwk44iUaQ/XybsOqdYjKYtNKC7dS67PRXN8QljFNPoEaRgylopA/iTYVD1D0cBnDYNySum03PW2ua4w626YPBIhh1blFTqn8PKTEMZd6+74PHyBYHU8UqCEjggReYSdx0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=eyiyXQJO; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="eyiyXQJO"
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 9984C252CB;
	Mon,  3 Feb 2025 21:36:55 +0100 (CET)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cOlIepTjkORk; Mon,  3 Feb 2025 21:36:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1738615011; bh=gz98uAfdr3805pYNESqjQS9T33UHVE+dATNQRwzuYXE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=eyiyXQJOoEYGFeb1sp0h6mk4bCT4w6gdAJch10+7OZ6GI8k7BwquVigtFn6IRHGdw
	 o0Y1qiQnDbepy0TwQJ3j0dTnyviQRkFgfJm8ajXKtgD4rEotacwofsr5I3gzbWWG6Q
	 QeNDm4nrml91cgiEuJ1csDCM33JCYxwpRGo8cyiCkG7Nmm/bgYoG5xQlzqjdneVWQk
	 F4EWoGyLiLVfQxfFLWindl0/lhHCW0VavSUOCNDDPrifmFOwbjD7Uww3UdIe7QPoUw
	 2kW4zPj0SnvsYfwgpTdWNChfyVhrv8eTfHeiAW7mRCiu0gR60Y8IOZHcjKO5gGPvU0
	 P8X0arcI3Ljbg==
From: Kaustabh Chakraborty <kauschluss@disroot.org>
Date: Tue, 04 Feb 2025 02:06:26 +0530
Subject: [PATCH 1/4] regulator: dt-bindings: add documentation for
 s2mpu05-pmic regulators
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250204-exynos7870-pmic-regulators-v1-1-05adad38102c@disroot.org>
References: <20250204-exynos7870-pmic-regulators-v1-0-05adad38102c@disroot.org>
In-Reply-To: <20250204-exynos7870-pmic-regulators-v1-0-05adad38102c@disroot.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Conor Dooley <conor@kernel.org>, 
 Lee Jones <lee@kernel.org>
Cc: Sergey Lisov <sleirsgoevy@gmail.com>, linux-kernel@vger.kernel.org, 
 linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, 
 Kaustabh Chakraborty <kauschluss@disroot.org>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1738614996; l=1895;
 i=kauschluss@disroot.org; s=20250202; h=from:subject:message-id;
 bh=gz98uAfdr3805pYNESqjQS9T33UHVE+dATNQRwzuYXE=;
 b=7WlHaU+ydo9olVTDduycsFiK9kZwkxTKpGEjVPAOIkqt1mLS3drbCikIPNG3EHqTFY+2ffPJs
 lFCz2mmH0XmDrvqT5t735eP0nPI6V+5JYh0tHlurCsQ1lxLwUW7GcDy
X-Developer-Key: i=kauschluss@disroot.org; a=ed25519;
 pk=h2xeR+V2I1+GrfDPAhZa3M+NWA0Cnbdkkq1bH3ct1hE=

S2MPU05 is a PMIC found in Exynos7870 devices, which controls voltage
regulators (21 LDOs and 5 BUCKs). Provide documentation for devicetree
definitions, regulator naming patterns, etc.

Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
---
 .../bindings/regulator/samsung,s2mpu05.yaml        | 44 ++++++++++++++++++++++
 1 file changed, 44 insertions(+)

diff --git a/Documentation/devicetree/bindings/regulator/samsung,s2mpu05.yaml b/Documentation/devicetree/bindings/regulator/samsung,s2mpu05.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..0a968fe79d44dbcb6720a7d1da698f9460e25521
--- /dev/null
+++ b/Documentation/devicetree/bindings/regulator/samsung,s2mpu05.yaml
@@ -0,0 +1,44 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/regulator/samsung,s2mpu05.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Samsung S2MPU05 Power Management IC regulators
+
+maintainers:
+  - Krzysztof Kozlowski <krzk@kernel.org>
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
+  "^LDO([1-9]|10|2[0-9]|3[0-5])$":
+    type: object
+    $ref: regulator.yaml#
+    unevaluatedProperties: false
+    description:
+      Properties for single LDO regulator.
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

