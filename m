Received: from mout-y-209.mailbox.org (mout-y-209.mailbox.org [91.198.250.237])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C3C654281A;
	Tue, 22 Sep 2026 12:38:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.198.250.237
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790080712; cv=none; b=JwQFi2cfWZYqcyc2zZqrvYzSf8HqDRMXHOjBsZtvUja0XroPhcqcSO4SZ0JmUymyHmE5ab7Lh58Y9qkKj2J9iGbP4BJISA+bULfOVjNuZ5/LVaVoNSw/3ym924Pyy94u9jnklIaL4PJsvVtqOIEs/osy+eVsC3HbpSSJM/A4L5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790080712; c=relaxed/simple;
	bh=FIDOhx16bKTnLhDsEzKck56HBIFnn9qu9WN0aTyG/g8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=Xajn0acjxdHbxlvQWyU0edJIlgeWELzQZdQsEf5ovsC86W7hkYksGR6PNedNZARhj6wVzPgJxR+Y7mkCFRv1mjdvMpFS/+bvtG7AoGov8nFypUccXeHf/5kIDTni0cGdO3DfEXbqiEqHLvCEDKnlUuG1jqwM3vrfMUH+DsmHPmM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chimac.ro; spf=pass smtp.mailfrom=chimac.ro; dkim=pass (2048-bit key) header.d=chimac.ro header.i=@chimac.ro header.b=1sXIa/iN; arc=none smtp.client-ip=91.198.250.237
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chimac.ro
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chimac.ro
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=chimac.ro header.i=@chimac.ro header.b="1sXIa/iN"
Received: from smtp1.mailbox.org (smtp1.mailbox.org [10.196.197.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-y-209.mailbox.org (Postfix) with ESMTPS id 4hpzbB66Vhz7t7d;
	Tue, 22 Sep 2026 14:16:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chimac.ro; s=MBO0001;
	t=1790079366;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=TWtGuJsSnA6q09a1WdY7USh/zxzDAqnc0W6q2GxteG0=;
	b=1sXIa/iNpsllNyxwkMqBMBw2hr9u8Pp3ChUwD3OE9mw+HbBoo3L2xitGuyqF9Jo65+Dhn3
	QggpkO9IzXmQ1pzDuxM2GLL4KrkbBD+goQeKf6fwuJPIo0AaWWQmBAYpkRaEHsmz3FcwJ+
	OKl8GjYCIwSavNikyt2wJXW1b4G682ig23SP7dBGTeR5+XxWHD5Acugr7VGXRiAwf1Qzkb
	hxX16r89t70Aalzrx+eaj3Jg14ElzUlwjIyZJ5O5Irs2CTXNjpb/KSnq/3fo1VjbJCmDCp
	gC0tJXUp6TEnqvmB7R9Ewxw7n73pt5kITWY66EHd7qVHzJW+vO0CRXobfEbz9g==
From: Alexandru Chimac <alex@chimac.ro>
Date: Tue, 22 Sep 2026 15:15:13 +0300
Subject: [PATCH] dt-bindings: pinctrl: samsung: Require clocks for
 Exynos9610 pinctrl nodes
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260922-exynos9610-pinctrl-patch-v1-1-f6d816696591@chimac.ro>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/y2NQQ6CMBBFr0Jm7Zi2JCBcxbAowyhjpGBbCIZwd
 6u4fMn7728Q2AsHqLMNPC8SZHQJ9CkD6q27M0qXGIwyhaqMQV7fbgxVoRVO4ij6J042Uo+siEq
 tLx1VJaT55Pkm6y99bQ4Oc/tgit/e3/D8mtNnPDRobWCkcRgk1tlSnnP0lEOz7x87AquXqAAAA
 A==
X-Change-ID: 20260922-exynos9610-pinctrl-patch-e0cc7118dc97
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Linus Walleij <linusw@kernel.org>, 
 Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Tomasz Figa <tomasz.figa@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Alexandru Chimac <alex@chimac.ro>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790079314; l=1196;
 i=alex@chimac.ro; s=20250914; h=from:subject:message-id;
 bh=FIDOhx16bKTnLhDsEzKck56HBIFnn9qu9WN0aTyG/g8=;
 b=+yXOurx997N4Jd5a4koBFSR5j4JT4+C0xfTJcebVE2TZYaDznrzmZicOMCcbKqIsfB1XCg+pz
 RY2i4KOLPrjAG53adnbI3g+b4UEwVuKXxMijPYG3jywtUZUGWWboAGs
X-Developer-Key: i=alex@chimac.ro; a=ed25519;
 pk=OKD+X09b7uEsyw05zyuqq14SLGg8B/X4xey5tJeYCig=

All Exynos9610 pin controllers (except PINCTRL_TOP) have clocks assigned
to them, so force the nodes to have clocks assigned to them.

Signed-off-by: Alexandru Chimac <alex@chimac.ro>
---
Most Samsung Exynos9610 pin controllers (except TOP) have clocks
designated for them, so allow the device tree node to include clock
information for the driver.
---
 Documentation/devicetree/bindings/pinctrl/samsung,pinctrl.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl.yaml
index 1feb6a6fc690..e4fdedb29631 100644
--- a/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl.yaml
@@ -140,6 +140,7 @@ allOf:
             enum:
               - google,gs101-pinctrl
               - samsung,exynos8890-pinctrl
+              - samsung,exynos9610-pinctrl
     then:
       required:
         - clocks

---
base-commit: c2cd463d6ee7d55a3ec0719d93c49ff99022d58f
change-id: 20260922-exynos9610-pinctrl-patch-e0cc7118dc97

Best regards,
--  
Alexandru Chimac <alex@chimac.ro>

